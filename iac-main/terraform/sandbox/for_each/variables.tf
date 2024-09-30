variable "full_bucket_config" {
    default = {
      bucket1 = {
        bucket_name = "my-tf-test-bucket-ismindirov-one"
        tag_name = "lolol3"
        # policy_name = 
      }
      bucket2 = {
        bucket_name = "my-tf-test-bucket-ismindirov-two"
        tag_name = "lolol2"

        # policy_name = 
      }
      bucket3 = {
        bucket_name = "my-tf-test-bucket-ismindirov-three"
        # policy_name = 
        tag_name = "lolol"
      }
    }
}