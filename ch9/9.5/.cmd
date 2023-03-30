# 1. to by simulate outage, scaled deploy important-front replicas down to 1.
k scale deploy important-front --replicas 1

# 2. restore simulate outage, scaled deploy important-front replicas up to 5.
k scale deploy important-front --replicas 5
