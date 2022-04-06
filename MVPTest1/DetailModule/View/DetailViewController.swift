//
//  DetailViewController.swift
//  MVPTest1
//
//  Created by Vladislav Barinov on 01.04.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!

    var presenter: DetailViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }

    @IBAction func tapToPop(_ sender: Any) {
        presenter.tap()
    }

}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        detailLabel.text = comment?.body
    }
}
