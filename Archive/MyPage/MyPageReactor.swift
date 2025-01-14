//
//  MyPageReactor.swift
//  Archive
//
//  Created by hanwe on 2021/10/21.
//

import ReactorKit
import RxSwift
import RxRelay
import RxFlow

class MyPageReactor: Reactor, Stepper {
    
    // MARK: private property
    
    private let model: MyPageModelProtocol
    
    // MARK: internal property
    
    let steps = PublishRelay<Step>()
    let initialState = State()
    
    // MARK: lifeCycle
    
    init(model: MyPageModelProtocol) {
        self.model = model
    }
    
    enum Action {
        case cardCnt
        case moveToLoginInfo
    }
    
    enum Mutation {
        case setCardCnt(Int)
    }
    
    struct State {
        var cardCnt: Int = 0
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .cardCnt:
            let cnt = model.cardCount
            return .just(.setCardCnt(cnt))
        case .moveToLoginInfo:
            steps.accept(ArchiveStep.loginInfomationIsRequired(.eMail, self.model.cardCount)) // TODO: 여기서 로그인 정보 주입???
            return .empty()
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setCardCnt(let cardCnt):
            newState.cardCnt = cardCnt
        }
        return newState
    }
    
    // MARK: private function
    
    // MARK: internal function
    

    

    
    
    
}
