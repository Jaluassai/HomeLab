output "vm-name" {
  description = "VM name"
  value       = proxmox_vm_qemu.srv-demo1.name
}
output "vm_ip_address" {
  description = "IP address of the VM"
  value       = proxmox_vm_qemu.srv-demo1.default_ipv4_address
}
output "vm_id" {
  description = "ID of VM"
  value       = proxmox_vm_qemu.srv-demo1.vmid
}
