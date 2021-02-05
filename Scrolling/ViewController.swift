//
//  ViewController.swift
//  Scrolling
//
//  Created by Sam Meech-Ward on 2020-05-17.
//  Copyright © 2020 meech-ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var scrollView: UIScrollView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    let imageViews = [
      UIImageView(image: UIImage(named: "tp_1")),
      UIImageView(image: UIImage(named: "tp_2")),
      UIImageView(image: UIImage(named: "tp_3")),
    ]
    
    imageViews.forEach { imageView in
      imageView.contentMode = .scaleAspectFill
      imageView.clipsToBounds = true
    }
    
    let stackView = UIStackView(arrangedSubviews: imageViews)
    stackView.axis = .horizontal
    stackView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.addSubview(stackView)
    
    stackView.alignment = .fill
    stackView.distribution = .fillEqually
    
    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
      stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
      
      stackView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor),
      stackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, multiplier: CGFloat(imageViews.count)),
    ])
    
    
  }
//
//  override func viewDidLayoutSubviews() {
//    super.viewDidLayoutSubviews()
//    scrollView.minimumZoomScale = scrollView.frame.width/imageView.image!.size.width
//  }

  @IBAction func changePage(_ pageControl: UIPageControl) {
    let offset = CGFloat(pageControl.currentPage) * scrollView.frame.width
    scrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
  }
  
}

extension ViewController: UIScrollViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
//    print(scrollView.contentOffset)
    let page = Int(round(scrollView.contentOffset.x/scrollView.frame.width))
    pageControl.currentPage = page
  }
  
//  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//    return imageView
//  }
}

