using ExaminationSystem.ExaminationSystemBiz;
using ExaminationSystem.ExaminationSystemData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExaminationSystem
{
    public partial class CandidateData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CandidateFill();
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            Candidate candidate = new Candidate
            {
                CandidateName = txtCandidateName.Text,
                FatherName = txtFatherName.Text,
                MotherName = txtMotherName.Text,
                RegisterationID = Convert.ToInt32(txtRegisterationID.Text),
                Mobile = txtMobile.Text
            };
            CandidateBiz candidateBiz = new CandidateBiz();
            candidateBiz.SaveCandidate(candidate);
            CandidateFill();
        }

        protected void Reset_Click(object sender, EventArgs e)
        {
            Response.Redirect("CandidateData.aspx");
        }
        private void CandidateFill()
        {
            CandidateBiz candidateBiz = new CandidateBiz();
            List<Candidate> candidates = candidateBiz.GetCandidates();
            if (candidates != null && candidates.Count > 0)
            {
                GridView1.DataSource = candidates;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }
    }
}