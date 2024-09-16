resource "random" "ssh_key_name" {
  prefix = "ssh"
  separator = ""
}

resource "azapi_resource" "ssh_public_key" {
  type = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  name = random.ssh_key_name.id
  location = var.resource_group_location
  parent_id = var.resource_group_id
}

resource "azapi_resource_action" "ssh_public_key_gen" {
    type = "Microsoft.Compute/sshPublicKeys@2022-11-01"
    action = "generateKeyPair"
    method = "POST"
    resource_id = azapi_resource.ssh_public_key.id
    response_export_values = [ "publicKey", "privateKey" ]
}