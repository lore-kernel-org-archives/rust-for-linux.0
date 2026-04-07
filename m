Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC7A3A8726;
	Tue,  7 Apr 2026 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558282; cv=none; b=dPwcWCMfCg8i68Hbxda29xLwQRb7fxbHQ3lUnBRr3TTlbllmxB8WgBfqFeDzrLyD4HH4/CRZWqUhVu0P6EFUlwwImqJn8s9BEKnwog/y2CNj/uLEpwwPg5RobU1uevRCKb3e+iaPXxw6BfkrKgaStWQ/VkBpzgIfUPK5wYtFP5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558282; c=relaxed/simple;
	bh=ysMbBy2kApPtTeFdJEI+hTEKpUB+Nd4w1DUl1XEONNM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MZ3rcNWncGVwpZqOIrMRF8yOPhWtbb42wnPUOWr60KDLJCs7QJU+sncOoXBZdb/VJl7LPGJtDf5bhFpOHDDxIS7dl7aHDkg22EqyoDVVfeW2vSo6uHFS9vC7eYtofsWm6S+LBtPCyTNqA9LsSGiV7sv8zZrnpVyvD0XmxSsj93s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqQJJJoW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqQJJJoW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A3F2C116C6;
	Tue,  7 Apr 2026 10:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775558282;
	bh=ysMbBy2kApPtTeFdJEI+hTEKpUB+Nd4w1DUl1XEONNM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SqQJJJoWGtjuSl644YMs2qtgN19DyuFefHzPvT39w7baEATR4/rhcCh4oyQtt6tTt
	 XYypg44NX7SYXnQy+Sw5KuqndUgKWj7pLVm5sqhQzg/N1YAkzltN8wmbDi7U0owsup
	 TjGzQH8DSgBQWdZujhncjuC1IUTtzYoCqHkFQ1xBM1aJc+CAnaDtiFSyQ5u8AUwdTQ
	 92SKQ9Jm3sKoMpxyD4hOwd7w+UG9k0fCuwZOqwCu57KawBdijxjcxGabGdCM2vDeEp
	 Ad0glqjjKG4pmxk3wPNgDYNCPKoUb/xk8Gs7v1HuqSdArbXjrELHjItkonwV6vf+g2
	 zEyIvFr/hF1mA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3394CEDB7F3;
	Tue,  7 Apr 2026 10:38:02 +0000 (UTC)
From: Aakash Bollineni via B4 Relay <devnull+aakash.bollineni.multicorewareinc.com@kernel.org>
Subject: [PATCH v4 0/3] rust: workqueue: add safe cancellation and status
 methods
Date: Tue, 07 Apr 2026 16:07:49 +0530
Message-Id: <20260407-workqueue-v3-final-v4-0-c27da7e5f175@multicorewareinc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH3e1GkC/32NSQ7CMBAEvxLNGaNRbMxy4h8oB+OMyYjEDnYWU
 JS/Y/IAbl0tdfUCiSJTgkuxQKSJEwefQe0KsI3xDxJcZ4YSS40KpZhDfL5GGklMUjj2phXOKNQ
 1ubs+WsjDPpLj9ya9VZkbTkOIn+1jkr/2ry4HFNo5K88HrE+ort3YDmxDpNlEYm/3NnRQrev6B
 aSgyQe/AAAA
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn.roy.baron@gmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aakash Bollineni <aakash.bollineni@multicorewareinc.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775558278; l=2704;
 i=aakash.bollineni@multicorewareinc.com; s=20260402;
 h=from:subject:message-id;
 bh=ysMbBy2kApPtTeFdJEI+hTEKpUB+Nd4w1DUl1XEONNM=;
 b=DAh5yG5vBFiE7/cni55InX3MEAzYtsHh6u+c84wUq2q47b9a+mpjRH04W+lyAabONcFqkrYrC
 yQIhvoFsroeBjM+PlqV0QH8Qf5ShL3/9RQ8BIdv1X36Jgb8+B7mWhWX
X-Developer-Key: i=aakash.bollineni@multicorewareinc.com; a=ed25519;
 pk=r3Gonl+2k+8RozN9U/XwfICQdnRlAcLeeAfsExmurdE=
X-Endpoint-Received: by B4 Relay for
 aakash.bollineni@multicorewareinc.com/20260402 with auth_id=711
X-Original-From: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
Reply-To: aakash.bollineni@multicorewareinc.com

This is the fourth version of the patch series for modernizing the Linux
kernel Rust workqueue infrastructure.

Changes in v4:
- Fixed rustfmt and formatting errors in samples/rust/rust_workqueue_test.rs
  reported by the kernel test robot.
- Added Reported-by and Closes tags to the third patch for robot tracking.
- Improved the commit structure to cleanly separate API changes from tests.
- Link to v3: https://lore.kernel.org/r/20260403-workqueue-v3-final-v3-0-6ffc3950d804@multicorewareinc.com

Changes in v3:
- Fixed a critical initialization bug in the DelayedWork C-helper where
  the timer function was not correctly registered, causing KUnit crashes.
- Consolidated Arc refcount inspection into a shared `arc_count` helper
  in `rust/kernel/workqueue.rs` (gated by CONFIG_KUNIT).
- Updated internal KUnit tests and sample module to use the shared helper.
- Split the sample test's `TestItem` into `TestWorkItem` and
  `TestDelayedWorkItem` for clearer trait dispatch and safety.
- Integrated the sample stress test into the kernel build system via
  the SAMPLES_RUST Kconfig.
- Improved documentation and safety comments based on feedback from
  Onur and Miguel Ojeda.

Aakash Bollineni (3):
  rust: helpers: add workqueue helpers
  rust: workqueue: add safe cancellation and status methods
  rust: workqueue: add KUnit and sample stress tests

To: Miguel Ojeda <ojeda@kernel.org>
To: Alex Gaynor <alex.gaynor@gmail.com>
To: Wedson Almeida Filho <wedsonaf@gmail.com>
To: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn.roy.baron@gmail.com>
To: Benno Lossin <benno.lossin@proton.me>
To: Andreas Hindborg <a.hindborg@samsung.com>
To: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>
To: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
---
Aakash Bollineni (3):
      rust: helpers: add workqueue helpers
      rust: workqueue: add safe cancellation and status methods
      rust: workqueue: add KUnit and sample stress tests

 rust/helpers/workqueue.c            |  32 +++
 rust/kernel/workqueue.rs            | 463 +++++++++++++++++++++++++++++++++---
 samples/rust/Kconfig                |  10 +
 samples/rust/Makefile               |   2 +
 samples/rust/rust_workqueue_test.rs | 192 +++++++++++++++
 5 files changed, 664 insertions(+), 35 deletions(-)
---
base-commit: bf074eb6891be799174ff42e0051492681fdc045
change-id: 20260403-workqueue-v3-final-fa406defb67c

Best regards,
-- 
Aakash Bollineni <aakash.bollineni@multicorewareinc.com>


