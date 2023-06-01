using FluentNHibernate.Mapping;

namespace NhibernateCRUD.Models
{
    public class EmployeeMap : ClassMap<Employee>
    {
        public EmployeeMap()
        {
            Id(x => x.Id);
            //Id(x => x.Id).GeneratedBy.Identity();
            Map(x => x.FirstName);
            Map(x => x.LastName);
            Map(x => x.Designation);
            Table("Employee");
        }
    }
}