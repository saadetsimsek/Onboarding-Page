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
    }
    
    private func setupViews(){
        view.backgroundColor = .systemGray
        view.addSubview(scrollView)
        view.addSubview(pageControl)
    }
    
    private func setDelegates(){
        
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

