<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.payment.model.vo.Location"%>
<%@page import="com.kh.product.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Product> pList = (ArrayList<Product>)request.getAttribute("pList");
	ArrayList<Location> lList = (ArrayList<Location>)request.getAttribute("lList");
	String cno = (String)request.getAttribute("cno");
	DecimalFormat df = new DecimalFormat("###,###");
	int discountPrice = 0;
	int totalQnt = 0;
	int totalPrice = 0;
	for(Product p : pList){
		discountPrice += (p.getProductPrice()*(((100-p.getProductDiscount())*0.01))*p.getCartQnt());
		totalQnt += p.getCartQnt();
		totalPrice += p.getProductPrice()*p.getCartQnt();
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
     
  <style>
    .input-box {
      display: flex;
      margin: 15px;
      width: 400px;
      padding: 6px;
      border-radius: 15px;
      border: 1px solid #e2e2e2;
    }

    .input-box i {
      flex: 1;
    }

    .input-box input {
      flex: 7;
      border: none;
      outline: none;
    }

    .product_container {

      font-size: 18px;
      font-weight: 700;
      line-height: 1.5;
      padding-top: 30px;
      padding-bottom: 30px;
    }

    #searchBar {
      padding-top: 50px;
    }

    #product_detail>div {
      text-align: left;
    }

    input.img-button {
      background: url("/team2_Project/resources/img/icons8-expand-arrow-26.png") no-repeat;
      border: none;
      width: 32px;
      height: 32px;
      cursor: pointer;
    }

    .estmtPyamn th {
      text-align: left;
    }

    .estmtPyamn td {
      text-align: right;
    }

    .topLine {
      border-top: 2px solid rgb(186, 185, 185);
      margin-top: 25px;
    }

    #orderInfo tr {
      text-align: left;
       margin-left:80px;
    }
    
    #orderInfo div {
      padding-left:120px;
    }

    #delivery th {
      text-align: left;
    }

    #delivery td {
      text-align: left;
    }

    option {
      font-size: 12px;
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
      -webkit-appearance: none;
      margin: 0;
    }

    /* Firefox  */
    input[type='number'] {
      -moz-appearance: textfield;
    }

    #payment {
      background-color: rgb(241, 241, 241);
      margin-top: 20px;
    }

    #payment>div {
      padding-top: 10px;
      padding-bottom: 10px;
      font-weight: 600;
    }

    #payment table {
      font-size: 14px;
      text-align: left;
      padding-left: 5px;
    }
    #hidden-btn{
     display : none;
    }
  </style>
</head>

<body>
	<%@ include file = "../common/menubar.jsp" %>

 <div class="container text-center">
    <div class="row">
      <div class="col-1">
      </div>
      <div class="col-11" style="text-align: left; padding-top: 20px; font-size: 25px; font-weight: 800;">
        ??????
      </div>
    </div>
    <div class="row" style="padding-top: 40px;">
      <div class="col-1">

      </div>
      <div class="col-6">
        <div class="row">
          <div class="col-4" style="text-align: left; font-weight: 800;">
            ??????????????????
          </div>
          <div class="col-7">
            ???<span><%= totalQnt %>???</span>/<span><%= df.format(discountPrice)%>???</span>
          </div>
          <div class="col-1">
            <input type="button" id="slide-button" class="img-button" onclick="slide();">
          </div>
        </div>
          <form  action="<%=contextPath %>/order.pa" method="post">
        <div class="row" id="orderInformation" style="display: none">
         <% for(Product p : pList){ %>
         <input type="hidden" name="pno" value="<%=p.getProductNo() %>">
         <input type="hidden" name="psize" value="<%=p.getCartSize() %>">
         <input type="hidden" name="pqnt" value="<%=p.getCartQnt() %>">
         <input type="hidden" name="totalqnt" value="<%=totalQnt %>">
         <% if(cno!=null){ %>
         <input type="hidden" name="cno" value="<%=cno %>">
         <% } %>
          <div class="col-4">
            <div style="text-align: center;">
              <img src="<%= contextPath +'/'+ p.getFilePath() + p.getChangeName()%>" width="60%"
                height="100px" alt="">
            </div>
          </div>
          <div class="col-8" id="product_detail">
            <div style="margin-top: 10px; font-weight: 700;"><%= p.getBrandName() %></div>
            <div id="product-name"><%= p.getProductName() %></div>
            <table style="margin-top: 10px; margin-left: 5px;">
              <tr>
                <th width="102px" style="text-align: left; font-size: 16px;">size</th>
                <td style="font-size: 16px;"><%= p.getCartSize() %></td>
              </tr>
            </table>
            <div class="topLine">
              <table style="margin-top: 10px; margin-left: 5px;">
                <tr>
                  <th width="102px" style="text-align: left; font-size: 16px;">??????</th>
                  <td style="font-size: 16px;"><%= p.getCartQnt() %></td>
                </tr>
              </table>
            </div>
          </div>
          <br>
           <% } %>
        </div>
        <div class="topLine"></div>

        <div class="topLine" style="margin-top: 50px;"></div>
        <table id="orderInfo" style="margin-top: 20px; margin-left: 10px;">
          <tr>
            <th width="180" style="font-weight: 900; text-align: left; font-size: 20px;">????????? ??????</th>
          </tr>
          <tr>
            <th colspan="2" height="50"><div>????????? ??????</div></th>
            <td></td>
          </tr>
          <tr>
            <th colspan="2"><div><input type="text" name="order-name" placeholder="????????? ??????" value="<%= loginUser.getMemName() %>" required></div></th>
          </tr>
          <tr>
            <th colspan="2" height="45"><div>????????? ????????????</div></td> 
          </tr>
          <tr>
            <th colspan="2"><div><input type="tel" name="order-phone"  placeholder="????????? ????????????" value="<%= loginUser.getPhone() %>" required></div></th>
          </tr>
           <tr>
            <th colspan="2" height="45"><div>?????????</div></td> 
          </tr>
           <tr>
            <th colspan="2"><div><input type="email" name="order-email" value="<%= loginUser.getEmail()%>"></div></th>
        </table>
        <div class="topLine"></div>
        <table id="orderInfo" style="margin-top: 20px; margin-left: 10px;">
          <tr>
            <th width="180" style="font-weight: 900; text-align: left; font-size: 20px;">?????? ??????</th>
            <td width="450" style="text-align: right;">
              <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">?????????
                ??????</button>
            </td>
          </tr>
        </table>
        <table id="delivery" style="margin-left: 100px;">
           <tr>
            <th height="40" width="50%"><input type="text" id="sample6_postcode" name="Lcode" placeholder="????????????"></th>
            <td style="text-align: left;"><input type="button" onclick="sample6_execDaumPostcode()" value="???????????? ??????"></td>
          </tr>
          <tr>
            <td colspan="2" width="400" height="35"><input type="text" id="sample6_address" name="Laddress" placeholder="??????" style="width: 80%;"></td>
          </tr>
          <tr>
            <td width="400" height="35"><input type="text" id="sample6_detailAddress" name="Daddress" placeholder="????????????" style="width: 100%;"></td>
            <td><input type="text" id="sample6_extraAddress" placeholder="????????????"></td>
          </tr>
          <tr style="padding-top: 10px;">
            <td colspan="2" width="100" height="35" style="text-align: left;">
              <select id="delivery_select" class="form-select" aria-label="Default select example">
                <option selected>?????? ??? ??????????????? ???????????????</option>
                <option value="?????? ??? ???????????? ???????????????">?????? ??? ???????????? ???????????????</option>
                <option value="?????? ??? ????????? ????????????">?????? ??? ????????? ????????????</option>
                <option value="3" onclick="directInput();">????????????</option>
              </select>
            </td>
          </tr>
          <tr>
            <td colspan="2"><textarea name="" id="direct_input" cols="60" rows="4" style="display: none; resize: none; "></textarea></td>
          </tr>
        </table>
         <input type="hidden" name="rqrmn" value="">
        <div class="topLine"></div>
        <table id="orderInfo" style="margin-top: 20px; margin-left: 10px;">
          <tr>
            <th width="180" style="font-weight: 900; text-align: left; font-size: 20px; resize:none;">???????????? ??????</th>
          </tr>
          <tr>
            <td></td>
            <td><span>?????? ????????????</span> <span id="max-mileage"><%= loginUser.getMileage() %></span>???</td>
          </tr>
          <tr>
            <td></td>
            <td>
              <input type="number" id="input-mileage" name="amount" min="0" max="" value="0">
            </td>
          </tr>
          <tr>
            <td></td>
            <td>
              <div class="form-check">
                <input class="form-check-input" type="checkbox" name="useMileage" value="" id="check-mileage" onclick="mileage();">
                <label class="form-check-label" for="check-mileage">
                  ?????? ????????????
                </label>
              </div>
            </td>
          </tr>
        </table>
        <div class="topLine" style="margin-bottom: 100px;"></div>
      </div>
      <div class="col-3" style="margin-left: 20px;">
        <div style="font-weight: 600; padding-bottom: 20px; text-align: left;">?????? ????????????</div>
        <table class="estmtPyamn">
          <tr>
            <th>?????? ?????? ???</th>
            <td width="170" height="30"><%= totalQnt %>???</td>
          </tr>
          <tr>
            <th>????????????</th>
            <td id="order-price" height="30"><%= df.format(discountPrice)%>???</td>
          </tr>
          <tr>
            <th>?????????</th>
            <td height="30">??????</td>
          </tr>
          <tr>
            <th>????????????</th>
            <td height="30"><%= df.format(totalPrice-discountPrice)%>???</td>
          </tr>
        </table>
        <div class="topLine"></div>
        <table class="estmtPyamn" style="margin-top: 15px;">
          <tr>
            <th>????????? ??????</th>
            <td id="discount-mileage" width="170" height="40">0???</td>
          </tr>
          <tr>
            <th>?????? ????????????</th>
            <td height="40"><%= df.format(discountPrice/100)%>???</td>
            <input type="hidden" name="saveMileage" value="<%=discountPrice/100 %>">
          </tr>
        </table>
        <div class="topLine"></div>
        <table class="estmtPyamn" style="margin-top: 15px;">
          <tr>
            <th>?????? ????????????</th>
            <td id=final-payment width="170" height="40"><%= df.format(discountPrice)%>???</td>
          </tr>
        </table>
        <div class="topLine"></div>
        <div style="font-size: 23px; text-align: left; margin-top: 20px; font-weight: 549;">????????????</div>
        <div class="topLine"></div>
        <div id="payment" class="row">
          <div>???????????? ??????</div>
          <table id="payment2">
            <tr>
              <td width="100" height="30">
               <div> 
              <img src="<%= contextPath%>/resources/img/???????????????.png" width="15px" height="15px" alt="">
                <span style="font-weight:600">pay</span>
                </div>
                </td>
              <td>?????? ??? ??????????????? ????????? ??????</td>
            </tr>
            <tr>
              <td height="30">
                 <div> <img src="<%= contextPath%>/resources/img/???????????????.png" width="15px" height="15px" alt="">
                <span style="font-weight:600">pay</span>
                </div>
              </td>
              <td>?????? ??? ?????? ????????? ?????? ??????</td>
            </tr>
            <tr>
              <td height="30">????????????</td>
              <td>?????? ??? ?????? 2~6?????? ????????? ??????</td>
            </tr>
            <tr>
              <td height="30">????????? ??????</td>
              <td>??????,??????,?????? ??? 13??? ?????? ??????</td>
            </tr>
          </table>
        </div>
        <div style="margin-top: 15px;">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
            <label class="form-check-label" for="flexCheckDefault">
              ???????????? ?????? ??? ?????? ??????(?????? ??????)
            </label>
          </div>
        </div>
        <div class="d-grid gap-2 col-6 mx-auto" style="margin-top: 20px; margin-bottom: 50px;">
          <button class="btn btn-primary" id="payment-btn" type="button"
            style="background-color: plum; border-color: plum;" onclick="iamport();">????????????</button>
        </div>
      </div>
      <button type="submit" id="hidden-btn">???????????????</button>
      </form> 
      <div class="col-2">

      </div>
    </div>
  </div>

  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">????????? ??????</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
			
			<div>
			 
			 <table class="table">
  			<thead class="table-light">
  			<tr>
  			 <th>?????????</th>
  			 <th>????????????</th>
  			 <th>??????</th>
  			 <th>????????????</th>
  			 <th></th>
  			 </tr>
 			 </thead>
 			 <tbody>
 			 <% for(Location l : lList){ %>
 			 <label for="radio1">
 			 <tr>
   				 <td>
   				 <div class="loc-name" style="font-weight: 600;"><%=l.getLocName()%></div>
   				 </td>
   				  <td>
   				  <div class="post-code"><%=l.getLocPostCode() %> </div>
   				  </td>
   				   <td>
   				     <div class="nomal-address"><%=l.getLocAddress() %></div>
                     <div class="detail-address"><%=l.getLocAddressDtl() %></div>
   				   </td>
   				    <td>
   				    <div class="loc-phone"><%=l.getLocPhone() %> </div>
   				    </td>
   				     <td>  <input type="radio" name="address" value="<%= l.getLocNo() %>"></td>
   				     <tr>
   				     <% } %>
  			</tbody>
			</table>
          </label>
			</div>
         
			

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="location-btn" data-bs-dismiss="modal" aria-label="Close"
           style="background-color: plum; border-color: plum;">????????????</button>
        </div>
      </div>
    </div>
  </div>
 <!--   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script> -->
  <script>
  let finalPrice = 0;
    function slide() {
      if ($("#orderInformation").css("display") == "none") {
        $("#orderInformation").slideDown(200);
        $("#orderInformation").show();
      } else {
        $("#orderInformation").slideUp(200);
      }
    }
    $(document).ready(function () {
      $('#delivery_select').change(function () {
        var result = $('#delivery_select option:selected').val();
        if (result == '3') {
          $('#direct_input').show();
        } else {
          $('#direct_input').hide();
        }
      });
    });

    function mileage() {
      if (!$('#check-mileage').is(':checked')) {
        $('#input-mileage').val('0');
        $("#discount-mileage").text("0???");
        $("#final-payment").text($("#order-price").text());
      } else {
        let mileage = $('#max-mileage').html();
        $('#input-mileage').val(mileage);
        $("#discount-mileage").text($("#input-mileage").val()+"???");
        finalPrice = ((<%=discountPrice%>-$("#input-mileage").val())+'').replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $("#final-payment").text(finalPrice+"???");
      }
    }

    $("#input-mileage").change(function(){
    	if($("#input-mileage").val()><%=loginUser.getMileage() %>){
    		 $('#input-mileage').val('0');
    	        $("#discount-mileage").text("0???");
    	        $("#final-payment").text($("#order-price").text());
    	}else{
    	console.log($("#input-mileage").val());
    	$("#discount-mileage").text($("#input-mileage").val()+"???");
    	finalPrice = ((<%=discountPrice%>-$("#input-mileage").val())+'').replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	$("input:checkbox[id='check-mileage']").prop("checked", false); 
    	$("#final-payment").text(finalPrice+"???");
    }
    })
    
    $("#location-btn").click(function(){
    	$("input[name=address]").each(function(){
    		if($(this).is(":checked") == true){
    			$("#sample6_postcode").val($(this).parents('tr').find($(".post-code")).text())
    			$("#sample6_address").val($(this).parents('tr').find($(".nomal-address")).text())
    			$("#sample6_detailAddress").val($(this).parents('tr').find($(".detail-address")).text())
    			$("input[name=order-name]").val($(this).parents('tr').find($(".loc-name")).text())
    			$("input[name=order-phone]").val($(this).parents('tr').find($(".loc-phone")).text())
    		}
    	})
    });
    
    $("#delivery_select").change(function(){
    	if($("#delivery_select option:selected").val()=="3"){
    		$("#direct_input").change(function(){
    			$("input[name=rqrmn]").val($("#direct_input").val());
    		})
    	}else{
    		$("input[name=rqrmn]").val($("#delivery_select option:selected").val());
    	}
    })
  </script>
  
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
function iamport(){
	const bName=  $("input[name=order-email]").val();
	const bPhone = $("input[name=order-phone]").val();
	const bEmail = $("input[name=order-email]").val();
	const bAddr = $("#sample6_address").val();
	const bCode = $("#sample6_postcode").val();
	const bAddr2 = $("#sample6_detailAddress").val();
	
	if(bName!="" && bPhone!="" && bEmail != "" && bAddr != "" && bCode != "" && bAddr2 != ""){
		
	if($("#flexCheckDefault").is(":checked")){	
    //????????? ????????????
    IMP.init('imp91623210');
    IMP.request_pay({
        pg : "html5_inicis",
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '??????/????????????' , //??????????????? ????????? ??????
        amount : 100, //?????? ???????????? ??????
        buyer_email : bEmail,
        buyer_name : bName,
        buyer_tel : bPhone,
        buyer_addr : bAddr+bAddr2,
        buyer_postcode : bCode
    }, function(rsp) {
        console.log(rsp);
        if ( rsp.success ) {
            var msg = '????????? ?????????????????????.';
            msg += '??????ID : ' + rsp.imp_uid;
            msg += '?????? ??????ID : ' + rsp.merchant_uid;
            msg += '?????? ?????? : ' + rsp.paid_amount;
            msg += '?????? ???????????? : ' + rsp.apply_num;
            
            $("#hidden-btn").trigger('click');
        } else {
            var msg = '????????? ?????????????????????.';
            msg += '???????????? : ' + rsp.error_msg;  
        }
        alert(msg) 
      // $("#hidden-btn").trigger('click');
    });
	}else{
		alert('??????????????? ??????????????????!!');
	
	}
}else{
	alert('?????? ??????????????? ??????????????????!!');
	
}

}
</script>

  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

                // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
                var addr = ''; // ?????? ??????
                var extraAddr = ''; // ???????????? ??????

                //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
                if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
                    addr = data.roadAddress;
                } else { // ???????????? ?????? ????????? ???????????? ??????(J)
                    addr = data.jibunAddress;
                }

                // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
                if(data.userSelectedType === 'R'){
                    // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
                    // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
                    if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // ???????????? ??????, ??????????????? ?????? ????????????.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ????????? ??????????????? ?????? ????????? ?????????.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // ????????? ???????????? ????????? ????????????.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

</html>