<%@ Page Title="" Language="VB" MasterPageFile="./MasterPage_Main.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" 
    Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="Hm_pge">
    <h1 style="text-align:center">Welcome to State Farm Daycare!</h1>
        <p>At the State Farm Daycare we provide your child with a safe and stimulating environment where your child 
            can be free to explore and learn throughout a variety of teacher and child initiated experiences.<br /><br />

            Our teachers provide infant, toddler, and preschool education, in addition to constantly striving to 
            create a safe and trusting environment for your child.

            <br /><br />
            </p>
            <h3>Address:</h3> 21 E Market St, Iowa City, IA 
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl ="https://maps.google.com/maps?ie=UTF-8&q=Henry+B.+Tippie+College+of+Business&fb=1&gl=us&hq=university+of+iowa+business+school&cid=4562099981539243599&ei=btypUvrJG-PayAHxzYCICQ&ved=0CKsBEPwSMAs"
             Text="Click here for map!" Target="_blank" /> <br />
        <h3>Phone Number:</h3> 319.340.1234<br />
        <h3>Hours of Operation:</h3> Monday - Friday: 6:30 AM to 6:30 PM<br />

         
               
            


       
        </div>
</asp:Content>

