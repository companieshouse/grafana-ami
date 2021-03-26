build {
  sources = [
    "source.amazon-ebs.builder",
  ]

  provisioner "ansible" {
    host_alias = "${var.ansible_host_alias}"
    playbook_file = "${var.playbook_file_path}"
    user = "${var.ansible_user}"
    extra_arguments  = [
      "-e", "aws_region=${var.aws_region}",
      "-e", "resource_bucket_name=${var.resource_bucket_name}",
      "-e", "resource_bucket_grafana_prefix=${var.resource_bucket_grafana_prefix}",
      "-e", "grafana_admin_password=${var.grafana_admin_password}",
      "-e", "force_delete_snapshot=${var.force_delete_snapshot}",
      "-e", "force_deregister=${var.force_deregister}"
    ]
  }
}
