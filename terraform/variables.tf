variable "vpc1_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}


variable "subnet1_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/24"
}

variable "subnet2_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.1.0/24"
}

variable "dns-resolver-name" {
    description = "the dns resolver name"
    default = "dns-resolver"

}

variable "public_key_path" {
    description = "the path for public ssh key"
    default = "C:/Users/roger/downloads/public.pub"
}