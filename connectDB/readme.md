# STS툴로 properties없이 db와 연결하기
# 연결하면서 생길수 있는 오류들도 적었기에 길게 느껴질 수 도 있지만 빠르게 보려면 3.부터 보면 됩니다
## 1.레거시 프로젝트생성
	File > new > SpringLegacy project 
	프로젝트 네임 적어주고
	하단에 persistance > Spring MVC project 누르고 next
	하면 toplevel Pacakge를 적어달라고 한다
	com.test.controller
	이런식으로 적으면 controller가 가장 최상위 패키지로 자리잡게된다
	
	우리가 할건 controller를 모듈로 잡을것이 아니기때문에
	해당 프로젝트 우측마우스 클릭 후 properties > web project setting > contextRoot에 해당프로젝트 이름을 적어주면 좋다
	(필수는아님)
	이렇게 할 경우
	pom.xml 에서 artifactID(고유아이디)도 프로젝트 이름으로 바꿔줘야한다
	이작업을 안해줄시 서버에서 홈컨트롤러 위치를 controller로 생성해
	다른서버랑 겹치면(아티팩트아이디 같을시) modules에서 충돌이 일어날 수 있는것
	
	
## 2.아파치톰캣 서버설정
	먼저 해당 프로젝트 우측마우스 클릭 후
	properties에 들어가 Project faceset을 누른 후
	dynamic webmodule , java , javascript버전을 확인해준후
	이 글 작성 시점으로 웹모듈 4.0 자바 11 자바스크립트 1.0으로 해놨다
	페이스셋에서 버전을 바꿧다면 apply and close를 누르고
	밖으로 나와 좌측하단 Servers탭에서 오른쪽마우스 클릭 후
	New > Server > 가장맨위 아파치톰캣 누른 후 사용할 톰캣버전을 클릭 후
	미리 받아놓은 톰캣이있다면 경로를 설정하고 확인을 눌러 추가한다
	그다음 해당프로젝트 오른쪽 마우스 클릭 후 Run as > Run on server를 누른다
	
	혹여나 포트충돌 오류가 뜬다면
	좌측하단 Servers탭에서 아까 추가한 톰캣 v~ Server at local host라 써있는것을 더블클릭 후
	우측에 보이는 포트(Ports) 를 바꿔줘야하는데 기본값은 8005 , 8080일것이다
	각각 15정도씩 더해서 8020, 8095정도로 맞추면 웬만하면 다 돌아갈듯싶다
	
	혹여나 포트번호를 죽여야하는 상황이라면
	cmd를 관리자로 실행 후
	taskkill /f /pid 해당포트번호
	를 치면 해당 포트를 끌 수 있다
	
	런온서버까지 되는걸 확인했다면 3단계로

## 3. pom.xml설정하기 공용
	pom.xml에 자바버전이 지금 사용버전과 다르면 오류가 날수있기때문에
	중간이 이 설명을 추가했다
	java 11 버전 기준으로 해당프로젝트 properties > project faceset에서
	java 버전을 11로 바꾸고
	pom.xml로 와서
	properties > java-version 을 11로 입력해주고 아래쪽
	plugins > plugin > artifactId가  maven-compiler-plugin인것의
	configuration 에 써있는 source와 target을 11로 맞춰준다

## 4. pom.xml설정하기 - MySQL
	우선 MySQL Connector java라는것을 pom.xml에서 주입받아야한다
	mvnRepository에서 긁어오면 되는데
	모든게 소문자라는것을 유의해서 외워도 쉽게 외워지는편이다
	사용자가 많은 8.0.33버전으로 갖고오겠다
	<dependency>
		<groupId>mysql<groupId>
		<artifactId>mysql-connector-java</artifactId>
		<version>8.0.33</version>
	</dependency>
	pom.xml에 이것을 추가 후
	다시 런온서버를 해서 서버가 아직도 잘 돌아가나 확인해봐야한다
	안될 시 고치려하지말고 새로 프로젝트 만드는게 빠르니 새로만들것
	
	
## 5. JUnit 테스트 페이지 작성
	src/test/java에 들어가 test패키지를 만들어 준 후
	거기에 JUnit테스트 를 생성해준다
	
---
# 각 DB종류별

## mySQL
	private final static String DRIVER = "com.mysql.cj.jdbc.Driver";
	private final static String URL = "jdbc:mysql://localhost:3306/데이터베이스이름";
	private final static String USER = "root";
	private final static String USER = "1234";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
## Oracle SQL
	private final static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final static String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final static String USER = "유저네임";
	private final static String PASS = "패스워드";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
## MariaDB
	private final static String DRIVER = "org.mariadb.jdbc.Driver";
	private final static String URL = "jdbc:mariadb://127.0.0.1:3308/데이터베이스이름 ";
	private final static String USER = "root";
	private final static String PASS = "1234";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
## PostGre
	private final static String DRIVER = "org.postgresql.Driver";
	private final static String URL = "jdbc:postgresql://localhost/데이터베이스이름";
	private final static String USER = "postgres";
	private final static String PASS = "1234";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
---

## 5. 공통부분 이어서 - select구문 기본구조
	@Test 안에 있는 곳으로가서
	try{
		Class.forName(DRIVER); ----해당 DB 드라이버 로딩
		try{
			conn = DriverManager.getConnection(URL,USER,PASS); ---DB연결
			try{
				pstmt = conn.preparedStatement("실행할 sql문");
				rs = pstmt.executeQuery();
				while(rs.next()){
					rs.getString("컬럼명"); -- text,varchar등등 string값일경우
					rs.getInt("컬럼명"); -- int, number 등 int값 일경우
				}
				
				rs.close();
				pstmt.close();
				conn.close();
				닫는것은 열은것의 역순
			}catch(Exception e){
			
			}
		}catch(Exception e){
		
		}
	}catch(Exception e){
	
	}
	
## 6-1. select 예제 - SQL문
	mySQL에 
	create database connectDB;
	use connectDB;
	로 DB를 만들고 그곳에 테이블을 만들어 사용할경우
	
	테이블과 더미데이터 작성
	create table test1(id text, name text, pw int);
	insert into test1 values('test01','테스트',1234);
	
## 6-2. select 예제 - MYSQL_JUnit 테스트
	public class MySQL_SelectTest {
		private final static String DRIVER ="com.mysql.cj.jdbc.Driver";
		private final static String URL="jdbc:mysql://localhost:3306/connectDB";
		private final static String USER="root";
		private final static String PASS="1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		@Test
		public void test() {
			try {
				Class.forName(DRIVER);
				try {
					conn = DriverManager.getConnection(URL,USER,PASS);
						try {
							pstmt = conn.prepareStatement("select * from test1");
							rs = pstmt.executeQuery();
							if(rs!=null) {
								System.out.println("DB에 잘 연결되었습니다");
							}
							while(rs.next()) {
								System.out.println("--------------------------");
								System.out.println("id : " + rs.getString("id"));
								System.out.println("name : " + rs.getString("name"));
								System.out.println("pw : " + rs.getInt("pw"));
								System.out.println("--------------------------");
							}
							
							rs.close();
							pstmt.close();
							conn.close();
						} catch (Exception e) {
							System.out.println("쿼리 전송 실패"+e);
					}
				} catch (Exception e) {
					System.out.println("DB연결 실패"+e);
				}
			} catch (Exception e) {
				System.out.println("드라이버 로딩 실패"+e);
			}
		}
	}
## 6-3. select 예제 - MYSQL_JUnit 테스트결과
	DB에 잘 연결되었습니다
	--------------------------
	id : test01
	name : 테스트
	pw : 1234
	--------------------------

	
## 7-1. insert 예제
	public class MySQL_InsertTest {
		private final static String DRIVER = "com.mysql.cj.jdbc.Driver";
		private final static String URL = "jdbc:mysql://localhost:3306/connectDB";
		private final static String USER = "root";
		private final static String PASS = "1234";
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;
		
		
		@Test
		public void test() {
			int sw=0;
			try {
				Class.forName(DRIVER);
				try {
					conn = DriverManager.getConnection(URL,USER,PASS);
					try {
						pstmt = conn.prepareStatement("insert into test1 values(?,?,?)");
						pstmt.setString(1, "test02");
						pstmt.setString(2, "테스트2");
						pstmt.setInt(3, 1234);
						sw=pstmt.executeUpdate();
						if(sw>0) {
							System.out.println(sw+"개의 행이 삽입되었습니다");
						}
						
						pstmt.close();
						conn.close();
					} catch (Exception e) {
						System.out.println("sql전송실패"+e);
					}
				} catch (Exception e) {
					System.out.println("DB연결실패"+e);
				}
			} catch (Exception e) {
				System.out.println("드라이버 로딩실패"+e);
			}
		}
	
	}
	
## 7-2. insert 테스트 결과
	1개의 행이 삽입되었습니다.
	
## 7-3. insert 테스트를 한후 다시 selectTest를 실행시켰을때
	DB에 잘 연결되었습니다
	--------------------------
	id : test01
	name : 테스트
	pw : 1234
	--------------------------
	--------------------------
	id : test02
	name : 테스트2
	pw : 1234
	--------------------------

	물론 sql에서도 확인이 가능하다
	
# 중간단계를 마치며
	select 조회시에 rs로 불러온다는것
	pstmt = conn.prepareStatement("SQL문") 을 할 시
	SQL문에 ?가 들어간다면
	pstmt.setString , pstmt.setInt 등으로 ?값을 대체할수 있다는것
	다 끝난후 close로 닫아야한다는 점 등등을 고려해야한다
	
---
	
## Test를 해보았으니 jsp로 올리는것을 설명
	회사 면접시 DAO Service DTO등을 이용하여 할지는 모르겠으나
	가장 간단한 방법으로 먼저 설명을하겠다 - DAO와 Service는 안쓰고 Controller에서 모든걸 보내는방법
	먼저 DTO패키지와 Controller패키지를 작성해준후
	DTO패키지에는 id name pw를 작성해준다
	

	
### DTO예제
	public class Test1DTO {
		private String id;
		private String name;
		private int pw;
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getPw() {
			return pw;
		}
		public void setPw(int pw) {
			this.pw = pw;
		}
		
	}
	
---
---
---
---

# DAO SERVICE 없이 6-1을 이용해서 Controller만으로 데이터 불러오기
## TestController_NoneDAO.java 라는 컨트롤러를 만들어서 그안의 예제

	@Controller
	public class TestController_NoneDAO {
	
		private final static String DRIVER ="com.mysql.cj.jdbc.Driver";
		private final static String URL="jdbc:mysql://localhost:3306/connectDB";
		private final static String USER="root";
		private final static String PASS="1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		@RequestMapping("select")
		public void selectTest(Model model) {
			List<Test1DTO> list = new ArrayList<>();
			try {
				Class.forName(DRIVER);
				try {
					conn = DriverManager.getConnection(URL,USER,PASS);
						try {
							pstmt = conn.prepareStatement("select * from test1");
							rs = pstmt.executeQuery();
							if(rs!=null) {
								System.out.println("DB에 잘 연결되었습니다");
							}
							while(rs.next()) {
								Test1DTO test1 = new Test1DTO();
								test1.setId(rs.getString("id"));
								test1.setName(rs.getString("name"));
								test1.setPw(rs.getInt("pw"));
								list.add(test1);
							}
							
							rs.close();
							pstmt.close();
							conn.close();
						} catch (Exception e) {
							System.out.println("쿼리 전송 실패"+e);
					}
				} catch (Exception e) {
					System.out.println("DB연결 실패"+e);
				}
			} catch (Exception e) {
				System.out.println("드라이버 로딩 실패"+e);
			}
			model.addAttribute("list", list);
		}
	}
	
## 불러오는 jsp예제
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>test1테이블</title>
	</head>
	<body>
		<h2>테이블</h2>
		<table>
			<tr>
				<th>ID</th><th>NAME</th><th>PW</th>
			</tr>
			<c:forEach items="${list }" var="list" varStatus="cnt">
			<tr>
				<td>${list.id }</td><td>${list.name }</td><td>${list.pw }</td>
			</tr>
			</c:forEach>
		</table>
	</body>
	</html>
	
---
---
---
---
# DAO와 Service를 이용하여 테이블조회
	마이바티스를 이용하지않으므로 Mapper가 없다
	Mapper를 대체할 model을 하나 만들어준다
	그리고 Autowired로 주입받기 위해
	servlet-context.xml에서
	<context:component-scan base-package="com.connectDB.controller" /> 를
	<context:component-scan base-package="com.connectDB.*" /> 로 수정해준다
	
## Model 예제 -- MySQL8.java
	public class MySQL8 {
		private final static String DRIVER ="com.mysql.cj.jdbc.Driver";
		private final static String URL="jdbc:mysql://localhost:3306/connectDB";
		private final static String USER="root";
		private final static String PASS="1234";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//쿼리문 쓸 영역
		public final static String SELECT_TEST1 = "select * from test1";
		
		
		
		public static Connection getConnection() throws SQLException, ClassNotFoundException {
				Class.forName(DRIVER);
				Connection conn = DriverManager.getConnection(URL, USER, PASS);
			return conn;
		}
		
		public static void close(PreparedStatement pstmt, Connection conn){
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		public static void close(ResultSet rs,PreparedStatement pstmt, Connection conn){
			if(rs!=null){
				try {
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

## DAO 예제 - TestDAO.java
	@Repository
	public class TestDAO {
		
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;
		
		public List<Test1DTO> selectTest1(){
			List<Test1DTO> list = new ArrayList<>();
				try {
					conn = MySQL8.getConnection();
					pstmt = conn.prepareStatement(MySQL8.SELECT_TEST1);
					rs=pstmt.executeQuery();
					while(rs.next()) {
						Test1DTO test1 = new Test1DTO();
						test1.setId(rs.getString("id"));
						test1.setName(rs.getString("name"));
						test1.setPw(rs.getInt("pw"));
						list.add(test1);
					}
					
				} catch (Exception e) {
					System.out.println("에러"+e);
				}
				MySQL8.close(rs, pstmt, conn);
			return list;
		}
	}
	
## Service예제 - TestService.java
	@Service
	public class TestService {
	
		@Autowired
		TestDAO testDAO;
		
		public List<Test1DTO> selectTest1(){
			return testDAO.selectTest1();
		}
	}

## Controller예제 - TestController_DAO_NoMapper.java
	@Controller
	public class TestController_DAO_NoMapper {
		@Autowired
		TestService testService;
		
		@RequestMapping("/selectDAO")
		public void selectTest(Model model) {
			model.addAttribute("list", testService.selectTest1());
		}
	}

## jsp는 위에있는 jsp와 같은것을 사용하면된다

---
---
---
---
	
# 마치며...
	우리형 기죽지마!