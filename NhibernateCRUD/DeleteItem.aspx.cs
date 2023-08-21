using FluentNHibernate.Conventions.Inspections;
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
    public partial class DeleteItem : System.Web.UI.Page
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
                            btnDelete_Click(sender, e);

                        }
                        else
                        {
                            btnDelete.Enabled = false;
                        }
                    }
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id = int.Parse(hdnId.Value);

            using (var session = ConnectionNhibernate.OpenSession())
            {
                var employee = session.Get<Employee>(id);
                if (employee != null)
                {
                    using (var transaction = session.BeginTransaction())
                    {
                        session.Delete(employee);
                        transaction.Commit();
                    }
                }
            }

            Response.Redirect("Default.aspx");
        }
    }
}
