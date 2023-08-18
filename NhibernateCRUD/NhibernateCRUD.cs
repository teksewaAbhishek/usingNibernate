using NhibernateCRUD.Models;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace NhibernateCRUD
{
    public class EmployeeManager
    {
        public static void InsertEmployee(GridEditableItem item)
        {
            var employee = new Employee
            {
                FirstName = (item["FirstName"].Controls[0] as TextBox).Text,
                LastName = (item["LastName"].Controls[0] as TextBox).Text,
                Designation = (item["Designation"].Controls[0] as TextBox).Text,
            };

            using (var session = ConnectionNhibernate.OpenSession())
            {
                using (var transaction = session.BeginTransaction())
                {
                    session.Save(employee);
                    transaction.Commit();
                }
            }
        }

        public static void UpdateEmployee(GridEditableItem item)
        {
            var employeeId = (int)item.GetDataKeyValue("Id");

            using (var session = ConnectionNhibernate.OpenSession())
            {
                using (var transaction = session.BeginTransaction())
                {
                    var employee = session.Get<Employee>(employeeId);
                    if (employee != null)
                    {
                        employee.FirstName = (item["FirstName"].Controls[0] as TextBox).Text;
                        employee.LastName = (item["LastName"].Controls[0] as TextBox).Text;
                        employee.Designation = (item["Designation"].Controls[0] as TextBox).Text;

                        session.Update(employee);
                        transaction.Commit();
                    }
                }
            }
        }

        public static void DeleteEmployee(GridCommandEventArgs e)
        {
            var employeeId = (int)e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["Id"];

            using (var session = ConnectionNhibernate.OpenSession())
            {
                using (var transaction = session.BeginTransaction())
                {
                    var employee = session.Get<Employee>(employeeId);
                    if (employee != null)
                    {
                        session.Delete(employee);
                        transaction.Commit();
                    }
                }
            }
        }
    }
}