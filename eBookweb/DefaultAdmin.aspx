<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="DefaultAdmin.aspx.cs" Inherits="eBookweb.DefaultAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH4Admin" runat="server">
    <div class = "row" style="background-image: url('Images/default.png')">
        <asp:Repeater ID="RptDefaultAdmin" runat="server">
      
            <ItemTemplate>
                <div class = "col-sm-5 col-md-2">
                    <div class = "thumbnail" style="min-height:260px;height:260px;">
                        <a href="<%# (Eval("Link")) %>">
                            <img src = "<%# (Eval("ImgPath")) %>"  alt = "Generic placeholder thumbnail">
                        </a>    
                    </div>
                    <div class = "caption" style="width:180px;overflow:hidden;height:40px;line-height:20px;"><%#Eval("Brief") %></div>
                    <br />
               </div>
           </ItemTemplate>
        </asp:Repeater>
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
