resource "proxmox_vm_qemu" "srv-demo1" {
    name = "srv-demo-1"
    desc = "Ubunciak Test2"

    target_node = "Hades01"

    vmid = "5005"
    agent = 1

    
    
    clone = "Ubuntu-24.04-Cloud"
    os_type = "cloud-init"

    cores = 2
    sockets = 1
    cpu = "host"
    numa = true
    memory = 2048
    scsihw = "virtio-scsi-pci"
    cloudinit_cdrom_storage = "local-lvm"
    boot = "order=scsi0;ide3"

    network {
        bridge = "vmbr0"
        model = "virtio"
    }

    ipconfig0 = "ip=192.168.100.252/24,gw=192.168.100.1"
    ###
## 3.0.1rc
    ##
    disks {
        scsi {
            scsi0 {
                disk {
                    size = 14
                    storage = "local-lvm"
                    discard = true
                    iothread = true
                    backup = false

                }
            }
        }
    }

###
# 2.9.14
###
    # disk {
    #     storage = "local-lvm"
    #     type = "virtio"
    #     size = "13824M"
    # }



}

