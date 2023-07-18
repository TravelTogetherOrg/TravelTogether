window.onload = function() {
    var passwordInput = document.getElementById('password');
    var passwordConfirmInput = document.getElementById('password2');


    function validatePassword() {
      var password = passwordInput.value;
      var passwordConfirm = passwordConfirmInput.value;

      var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$/;

      if (!passwordPattern.test(password)) {
        alert('비밀번호는 8~12자의 영문, 숫자, 특수문자(@$!%*#?&)를 포함해야 합니다.');
        passwordInput.value = '';
      } else if (password !== passwordConfirm) {
        alert('비밀번호와 비밀번호 재확인이 일치하지 않습니다.');
        
        passwordConfirmInput.value = '';
      }
    }


    passwordInput.onblur = validatePassword;
    passwordConfirmInput.onblur = validatePassword;
  };
