## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch8.[Beta] 실험적인 패널들 (optional)

**[우측 메뉴 / 패널 옵션]**
* 시각화: Table
* 패널 제목: frontend 서비스 트레이스 목록

**[좌측 메뉴/ 쿼리 편집기]**
* 데이터 소스: 예거
* 쿼리 
  - 쿼리 옵션:
    - Service Name: frontend
    - Operation: All

**[트레이스 및 노드 그래프 확인하기]** 
* http://192.168.1.84 으로 접속해서 **Rachel's Floral Designs** 버튼을 누릅니다.
* 대시보드로 이동하여서 Table에 추가된 Row를 확인합니다.
* 추가된 Row에 **Trace ID**를 누릅니다.
* Explore 탭에서 나타난 Node Graph와 Trace View를 확인합니다.