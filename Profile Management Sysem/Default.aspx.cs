using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            
        }
    }
    protected void Register_Link(object sender, EventArgs e)
    {

        MultiView1.ActiveViewIndex = 1;
        Textbox_Initial("Register_Cleanall");
        Register_Response.Text = "";
    }
    protected void Login_Link(object sender, EventArgs e)
    {

        MultiView1.ActiveViewIndex = 0;
        Textbox_Initial("Login_Cleanall");
        Login_Res.Text = "";
    }
    public void Textbox_Initial(string keyword)
    {
        if (keyword == "Register_Password")
        {
            Register_Password.Text = "";
            Register_Reenter.Text = "";
        }
        if (keyword == "Register_Cleanall")
        {
            Register_Password.Text = "";
            Register_Reenter.Text = "";
            Register_Username.Text = "";
        }
        if(keyword == "Login_Cleanall")
        {
            Login_Username.Text = "";
            Login_Password.Text = "";
        }
    }
    protected void Login_Button_Click(object sender, EventArgs e)
    {
        if (Login_Username.Text == "")
        {
            Login_Res.Text = "Please enter a username.";
            return;
        }
        if (Login_Password.Text == "")
        {
            Login_Res.Text = "Please enter a password.";
            return;
        }
        DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count == 0)
        {
            Login_Res.Text = "Username doesn't exist.";
            return;
        }
        string hashpass = FormsAuthentication.HashPasswordForStoringInConfigFile(Login_Password.Text, "SHA1");
    //    string hashpass = Login_Password.Text;
        DataRow row = dv.Table.Rows[0];
        string temppass = (string)row["Password"];
        string tempname = (string)row["Username"];
        int privilege = (int)row["Privilege"];
        if (temppass == hashpass)
        {
            string sessionid = this.Session.SessionID;
            HttpCookie cookie = new HttpCookie(sessionid);
            cookie["username"] = tempname;
            Response.Cookies.Add(cookie);
            System.Diagnostics.Debug.Print(cookie["username"]);
            if (privilege == 1)
            {
                FormsAuthentication.SetAuthCookie(Login_Username.Text, false);
                Response.Redirect("Private/create.aspx");
            }
            if (privilege == 10)
            {
                FormsAuthentication.SetAuthCookie(Login_Username.Text, false);
                Response.Redirect("Admin/Admin.aspx");
            }
        }
        else
        {
            Login_Res.Text = "Password not correct.";
        }
    }
    protected void Register_Button_Click(object sender, EventArgs e)
    {
        if (Register_Username.Text == "")
        {
            Register_Response.Text = "Please a username.";
            return;
        }
        if (Register_Password.Text == "" || Register_Reenter.Text == "")
        {
            Register_Response.Text = "Please enter a password and re-enter it.";
            Textbox_Initial("Register_Password");
            return;
        }
        if (Register_Password.Text != Register_Reenter.Text)
        {
            Register_Response.Text = "Password do not match.";
            Textbox_Initial("Register_Password");
            return;
        }
        if (Register_Password.Text.Length < 6)
        {
            Register_Response.Text = "Enter a password at least six characters.";
            Textbox_Initial("Register_Password");
            return;
        }
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count != 0)
        {
            Register_Response.Text = "User name already exists.";
            Textbox_Initial("Register_Cleanall");
            return;
        }
        HiddenField1.Value = FormsAuthentication.HashPasswordForStoringInConfigFile(Register_Password.Text, "SHA1");
        SqlDataSource1.Insert();
 //       RegisterDataSource2.Insert();
        Register_Response.Text = "Registration successful! Please Login now.";
        Textbox_Initial("Register_Cleanall");
    }
}