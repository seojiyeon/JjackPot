<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<title>메일</title>
</head>

<body>
	<div>
		<form action="sendMailPro.jp" method="post">
			<table>
				<tr>
					<th colspan="2">메일 보내기</th>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="보내기" />
					</td>
				</tr>
				<tr>
					<td>보내는 사람</td>
					<td>
						<input type="text" name="mail_send" />
					</td>
				</tr>
				<tr>
					<td>받는 사람</td>
					<td>
						<input type="checkbox" value="ToMe" />나에게
						&nbsp;
						<input type="text" name="mail_rec" />
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="mail_title" />
					</td>
				</tr>
				<tr>
					<td>
						<textarea rows="10" cols="10" name="mail_content" ></textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>