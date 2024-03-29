import XCTest
@testable import MemeMe

class MainViewControllerTests: XCTestCase {
    
    var sut: MainViewController! // sut stands for "System Under Test"
    
    override func setUpWithError() throws {
        super.setUp()
        // Instantiate the MainViewController from the storyboard or create it programmatically
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
        sut.loadViewIfNeeded() // Calls the view lifecycle methods up to viewDidLoad()
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testTextFieldSetup() throws {
        // Perform initial setup tests
        XCTAssertNotNil(sut.topTextField, "Top text field should not be nil after view is loaded")
        XCTAssertNotNil(sut.bottomTextField, "Bottom text field should not be nil after view is loaded")
        
        // Check initial setup text
        XCTAssertEqual(sut.topTextField.text, "TOP", "Top text field should be set to TOP")
        XCTAssertEqual(sut.bottomTextField.text, "BOTTOM", "Bottom text field should be set to BOTTOM")
    }
    
    func testShareButtonInitiallyDisabled() throws {
        // Share button should be disabled initially
        XCTAssertFalse(sut.btnShare.isEnabled, "Share button should be initially disabled")
    }
    
    func testCameraButtonDisabledInSimulator() throws {
        let isSimulator = true
        XCTAssertEqual(sut.btnCamera.isEnabled, !isSimulator, "Camera button enable state does not match expected value")
    }
    
    func testCameraButtonEnabledWhenNotInSimulator() throws {
        let isSimulator = false
        XCTAssertEqual(sut.btnCamera.isEnabled, !isSimulator, "Camera button enable state does not match expected value")
    }
    
    // Add more tests to cover as much functionality as possible.
}
