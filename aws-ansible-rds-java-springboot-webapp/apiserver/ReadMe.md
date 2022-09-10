# Hướng dẫn triển khai

1. Cài đặt Java JDK 17
2. Cài đặt VSCode với "Extension Pack for Java" và "Spring Boot Extension Pack"
3. Mở terminal vào thư mục dự án
4. Gõ lệnh `mvn package` để biên dịch ra file *.jar
5. Sau khi biên dịch thành công thì `cd target` rồi gõ lệnh `java -jar apiserver-1.0.jar` để chạy thử
6. Mở trình duyệt vào http://localhost sẽ thấy nội dung như sau

```json
[
  {
    "id": "1",
    "title": "Gone with the wind",
    "author": "Margaret Mitchell",
    "year": 1936
  },
  {
    "id": "2",
    "title": "Dế Mèn Phiêu Lưu Ký",
    "author": "Tô Hoài",
    "year": 1941
  },
  {
    "id": "3",
    "title": "Sông Đông êm đềm",
    "author": "Mikhail Aleksandrovich Sholokhov. ",
    "year": 1925
  }
]
```
7. Muốn chạy ứng dụng Java trong back ground process
`nohup java -jar apiserver-1.0.jar`