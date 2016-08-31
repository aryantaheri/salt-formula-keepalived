keepalived:
  cluster:
    enabled: True
    vrrp_script:
      chk_haproxy:
        script: "pidof haproxy"
        interval: 2
    instance:
      VIP1:
        priority: 100 
        virtual_router_id: 51
        password: pass
        addresses:
        - 192.168.10.1
        - 192.168.10.2
        interface: eth0
        track_script:
        - chk_haproxy
