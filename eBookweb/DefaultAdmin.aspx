<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="DefaultAdmin.aspx.cs" Inherits="eBookweb.DefaultAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH4Admin" runat="server">
    <div class = "row">
        <asp:Repeater ID="RptDefaultAdmin" runat="server">
      
            <ItemTemplate>
                <div class = "col-sm-5 col-md-2">
                    <div class = "thumbnail">
                        <a href="<%# (Eval("Link")) %>">
                            <img src = "Images/badge.png" alt = "Generic placeholder thumbnail">
                        </a>    
                        <div class = "caption"><%#Eval("Brief") %></div>
                    </div>
               </div>
           </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
