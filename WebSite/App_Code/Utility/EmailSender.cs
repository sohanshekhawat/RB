using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web;

/// <summary>
/// Summary description for EmailSender
/// </summary>
public class EmailSender
{
    public EmailSender()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void ProfileStatusEmail(string to, string reason)
    {
        string subject = "";

        string body = "";

        string appdatafolder = Path.Combine(HttpContext.Current.Request.PhysicalApplicationPath, "App_Code\\Utility");

        using (StreamReader reader = new StreamReader(appdatafolder +  "\\Status.htm"))
        {
            string readFile = reader.ReadToEnd();

            body = readFile;

            if (string.IsNullOrWhiteSpace(reason))
            {
                subject = "Profile Status Approved";
                body = body.Replace("{message}", "Message should be your profile has been approved");
            }
            else
            {
                subject = "Profile Status Rejected";//Subject for your request
                body = body.Replace("{message}", reason);
            }
        }

        this.SendEmail(to, subject, body);
    }


    public void SendRegistrationEmail(string to, string name,  string activationCode)
    {
        var test = HttpContext.Current.Request.Url.AbsoluteUri.Replace(HttpContext.Current.Request.Url.PathAndQuery,string.Empty);

        string subject = "RajputGatha Activation";
        
        string body = "Hello " +  name.Trim() + ",";
        body += "<br /><br />Thank you for registration at RajputGatha";

        body += "<br /><br />Please click the following link to activate your account";

        var link = string.Format("{0}//RegistrationActivation.aspx?ActivationCode={1}&Email={2}",test, activationCode, to);

        body += "<br /><a href = '" + link +"'>Click here to activate your account.</a>";
        body += "<br /><br />Thanks";
       
        this.SendEmail(to, subject, body);
        
    }
    
    public void SendForgetPasswordEmail(string to, string password)
    {
        var domainPath = HttpContext.Current.Request.Url.AbsoluteUri.Replace(HttpContext.Current.Request.Url.PathAndQuery, string.Empty);

        string subject = "RajputGatha Password";

        string body = "Hello,";
        

        body += "<br /><br />Your password is :" + password;

        var link = string.Format("{0}//login.aspx", domainPath);

        body += "<br /><a href = '" + link + "'>Click here to login.</a>";
        body += "<br /><br />Thanks";

        this.SendEmail(to, subject, body);
    }

    private void SendEmail(string toemail, string subject, string body)
    {
        try
        {
            MailMessage email = new MailMessage();
            email.From = new MailAddress("socialbraingroup@gmail.com");
            email.To.Add(toemail); 
            email.Subject = subject;
            email.Body = body;
            email.IsBodyHtml = true;

            //SMTP SERVER DETAILS
            SmtpClient smtpc = new SmtpClient("smtp.gmail.com");
            smtpc.Port = 587;
            smtpc.UseDefaultCredentials = false;
            smtpc.EnableSsl = true;
            smtpc.Credentials = new System.Net.NetworkCredential("socialbraingroup@gmail.com", "Octahop@7810");
            smtpc.Send(email);
        }
        catch
        {
            throw;
        }
    }
}