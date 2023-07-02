using InsuranceClaimDetailsProj.Models;
using InsuranceClaimDetailsProj.Repositories;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using System.Threading.Tasks;
//using PdfSharpCore.Fonts;
//using PdfSharpCore.Pdf;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using TheArtOfDev.HtmlRenderer.PdfSharp;
using System.IO;
using Microsoft.AspNetCore.Http;
using PdfSharp;

//using TheArtOfDev.HtmlRenderer.PdfSharp;
//using PdfSharpCore;


namespace InsuranceClaimDetailsProj.Controllers
{
    public class InsuranceController : Controller
    {
        private readonly IInsuranceRepository _cgservic;
        private readonly IWebHostEnvironment _environmen;
        public InsuranceController(IInsuranceRepository cgservice, IWebHostEnvironment environment)
        {
            _cgservic = cgservice;
            _environmen = environment;
        }
        public async Task<IActionResult> Index()
        {
            List<InsuranceEntity> lstcollege = new List<InsuranceEntity>();
            lstcollege = await _cgservic.GetAllHospital();
            lstcollege.Insert(0, new InsuranceEntity { Hosp_ID = 0, Hosp_Name = "Please Select Hospital" });
            ViewBag.College = lstcollege;
            return View();
        }

        public async Task<JsonResult> Doctor_Bind(int Hosp_ID)
        {
            var subcatList = await _cgservic.GetAllDocById(Hosp_ID);
            List<SelectListItem> scalist = new List<SelectListItem>();
            foreach (InsuranceEntity dr in subcatList)
            {
                scalist.Add(new SelectListItem { Text = dr.Doct_Name, Value = dr.Doct_ID.ToString() });
            }
            var jsonres = JsonConvert.SerializeObject(scalist);
            return Json(jsonres);
        }

        public async Task<JsonResult> Patient_Bind(int Doct_ID)
        {
            var subcatList = await _cgservic.GetAllpATIENTbYid(Doct_ID);
            List<SelectListItem> scalist = new List<SelectListItem>();
            foreach (InsuranceEntity dr in subcatList)
            {
                scalist.Add(new SelectListItem { Text = dr.Patient_Name, Value = dr.Patient_ID.ToString() });
            }
            var jsonres = JsonConvert.SerializeObject(scalist);
            return Json(jsonres);
        }
        public async Task<JsonResult> InsuranceBind(InsuranceEntity pid)
        {
            InsuranceEntity lstprod = await _cgservic.GetschemeInsu(pid);
            var jsonres = JsonConvert.SerializeObject(lstprod);
            return Json(jsonres);
        }
        public async Task<int> SaveUpdate(InsuranceEntity se)
        {
            return await _cgservic.savedata(se);
        }

        public async Task<JsonResult> GetAllpatientData()
        {
            List<InsuranceEntity> lststudent = await _cgservic.FillTable();
            var jsonres = JsonConvert.SerializeObject(lststudent);
            return Json(jsonres);
        }

        public async Task GeneratePDF(int id)
        {
            try
            {
                PdfSharpCore.Pdf.PdfDocument document = new PdfSharpCore.Pdf.PdfDocument();
                InsuranceEntity ps = new InsuranceEntity();
                ps.Patient_ID = id;
                //int c = 0;
                InsuranceEntity detail = await _cgservic.FillCertificate(ps);

                string htmlcontent = "<div class='col-lg-12'>";
                htmlcontent += " <div style='width:550px; height:350px; padding:20px; text-align:center; border:10px solid #673AB7; margin-left:10%;'>";
                htmlcontent += " <div style= 'width:420px; height:300px;padding:20px; text-align:center; border:5px solid #673AB7;border-style:dotted;'>";
                if(detail != null)
                {
                    htmlcontent += " <span style='font-size:50px; font-weight:bold;  color:#663ab7;'>"+detail.Insurance_Name +"</span>";
                }
                htmlcontent += " <hr>";
                htmlcontent += "<span style='font-size:25px;'><i>Under Scheme:</i>"+detail.Insurance_Scheme_Name+"</span>";
                htmlcontent += "<br><br>";
                if (detail != null)
                {
                    htmlcontent += "<span style=''><b>"+detail.Patient_Name+"</b></span><br/><br/>";
                }
                if (detail != null)
                {
                    htmlcontent += "<span style='font-size:15px;'><i>Admission Date:" + detail.Admission_Date.Trim()+ "</i></span> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style='font-size:15px;'><i>Discharge Date:" + detail.Discharge_Date.Trim()+ "</i></span> <br/><br/>";
                }

                htmlcontent += " <div style='width:350px; height:50px; padding:20px; text-align:center; border:2px solid; margin-left:2%; margin-right:2%;'>";
                htmlcontent += "<span style='font-size:13px;'><i>Hospital code:"+ detail.Hosp_ID+ "</i></span> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style='font-size:13px;'><i>Hospital Name:" + detail.Hosp_Name+ "</i></span> <br/><br/>";
                htmlcontent += "<span style='font-size:13px;'><i>Doctor code:"+ detail.Doct_ID+ "</i></span> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style='font-size:13px;'><i>Patient Name:" + detail.Patient_Name+ "</i></span> <br/><br/>";
                htmlcontent += "<span style='font-size:13px;'><i>Patient Code:"+ detail.Patient_ID + "</i></span> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style='font-size:13px;'><i>Doctor Name:" + detail.Doct_Name+ "</i></span> <br/><br/>";
                htmlcontent += "</div>";

                htmlcontent += "<br /><br />";
                htmlcontent += "<span style='fs-30'><i>Total Expenses:</i>" + detail.Total_Expenses+ "</span> <br>";
                htmlcontent += "<span style='fs-30'><i>Insuredn Amount:</i>" + detail.Insured_amount + "</span> <br>";
                htmlcontent += "<span style='fs-30'><i>Total Payble Amount:</i>" + detail.Total_Payble_Amount + "</span> <br>";
                htmlcontent += "<br /><br />";
                htmlcontent += " <hr>";
                htmlcontent += "<span style='fs-17' ><b>4th Floor OCAC Tower,Acharya Vihar, Bhubaneswar, Odisha </b></span>";
                htmlcontent += "<span style= 'font-size:25px;'><i>dated</i></span><br>";
                //htmlcontent += "<span style='font-size:25px;'> 23 March,2019</span>";
                htmlcontent += "</div>";
                htmlcontent += "</div>";



                PdfGenerator.AddPdfPages(document, htmlcontent, (PdfSharpCore.PageSize)PageSize.A4);

                byte[]? response = null;
                var stream = new MemoryStream();
                document.Save(stream);
                response = stream.ToArray();
                Response.Clear();
                string Filename = "Medical Discharge Report" + ".pdf";
                Response.Headers.Add("content-disposition", "attachment;" + Filename);
                Response.ContentType = "application/pdf";
                ValueTask valueTask = Response.Body.WriteAsync(response);
                Response.Body.Flush();
            }
            catch (Exception ex)
            {

            }   
        }
    }
}






