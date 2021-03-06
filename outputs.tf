output "public_key_openssh" {
  value = tls_private_key.flux.public_key_openssh
}

output "private_key_pem" {
  sensitive = true
  value     = tls_private_key.flux.private_key_pem
}

output "flux_namespace" {
  value = local.flux_ns
}
