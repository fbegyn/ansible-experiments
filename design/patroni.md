# Patroni

Spinning up PostgreSQL clusters manually through ansible is certainly an option
and when you have serveral experienced DBA's on the team that's most likely a
better option. However, for quick setups that need to be reproducable and
end-user friendy, [Patroni](https://patroni.readthedocs.io/en/latest/) is a very
good option.

Patroni can be run on several platforms (Openshift, Kubernetes, VMS, cloud, ...)
easily with mostly the same configuraton. It offers a end-user friendly CLI to
control the cluster (switchover, failover, ...). This makes it a lot easier to
manage with the only cost being that it needs an extra component.

If we soley need the key/value, etcd might be the better option. But I chose
consul here, since this also gives the option in the future to leverage the
service discovery functionality of consul to make observability/load
balancing/... easier.

## Keepalived

Keepalived can be integrated with Patroni to move the VIP around to the leader.
This makes it so the VIP is ALWAYS write/read safe option to use, while the other
nodes of the cluster can be accessed directly for reads OR through a load
balancer/VIP setup as well.
