//
//  ViewController.swift
//  UIKit-HW11-1
//
//  Created by Дима on 12/22/24.
//

import UIKit

final class MainViewController: UIViewController {
    let data = Content.data()
    
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.register(CellView.self, forCellReuseIdentifier: CellView.identifier)
        $0.rowHeight = view.frame.width
        $0.delegate = self
        return $0
    }(UITableView(frame: view.frame, style: .plain))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }


}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellView.identifier, for: indexPath) as? CellView else { return UITableViewCell() }
        cell.configure(with: data[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = GalleryViewController()
        print( data[indexPath.row].pictureName)
        vc.configure(with: data[indexPath.row].pictureName)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
