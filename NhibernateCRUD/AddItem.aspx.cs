using NhibernateCRUD.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NhibernateCRUD
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string designation = txtDesignation.Text;

            using (var session = ConnectionNhibernate.OpenSession())
            {
                var newEmployee = new Employee
                {
                    FirstName = firstName,
                    LastName = lastName,
                    Designation = designation
                };

                using (var transaction = session.BeginTransaction())
                {
                    session.Save(newEmployee);
                    transaction.Commit();
                }
            }

           
            Response.Redirect("Default.aspx");
        }


    }
}