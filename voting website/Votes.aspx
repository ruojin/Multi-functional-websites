<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Votes.aspx.cs" Inherits="Votes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Voting Result</title>
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
        .tableStyle{
           border-collapse:collapse;
           text-align:center;
           margin-left:auto;
           margin-right:auto;     
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="maindiv" style="height:380px">
        <h1 class="center">Thank you for voting</h1>
        <div class="seconddiv" style="height:250px">
            <p>The results are below: </p>
            <asp:Table ID="Table1" runat="server" CssClass="tableStyle"></asp:Table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Votesdata]"></asp:SqlDataSource>

            

        </div>

    
    </div>
    </form>
</body>
</html>
