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
    public partial class BatchData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BatchFill();
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            Batch batch = new Batch
            {
                BatchName = txtBatchName.Text,
                Course = txtCourse.Text,
                NoOfCandidate = Convert.ToInt32(txtNoOfCandidate.Text),
            };
            BatchBiz batchBiz = new BatchBiz();
            batchBiz.SaveBatch(batch);
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
        protected void Reset_Click(object sender, EventArgs e)
        {
            Response.Redirect("BatchData.aspx");
        }
        
    }
}