using ExaminationSystem.ExaminationSystemData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExaminationSystem.ExaminationSystemBiz
{
    public class BatchBiz
    {
        ExaminationSystemEntities _db = new ExaminationSystemEntities();
        public List<Batch> GetBatches()//Get batches method
        {
            try
            {
                List<Batch> batch = null;
                batch = (from o in _db.Batches select o).ToList();
                return batch;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void SaveBatch(Batch batch)//Save method.
        {
            try
            {
                using (ExaminationSystemEntities db = new ExaminationSystemEntities())
                {
                    db.Batches.Add(batch);
                    db.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public List<Batch> GetBatchesByID(string batchID)
        {
            try
            {
                List<Batch> batches = null;
                using (ExaminationSystemEntities db = new ExaminationSystemEntities())
                {
                    batches = (from c in db.Batches where c.ID.ToString() == batchID select c).ToList();
                }
                return batches;
;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public int UpdateBatch(Batch batch)
        {
            try
            {
                using (ExaminationSystemEntities db = new ExaminationSystemEntities())
                {
                    Batch b = db.Batches.SingleOrDefault(x => x.ID == batch.ID);
                    b.BatchName = batch.BatchName;
                    b.Course = batch.Course;
                    b.NoOfCandidate = batch.NoOfCandidate;
                    db.SaveChanges();
                    return batch.ID;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void DeleteBatch(string batchID)
        {
            try
            {
                using (ExaminationSystemEntities db = new ExaminationSystemEntities())
                {
                    Batch b = db.Batches.SingleOrDefault(x => x.ID.ToString().Trim() == batchID.Trim());
                    if (b != null)
                    {
                        db.Batches.Remove(b);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}