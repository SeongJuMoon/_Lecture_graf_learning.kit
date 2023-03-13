## 패널 그리는 방법

**[대시보드 설정]**
* 이름: ch8.[Beta] 실험적인 패널들 (optional)

**[우측 메뉴 / 패널 옵션]**
* 시각화: Canvas
* 패널 제목: Nginx 인그레스 컨트롤러의 상태 

**[좌측 메뉴/ 쿼리 편집기]**
* 데이터 소스: 프로메테우스
* 쿼리 : kube_deployment_status_replicas_ready{namespace="ingress-nginx"}

**[우측 메뉴 / 패널 옵션]**
* Background
 - Image:
   - Fixed 
   - https://github.com/SeongJuMoon/_Lecture_graf_learning.kit/blob/main/ch8/8.3/background.png?raw=true

* 값을 대응하도록 추가(Add value mapping)
  - default 
    - Value 
      - 0
      - 실패 
      - 색은 빨간색 동그라미 
  - Add a new mapping 
    - Range
      - 1
      - 100
      - 정상 
      - 색은 녹색 동그라미 

**[좌측 중앙 메뉴/ 필드 선택(Select field)]**
* field: {__name__="kube_deployment_status_replicas_ready"....}
