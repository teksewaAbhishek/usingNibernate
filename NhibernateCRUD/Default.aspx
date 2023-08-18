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
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />

        <asp:Button runat="server" ID="btnAddItem" Text="Add Item" OnClick="btnAddItem_Click" />

        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True"
            OnNeedDataSource="RadGrid1_NeedDataSource"
            OnDeleteCommand="RadGrid1_DeleteCommand" CssClass="auto-style1" Width="1440px" Skin="Bootstrap">
           
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id">
                <Columns>
                    <telerik:GridBoundColumn DataField="FirstName" HeaderText="First Name" UniqueName="FirstName" />
                    <telerik:GridBoundColumn DataField="LastName" HeaderText="Last Name" UniqueName="LastName" />
                    <telerik:GridBoundColumn DataField="Designation" HeaderText="Designation" UniqueName="Designation" />

                    <telerik:GridTemplateColumn HeaderText="Actions">
                        <ItemTemplate>
                            <a href='<%# $"EditItem.aspx?id={Eval("Id")}" %>'>Edit</a>
                            <asp:Button runat="server" ID="DeleteButton" Text="Delete" CommandName="Delete" CommandArgument='<%# Container.ItemIndex %>' />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>





</body>/html>

