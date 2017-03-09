<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Find anagrams</title>
</head>
<body>
    <form id="form1" runat="server">  
    <div style="background-color: #C0C0C0; border-style: solid; border-width: 1px; margin: auto; width: 800px; padding: 10px">
    
        <h1 style="text-align: center">Find Anagrams</h1>

            <br />
            Enter a character string:&nbsp; <asp:TextBox ID="inputList" runat="server" style="width:147px;"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:CheckBox ID="dupd" runat="server" />
            <label for="dupd">Eliminate Duplicates</label>
            <br />
            <br />
            <asp:ListBox ID="outputList" runat="server" style="height:85px;width:150px;"></asp:ListBox>
            <br />
            <br />
            <asp:Button ID="find" runat="server" Text="Find Anagrams" OnClick="find_Click" />
            <br />
            <br />
            <asp:Label ID="comment" runat="server" Text=""></asp:Label>
         
    
    </div>
    </form>
</body>
</html>
