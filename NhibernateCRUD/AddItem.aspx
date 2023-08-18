<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddItem.aspx.cs" Inherits="NhibernateCRUD.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Item</title>
</head>
<body>
    <form id="form1" runat="server">
    <label for="txtFirstName">First Name:</label>
    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox><br />
    
    <label for="txtLastName">Last Name:</label>
    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox><br />
    
    <label for="txtDesignation">Designation:</label>
    <asp:TextBox ID="txtDesignation" runat="server"></asp:TextBox><br />
    
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
</form>

</body>
</html>

