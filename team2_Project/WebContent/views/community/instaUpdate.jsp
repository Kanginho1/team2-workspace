<%@page import="com.kh.community.model.vo.InstaImage"%>
<%@page import="com.kh.community.model.vo.Instagram"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	Instagram insta = (Instagram)request.getAttribute("insta");
	InstaImage img = (InstaImage)request.getAttribute("img");
%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Insert title here</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="../../resources/js/jquery-3.6.3.min.js"></script>
        <style>
            div {
                box-sizing: border-box;
                /* border: 1px solid rgb(168, 168, 168); */
            }

            #content {
                padding-left: 300px;
                padding-top: 50px;
            }

            button {
                width: 80px;
                height: 30px;
            }

            #brandBtn>button {
                height: 50px;
                width: 50px;
                border: 0px;
                border-radius: 50%;
            }

            img {
                width: 35px;
                height: 35px;
            }

            td {
                width: 160px;
                height: 50px;
                padding: 10px;
            }

            .container {
                width: 800px;
                height: 600px;
                /* border: 1px solid black; */
            }

            button {
                border: 1px solid black;
            }
            
			.tag, .uTags {
			  display: inline-block;
			  background-color: #ccc;
			  padding: 2px 6px;
			  margin: 4px;
			  border-radius: 4px;
			}
        </style>
    </head>

    <body>
        <%@ include file="../common/menubar.jsp"%>

            <!--content-->
            <div id="content">
                <h1>????????? ????????????</h1>
                <br>
                <form action="<%=contextPath%>/update.co" method="post" enctype="multipart/form-data">

					<input type="hidden" name="memNo" value="<%= loginUser.getMemNo() %>">
					<input type="hidden" name="cno" value="<%= insta.getComNo() %>">
					
                    <h3>??????</h3>
                    
                    <img id="preview" style="width: 200px; height: 200px;" data-bs-toggle="modal"
                        data-bs-target="#exampleModal" src="<%= img.getInstaImgChange()%><%= img.getInstaImgSrc() %>"> 
                        <input type="file" name="upfile" onchange="readURL(this);" data-width="300"
                        data-height="450" required> <br> <br>

                    <script>
                        /* function readURL(input) {
                            if (input.files && input.files[0]) {
                                var reader = new FileReader();
                                reader.onload = function (e) {
                                    document.getElementById('preview').src = e.target.result;
                                };
                                reader.readAsDataURL(input.files[0]);
                            } else {
                                document.getElementById('preview').src = "";
                            }
                        } */
                        
                        function readURL(input) {
                        	  if (input.files && input.files[0]) {
                        	    const reader = new FileReader();
                        	    reader.onload = function(e) {
                        	      const previewImg = document.getElementById('preview');
                        	      previewImg.setAttribute('src', e.target.result);
                        	    }
                        	    reader.readAsDataURL(input.files[0]);
                        	  }
                        	}
                    </script>

                    <!-- Modal -->
                    <div class="modal fade modal-dialog modal-xl" id="exampleModal" tabindex="-1"
                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">???????????????</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                            
                                                <table border="1">
                                                    <tr>
                                                        <td colspan="2">
                                                            <h5>????????? ??????</h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" id="brandBtn">
                                                            <button>
                                                                <img src="resources/img/insta/????????? (2).png" alt="">
                                                            </button>
                                                            <button>
                                                                <img src="resources/img/insta/???????????? (2).png" alt="">
                                                            </button>
                                                            <button>
                                                                <img src="resources/img/insta/???????????? (2).png" alt="">
                                                            </button>
                                                            <button>
                                                                <img src="resources/img/insta/oioi.png" alt="">
                                                            </button>
                                                            <button>
                                                                <img src="resources/img/insta/????????? (2).png" alt="">
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <h5>?????????</h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2"><input type="text" placeholder="?????????"
                                                                style="width: 250px; height: 35px;"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <h5>?????????</h5>
                                                        </td>
                                                        <td>
                                                            <h5>????????????</h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><select name="" id="" style="width: 100px; height: 35px;">
                                                                <option value="">Free</option>
                                                                <option value="">S</option>
                                                                <option value="">M</option>
                                                                <option value="">L</option>
                                                                <option value="">XL</option>
                                                            </select></td>
                                                        <td><select name="" id="" style="width: 100px; height: 35px;">
                                                                <option value="">?????????</option>
                                                                <option value="">??????</option>
                                                                <option value="">??????</option>
                                                                <option value="">??????</option>
                                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <h5>?????? ??????</h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2"><input type="text"
                                                                style="width: 250px; height: 35px;"></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <h5>????????????</h5>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2"><input type="url"
                                                                style="width: 250px; height: 35px;"></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" style="text-align: center;">
                                                            <!-- <button>??????</button>
                                                            <button>??????</button> -->
                                                        </td>
                                                    </tr>
                                                </table>
                                            
                                            </div>
                                            <div class="col">
                                                <div class="row back" style="height: 85%;">
                                                    <img id="modalImg" src="resources/6.jpg" alt=""
                                                        style="height: 600px; width: 550px;">
                                                </div>
                                                <div class="row"></div>
                                                
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
                                    <button type="button" class="btn btn-primary">??????</button>
                                </div>
                            </div>
                        </div>
                    </div>
					
					<script>
					function readURL(input) {
						  if (input.files && input.files[0]) {
						    const reader = new FileReader();
						    reader.onload = function(e) {
						      const previewImg = document.getElementById('preview');
						      previewImg.setAttribute('src', e.target.result);

						      const modalImg = document.getElementById('modalImg');
						      modalImg.setAttribute('src', e.target.result);
						    }
						    reader.readAsDataURL(input.files[0]);
						  }
						}
					</script>
					
                    <script>
                        const previewImage = document.querySelector("#preview");
                        const modal = document.querySelector("#exampleModal");

                        brandButtons.forEach((button) => {
                            previewImage.addEventListener("click", () => {
                                $(modal).modal("show");
                            });
                        });  	
                    </script>
                    <!-- <script>
							const brandButtons = document.querySelectorAll("#brandBtn button");

							const modal = document.querySelector("#exampleModal");

							brandButtons.forEach((button) => {
								button.addEventListener("click", () => {
									
										$(modal).modal("show");
									}
								});
							});
						</script> -->

					<% String instaId = (loginUser.getInstaId() == null ? "" : loginUser.getInstaId()); %>

                    <h3>??????</h3>
                    <h5>???????????? ??????????????????.</h5>
                    <textarea name="content"  id="" cols="100" rows="10" maxlength="300"><%= insta.getComContent() %></textarea>
                    <br> <br>
                    <h3>????????? ?????????</h3>
                    <h5>???????????? ????????? ???????????? ?????? ????????? ?????? ???????????????.</h5>
                    <input type="text" name="instaId" value="<%= instaId %>"> <br> <br>
                    <h3>?????? ??????</h3>

                    <input id="tag-input"placeholder="????????? ???????????????">
                    <input type="hidden" name="tags" >
					<div class="uTags" id="tag-container"><%= insta.getComTag() %></div>
					
					<script>
					const tagInput = document.getElementById('tag-input');
					const tagContainer = document.getElementById('tag-container');
					const tags = []; // ?????? ????????? ??????

					tagInput.addEventListener('keydown', function(event) {
					  if (event.keyCode === 13) {
					    event.preventDefault();
					    const tag = this.value.trim();
					    if (tag !== '') {
					      const tagEl = document.createElement('span');
					      tagEl.classList.add('tag');
					      
					      //input value() ?????? ???????????? .add()
					      
					      tagEl.textContent = '#' + tag;
					      tagContainer.appendChild(tagEl);
					      this.value = '';
					      tags.push(tag); // ????????? ?????? ????????? ??????
					      
					      
					    }
					  }
					});
					
					const hiddenInput = document.querySelector('input[name=tags]');
					
					setInterval(() => {
					  hiddenInput.value = Array.from(tagContainer.children).map(el => el.textContent).join(',');
					}, 1000);
					</script>

                    <br> <br> <br> <br> <input type="checkbox" required> ????????? ?????? ?????? (??????)
                    <h5>
                        - ???????????? 1??? 1?????? ???????????? ??? ????????????. <br> - ??????????????? ????????? ???, ?????? ??? ???????????? ????????? ??????
                        ?????? ?????? ????????? ?????? ?????? ???????????? ???????????? ????????? ??? ????????????.
                    </h5>
                    <br> <br>
                    <!-- <button onclick="goToMain();">??????</button> -->
                    <button type="reset">????????????</button>
                    <button>????????????</button>

					<!-- ?????? ?????? ?????? ??? ????????? ?????? ???????????? ???????????? -->
					<script>
						function goToMain() {
							location.href = "<%= contextPath %>/list.co";
						}
					</script>
                </form>
            </div>
            <script src="resources/js/dist/tag.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                crossorigin="anonymous"></script>
    </body>

    </html>