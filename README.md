# Book store

## Built With
Book store using spring mvc and hibernate.
<br>
*Java<br>
*Spring MVC<br>
*Hibernate and JPA<br>
*AWS S3 (s3 ninja)<br>
*MySQL<br>
*Guava for caching<br>
*Async transactions for scalability<br>
*Maven<br>
*Materialize for front-end<br>
*Tomcat 8.0


## Description
Some functionalities:<br>
*Login<br>
*Logout<br>
*List books<br>
*Add new books<br>
*List users<br>
*Add books to shopping cart<br>
*Finalize purchase<br>
*List specific books<br>


Books are divided in three main categories:<br>
*E-books<br>
*Printed<br>
*Combo (E-books + Printed).<br>

Every book has a quantity of pages, photo, title, description and a release date.

<br><br>

## Prerequisites
MySQL and Java 8 installed


## Getting started
|<br>
|---casadocodigo ---------------- main project, uses spring mvc<br>
|---casadocodigospringboot ------ side project, sample using spring boot<br>
<br>
1. Download project.<br>
2. Download s3 ninja. https://s3ninja.net/<br>
3. Run s3 ninja: <br>
```
cd your-directory-s3-ninja
java IPL
```
Now you are running s3 ninja simulatting amazon s3 on port 9444.<br>
4. Create a bucket called casadocodigo.
Go to localhost:9444 and create the bucket<br>
5. Import project in eclipse as maven project<br>
6. Run maven update<br>
7. Configure your settings in JPAConfiguration class inside conf package.
Note: project is using port 3307, default is 3306 for mysql.<br>
8. Do any other configuration that you would like<br>
9. Run mysql server
10. Run it on tomcat 8.0<br>





## License
This project is licensed under the MIT License

