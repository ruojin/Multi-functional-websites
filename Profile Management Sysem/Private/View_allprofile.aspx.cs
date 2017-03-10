using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Private_View_myprofile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            hello.Text = User.Identity.Name;
        }

    }




    protected void logout_Click(object sender, EventArgs e)
    {
        /*for (int i = 0; i < Request.Cookies.Count; i++)
        {
            string sessionid = this.Session.SessionID;
            HttpCookie cookie = Request.Cookies[sessionid];
            cookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(cookie);
        }*/
        string sessionid = this.Session.SessionID;
        if (Request.Cookies[sessionid] != null)
        {
            HttpCookie myCookie = new HttpCookie(sessionid);
            myCookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(myCookie);
        }
        FormsAuthentication.SignOut();
        Response.Redirect("../Default.aspx");
        Session.Abandon();      
    }




    protected void Button_View_Click(object sender, EventArgs e)
    {
        //string sessionid = this.Session.SessionID;
        //HttpCookie cookie = Request.Cookies[sessionid];
        

        if (userflag(UserList.SelectedValue) == true)
        {
            DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            DataRow row = dv.Table.Rows[0];
            //SqlDataSource1.SelectCommand = "SELECT * FROM Profile WHERE (Username = @username1)";
            //SqlDataSource1.SelectParameters.Add("username1", UserList.SelectedValue);

            Label_Name.Text = (string)row["Name"];
            Label_Age.Text = (string)row["Age"];
            Label_Address.Text = (string)row["Address"];
            Label_Email.Text = (string)row["Email"];
            Label_Telephone.Text = (string)row["Telephone"];
            Label_Gender.Text = (string)row["gender"];

            Comment.Text = "The profile is displayed";
        }
        else
        {
            Comment.Text = "There is no profile for this user";
        }
    }

    protected void Button_Return_Click(object sender, EventArgs e)
    {
        Response.Redirect("create.aspx");
    }

    public Boolean userflag(string usrname)
    {
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

        for (int i = 0; i < dv.Count; i++)
        {
            DataRow row = dv.Table.Rows[i];
            string s = (string)row["Username"];
            //string namestring = s.ToString();
            if (String.Equals(usrname, s)) return true;


        }
        return false;
    }
}