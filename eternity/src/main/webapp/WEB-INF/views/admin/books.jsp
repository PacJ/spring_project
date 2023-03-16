<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <div class="container-fluid mt-5 mb-5 content_area">
    <div class="card">
      <h5 class="card-header">도서관리</h5>

      <div class="card-body">

        <div class="row">
          <div class="col-md-6">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary fw-bold" data-bs-toggle="modal"
              data-bs-target="#bookSetModal">도서등록</button>

            <!-- Modal -->
            <div class="modal fade" id="bookSetModal" aria-hidden="true">
              <div class="modal-dialog" style="max-width: 700px;">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5">도서등록</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="step01 active">
                    <div class="modal-body text-start">
                      <form>
                        <div class="input-group mb-3">
                          <select class="form-select">
                            <option value="">제목</option>
                            <option value="">작성자</option>
                            <option value="">출판사</option>
                          </select>
                          <input type="text" class="form-control" placeholder="검색어를 입력하세요.">
                          <button class="btn btn-outline-primary" type="button">검색</button>
                        </div>
                      </form>

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
                      <button type="reset" class="btn btn-info book_reset_btn">재검색</button>
                    </div>
                  </div>

                  <form class="step02 active">
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
                      <button type="reset" class="btn btn-info book_reset_btn">재검색</button>
                      <input type="hidden" value="">
                      <button type="submit" class="btn btn-primary">등록</button>
                    </div>
                  </form>

                </div>
              </div>
            </div>
          </div>

          <div class="col-md-6">
            <form>
              <div class="input-group mb-3">
                <select class="form-select">
                  <option value="">제목</option>
                  <option value="">저자</option>
                  <option value="">출판사</option>
                </select>
                <input type="text" class="form-control" placeholder="검색어를 입력하세요.">
                <button class="btn btn-outline-primary" type="button">검색</button>
              </div>
            </form>
          </div>
        </div>

        <table class="table table-hover">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">제목</th>
              <th scope="col">저자</th>
              <th scope="col">출판사</th>
              <th scope="col">출판일자</th>
              <th scope="col">등록일자</th>
              <th scope="col" class=" text-end">〓</th>
              <th scope="col" class=" text-end">〓</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th class="align-middle" scope="row">1</th>
              <td class="align-middle">이건 책 제목입니다.</td>
              <td class="align-middle">김누구</td>
              <td class="align-middle">창작과 비평</td>
              <td class="align-middle">0000-00-00</td>
              <td class="align-middle">0000-00-00</td>
              <td class="align-middle text-end">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-warning fw-bold" data-bs-toggle="modal"
                  data-bs-target="#bookViewModal">상세</button>

                <!-- Modal -->
                <div class="modal fade" id="bookViewModal" aria-hidden="true">
                  <div class="modal-dialog" style="max-width: 700px;">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h1 class="modal-title fs-5">도서 상세</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body text-start book_view">
                        <img src="" alt="책 표지" />
                        <ul>
                          <li>ISBN : <span>여기에 데이터 넣을 것</span></li>
                          <li>제목 : <span></span></li>
                          <li>저자 : <span></span></li>
                          <li>출판사 : <span></span></li>
                          <li>출판일자 : <span></span></li>
                          <li>도서소개 : <span></span></li>
                          <li>표지 URL : <span></span></li>
                          <li>분류기호 : <span></span></li>
                          <li>입고일 : <span></span></li>
                          <li>도서상태 : <span>대출 가능, 대출 불가능, 예약</span></li>
                        </ul>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      </div>
                    </div>
                  </div>
                </div>
              </td>
              <td class="align-middle text-end">
                <button type="button" class="btn btn-danger fw-bold" data-bs-toggle="modal"
                  data-bs-target="#bookDelModal">삭제</button>

                <div class="modal fade" id="bookDelModal" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h1 class="modal-title fs-5">도서 삭제</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body text-start">
                        <p>선택하신 도서를 삭제하시겠습니까?</p>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        <form>
                          <input type="hidden" value="">
                          <button type="button" class="btn btn-danger">삭제</button>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </td>
            </tr>
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
            <li class="page-item active"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
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