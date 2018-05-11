<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="DefaultUser.aspx.cs" Inherits="eBookweb.DefaultUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CP4User" runat="server">
    <div class = "row">
        <asp:Repeater ID="RptDefaultUser" runat="server">
      
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