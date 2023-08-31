<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StdDetails.aspx.cs" Inherits="MyWebsite.LogAdmin.StdDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="stdid" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="stdid" HeaderText="stdid" ReadOnly="True" SortExpression="stdid" />
                <asp:BoundField DataField="stdname" HeaderText="stdname" SortExpression="stdname" />
                <asp:BoundField DataField="stddob" HeaderText="stddob" SortExpression="stddob" />
                <asp:BoundField DataField="stdaddress" HeaderText="stdaddress" SortExpression="stdaddress" />
                <asp:BoundField DataField="stdmob" HeaderText="stdmob" SortExpression="stdmob" />
                <asp:BoundField DataField="stdcourse" HeaderText="stdcourse" SortExpression="stdcourse" />
                <asp:BoundField DataField="stdemail" HeaderText="stdemail" SortExpression="stdemail" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyHexaConnectionString %>" DeleteCommand="DELETE FROM [student] WHERE [stdid] = @stdid" InsertCommand="INSERT INTO [student] ([stdid], [stdname], [stddob], [stdaddress], [stdmob], [stdcourse], [stdemail]) VALUES (@stdid, @stdname, @stddob, @stdaddress, @stdmob, @stdcourse, @stdemail)" SelectCommand="SELECT * FROM [student]" UpdateCommand="UPDATE [student] SET [stdname] = @stdname, [stddob] = @stddob, [stdaddress] = @stdaddress, [stdmob] = @stdmob, [stdcourse] = @stdcourse, [stdemail] = @stdemail WHERE [stdid] = @stdid">
            <DeleteParameters>
                <asp:Parameter Name="stdid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="stdid" Type="Int32" />
                <asp:Parameter Name="stdname" Type="String" />
                <asp:Parameter DbType="Date" Name="stddob" />
                <asp:Parameter Name="stdaddress" Type="String" />
                <asp:Parameter Name="stdmob" Type="String" />
                <asp:Parameter Name="stdcourse" Type="String" />
                <asp:Parameter Name="stdemail" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="stdname" Type="String" />
                <asp:Parameter DbType="Date" Name="stddob" />
                <asp:Parameter Name="stdaddress" Type="String" />
                <asp:Parameter Name="stdmob" Type="String" />
                <asp:Parameter Name="stdcourse" Type="String" />
                <asp:Parameter Name="stdemail" Type="String" />
                <asp:Parameter Name="stdid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">BACK</asp:LinkButton>
    </form>
</body>
</html>
