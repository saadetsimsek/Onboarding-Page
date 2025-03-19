//
//  ViewController.swift
//  OnboardingPage
//
//  Created by Saadet Şimşek on 10/03/2025.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.bounces = false // sayfa sonuna gittiğinde kaydırma kaL
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = .orange
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    private var slides = [OnboardingView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    private func setupViews(){
        view.backgroundColor = .systemGray
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        
        slides = createSlider()
        setupSlidesScrollView(slides: slides)
    }
    
    private func setDelegates(){
        scrollView.delegate = self
    }
    
    private func createSlider() -> [OnboardingView]{
        
        let firstOnboardingView = OnboardingView()
        firstOnboardingView.setPageLabelText(text: "one kfdjdhfgbfghddgff fjdhgdhghdf hfghgyrytgh shftfgfhgdjhfu hgdhfg")
        
        let secondOnboardingView = OnboardingView()
        secondOnboardingView.setPageLabelText(text: "two jdbfhbdh hfgrryfg urtgrghdbh hfvhrgrd frrgtfrghyfg jhrhrfg hderfrsgfhyeghs")
        
        let thirdOnboardingView = OnboardingView()
        thirdOnboardingView.setPageLabelText(text: "three jdhbc ahgferegf rhsgfse hrfhrsgf rhgfrhg hrefghfghre hfrghreg hfghregy hegtagfa")
        
        return [firstOnboardingView, secondOnboardingView, thirdOnboardingView]
    }
    
    private func setupSlidesScrollView(slides: [OnboardingView]){
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count),
                                        height: view.frame.height)
        for i in 0..<slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i),
                                     y: 0,
                                     width: view.frame.width,
                                     height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            pageControl.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


}

//MARK: - ScrollViewDelegate

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maxHorizontalOffset = scrollView.contentSize.width - view.frame.width
        let percentHorizontalOffset = scrollView.contentOffset.x / maxHorizontalOffset
        
        if percentHorizontalOffset <= 0.5 {
            let firstTransform = CGAffineTransform(scaleX: (0.5 - percentHorizontalOffset) / 0.5,
                                                   y: (0.5 - percentHorizontalOffset) / 0.5)
            let secondTransform = CGAffineTransform(scaleX: percentHorizontalOffset / 0.5,
                                                    y: percentHorizontalOffset / 0.5)
            slides[0].setPageLabelTransform(transform: firstTransform)
            slides[1].setPageLabelTransform(transform: secondTransform)
        }
        else {
            let secondTransform = CGAffineTransform(scaleX: (1 - percentHorizontalOffset) / 0.5,
                                                    y: (1 - percentHorizontalOffset) / 0.5)
            let thirdTransform = CGAffineTransform(scaleX: percentHorizontalOffset,
                                                   y: percentHorizontalOffset)
            slides[1].setPageLabelTransform(transform: secondTransform)
            slides[2].setPageLabelTransform(transform: thirdTransform)
        }
    }
}
