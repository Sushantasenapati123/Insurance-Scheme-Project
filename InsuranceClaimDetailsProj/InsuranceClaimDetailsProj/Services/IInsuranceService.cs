using InsuranceClaimDetailsProj.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InsuranceClaimDetailsProj.Services
{
    public interface IInsuranceService
    {
        Task<List<InsuranceEntity>> GetAllHospitalService();
        Task<List<InsuranceEntity>> GetAllDocByIdService(int HosId);
        Task<List<InsuranceEntity>> GetAllpATIENTbYidService(int DocId);
        Task<InsuranceEntity> GetschemeInsuService(InsuranceEntity patientId);
        Task<int> savedataService(InsuranceEntity se);
        public Task<List<InsuranceEntity>> FillTableService();
        public Task<InsuranceEntity> FillCertificateService(InsuranceEntity Pid);

    }
}
