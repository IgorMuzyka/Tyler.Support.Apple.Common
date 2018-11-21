
import Style
import Tag
import Variable

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

#if os(iOS) || os(tvOS) || os(macOS)

open class CALayerStylist: GenericStylist {

	#if os(iOS) || os(tvOS)
    public static var keyPath: AnyKeyPath? = \UIView.layer
	#elseif os(macOS)
	public static var keyPath: AnyKeyPath? = \NSView.layer as AnyKeyPath?
	#endif

    public func style(stylable layer: CALayer, style: CALayerStyle, tags: [Tag], pair: VariableResolutionPair) throws {
        switch style {
        case .bounds(let value): layer.bounds = try value.resolve(pair).native
        case .position(let value): layer.position = try value.resolve(pair).native
        case .zPosition(let value): layer.zPosition = try value.resolve(pair).native
        case .anchorPoint(let value): layer.anchorPoint = try value.resolve(pair).native
        case .anchorPointZ(let value): layer.anchorPointZ = try value.resolve(pair).native
        case .frame(let value): layer.frame = try value.resolve(pair).native
        case .isHidden(let value): layer.isHidden = try value.resolve(pair)
        case .isDoubleSided(let value): layer.isDoubleSided = try value.resolve(pair)
        case .isGeometryFlipped(let value): layer.isGeometryFlipped = try value.resolve(pair)
        case .masksToBounds(let value): layer.masksToBounds = try value.resolve(pair)
        case .contentsRect(let value): layer.contentsRect = try value.resolve(pair).native
        case .contentsScale(let value): layer.contentsScale = try value.resolve(pair).native
        case .isOpaque(let value): layer.isOpaque = try value.resolve(pair)
        case .backgroundColor(let value): layer.backgroundColor = try value.resolve(pair).native.cgColor
        case .cornerRadius(let value): layer.cornerRadius = try value.resolve(pair).native
        case .borderWidth(let value): layer.borderWidth = try value.resolve(pair).native
        case .borderColor(let value): layer.borderColor = try value.resolve(pair).native.cgColor
        case .opacity(let value): layer.opacity = try value.resolve(pair)
        case .shouldRasterize(let value): layer.shouldRasterize = try value.resolve(pair)
        case .rasterizationScale(let value): layer.rasterizationScale = try value.resolve(pair).native
        case .shadowColor(let value): layer.shadowColor = try value.resolve(pair).native.cgColor
        case .shadowOpacity(let value): layer.shadowOpacity = try value.resolve(pair)
        case .shadowOffset(let value): layer.shadowOffset = try value.resolve(pair).native
        case .shadowRadius(let value): layer.shadowRadius = try value.resolve(pair).native
        case .shadowPath(let value): layer.shadowPath = try value.resolve(pair).native.cgPath
        }
    }
}

#endif
