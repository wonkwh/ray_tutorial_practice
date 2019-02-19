//
//  NoteCell.swift
//  TextKitNotepad
//
//  Created by wonkwh on 20/02/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        contentView.backgroundColor = isHighlighted ? .highlightColor : .white
        textLabel?.textColor = isHighlighted ? UIColor.white : .mainTextBlue
//        detailTextLabel?.textColor = isHighlighted ? .white : .black
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        // cell customization
        accessoryType = .disclosureIndicator
        textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        textLabel?.numberOfLines = 0


    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
