using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace loginpg
{
    public partial class signin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btndoctorlogin_click(object sender, EventArgs e)
        {
            Response.Redirect("doctorlogin.aspx");
        }

        protected void btnReceptionistLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("receptionistlogin.aspx");
        }

        protected void btnadminlogin_click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }
    }
}