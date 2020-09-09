// MARK: - Mocks generated from file: LastFM/APIService/HTTPManager.swift at 2020-09-09 10:49:55 +0000

//
//  APIManager.swift
//  LastFM
//
//  Created by Deepanshu Bansal on 08/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

import Cuckoo
@testable import LastFM

import Foundation


 class MockHTTPManagerDelegate: HTTPManagerDelegate, Cuckoo.ProtocolMock {
    
     typealias MocksType = HTTPManagerDelegate
    
     typealias Stubbing = __StubbingProxy_HTTPManagerDelegate
     typealias Verification = __VerificationProxy_HTTPManagerDelegate

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: HTTPManagerDelegate?

     func enableDefaultImplementation(_ stub: HTTPManagerDelegate) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func onResult(result: Result<SearchResult, DataResponseError>)  {
        
    return cuckoo_manager.call("onResult(result: Result<SearchResult, DataResponseError>)",
            parameters: (result),
            escapingParameters: (result),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.onResult(result: result))
        
    }
    

	 struct __StubbingProxy_HTTPManagerDelegate: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func onResult<M1: Cuckoo.Matchable>(result: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Result<SearchResult, DataResponseError>)> where M1.MatchedType == Result<SearchResult, DataResponseError> {
	        let matchers: [Cuckoo.ParameterMatcher<(Result<SearchResult, DataResponseError>)>] = [wrap(matchable: result) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockHTTPManagerDelegate.self, method: "onResult(result: Result<SearchResult, DataResponseError>)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_HTTPManagerDelegate: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func onResult<M1: Cuckoo.Matchable>(result: M1) -> Cuckoo.__DoNotUse<(Result<SearchResult, DataResponseError>), Void> where M1.MatchedType == Result<SearchResult, DataResponseError> {
	        let matchers: [Cuckoo.ParameterMatcher<(Result<SearchResult, DataResponseError>)>] = [wrap(matchable: result) { $0 }]
	        return cuckoo_manager.verify("onResult(result: Result<SearchResult, DataResponseError>)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class HTTPManagerDelegateStub: HTTPManagerDelegate {
    

    

    
     func onResult(result: Result<SearchResult, DataResponseError>)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockHTTPManager: HTTPManager, Cuckoo.ClassMock {
    
     typealias MocksType = HTTPManager
    
     typealias Stubbing = __StubbingProxy_HTTPManager
     typealias Verification = __VerificationProxy_HTTPManager

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: HTTPManager?

     func enableDefaultImplementation(_ stub: HTTPManager) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var delegate: HTTPManagerDelegate? {
        get {
            return cuckoo_manager.getter("delegate",
                superclassCall:
                    
                    super.delegate
                    ,
                defaultCall: __defaultImplStub!.delegate)
        }
        
        set {
            cuckoo_manager.setter("delegate",
                value: newValue,
                superclassCall:
                    
                    super.delegate = newValue
                    ,
                defaultCall: __defaultImplStub!.delegate = newValue)
        }
        
    }
    

    

    
    
    
     override func setDelegate(delegate: HTTPManagerDelegate)  {
        
    return cuckoo_manager.call("setDelegate(delegate: HTTPManagerDelegate)",
            parameters: (delegate),
            escapingParameters: (delegate),
            superclassCall:
                
                super.setDelegate(delegate: delegate)
                ,
            defaultCall: __defaultImplStub!.setDelegate(delegate: delegate))
        
    }
    
    
    
     override func fetchData(with searchContext: String, page: Int)  {
        
    return cuckoo_manager.call("fetchData(with: String, page: Int)",
            parameters: (searchContext, page),
            escapingParameters: (searchContext, page),
            superclassCall:
                
                super.fetchData(with: searchContext, page: page)
                ,
            defaultCall: __defaultImplStub!.fetchData(with: searchContext, page: page))
        
    }
    

	 struct __StubbingProxy_HTTPManager: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var delegate: Cuckoo.ClassToBeStubbedOptionalProperty<MockHTTPManager, HTTPManagerDelegate> {
	        return .init(manager: cuckoo_manager, name: "delegate")
	    }
	    
	    
	    func setDelegate<M1: Cuckoo.Matchable>(delegate: M1) -> Cuckoo.ClassStubNoReturnFunction<(HTTPManagerDelegate)> where M1.MatchedType == HTTPManagerDelegate {
	        let matchers: [Cuckoo.ParameterMatcher<(HTTPManagerDelegate)>] = [wrap(matchable: delegate) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockHTTPManager.self, method: "setDelegate(delegate: HTTPManagerDelegate)", parameterMatchers: matchers))
	    }
	    
	    func fetchData<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(with searchContext: M1, page: M2) -> Cuckoo.ClassStubNoReturnFunction<(String, Int)> where M1.MatchedType == String, M2.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(String, Int)>] = [wrap(matchable: searchContext) { $0.0 }, wrap(matchable: page) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockHTTPManager.self, method: "fetchData(with: String, page: Int)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_HTTPManager: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var delegate: Cuckoo.VerifyOptionalProperty<HTTPManagerDelegate> {
	        return .init(manager: cuckoo_manager, name: "delegate", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func setDelegate<M1: Cuckoo.Matchable>(delegate: M1) -> Cuckoo.__DoNotUse<(HTTPManagerDelegate), Void> where M1.MatchedType == HTTPManagerDelegate {
	        let matchers: [Cuckoo.ParameterMatcher<(HTTPManagerDelegate)>] = [wrap(matchable: delegate) { $0 }]
	        return cuckoo_manager.verify("setDelegate(delegate: HTTPManagerDelegate)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func fetchData<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(with searchContext: M1, page: M2) -> Cuckoo.__DoNotUse<(String, Int), Void> where M1.MatchedType == String, M2.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(String, Int)>] = [wrap(matchable: searchContext) { $0.0 }, wrap(matchable: page) { $0.1 }]
	        return cuckoo_manager.verify("fetchData(with: String, page: Int)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class HTTPManagerStub: HTTPManager {
    
    
     override var delegate: HTTPManagerDelegate? {
        get {
            return DefaultValueRegistry.defaultValue(for: (HTTPManagerDelegate?).self)
        }
        
        set { }
        
    }
    

    

    
     override func setDelegate(delegate: HTTPManagerDelegate)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func fetchData(with searchContext: String, page: Int)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: LastFM/ViewModel/DetailViewModel.swift at 2020-09-09 10:49:55 +0000

//
//  DetailViewModel.swift
//  LastFM
//
//  Created by Deepanshu Bansal on 09/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

import Cuckoo
@testable import LastFM

import Foundation


 class MockDetailViewModelDelegate: DetailViewModelDelegate, Cuckoo.ProtocolMock {
    
     typealias MocksType = DetailViewModelDelegate
    
     typealias Stubbing = __StubbingProxy_DetailViewModelDelegate
     typealias Verification = __VerificationProxy_DetailViewModelDelegate

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: DetailViewModelDelegate?

     func enableDefaultImplementation(_ stub: DetailViewModelDelegate) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func populateData(name: String, artist: String, mbid: String, url: String, listner: String, streamable: String)  {
        
    return cuckoo_manager.call("populateData(name: String, artist: String, mbid: String, url: String, listner: String, streamable: String)",
            parameters: (name, artist, mbid, url, listner, streamable),
            escapingParameters: (name, artist, mbid, url, listner, streamable),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.populateData(name: name, artist: artist, mbid: mbid, url: url, listner: listner, streamable: streamable))
        
    }
    

	 struct __StubbingProxy_DetailViewModelDelegate: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func populateData<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable, M5: Cuckoo.Matchable, M6: Cuckoo.Matchable>(name: M1, artist: M2, mbid: M3, url: M4, listner: M5, streamable: M6) -> Cuckoo.ProtocolStubNoReturnFunction<(String, String, String, String, String, String)> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == String, M4.MatchedType == String, M5.MatchedType == String, M6.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String, String, String, String, String, String)>] = [wrap(matchable: name) { $0.0 }, wrap(matchable: artist) { $0.1 }, wrap(matchable: mbid) { $0.2 }, wrap(matchable: url) { $0.3 }, wrap(matchable: listner) { $0.4 }, wrap(matchable: streamable) { $0.5 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockDetailViewModelDelegate.self, method: "populateData(name: String, artist: String, mbid: String, url: String, listner: String, streamable: String)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_DetailViewModelDelegate: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func populateData<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable, M5: Cuckoo.Matchable, M6: Cuckoo.Matchable>(name: M1, artist: M2, mbid: M3, url: M4, listner: M5, streamable: M6) -> Cuckoo.__DoNotUse<(String, String, String, String, String, String), Void> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == String, M4.MatchedType == String, M5.MatchedType == String, M6.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String, String, String, String, String, String)>] = [wrap(matchable: name) { $0.0 }, wrap(matchable: artist) { $0.1 }, wrap(matchable: mbid) { $0.2 }, wrap(matchable: url) { $0.3 }, wrap(matchable: listner) { $0.4 }, wrap(matchable: streamable) { $0.5 }]
	        return cuckoo_manager.verify("populateData(name: String, artist: String, mbid: String, url: String, listner: String, streamable: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class DetailViewModelDelegateStub: DetailViewModelDelegate {
    

    

    
     func populateData(name: String, artist: String, mbid: String, url: String, listner: String, streamable: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: LastFM/ViewModel/SearchViewModel.swift at 2020-09-09 10:49:55 +0000

//
//  ViewModel.swift
//  LastFM
//
//  Created by Deepanshu Bansal on 08/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

import Cuckoo
@testable import LastFM

import Foundation
import UIKit


 class MockSearchViewModelDelegate: SearchViewModelDelegate, Cuckoo.ProtocolMock {
    
     typealias MocksType = SearchViewModelDelegate
    
     typealias Stubbing = __StubbingProxy_SearchViewModelDelegate
     typealias Verification = __VerificationProxy_SearchViewModelDelegate

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: SearchViewModelDelegate?

     func enableDefaultImplementation(_ stub: SearchViewModelDelegate) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func onFetchCompleted()  {
        
    return cuckoo_manager.call("onFetchCompleted()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.onFetchCompleted())
        
    }
    
    
    
     func onFetchFailed(with reason: String)  {
        
    return cuckoo_manager.call("onFetchFailed(with: String)",
            parameters: (reason),
            escapingParameters: (reason),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.onFetchFailed(with: reason))
        
    }
    
    
    
     func navigateToDetailsViewController(data: Any, selection: Selection)  {
        
    return cuckoo_manager.call("navigateToDetailsViewController(data: Any, selection: Selection)",
            parameters: (data, selection),
            escapingParameters: (data, selection),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.navigateToDetailsViewController(data: data, selection: selection))
        
    }
    

	 struct __StubbingProxy_SearchViewModelDelegate: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func onFetchCompleted() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockSearchViewModelDelegate.self, method: "onFetchCompleted()", parameterMatchers: matchers))
	    }
	    
	    func onFetchFailed<M1: Cuckoo.Matchable>(with reason: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: reason) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSearchViewModelDelegate.self, method: "onFetchFailed(with: String)", parameterMatchers: matchers))
	    }
	    
	    func navigateToDetailsViewController<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(data: M1, selection: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(Any, Selection)> where M1.MatchedType == Any, M2.MatchedType == Selection {
	        let matchers: [Cuckoo.ParameterMatcher<(Any, Selection)>] = [wrap(matchable: data) { $0.0 }, wrap(matchable: selection) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSearchViewModelDelegate.self, method: "navigateToDetailsViewController(data: Any, selection: Selection)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_SearchViewModelDelegate: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func onFetchCompleted() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("onFetchCompleted()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func onFetchFailed<M1: Cuckoo.Matchable>(with reason: M1) -> Cuckoo.__DoNotUse<(String), Void> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: reason) { $0 }]
	        return cuckoo_manager.verify("onFetchFailed(with: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func navigateToDetailsViewController<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(data: M1, selection: M2) -> Cuckoo.__DoNotUse<(Any, Selection), Void> where M1.MatchedType == Any, M2.MatchedType == Selection {
	        let matchers: [Cuckoo.ParameterMatcher<(Any, Selection)>] = [wrap(matchable: data) { $0.0 }, wrap(matchable: selection) { $0.1 }]
	        return cuckoo_manager.verify("navigateToDetailsViewController(data: Any, selection: Selection)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class SearchViewModelDelegateStub: SearchViewModelDelegate {
    

    

    
     func onFetchCompleted()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func onFetchFailed(with reason: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func navigateToDetailsViewController(data: Any, selection: Selection)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

