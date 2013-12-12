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
            <h3>Location</h3>
             We are located in Iowa City, IA. <br />

         <asp:HyperLink runat="server" NavigateUrl="https://maps.google.com/maps?ie=UTF-8&q=Henry+B.+Tippie+College+of+Business&fb=1&gl=us&hq=university+of+iowa+business+school&cid=4562099981539243599&ei=btypUvrJG-PayAHxzYCICQ&ved=0CKsBEPwSMAs" Text="Click here for map!" /> 
               
            


       
        </div>
</asp:Content>

