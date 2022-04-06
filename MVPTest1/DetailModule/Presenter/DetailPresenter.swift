//
//  DetailPresenter.swift
//  MVPTest1
//
//  Created by Vladislav Barinov on 01.04.2022.
//

import Foundation

protocol DetailViewProtocol: AnyObject {

    func setComment(comment: Comment?)

}

protocol DetailViewPresenterProtocol: AnyObject {

    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?)
    func setComment()
    func tap()
}

class DetailPresenter: DetailViewPresenterProtocol {


    weak var view: DetailViewProtocol?
    var router: RouterProtocol
    let networkService: NetworkServiceProtocol!
    var comment: Comment?

    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?) {

        self.view = view
        self.comment = comment
        self.networkService = networkService
        self.router = router
    }

    public func setComment() {
        self.view?.setComment(comment: comment)
    }

    func tap() {
        router.popToRoot()
    }

}
