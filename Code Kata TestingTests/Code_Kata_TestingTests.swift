//
//  Code_Kata_TestingTests.swift
//  Code Kata TestingTests
//
//  Created by Cane Allesta on 10/1/22.
//

import XCTest
@testable import Code_Kata_Testing

class CodeKataTestingTests: XCTestCase {
    
    // Boolean Assertions: Testea una condición que devuelve un resultado true o false.
    func testIsUserLogged() throws {
        // This is an example of a functional test case for practice Boolean Assertions
        // Arrange - Given
        let sut = HomeViewModel()
        
        // Act - When
        let isUserLogged = sut.isUserLogged()
        
        // Assert - Then
        // If If we want to affirm that it is true we use these options
        XCTAssertTrue(isUserLogged)
        XCTAssert(isUserLogged)
        
        // If we want to affirm that it is false we use this option
        // XCTAssertFalse(isUserLogged)
    }
    
    // Nil and Non-Nil Assertions: Testea si una condición tiene o no tiene un valor.
    func testFormatPrice() {
        // This is an example of a functional test case for practice Nil and Non-Nil Assertions
        // Arrange - Given
        let sut = HomeViewModel()
       
        // Act - When
        let formatPrice = sut.formatPrice(price: "20.80")
        
        // Assert - Then
        // We can use this option
        XCTAssertNotNil(formatPrice)
        // Or this one
        // XCTAssertNil(formatPrice)
    }
    
    // Equality and Inequality Assertions: Testea si dos valores son iguales o no.
    func testEqualsUids() {
        // This is an example of a functional test case for practice Equality and Inequality Assertions
        // Arrange - Given
        let sut = HomeViewModel()
       
        // Act - When
        let userId = sut.getUserUid()
        let productSubscriptionId = sut.getProductSubscriptionUid()
        
        // Assert - Then
        // We can use this option
        XCTAssertEqual(userId, productSubscriptionId)
        // Or this one
        // XCTAssertNotEqual(userId, productSubscriptionId)
        
        XCTAssert(sut.areEqualsUids())
    }
    
    // Error Assertions: Testea sin un método lanza o no un error.
    func testFormValidator() {
        // This is an example of a functional test case for practice Error Assertions
        // Arrange - Given
        let sut = HomeViewModel()
        
        // Act - When and Assert- Then
        // We can use this option
        XCTAssertNoThrow(try sut.isValidPassword(password: "1212121"), "This method can throw an error if the password is not valid")
        
        // Or this one
        XCTAssertThrowsError(try sut.isValidPassword(password: "*1212121"), "This method can throw an error if the password is not valid") { error in
            XCTAssertEqual(error as? HomeErrors, HomeErrors.invalidPassword)
        }
    }
    
    // Unconditional Test Failures: Genera un fallo de test inmediatamente dada cualquier condición.
    func testGetUserEmail() {
        // This is an example of a functional test case for practice Unconditional Test Failures
        // Arrange - Given
        let sut = HomeViewModel()
        // Act - When
        guard let _ = sut.getUserEmail() else {
            // Assert - Then
            // We can use this option
            XCTFail("This method must return a value for the price")
            return
        }
    }
    
    // Expected Failures: Anticipa fallos en los test, para prevenir que estos, afecten tu flujo de los mismos.
    func testColorGenerator() {
        // This is an example of a functional test case for practice Expected Failures
        // Arrange - Given
        let sut = HomeViewModel()
        // Act - When
        guard let color = sut.generateColorHexaDecimal(for: .labels) else {
            XCTFail("This method must return a value for the color")
            return
        }
        
        // Assert - Then
        // We can use this option. If you use it, the tests below will not be executed
        // XCTExpectFailure("We're refactoring avatar colors generation, and this option is not currently available")
        
        // Or this one. If you use it, the tests below will be executed
        XCTExpectFailure("We're refactoring avatar colors generation, and this option is not currently available") {
            XCTAssertEqual(color, "#000000")
        }
        
        // And this test
        XCTAssertEqual(color, "black")
        
        let options = XCTExpectedFailure.Options()
        
        // Set its strictness: El test pasará incluso si no se produce un error esperado
        options.isStrict = false
        
        // Temporarily disabled: Podemos deshabilitar el error esperado temporalmente o solo para una plataforma.
        #if os(iOS)
        options.isEnabled = true
        #endif
        
        XCTExpectFailure("We're refactoring avatar colors generation, and this option is not currently available", options: options) {
            XCTAssertEqual(color, "#000000")
        }
    }
    
    // Methods for Skipping Tests: Salta un determinado test cuando ocurre una determinada condición.
    func testGetUserModel() throws {
        // This is an example of a functional test case for practice Methods for Skipping Tests
        // Arrange - Given
        let sut = HomeViewModel()
        
        // Act - When
        let userModel = sut.getUserModel()
        XCTAssertNotNil(userModel)
        
        // Assert - Then
        try XCTSkipIf(userModel.title.isEmpty, "")
        XCTAssertEqual(userModel.title, "IPhone 13 Pro")
    }
    
    // Testing Asynchronous Operations with Expectations: Estas te permiten obtener el performance de tareas largas o tareas que ocurran en el background,
    // esperar por ellas y ver si cumplen alguna condición especificada.
    func testFetchUserModel() {
        // This is an example of a functional test case for practice Methods for Skipping Tests
        // Arrange - Given
        let sut = HomeViewModel()
        
        
        // We can use this option.
        // let expectation = XCTestExpectation(description: "Download apple.com home page")
        
        // or this one
        // Create an expectation for a background download task.
        let expt = self.expectation(description: "Download apple.com home page")
        
        // Act - When
        sut.fetchUserModel { result in
            switch result {
                case .success(let model):
                    // Assert - Then
                    XCTAssertNotNil(model)
                case .failure(let error):
                    // Assert - Then
                    XCTAssertNil(error)
            }
            
            expt.fulfill()
        }
        
        wait(for: [expt], timeout: 10.0)
    }
}
