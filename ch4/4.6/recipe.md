# 패널 그리는 방법

**[우측 메뉴 / 패널 옵션]**
* 시각화: Bar Gauge
* 패널 제목: 각 노드 별 메모리 사용률


**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리: (node_memory_MemTotal_bytes - node_memory_MemFree_bytes - node_memory_Buffers_bytes - node_memory_Cached_bytes - node_memory_SReclaimable_bytes) / node_memory_MemTotal_bytes
* 쿼리 옵션:
    Legends: {{ node }}