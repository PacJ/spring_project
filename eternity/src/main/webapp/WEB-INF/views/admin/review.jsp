<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <div class="container-fluid mt-5 mb-5 content_area">
    <div class="card">
      <h5 class="card-header">도서후기관리</h5>
      <div class="card-body">

        <div class="row">
          <div class="col-md-6"></div>
          <div class="col-md-6">
            <form>
              <div class="input-group mb-3">
                <select class="form-select">
                  <option value="">도서명</option>
                  <option value="">작성회원아이디</option>
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
              <th scope="col">ISBN</th>
              <th scope="col">도서명</th>
              <th scope="col">작성자 ID</th>
              <th scope="col">별점</th>
              <th scope="col">작성일자</th>
              <th scope="col">〓</th>
              <th scope="col">〓</th>
            </tr>
          </thead>
          <tbody>
            <!-- 반복 -->
            <tr>
              <th class="align-middle" scope="row">1</th>
              <td class="align-middle">1110001110001</td>
              <td class="align-middle">책 제목입니다.</td>
              <td class="align-middle">abc1234</td>
              <td class="align-middle">5/5</td>
              <td class="align-middle">0000-00-00</td>
              <td class="align-middle text-end">
                <button type="button" class="btn btn-warning fw-bold" data-bs-toggle="modal"
                  data-bs-target="#bookReviewModal">상세</button>

                <div class="modal fade" id="bookReviewModal" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h1 class="modal-title fs-5">도서 후기 상세</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body text-start">
                        <ul class="bookreview_box">
                          <li>ISBN : <span>여기에 내용 삽입</span></li>
                          <li>도서명 : <span></span></li>
                          <li>작성자 ID : <span></span></li>
                          <li>작성일자 : <span></span></li>
                          <li>별점 : <span></span></li>
                          <li>후기내용 : <span></span></li>
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
                  data-bs-target="#bookReviewDelModal">삭제</button>

                <div class="modal fade" id="bookReviewDelModal" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h1 class="modal-title fs-5">도서 후기 삭제</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body text-start">
                        <p>선택하신 도서 후기를 삭제하시겠습니까?</p>
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