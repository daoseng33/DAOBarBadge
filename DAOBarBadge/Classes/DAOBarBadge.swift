//
//  DAOBarBadge.swift
//  DAOBarBadge
//
//  Created by daoseng33 on 2019/7/2.
//  Copyright © 2019 LikeABossApp. All rights reserved.
//

import UIKit

public enum BadgeDirection {
	case left
	case right
}

public class DAOBarBadge: UIBarButtonItem {
	// Public properties
	@IBInspectable
	public var badgeNumber: Int = 0 {
		didSet {
			self.updateBadge()
		}
	}
	
	/// Default badge max count is 99, when value reach max count, the badge label will show 99+
	@IBInspectable
	public var maxCount: Int = 99
	
	@IBInspectable
	public var badgeBackgroundColor: UIColor = .red {
		didSet {
			label.backgroundColor = badgeBackgroundColor
		}
	}
  
  @IBInspectable
  public var badgeTextFont: UIFont = UIFont.systemFont(ofSize: 11) {
    didSet {
      label.font = badgeTextFont
    }
  }
	
	@IBInspectable
	public var badgeTextColor: UIColor = .white {
		didSet {
			label.textColor = badgeTextColor
		}
	}
  
  @IBInspectable
  public var badgeTransparency: CGFloat = 0.9 {
    didSet {
      label.alpha = badgeTransparency
    }
  }
	
	public var badgeDirection: BadgeDirection = .left
	
	/// If value < 0, badge move left; if value > 0, badge move right
	public var badgeOffset: CGFloat = 0.0
	
	// Private properties
  lazy private var label: UILabel = {
    let label = UILabel()
    label.backgroundColor = badgeBackgroundColor
    label.alpha = 0.9
    label.layer.cornerRadius = badgeSize.width / 2
    label.clipsToBounds = true
    label.isUserInteractionEnabled = false
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.textColor = badgeTextColor
    label.layer.zPosition = 1
    label.font = badgeTextFont
    
    return label
  }()
  
	private let badgeSize: CGSize = CGSize(width: 16, height: 16)
	private let viewString: String = "view"
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

		setup()
	}
	
	public override init() {
		super.init()
		
		setup()
	}
	
	override public func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
		self.updateBadge()
	}
	
	private func setup() {
		addObserver(self, forKeyPath: viewString, options: [], context: nil)
	}
	
	private func updateBadge() {
		guard let view = value(forKey: viewString) as? UIView else { return }
		
		label.text = badgeNumber > maxCount ? "\(maxCount)+" : "\(badgeNumber)"
		
		if badgeNumber > 0 && label.superview == nil {
			view.addSubview(self.label)
			
			let height = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: badgeSize.height)
			let width = NSLayoutConstraint(item: label, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: badgeSize.width)
			let centerX = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: badgeDirection == .left ? -10 + badgeOffset : 10 + badgeOffset)
			let centerY = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: -12)
			
			NSLayoutConstraint.activate([height, width, centerX, centerY])
		} else if badgeNumber == 0 && label.superview != nil {
			label.removeFromSuperview()
		}
	}
	
	deinit {
		removeObserver(self, forKeyPath: viewString)
	}
}
