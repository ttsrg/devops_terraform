resource "local_file" "ansible_inventory" {
    content     = "[web]\n${aws_instance.web.public_ip} \n[api]\n${aws_instance.api.public_ip}"
    filename = "../ansible/inventory/stage"
}

resource "local_file" "ansible_web_vars" {
  content   = "---\nssl_certs_domains: [${aws_route53_record.calc_www.name}]\ncalc_web_api_ip: [${aws_instance.api.public_ip}]\n" 
  filename  = "../ansible/inventory/group_vars/web.yml"
}

resource "null_resource" "calc_deploy" {
  provisioner "local-exec" {
    command = "ansible-playbook -i ../ansible/inventory/stage ../ansible/calc_web.yml"
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ../ansible/inventory/stage ../ansible/calc_api.yml"
  }
}
