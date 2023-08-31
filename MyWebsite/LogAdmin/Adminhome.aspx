<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminhome.aspx.cs" Inherits="MyWebsite.LogAdmin.Adminhome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    
      <center>
    <form id="form1" runat="server">
       <p>
           <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" BackColor="#006600" BorderColor="#FFFF66" BorderWidth="2px" ForeColor="#FFFF66" Height="50px" Width="200px">CourseDetails</asp:LinkButton>
       </p>
       <p>
           <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" BackColor="#006600" BorderColor="#FFFF66" BorderWidth="2px" ForeColor="#FFFF66" Height="50px" Width="200px">StudentDetails</asp:LinkButton>
       </p>
      
           
    
      <p>
          <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">LogOut</asp:LinkButton>
      </p>
        </form>
          </center>
           &nbsp;
    
</body>
</html>
