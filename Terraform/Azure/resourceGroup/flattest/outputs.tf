output "local1" {
  description = "A local variable"
  value       = local.flatstring
}

output "local2" {
  description = "A local variable from tf vars"
  value       = local.from_tf_vars
}

output "local3" {
  description = "A local variable from morpheus vars"
  value       = local.from_morpheus_vars
}