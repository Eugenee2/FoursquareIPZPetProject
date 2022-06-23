
import UIKit

class CellWithButton: UICollectionViewCell {

    @IBOutlet private weak var createNewListLabel: UILabel!
    @IBOutlet private weak var addImageView: UIImageView!

    static let identifier = "CellWithButton"

    override func awakeFromNib() {
        super.awakeFromNib()
        createNewListLabel.text = "CellWithButton.CreateNewListLabelTitle".localized(name: "ListVCLocalization")
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }

    static func nib() -> UINib {
        return UINib(nibName: "CellWithButton", bundle: nil)
    }

}
