
#
# SSH keys to be stored in KV only if public_key_pem_file is not set
# Keyvault has to be in the same subscription as the VM when local.create_sshkeys is true
#
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_key_vault_secret" "ssh_private_key" {
  name            = azurecaf_name.linux.name
  value           = tls_private_key.ssh.private_key_pem
  key_vault_id    = var.key_vault.id
  expiration_date = timeadd(timestamp(), "4320h")
  content_type    = "text/plain"
  lifecycle {
    ignore_changes = [
      value, key_vault_id
    ]
  }
  tags = local.tags
}

resource "azurerm_key_vault_secret" "ssh_public_key_openssh" {
  name            = try(format("%s-ssh-public-key-openssh", azurecaf_name.linux.result))
  value           = tls_private_key.ssh.public_key_openssh
  key_vault_id    = var.key_vault.id
  content_type    = "text/plain"
  expiration_date = timeadd(timestamp(), "4320h")

  lifecycle {
    ignore_changes = [
      value, key_vault_id
    ]
  }
  tags = local.tags
}
