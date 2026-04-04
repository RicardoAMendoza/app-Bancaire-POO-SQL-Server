using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1.Model.Model
{
    /// <summary>
    /// Represents a date with day, month, and year components, and provides methods for creating and displaying dates.
    /// </summary>
    /// <remarks>This class allows the creation of a date using specific day, month, and year values, or
    /// initializes to the current date if no values are provided. It also provides properties to access and modify the
    /// individual components of the date.</remarks>
    public class Date
    {
        /// <summary>
        /// Fields
        /// </summary>
        private int Day;
        private int Month;
        private int Year;
        private DateTime Today;
        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="vDay"></param>
        /// <param name="vMonth"></param>
        /// <param name="vYear"></param>
        public Date(int vDay, int vMonth, int vYear)
        {
            Day = vDay;
            Month = vMonth;
            Year = vYear;
        }
        /// <summary>
        /// Empty Constructor
        /// </summary>
        public Date()
        {
            Today = DateTime.Now;
            Day = Today.Day;
            Month = Today.Month;
            Year = Today.Year;
        }
        /// <summary>
        /// Properties
        /// </summary>
        public int vDay
        {
            get { return Day; }
            set { Day = value; }
        }
        public int vMonth
        {
            get { return Month; }
            set { Month = value; }
        }
        public int vYear
        {
            get { return Year; }
            set { Year = value; }
        }
        /// <summary>
        /// Sets the day, month, and year values for the date.
        /// </summary>
        /// <remarks>Ensure that the combination of <paramref name="vDay"/>, <paramref name="vMonth"/>,
        /// and <paramref name="vYear"/>  represents a valid calendar date. Invalid combinations may result in undefined
        /// behavior.</remarks>
        /// <param name="vDay">The day of the month. Must be a valid day for the specified month and year.</param>
        /// <param name="vMonth">The month of the year, represented as an integer from 1 (January) to 12 (December).</param>
        /// <param name="vYear">The year, represented as a four-digit integer.</param>
        public void CreateDate(int vDay, int vMonth, int vYear)
        {
            Day = vDay;
            Month = vMonth;
            Year = vYear;
        }
        /// <summary>
        /// Returns the date as a string in the format "Day/Month/Year".
        /// </summary>
        /// <returns>A string representing the date in the format "Day/Month/Year".</returns>
        public string ShowDate() => Day + "/" + Month + "/" + Year;

    }
}
