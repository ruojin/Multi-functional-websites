<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>conversions</title>
    <style type="text/css">
        .center {
            text-align: center;
        }
        .maindiv {
            margin: auto;
            border-style: solid;
            border-width: 1px;
            width: 800px;
            background-color: #C0C0C0;
            padding: 30px;
        }
        .seconddiv{
            margin-left: 50px;
            margin-right:50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="maindiv" style="height:200px">
        <h1 class="center">Unit Converter</h1>
        </br>
            <div class="seconddiv">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Conversions]"></asp:SqlDataSource>
                From: <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Unit" DataValueField="Factor"></asp:DropDownList>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
                To: <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="Unit" DataValueField="Factor"></asp:DropDownList>
                <asp:Textbox ID="TextBox2" runat="server"></asp:Textbox>
                <asp:Button onclick="convert_click" runat="server" Text="Convert" />
                <br/><br />
                <asp:Label ID="Label1" runat="server" />
            </div>
        </div>
    </form>
</body>
</html>
