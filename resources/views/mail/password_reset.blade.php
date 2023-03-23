{{-- 
<br>
<a href="http://localhost:4200/reset-password?token={{ $token }}" target="_blank" style="color:#FFF;border-color:#22bc66;border-style:solid;border-width:10px 180px; background-color:#22bc66;display:inline-block;text-decoration:none;border-radius:3px;box-shadow:0 2px 3px rgba(0,0,0,0.16);-webkit-text-size-adjust:none;box-sizing:border-box">Reset Password</a>
<br>
<p>If you did not request for a password reset, please ignore this email</p>

 --}}

 <p>We are received a request to reset the password for <b>Authify</b> account associated with {{ $user->email }} <br> You can reset your password by clicking the button below.</p>
 <br>
 <a href="http://localhost:4200/reset-password?token={{ $token }}" target="_blank" style="color:#FFF;border-color:#22bc66;border-style:solid;border-width:10px 180px; background-color:#22bc66;display:inline-block;text-decoration:none;border-radius:3px;box-shadow:0 2px 3px rgba(0,0,0,0.16);-webkit-text-size-adjust:none;box-sizing:border-box">Reset Password</a>
 <br>
 <p>If you did not request for a password reset, please ignore this email</p>




{{-- 
 <p>You requested password rest of your account. If you want to change password <a href="http://localhost:4200/reset-password?token={{$token}}">click</a> here.</p>

or, copy and paste the URL below into your web browser: http://localhost:4200/reset-password?token={{$token}} --}}
