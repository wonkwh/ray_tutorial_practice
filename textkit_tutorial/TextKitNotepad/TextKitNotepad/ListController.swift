//
//  ViewController.swift
//  TextKitNotepad
//
//  Created by wonkwh on 20/02/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import UIKit

class ListController: UITableViewController {

    var notes = [
        Note(text: "Shopping List\r\r1. Cheese\r2. Biscuits\r3. Sausages\r4. IMPORTANT Cash for going out!\r5. -potatoes-\r6. A copy of iOS8 by Tutorials\r7. A new iPhone\r8. A present for mum"),
        Note(text: "Meeting notes\rA long and drawn out meeting, it lasted hours and hours and hours!"),
        Note(text: "Perfection ... \n\nPerfection is achieved not when there is nothing left to add, but when there is nothing left to take away - Antoine de Saint-Exupery"),
        Note(text: "Notes on Swift\nThis new language from Apple is changing iOS development as we know it!"),
        Note(text: "Meeting notes\rA different meeting, just as long and boring"),
        Note(text: "A collection of thoughts\rWhy do birds sing? Why is the sky blue? Why is it so hard to create good test data?")
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    fileprivate func setupTableView() {
        tableView.register(NoteCell.self, forCellReuseIdentifier: "cellID")
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .mainTextBlue
        tableView.backgroundColor = UIColor.rgb(r: 12, g: 47, b: 57)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Your Note"
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddItemTapped)), animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(r: 50, g: 199, b: 242)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    @objc func handleAddItemTapped() {
        let vc = EditorController()
        notes.append(Note(text: ""))
        if let note = notes.last {
            vc.note = note
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - UITableViewDataSource
extension ListController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].title
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ListController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = EditorController()
        vc.note = notes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}


class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension UIColor {
    static let mainTextBlue = UIColor.rgb(r: 7, g: 71, b: 89)
    static let highlightColor = UIColor.rgb(r: 50, g: 199, b: 242)
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

