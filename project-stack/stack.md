```mermaid
graph TB
    AWS_VPC --> EC2
    AWS_VPC --> SecurityGroup
    AWS_VPC --> LAMBDA
    EC2 --> EBS
    SecurityGroup --> EC2
    LAMBDA 
    SecurityGroup --> LAMBDA
```