import UIKit

public struct PlaygroundHelpers {
  public enum Orientation {
    case portrait
    case landscape
  }

  public enum DeviceType {
    case iphone4
    case iphoneSE
    case iphone8
    case iphone8Plus
    case iphoneX
  }

  public static func preview(
    _ viewController: UIViewController,
    forDeviceType deviceType: DeviceType,
    orientation: Orientation = .portrait,
    additionalTraits: [UITraitCollection] = []
  ) -> UIViewController {
    let deviceScreenSize = screenSize(for: deviceType, and: orientation)

    let parentViewController = UIViewController()
    parentViewController.preferredContentSize = deviceScreenSize
    parentViewController.view.frame = CGRect(origin: .zero, size: deviceScreenSize)

    viewController.preferredContentSize = deviceScreenSize
    viewController.view.frame = CGRect(origin: .zero, size: deviceScreenSize)

    parentViewController.addChildViewController(viewController)

    let parentTraits = traits(for: deviceType, and: orientation)
    let allTraits = UITraitCollection(traitsFrom: parentTraits + additionalTraits)
    parentViewController.setOverrideTraitCollection(allTraits, forChildViewController: viewController)

    parentViewController.view.addSubview(viewController.view)

    return parentViewController
  }

  public static func screenSize(for deviceType: DeviceType, and orientation: Orientation) -> CGSize {
    let portraitSize: CGSize

    switch deviceType {
    case .iphone4:
      portraitSize = CGSize(width: 320, height: 480)
    case .iphoneSE:
      portraitSize = CGSize(width: 320, height: 568)
    case .iphone8:
      portraitSize = CGSize(width: 375, height: 667)
    case .iphone8Plus:
      portraitSize = CGSize(width: 414, height: 736)
    case .iphoneX:
      portraitSize = CGSize(width: 375, height: 812)
    }

    switch orientation {
    case .portrait:
      return portraitSize
    case .landscape:
      return CGSize(width: portraitSize.height, height: portraitSize.width)
    }
  }

  public static func traits(for deviceType: DeviceType, and orientation: Orientation) -> [UITraitCollection] {
    let commonTraits: [UITraitCollection] = [.init(userInterfaceIdiom: .phone)]
    let deviceSpecificTraits: [UITraitCollection]

    switch (deviceType, orientation) {
    case (.iphoneSE, .portrait),
         (.iphone8, .portrait):
      deviceSpecificTraits = [.init(horizontalSizeClass: .compact), .init(verticalSizeClass: .regular)]
    case (.iphoneSE, .landscape),
         (.iphone8, .landscape):
      deviceSpecificTraits = [.init(horizontalSizeClass: .compact), .init(verticalSizeClass: .compact)]
    case (.iphone8Plus, .portrait),
         (.iphoneX, .portrait):
      deviceSpecificTraits = [.init(horizontalSizeClass: .compact), .init(verticalSizeClass: .regular)]
    case (.iphone8Plus, .landscape),
         (.iphoneX, .landscape):
      deviceSpecificTraits = [.init(horizontalSizeClass: .regular), .init(verticalSizeClass: .compact)]
    default:
      deviceSpecificTraits = []
    }

    return commonTraits + deviceSpecificTraits
  }

}
