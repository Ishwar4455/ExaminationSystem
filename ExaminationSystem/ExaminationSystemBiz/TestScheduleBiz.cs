using ExaminationSystem.ExaminationSystemData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExaminationSystem.ExaminationSystemBiz
{
    public class TestScheduleBiz
    {
        ExaminationSystemEntities db = new ExaminationSystemEntities();
        public List<TestSchedule> GetTestSchedules()//Get test schedules method
        {
            try
            {
                List<TestSchedule> testSchedule = null;
                testSchedule = (from c in db.TestSchedules select c).ToList();
                return testSchedule;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void SaveTestSchedule(TestSchedule testSchedule)//Save candidate.
        {
            try
            {
                using (ExaminationSystemEntities db = new ExaminationSystemEntities())
                {
                    db.TestSchedules.Add(testSchedule);
                    db.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public List<TestSchedule> GetTestSchedulesByID(string testScheduleID)//Get data by id
        {
            try
            {
                List<TestSchedule> testSchedules = null;
                using (ExaminationSystemEntities db = new ExaminationSystemEntities())
                {
                    testSchedules = (from c in db.TestSchedules where c.ID.ToString() == testScheduleID select c).ToList();
                }
                return testSchedules;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public int UpdateTestSchedule(TestSchedule testSchedule)//update test
        {
            try
            {
                using (ExaminationSystemEntities db = new ExaminationSystemEntities())
                {
                    TestSchedule t = db.TestSchedules.SingleOrDefault(x => x.ID == testSchedule.ID);
                    t.CandidateID = testSchedule.CandidateID;
                    t.BatchID = testSchedule.BatchID;
                    t.TestName = testSchedule.TestName;
                    t.TimeAllowed = testSchedule.TimeAllowed;
                    t.NumberOfQuestions = testSchedule.NumberOfQuestions;
                    t.TestStartDate = testSchedule.TestStartDate;
                    t.TestEndDate = testSchedule.TestEndDate;
                    t.MaxMarks = testSchedule.MaxMarks;
                    t.PassMarks = testSchedule.PassMarks;
                    db.SaveChanges();
                    return testSchedule.ID;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void DeleteTestSchedule(string testScheduleID)//delete method
        {
            try
            {
                using (ExaminationSystemEntities db = new ExaminationSystemEntities())
                {
                    TestSchedule t = db.TestSchedules.SingleOrDefault(x => x.ID.ToString().Trim() == testScheduleID.Trim());
                    if (t != null)
                    {
                        db.TestSchedules.Remove(t);
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