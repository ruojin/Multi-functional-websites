<%@ Page Language="C#" AutoEventWireup="true" CodeFile="View_allprofile.aspx.cs" Inherits="Private_View_myprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>your profile</title>
    <style type="text/css">
        .auto-style1 {
            width: 94%;
        }

        .auto-style2 {
            border: 1px solid black;
            width: 155px;
            height: 50px;
        }

        .auto-style3 {
            border: 1px solid black;
            width: 155px;
            height: 50px;
        }

        .auto-style4 {
            height: 20px;
            width: 152px;
        }

        .auto-style5 {
            border: 1px solid black;
            width: 245px;
        }

        .auto-style6 {
            border: 1px solid black;
            height: 20px;
            width: 245px;
        }

        .auto-style7 {
            width: 152px;
        }
        .auto-style8 {
            border: 1px solid black;
            width: 155px;
            height: 49px;
        }
        .auto-style9 {
            border: 1px solid black;
            width: 245px;
            height: 49px;
        }
        .auto-style10 {
            width: 152px;
            height: 49px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="border-style: solid; border-color: inherit; border-width: medium; position: relative; width: 700px; margin-right: auto; top: 0px; margin-left: auto; height: 700px; left: 0px;">

            <div style="background-color: #C0C0C0; position: absolute; width: 700px; top: 0px; height: 100px; left: 0px;">


                <asp:Panel ID="Panel2" runat="server" Style="position: absolute; width: 300px; left: 400px; height: 25px; text-align: right; padding-top: 5px; top: 0px;">
                    Hello
                <asp:Label ID="hello" runat="server" Text="user"></asp:Label>
                    &nbsp; &nbsp;
                <asp:LinkButton ID="logout" runat="server" OnClick="logout_Click">Logout</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </asp:Panel>

                <h1 style="text-align: center">View All profile</h1>
            </div>

            <div style="width: 200px; margin: auto; position: absolute; top: 100px; left: 0px; height: 600px; display: inline-block;">
                 <br />
<br />
                <br />
                <asp:Panel ID="Panel3" runat="server">
                    &nbsp;<br />&nbsp;&nbsp;<br />&nbsp;<br />&nbsp;<br />&nbsp;<br />
 
                    <br />
                    <br />
                    <asp:HiddenField ID="HiddenField1" runat="server" />
 
                </asp:Panel>
            </div>

            <div style="width: 500px; margin: auto; position: absolute; top: 100px; left: 200px; height: 600px;">
                <div style="position: absolute; top: 6px; left: 5px; height: 431px; width: 493px;">
                    <br />
                    &nbsp;
                    User List:
                    <asp:Panel ID="Panel4" runat="server" style="text-align:center;">
                        &nbsp;&nbsp;<br />
                        <asp:DropDownList ID="UserList" runat="server" DataSourceID="SqlDataSource2" DataTextField="Username" DataValueField="Username">
                        </asp:DropDownList>
                        <br />
                        &nbsp;&nbsp;
                        </asp:Panel>
                    &nbsp;<br />
                    &nbsp;
                    <br />
                    <br />
                    <asp:Panel ID="Panel5" runat="server">
                    <table class="auto-style1" style="border-collapse: collapse; margin-left: 20px; margin-right: 20px;">
                        <tr>
                            <td class="auto-style3">&nbsp; Name</td>
                            <td class="auto-style6">&nbsp;
                    <asp:Label ID="Label_Name" runat="server" Text=""></asp:Label>
                            </td>
                            <td class="auto-style4"></td>
                        </tr>
                        <tr>
                            <td class="auto-style8">&nbsp; Gender</td>
                            <td class="auto-style9"> &nbsp;
                                <asp:Label ID="Label_Gender" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style10"></td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp; Age</td>
                            <td class="auto-style6">&nbsp;
                    <asp:Label ID="Label_Age" runat="server" Text=""></asp:Label>
                            </td>
                            <td class="auto-style4">&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp; Address</td>
                            <td class="auto-style5">&nbsp;
                    <asp:Label ID="Label_Address" runat="server" Text=""></asp:Label>
                            </td>
                            <td class="auto-style7">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp; Telephone</td>
                            <td class="auto-style6">&nbsp;
                    <asp:Label ID="Label_Telephone" runat="server" Text=""></asp:Label>
                            </td>
                            <td class="auto-style4"></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp; E-mail address</td>
                            <td class="auto-style5">&nbsp;
                    <asp:Label ID="Label_Email" runat="server" Text=""></asp:Label>
                            </td>
                            <td class="auto-style7">
                                &nbsp;</td>
                        </tr>
                    </table>
                        <br/>
                        &nbsp;
                        <asp:Button ID="Button_View" runat="server" OnClick="Button_View_Click" Text="View" />
                        &nbsp;<asp:Button ID="Button_Return" runat="server" OnClick="Button_Return_Click" Text="ReturnToMyFile" />
                        &nbsp;<br />
                        <asp:Label ID="Comment" runat="server"></asp:Label>
                        <br />
                        <br />
                        </asp:Panel>
                    <p>
                        &nbsp;
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Profile]">
                        </asp:SqlDataSource>
                    </p>
                    <p>
                    
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Authentication]">
                        </asp:SqlDataSource>
                    
                    </p>
                    <p>

                        &nbsp;</p>
                </div>
            </div>
        </div>







            <div>
            </div>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Profile] WHERE ([Username] = @Username)">
            <SelectParameters>
                <asp:ControlParameter ControlID="UserList" Name="Username" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
