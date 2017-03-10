using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Private_create : System.Web.UI.Page
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


    protected void Button_Save_Click(object sender, EventArgs e)
    {
        
        string sessionid = this.Session.SessionID;
        HttpCookie cookie = Request.Cookies[sessionid];
        //System.Diagnostics.Debug.Print(cookie["username"]);

        //check if user exits in the profile table
        if (userflag(cookie["username"])== true) 
        {
            SqlDataSourcePro.UpdateCommand = "UPDATE Profile SET Age =@age, gender =@gender, Telephone =@tele, Email =@email, Address =@address, Name = @name WHERE (Username = @username)";
            SqlDataSourcePro.UpdateParameters.Add("username", cookie["username"]);
            SqlDataSourcePro.UpdateParameters.Add("age", TextBox_Age.Text);
            SqlDataSourcePro.UpdateParameters.Add("gender", RadioButtonList_Gender.SelectedValue);
            SqlDataSourcePro.UpdateParameters.Add("tele", TextBox_Telephone.Text);
            SqlDataSourcePro.UpdateParameters.Add("email", TextBox_Email.Text);
            SqlDataSourcePro.UpdateParameters.Add("address", TextBox_Address.Text);
            SqlDataSourcePro.UpdateParameters.Add("name", TextBox_Name.Text);
            SqlDataSourcePro.Update();
            Comment.Text = "Update complete!";
        }
        else
        {
            SqlDataSourcePro.InsertCommand = "INSERT INTO Profile(Age, gender, Telephone, Email, Address, Name, Username) VALUES (@age, @gender, @tele, @email, @address, @name, @username)";
            SqlDataSourcePro.InsertParameters.Add("username", cookie["username"]);
            SqlDataSourcePro.Insert();
            Comment.Text = "Your profile has been saved!";

        }
        

    }







    protected void Button_DeleteAccount_Click(object sender, EventArgs e)
    {
        string sessionid = this.Session.SessionID;
        HttpCookie cookie = Request.Cookies[sessionid];

        DataView dv = (DataView)SqlDataSourceAuth.Select(DataSourceSelectArguments.Empty);
        SqlDataSourceAuth.SelectCommand = "SELECT * FROM[Authentication] WHERE([Username] = @username)";
        SqlDataSourcePro.SelectParameters.Add("username", cookie["username"]);
        if (dv.Table.Rows.Count != 0)
        {
            SqlDataSourceAuth.DeleteCommand = "DELETE FROM Authentication WHERE Username=@username";
            SqlDataSourceAuth.DeleteParameters.Add("username", cookie["username"]);
            SqlDataSourceAuth.Delete();
            Comment.Text = "Your account has been deleted";

            if (userflag(cookie["username"]))
            {
                SqlDataSourcePro.DeleteCommand = "DELETE FROM Profile WHERE Username=@username";
                SqlDataSourcePro.DeleteParameters.Add("username", cookie["username"]);
                SqlDataSourcePro.Delete();
                Comment.Text = "Your profile has been deleted!";
            }
        }
        FormsAuthentication.SignOut();
        Response.Redirect("../Default.aspx");
    }



    protected void DeletePro_Click(object sender, EventArgs e)
    {
        string sessionid = this.Session.SessionID;
        HttpCookie cookie = Request.Cookies[sessionid];
        if (userflag(cookie["username"]) == true)
        {
            SqlDataSourcePro.DeleteCommand = "DELETE FROM Profile WHERE Username=@username";
            SqlDataSourcePro.DeleteParameters.Add("username", cookie["username"]);
            SqlDataSourcePro.Delete();
            //FormsAuthentication.SignOut();
            Comment.Text = "Your profile has been deleted!";
            TextBox_Name.Text ="";
            TextBox_Age.Text = "";
            TextBox_Address.Text = "";
            TextBox_Email.Text = "";
            TextBox_Telephone.Text = "";
            RadioButtonList_Gender.SelectedValue = null;
        }
        else
        {
            Comment.Text = "You don't have profile can be deleted";
        }


    }

    protected void Button_ViewProfiles_Click(object sender, EventArgs e)
    {
        //System.Diagnostics.Debug.Print("test");
        Response.Redirect("./View_allprofile.aspx");
    }

    protected void Button_View_Click(object sender, EventArgs e)
    {
        string sessionid = this.Session.SessionID;
        HttpCookie cookie = Request.Cookies[sessionid];
        

        if (userflag(cookie["username"]) == true)
        {
            System.Diagnostics.Debug.Print("lalala");
            System.Diagnostics.Debug.Print(cookie["username"]);
           
            DataView dv = (DataView)SqlDataSourcePro.Select(DataSourceSelectArguments.Empty);
            
            for (int i=0; i<dv.Count; i++)
            {
                DataRow row = dv.Table.Rows[i];
                string uname = (string)row["Username"];
                if (cookie["username"]==uname)
                {
                    TextBox_Name.Text = (string)row["Name"];
                    TextBox_Age.Text = (string)row["Age"];
                    TextBox_Address.Text = (string)row["Address"];
                    TextBox_Email.Text = (string)row["Email"];
                    TextBox_Telephone.Text = (string)row["Telephone"];
                    RadioButtonList_Gender.SelectedValue = (string)row["gender"];
                    Comment.Text = "Your profile is displayed";
                
            }
            }
            //SqlDataSourcePro.SelectParameters.Add("username", cookie["username"]);
            //SqlDataSourcePro.SelectCommand = "SELECT * FROM Profile WHERE (Username = @username)";
                
        }
        else
        {
            Comment.Text = "There is no profile for you, please create your profile first";
        }
    }



    public Boolean userflag(string usrname)
    {
        DataView dv = (DataView)SqlDataSourcePro.Select(DataSourceSelectArguments.Empty);

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