<%@ Page Language="C#" AutoEventWireup="true" CodeFile="create.aspx.cs" Inherits="Private_create" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>create</title>
    <style type="text/css">
        .auto-style1 {
            width: 94%;
        }

        .auto-style4 {
            height: 20px;
            width: 152px;
        }

        .auto-style7 {
            width: 152px;
        }
        .auto-style8 {
            border: 1px solid black;
            width: 99px;
            height: 49px;
        }
        .auto-style9 {
            border: 1px solid black;
            width: 129px;
            height: 49px;
        }
        .auto-style10 {
            width: 152px;
            height: 49px;
        }
        .auto-style14 {
            font-size: x-large;
        }
        .auto-style18 {
            border: 1px solid black;
            width: 99px;
            height: 50px;
        }
        .auto-style19 {
            border: 1px solid black;
            height: 20px;
            width: 129px;
        }
        .auto-style20 {
            border: 1px solid black;
            width: 129px;
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
                <asp:LinkButton ID="logout" runat="server" OnClick="logout_Click" CausesValidation="false">Logout</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </asp:Panel>

                <h1 style="text-align: center">Your profile</h1>
            </div>

            <div style="width: 200px; margin: auto; position: absolute; top: 100px; left: 0px; height: 600px; display: inline-block;">
                 <br />
<br />
                <br />
                <asp:Panel ID="Panel3" runat="server">
                    &nbsp;<asp:Button ID="Button_DeleteAccount" runat="server" Text="Delete your account" Width="150px" OnClick="Button_DeleteAccount_Click" CausesValidation="false"/>
                    <br />
                    <br />
                    <asp:Button ID="DeletePro" runat="server" Text="Delete your profile" Width="150px" OnClick="DeletePro_Click" CausesValidation="false"/>
                    <br />
                    <br />
                    &nbsp;<asp:Button ID="Button_ViewProfiles" runat="server" Text="View all profiles" Width="150px" OnClick="Button_ViewProfiles_Click" CausesValidation="false"/>
                    <br />
 
                    <br />
                    <asp:HiddenField ID="HiddenField1" runat="server" />
 
                </asp:Panel>
            </div>

            <div style="width: 500px; margin: auto; position: absolute; top: 100px; left: 200px; height: 600px;">
                <div style="position: absolute; top: 6px; left: 5px; height: 431px; width: 493px;">
                    <br />
                    &nbsp;
                    
                    <strong><span class="auto-style14">Please edit your profile</span></strong><br />
                    &nbsp;
                    <br />
                    <br />
                    <asp:Panel ID="Panel5" runat="server">
                    <table class="auto-style1" style="border-collapse: collapse; margin-left: 20px; margin-right: 20px;">
                        <tr>
                            <td class="auto-style18">&nbsp; Name</td>
                            <td class="auto-style19">&nbsp;
                                <asp:TextBox ID="TextBox_Name" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style4">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_Name" ErrorMessage="Please enter your name" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8">&nbsp; Gender</td>
                            <td class="auto-style9"> &nbsp; &nbsp;
                                <asp:RadioButtonList ID="RadioButtonList_Gender" runat="server" style="margin-left: 16px">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="auto-style10">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="RadioButtonList_Gender" ErrorMessage="Please choose your gender" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style18">&nbsp; Age</td>
                            <td class="auto-style19">&nbsp;
                                <asp:TextBox ID="TextBox_Age" runat="server"></asp:TextBox>
                                <br />
                            </td>
                            <td class="auto-style4">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox_Age" ErrorMessage="Please enter your age" ForeColor="Red"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox_Age" ErrorMessage="Please enter a valid age" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style18">&nbsp; Address</td>
                            <td class="auto-style20">&nbsp;
                                <asp:TextBox ID="TextBox_Address" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style7">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox_Address" ErrorMessage="Please enter your address" ForeColor="Red"></asp:RequiredFieldValidator>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style18">&nbsp; Telephone</td>
                            <td class="auto-style19">&nbsp;
                                <asp:TextBox ID="TextBox_Telephone" runat="server"></asp:TextBox>
                                <br />
                                e.g.111-111-1111</td>
                            <td class="auto-style4">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox_Telephone" ErrorMessage="Please enter your telephone number" ForeColor="Red"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox_Telephone" ErrorMessage="Please enter a valid phone number" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style18">&nbsp; E-mail address</td>
                            <td class="auto-style20">&nbsp;
                                <asp:TextBox ID="TextBox_Email" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style7">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox_Email" ErrorMessage="Please enter your E-mail " ForeColor="Red"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox_Email" ErrorMessage="Please enter a valid E-mail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                        <br/>
                        &nbsp;
                        <asp:Button ID="Button_Save" runat="server" OnClick="Button_Save_Click" Text="Save" Width="88px" />
                        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button_View" runat="server" OnClick="Button_View_Click" Text="View" Width="80px" CausesValidation="false"/>
&nbsp;<br />
                        <asp:Label ID="Comment" runat="server"></asp:Label>
                        <br />
&nbsp;</asp:Panel>
                    <p>
                        &nbsp;
                        <asp:SqlDataSource ID="SqlDataSourceAuth" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Authentication]"></asp:SqlDataSource>
                    </p>
                    <p>
                    
                        &nbsp;</p>
                    <p>

                        &nbsp;</p>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Profile] WHERE ([Username] = @Username)">
                <SelectParameters>
                    <asp:CookieParameter CookieName="cookie[&quot;username&quot;]" Name="Username" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>







            <div>
            </div>
        <asp:SqlDataSource ID="SqlDataSourcePro" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO Profile(Age, gender, Telephone, Email, Address, Name) VALUES (@age, @gender, @tele, @email, @address, @name)" SelectCommand="SELECT * FROM [Profile]">
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox_Age" Name="age" PropertyName="Text" />
                <asp:ControlParameter ControlID="RadioButtonList_Gender" Name="gender" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TextBox_Telephone" Name="tele" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox_Email" Name="email" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox_Address" Name="address" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox_Name" Name="name" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
