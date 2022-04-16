// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum Strings {

  public enum Error {
    /// Please check your information.
    public static let checkInformations = Strings.tr("Localizable", "Error.checkInformations")
    /// Please fill in the blanks.
    public static let emptyFields = Strings.tr("Localizable", "Error.emptyFields")
    /// Your email address not in mail format 
    public static let incorrectEmailFormat = Strings.tr("Localizable", "Error.incorrectEmailFormat")
    /// Your email address should contain @.
    public static let incorrectEmailFormata = Strings.tr("Localizable", "Error.incorrectEmailFormata")
    /// The email and password you entered did not match our records. Please try again.
    public static let invalidMatch = Strings.tr("Localizable", "Error.invalidMatch")
    /// Your password must consist of at least 6 characters.
    public static let passwordCharacter = Strings.tr("Localizable", "Error.passwordCharacter")
  }

  public enum General {
    ///   Add Note
    public static let addNote = Strings.tr("Localizable", "General.addNote")
    /// Cancel
    public static let cancel = Strings.tr("Localizable", "General.cancel")
    /// Delete
    public static let delete = Strings.tr("Localizable", "General.delete")
    /// Login
    public static let login = Strings.tr("Localizable", "General.login")
    /// Reset Password
    public static let resetPassword = Strings.tr("Localizable", "General.resetPassword")
    /// Save
    public static let save = Strings.tr("Localizable", "General.save")
    /// Sign Up
    public static let signUp = Strings.tr("Localizable", "General.signUp")
  }

  public enum LoginViewController {
    /// New user? 
    public static let bottomBlackText = Strings.tr("Localizable", "LoginViewController.bottomBlackText")
    /// Sign up now
    public static let bottomBluberryText = Strings.tr("Localizable", "LoginViewController.bottomBluberryText")
    /// Email Address
    public static let emailPlaceholder = Strings.tr("Localizable", "LoginViewController.emailPlaceholder")
    /// Forgot Password?
    public static let forgotPassword = Strings.tr("Localizable", "LoginViewController.forgotPassword")
    /// Login
    public static let loginButton = Strings.tr("Localizable", "LoginViewController.loginButton")
    /// Password
    public static let passwordPlaceholder = Strings.tr("Localizable", "LoginViewController.passwordPlaceholder")
    /// Login or sign up continue using our app.
    public static let subTitle = Strings.tr("Localizable", "LoginViewController.subTitle")
    /// Login
    public static let title = Strings.tr("Localizable", "LoginViewController.title")
  }

  public enum Placeholder {
    /// Description...
    public static let descriptionTitle = Strings.tr("Localizable", "Placeholder.descriptionTitle")
    /// Email Address
    public static let email = Strings.tr("Localizable", "Placeholder.email")
    /// New Password
    public static let newPassword = Strings.tr("Localizable", "Placeholder.newPassword")
    /// Note Title...
    public static let noteTitle = Strings.tr("Localizable", "Placeholder.noteTitle")
    /// Password
    public static let password = Strings.tr("Localizable", "Placeholder.password")
    /// Retype New Password
    public static let retypeNewPassword = Strings.tr("Localizable", "Placeholder.retypeNewPassword")
    /// Search...
    public static let search = Strings.tr("Localizable", "Placeholder.search")
    /// Full Name
    public static let username = Strings.tr("Localizable", "Placeholder.username")
  }

  public enum Success {
    /// Your password has been updated
    public static let succesChangePassword = Strings.tr("Localizable", "Success.succesChangePassword")
    /// Success Sign Up.
    public static let succesSignUp = Strings.tr("Localizable", "Success.succesSignUp")
    /// Your profile has been updated
    public static let succesUpdeteProfile = Strings.tr("Localizable", "Success.succesUpdeteProfile")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
