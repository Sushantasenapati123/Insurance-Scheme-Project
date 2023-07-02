using InsuranceClaimDetailsProj.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InsuranceClaimDetailsProj.Repositories
{
   public interface IInsuranceRepository
    {
        Task<List<InsuranceEntity>> GetAllHospital();
        Task<List<InsuranceEntity>> GetAllDocById(int HosId);
        Task<List<InsuranceEntity>> GetAllpATIENTbYid(int DocId);
        Task<InsuranceEntity> GetschemeInsu(InsuranceEntity patientId);
        Task<int> savedata(InsuranceEntity se);
        public Task<List<InsuranceEntity>> FillTable();
        public  Task<InsuranceEntity> FillCertificate(InsuranceEntity Pid);
    }
}
