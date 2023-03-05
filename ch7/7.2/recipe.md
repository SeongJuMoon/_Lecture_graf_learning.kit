## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch7.[Stable] 자주 사용되지 않는 패널 (optional)

**[우측 메뉴 / 패널 옵션]**
* 시각화: Text
* 패널 제목: 제목을 지움 
* Text 
 - Mode: Markdown (no change)
 - Context 
 ---
 # 노드 메모리를 구하는 방법

[![version](https://img.shields.io/badge/version-1.0.0-yellow.svg)](https://semver.org)
![PromQL](https://img.shields.io/badge/written%20in-PromQL-ff69b4.svg)

일반적으로 리눅스의 메모리를 조회하는 셸 명령어는 다음과 같습니다.
아래 옵션을 참조해서 단위를 설정할 수 있습니다.

```
free --options

 -b, --bytes         show output in bytes
 -k, --kilo          show output in kilobytes
 -m, --mega          show output in megabytes
 -g, --giga          show output in gigabytes
     --tera          show output in terabytes
     --peta          show output in petabytes
 -h, --human         show human-readable output
     --si            use powers of 1000 not 1024
```

이런 결과를 프로메테우스 쿼리로 확인하기 위해서는 다음과 같은 쿼리를 사용해야합니다.
```bash
node_memory_MemTotal_bytes
- node_memory_MemFree_bytes
- node_memory_Buffers_bytes
- node_memory_Cached_bytes
- node_memory_SReclaimable_bytes
```

위 쿼리는 메모리 사용량을 나타내는 쿼리이므로 이를 퍼센트로 나타내기 위해서는 다음과같은 PromQL을 사용하면 됩니다.
```bash
(
node_memory_MemTotal_bytes
- node_memory_MemFree_bytes
- node_memory_Buffers_bytes
- node_memory_Cached_bytes
- node_memory_SReclaimable_bytes
)
/ node_memory_MemTotal_bytes * 100
```

