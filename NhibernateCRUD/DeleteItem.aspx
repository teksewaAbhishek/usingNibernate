<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteItem.aspx.cs" Inherits="NhibernateCRUD.DeleteItem" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delete Item</title>
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
            
            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
        </div>
    </form>
</body>
</html>
