# Code Kata Unit Testing - Basic Level
### Objective of this Code Kata:

It is to learn the basic concepts about Testing, especially Unit Tests, practice and have fun doing what we like 🙂.
### Importance of doing Tests in our Applications:

In a very global way, it is the way to **ensure** the quality of the product we are creating.

And in a more specific way, you could say that it is the way we have to find bugs, before sending our work and not after.

To be very clear, Testing is an investment, it requires resources to create, run and maintain the tests, therefore, each team looks for strategies and tools that help them minimize costs and maximize the return on it.

There are methodologies based on product testing (meaning that we first write the tests at the time of development and we program focused on the tests).

There are traditional methodologies such as RUP (Rational Unified Process) and the V model.

![V Model](https://insights.sei.cmu.edu/media/images/F1_-_Traditional_V_Model.original.jpg)

Or Agile methodologies such as:

- TDD (Test Driven Development) - “Don't write code until you have the test cases that the code must satisfy”, to achieve this you can follow a process called RED - GREEN - REFACTOR
- TDRE (Test Driven Requirement Engineering) - “Don't implement a requirement until you have defined the acceptance tests that the requirement must satisfy”
- BDD (Behavior Driven Development) - In both TDD and BDD, tests must be defined before development, although in BDD, tests focus on the user and the behavior of the program, unlike TDD which focuses on functionalities. The main difference, in my opinion, is being aware of the need to define "the specification of a user's behavior" instead of "the unit test of a class."

### What types of tests can we do in our Apps:

We can do unit tests, integration tests, user interface tests, and why not, tests for performance tests.

These tests serve, among other things, to:

- Confirm that certain conditions are met in the execution of our program.
- If these conditions are not met, we can record test failures, UI problems, performance problems and manage it with the team.
- These tests can also interact with the UI to validate flows, user experiences and performance of our App.

### What are unit tests, integration tests and UI tests:

These three types are what are called abstraction levels of our Tests, a good testing strategy combines multiple tests of each type to maximize results.

![Model V](https://docs-assets.developer.apple.com/published/ef95ee6af585ccd974aa64b61db87a7a/testing-your-apps-in-xcode-1@2x.png)

There is what is called the test distribution pyramid, which recommends performing:

- A large number of fast and independent unit tests, to cover each small logic of your App.
- A small number of integration tests to demonstrate that these small parts are connected correctly.
- UI tests, to affirm the correct behavior of the different use cases of our App facing the user. These are the definitive indicator that your application works for users in the expected way.

The test distribution pyramid balances high-fidelity tests (UI tests) that demonstrate that users can complete their tasks, with very specific tests that give you quick feedback on the logic of your application and the impact of the changes you make to your code.

### Important concepts to learn:

1- How to add Tests to our project in Xcode, and the different places in the Xcode interface for tests.
We can create the target for tests, right when creating the project, if we did not do it at the beginning, we can add it later.
To create a test file, the simplest way is to create a new file, and tell it to be of type unit test or ui test.

2- What is a TestCase, a TestMethod, which makes up the initial template.

A TestMethod is a small, independent method, which tests a specific block of your code. To add a test method, it must not have any arguments and return void, and give it a name starting with the word test (name of the method).
A TestCase is nothing more than a group of TestMethods that are related to each other, as well as providing other methods that will help us in the life cycle of our tests.

3- Bases for creating unit tests.

As we saw previously in the Test distribution pyramid, unit tests are the basis of it. To do this we need to know some techniques to make good use of them. Techniques such as:

- Each unit test has to assert the expected behavior of a singular part of your code, from a single block of the same. If you want to cover multiple behaviors, then you should write a test for each different scenario that can occur. For example: If you have a method, which receives a parameter that can be nil, and depending on whether a value comes or not, the method reacts or returns different values, then you should create a unit test for each scenario.
- Use techniques in your code such as **encapsulation**, dependency injection, protocol-oriented programming among others, for a better implementation of the tests.
The unit test must follow three simple steps:

- Arrange - Given: What the test depends on, who is the subject or object to be tested. Here you can use different techniques such as “stubs” or “mocks” using protocol-oriented programming or dependency injection, the subjects that we are going to test are the most flexible to replace it or use the real one.
- Act - When: Call the method that we are testing, using the configuration that we implemented in the first phase.
- Assert - Then: Here we use the test Assertions to determine if the method we called in the previous phase behaves in the way we expect or meets the correct expectations. Any Assertion that has a false result will cause the test to fail.

5- What are Test Assertions.

These are methods that allow us to verify the expected values ​​and results in the test methods.

Basic examples of these are:
Boolean Assertions: Test a condition that returns a true or false result.
Nil and Non-Nil Assertions: Test whether a condition has or does not have a value.
Equality and Inequality Assertions: Test whether two values ​​are equal or not.

More advanced examples are:
Error Assertions: Test whether a method throws an error or not.
Unconditional Test Failures: Generate a test failure immediately given any condition.
Expected Failures: Anticipate failures in tests, to prevent them from affecting your test flow.
Methods for Skipping Tests: Skip a certain test when a certain condition occurs.

6- Asynchronous tests and expectations

These allow you to obtain the performance of long tasks or tasks that occur in the background, wait for them and see if they meet a specified condition.

### What now?
Now it's time to practice, and improve the quality of our software using testing along with the different existing techniques and methodologies.
And without further ado, see you in the next Code kata.

### References and resources:

Mundo Testing:
[https://mundotesting.com/que-metodologias-existen-para-el-control-de-calidad-del-software/#Modelos_de_mejora_de_procesos_de_pruebas](https://mundotesting.com/que-metodologias-existen-para-el-control-de-calidad-del-software/#Modelos_de_mejora_de_procesos_de_pruebas)

Apple documentation:
[https://developer.apple.com/documentation/xctest](https://developer.apple.com/documentation/xctest)

Swift code Kata:
[https://qualitycoding.org/swift-code-kata/#t-1601857680305](https://qualitycoding.org/swift-code-kata/#t-1601857680305)

Swift code kata:
[https://project-awesome.org/gamontal/awesome-katas#codekata](https://project-awesome.org/gamontal/awesome-katas#codekata)

Unit testing Articles:
[https://qualitycoding.org/ios-unit-testing/](https://qualitycoding.org/ios-unit-testing/)

This Code Kata Source Code:
[https://github.com/Ifullstack/Code-Kata-Swift-Unit-Testing/tree/main](https://github.com/Ifullstack/Code-Kata-Swift-Unit-Testing/tree/main)
