//
//  MainPresenter.swift
//  MVPTest1
//
//  Created by Vladislav Barinov on 17.03.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {

    func succes()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {

    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getComments()
    var comments: [Comment]? { get set }
    func tapOnTheComment(comment: Comment?)
}

class MainPresenter: MainViewPresenterProtocol {

    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol!
    var comments: [Comment]?

    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getComments()
    }

    func tapOnTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }


    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
