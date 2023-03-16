<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <div class="container-fluid mt-5 mb-5 content_area">
    <div class="card">
      <h5 class="card-header">공지사항관리</h5>

      <div class="card-body">

        <div class="row">
          <div class="col-md-6">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary fw-bold" data-bs-toggle="modal"
              data-bs-target="#noticeSetModal">글쓰기</button>

            <!-- Modal -->
            <div class="modal fade" id="noticeSetModal" aria-hidden="true">
              <div class="modal-dialog" style="max-width: 700px;">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5">공지사항 작성</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>

                  <form>
                    <div class="modal-body text-start">
                      <div class="input-group mb-3">
                        <span class="input-group-text">제목</span>
                        <input type="text" class="form-control" placeholder="제목을 입력하세요.">
                      </div>
                      <div class="input-group mb-3">
                        <div class="input-group-text">
                          <input class="form-check-input mt-0" type="checkbox" value="">
                        </div>
                        <p class="form-control mb-0">게시판 상단 고정</p>
                      </div>
                      <div class="input-group mb-3">
                        <span class="input-group-text">본문</span>
                        <textarea class="form-control" rows="10"></textarea>
                      </div>
                      <div class="input-group mb-3">
                        <span class="input-group-text">본문 이미지</span>
                        <input class="form-control" type="file" id="formFile">
                      </div>
                      <div class="input-group mb-3">
                        <span class="input-group-text">첨부파일</span>
                        <input class="form-control" type="file" id="formFile">
                      </div>
                      <div class="input-group mb-3">
                        <span class="input-group-text">작성(수정)자</span>
                        <input type="text" class="form-control" value="작성자" readonly>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
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
                  <option value="">작성자</option>
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
              <th scope="col">고정</th>
              <th scope="col">제목</th>
              <th scope="col">작성자</th>
              <th scope="col">작성일자</th>
              <th scope="col" class=" text-end">〓</th>
              <th scope="col" class=" text-end">〓</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th class="align-middle" scope="row">1</th>
              <td class="align-middle">Y</td>
              <td class="align-middle">이건 공지사항 제목입니다.</td>
              <td class="align-middle">김누구</td>
              <td class="align-middle">0000-00-00</td>
              <td class="align-middle text-end">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-warning fw-bold" data-bs-toggle="modal"
                  data-bs-target="#noticeModModal">상세/수정</button>

                <!-- Modal -->
                <div class="modal fade" id="noticeModModal" aria-hidden="true">
                  <div class="modal-dialog" style="max-width: 700px;">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h1 class="modal-title fs-5">공지사항 상세/수정</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <form>
                        <div class="modal-body text-start">
                          <div class="input-group mb-3">
                            <span class="input-group-text">제목</span>
                            <input type="text" class="form-control" placeholder="제목을 입력하세요.">
                          </div>
                          <div class="input-group mb-3">
                            <div class="input-group-text">
                              <input class="form-check-input mt-0" type="checkbox" value="">
                            </div>
                            <p class="form-control mb-0">게시판 상단 고정</p>
                          </div>
                          <div class="input-group mb-3">
                            <span class="input-group-text">본문</span>
                            <textarea class="form-control" rows="10"></textarea>
                          </div>
                          <div class="input-group mb-3">
                            <span class="input-group-text">본문 이미지</span>
                            <input class="form-control" type="file" id="formFile">
                          </div>
                          <div class="input-group mb-3">
                            <span class="input-group-text">첨부파일</span>
                            <input class="form-control" type="file" id="formFile">
                          </div>
                          <div class="input-group mb-3">
                            <span class="input-group-text">작성(수정)자</span>
                            <input type="text" class="form-control" value="작성자" readonly>
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                          <input type="hidden" value="">
                          <button type="button" class="btn btn-warning">수정</button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </td>
              <td class="align-middle text-end">
                <button type="button" class="btn btn-danger fw-bold" data-bs-toggle="modal"
                  data-bs-target="#noticeDelModal">삭제</button>

                <div class="modal fade" id="noticeDelModal" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h1 class="modal-title fs-5">공지사항 삭제</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body text-start">
                        <p>선택하신 공지사항을 삭제하시겠습니까?</p>
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