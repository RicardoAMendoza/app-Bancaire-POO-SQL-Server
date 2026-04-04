// Pseudocode / Plan (detailed):
// 1. Create a static class `DataTableExtensions` with an extension method `ToList<T>(this DataTable table)`.
// 2. Validate input (null table) and return empty list if no rows.
// 3. Use reflection to get public writable properties of T.
// 4. Map DataTable columns to properties by name (case-insensitive) for faster lookup.
// 5. For each DataRow:
//    a. Create a new instance of T using the parameterless constructor.
//    b. For each property that has a matching DataColumn:
//       i. Read value from DataRow.
//       ii. If value is DBNull, skip or set default for value types / nullable property accordingly.
//       iii. Convert the value to the target property type:
//            - Handle nullable types (get underlying type).
//            - Handle enums (Enum.Parse or convert numeric).
//            - Handle Guid specially (Guid.Parse or new Guid from byte[]).
//            - Use Convert.ChangeType for common conversions (string->int, etc).
//            - If types are already assignable, assign directly.
//       iv. Set the property value via reflection.
//    c. Add the populated instance to the result list.
// 6. Return List<T>.
// 7. Provide a small XML-comment usage example at the bottom as guidance.
//
// Notes on behavior:
// - Matching between column and property is case-insensitive.
// - If a property has no matching column, it is left with its default value.
// - DBNull values are treated as null for reference / nullable types; for non-nullable value types the default(TProperty) is kept.
//
// Implementation below follows the plan and is compatible with C# 7.3 and .NET Framework 4.7.2.

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;

namespace _3.Control.Extensions
{
    /// <summary>
    /// Extension methods to convert DataTable to strongly-typed lists.
    /// </summary>
    public static class DataTableExtensions
    {
        /// <summary>
        /// Converts a DataTable into a List of T by mapping column names to property names (case-insensitive).
        /// T must have a parameterless constructor.
        /// </summary>
        public static List<T> ToList<T>(this DataTable table) where T : new()
        {
            var results = new List<T>();
            if (table == null || table.Rows.Count == 0)
                return results;

            // Get writable public instance properties of T
            var properties = typeof(T)
                .GetProperties(BindingFlags.Public | BindingFlags.Instance)
                .Where(p => p.CanWrite)
                .ToArray();

            // Map column names to DataColumn for fast lookup (case-insensitive)
            var columnLookup = table.Columns
                .Cast<DataColumn>()
                .ToDictionary(c => c.ColumnName, c => c, StringComparer.OrdinalIgnoreCase);

            foreach (DataRow row in table.Rows)
            {
                var item = new T();

                foreach (var prop in properties)
                {
                    DataColumn column;
                    if (!columnLookup.TryGetValue(prop.Name, out column))
                        continue; // no matching column

                    var rawValue = row[column];
                    if (rawValue == DBNull.Value)
                    {
                        // If property is value type but nullable, set null; otherwise leave default
                        if (IsNullable(prop.PropertyType))
                        {
                            prop.SetValue(item, null);
                        }
                        else
                        {
                            // non-nullable value type: leave default(TProperty) (no assignment)
                        }
                        continue;
                    }

                    var targetType = Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType;
                    var valueToSet = ChangeType(rawValue, targetType);
                    prop.SetValue(item, valueToSet);
                }

                results.Add(item);
            }

            return results;
        }

        // Helper: determines if a type is nullable (reference or Nullable<>)
        private static bool IsNullable(Type type)
        {
            if (!type.IsValueType) return true; // reference type
            return Nullable.GetUnderlyingType(type) != null;
        }

        // Helper: convert an object to the target type with special cases for enums and Guid
        private static object ChangeType(object value, Type targetType)
        {
            if (value == null)
                return null;

            var valueType = value.GetType();

            // If already assignable
            if (targetType.IsAssignableFrom(valueType))
                return value;

            // Handle enums
            if (targetType.IsEnum)
            {
                if (value is string s)
                    return Enum.Parse(targetType, s, ignoreCase: true);

                // numeric underlying type
                var underlying = Convert.ChangeType(value, Enum.GetUnderlyingType(targetType));
                return Enum.ToObject(targetType, underlying);
            }

            // Handle Guid
            if (targetType == typeof(Guid))
            {
                if (value is Guid) return value;
                if (value is string s) return new Guid(s);
                if (value is byte[] bytes) return new Guid(bytes);
            }

            // Handle TimeSpan
            if (targetType == typeof(TimeSpan))
            {
                if (value is TimeSpan) return value;
                if (value is string s) return TimeSpan.Parse(s);
            }

            // For other types, use Convert.ChangeType when possible
            try
            {
                return Convert.ChangeType(value, targetType);
            }
            catch
            {
                // Last resort: try to use type converter via ToString -> parse
                try
                {
                    var s = value.ToString();
                    if (targetType == typeof(DateTime))
                        return DateTime.Parse(s);
                }
                catch
                {
                    // swallow and fall through
                }

                // If conversion failed, return the original value if assignable, otherwise default
                return targetType.IsValueType ? Activator.CreateInstance(targetType) : null;
            }
        }
    }

    // Example DTO (for reference)
    /*
    public class Director
    {
        public int Id { get; set; }
        public string DirectorNumber { get; set; }
        public string DirectorName { get; set; }
        public string DirectorLastName { get; set; }
        public string DirectorEmail { get; set; }
        public decimal Salary { get; set; }
    }

    Usage:
    var dt = Model.DirectorList(); // returns DataTable
    List<Director> directors = dt.ToList<Director>();
    */
}