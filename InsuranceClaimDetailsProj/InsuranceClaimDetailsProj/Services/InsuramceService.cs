using InsuranceClaimDetailsProj.Models;
using InsuranceClaimDetailsProj.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InsuranceClaimDetailsProj.Services
{
    public class InsuramceService:IInsuranceService
    {
        private readonly IInsuranceRepository _crepo;
        public InsuramceService(IInsuranceRepository crepo)
        {
            _crepo = crepo;
        }

        public Task<InsuranceEntity> FillCertificateService(InsuranceEntity Pid)
        {
            return _crepo.FillCertificate(Pid);
        }

        public Task<List<InsuranceEntity>> FillTableService()
        {
            return _crepo.FillTable();
        }

        public Task<List<InsuranceEntity>> GetAllDocByIdService(int HosId)
        {
            return _crepo.GetAllDocById(HosId);
        }

        public Task<List<InsuranceEntity>> GetAllHospitalService()
        {
            return _crepo.GetAllHospital();
        }

        public Task<List<InsuranceEntity>> GetAllpATIENTbYidService(int DocId)
        {
            return _crepo.GetAllpATIENTbYid(DocId);
        }

        public Task<InsuranceEntity> GetschemeInsuService(InsuranceEntity patientId)
        {
            return _crepo.GetschemeInsu(patientId);
        }

        public Task<int> savedataService(InsuranceEntity se)
        {
            return _crepo.savedata(se);
        }
    }
}
