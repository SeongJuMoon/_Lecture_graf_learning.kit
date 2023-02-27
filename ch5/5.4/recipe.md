## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch5.[Stable] 그라파나 패널에서 제공되는 다양한 옵션들

**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리: kube_deployment_spec_replicas{deployment="important-front"}

**[우측 메뉴 / 패널 옵션]**
* 시각화: Stat
* 패널 제목: important-front의 파드 수 
* 값을 대응하도록 추가(Add value mapping)
  - Add a new mapping 
    - Value
      - 0
      - 파드가 없음 
      - 색은 빨간 색 동그라미 

**[상단 메뉴 / 대시보드 보기 설정]**
* 확인 범위: Last 5 minutes 

