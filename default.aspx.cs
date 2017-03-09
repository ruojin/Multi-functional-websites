using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _default : System.Web.UI.Page
{
    static void Permutation(List<string> result, string temp, string input)
    {
        if (input.Length == 0)
            result.Add(temp);
  
        for(int i=0; i<input.Length; i++)
        {
            string newTemp = temp + input[i];
            string newInput = input.Remove(i, 1);
            Permutation(result, newTemp, newInput);

        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void find_Click(object sender, EventArgs e)
    {
        outputList.Items.Clear();
        String input = inputList.Text.Replace(' ',(char)0xA0);
        if (input.Length>8 || input.Length<1)
        {
            comment.Text = "Please enter a string from 1 to 8 charactors";
        }
        else
        {
            var result = new List<string>();
            Permutation(result, "", input);
            if(dupd.Checked ==true)
            {
                var disList = result.Distinct().ToList();
                int count = disList.Count();
                outputList.DataSource = disList;
                outputList.DataBind();
                comment.Text = count + " anagrams found.";
            }
            else
            {
                int count = result.Count();
                outputList.DataSource = result;
                outputList.DataBind();
                comment.Text = count + " anagrams found.";
            }
        }
        if(IsPostBack)
        {
            inputList.Text = string.Empty;
        }
    }
    
}