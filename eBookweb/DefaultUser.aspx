<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="DefaultUser.aspx.cs" Inherits="eBookweb.DefaultUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CP4User" runat="server">
    <div> <img src="Images/bookshelf1.png" class="img-responsive" alt="Responsive image" />
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
    </div>
    <!--- Paging -->
    <hr />
    <div style="text-align: center">
        <ul class="pagination" style="margin: auto">
            <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
                <ItemTemplate>
                    <asp:LinkButton ID="btnPageAdmin" CommandName="Page" CommandArgument="<%# Container.DataItem %>" runat="server">
                        <span class="btn btn-default"><%# Container.DataItem.ToString()%></span>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <!--- Paging -->
</asp:Content>