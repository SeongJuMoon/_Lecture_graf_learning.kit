## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch4.[Stable] 그라파나에서 자주 사용되는 패널

**[우측 메뉴 / 패널 옵션]**
* 시각화: Stat
* 패널 제목: important-front의 파드 수 

**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리: kube_deployment_spec_replicas{deployment="important-front"}
