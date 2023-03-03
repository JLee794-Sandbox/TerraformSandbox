output "key_vault_name" {
  value = module.keyvault.name
}

output "linux_devops_vm_id" {
  value = module.linux_devops_vm.id
}

output "linux_devops_vm_private_ip_address" {
  value = module.linux_devops_vm.private_ip_address
}

output "linux_devops_vm_public_ip_address" {
  value = module.linux_devops_vm.public_ip_address
}

output "linux_devops_vm_virtual_machine_id" {
  value = module.linux_devops_vm.virtual_machine_id
}

output "linux_devops_vm_identity" {
  value = module.linux_devops_vm.identity
}
