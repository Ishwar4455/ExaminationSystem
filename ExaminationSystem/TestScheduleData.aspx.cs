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
    public partial class TestScheduleData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TestScheduleFill();
                CandidateFill();
                BatchFill();
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            TestSchedule testSchedule = new TestSchedule
            {
                BatchID = Convert.ToInt32(ddl_Batch.SelectedValue),
                CandidateID = Convert.ToInt32(ddl_Candidate.SelectedValue),
                TestName = txtTestName.Text,
                TimeAllowed = txtTimeAllowed.Text,
                NumberOfQuestions = txtNumberOfQuestions.Text,
                TestStartDate = Convert.ToDateTime(txtTestStartDate.Text),
                TestEndDate = Convert.ToDateTime(txtTestEndDate.Text),
                MaxMarks = Convert.ToDecimal(txtMaxMarks.Text),
                PassMarks = Convert.ToDecimal(txtPassMarks.Text),
            };
            TestScheduleBiz scheduleBiz = new TestScheduleBiz();
            scheduleBiz.SaveTestSchedule(testSchedule);
            TestScheduleFill();
        }
        private void TestScheduleFill()
        {
            TestScheduleBiz scheduleBiz = new TestScheduleBiz();
            List<TestSchedule> testSchedules = scheduleBiz.GetTestSchedules();
            if (testSchedules != null && testSchedules.Count > 0)
            {
                GridView1.DataSource = testSchedules;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }
        private void BatchFill()
        {
            BatchBiz batchBiz = new BatchBiz();
            List<Batch> batches = batchBiz.GetBatches();

            if (batches != null && batches.Count > 0)
            {
                for (int i = 0; i < batches.Count; i++)
                {
                    ddl_Batch.Items.Add(batches[i].ID.ToString());
                }
                ddl_Batch.Items.Insert(0, new ListItem("Select Batch", " "));
            }
            else
            {
                ddl_Batch.Items.Clear();
            }
        }
        private void CandidateFill()
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
        protected void Reset_Click(object sender, EventArgs e)
        {
            Response.Redirect("TestScheduleData.aspx");
        }
    }
}