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

        .row-options-box {
        display: none;
        position: absolute;
        background-color: purple; 
        color: white; 
        border: 1px solid #ddd;
        padding: 5px;
        box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
    }

    .options-item {
        margin-bottom: 5px;
    }
    </style>




</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />

         <asp:Button ID="btnAddItem" runat="server" Text="Add Item" OnClick="btnAddItem_Click" />
        <br />
        
        <div>
    <label for="txtSearch">Search:</label>
    <input type="text" id="txtSearch" runat="server" />
    <asp:Button runat="server" ID="btnSearch" Text="Search" OnClick="btnSearch_Click" />
</div>


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



<div id="optionsBox" class="row-options-box" style="display: none;">
    <div class="options-item">
        <a href="#" class="edit-button">Edit</a>
    </div>
    <div class="options-item">
        <a href="#" class="delete-button">Delete</a>
    </div>
</div>

<script>
    $(document).ready(function () {
        var currentOptionsBox = null;

        $("#RadGrid1").on("contextmenu", "td", function (event) {
            event.preventDefault();

            var cell = $(this);

            if (currentOptionsBox) {
                currentOptionsBox.remove(); // Remove the previous context menu
            }

            var optionsBox = $("#optionsBox").clone();

            optionsBox.find(".edit-button").on("click", function (event) {
                event.preventDefault();
                var id = cell.closest("tr").find("td:eq(0)").text();
                window.location.href = "EditItem.aspx?id=" + id;
            });

            optionsBox.find(".delete-button").on("click", function (event) {
                event.preventDefault();
                var id = cell.closest("tr").find("td:eq(0)").text();
                window.location.href = "DeleteItem.aspx?id=" + id;
            });

            optionsBox.css({
                top: event.clientY,
                left: event.clientX
            });

            $("body").append(optionsBox);
            optionsBox.show();

            currentOptionsBox = optionsBox;

            // Hide the context menu when clicking anywhere else on the page
            $(document).on("click", function () {
                if (currentOptionsBox) {
                    currentOptionsBox.remove();
                    currentOptionsBox = null;
                }
            });
        });
    });
</script>








    </form>
</body>
</html>

