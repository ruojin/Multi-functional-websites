<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vote Page</title>
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
            text-align:center;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div class="maindiv" style="height:380px">
        <h1 class="center">Vote Page</h1>
        <p class="center">Please choose only one candidate to vote.</p>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Candidates" DataValueField="Id" style="margin:auto">
        </asp:RadioButtonList>
        <br />
        <div class="seconddiv" style="height:100px">
            <asp:Button ID="Button1" runat="server" onclick="vote_click" Text="Button" />
            <br /><br />
            <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Votesdata]" UpdateCommand="UPDATE Votesdata SET Votes = Votes + 1 WHERE (Id = @id)">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="RadioButtonList1" Name="id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            

        </div>
    
    </div>
    </form>
</body>
</html>
