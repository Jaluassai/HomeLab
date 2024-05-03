resource "proxmox_lxc" "Docker01" {
  target_node  = "Hades01"

  hostname     = "Docker01"
  tags = "prod"
  ostemplate   = "local:vztmpl/ubuntu-23.10-standard_23.10-1_amd64.tar.zst"
  vmid = 5001
  


  memory = 8192
  cores = 4

  password     = var.docker01_pass

  rootfs {
    storage = "local-lvm"
    size    = "15G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "192.168.100.240/24"
    gw = "192.168.100.1"
  }

  start = true
  unprivileged = true

  ssh_public_keys = var.ssh_keys

}