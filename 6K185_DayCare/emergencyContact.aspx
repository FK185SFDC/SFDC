<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="emergencyContact.aspx.vb" Inherits="adminUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>Child's Information</h2>
    <br />
<table>
    <tr>
        <td><asp:Label ID="childNameLabel" runat="server" Text="Child's Name:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="birthdateLabel" runat="server" Text="Birthdate:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="addressLabel" runat="server" Text="Address:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
    </tr>
</table>

<h2>Mother's Information</h2>
    <br />
<table>
    <tr>
        <td><asp:Label ID="mNameLabel" runat="server" Text="Mother's Name:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td> <asp:Label ID="mPrimaryPhoneLabel" runat="server" Text="Primary Phone:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="mAddressLabel" runat="server" Text="Address:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="mEmailLabel" runat="server" Text="E-Mail:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="mEmployerLabel" runat="server" Text="Employer:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="mOccupationLabel" runat="server" Text="Occupation:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="mWorkPhoneLabel" runat="server" Text="Work Phone:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="mWorkAddressLabel" runat="server" Text="Work Address:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="mCellLabel" runat="server" Text="Cell Phone:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox></td>
    </tr>
       
    
</table>
<h2>Father's Information</h2>
    <br />
    <table>
            <tr>
        <td><asp:Label ID="fNameLabel" runat="server" Text="Father's Name:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td> <asp:Label ID="fPrimaryPhoneLabel" runat="server" Text="Primary Phone:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="fAddressLabel" runat="server" Text="Address:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="fEmailLabel" runat="server" Text="E-Mail:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="fEmployerLabel" runat="server" Text="Employer:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="fOccupationLabel" runat="server" Text="Occupation:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="fWorkPhoneLabel" runat="server" Text="Work Phone:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="fWorkAddressLabel" runat="server" Text="Work Address:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="fCellLabel" runat="server" Text="Cell Phone:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox></td>
    </tr>
     
    </table>
<h2>Non-Parent Contact Information</h2>
    <br />
    <table>
            <tr>
        <td><asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td> <asp:Label ID="Label2" runat="server" Text="Primary Phone:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="Label3" runat="server" Text="Address:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox24" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="Label4" runat="server" Text="E-Mail:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="Label5" runat="server" Text="Employer:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="Label6" runat="server" Text="Occupation:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox27" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="Label7" runat="server" Text="Work Phone:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox28" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="Label8" runat="server" Text="Work Address:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox29" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="Label9" runat="server" Text="Cell Phone:"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox30" runat="server"></asp:TextBox></td>
    </tr>
     
    </table>
    <br /><br />

    <asp:Button ID="submitButton" runat="server" Text="Submit" />&nbsp<asp:Button ID="resetButton" runat="server" Text="Reset" />
</asp:Content>

