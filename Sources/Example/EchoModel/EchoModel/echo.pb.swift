// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: EchoModel/echo.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// from Common.proto
enum GETServiceType: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case other // = 0
  case buy4Me // = 1
  case ship4Me // = 2
  case ezbuy // = 3
  case prime // = 4
  case UNRECOGNIZED(Int)

  init() {
    self = .other
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .other
    case 1: self = .buy4Me
    case 2: self = .ship4Me
    case 3: self = .ezbuy
    case 4: self = .prime
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .other: return 0
    case .buy4Me: return 1
    case .ship4Me: return 2
    case .ezbuy: return 3
    case .prime: return 4
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension GETServiceType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [GETServiceType] = [
    .other,
    .buy4Me,
    .ship4Me,
    .ezbuy,
    .prime,
  ]
}

#endif  // swift(>=4.2)

enum GETMessageType: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case normal // = 0
  case orderPending // = 1
  case orderArrived // = 2
  case parcelArrangeable // = 3
  case enquiry // = 4
  case web // = 5
  case parcelPending // = 6
  case firebaseCallback // = 7
  case UNRECOGNIZED(Int)

  init() {
    self = .normal
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .normal
    case 1: self = .orderPending
    case 2: self = .orderArrived
    case 3: self = .parcelArrangeable
    case 4: self = .enquiry
    case 5: self = .web
    case 6: self = .parcelPending
    case 7: self = .firebaseCallback
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .normal: return 0
    case .orderPending: return 1
    case .orderArrived: return 2
    case .parcelArrangeable: return 3
    case .enquiry: return 4
    case .web: return 5
    case .parcelPending: return 6
    case .firebaseCallback: return 7
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension GETMessageType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [GETMessageType] = [
    .normal,
    .orderPending,
    .orderArrived,
    .parcelArrangeable,
    .enquiry,
    .web,
    .parcelPending,
    .firebaseCallback,
  ]
}

#endif  // swift(>=4.2)

/// from ReadyToShip.proto
struct GETReadyToShipGroup {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var itemsCount: Int32 = 0

  var serviceType: GETServiceType = .other

  var warehouseCode: String = String()

  var shippingMethodCode: String = String()

  var shippingMethodName: String = String()

  var itemsPics: [String] = []

  var status: String = String()

  var freeStorageDays: Int32 = 0

  var chargedStorageDays: Int32 = 0

  var storageFee: Double = 0

  var notArrivedItemCount: Int32 = 0

  var shippingMethodID: Int64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct GETMessage {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: Int32 = 0

  var messageType: String = String()

  var message: String = String()

  var isRead: Bool = false

  var orderID: Int32 = 0

  var packageID: Int32 = 0

  var url: String = String()

  var updateDate: String = String()

  var type: GETMessageType = .normal

  var readyToShipGroup: GETReadyToShipGroup {
    get {return _readyToShipGroup ?? GETReadyToShipGroup()}
    set {_readyToShipGroup = newValue}
  }
  /// Returns true if `readyToShipGroup` has been explicitly set.
  var hasReadyToShipGroup: Bool {return self._readyToShipGroup != nil}
  /// Clears the value of `readyToShipGroup`. Subsequent reads from it will return its default value.
  mutating func clearReadyToShipGroup() {self._readyToShipGroup = nil}

  /// 新订单号
  var newOrderID: Int64 = 0

  /// 二级包裹号
  var subPackageNumber: String = String()

  var actionType: String = String()

  var detail: GEPendingReplyDetail {
    get {return _detail ?? GEPendingReplyDetail()}
    set {_detail = newValue}
  }
  /// Returns true if `detail` has been explicitly set.
  var hasDetail: Bool {return self._detail != nil}
  /// Clears the value of `detail`. Subsequent reads from it will return its default value.
  mutating func clearDetail() {self._detail = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _readyToShipGroup: GETReadyToShipGroup? = nil
  fileprivate var _detail: GEPendingReplyDetail? = nil
}

struct GEPendingReplyDetail {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var newOrderItemID: Int64 = 0

  var serviceType: GETServiceType = .other

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct GEUserDeleteMessagesRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var messageIds: [Int32] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct GEUserGetMessagesRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var offset: Int32 = 0

  var limit: Int32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct GEUserGetUnreadMessageCountRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct GEUserSetAllMessagesReadRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct GEUserSetMessageReadRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var messageID: Int32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct GEUserSetMessagesReadRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var messageIds: [Int32] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct GEUserDeleteMessagesResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var result: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct GEUserGetMessagesResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var result: [GETMessage] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct GEUserGetUnreadMessageCountResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var result: Int32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct GEUserSetAllMessagesReadResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var result: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct GEUserSetMessageReadResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct GEUserSetMessagesReadResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "usermsgcenter"

extension GETServiceType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "TServiceTypeOther"),
    1: .same(proto: "TServiceTypeBuy4Me"),
    2: .same(proto: "TServiceTypeShip4Me"),
    3: .same(proto: "TServiceTypeEzbuy"),
    4: .same(proto: "TServiceTypePrime"),
  ]
}

extension GETMessageType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "TMessageTypeNormal"),
    1: .same(proto: "TMessageTypeOrderPending"),
    2: .same(proto: "TMessageTypeOrderArrived"),
    3: .same(proto: "TMessageTypeParcelArrangeable"),
    4: .same(proto: "TMessageTypeEnquiry"),
    5: .same(proto: "TMessageTypeWeb"),
    6: .same(proto: "TMessageTypeParcelPending"),
    7: .same(proto: "TMessageTypeFirebaseCallback"),
  ]
}

extension GETReadyToShipGroup: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".TReadyToShipGroup"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "itemsCount"),
    2: .same(proto: "serviceType"),
    3: .same(proto: "warehouseCode"),
    4: .same(proto: "shippingMethodCode"),
    5: .same(proto: "shippingMethodName"),
    6: .same(proto: "itemsPics"),
    7: .same(proto: "status"),
    8: .same(proto: "freeStorageDays"),
    9: .same(proto: "chargedStorageDays"),
    10: .same(proto: "storageFee"),
    11: .same(proto: "notArrivedItemCount"),
    12: .same(proto: "shippingMethodId"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.itemsCount)
      case 2: try decoder.decodeSingularEnumField(value: &self.serviceType)
      case 3: try decoder.decodeSingularStringField(value: &self.warehouseCode)
      case 4: try decoder.decodeSingularStringField(value: &self.shippingMethodCode)
      case 5: try decoder.decodeSingularStringField(value: &self.shippingMethodName)
      case 6: try decoder.decodeRepeatedStringField(value: &self.itemsPics)
      case 7: try decoder.decodeSingularStringField(value: &self.status)
      case 8: try decoder.decodeSingularInt32Field(value: &self.freeStorageDays)
      case 9: try decoder.decodeSingularInt32Field(value: &self.chargedStorageDays)
      case 10: try decoder.decodeSingularDoubleField(value: &self.storageFee)
      case 11: try decoder.decodeSingularInt32Field(value: &self.notArrivedItemCount)
      case 12: try decoder.decodeSingularInt64Field(value: &self.shippingMethodID)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.itemsCount != 0 {
      try visitor.visitSingularInt32Field(value: self.itemsCount, fieldNumber: 1)
    }
    if self.serviceType != .other {
      try visitor.visitSingularEnumField(value: self.serviceType, fieldNumber: 2)
    }
    if !self.warehouseCode.isEmpty {
      try visitor.visitSingularStringField(value: self.warehouseCode, fieldNumber: 3)
    }
    if !self.shippingMethodCode.isEmpty {
      try visitor.visitSingularStringField(value: self.shippingMethodCode, fieldNumber: 4)
    }
    if !self.shippingMethodName.isEmpty {
      try visitor.visitSingularStringField(value: self.shippingMethodName, fieldNumber: 5)
    }
    if !self.itemsPics.isEmpty {
      try visitor.visitRepeatedStringField(value: self.itemsPics, fieldNumber: 6)
    }
    if !self.status.isEmpty {
      try visitor.visitSingularStringField(value: self.status, fieldNumber: 7)
    }
    if self.freeStorageDays != 0 {
      try visitor.visitSingularInt32Field(value: self.freeStorageDays, fieldNumber: 8)
    }
    if self.chargedStorageDays != 0 {
      try visitor.visitSingularInt32Field(value: self.chargedStorageDays, fieldNumber: 9)
    }
    if self.storageFee != 0 {
      try visitor.visitSingularDoubleField(value: self.storageFee, fieldNumber: 10)
    }
    if self.notArrivedItemCount != 0 {
      try visitor.visitSingularInt32Field(value: self.notArrivedItemCount, fieldNumber: 11)
    }
    if self.shippingMethodID != 0 {
      try visitor.visitSingularInt64Field(value: self.shippingMethodID, fieldNumber: 12)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: GETReadyToShipGroup, rhs: GETReadyToShipGroup) -> Bool {
    if lhs.itemsCount != rhs.itemsCount {return false}
    if lhs.serviceType != rhs.serviceType {return false}
    if lhs.warehouseCode != rhs.warehouseCode {return false}
    if lhs.shippingMethodCode != rhs.shippingMethodCode {return false}
    if lhs.shippingMethodName != rhs.shippingMethodName {return false}
    if lhs.itemsPics != rhs.itemsPics {return false}
    if lhs.status != rhs.status {return false}
    if lhs.freeStorageDays != rhs.freeStorageDays {return false}
    if lhs.chargedStorageDays != rhs.chargedStorageDays {return false}
    if lhs.storageFee != rhs.storageFee {return false}
    if lhs.notArrivedItemCount != rhs.notArrivedItemCount {return false}
    if lhs.shippingMethodID != rhs.shippingMethodID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GETMessage: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".TMessage"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "messageType"),
    3: .same(proto: "message"),
    4: .same(proto: "isRead"),
    5: .same(proto: "orderId"),
    6: .same(proto: "packageId"),
    7: .same(proto: "url"),
    8: .same(proto: "updateDate"),
    9: .same(proto: "type"),
    10: .same(proto: "readyToShipGroup"),
    11: .same(proto: "newOrderId"),
    12: .same(proto: "subPackageNumber"),
    13: .same(proto: "actionType"),
    14: .same(proto: "detail"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.id)
      case 2: try decoder.decodeSingularStringField(value: &self.messageType)
      case 3: try decoder.decodeSingularStringField(value: &self.message)
      case 4: try decoder.decodeSingularBoolField(value: &self.isRead)
      case 5: try decoder.decodeSingularInt32Field(value: &self.orderID)
      case 6: try decoder.decodeSingularInt32Field(value: &self.packageID)
      case 7: try decoder.decodeSingularStringField(value: &self.url)
      case 8: try decoder.decodeSingularStringField(value: &self.updateDate)
      case 9: try decoder.decodeSingularEnumField(value: &self.type)
      case 10: try decoder.decodeSingularMessageField(value: &self._readyToShipGroup)
      case 11: try decoder.decodeSingularInt64Field(value: &self.newOrderID)
      case 12: try decoder.decodeSingularStringField(value: &self.subPackageNumber)
      case 13: try decoder.decodeSingularStringField(value: &self.actionType)
      case 14: try decoder.decodeSingularMessageField(value: &self._detail)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.id != 0 {
      try visitor.visitSingularInt32Field(value: self.id, fieldNumber: 1)
    }
    if !self.messageType.isEmpty {
      try visitor.visitSingularStringField(value: self.messageType, fieldNumber: 2)
    }
    if !self.message.isEmpty {
      try visitor.visitSingularStringField(value: self.message, fieldNumber: 3)
    }
    if self.isRead != false {
      try visitor.visitSingularBoolField(value: self.isRead, fieldNumber: 4)
    }
    if self.orderID != 0 {
      try visitor.visitSingularInt32Field(value: self.orderID, fieldNumber: 5)
    }
    if self.packageID != 0 {
      try visitor.visitSingularInt32Field(value: self.packageID, fieldNumber: 6)
    }
    if !self.url.isEmpty {
      try visitor.visitSingularStringField(value: self.url, fieldNumber: 7)
    }
    if !self.updateDate.isEmpty {
      try visitor.visitSingularStringField(value: self.updateDate, fieldNumber: 8)
    }
    if self.type != .normal {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 9)
    }
    if let v = self._readyToShipGroup {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
    }
    if self.newOrderID != 0 {
      try visitor.visitSingularInt64Field(value: self.newOrderID, fieldNumber: 11)
    }
    if !self.subPackageNumber.isEmpty {
      try visitor.visitSingularStringField(value: self.subPackageNumber, fieldNumber: 12)
    }
    if !self.actionType.isEmpty {
      try visitor.visitSingularStringField(value: self.actionType, fieldNumber: 13)
    }
    if let v = self._detail {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 14)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: GETMessage, rhs: GETMessage) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.messageType != rhs.messageType {return false}
    if lhs.message != rhs.message {return false}
    if lhs.isRead != rhs.isRead {return false}
    if lhs.orderID != rhs.orderID {return false}
    if lhs.packageID != rhs.packageID {return false}
    if lhs.url != rhs.url {return false}
    if lhs.updateDate != rhs.updateDate {return false}
    if lhs.type != rhs.type {return false}
    if lhs._readyToShipGroup != rhs._readyToShipGroup {return false}
    if lhs.newOrderID != rhs.newOrderID {return false}
    if lhs.subPackageNumber != rhs.subPackageNumber {return false}
    if lhs.actionType != rhs.actionType {return false}
    if lhs._detail != rhs._detail {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GEPendingReplyDetail: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PendingReplyDetail"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "newOrderItemId"),
    2: .same(proto: "ServiceType"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt64Field(value: &self.newOrderItemID)
      case 2: try decoder.decodeSingularEnumField(value: &self.serviceType)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.newOrderItemID != 0 {
      try visitor.visitSingularInt64Field(value: self.newOrderItemID, fieldNumber: 1)
    }
    if self.serviceType != .other {
      try visitor.visitSingularEnumField(value: self.serviceType, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: GEPendingReplyDetail, rhs: GEPendingReplyDetail) -> Bool {
    if lhs.newOrderItemID != rhs.newOrderItemID {return false}
    if lhs.serviceType != rhs.serviceType {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GEUserDeleteMessagesRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserDeleteMessagesRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "messageIDs"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedInt32Field(value: &self.messageIds)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.messageIds.isEmpty {
      try visitor.visitPackedInt32Field(value: self.messageIds, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: GEUserDeleteMessagesRequest, rhs: GEUserDeleteMessagesRequest) -> Bool {
    if lhs.messageIds != rhs.messageIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GEUserGetMessagesRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserGetMessagesRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "offset"),
    2: .same(proto: "limit"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.offset)
      case 2: try decoder.decodeSingularInt32Field(value: &self.limit)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.offset != 0 {
      try visitor.visitSingularInt32Field(value: self.offset, fieldNumber: 1)
    }
    if self.limit != 0 {
      try visitor.visitSingularInt32Field(value: self.limit, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: GEUserGetMessagesRequest, rhs: GEUserGetMessagesRequest) -> Bool {
    if lhs.offset != rhs.offset {return false}
    if lhs.limit != rhs.limit {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GEUserGetUnreadMessageCountRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserGetUnreadMessageCountRequest"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: GEUserGetUnreadMessageCountRequest, rhs: GEUserGetUnreadMessageCountRequest) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GEUserSetAllMessagesReadRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserSetAllMessagesReadRequest"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: GEUserSetAllMessagesReadRequest, rhs: GEUserSetAllMessagesReadRequest) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GEUserSetMessageReadRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserSetMessageReadRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "messageId"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.messageID)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.messageID != 0 {
      try visitor.visitSingularInt32Field(value: self.messageID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: GEUserSetMessageReadRequest, rhs: GEUserSetMessageReadRequest) -> Bool {
    if lhs.messageID != rhs.messageID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GEUserSetMessagesReadRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserSetMessagesReadRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "messageIDs"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedInt32Field(value: &self.messageIds)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.messageIds.isEmpty {
      try visitor.visitPackedInt32Field(value: self.messageIds, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: GEUserSetMessagesReadRequest, rhs: GEUserSetMessagesReadRequest) -> Bool {
    if lhs.messageIds != rhs.messageIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GEUserDeleteMessagesResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserDeleteMessagesResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "Result"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBoolField(value: &self.result)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.result != false {
      try visitor.visitSingularBoolField(value: self.result, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: GEUserDeleteMessagesResponse, rhs: GEUserDeleteMessagesResponse) -> Bool {
    if lhs.result != rhs.result {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GEUserGetMessagesResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserGetMessagesResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "Result"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.result)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.result.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.result, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: GEUserGetMessagesResponse, rhs: GEUserGetMessagesResponse) -> Bool {
    if lhs.result != rhs.result {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GEUserGetUnreadMessageCountResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserGetUnreadMessageCountResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "Result"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.result)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.result != 0 {
      try visitor.visitSingularInt32Field(value: self.result, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: GEUserGetUnreadMessageCountResponse, rhs: GEUserGetUnreadMessageCountResponse) -> Bool {
    if lhs.result != rhs.result {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GEUserSetAllMessagesReadResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserSetAllMessagesReadResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "Result"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBoolField(value: &self.result)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.result != false {
      try visitor.visitSingularBoolField(value: self.result, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: GEUserSetAllMessagesReadResponse, rhs: GEUserSetAllMessagesReadResponse) -> Bool {
    if lhs.result != rhs.result {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GEUserSetMessageReadResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserSetMessageReadResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: GEUserSetMessageReadResponse, rhs: GEUserSetMessageReadResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension GEUserSetMessagesReadResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserSetMessagesReadResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: GEUserSetMessagesReadResponse, rhs: GEUserSetMessagesReadResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
