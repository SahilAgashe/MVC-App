//
//  ActivityRoutineTableCell.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 03/01/24.
//

import UIKit

class ActivityRoutineTableCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var whiteBgView: UIView!
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var activityThemeLabel: UILabel!
    @IBOutlet private weak var xPLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    
    // MARK: - Overriding
    override func awakeFromNib() {
        super.awakeFromNib()
        self.whiteBgView.layer.cornerRadius = 5
    }
    
    // MARK: - Public Helpers
    public func setupInterface(activityRoutineTask: ActivityRoutineTask, backgroundImageName: String) {
        backgroundImageView.image = UIImage(named: backgroundImageName)
        titleLabel.text = activityRoutineTask.title
        activityThemeLabel.text = activityRoutineTask.theme.description
        xPLabel.text = "⚡ \(activityRoutineTask.xpValue) XP"
        durationLabel.text = " 🕑 \(Int(activityRoutineTask.duration)) mins"
    }

}
