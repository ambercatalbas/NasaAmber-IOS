//
//  IntroViewController.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 22.04.2022.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
import Lottie

final class IntroViewController: BaseViewController<IntroViewModel> {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.register(IntroCell.self)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    private let pageControl = UIPageControlBuilder<PageControl>()
        .numberOfPages(3)
        .build()
    private let nextButton = ButtonFactory.createPrimaryButton(style: .large)
    private let skipButton = UIButtonBuilder()
        .image(UIImage.icClose.withRenderingMode(.alwaysTemplate))
        .tintColor(.appCinder)
        .build()
    
    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        setLocalize()
        
        
        
    }
    
}

// MARK: - UILayout
extension IntroViewController {
    
    private func addSubViews() {
        addCollectionView()
        addSkipButton()
        addPageControl()
        addNextButton()
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(excluding: [.bottom], usingSafeArea: true)
    }
    
    private func addSkipButton() {
        view.addSubview(skipButton)
        skipButton.topToSuperview(usingSafeArea: true).constant = 25
        skipButton.trailingToSuperview().constant = -20
        skipButton.height(18)
        skipButton.width(18)
    }
    
    private func addPageControl() {
        view.addSubview(pageControl)
        pageControl.topToBottom(of: collectionView)
        pageControl.centerXToSuperview()
    }
    
    private func addNextButton() {
        view.addSubview(nextButton)
        nextButton.edgesToSuperview(excluding: .top, insets: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15), usingSafeArea: true)
        nextButton.topToBottom(of: pageControl).constant = 20
    }
    
    private func addAnimationView() {
        view.addSubview(animationView)
        animationView.animation = Animation.named("rover")
        animationView.edgesToSuperview()
        animationView.backgroundColor = .white
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
    }
    
}
// MARK: - Configure and Set Localize
extension IntroViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        pageControl.addTarget(self, action: #selector(pageControlValueChanged), for: .touchUpInside)
        
    }
    
    private func setLocalize() {
        nextButton.setTitle(L10n.Intro.next, for: .normal)
    }
    
}

// MARK: - Actions
extension IntroViewController {
    
    @objc
    private func skipButtonTapped() {
        addAnimationView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.viewModel.didFinishIntro()
        }    }
    
    @objc
    private func nextButtonTapped() {
        if pageControl.currentPage == viewModel.numberOfItemsAt(section: 0) - 1 {
            addAnimationView()
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                self.viewModel.didFinishIntro()
            }
            
        }
        
        let nextIndex = min(pageControl.currentPage + 1, viewModel.numberOfItemsAt(section: 0) - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc
    private func pageControlValueChanged(_ sender: UIPageControl) {
        let current = sender.currentPage
        let width = UIScreen.main.bounds.width
        collectionView.setContentOffset(CGPoint(x: width * CGFloat(current), y: 0), animated: true)
    }
    
}

// MARK: - UIScrollViewDelegate
extension IntroViewController {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let xPoint = targetContentOffset.pointee.x
        let pageIndex = Int(xPoint / view.frame.width)
        pageControl.currentPage = pageIndex
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if pageControl.currentPage == viewModel.numberOfItemsAt(section: 0) - 1 {
            nextButton.setTitle(L10n.Intro.start, for: .normal)
        } else {
            nextButton.setTitle(L10n.Intro.next, for: .normal)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension IntroViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: IntroCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
    
}

// swiftlint:disable line_length
// MARK: - UICollectionViewDelegateFlowLayout
extension IntroViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height - 100
        return CGSize(width: width, height: height )
        
    }
    
}
// swiftlint:enable line_length
