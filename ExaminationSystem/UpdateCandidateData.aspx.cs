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
    public partial class UpdateCandidateData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CandidateFill();
                FillCandidate();
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            Candidate batch = new Candidate
            {
                ID = Convert.ToInt32(ddl_Candidate.SelectedValue),
                CandidateName = txtCandidateName.Text,
                RegisterationID = Convert.ToInt32(txtRegisterationID.Text),
                FatherName = txtFatherName.Text,
                MotherName = txtMotherName.Text,
                Mobile = txtMobile.Text

            };
            CandidateBiz candidateBiz = new CandidateBiz();
            candidateBiz.UpdateCandidate(batch);
            CandidateFill();
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            CandidateBiz candidateBiz = new CandidateBiz();
            candidateBiz.DeleteCandidate(ddl_Candidate.SelectedValue);
            CandidateFill();
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

        private void FillCandidate()
        {
            CandidateBiz candidateBiz = new CandidateBiz();
            List<Candidate> candidates = candidateBiz.GetCandidates();

            if (candidates != null && candidates.Count > 0)
            {
                for (int i = 0; i < candidates.Count; i++)
                {
                    ddl_Candidate.Items.Add(candidates[i].ID.ToString());
                }
                ddl_Candidate.Items.Insert(0, new ListItem("Select Candidate", " "));
            }
            else
            {
                ddl_Candidate.Items.Clear();
            }
        }
        protected void ddl_Candidate_SelectedIndexChanged(object sender, EventArgs e)
        {
            CandidateBiz candidateBiz = new CandidateBiz();
            List<Candidate> candidates = candidateBiz.GetCandidatesByID(ddl_Candidate.SelectedValue);
            if (candidates != null && candidates.Count > 0)
            {
                for (int i = 0; i < candidates.Count; i++)
                {
                    txtCandidateName.Text = candidates[i].CandidateName;
                    txtRegisterationID.Text = Convert.ToString(candidates[i].RegisterationID);
                    txtFatherName.Text = candidates[i].FatherName;
                    txtMotherName.Text = candidates[i].MotherName;
                    txtMobile.Text = candidates[i].Mobile;
                }
            }
        }
    }
}