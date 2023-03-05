apiserver_request_duration_seconds_bucket{verb="GET"}
#Grafana의 suggestion을 누르고 rate값을 1m으로 수정 

#histogram_quantile(0.01, sum(rate(apiserver_request_duration_seconds_bucket{verb="GET"}[1m])) by (le))
#histogram_quantile(0.95, sum(rate(apiserver_request_duration_seconds_bucket{verb="GET"}[1m])) by (le))

histogram_quantile(0.01, rate(apiserver_request_duration_seconds_bucket{verb="GET"}[1m]))
histogram_quantile(0.20, rate(apiserver_request_duration_seconds_bucket{verb="GET"}[1m]))
histogram_quantile(0.95, rate(apiserver_request_duration_seconds_bucket{verb="GET"}[1m]))

# Change Thresholds according to ms value(current 0.05s = 50.000ms)
