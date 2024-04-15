resource "neon_project" "db-cluster" {
  name      = "connect-health"
  region_id = "aws-us-west-2"

  branch = {
    endpoint = {
      suspend_timeout = 0
    }
  }
}
resource "neon_role" "role-db" {
  name       = "db-role"
  branch_id  = neon_project.db-cluster.branch.id
  project_id = neon_project.db-cluster.id

  depends_on = [neon_project.db-cluster]
}
resource "neon_database" "db-name" {
  name       = "connect_health_db"
  owner_name = neon_role.role-db.name
  branch_id  = neon_project.db-cluster.branch.id
  project_id = neon_project.db-cluster.id

  depends_on = [neon_project.db-cluster, neon_role.role-db]
}