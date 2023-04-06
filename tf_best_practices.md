```
1. Manipulate state only through TF commands. 
    - terraform apply
    - terraform state (for advanced state management)

2. While working in a team, always set up a shared remote storage for the state file so that every team member can execute terraform commands using the same state file. 
    - Terraform supports storing state in Amazon S3 (S3 backend and DynamoDB), Terraform Cloud, Azure Blob Storage, Google Cloud Storage, etc. 

3. Use state locking until writing of state file is completed.
    - to avoid conflicts due to concurrent changes in the state file.

4. Backup your state file. 
    - file versioning

5. Use one state file per environment - dev, test, prod.

6. Host TF scripts in Git repository.
    - effective team collaboration
    - version control for your IaC code.

7. CI for Terraform Code.
    - have a process for reviewing and testing the infrastructure code just like the application code.
    - merge request 
    - allows team to collaborate and have quality code which is tested and reviewed.

8. Execute Terraform in an automated build (not team members manually updating infrastructures from their computers.)
    - Apply Infrastructure changes only through CD pipeline



# Some other practices

1. Follow a standard module structure
2. Adopt a naming convention
3. Use variables carefully (declare all variables in variables.tf)
4. Expose outputs (organize all outputs in outputs.tf)
5. Use existing shared and community modules instead of writing your own modules
6. Always format and validate (terraform fmt and terraform validate)
7. Tag your resources
8. Introduce Policy as a Code (As our teams and infrastructure scale, our trust in individual users is generally reduced)
9. Enable debug/troubleshooting (TF_LOG=DEBUG <terraform command>)
10. Build modules wherever possible
11. Use loops and conditionals
12. Take advantage of IDE extensions
13. Precommit hooks
14. Use different environments - Terragrunt
```