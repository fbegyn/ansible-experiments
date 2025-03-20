# Firewalld

Even in tighly controlled setup, a firewall on each node is stilla  very good
guard against threats. Depending on the environment, this could just be realised
by designing a new ansible module that will render nftables configuration, but
`firewalld` is a battle proven option with a somehwat user friendly interface for
it and sane defaults.
