## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch4.[Stable] 그라파나에서 자주 사용되는 패널

**[우측 메뉴 / 패널 옵션]**
* 시각화: Time series
* 패널 제목: 노드 별 5분간 네트워크 수신 변화율

**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리: sum(rate(node_network_receive_bytes_total[5m])) by (node)
