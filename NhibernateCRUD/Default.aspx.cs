using NhibernateCRUD.Models;
using System;
using System.Linq;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Telerik.Web.UI.Skins;

namespace NhibernateCRUD
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RadGrid1.Rebind();
            }
        }

        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            RadGrid1.DataSource = GetEmployees();
        }

        protected void RadGrid1_InsertCommand(object sender, GridCommandEventArgs e)
        {
            EmployeeManager.InsertEmployee(e.Item as GridEditableItem);
            RadGrid1.Rebind();
        }

        protected void RadGrid1_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            EmployeeManager.UpdateEmployee(e.Item as GridEditableItem);
            RadGrid1.Rebind();
        }

        protected void RadGrid1_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            EmployeeManager.DeleteEmployee(e);
            RadGrid1.Rebind();
        }

        private object GetEmployees()
        {
            using (var session = ConnectionNhibernate.OpenSession())
            {
                var employees = session.Query<Employee>().ToList();
                return employees;
            }
        }
    }
}




//using NHibernate;
//using NHibernate.Mapping;
//using NhibernateCRUD.Models;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web.Script.Services;
//using System.Web.Services;
//using System.Web.UI;
//using Telerik.Web.UI.Chat;

//namespace NhibernateCRUD
//{
//    public partial class _Default : Page
//    {
//        //        protected void Page_Load(object sender, EventArgs e)
//        //        {
//        //        }

//        //        public static object GetData()
//        //        {
//        //            List<Employee> list = new List<Employee>();
//        //            ISession session = ConnectionNhibernate.OpenSession();
//        //            list = session.Query<Employee>().ToList();
//        //            return new DTO()
//        //            {
//        //                Result = list,
//        //                Count = list.Count
//        //            };



//        //}


//        //        [WebMethod]

//        //        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

//        //        public static object PerformInsert(string action, EmployeeMap value)
//        //        {



//        //            ISession session = AppSession.OpenSession();



//        //            ITransaction transaction = session.BeginTransaction();



//        //            session.Save(value);

//        //            transaction.Commit();



//        //            list = session.Query<EmployeeMap>().ToList();



//        //            return new DTO() { Result = list, Count = list.Count }




//        //           }



//        //        [WebMethod]

//        //        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

//        //        public static object PerformUpdate(int key, EmployeeMap value)
//        //        {



//        //            ISession session = AppSession.OpenSession();



//        //            var employeeToUpdate = session.Get<EmployeeMap>(key);



//        //            employeeToUpdate.Designation = value.Designation;

//        //            employeeToUpdate.FirstName = value.FirstName;

//        //            employeeToUpdate.LastName = value.LastName;



//        //            ITransaction transaction = session.BeginTransaction();

//        //            session.Save(employeeToUpdate);

//        //            transaction.Commit();



//        //            list = session.Query<EmployeeMap>().ToList();



//        //            return new DTO() { Result = list, Count = list.Count }





//        //           }



//        //        [WebMethod]

//        //        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

//        //        public static object PerformDelete(int key, EmployeeMap value)
//        //        {



//        //            ISession session = AppSession.OpenSession();

//        //            ITransaction transaction = session.BeginTransaction();

//        //            session.Delete(session.Get<EmployeeMap>(key));

//        //            transaction.Commit();



//        //            list = session.Query<EmployeeMap>().ToList();



//        //            return new DTO() { Result = list, Count = list.Count }





//        //            }



//        //        public class DTO
//        //        {
//        //            public List<Employee> Result { get; set; }
//        //            public int Count { get; set; }
//        //        }
//        //    }
//        //}



//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                List<Employee> employees = GetEmployees();

//                RadGrid1.DataSource = employees;
//                RadGrid1.DataBind();
//            }
//        }

//        private List<Employee> GetEmployees()
//        {
//            List<Employee> employees = new List<Employee>
//                {
//                    new Employee { Id = 1, FirstName = "John", LastName = "Doe", Designation = "Manager" },
//                    new Employee { Id = 2, FirstName = "Jane", LastName = "Smith", Designation = "Developer" },
//                    new Employee { Id = 3, FirstName = "Mike", LastName = "Johnson", Designation = "Designer" }
//                };

//            return employees;
//        }

//        protected void RadButton1_Click(object sender, EventArgs e)
//        {
//            try
//            {
//                using (ISession session = ConnectionNhibernate.OpenSession())
//                {
//                    using (ITransaction transaction = session.BeginTransaction())
//                    {
//                        session.Save(sender);
//                        transaction.Commit();
//                    }
//                }
//            }
//            catch (Exception ex)
//            {
//                _ = ex.InnerException.Message;
//            }
//        }

//        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
//        {

//        }

//        protected void Button1_Click(object sender, EventArgs e)
//        {

//        }
//    }
//}





