/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import UIKit

public class PublisherAttentionView: UIView {
  
  public let titleLabel = UILabel().then {
    $0.textColor = Colors.grey000
    $0.text = BATLocalizedString("BraveRewardsAttention", "Attention")
    $0.font = .systemFont(ofSize: 14.0)
  }
  /// Either "X%" or "–"
  public let valueLabel = UILabel().then {
    $0.textColor = Colors.grey000
    $0.font = .systemFont(ofSize: 14.0, weight: .semibold)
    $0.textAlignment = .right
    $0.setContentHuggingPriority(.required, for: .horizontal)
  }
  
  @available(*, unavailable)
  required init(coder: NSCoder) {
    fatalError()
  }
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    let paddingGuide = UILayoutGuide()
    addLayoutGuide(paddingGuide)
    
    addSubview(titleLabel)
    addSubview(valueLabel)
    
    paddingGuide.snp.makeConstraints {
      $0.edges.equalTo(self)
    }
    titleLabel.snp.makeConstraints {
      $0.top.leading.bottom.equalTo(paddingGuide)
      $0.trailing.lessThanOrEqualTo(self.valueLabel.snp.leading).offset(-10.0)
    }
    valueLabel.snp.makeConstraints {
      $0.trailing.equalTo(paddingGuide)
      $0.top.bottom.equalTo(self.titleLabel)
    }
  }
}
