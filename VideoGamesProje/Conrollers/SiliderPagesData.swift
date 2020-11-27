//
//  File.swift
//  VideoGamesProje
//
//  Created by Mansur Emin  Kaya on 27.11.2020.
//  Copyright © 2020 Mansur Emin  Kaya. All rights reserved.
//

import Foundation
import UIKit

class SiliderPagesData: UIViewController {
    
 
    //func siliderPages(resimler:[String]){
        func  siliderPages(resimler:[String],scrollView:UIScrollView,pageControl: UIPageControl!) {
        //print("resimler.count :>",resimler.count)
        pageControl.numberOfPages = resimler.count
        
        for i in 0..<resimler.count{
            let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            print("\(resimler[i])")
            imageView.image = UIImage.init(data: try! Data.init(contentsOf: URL(string: (resimler[i]))!))
            //UIImage(named: resimler[i])
            let xPos = CGFloat(i)*self.view.bounds.size.width
            imageView.frame = CGRect(x:xPos,y:0,width:view.frame.size.width,height:scrollView.frame.size.height)
            scrollView.contentSize.width = view.frame.width*CGFloat(i+1)
            scrollView.addSubview(imageView)
            
        }
        
    }
    
    
}
