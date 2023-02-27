## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch4.[Stable] 그라파나에서 자주 사용되는 패널

**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리: (node_memory_MemTotal_bytes - node_memory_MemFree_bytes - node_memory_Buffers_bytes - node_memory_Cached_bytes - node_memory_SReclaimable_bytes) / node_memory_MemTotal_bytes
* 쿼리 옵션:
    Legends: {{ node }}
`OR`
* 데이터 소스: 프로메테우스
* 쿼리: avg((node_memory_MemTotal_bytes - node_memory_MemFree_bytes - node_memory_Buffers_bytes - node_memory_Cached_bytes - node_memory_SReclaimable_bytes) / node_memory_MemTotal_bytes)  by (node)

**[우측 메뉴 / 패널 옵션]**
* 시각화: Bar gauge
* 패널 제목: 노드 별 메모리 사용률

