resource "null_resource" "oracle_to_adw_incremental_load" {
  depends_on = [oci_dataintegration_workspace.test_workspace, oci_dataintegration_workspace_project.test_workspace_project]           
  provisioner "local-exec" {
    command = "oci raw-request --target-uri https://dataintegration.${var.region}.oci.oraclecloud.com/20200430/workspaces/${oci_dataintegration_workspace.test_workspace.id}/disApplications --http-method POST --request-body file://${path.module}/metadata/object_store_management.json"
    working_dir = "${path.module}"
    interpreter = ["/bin/bash", "-c"] 
  }
}
