## 패널 그리는 방법

**[대시보드 설정]**
* 이름: 1 Kubernetes All-in-one Cluster Monitoring KR(v1.26.0)

**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스

**[우측 메뉴 / 패널 옵션]**
* 시각화: Table
* 패널 제목: 노드 현황

* Add field override 버튼 클릭
  - Fields with name 선택
    - Node name 클릭
  - Add override property
    - Data links > Data links 클릭
    - Data links> add link 클릭
      - Edit link
        * title: 노드 정보
        * URL: d/rYdddlPWk/?var-node=${__data.fields["Node name"]}