using ExaminationSystem.ExaminationSystemData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExaminationSystem.ExaminationSystemBiz
{
    public class CandidateBiz
    {
        ExaminationSystemEntities db = new ExaminationSystemEntities();
        public List<Candidate> GetCandidates()//Get candidates method
        {
            try
            {
                List<Candidate> candidates = null;
                candidates = (from c in db.Candidates select c).ToList();
                return candidates;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void SaveCandidate(Candidate candidate)//Save candidate.
        {
            try
            {
                using (ExaminationSystemEntities db = new ExaminationSystemEntities())
                {
                    db.Candidates.Add(candidate);
                    db.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public List<Candidate> GetCandidatesByID(string candidateID)
        {
            try
            {
                List<Candidate> candidates = null;
                using (ExaminationSystemEntities db = new ExaminationSystemEntities())
                {
                    candidates = (from c in db.Candidates where c.ID.ToString() == candidateID select c).ToList();
                }
                return candidates;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public int UpdateCandidate(Candidate candidate)
        {
            try
            {
                using (ExaminationSystemEntities db = new ExaminationSystemEntities())
                {
                    Candidate c = db.Candidates.SingleOrDefault(x => x.ID == candidate.ID);
                    c.CandidateName = candidate.CandidateName;
                    c.RegisterationID = candidate.RegisterationID;
                    c.FatherName = candidate.FatherName;
                    c.MotherName = candidate.MotherName;
                    c.Mobile = candidate.Mobile;
                    db.SaveChanges();
                    return candidate.ID;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void DeleteCandidate(string candidateID)
        {
            try
            {
                using (ExaminationSystemEntities db = new ExaminationSystemEntities())
                {
                    Candidate c = db.Candidates.SingleOrDefault(x => x.ID.ToString().Trim() == candidateID.Trim());
                    if (c != null)
                    {
                        db.Candidates.Remove(c);
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