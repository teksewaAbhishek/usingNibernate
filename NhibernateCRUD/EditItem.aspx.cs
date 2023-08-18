using NHibernate.Cfg.MappingSchema;
using NhibernateCRUD.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NhibernateCRUD
{
    public partial class EditItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string itemId = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(itemId))
                {
                    using (var session = ConnectionNhibernate.OpenSession())
                    {
                        int id = int.Parse(itemId);
                        var employee = session.Get<Employee>(id);
                        if (employee != null)
                        {
                            hdnId.Value = employee.Id.ToString();
                            txtFirstName.Text = employee.FirstName;
                            txtLastName.Text = employee.LastName;
                            txtDesignation.Text = employee.Designation;
                        }
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int id = int.Parse(hdnId.Value);
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string designation = txtDesignation.Text;

            using (var session = ConnectionNhibernate.OpenSession())
            {
                var employee = session.Get<Employee>(id);
                if (employee != null)
                {
                    employee.FirstName = firstName;
                    employee.LastName = lastName;
                    employee.Designation = designation;

                    using (var transaction = session.BeginTransaction())
                    {
                        session.Update(employee);
                        transaction.Commit();
                    }
                }
            }

            // Redirect back to the default page after saving.
            Response.Redirect("Default.aspx");
        }

    }
}