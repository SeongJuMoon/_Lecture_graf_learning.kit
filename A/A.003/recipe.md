## 대시보드 설정 방법 
**General** 
* 이름: A.11.003.그라파나 전역변수를 활용해서 대시보드 만들기

## 패널 그리는 방법 
#1 <br/>
**[우측 메뉴 / 패널 옵션]**
* 시각화: Text
* 패널 제목: 전역변수를 이용한 대시보드 환영메시지
* Text 
 - Mode: Markdown (no change)
 - Content
 ---

# ${__user.login} 님 안녕하세요.

지금 접속하신 그라파나는 ${__org.name} 입니다.

대시보드 ${__dashboard}에서 그라파나의 기능을 확인하세요.

다음으로는 add panel을 눌러서 time series 패널을 만들도록 하겠습니다.

---  

#2-1 <br/>
**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리: sum(rate(node_network_receive_bytes_total[$__rate_interval])) by (instance)

**[좌측 메뉴/ 쿼리 편집기 / Query options]**
* Min interval: 3m

**[우측 메뉴 / 패널 옵션]**
* 시각화: Time series
* 패널 제목: $__rate_interval을 활용한 네트워크 수신 변화율 ($__interval)

#2-2 <br/>
**[좌측 메뉴/ 쿼리 편집기]** 
* 데이터 소스: 프로메테우스
* 쿼리: sum(rate(node_cpu_seconds_total[$__rate_interval])) by (instance)
**[좌측 메뉴/ 쿼리 편집기 / Query options]**
* Min interval: 3m

**[우측 메뉴 / 패널 옵션]**
* 시각화: Time series
* 패널 제목: $__rate_interval을 활용한 CPU 사용 변화율 ($__interval)