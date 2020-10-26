//
//  CoreDataFactoryManager.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//


import Foundation
import UIKit

public typealias MainFont = FontManager.SourceSansPro
public typealias Metropolis = FontManager.Metropolis

public enum FontManager {
    
    public enum SourceSansPro: GenericValueProtocol {
        case Black(CGFloat)
        case BlackItalic(CGFloat)
        case Bold(CGFloat)
        case BoldItalic(CGFloat)
        case ExtraLight(CGFloat)
        case ExtraLightItalic(CGFloat)
        case Italic(CGFloat)
        case Light(CGFloat)
        case LightItalic(CGFloat)
        case Regular(CGFloat)
        case SemiBold(CGFloat)
        case SemiBoldItalic(CGFloat)
        
        typealias Value = UIFont?
        
        public var value: UIFont? {
            switch self {
            case .Black(let size):
                return UIFont(name: "SourceSansPro-Black", size: size)
            case .BlackItalic(let size):
                return UIFont(name: "SourceSansPro-BlackItalic", size: size)
            case .Bold(let size):
                return UIFont(name: "SourceSansPro-Bold", size: size)
            case .BoldItalic(let size):
                return UIFont(name: "SourceSansPro-BoldItalic", size: size)
            case .ExtraLight(let size):
                return UIFont(name: "SourceSansPro-ExtraLight", size: size)
            case .ExtraLightItalic(let size):
                return UIFont(name: "SourceSansPro-ExtraLightItalic", size: size)
            case .Italic(let size):
                return UIFont(name: "SourceSansPro-Italic", size: size)
            case .Light(let size):
                return UIFont(name: "SourceSansPro-Light", size: size)
            case .LightItalic(let size):
                return UIFont(name: "SourceSansPro-LightItalic", size: size)
            case .Regular(let size):
                return UIFont(name: "SourceSansPro-Regular", size: size)
            case .SemiBold(let size):
                return UIFont(name: "SourceSansPro-SemiBold", size: size)
            case .SemiBoldItalic(let size):
                return UIFont(name: "SourceSansPro-SemiBoldItalic", size: size)
            }
            
        }
    }

    public enum Metropolis {
        case test1(CGFloat)
        case test2(CGFloat)
        
        typealias Value = UIFont?
        
        var value: UIFont? {
            switch self {
            case .test1(let size):
                return UIFont(name: "SourceSansPro-Black", size: size)
            case .test2(let size):
                return UIFont(name: "SourceSansPro-BlackItalic", size: size)
            }
            
        }
    }
    
}
