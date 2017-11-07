//
//  TableViewCell5.swift
//  CampusCash
//
//  Created by Tyler Jordan Cagle on 11/4/17.
//  Copyright © 2017 Hans von Clemm. All rights reserved.
//

import UIKit

class TableViewCell5: UITableViewCell, UIWebViewDelegate {

    @IBOutlet weak var googleReview: UIWebView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        if selectCompanyText == "Cosmos" {
            let url = NSURL (string: "https://www.google.com/search?ei=sZ__WdujF5GDjwTRv7_gAw&q=cosmos+boulder&oq=cosmos+boulder&gs_l=psy-ab.3...16775.17526.0.17670.0.0.0.0.0.0.0.0..0.0....0...1.1.64.psy-ab..0.0.0....0.G0waAAOV6h4#lrd=0x876bedba21fffdcb:0xabf8a30975bee876,3,,")
            let requestObj = NSURLRequest(url: url! as URL)
            googleReview.loadRequest(requestObj as URLRequest)
        } else if selectCompanyText == "Half Fast Subs" {
            let url = NSURL (string: "https://www.google.com/search?q=half+fast+subs+boulder&oq=half+fast+subs+boulder&aqs=chrome..69i57j69i60j0.4658j0j4&sourceid=chrome&ie=UTF-8#lrd=0x876bec305f158dd9:0x90121dfd8514ed94,3,,")
            let requestObj = NSURLRequest(url: url! as URL)
            googleReview.loadRequest(requestObj as URLRequest)
        } else if selectCompanyText == "The Corner" {
            let url = NSURL (string: "https://www.google.com/search?ei=kp__Wf_dGezgjwTc05X4BQ&q=the+corner+boulder&oq=the+corner+boulder&gs_l=psy-ab.3...28653.29715.0.29818.0.0.0.0.0.0.0.0..0.0....0...1.1.64.psy-ab..0.0.0....0.ReKegVjWNyU#lrd=0x876bec30c3a2f229:0x634ec73dab090bf8,3,,")
            let requestObj = NSURLRequest(url: url! as URL)
            googleReview.loadRequest(requestObj as URLRequest)
        } else {
            let url = NSURL (string: "https://www.google.com")
            let requestObj = NSURLRequest(url: url! as URL)
            googleReview.loadRequest(requestObj as URLRequest)
        }
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
