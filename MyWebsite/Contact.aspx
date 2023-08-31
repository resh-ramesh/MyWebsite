<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="MyWebsite.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title">Student Page</h2>
    <p><b>Name</b><asp:TextBox ID="TextName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextName" ErrorMessage="Username Required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
    </p>
    <p id="hlStudent"><b>Address</b><asp:TextBox ID="TextAddr" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextAddr" ErrorMessage="AddressRequired" ForeColor="#FF3300" SetFocusOnError="True">*</asp:RequiredFieldValidator>
    </p>
    <p><b>PhoneNumber</b><asp:TextBox ID="TextPh" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextPh" ErrorMessage="Invalid contact" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
    </p>
    <p><b>Email</b><asp:TextBox ID="TextMail" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextMail" ErrorMessage="Invalid Email" ForeColor="#FF3300" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
    </p>
    <p><b>Select Course</b></p>
    <p>&nbsp;</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyHexaConnectionString %>" ProviderName="<%$ ConnectionStrings:MyHexaConnectionString.ProviderName %>" SelectCommand="SELECT [lid], [lname] FROM [levels]"></asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="lname" DataValueField="lid">
            <asp:ListItem Value="0">Select</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="coursename" DataValueField="courseid">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyHexaConnectionString %>" SelectCommand="SELECT [courseid], [coursename], [CLevel] FROM [courses] WHERE ([CLevel] = @CLevel)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="CLevel" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="submit" runat="server" Text="Submit" OnClick="Button1_Click" />
    </p>
    </main>
</asp:Content>
