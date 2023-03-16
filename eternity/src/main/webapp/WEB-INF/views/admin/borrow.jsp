<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <div class="container-fluid mt-5 mb-5 content_area">
    <div class="card">
      <h5 class="card-header">도서대출관리</h5>
      <div class="card-body">

        <div class="row">
          <div class="col-md-6"></div>
          <div class="col-md-6">
            <form>
              <div class="input-group mb-3">
                <select class="form-select">
                  <option value="">도서명</option>
                  <option value="">대출상태</option>
                  <option value="">대출회원아이디</option>
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
              <th scope="col">도서번호</th>
              <th scope="col">도서명</th>
              <th scope="col">회원아이디</th>
              <th scope="col">대출일</th>
              <th scope="col">반납예정일</th>
              <th scope="col">반납일</th>
              <th scope="col">반납연장여부</th>
              <th scope="col">대출상태</th>
            </tr>
          </thead>
          <tbody>
            <!-- 반복 -->
            <tr>
              <th class="align-middle" scope="row">1</th>
              <td class="align-middle">111</td>
              <td class="align-middle">책 제목입니다.</td>
              <td class="align-middle">abc1234</td>
              <td class="align-middle">0000-00-00</td>
              <td class="align-middle">0000-00-00</td>
              <td class="align-middle"></td>
              <td class="align-middle">Y</td>
              <td class="align-middle">대출</td>
            </tr>
            <!-- 반복 -->
            <tr>
              <th class="align-middle" scope="row">1</th>
              <td class="align-middle">111</td>
              <td class="align-middle">책 제목입니다.</td>
              <td class="align-middle">abc1234</td>
              <td class="align-middle">0000-00-00</td>
              <td class="align-middle">0000-00-00</td>
              <td class="align-middle">0000-00-00</td>
              <td class="align-middle">Y</td>
              <td class="align-middle">반납</td>
            </tr>
            <tr>
              <th class="align-middle" scope="row">1</th>
              <td class="align-middle">111</td>
              <td class="align-middle">책 제목입니다.</td>
              <td class="align-middle">abc1234</td>
              <td class="align-middle"></td>
              <td class="align-middle"></td>
              <td class="align-middle"></td>
              <td class="align-middle">N</td>
              <td class="align-middle">예약</td>
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