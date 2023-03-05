## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch6.[Stable] 구체적인 목적을 가지고 사용되는 패널 (optional)

**[좌측 메뉴/ 쿼리 편집기]**
* 데이터 소스: 프로메테우스
* 쿼리 : prometheus_target_scrape_pool_targets
* 쿼리 옵션:
  - Legends: {{ scrape_job }}

**[우측 메뉴 / 패널 옵션]**
* 시각화: Status history 
* 패널 제목: 프로메테우스 타켓에 대한 메트릭 수집 결과
* 범례(Legend): 끄기
* 값을 대응하도록 추가(Add value mapping)
  - Add a new mapping 
    - Value
      - 0
      - X 
      - 색은 빨간색 동그라미 
    - Range
      - 1
      - 100000
      - O 
      - 색은 녹색 동그라미 

**[상단 메뉴 / 대시보드 보기 설정]**
* 확인 범위: Last 5 minutes 
* 패널: View 모드로 확인 (수집, X)
