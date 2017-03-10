using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Votes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        int sum = 0;
        TableRow header = new TableRow();
        TableCell h1 = new TableCell();
        TableCell h2 = new TableCell();
        TableCell h3 = new TableCell();
        header.Cells.Add(h1);
        header.Cells.Add(h2);
        header.Cells.Add(h3);
        h1.Text = "Candidate";
        h2.Text = "Votes";
        h3.Text = "Percentage";
        style_set(h1);
        style_set(h2);
        style_set(h3);
        Table1.Rows.Add(header);
        foreach (DataRow dr in dv.Table.Rows)
        {
            sum += Convert.ToInt32(dr["Votes"]);
        }
        foreach (DataRow dr in dv.Table.Rows)
        {
            TableRow r = new TableRow();
            TableCell name = new TableCell();
            TableCell votes = new TableCell();
            TableCell percentage = new TableCell();
            
            style_set(name);
            style_set(votes);
            style_set(percentage);
            name.Text = dr["Candidates"].ToString();
            votes.Text = dr["Votes"].ToString();
            if (sum == 0)
            {
                percentage.Text = "0.0 %";
            }
            else
            {
                double cal = (int)dr["Votes"] / (double)sum;
                percentage.Text = String.Format("{0:P2}", cal);
            }           
            r.Cells.Add(name);
            r.Cells.Add(votes);
            r.Cells.Add(percentage);
            Table1.Rows.Add(r);
        }

    }

    protected void style_set(TableCell x)
    {
        x.BorderWidth = 1;
        x.BorderColor = Color.Black;
        x.Width = 150;
        x.Height = 30;
    }
}