using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _default : System.Web.UI.Page
{
    public double input, result;
    int index1, index2;
    public string[] parameters = {"choose Unit","Kilometers", "Meters", "Centimeters", "Millimeters","Miles", "Yards", "Feet", "inches" };
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            dd1.DataSource = parameters;
            dd1.DataBind();
            dd2.DataSource = parameters;
            dd2.DataBind();

        }
    }
    protected void TextBox_Initial()
    {
        tb1.Text = "0";
        tb2.Text = "0";
        dd1.SelectedIndex = 0;
        dd2.SelectedIndex = 0;
    }
    protected void convert()
    {
        double[] factor = { 0.001, 1, 100, 1000, 0.000621371192, 1.0936133, 3.2808399, 39.3700787 };
        input = double.Parse(tb1.Text);
        index1 = dd1.SelectedIndex-1;
        index2 = dd2.SelectedIndex-1;
        result = input * factor[index2] / factor[index1];
        tb2.Text = result.ToString();
    }
    protected void convert_click(object sender, EventArgs e)
    {
        double Num;
        bool isNum = double.TryParse(tb1.Text.ToString(), out Num);
        //This is the boolean to check if the input is number or not.
        if(dd1.SelectedIndex==0 || dd2.SelectedIndex==0)
        {
            label.Text = "Please choose the unit you want to convert";
            TextBox_Initial();
        }
        else if (dd1.SelectedIndex == dd2.SelectedIndex)
        {
            label.Text = "You can not choose the same units";
            TextBox_Initial();
        }
        else
        {
            if (!isNum)
            {
                label.Text = "Please enter a number";
            }
            else
            {
                convert();
                label.Text = "";
            }
        }
    }

}
