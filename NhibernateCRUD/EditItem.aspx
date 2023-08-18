<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditItem.aspx.cs" Inherits="NhibernateCRUD.EditItem" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Item</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hdnId" runat="server" />
            <label for="txtFirstName">First Name:</label>
            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox><br />
            
            <label for="txtLastName">Last Name:</label>
            <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox><br />
            
            <label for="txtDesignation">Designation:</label>
            <asp:TextBox ID="txtDesignation" runat="server"></asp:TextBox><br />
            
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
        </div>
    </form>
</body>
</html>
