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
        return $0
    }(UITableView(frame: view.frame, style: .plain))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }


}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellView.identifier, for: indexPath) as? CellView else { return UITableViewCell() }
        cell.configure(with: data[indexPath.row])
        cell.completion = {
            let vc = GalleryViewController()
            vc.configure(with: self.data[indexPath.row].pictureName)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        return cell
    }
    
    
}
