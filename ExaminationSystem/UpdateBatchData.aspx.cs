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
    public partial class UpdateBatchData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillBatches();
                BatchFill();
            }
        }

        protected void ddl_Batch_SelectedIndexChanged(object sender, EventArgs e)
        {
            BatchBiz batchBiz = new BatchBiz();
            List<Batch> batch = batchBiz.GetBatchesByID(ddl_Batch.SelectedValue);
            if (batch != null && batch.Count > 0)
            {
                for (int i = 0; i < batch.Count; i++)
                {
                    txtBatchName.Text = batch[i].BatchName;
                    txtCourse.Text = batch[i].Course;
                    txtNoOfCandidate.Text = Convert.ToString(batch[i].NoOfCandidate);
                }
            }
        }
        private void FillBatches()
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
        protected void Update_Click(object sender, EventArgs e)
        {
            Batch batch = new Batch
            {
                ID = Convert.ToInt32(ddl_Batch.SelectedValue),
                BatchName = txtBatchName.Text,
                Course = txtCourse.Text,
                NoOfCandidate = Convert.ToInt32(txtNoOfCandidate.Text)

            };
            BatchBiz batchBiz = new BatchBiz();
            batchBiz.UpdateBatch(batch);
            BatchFill();
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            BatchBiz batchBiz = new BatchBiz();
            batchBiz.DeleteBatch(ddl_Batch.SelectedValue);
            BatchFill();
        }
        private void BatchFill()
        {
            BatchBiz batchBiz = new BatchBiz();
            List<Batch> batches = batchBiz.GetBatches();
            if (batches != null && batches.Count > 0)
            {
                GridView1.DataSource = batches;
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