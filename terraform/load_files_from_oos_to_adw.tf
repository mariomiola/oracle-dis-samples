# Use the local-exec provisioner to run oci-cli
resource "null_resource" "load_files_from_oos_to_adw" {
  depends_on = [oci_dataintegration_workspace.test_workspace, oci_dataintegration_workspace_project.test_workspace_project]           
  provisioner "local-exec" {
    command = "oci raw-request --target-uri https://dataintegration.us-phoenix-1.oci.oraclecloud.com/20200430/workspaces/${oci_dataintegration_workspace.test_workspace.id}/disApplications  --http-method POST --request-body file://${path.module}/metadata/load_files_from_OOS_to_ADW.json"
    working_dir = "${path.module}"
    interpreter = ["/bin/bash", "-c"] 
  }
}

