## 패널 그리는 방법

**[대시보드 설정]**
* 이름: A.11.011

**[좌측 메뉴/ 쿼리 편집기]**
* 데이터 소스: 프로메테우스
* 쿼리 :  sum(rate(node_network_receive_bytes_total[5m])) by (node)
* 쿼리 옵션:
  - Legends: {{ node }}-수신

* 쿼리 : sum(rate(node_network_transmit_bytes_total[5m])) by (node) * -1 
* 쿼리 옵션:
  - Legends: {{ node }}-송신

**[우측 메뉴 / 패널 옵션]**
* 시각화: Time Series
* 패널 제목: 노드별 5분간 네트워크 트래픽 변화율
* 스탠다드 옵션(Standard options)
  - Unit - Data - bytes(IEC)
* Axis
  - Label: 송신 | 수신
 
**[상단 메뉴 / 대시보드 보기 설정]**
* 확인 범위: Last 5 minutes