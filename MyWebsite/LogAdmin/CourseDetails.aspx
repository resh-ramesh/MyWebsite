<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseDetails.aspx.cs" Inherits="MyWebsite.LogAdmin.CourseDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
    .form-submit-button {
        background: #5cb85c;
        color: white;
        border-style: outset;
        border-color: #0066A2;
        height: 50px;
        width: 150px;
        font: bold15px arial,sans-serif;
        text-shadow: none;
    }

        .form-submit-button:hover {
            background: #5cb85c;
            color: #fff;
            border: 1px solid #eee;
            border-radius: 20px;
            box-shadow: 5px 5px 5px #eee;
            text-shadow: none;
        }
</style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropLevel" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="lname" DataValueField="lid">
                <asp:ListItem Value="0">select</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyHexaConnectionString %>" SelectCommand="SELECT * FROM [levels]"></asp:SqlDataSource>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="courseid" DataSourceID="SqlDataSource1" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="courseid" HeaderText="courseid" InsertVisible="False" ReadOnly="True" SortExpression="courseid" />
                <asp:BoundField DataField="coursename" HeaderText="coursename" SortExpression="coursename" />
                <asp:BoundField DataField="coursefee" HeaderText="coursefee" SortExpression="coursefee" />
                <asp:BoundField DataField="courseduration" HeaderText="courseduration" SortExpression="courseduration" />
                <asp:TemplateField HeaderText="CLevel" SortExpression="CLevel">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="lname" DataValueField="lid" SelectedValue='<%# Bind("CLevel") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CLevel") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyHexaConnectionString %>" DeleteCommand="DELETE FROM [courses] WHERE [courseid] = @courseid" InsertCommand="INSERT INTO [courses] ([coursename], [coursefee], [courseduration], [CLevel]) VALUES (@coursename, @coursefee, @courseduration, @CLevel)" SelectCommand="SELECT * FROM [courses] WHERE ([CLevel] = @CLevel)" UpdateCommand="UPDATE [courses] SET [coursename] = @coursename, [coursefee] = @coursefee, [courseduration] = @courseduration, [CLevel] = @CLevel WHERE [courseid] = @courseid">
            <DeleteParameters>
                <asp:Parameter Name="courseid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="coursename" Type="String" />
                <asp:Parameter Name="coursefee" Type="Int32" />
                <asp:Parameter Name="courseduration" Type="Int32" />
                <asp:Parameter Name="CLevel" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropLevel" Name="CLevel" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="coursename" Type="String" />
                <asp:Parameter Name="coursefee" Type="Int32" />
                <asp:Parameter Name="courseduration" Type="Int32" />
                <asp:Parameter Name="CLevel" Type="Int32" />
                <asp:Parameter Name="courseid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        CourseId<asp:TextBox ID="TextBox4" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
        CourseName<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        CourseFee<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
        CourseDuration<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" Height="50px" Width="100px" class="form-submit-button" OnClick="LinkButton1_Click">ADD</asp:LinkButton>
        <asp:LinkButton ID="LinkButton2" runat="server" Height="50px" Width="100px" class="form-submit-button" OnClick="LinkButton2_Click">EDIT</asp:LinkButton>
        <asp:LinkButton ID="LinkButton3" runat="server" Height="50px" Width="100px" class="form-submit-button" OnClick="LinkButton3_Click">DELETE</asp:LinkButton>
        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">BACK</asp:LinkButton>
    </form>
</body>
</html>
