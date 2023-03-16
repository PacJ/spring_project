<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <div class="container-fluid mt-5 mb-5 content_area">
    <div class="card">
      <h5 class="card-header">도서신청관리</h5>
      <div class="card-body">

        <div class="row">
          <div class="col-md-6"></div>
          <div class="col-md-6">
            <form>
              <div class="input-group mb-3">
                <select class="form-select">
                  <option value="">도서명</option>
                  <option value="">처리상태</option>
                  <option value="">신청회원아이디</option>
                </select>
                <input type="text" class="form-control" placeholder="검색어를 입력하세요.">
                <button class="btn btn-outline-primary" type="button">검색</button>
              </div>
            </form>
          </div>
        </div>

        <table class="table table-hover">ISBN
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">ISBN</th>
              <th scope="col">도서명</th>
              <th scope="col">저자</th>
              <th scope="col">신청회원 ID</th>
              <th scope="col">신청일</th>
              <th scope="col">반영일</th>
              <th scope="col">반영상태</th>
              <th scope="col" class="text-end">〓</th>
            </tr>
          </thead>
          <tbody>
            <!-- 반복 -->
            <tr>
              <th class="align-middle" scope="row">1</th>
              <td class="align-middle">1110001110001</td>
              <td class="align-middle">책 제목입니다.</td>
              <td class="align-middle">김누구</td>
              <td class="align-middle">abc1234</td>
              <td class="align-middle">0000-00-00</td>
              <td class="align-middle">0000-00-00</td>
              <td class="align-middle">반려</td>
              <td class="align-middle text-end">
                <!-- 처리한 건의 경우 이 영역 비워 둠(-)  -->
                <button type="button" class="btn btn-warning fw-bold" data-bs-toggle="modal"
                  data-bs-target="#requestModal">처리</button>

                <!-- Modal -->
                <div class="modal fade" id="requestModal" aria-hidden="true">
                  <div class="modal-dialog" style="max-width: 700px;">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h1 class="modal-title fs-5">도서신청 처리</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>

                      <div class="request_step01 active">
                        <div class="modal-body text-start">
                          <h4>도서신청정보</h4>
                          <ul>
                            <li>ISBN : <span>여기에 신청데이터</span></li>
                            <li>도서명 : <span></span></li>
                            <li>저자 : <span></span></li>
                            <li>신청회원 ID : <span></span></li>
                            <li>신청사유 : <span></span></li>
                            <li>신청일 : <span></span></li>
                            <li>반영일 : <span></span></li>
                          </ul>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                          <form>
                            <input type="hidden" value="" />
                            <button type="reset" class="btn btn-info">반려</button>
                          </form>
                          <button type="reset" class="btn btn-primary">신청도서조회</button>
                        </div>
                      </div>

                      <div class="request_step02 active">
                        <div class="modal-body text-start">
                          <div class="search_box">
                            <div>
                              <button type="button">선택</button>
                              <img src="">
                              <ul>
                                <li>제목</li>
                                <li>저자 리스트</li>
                                <li>도서 출판사</li>
                                <li>출판일자</li>
                              </ul>
                            </div>
                            <div>
                              <button type="button">선택</button>
                              <img src="">
                              <ul>
                                <li>제목</li>
                                <li>저자 리스트</li>
                                <li>도서 출판사</li>
                                <li>출판일자</li>
                              </ul>
                            </div>
                            <div>
                              <button type="button">선택</button>
                              <img src="">
                              <ul>
                                <li>제목</li>
                                <li>저자 리스트</li>
                                <li>도서 출판사</li>
                                <li>출판일자</li>
                              </ul>
                            </div>
                            <div>
                              <button type="button">선택</button>
                              <img src="">
                              <ul>
                                <li>제목</li>
                                <li>저자 리스트</li>
                                <li>도서 출판사</li>
                                <li>출판일자</li>
                              </ul>
                            </div>
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                          <button type="reset" class="btn btn-info">뒤로</button>
                        </div>
                      </div>

                      <form class="request_step03 active">
                        <div class="modal-body text-start">
                          <div class="input-group mb-3">
                            <span class="input-group-text">ISBN</span>
                            <input type="text" class="form-control" value="" readonly>
                          </div>
                          <div class="input-group mb-3">
                            <span class="input-group-text">제목</span>
                            <input type="text" class="form-control" value="" readonly>
                          </div>
                          <div class="input-group mb-3">
                            <span class="input-group-text">저자</span>
                            <input type="text" class="form-control" value="" readonly>
                          </div>
                          <div class="input-group mb-3">
                            <span class="input-group-text">출판사</span>
                            <input type="text" class="form-control" value="" readonly>
                          </div>
                          <div class="input-group mb-3">
                            <span class="input-group-text">도서소개</span>
                            <textarea class="form-control" rows="10" readonly></textarea>
                          </div>
                          <div class="input-group mb-3">
                            <span class="input-group-text">표지 URL</span>
                            <input type="text" class="form-control" value="" readonly>
                          </div>
                          <div class="input-group mb-3">
                            <span class="input-group-text">분류기호</span>
                            <input type="text" class="form-control" value="" readonly>
                          </div>
                          <div class="input-group mb-3">
                            <span class="input-group-text">등록수량</span>
                            <input type="number" class="form-control" value="" placeholder="등록 수량을 입력하세요.">
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                          <button type="reset" class="btn btn-info request_reset_btn">재검색</button>
                          <input type="hidden" value="">
                          <button type="submit" class="btn btn-primary">등록</button>
                        </div>
                      </form>

                    </div>
                  </div>
                </div>
              </td>
            </tr>
            <!-- 반복 -->
          </tbody>
        </table>
        <nav aria-label="Page navigation example">
          <ul class="pagination justify-content-center">
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&lsaquo;</span>
              </a>
            </li>
            <li class="page-item active">
              <a class="page-link" href="#">1</a>
            </li>
            <li class="page-item">
              <a class="page-link" href="#">2</a>
            </li>
            <li class="page-item">
              <a class="page-link" href="#">3</a>
            </li>
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&rsaquo;</span>
              </a>
            </li>
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>