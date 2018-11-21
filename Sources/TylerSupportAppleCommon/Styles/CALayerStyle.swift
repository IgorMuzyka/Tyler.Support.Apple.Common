
import Variable
import Substitutes
import Style
import Tag

public enum CALayerStyle: Style {

	case bounds(Variable<Rect>)
	case position(Variable<Point>)
	case zPosition(Variable<Number>)
	case anchorPoint(Variable<Point>)
	case anchorPointZ(Variable<Number>)
	case frame(Variable<Rect>)
	//    case transform
	#warning("also no type yet to store this - consider")
	case isHidden(Variable<Bool>)
	case isDoubleSided(Variable<Bool>)
	case isGeometryFlipped(Variable<Bool>)
	case masksToBounds(Variable<Bool>)
	case contentsRect(Variable<Rect>)
	case contentsScale(Variable<Number>)
	case isOpaque(Variable<Bool>)
	case backgroundColor(Variable<Color>)
	case cornerRadius(Variable<Number>)
	case borderWidth(Variable<Number>)
	case borderColor(Variable<Color>)
	case opacity(Variable<Float>)
	case shouldRasterize(Variable<Bool>)
	case rasterizationScale(Variable<Number>)
	case shadowColor(Variable<Color>)
	case shadowOpacity(Variable<Float>)
	case shadowOffset(Variable<Size>)
	case shadowRadius(Variable<Number>)
	case shadowPath(Variable<BezierPath>)
}

extension CALayerStyle: Codable {

    private enum CodingKeys: String, CodingKey {

        case bounds
        case position
        case zPosition
        case anchorPoint
        case anchorPointZ
        case frame
        case isHidden
        case isDoubleSided
        case isGeometryFlipped
        case masksToBounds
        case contentsRect
        case contentsScale
        case isOpaque
        case backgroundColor
        case cornerRadius
        case borderWidth
        case borderColor
        case opacity
        case shouldRasterize
        case rasterizationScale
        case shadowColor
        case shadowOpacity
        case shadowOffset
        case shadowRadius
        case shadowPath
    }

    public enum CALayerStyleCodingError: Error {
        case decoding(String)
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

		if let value = try? values.decode(Variable<Rect>.self, forKey: .bounds) {
			self = .bounds(value)
		} else if let value = try? values.decode(Variable<Point>.self, forKey: .position) {
			self = .position(value)
		} else if let value = try? values.decode(Variable<Number>.self, forKey: .zPosition) {
			self = .zPosition(value)
		} else if let value = try? values.decode(Variable<Point>.self, forKey: .anchorPoint) {
			self = .anchorPoint(value)
		} else if let value = try? values.decode(Variable<Number>.self, forKey: .anchorPointZ) {
			self = .anchorPointZ(value)
		} else if let value = try? values.decode(Variable<Rect>.self, forKey: .frame) {
			self = .frame(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .isHidden) {
			self = .isHidden(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .isDoubleSided) {
			self = .isDoubleSided(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .isGeometryFlipped) {
			self = .isGeometryFlipped(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .masksToBounds) {
			self = .masksToBounds(value)
		} else if let value = try? values.decode(Variable<Rect>.self, forKey: .contentsRect) {
			self = .contentsRect(value)
		} else if let value = try? values.decode(Variable<Number>.self, forKey: .contentsScale) {
			self = .contentsScale(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .isOpaque) {
			self = .isOpaque(value)
		} else if let value = try? values.decode(Variable<Color>.self, forKey: .backgroundColor) {
			self = .backgroundColor(value)
		} else if let value = try? values.decode(Variable<Number>.self, forKey: .cornerRadius) {
			self = .cornerRadius(value)
		} else if let value = try? values.decode(Variable<Number>.self, forKey: .borderWidth) {
			self = .borderWidth(value)
		} else if let value = try? values.decode(Variable<Color>.self, forKey: .borderColor) {
			self = .borderColor(value)
		} else if let value = try? values.decode(Variable<Float>.self, forKey: .opacity) {
			self = .opacity(value)
		} else if let value = try? values.decode(Variable<Bool>.self, forKey: .shouldRasterize) {
			self = .shouldRasterize(value)
		} else if let value = try? values.decode(Variable<Number>.self, forKey: .rasterizationScale) {
			self = .rasterizationScale(value)
		} else if let value = try? values.decode(Variable<Color>.self, forKey: .shadowColor) {
			self = .shadowColor(value)
		} else if let value = try? values.decode(Variable<Float>.self, forKey: .shadowOpacity) {
			self = .shadowOpacity(value)
		} else if let value = try? values.decode(Variable<Size>.self, forKey: .shadowOffset) {
			self = .shadowOffset(value)
		} else if let value = try? values.decode(Variable<Number>.self, forKey: .shadowRadius) {
			self = .shadowRadius(value)
		} else if let value = try? values.decode(Variable<BezierPath>.self, forKey: .shadowPath) {
			self = .shadowPath(value)
		} else {
            throw CALayerStyleCodingError.decoding("\(dump(values))")
        }
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .bounds(let value): try container.encode(value, forKey: .bounds)
        case .position(let value): try container.encode(value, forKey: .position)
        case .zPosition(let value): try container.encode(value, forKey: .zPosition)
        case .anchorPoint(let value): try container.encode(value, forKey: .anchorPoint)
        case .anchorPointZ(let value): try container.encode(value, forKey: .anchorPointZ)
        case .frame(let value): try container.encode(value, forKey: .frame)
        case .isHidden(let value): try container.encode(value, forKey: .isHidden)
        case .isDoubleSided(let value): try container.encode(value, forKey: .isDoubleSided)
        case .isGeometryFlipped(let value): try container.encode(value, forKey: .isGeometryFlipped)
        case .masksToBounds(let value): try container.encode(value, forKey: .masksToBounds)
        case .contentsRect(let value): try container.encode(value, forKey: .contentsRect)
        case .contentsScale(let value): try container.encode(value, forKey: .contentsScale)
        case .isOpaque(let value): try container.encode(value, forKey: .isOpaque)
        case .backgroundColor(let value): try container.encode(value, forKey: .backgroundColor)
        case .cornerRadius(let value): try container.encode(value, forKey: .cornerRadius)
        case .borderWidth(let value): try container.encode(value, forKey: .borderWidth)
        case .borderColor(let value): try container.encode(value, forKey: .borderColor)
        case .opacity(let value): try container.encode(value, forKey: .opacity)
        case .shouldRasterize(let value): try container.encode(value, forKey: .shouldRasterize)
        case .rasterizationScale(let value): try container.encode(value, forKey: .rasterizationScale)
        case .shadowColor(let value): try container.encode(value, forKey: .shadowColor)
        case .shadowOpacity(let value): try container.encode(value, forKey: .shadowOpacity)
        case .shadowOffset(let value): try container.encode(value, forKey: .shadowOffset)
        case .shadowRadius(let value): try container.encode(value, forKey: .shadowRadius)
        case .shadowPath(let value): try container.encode(value, forKey: .shadowPath)
        }
    }
}

extension Stylable {

    @discardableResult
    public func style(_ style: CALayerStyle, tags: [Tag] = []) -> Self {
        return self.style(style: style, tags: tags)
    }
}
