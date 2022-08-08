<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<c:forEach var="fodto" items="${focart}">
   <li class="list">
       <div class="ordermenu">
           <div style="margin-left: 0px;margin-right: 10px;font-size:13px ;line-height: 20px;">
       		<a href="clietCartMinus.do?orderfoodcode=${fodto.value.fcode}" style="color:#cdcdcd;"><i class="fa fa-minus-square"></i></a>
       	</div>
           
       	
           <div class="qty">
            ${fodto.value.fodqty}
           </div>
           
             <div style="margin-left: 10px;margin-right: 20px;font-size:13px;line-height: 20px;">
       		<a href="clientCartAdd.do?orderfoodcode=${fodto.value.fcode}" style="color:#cdcdcd;"><i class="fa fa-plus-square"></i></a>
       	</div>
       	
           <div class="name">
               ${fodto.value.fname} 
           </div>
           
       </div>
       <div class="money">
       <input type="hidden" value="${fodto.value.fodpri}" class="pri"/>
          ${fodto.value.fodpri} 원
          
          <a href="clientCartDelete.do?orderfoodcode=${fodto.value.fcode}"  style="margin-left: 10px;color:rgb(237, 91, 91);"><i class="fa fa-times"></i></a>
       </div>
   </li>
   <c:set var="totpri" value="${totpri+fodto.value.fodpri}" />
</c:forEach>