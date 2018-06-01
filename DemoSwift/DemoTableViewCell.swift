//
//  DemoTableViewCell.swift
//  DemoSwift
//
//  Created by cython on 2018/5/30.
//  Copyright © 2018年 cy. All rights reserved.
//

import UIKit





@objc protocol DemoTableViewCellDelegate:class{
    
    @objc optional
     func pushViewController(clicked  index:NSInteger)
}


class DemoTableViewCell: UITableViewCell {
    
    var model  = DemoModel(){
        didSet {
            imgView.kf.setImage(with: URL(string: model.image))
            contentLabel.text = model.text
        }
    }
    
    private let imgView = UIImageView()
    private let aButton = UIButton()
    private let bButton = UIButton()
    private let contentLabel = UILabel()
     var delegate:DemoTableViewCellDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.selectionStyle = UITableViewCellSelectionStyle.none
        contentView.addSubview(imgView)
        imgView.backgroundColor = UIColor.gray
        imgView.image = UIImage.init(named: "1")
        imgView.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(imgView.snp.width).dividedBy(2)
        }
        
        contentView.addSubview(aButton)
        aButton.setTitle("A", for: UIControlState.normal)
        aButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        aButton.addTarget(self, action: #selector(pushAViewController), for: UIControlEvents.touchUpInside)
        aButton.backgroundColor = UIColor.blue
        aButton.snp.makeConstraints { (make) in
            make.left.equalTo(imgView)
            make.height.equalTo(44)
            make.top.equalTo(imgView.snp.bottom).offset(10)
            make.right.equalTo(contentView.snp.centerX).offset(-5)
        }

        contentView.addSubview(bButton)
        bButton.setTitle("B", for: UIControlState.normal)
        bButton.backgroundColor = UIColor.blue
        bButton.addTarget(self, action: #selector(pushBViewController), for: UIControlEvents.touchUpInside)
        bButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        bButton.snp.makeConstraints { (make) in
            make.top.size.equalTo(aButton)
            make.right.equalTo(imgView)
        }

        contentView.addSubview(contentLabel)
        contentLabel.numberOfLines = 2
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        contentLabel.text = "所产生的CSDCSD测试Dv"

        contentLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(imgView)
            make.top.equalTo(aButton.snp.bottom).offset(10)
            make.bottom.equalTo(contentView).offset(-10)
        }

        
        
    }
    
    @objc func pushAViewController() {
        self.delegate?.pushViewController!(clicked: 0)
    }
    
    @objc func pushBViewController() {
        self.delegate?.pushViewController!(clicked: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
