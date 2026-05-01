Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FAF2248B4
	for <rust-for-linux@vger.kernel.org>; Fri,  1 May 2026 19:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777663047; cv=none; b=GDR3TzaTWjWvotgej0UQv/eh6FN+6BwX+QQWuJUZHJF2Rx2GCV7wJisEdItyMvuxw5lriWKColSKYxZnsHoXDTUhk/GBJwDzO3y+BQsi/Z/iYhHGBUU7JqbKHxVQVVj3P5m2bydwjjwBscUeiwJ5EYumJWtGbn71mfkDiUSOEQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777663047; c=relaxed/simple;
	bh=jdWXGJXsIRcKPhT+m0CDIajFNFIv1R3D1DTqS8xY6UQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZCBSDR+r91mBwJmQnsDAeac6kp0ZtJRvWZ22qLlas/tZrlvoqRXX4hval0EwiXiYSpdBCbyBG8GR5/CTRfKVFbqe4lOlFhQK1JANMrc6CafEPWRbe64Dp5xHejYgrJqEGw/MFer7fciHoXm6G4GGv8+PHBii3b7+XE/qot8moXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=K+j4rjmx; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="K+j4rjmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1777663032; x=1777922232;
	bh=SxTh38i9K+xyXn03fz+j8DdXJTzcEFv933v9THsiQOA=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=K+j4rjmxzcScOmZcPiClO3WLYNnS9cY3PkZWXStzBviujE9GGkazvBO3a4HzWgf3T
	 4igvyp9T09Ew06mIGdz6wUCQCssSoic9KmzRqfY/OxiKRz4rAnlaFPDgt3AbcR63AC
	 qGpKfaFq9OYo5wCyVDb99hGV9zje1UbJWKONRw/zAKFf/+JWribFxvSkWmMft/1cT4
	 jWjB7PCgNW7+8ESdf3VskVbY6KBNJu0v8/oTMUThQ7ceDqzvZEeameBrf6ubqGlXxM
	 +HbeZkjbxb8rxirNW+WKHNvZoqTZ1iB4+91rgFkKTSD+tCE4ealdyvYnyzT28g5KIa
	 dQDtlWwigiuVg==
X-Pm-Submission-Id: 4g6glR0cG0z2ScP4
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	tamird@kernel.org,
	daniel.almeida@collabora.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2 0/1] rust: add Work::disable_sync
Date: Fri,  1 May 2026 22:11:21 +0300
Message-ID: <20260501191122.64311-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The immediate motivation is the Tyr reset infrastructure [1] which needs
to stop queued or running reset work during teardown before dropping the
resources used by that work. The reset series started to require too many
independent dependencies, so this is split out as a standalone change to
keep the reset series focused on the reset logic and easier to review,
rebase and land.

[1]: https://lore.kernel.org/all/20260416171728.205141-1-work@onurozkan.dev

Changes since v1:
- Fixed a soundness issue where Work::disable_sync() could make a later
  Pin<KBox<T>> enqueue fail and hit unreachable_unchecked().
- Removed the WorkItemPointer::cancel() helper and explicitly call drop()
  in disable_sync() after C has already canceled the work.

v1: https://lore.kernel.org/all/20260428104459.174602-1-work@onurozkan.dev

Onur Özkan (1):
  rust: add Work::disable_sync

 rust/kernel/workqueue.rs | 121 ++++++++++++++++++++++++++-------------
 1 file changed, 81 insertions(+), 40 deletions(-)

-- 
2.51.2

