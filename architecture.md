어린이집 기본 정보
<Model 1. Kindergarden>

Column 
1) Category_city(string) - 시도 구분용 
2) Category_phrase(string) - 시군구 구분용
2-2) Category_dong(stirng) - 동단위 구분용
2-3) Category_Scale(stirng) - 도시 단위 구분용
2-4) Category_Allday(boolean) - 종일반 운영 구분용 
3) Title(string) - 기관명
4) Type(string) - 기관 유형
5) Status(string) - 운영 현황
5-2) OperatingTime(stirng or time) - 운영 시간
5-3) NuriTime(stirng or time) - 누리과정 운영 시간
5-4) Charge(integer) - 연령별 학부모 부담금
6) Address(string) - 주소
7) Telephone(string) - 전화번호
8) Fax(string) - 팩스번호

9) RoomNumber(integer) - 보육실 수
10) RoomArea(integer) - 보육실 면적
11) Teacher(integer) - 전체 교직원 수
11-2) TeacherType(string) - 타입별 교직원수(원장, 보육교사, 특수교사, 치료사, 영양사, 취사부, 간호사, 사무원, 기타)
12) Capacity(integer) - 정원
13) Admission(integer) - 현원
13-2) Sufficiency(integer) - 현원/정원 충족률
13-3) AgeAdmission - 연령별 현원(0세~7세)
13-4) ClassAdmission - 반별 현원(종일반, 오후반, 장애반 ...)
13-5) SpecialAdmission - 취약, 특수보육현원(영아 현원, 장애아 현원,...)

14) Latitude(integer) - 위도
15) longtitude(integer) - 경도
16) Bus(boolean) - 통학차량운영 여부
17) WebAddress(string) - 홈페이지 주소
18) Accreditation(date) - 인가일자
19) StopStart(date) - 휴지시작 일자
20) StopEnd(date) - 휴지종료 일자
21) Abolition(date) -폐지 일자

22) Certification(boolean) - 평가인증 여부
23) Support(boolean) - 지원여부

2-4)에서 true 일 경우(종일반 운영 유치원일 경우 추가 column)
24) Allday_RoomNumber(integer) - 오후 6시 이후 반 수
25) Allday_TeacherNumber(integer) - 오후 6시 이후 교사 수
26) Allday_KidNumber(integer) - 오후 6시 이후 아동 수
27) Allday_Bus(boolean) -오후 6시 이후 통학차량 여부

28) has_many:reviews - 리뷰들을 가질 수 있도록
------------------------------------------------------------------------

<Model 2. Review> - kindergarden has_many:reviews

Column
1) Kindergarden_id(integer) - 관계용 column
2) title(string) - 제목
3) content(stirng) - 내용
4) grade(intger) - 평점
------------------------------------------------------------------------

Column이 많더라도 매달 말 업데이트되는 공개Api를 통해 긁어와서 사용한다면 Column이 많더라도 데이터 관리에 큰 무리가 없을 듯!

기본적으로 보여줘야할 정보들과 상세 정보 등으로 보여줘야할 정보들 구분하기!

추가로 각 항목들 중 낯선 항목들에 대해서는 설명이 필요할듯( ex. 평가인증 여부에서 평가인증이랑 무엇인지)

통계결과가 너무 복잡하게 되어 있어서 대학생들이 보기에도 많은 불편함이 있고 어려움 -> 아이콘 등 디자인을 통해 좀 더 편하게 볼 수 있는 방향 고려하기! 

교사 정보는 발견못함ㅠ

(http://info.childcare.go.kr/info/oais/openapi/OpenApiInfoSl.jsp#none)
(http://info.childcare.go.kr/info/oais/openapi/OpenApiInfoSl.jsp)
(http://www.childinfo.go.kr/info/info.jsp)
(http://info.childcare.go.kr/info/pnis/search/NurseryClassAdditionSlL.jsp)
------------------------------------------------------------------------
**
부모 입장
내 자녀 어린이집 정보 - 주민번호나 다른 인증방식을 통해 내 자녀 정보를 등록할 수 있고 등록하고 나면 내 자녀의 어린이집 정보를 확인. 
<Model 3. Child >

Column
0) name(stirng) - 아동 이름
1) age(integer) - 나이
2) gender(integer) - 성별
3) kindergarden_id(integer) - 소속 유치원 
4) className(string) - 반 이름
5) classNumber(integer) - 반 번호
6) allday(boolean) - 종일반 여부
7) has_many : Records
8) belongs_to : teacher
9) belongs_to : parent

보육 교사 입장에서 작성, 부모 입장에서 읽기
<Model 4. Records >

Column
0) RecordDate(date) - 일자
1) Participation(integer) - 참여율(10점 단위)
2) Meal(integer) - 식사율 (10점 단위)
3) Activity(integer) - 활동량 (10점 단위)
4) Comments(stirng) - 그 외 코멘트
5) belongs_to : child

보육 교사
<Model 5. Teacher>
0) name(string) - 교사 이름
1) age(integer) - 나이
2) gender(integer) - 성별
3) kindergarden_id(integer) - 소속 유치원
4) certification(string) - 자격증 보유 현황
5) career(integer) - 경력
6) has_many: child
7) has_many: posts

게시글(네이버 밴드에서 활용되던 유치원 행사 사진 및 부모님 안심 사진 용 게시글)
<Model 6. Post>
0)title(string)
1)content(string)
2)belongs_to :teacher

<Model 7.  Parent >
Column
0) Name(string) 
1) number(string) - 주민번호
2) telephone(string) - 연락처
3) email(string) - 이메일
4) 그 외 기본정보?
5) has_many :children
