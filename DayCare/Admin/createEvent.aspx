<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage_Main.master" AutoEventWireup="false" CodeFile="createEvent.aspx.vb" Inherits="Admin_createEvent" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <script type="text/javascript">
          function PopulateDays() {
              var ddlMonth = document.getElementById("<%=ddlMonth.ClientID%>");
            var ddlYear = document.getElementById("<%=ddlYear.ClientID%>");
            var ddlDay = document.getElementById("<%=ddlDay.ClientID%>");
            var y = ddlYear.options[ddlYear.selectedIndex].value;
            var m = ddlMonth.options[ddlMonth.selectedIndex].value != 0;
            if (ddlMonth.options[ddlMonth.selectedIndex].value != 0 && ddlYear.options[ddlYear.selectedIndex].value != 0) {
                var dayCount = 32 - new Date(ddlYear.options[ddlYear.selectedIndex].value, ddlMonth.options[ddlMonth.selectedIndex].value - 1, 32).getDate();
                ddlDay.options.length = 0;
                AddOption(ddlDay, "DD", "0");
                for (var i = 1; i <= dayCount; i++) {
                    AddOption(ddlDay, i, i);
                }
            }
        }

        function AddOption(ddl, text, value) {
            var opt = document.createElement("OPTION");
            opt.text = text;
            opt.value = value;
            ddl.options.add(opt);
        }

        function Validate(sender, args) {
            var ddlMonth = document.getElementById("<%=ddlMonth.ClientID%>");
    var ddlYear = document.getElementById("<%=ddlYear.ClientID%>");
    var ddlDay = document.getElementById("<%=ddlDay.ClientID%>");
    args.IsValid = (ddlDay.selectedIndex != 0 && ddlMonth.selectedIndex != 0 && ddlYear.selectedIndex != 0)
}
</script>

     <script type="text/javascript">
         function PopulateDays2() {
             var ddlMonth2 = document.getElementById("<%=ddlMonth2.ClientID%>");
            var ddlYear2 = document.getElementById("<%=ddlYear2.ClientID%>");
            var ddlDay2 = document.getElementById("<%=ddlDay2.ClientID%>");
            var y = ddlYear2.options[ddlYear2.selectedIndex].value;
            var m = ddlMonth2.options[ddlMonth2.selectedIndex].value != 0;
            if (ddlMonth2.options[ddlMonth2.selectedIndex].value != 0 && ddlYear2.options[ddlYear2.selectedIndex].value != 0) {
                var dayCount = 32 - new Date(ddlYear2.options[ddlYear2.selectedIndex].value, ddlMonth2.options[ddlMonth2.selectedIndex].value - 1, 32).getDate();
                ddlDay2.options.length = 0;
                AddOption2(ddlDay2, "DD", "0");
                for (var i = 1; i <= dayCount; i++) {
                    AddOption2(ddlDay2, i, i);
                }
            }
        }

        function AddOption2(ddl, text, value) {
            var opt = document.createElement("OPTION");
            opt.text = text;
            opt.value = value;
            ddl.options.add(opt);
        }

        function Validate2(sender, args) {
            var ddlMonth2 = document.getElementById("<%=ddlMonth2.ClientID%>");
    var ddlYear2 = document.getElementById("<%=ddlYear2.ClientID%>");
    var ddlDay2 = document.getElementById("<%=ddlDay2.ClientID%>");
    args.IsValid = (ddlDay2.selectedIndex != 0 && ddlMonth2.selectedIndex != 0 && ddlYear2.selectedIndex != 0)
}
</script>

    
    <h1>Create Event</h1>

    <table>

        <tr>
     <td><asp:Label ID="subjectLabel" runat="server" Text="Event Title"></asp:Label></td>
    <td><asp:TextBox ID="subjectTextBox" runat="server" ToolTip="Please enter title of event"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqTitle" runat="server" controltovalidate="subjectTextBox" 
            ErrorMessage="Please enter the title of event"></asp:RequiredFieldValidator>
    </td>
    </tr>
        <tr>
     <td><asp:Label ID="bodyLabel" runat="server" Text="Describe Event"></asp:Label></td>
    <td><asp:TextBox ID="bodyTextBox" runat="server" ToolTip="Please enter a brief description of the event"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqBody" runat="server" controltovalidate="bodyTextBox" 
            ErrorMessage="Please enter a brief description of the event"></asp:RequiredFieldValidator>
    </td>
    </tr>

    <tr>
        <td><asp:Label ID="locationLabel" runat="server" Text="Address"></asp:Label></td>
        <td><asp:TextBox ID="whereTextBox" runat="server" ToolTip="Please enter a location for the event."></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqLoc" runat="server" controltovalidate="whereTextBox" ErrorMessage="Please enter the address of event"></asp:RequiredFieldValidator>
        </td>
        
    </tr>
    <tr>
     <td><asp:Label ID="startLabel" runat="server" Text="Start Time"></asp:Label></td>
    <td>
         <asp:DropDownList ID="ddlHour" runat="server"></asp:DropDownList>
        <asp:DropDownList ID="ddlMinutes" runat="server"></asp:DropDownList>
        <asp:DropDownList ID="ddlPeriod" runat="server"></asp:DropDownList>


    </td>
        </tr>
      
       
           <tr>
            <td>Start Date</td>
            <td>
               <asp:DropDownList ID="ddlYear" runat="server" onchange = "PopulateDays()"></asp:DropDownList>
               <asp:DropDownList ID="ddlMonth" runat="server" onchange = "PopulateDays()"></asp:DropDownList>
               <asp:DropDownList ID="ddlDay" runat="server"></asp:DropDownList>
                
                
                <br /> 
                <asp:CustomValidator ID="Validator" runat="server" ErrorMessage="* Required"
                    ClientValidationFunction = "Validate" />
            </td>
            

    
        </tr>

         <tr>
    <td><asp:Label ID="endLabel" runat="server" Text="End Time"></asp:Label></td>
    <td>
         <asp:DropDownList ID="ddlHour2" runat="server"></asp:DropDownList>
        <asp:DropDownList ID="ddlMinutes2" runat="server"></asp:DropDownList>
        <asp:DropDownList ID="ddlPeriod2" runat="server"></asp:DropDownList>
    </td>     
            </tr>

        <tr>
            <td>End Date</td>
            <td>
                <asp:DropDownList ID="ddlYear2" runat="server" onchange = "PopulateDays2()"></asp:DropDownList>
                <asp:DropDownList ID="ddlMonth2" runat="server" onchange = "PopulateDays2()"></asp:DropDownList>
                <asp:DropDownList ID="ddlDay2" runat="server"></asp:DropDownList>
                
                
                <br /> 
                <asp:CustomValidator ID="Validator2" runat="server" ErrorMessage="* Required"
                    ClientValidationFunction = "Validate2" />
            </td>
            

    
        </tr>
        

     
    </table>
   


    <br />
    

    <asp:Label ID="errorLabel" runat="server" Text=""></asp:Label>

    <br />

    <asp:Button ID="createButton" runat="server" Text="Create" />
    <asp:Button ID="cancelButton" runat="server" Text="Cancel" />
</asp:Content>

