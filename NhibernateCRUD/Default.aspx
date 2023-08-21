<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NhibernateCRUD._Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/telerik-kendo-theme@latest/dist/all.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@latest/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@progress/kendo-ui@latest/js/kendo.all.min.js"></script>

    <style type="text/css">
        div.RadGrid {
            margin-left: auto !important;
            margin-right: auto !important;
        }
    </style>

    <script>
        $(document).ready(function () {
            $("#RadGrid1").on("click", "td", function () {
                // Remove previously added options
                $(".row-options").remove();

                // Get the clicked cell
                var cell = $(this);

                // Create the options HTML
                var optionsHtml = '<div class="row-options">' +
                    '<a href="#" class="edit-button">Edit</a>' +
                    '<a href="#" class="delete-button">Delete</a>' +
                    '</div>';

                // Add the options to the cell
                cell.append(optionsHtml);

                // Attach click event to the edit button
                cell.find(".edit-button").on("click", function (event) {
                    event.preventDefault();
                    // Handle the edit action
                    var id = cell.closest("tr").find("td:eq(0)").text(); // Get the ID from the first cell
                    window.location.href = "EditItem.aspx?id=" + id;
                });

                // Attach click event to the delete button
                cell.find(".delete-button").on("click", function (event) {
                    event.preventDefault();
                    // Handle the delete action
                    var id = cell.closest("tr").find("td:eq(0)").text(); // Get the ID from the first cell
                    window.location.href = "DeleteItem.aspx?id=" + id;
                    
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />

        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True"
            OnNeedDataSource="RadGrid1_NeedDataSource"
            CssClass="auto-style1" Width="1440px" Skin="Bootstrap">

            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id">
                <Columns>
                    <telerik:GridBoundColumn DataField="Id" HeaderText="ID" UniqueName="Id" />
                    <telerik:GridBoundColumn DataField="FirstName" HeaderText="First Name" UniqueName="FirstName" />
                    <telerik:GridBoundColumn DataField="LastName" HeaderText="Last Name" UniqueName="LastName" />
                    <telerik:GridBoundColumn DataField="Designation" HeaderText="Designation" UniqueName="Designation" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>

