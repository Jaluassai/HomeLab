resource "proxmox_vm_qemu" "srv-demo1" {
    name = "srv-demo-1"
    desc = "Ubunciak Test2"

    target_node = "Hades01"
    vmid = "5005"
    agent = 1

    clone = "Ubuntu-24.04-Cloud"
    os_type = "cloud-init"

#   CPU
    sockets = 1
    cores = 2
    cpu = "host"
    numa = true

# RAM    
    memory = 2048
    
    network {
        bridge = "vmbr0"
        model = "virtio"
    }
# Network Addr for DHCP leave "ip=DHCP" 

    ipconfig0 = "ip=192.168.100.252/24,gw=192.168.100.1"


    cloudinit_cdrom_storage = "local-lvm"
    boot = "order=scsi0;ide3"

# SCSI Controller    
    scsihw = var.scsi_Controller
# 
# ---
# Initial Disks Settings For 3.0.1-rc1
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

# 
# ---
# Initial Disks Settings For 2.9.14
    # disk {
    #     storage = "local-lvm"
    #     type = "virtio"
    #     size = "13824M"
    # }
}


####
#   For better managing multiple vars for multiple Hosts, add terraform.tfvars file
#   Where you can specify for eg. scsi_Controller = "LSI"
#   All vars with scsi_Cotrnoller will be from now LSI on every VM