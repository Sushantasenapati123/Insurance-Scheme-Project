using Dapper;
using InsuranceClaimDetailsProj.Models;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace InsuranceClaimDetailsProj.Repositories
{
    public class InsuranceRepository : BaseRepository, IInsuranceRepository
    {
        public InsuranceRepository(IConfiguration configuration) : base(configuration)
        {
        }

        public async Task<List<InsuranceEntity>> GetAllDocById(int HosId)
        {
            var cn = CreateConnection();
            if (cn.State == ConnectionState.Closed) cn.Open();
            DynamicParameters param = new DynamicParameters();
            param.Add("@Hosp_ID", HosId);
            param.Add("@Action", "FDOC");
            var lstclg = cn.Query<InsuranceEntity>("USP_HOSPITAL_PRO", param, commandType: CommandType.StoredProcedure).ToList();
            return lstclg;
        }

        public async Task<List<InsuranceEntity>> GetAllHospital()
        {
            var cn = CreateConnection();
            if (cn.State == ConnectionState.Closed) cn.Open();
            DynamicParameters param = new DynamicParameters();
            param.Add("@Action", "FHOS");
            var lstclg = cn.Query<InsuranceEntity>("USP_HOSPITAL_PRO", param, commandType: CommandType.StoredProcedure).ToList();
            return lstclg;
        }

        public async Task<List<InsuranceEntity>> GetAllpATIENTbYid(int DocId)
        {
            var cn = CreateConnection();
            if (cn.State == ConnectionState.Closed) cn.Open();
            DynamicParameters param = new DynamicParameters();
            param.Add("@Doct_ID", DocId);
            param.Add("@Action", "FPAT");
            var lstclg = cn.Query<InsuranceEntity>("USP_HOSPITAL_PRO", param, commandType: CommandType.StoredProcedure).ToList();
            return lstclg;
        }

       

        public async Task<InsuranceEntity> GetschemeInsu(InsuranceEntity subID)
        {
            var cn = CreateConnection();
            if (cn.State == ConnectionState.Closed) cn.Open();
            DynamicParameters param = new DynamicParameters();
            param.Add("@Patient_ID", subID.Patient_ID);
            param.Add("@Action", "FISI");
            var lstclg = cn.Query<InsuranceEntity>("USP_HOSPITAL_PRO", param, commandType: CommandType.StoredProcedure).FirstOrDefault();
            return lstclg;
        }



        public async Task<InsuranceEntity> FillCertificate(InsuranceEntity Pid)
        {
            var cn = CreateConnection();
            if (cn.State == ConnectionState.Closed) cn.Open();
            DynamicParameters param = new DynamicParameters();
            param.Add("@Patient_ID", Pid.Patient_ID);
            param.Add("@Action", "FCER");
            var lstclg = cn.Query<InsuranceEntity>("USP_HOSPITAL_PRO", param, commandType: CommandType.StoredProcedure).FirstOrDefault();
            return lstclg;
        }

        public async Task<int> savedata(InsuranceEntity se)
        {
            var cn = CreateConnection();
            if (cn.State == ConnectionState.Closed) cn.Open();
            DynamicParameters param = new DynamicParameters();
            param.Add("@Patient_ID", se.Patient_ID);
            param.Add("@Admission_Date", se.Admission_Date);
            param.Add("@Discharge_Date", se.Discharge_Date);
            param.Add("@Total_Expenses", se.Total_Expenses);
            param.Add("@Insurance_Scheme_ID", se.Insurance_Scheme_ID);
            param.Add("@Action", "Save");
            int x = cn.Execute("USP_HOSPITAL_PRO", param, commandType: CommandType.StoredProcedure);
            cn.Close();
            return x;
        }

        public async Task<List<InsuranceEntity>> FillTable()
        {
            var cn = CreateConnection();
            if (cn.State == ConnectionState.Closed) cn.Open();
            DynamicParameters param = new DynamicParameters();
            param.Add("@Action", "FLTB");
            var lstclg = cn.Query<InsuranceEntity>("USP_HOSPITAL_PRO", param, commandType: CommandType.StoredProcedure).ToList();
            return lstclg;
        }
    }


}
