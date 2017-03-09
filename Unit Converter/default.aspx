<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>conversion</title>
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
        <h1 class="center">Unit Converter</h1>        </br>        <div class="seconddiv">            From: <asp:DropDownList id="dd1" runat="server" />&nbsp;            <asp:TextBox ID="tb1" runat="server">0</asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;            To:<asp:DropDownList id="dd2" runat="server" />            <asp:Textbox ID="tb2" runat="server">0</asp:Textbox>            <asp:Button onclick="convert_click" runat="server" Text="Convert" />            <br/><br />            <asp:Label ID="label" runat="server" />        </div>

    </div>
    </form>
</body>
</html>
