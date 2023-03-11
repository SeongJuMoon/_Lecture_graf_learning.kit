## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch6.[Stable] 구체적인 목적을 가지고 사용되는 패널 (optional)

**[좌측 메뉴/ 쿼리 편집기]**
* 데이터 소스: 프로메테우스
* 쿼리 : sum(rate(apiserver_request_duration_seconds_bucket[1m])) by (le)

**[우측 메뉴 / 패널 옵션]**
* 시각화: Heatmap 
* 패널 제목: apiserver 요청에 대한 응답 시간(시간 흐름)
* Y Axis 
  - Unit - Time - seconds (s)

