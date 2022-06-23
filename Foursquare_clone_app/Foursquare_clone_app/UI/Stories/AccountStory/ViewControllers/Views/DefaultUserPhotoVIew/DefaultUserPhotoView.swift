

import UIKit

class DefaultUserPhotoView: UIView {
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var userNameLabel: UILabel!

    var userNameText: String? {
        didSet {
            guard let text = userNameText else { return }

            self.reloadTextUI(with: text)
        }
    }

    init(frame: CGRect, userName: String) {
        userNameText = userName
        super.init(frame: frame)
        commonInit()
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - setupUI
private extension DefaultUserPhotoView {
    func commonInit() {
        let nibName = String(describing: DefaultUserPhotoView.self)
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    func setupView() {
        contentView.layer.cornerRadius = 10
    }

    func reloadTextUI(with text: String) {
        userNameLabel.text = text
    }
}
