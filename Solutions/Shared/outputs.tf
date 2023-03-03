output "key_vault_name" {
  value = module.keyvault.name
}

output "devops_vm_id" {
  value = module.devops_vm.id
}

output "devops_vm_name" {
  value = module.devops_vm.name
}

output "devops_vm_private_ip_address" {
  value = module.devops_vm.private_ip_address
}

output "devops_vm_public_ip_address" {
  value = module.devops_vm.public_ip_address
}

output "devops_vm_virtual_machine_id" {
  value = module.devops_vm.virtual_machine_id
}

output "devops_vm_identity" {
  value = module.devops_vm.identity
}
