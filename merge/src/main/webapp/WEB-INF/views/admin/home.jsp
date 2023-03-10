<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

  <div class="container mt-5">
    <div class="row">
      <div class="col-sm-6 mb-3 mb-sm-0">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">로그인</h5>
            <p class="card-text">관리자 로그인을 해주세요.</p>

            <form>
              <div class="mb-3">
                <input type="text" class="form-control" placeholder="아이디를 입력하세요.">
              </div>
              <div class="mb-3">
                <input type="password" class="form-control" placeholder="비밀번호를 입력하세요.">
              </div>
              <div class="bd-callout bd-callout-warning">
                <strong>Heads up!</strong> There’s currently no support for a CSS-native <code>color-contrast</code>
                function, so we use our own via Sass. This means that customizing our theme colors via CSS variables may
                cause color contrast issues with these utilities.
              </div>
              <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary fw-bold">로그인</button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">회원가입</h5>
            <p class="card-text">관리자 회원가입을 해주세요.</p>
            <form>
              <div class="input-group mb-3">
                <span class="input-group-text">아이디</span>
                <input type="text" class="form-control" placeholder="아이디를 입력하세요.">
                <button class="btn btn-outline-secondary" type="button">중복확인</button>
              </div>
              <div class="input-group mb-3">
                <span class="input-group-text">비밀번호</span>
                <input type="password" class="form-control" placeholder="비밀번호를 입력하세요.">
              </div>
              <div class="input-group mb-3">
                <span class="input-group-text">비밀번호 재확인</span>
                <input type="password" class="form-control" placeholder="비밀번호를 다시 입력하세요.">
              </div>
              <div class="input-group mb-3">
                <span class="input-group-text">성명</span>
                <input type="text" class="form-control" placeholder="성명 입력하세요.">
              </div>
              <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary fw-bold">회원가입</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>