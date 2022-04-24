//
//  GetPhotos.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 20.04.2022.
//

// MARK: - GetPhotos
public struct GetPhotos: Codable {
    public let photos: [Photo]

    enum CodingKeys: String, CodingKey {
        case photos = "photos"
    }

    public init(photos: [Photo]) {
        self.photos = photos
    }
}

// MARK: - Photo
public struct Photo: Codable {
    public let id: Int?
    public let sol: Int?
    public let camera: Camera?
    public let imgSrc: String?
    public let earthDate: String?
    public let rover: Rover?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case sol = "sol"
        case camera = "camera"
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover = "rover"
    }

    public init(id: Int?, sol: Int?, camera: Camera?, imgSrc: String?, earthDate: String?, rover: Rover?) {
        self.id = id
        self.sol = sol
        self.camera = camera
        self.imgSrc = imgSrc
        self.earthDate = earthDate
        self.rover = rover
    }
}

// MARK: - Camera
public struct Camera: Codable {
    public let id: Int?
    public let name: String?
    public let roverID: Int?
    public let fullName: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case roverID = "rover_id"
        case fullName = "full_name"
    }

    public init(id: Int?, name: String?, roverID: Int?, fullName: String?) {
        self.id = id
        self.name = name
        self.roverID = roverID
        self.fullName = fullName
    }
}

// MARK: - Rover
public struct Rover: Codable {
    public let id: Int?
    public let name: String?
    public let landingDate: String?
    public let launchDate: String?
    public let status: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status = "status"
    }

    public init(id: Int?, name: String?, landingDate: String?, launchDate: String?, status: String?) {
        self.id = id
        self.name = name
        self.landingDate = landingDate
        self.launchDate = launchDate
        self.status = status
    }
}
