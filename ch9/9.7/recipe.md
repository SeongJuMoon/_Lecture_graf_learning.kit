## 대시보드 설정 방법 
**General** 
* 이름: ch9.7.프로메테우스 스택에서 추가로 제공하는 메트릭을 활용해서 대시보드 그리기

## 패널 그리는 방법 
#1 <br/>
**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리: etcd_cluster_version
* 쿼리 옵션:
  - Legend: Auto (no change)
  - Format: Table
  - Type: Instant
**[우측 메뉴 / 패널 옵션]**
* 시각화: Table
* 패널 제목: etcd cluster 정보

**[좌측 메뉴 / 트랜스폼(Transform)]** 
* Organize fields:
  - namespace
  - pod
  - cluster_version
  - instance
 
#2-1 <br/>
**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리: sum(kubeproxy_sync_proxy_rules_iptables_total{table="filter"}) by (instance)
**[우측 메뉴 / 패널 옵션]**
* 시각화: Stat
* 패널 제목: kube-proxy iptable 규칙 개수 (filter) 
* Thresholds
  - Green: Base

#2-2 <br/>
**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리: sum(kubeproxy_sync_proxy_rules_iptables_total{table="nat"}) by (instance)
**[우측 메뉴 / 패널 옵션]**
* 시각화: Stat
* 패널 제목: kube-proxy iptable 규칙 개수 (nat) 
* Thresholds
  - Green: Base

#3
**[좌측 메뉴/ 쿼리 편집기]**
* 데이터 소스: 프로메테우스
* 쿼리 : sum(scheduler_pending_pods) by (queue)

**[우측 메뉴 / 패널 옵션]**
* 시각화: Time Series
* 패널 제목: 쿠버네티스 클러스터 스케줄링 정보
