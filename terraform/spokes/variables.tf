variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "kubernetes_version" {
  description = "EKS version"
  type        = string
}

variable "addons" {
  description = "EKS addons"
  type        = any
  default = {
    enable_metrics_server                  = true
    enable_aws_crossplane_provider         = false # installs aws contrib provider
    enable_aws_crossplane_upbound_provider = false # installs aws upbound provider
    enable_crossplane_kubernetes_provider  = false # installs kubernetes provider
    enable_crossplane_helm_provider        = false # installs helm provider
    enable_crossplane                      = false # installs crossplane core
  }
}

variable "aws_auth_roles" {

  description = "additional aws auth roles"
  type = list(
    object(
      {
        rolearn  = string
        username = string
        groups = list(string
        )
      }
    )
  )
  default = []
  # example structure
  #  {
  #     rolearn  = "arn:aws:iam::12345678901:role/role1"
  #     username = "role1"
  #     groups   = ["system:masters"]
  #   }
}

variable "kms_key_admin_roles" {
  description = "list of role ARNs to add to the KMS policy"
  type        = list(string)
  default     = []

}
