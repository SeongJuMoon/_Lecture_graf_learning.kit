## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch6.[Stable] 구체적인 목적을 가지고 사용되는 패널 (optional)

**[좌측 메뉴/ 쿼리 편집기]**
* 데이터 소스: 프로메테우스
* 쿼리 : kube_deployment_status_replicas_ready{namespace="default"}
* 쿼리 옵션:
    Legends: {{ deployment }}

**[우측 메뉴 / 패널 옵션]**
* 시각화: Status timeline
* 패널 제목: default 네임스페이스의 디플로이먼트 상태
* 파이 차트(Pie chart)
  - Labels: Percent

