import Foundation

protocol HasArea {
    var area: Double { get }
}

protocol HasName {
    var name: String { get }
}

class Box: HasArea, HasName {
    var w = 0.0, h = 0.0
    var area: Double {
        get { w * h}
    }
    let name = "Box"

    init(w: Double, h: Double) {
        self.w = w
        self.h = h
    }
}

class Circle: HasArea {
    var r = 0.0
    var area: Double {
        get { Double.pi * r * r }
    }

    init(r: Double) {
        self.r = r
    }
}

class Cat: HasName {
    let name = "Cat"
}

func getInfo(about obj: Any) -> String {
    switch obj {
    case let obj as (HasArea & HasName):
        return "Area of \(obj.name) object is \(obj.area)"
    case let obj as HasArea:
        return "Unknown object area is \(obj.area)"
    case let obj as HasName:
        return "Object \(obj.name) has no area"
    default:
        return "Object unknown"
    }
}

let objects: [Any] = [Box(w: 2.0, h: 3.0), Circle(r: 5.0), Cat(), "String"]

for obj in objects {
    let info = getInfo(about: obj)
    print(info)
}
