## Nội Dung
1. Chuẩn bị và kiến thức nền tảng
2. AWS Lambda là gì và những lợi ích của Lambda
3. Vì sao nên sử dụng Terraform để triển khai Lambda function
4. Các bước triển khai Lambda function trên AWS dùng Terraform
5. Thực thi triển khai AWS Lambda function    
6. Kết quả và kiểm thử sau khi triển khai   
7. Mã nguồn và Tham Khảo 

## Chuẩn bị và kiến thức nền tảng
- Chuẩn bị một IAM user account và cấu hình key trong /.aws/credentials
- Bài viết giả định rằng bạn đã có kiến thức cơ bản về Terraform, do đó bài viết sẽ không đi chi tiết vào việc giải thích các kiến thức cơ bản của Terraform.
- Kiến thức cơ bản về AWS

## AWS Lambda là gì và những lợi ích của Lambda
AWS Lambda là một trong những dịch vụ mạnh mẽ và cách tân nhất của AWS. AWS Lambda cho phép lập trình viên đơn giản hoá qui trình phát triển ứng dụng. Cách tiếp cận này cung cấp một số lợi ích như thời gian phát triển nhanh, hiệu quả cao, chi phí thấp và nhiều lựa chọn tuỳ biến.
- AWS Lambda cho phép lập trình viên chia nhỏ những task phức tạp thành những task nhỏ và đơn giản hơn.
- Do đó, nó cho phép lập trình viên tập trung vào một đơn vị nhỏ nhất của tính năng và phát triển nó thật tốt.
- AWS Lambda bản chất dựa trên mô hình lập trình hướng sự kiện. Nó có thể kích hoạt việc sử dụng dựa trên bất kỳ một sự kiện (event) nào được phát sinh từ hầu hết tất cả các dịch vụ khác trong hệ sinh thái AWS. Ví dụ: ngay khi một file được upload lên S3 bucket, một Lambda function có thể được kích hoạt tự động để xử lý file đó tuỳ theo các mục đích sử dụng.
- AWS Lambda giảm thiểu chi phí triển khai hạ tầng (VPC, Network, EC instances, Storage).

## Vì sao nên sử dụng Terraform để triển khai Lambda function
- Có rất nhiều lợi ích của Terraform như một công cụ quản lý hạ tầng bằng mã nguồn (Infrastructure as Code). Nó giúp việc triển khai các dịch vụ trên nền tảng cloud như AWS rất tiện lợi. AWS Lambda function cũng là một dịch vụ trên nền tảng AWS nên nó cũng được hỗ trợ triển khai tự động bằng Terraform như các dịch vụ AWS khác.
- Khi phát triển Lambda function, chúng ta cũng có nhu cầu quản lý mã nguồn lambda bằng các công cụ quản lý phiên bản như Git. Do đó, lại càng có nhiều lý do để triển khai Lambda function bằng Terraform. Chúng ta vừa có thể quản lý cấu hình hạ tầng, vừa có thể quản lý mã nguồn chứa logic chính của lambda function bằng Git.

## Các bước triển khai Lambda function trên AWS dùng Terraform
### Kiến trúc triển khai
- Lưu ý: phần sử dụng S3 và DynamoDB như một back-end để lưu trữ state của Terraform là tuỳ chọn (optional). Để tiết kiệm chi phí triển khai, chúng ta có thể không cần sử dụng phần này trong bài này.
![Alt](https://hands-on.cloud/wp-content/uploads/2022/04/How-to-manage-AWS-Lambda-using-Terraform-Simple-Lambda-2048x1028.png?ezimgfmt=ng:webp/ngcb1 "architecture")
### Cấu trúc thư mục của dự án
![Alt](https://media.techmaster.vn/api/static/4930/RvrNYkEE "project")
### main.tf
- Chúng ta cần định nghĩa một số biến cục bộ để sử dụng trong toàn bộ dự án. Chúng ta có thể khai báo những biến cục bộ này trong file main.tf như hình bên dưới
![Alt](https://media.techmaster.vn/api/static/4930/icmaOeBA "main-tf")
### providers.tf
- Theo good practice và để dễ bảo trì, chúng ta nên định nghĩa Terraform provider, version và AWS region mặc định bên trong file riêng biệt providers.tf như sau
![Alt](https://media.techmaster.vn/api/static/4930/EO0iRQHU "providers.tf")
### variables.tf
- File variables.tf được dùng để định nghĩa các biến sử dụng trong toàn bộ dự án như AWS region
![Alt](https://media.techmaster.vn/api/static/4930/AUaQmn18 "var.tf")
### simple_lambda.tf
- Bây giờ thì chúng ta đến phần chính của dự án này, đây là phần định nghĩa, khai báo lambda function.
![Alt](https://media.techmaster.vn/api/static/4930/IAIlUL6m "lambda.tf")   
- Dưới đây là phần giải thích các định nghĩa, biến trong aws lambda function
    * ```resource_name_prefix``` – biến prefix được tái sử dụng làm prefix trong toàn bộ tên của resources khi cần thiết
    * ```lambda_code_path``` - đường dẫn thư mục chứa mã nguồn chính lambda function; biến ```${path.module}`` cho phép lấy đường dẫn hiện tại của terraform module.
    * ```lambda_archive_path``` - đường dẫn thư mục chứa file nén mã nguồn chính lambda function, file nén này được xem như là một đơn vị triển khai của AWS lambda function.
    * ```lambda_handler``` - tên của function chính xử lý (entry point) trong mã nguồn lambda function.
    * ```lambda_description``` - mô tả lambda function.
    * ```lambda_runtime``` - là identifier tương ứng với ngôn ngữ lập trình và phiên bản dùng để cài đặt lambda function. Ví dụ như python3.9 trong dự án này là dùng ngôn ngữ lập trình python 3.9. Ngoài ra, lambda function còn hỗ trợ nhiều ngôn ngữ khác như nodejs, ruby, java, golang. Tham khảo danh sách lambda runtime ở đây https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html
    * ```lambda_timeout``` - thời gian chờ xử lý tối đa cho lambda function. Nếu thời gian xử lý vượt ngoài phạm vi này, lambda function sẽ trả ra lỗi.
    * ```lambda_concurrent_executions``` - lambda function hỗ trợ thực thi song song, thiết lập giá trị bằng -1 để không cần xử lý song song trong dự án này.
    * ```lambda_cw_log_group_name``` - tên của cloudwatch log group để lưu trữ logs của lambda function
    * ```lambda_log_retention_in_days``` - số lượng ngày tối đa lưu giữ lại log của lambda function.
    * Khai báo một Terraform ```archive_file``` data sources tên là ```simple_lambda_zip``` để tạo ra một file nén mã nguồn lambda function như một đơn vị triển khai.
    * Tạo một ```aws_iam_policy_document``` để cấu hình IAM policy document để gán vào định nghĩa iam role bên dưới.
    * Định nghĩa một ```aws_iam_role``` để thiết lập một tập hợp những policy và gán iam role này vào cho lambda function.
    * Định nghĩa ```aws_lambda_function``` resource để chính thức tạo một lamda function cùng với các cấu hình đã được chuẩn bị ở bên trên.
    * Định nghĩa ```aws_cloudwatch_log_group``` resource để quản lý lambda function logs. Resource này được yêu cầu phải định nghĩa nếu bạn muốn xoá tất cả các logs của lambda function khi bạn destroy module này.
### Mã nguồn của lambda function
- Với mục đích demo, chúng ta định nghĩa logic chính của lamda function này rất đơn giản. Nó sẽ nhận request đầu vào là một document ```event``` ở dạng JSON và trả ra nội dung của document này với response code là 200.
![Alt](https://media.techmaster.vn/api/static/4930/cWXBcYc0 "lambdasrc.tf")

## Thực thi triển khai AWS Lambda function
- Câu lệnh đầu tiên cần thực thi là ```terraform init``` để Terraform download những modules, providers cần thiết, sau đó khởi tạo dự án và sẵn sàng cho việc triển khai.
- Tiếp theo, nếu chúng ta muốn review xem trước những thay đổi sẽ xảy ra thì chúng ta thực thi câu lệnh ```terraform plan```
- Cuối cùng, thực thi lệnh ```terraform apply -auto-approve``` để chính thức thực thi việc triển khai.

## Kết quả và kiểm thử sau khi triển khai
Có rất nhiều cách để kiểm thử lambda function sau khi đã triển khai thành công.
1. Dùng giao diện AWS console
- Truy cập vào AWS lambda như hình, chọn lamda function tương ứng và Test. Copy and paste nội dung JSON document trong file ./simple_lambda/demo_event.json vào phần Event JSON như hình.
![Alt](https://media.techmaster.vn/api/static/4930/rdOgwI4N "test1")
![Alt](https://media.techmaster.vn/api/static/4930/0yRZFeFd "test2")

2. Dùng AWS CLI
```
aws lambda invoke \
  --function-name managing-lambda-using-terraform-simple-lambda-lambda \
  --cli-binary-format raw-in-base64-out \
  /tmp/managing-lambda-using-terraform-simple-lambda-lambda-response.json
```

![Alt](https://media.techmaster.vn/api/static/4930/pmbImp8a "cli")

## Mã nguồn và Tham Khảo 
- Mã Nguồn : 
- Nguồn Tham Khảo : https://hands-on.cloud/how-to-manage-aws-lambda-using-terraform/#h-what-is-aws-lambda-and-what-are-its-benefits
- Mọi góp ý xin tạo pull request hoặc issue trực tiếp trên mã nguồn.