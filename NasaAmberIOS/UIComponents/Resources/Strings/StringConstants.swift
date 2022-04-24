// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum CuriosityController {
    /// Curiosity
    public static let title = L10n.tr("Localizable", "CuriosityController.title")
  }

  public enum DetailController {
    /// Camera:
    public static let camera = L10n.tr("Localizable", "DetailController.camera")
    /// Photo Date:
    public static let earthDate = L10n.tr("Localizable", "DetailController.earthDate")
    /// Landing Date:
    public static let landingDate = L10n.tr("Localizable", "DetailController.landingDate")
    /// Launch Date:
    public static let launchDate = L10n.tr("Localizable", "DetailController.launchDate")
    /// Rover:
    public static let rover = L10n.tr("Localizable", "DetailController.rover")
    /// Status:
    public static let roverStatus = L10n.tr("Localizable", "DetailController.roverStatus")
  }

  public enum Filter {
    /// Filter
    public static let title = L10n.tr("Localizable", "Filter.title")
  }

  public enum General {
    /// Araç
    public static let rover = L10n.tr("Localizable", "General.rover")
  }

  public enum Intro {
    /// This API is designed to collect image data gathered by NASA's Curiosity, Opportunity, and Spirit rovers on Mars and make it more easily available to other developers, educators, and citizen scientists
    public static let descriptionText = L10n.tr("Localizable", "Intro.descriptionText")
    /// Welcome to NASA Network!
    public static let firstTitle = L10n.tr("Localizable", "Intro.firstTitle")
    /// Next
    public static let next = L10n.tr("Localizable", "Intro.Next")
    /// Photos of NASA vehicles are waiting for you.
    public static let secondTitle = L10n.tr("Localizable", "Intro.secondTitle")
    /// Begin!
    public static let start = L10n.tr("Localizable", "Intro.Start")
    /// Mars photos are here for you.
    public static let thirdTitle = L10n.tr("Localizable", "Intro.thirdTitle")
  }

  public enum OpportunityController {
    /// Opportunity
    public static let title = L10n.tr("Localizable", "OpportunityController.title")
  }

  public enum SpiritController {
    /// Spirit
    public static let title = L10n.tr("Localizable", "SpiritController.title")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
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
