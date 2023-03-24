# Ryanair_QA_WEB_Challenge !
This repository was created for the purpose of performing the requested WEB QA test. This test consists of performing 1 test cases for the Ryanair Site on the https://www.ryanair.com/ie/en website and automating them using Robot Framework and Python/Selenium


Automation was created using Python 3.11.2 with Robot Framework 6.0.2 and Selenium Library.

Links to the tools used and their documentation.

[Python](https://www.python.org)

[ChromeDriver](https://chromedriver.chromium.org/downloads)

[Google Chrome](https://www.google.com/intl/pt-BR/chrome/)



[Robot Framework](https://robotframework.org):

```
pip install robotframework
```
[Selenium Library](https://github.com/robotframework/SeleniumLibrary/):
```
pip install robotframework-seleniumlibrary
```

>After cloning the repository, open it in your desired text editor, in my case I will be using VScode.

With the repository downloaded and the libraries installed, take the ChromeDriver downloaded earlier and place it in the root folder of your Python, it will probably be on disk C:, by doing this Selenium will find the file and run the automation.
![image](https://user-images.githubusercontent.com/108106559/227609491-7ed2d596-b119-42d7-8c44-791a8f0faca4.png)


Now inside VSCode, when opening the terminal we can run our automation in 3 ways.
Using the command
```
robot -d Results .\Test\ryanair_test.robot
```
It will start the automation of the test, automatically open the chrome pages and run the entire process of the automated test flow, and finally after 1-2 minutes it will finish the process and run the simple report in the terminal itself and on the Results folder that the program created.

![image](https://user-images.githubusercontent.com/108106559/227627512-e7c7b147-864b-474d-9157-82f24be39de7.png)



It will cause the script inside the Resources folder file avenuecode_automation.resource to run, running the 1 test scenario which is:

✔Test Case 01 - Search a flight and login



The test scenario will be inside the test folder in the file bdds.features where they will be referenced and it is also possible to see all the bdds and their steps in full.

![image](https://user-images.githubusercontent.com/108106559/227627676-0ef0c7c3-8d81-437d-a737-4dec87890a99.png)


Also in the Resources folder, we can also see the code referenced in the main test that is avenuecode_automation.resource file where we will create the custom commands to be used for each BDD in the main automation sheet.

![image](https://user-images.githubusercontent.com/108106559/227627754-fffa6a78-4fb6-4b0d-9807-2b2724c20752.png)


After finishing the automation process, you will see that the Results folder is populated with prints and XML files, allowing for a report of the automation and prints of when the step is finished.

![image](https://user-images.githubusercontent.com/108106559/227627987-6e621ec6-b602-4ef9-a67b-691e19fce545.png)


Having accomplished all this process, your automation will already be functional and with reports available on the log on Results folder and with the scripts oriented to BDD, step for step. if you have any questions I'll be available! 😁

![image](https://user-images.githubusercontent.com/108106559/227628723-4bf64b15-9b2b-44d5-b46b-34c32daf4090.png)



