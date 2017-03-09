using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public double input, factor1, factor2, result;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void convert()
    {
        input = double.Parse(TextBox1.Text);
        factor1 = double.Parse(DropDownList1.SelectedValue);
        factor2 = double.Parse(DropDownList2.SelectedValue);
        result = input / factor1 * factor2;
        TextBox2.Text = result.ToString();
    }
    public void TextBox_Initial()
    //This is the initial function to set everything to initial status.
    {
        TextBox1.Text = " ";
        TextBox2.Text = " ";
        DropDownList1.SelectedIndex = 0;
        DropDownList2.SelectedIndex = 0;
    }
    
    public void convert_click(object sender, EventArgs e)
    {
        double Num;
        bool isNum = double.TryParse(TextBox1.Text.ToString(), out Num);
        //This is the boolean to check if the input is number or not.
        if(!isNum)
        {
            if (DropDownList1.SelectedValue == "-1" || DropDownList2.SelectedValue == "-1")
            //Check if user are choosing the unit to convert instead of "Choose Unit..."
            {
                Label1.Text = "Please enter a number and choose a unit you want to convert.";
                TextBox_Initial();
            }
            else if (DropDownList1.SelectedValue == DropDownList2.SelectedValue)
            //Check if the target and source unit are the same.
            {
                Label1.Text = "Please enter a number and you can not convert same unit.";
                TextBox_Initial();           
            }
            else
            {
                Label1.Text = "Please enter a number.";
                TextBox_Initial();
            }   
        }else if (isNum)
        {
            if (DropDownList1.SelectedValue == "-1" || DropDownList2.SelectedValue == "-1")
            //Check if user are choosing the unit to convert instead of "Choose Unit..."
            {
                Label1.Text = "Please choose a unit you want to convert.";
                TextBox_Initial();

            }
            else if (DropDownList1.SelectedValue == DropDownList2.SelectedValue)
            //Check if the target and source unit are the same.
            {
                Label1.Text = "You can not convert same unit.";
                TextBox_Initial();
            }
            else
            {
                convert();
                Label1.Text = "";
            }
        }
       
    }

}