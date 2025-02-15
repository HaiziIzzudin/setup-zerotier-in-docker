SUMPAHHHH part nak letak forward hostname je dah pening nak mampos. So here is a definitive tutorial on Forwarding Hostname for Nginx Proxy Manager:

1. Jika tak map port, then u kena link nginx proxy manager dengan ip localhost (in the same network bridge), dengan port 80 (atau mana-mana port yg developer recommends)
2. Jika ada map port ke server port (server_port:container_port), then u kena link N-pm dengan ip server (x perlu same bridge), dengan port yg u set for exposing.

Additional notes:

If u deploy a container menggunakan docker compose (samada di cli atau di portainer), docker akan auto buat network utk that stack only. Therefore, jika taknak map port, make sure add N-pm to the network of the stack yg u deploy (this is easy if u use Portainer), then c&p local IP Address of that service container, masukkan dlm N-pm, port 80 ATAU developer  tetapkan. Kalau tak suka, buat cara 1 atau 2. 
