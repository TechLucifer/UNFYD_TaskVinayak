using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

using System.Web;
using System.Threading.Tasks;
using UNFYD_TaskVinayak.Models.DomainPatient;

namespace UNFYD_TaskVinayak.Models
{
    public class BalPatientcs
    {
        static string CS = ConfigurationManager.ConnectionStrings["UNFYD_CS"].ConnectionString;
        SqlConnection con = new SqlConnection(CS);

        #region Get all patients records from Db
        public async Task<DataSet> GetPatients()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("UNFYD_SP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Flag", "GetPatientData");        //@Flag='GetPatientData'
                SqlDataAdapter adpt = new SqlDataAdapter();
                DataSet ds = new DataSet();
                adpt.SelectCommand = cmd;
                adpt.Fill(ds);
                return ds;
            }
            catch (Exception)
            {

                throw;
            }
        }
        #endregion

        #region Get Doctor records
        public async Task<DataSet> GetDoc()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("UNFYD_SP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Flag", "GetDocData");        
                SqlDataAdapter adpt = new SqlDataAdapter();
                DataSet ds = new DataSet();
                adpt.SelectCommand = cmd;
                adpt.Fill(ds);
                return ds;
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion

        #region Get appointmentSlot as per doctros 
        public async Task<DataSet> GetAppointmentSlot(int DoctorID)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("UNFYD_SP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Flag", "GetAppointmentSlotByID");
                cmd.Parameters.AddWithValue("@DoctorID", DoctorID);
                SqlDataAdapter adpt = new SqlDataAdapter();
                DataSet ds = new DataSet();
                adpt.SelectCommand = cmd;
                adpt.Fill(ds);
                return ds;
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion

        #region Add Patient Appointments
        public async Task AddPatients(DalPatient obj)
        {
            try
            {
                con.Open(); 
                SqlCommand cmd = new SqlCommand("UNFYD_SP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Flag", "AddPatientData");
                cmd.Parameters.AddWithValue("@FirstName",obj.FirstName);
                cmd.Parameters.AddWithValue("@LastName", obj.LastName);
                cmd.Parameters.AddWithValue("@DOB", obj.DOB);
                cmd.Parameters.AddWithValue("@MobileNo", obj.MobileNo);
                cmd.Parameters.AddWithValue("@EmailID", obj.EmailID);
                cmd.Parameters.AddWithValue("@DoctorID", obj.DoctorID);
                cmd.Parameters.AddWithValue("@AppointmentSlotID", obj.AppointmentSlotID);
                await cmd.ExecuteNonQueryAsync();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        #endregion

        #region Delete the patient data
        public async Task DeletePatients(int PatientID)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UNFYD_SP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Flag", "DeletePatientData");
                cmd.Parameters.AddWithValue("@PatientID", PatientID);
                await cmd.ExecuteNonQueryAsync();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        #endregion
    }
}