﻿using NHibernate;
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
                FirstName = (item.FindControl("FirstName") as RadTextBox).Text,
                LastName = (item.FindControl("LastName") as RadTextBox).Text,
                Designation = (item.FindControl("Designation") as RadTextBox).Text
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
                    //var employee = session.Get<Employee>(employeeId);
                    //if (employee != null)
                    //{
                    //    employee.FirstName = (item.FindControl("FirstName") as RadTextBox).Text;
                    //    employee.LastName = (item.FindControl("LastName") as RadTextBox).Text;
                    //    employee.Designation = (item.FindControl("Designation") as RadTextBox).Text;

                    //    session.Update(employee);
                    //    transaction.Commit();
                    //}
                    var Id = item.OwnerTableView.DataKeyValues[item.ItemIndex]["Id"];
                    string Name = (item["FirstName"].Controls[0] as TextBox).Text;
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