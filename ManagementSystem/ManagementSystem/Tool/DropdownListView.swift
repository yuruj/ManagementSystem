//
//  DropdownListView.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/3/24.
//

import UIKit

class DropDownListView: UIView {
    
    static let kArrowImgHeight: CGFloat = 10
    static let kArrowImgWidth: CGFloat = 15
    static let kTextLabelX = 5
    static let kItemCellHeight = 40

    var textColor: UIColor!
    var font: UIFont!
    var dataSource: Array<DropdownListItem>!
    var selectedIndex: Int!
    var selectedItem: DropdownListItem!
    
    private var textLabel: UILabel!
    private var arrowImg: UIImageView!
    private var tbView: UITableView!
    private var backgroundView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    init(dataSource: Array<DropdownListItem>) {
        self.dataSource = dataSource
        super.init(frame: CGRect.zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

    }

    func setupProperty() {
        textColor = UIColor.black
        font = UIFont.systemFont(ofSize: 14)
        selectedIndex = 0
        textLabel.font = font
        textLabel.textColor = textColor
    }

    func setupView() {

    }

    func setupFrame() {

    }
    
    func tapViewExpand(sender: UITapGestureRecognizer) {
        
    }
    
    func tapViewDismiss(sender: UITapGestureRecognizer) {
        
    }
    
    func setViewBorder(borderWidth: CGFloat, borderColor: UIColor, cornerRedius: CGFloat) {
        self.layer.cornerRadius = cornerRedius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
    func rotateArrowImage() {
        
    }
    
    func removeBackgroundView() {
        
    }
    
    func selectedItem(index: Int) {
        
    }
    
    


}

//extension DropDownListView: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        UITableViewCell *cell =
//    }
//
//}

class DropdownListItem: NSObject {
    var itemId: String
    var itemName: String

    init(itemId: String, itemName: String) {
        self.itemId = itemId
        self.itemName = itemName
    }
}
