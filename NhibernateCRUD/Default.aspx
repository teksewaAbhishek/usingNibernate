<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NhibernateCRUD._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Employee List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/telerik-kendo-theme@latest/dist/all.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@latest/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@progress/kendo-ui@latest/js/kendo.all.min.js"></script>
</head>

<body>

    <form id="form1" runat="server">

        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />

        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" OnNeedDataSource="RadGrid1_NeedDataSource"
            OnInsertCommand="RadGrid1_InsertCommand" OnUpdateCommand="RadGrid1_UpdateCommand" OnDeleteCommand="RadGrid1_DeleteCommand">
            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id" CommandItemDisplay="Top" EditMode="InPlace">

                <RowIndicatorColumn ShowNoSortIcon="False" Visible="False"></RowIndicatorColumn>

                <ExpandCollapseColumn ShowNoSortIcon="False" Created="True"></ExpandCollapseColumn>

                <Columns>
                    <telerik:GridBoundColumn DataField="FirstName" HeaderText="First Name" UniqueName="FirstName" />
                    <telerik:GridBoundColumn DataField="LastName" HeaderText="Last Name" UniqueName="LastName" />
                    <telerik:GridBoundColumn DataField="Designation" HeaderText="Designation" UniqueName="Designation" />
                    <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn" />
                    <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" UniqueName="DeleteColumn" />
                </Columns>



                <%--<Columns>
                    <telerik:GridTemplateColumn>
                        <ItemTemplate>
                            <%# Eval("FirstName") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn>
                        <ItemTemplate>
                            <%# Eval("LastName") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn>
                        <ItemTemplate>
                            <%# Eval("Designation") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>--%>



                <EditFormSettings>
                    <EditColumn ShowNoSortIcon="False" UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
                </EditFormSettings>



            </MasterTableView>
        </telerik:RadGrid>

    </form>

</body>

</html>




<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NhibernateCRUD._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/telerik-kendo-theme@latest/dist/all.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@latest/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@progress/kendo-ui@latest/js/kendo.all.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 43%;
        }
        .auto-style2 {
            width: 103px;
        }
        .auto-style3 {
            width: 232px;
        }
        .auto-style4 {
            width: 103px;
            height: 26px;
        }
        .auto-style5 {
            width: 232px;
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
            <br />
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">------------</td>
                    <td class="auto-style5">--------------</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="OkId" runat="server" Text="Id"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TextBox1" runat="server" Width="334px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="OkFName" runat="server" Text="FirstName"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox2" runat="server" Width="334px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="OkLName" runat="server" Text="LastName"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox3" runat="server" Width="334px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="OkDesign" runat="server" Text="Designation"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox4" runat="server" Width="334px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AutoGenerateDeleteColumn="True" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource1">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

<MasterTableView AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
<RowIndicatorColumn ShowNoSortIcon="False"></RowIndicatorColumn>

<ExpandCollapseColumn ShowNoSortIcon="False"></ExpandCollapseColumn>

    <Columns>
        <telerik:GridBoundColumn DataField="Id" DataType="System.Int32" FilterControlAltText="Filter Id column" HeaderText="Id" ReadOnly="True" ShowNoSortIcon="False" SortExpression="Id" UniqueName="Id">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="FirstName" FilterControlAltText="Filter FirstName column" HeaderText="FirstName" ShowNoSortIcon="False" SortExpression="FirstName" UniqueName="FirstName">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="LastName" FilterControlAltText="Filter LastName column" HeaderText="LastName" ShowNoSortIcon="False" SortExpression="LastName" UniqueName="LastName">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Designation" FilterControlAltText="Filter Designation column" HeaderText="Designation" ShowNoSortIcon="False" SortExpression="Designation" UniqueName="Designation">
        </telerik:GridBoundColumn>
    </Columns>

<EditFormSettings>
<EditColumn ShowNoSortIcon="False"></EditColumn>
</EditFormSettings>
</MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NhibernateDataConnectionString %>" SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>
    </form>
</body>
</html>--%>
