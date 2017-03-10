<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login and Signup</title>
    <style>
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
            text-align: center;
            
        }
        .thirddiv{
            margin-left: 300px;
            margin-right:50px;
            
            
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">            
        <div class="maindiv" style="height:380px">
                <h1 style="text-align:center">Welcome to profile management system</h1>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" EnableTheming="True">
            <asp:View ID="View1" runat="server">
            <div class="seconddiv" style="height:250px">
                <br />
                <h3 class="center">Please Login</h3>
                Username:<asp:TextBox ID="Login_Username" runat="server"></asp:TextBox>
                <br /><br />
                Password:<asp:TextBox ID="Login_Password" runat="server" TextMode="Password"></asp:TextBox>&nbsp;
                <br /><br />
                <asp:Button ID="Login_Button" runat="server" Text="Login" OnClick="Login_Button_Click" BackColor="White" />
                <br />
                <asp:Label ID="Login_Res" runat="server"></asp:Label>
                <h4><strong>Do not have an account?</strong></h4>
                        
                        <asp:Button ID="Button_Reg" runat="server" OnClick="Register_Link" Text="Register" BackColor="White"/>
                    
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div class="seconddiv" style="height:250px">
                <h3 class="center">Sign up</h3>
                
                Username:
        
                <asp:TextBox ID="Register_Username" runat="server"></asp:TextBox>
                    
                <br />
                <br />
                Password:
        
                <asp:TextBox ID="Register_Password" runat="server" TextMode="Password"></asp:TextBox>
                   
                <br />
                <br />
                Re-Enter Password:
                <asp:TextBox ID="Register_Reenter" runat="server" TextMode="Password"></asp:TextBox>                    
                <br /><br />
                <asp:Button ID="Register_Button" runat="server" OnClick="Register_Button_Click" Text="Register" BackColor="White" />
                <br /><br />
                <asp:Label ID="Register_Response" runat="server"></asp:Label>
                 &nbsp;<br />
                <h4>
                        <strong>Already have an account?</strong></h4>
                        <asp:Button ID="Button_Log" runat="server" OnClick="Login_Link" Text="Login" BackColor="White"/>
               </div>
            </asp:View>
                </asp:MultiView>
        </div>

                <asp:HiddenField ID="HiddenField1" runat="server" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO Authentication(Username, Password, Privilege) VALUES (@username, @password, 1)" SelectCommand="SELECT * FROM [Authentication] WHERE ([Username] = @Username)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="Register_Username" Name="username" PropertyName="Text" />
                        <asp:ControlParameter ControlID="HiddenField1" Name="password" PropertyName="Value" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Register_Username" Name="Username" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Authentication] WHERE ([Username] = @Username)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Login_Username" Name="Username" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>


    

    </form>
</body>
</html>
