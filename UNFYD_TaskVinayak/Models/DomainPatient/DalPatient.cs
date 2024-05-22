using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UNFYD_TaskVinayak.Models.DomainPatient
{
    public class DalPatient
    {
        public int PatientID { get; set; }
        [Required(ErrorMessage = "First name is required")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Last name is required")]
        public string LastName { get; set; }

        [Required]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
        public DateTime DOB { get; set; }

        [Required(ErrorMessage = "Mobile number is required")]
        [RegularExpression(@"^[0-9]{10}$", ErrorMessage = "Mobile number must be 10 digits")]
        public string MobileNo { get; set; }

        [Required(ErrorMessage = "Email address is required")]
        [EmailAddress(ErrorMessage = "Invalid email address")] public string EmailID { get; set; }

        [Required(ErrorMessage = "Doctor name is required")]
        public int DoctorID { get; set; }

        [Required(ErrorMessage = "Appointment slot date is required")]
        public int AppointmentSlotID { get; set; }
        public string DoctorName { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
        public DateTime AppointmentSlot { get; set; }

        public List<DalPatient> patientslst {  get; set; }
    }
}