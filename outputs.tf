output "jenkins_vm_ip" {
  value = module.jenkins_vm.public_ip_address
}

output "sonarqube_vm_ip" {
  value = module.sonarqube_vm.public_ip_address
}