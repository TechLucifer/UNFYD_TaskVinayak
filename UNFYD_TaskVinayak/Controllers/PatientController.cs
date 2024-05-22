using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using UNFYD_TaskVinayak.Models;
using UNFYD_TaskVinayak.Models.DomainPatient;

namespace UNFYD_TaskVinayak.Controllers
{
    public class PatientController : Controller
    {
        // GET: Patient
        public async Task<ActionResult> Index()
        {
            if (TempData["AlertMeg"] != null)
            {
                ViewBag.Meg = TempData["AlertMeg"];
            }
            BalPatientcs objb = new BalPatientcs();
            DalPatient objd = new DalPatient();
            DataSet ds =await objb.GetPatients();
            List<DalPatient> PatientData = new List<DalPatient>();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                //pb.PatientID,pb.FirstName,pb.LastName,pb.DOB,pb.MobileNo,pb.EmailID,doc.DoctorName,aps.AppointmentSlot
                DalPatient obj = new DalPatient();
                obj.PatientID = Convert.ToInt32(ds.Tables[0].Rows[i]["PatientID"].ToString());
                obj.FirstName = ds.Tables[0].Rows[i]["FirstName"].ToString();
                obj.LastName = ds.Tables[0].Rows[i]["LastName"].ToString();
                obj.DOB = Convert.ToDateTime(ds.Tables[0].Rows[i]["DOB"].ToString());
                obj.MobileNo = ds.Tables[0].Rows[i]["MobileNo"].ToString();
                obj.EmailID = ds.Tables[0].Rows[i]["EmailID"].ToString();
                obj.DoctorName = ds.Tables[0].Rows[i]["DoctorName"].ToString();
                obj.AppointmentSlot = Convert.ToDateTime(ds.Tables[0].Rows[i]["AppointmentSlot"].ToString());
                PatientData.Add(obj);
            }
            objd.patientslst = PatientData;
            return View(objd);
        }
        public async void GetDocData()
        {
            BalPatientcs objbal = new BalPatientcs();
            DataSet ds = await objbal.GetDoc();
            List<SelectListItem> Doclst = new List<SelectListItem>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                Doclst.Add(new SelectListItem
                {
                    Text = dr["DoctorName"].ToString(),
                    Value = dr["DoctorID"].ToString()
                });

            }
            ViewBag.Doclst = Doclst;
        }

        public async Task<JsonResult> BindAppointmentSlot(int DoctorID)
        {
            BalPatientcs objbal = new BalPatientcs();
            DataSet ds =await objbal.GetAppointmentSlot(DoctorID);
            List<SelectListItem> AppointmentSlotlist = new List<SelectListItem>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                AppointmentSlotlist.Add(new SelectListItem { 
                    Text = dr["AppointmentSlot"].ToString(),  
                    Value = dr["AppointmentSlotID"].ToString() 
                });
            }
            return Json(AppointmentSlotlist, JsonRequestBehavior.AllowGet);

        }

        [HttpGet]
        public async Task<ActionResult> AddPatientData()
        {
            GetDocData();
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> AddPatientData(DalPatient objd)
        {
            if (ModelState.IsValid)
            {
                GetDocData();
                BalPatientcs objb = new BalPatientcs();
                await objb.AddPatients(objd);
                TempData["AlertMeg"] = "Your data has been stored successfully..✌️";
                return RedirectToAction("Index");
            }
            return View(objd);
        }

        public async Task<ActionResult> DeletePatientData(int id)
        {
            BalPatientcs obj = new BalPatientcs();
            await obj.DeletePatients(id);
            TempData["AlertMeg"] = "Your data has been delete successfully..✌️";
            return RedirectToAction("Index");
        }
    }
}