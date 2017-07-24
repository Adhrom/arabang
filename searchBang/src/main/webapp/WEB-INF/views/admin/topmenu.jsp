<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#topMenu {
	height: 40px; /* ���� �޴��� ���� */
	width: 1000px; /* ���� �޴��� ���� */
}

#topMenu ul { /* ���� �޴� ���� ul�� ������: �����޴��� ul+���� �޴��� ul */
	list-style-type: none; /* ���� �޴� ���� ul ������ ��� ǥ�ø� ������ */
	margin: 0px; /* ���� �޴� ���� ul�� margin�� ���� */
	padding: 0px; /* ���� �޴� ���� ul�� padding�� ���� */
}

#topMenu ul li { /* ���� �޴� �ȿ� ul �±� �ȿ� �ִ� li �±��� ��Ÿ�� ����(����/�����޴� ���) */
	color: white; /* �۾� ���� ������� ���� */
	background-color: #00a699; /* ��� ���� RGB(2D2D2D)�� ���� */
	float: left; /* �������� �����ǵ��� ���� */
	line-height: 40px; /* �ؽ�Ʈ �� ���� ���̸� 30px�� ���� */
	vertical-align: middle; /* ���� ������ ����� ���� */
	text-align: center; /* �ؽ�Ʈ�� ����� ���� */
	position: relative; /* �ش� li �±� ������ top/left ������ �ʱ�ȭ */
}

.menuLink, .submenuLink { /* ���� �޴��� ���� �޴��� a �±׿� �������� ������ ��Ÿ�� */
	text-decoration: none; /* a �±��� �ٹ� ȿ�� ���� */
	display: block; /* a �±��� Ŭ�� ������ ���� */
	width: 150px; /* �⺻ ���̸� 150px�� ���� */
	font-size: 12px; /* ��Ʈ ����� 12px�� ���� */
	font-family: "Trebuchet MS", Dotum; /* �⺻ ��Ʈ�� ����/�ѱ� ������� ���� */
}

.menuLink { /* ���� �޴��� �۾����� ������� ���� */
	color: white;
}

.topMenuLi:hover .menuLink { /* ���� �޴��� li�� ���콺���� �Ǿ��� �� ��Ÿ�� ���� */
	font-weight: bold; /* ��Ʈ�� ���� ���� */
}

.submenuLink { /* ���� �޴��� a �±� ��Ÿ�� ���� */
	color: #2d2d2d; /* �۾� ���� RGB(2D2D2D)�� ���� */
	background-color: white; /* ������ ������� ���� */
	border: solid 1px #dddddd;  �׵θ��� ���� */
	margin-top: -1px; /* �� ĭ�� �ϴ� �׵θ��� �Ʒ�ĭ�� ��� �׵θ��� ���������� ���� */
}

.longLink { /* �� �� �� �޴� ��Ÿ�� ���� */
	width: 150px; /* ���̴� 190px�� ���� */
}

.submenu { /* ���� �޴� ��Ÿ�� ���� */
	position: absolute; /* html�� flow�� ������ ��ġ�� �ʰ� absolute ���� */
	height: 0px; /* �ʱ� ���̴� 0px�� ���� */
	overflow: hidden; /* �� ������ ���̺��� Ŀ���� �ش� ���� ���� */
	transition: height .2s; /* height�� ��ȭ ������ �� 0.2�ʰ� ��ȭ �ǵ��� ����(�⺻) */
	-webkit-transition: height .2s;
	/* height�� ��ȭ ������ �� 0.2�ʰ� ��ȭ �ǵ��� ����(������ ũ��/���Ķ��) */
	-moz-transition: height .2s;
	/* height�� ��ȭ ������ �� 0.2�ʰ� ��ȭ �ǵ��� ����(������ ����) */
	-o-transition: height .2s;
	/* height�� ��ȭ ������ �� 0.2�ʰ� ��ȭ �ǵ��� ����(������ �����) */
}

.topMenuLi:hover .submenu { /* ���� �޴��� ���콺 ����� ��� �� ���� ���� �޴� ��Ÿ�� ���� */
	height: 130px; /* ���̸� 130px�� ���� */
}

.submenuLink:hover { /* ���� �޴��� a �±��� ���콺 ���� ��Ÿ�� ���� */
	color: red; /* �۾����� ���������� ���� */
	background-color: #dddddd; /* ����� RGB(DDDDDD)�� ���� */
}
</style>
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
</head>
<body>
	<div id="topMenu">
		<ul>
			<li class="topMenuLi"><a class="menuLink" href="#">��������</a>
				<ul class="submenu">
					<li><a href="#" class="submenuLink longLink">����������</a></li>
					<li><a href="#" class="submenuLink longLink">��ü��������</a></li>
				</ul></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="#">��ü����</a>
				<ul class="submenu">
					<li><a href="#" class="submenuLink longLink">��ü����/����</a></li>
					<li><a href="#" class="submenuLink longLink">��ü����Ʈ</a></li>
					<li><a href="#" class="submenuLink longLink">��ü���</a></li>
				</ul></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="#">������</a>
				<ul class="submenu">
					<li><a href="#" class="submenuLink">������Ʈ</a></li>
					<li><a href="#" class="submenuLink">�����</a></li>
				</ul></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="#">�������</a></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="#">�����ڵ��</a></li>
			<li>|</li>
			<li class="topMenuLi"><a class="menuLink" href="#">�α׾ƿ�</a></li>
		</ul>
	</div>
</body>
</html>