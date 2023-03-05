## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch6.[Stable] 구체적인 목적을 가지고 사용되는 패널 (optional)

**[좌측 메뉴/ 쿼리 편집기]**
* 데이터 소스: 프로메테우스
* 쿼리 : histogram_quantile(0.95, rate(apiserver_request_duration_seconds_bucket{verb="GET"}[1m]))

**[우측 메뉴 / 패널 옵션]**
* 시각화: Histogram
* 패널 제목: apiserver 요청에 대한 응답 시간 (95% 이하)
* 범례(Legend): 끄기 
* Standard options
  - Unit - Time - seconds (s)
* 임계치(Thresholds) 
  - 빨간 동그라미 - 0.05 (시스템에 따라 다름)

**[상단 메뉴 / 대시보드 보기 설정]**
* 확인 범위: Last 5 minutes 

