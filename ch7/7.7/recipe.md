## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch7.[Stable] 자주 사용되지 않는 패널 (optional)

**[우측 메뉴 / 패널 옵션]**
* 시각화: Geomap 
* 패널 제목: 미국 주 별 국제 공항의 정보     

**[좌측 메뉴/ 쿼리 편집기]**
* 데이터 소스: 테스트데이터 데이터베이스(TestData DB)
* Scenario: CSV File 
* File: flight_info_by_state.csv

**[우측 메뉴 / 패널 옵션]**
* Map view:
  - View: North America 
  - Zoom: 5 
  - Styles:
    - Size: Count (자동으로 2 - 15 적용)
  - Symbol: plane.svg 
  - Color: Count
  - Text label:
    - Field: State 
    - X offset: 5
    - Y offset: 15 
* 임계치(Thresholds) 
  - 빨간 동그라미: 10으로 그리고 녹색 동그마리로 변경 
  - 녹색 동그마리 - 빨간 동그라미로 변경 
  - Add thresholds: 노란 동그라미 - 5로 변경 
