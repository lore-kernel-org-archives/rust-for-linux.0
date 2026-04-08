Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12E628B7DB;
	Wed,  8 Apr 2026 10:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644629; cv=none; b=WMipw1Y6ykXkrZnbZ4TkpRrWoYVKS2Mkj3GGQ9hIaT113eI6LF7hBunMEGKG5JOuWpfR1aNnceoPCeoQ5um4WnGCmoLM5ik/gOlBKDI4yWolE0uB+hUubdnmLqEDH3KmnJJllZvg8iV2zn964wDDF98KH0JKBcUO7I0LTZgAWHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644629; c=relaxed/simple;
	bh=a9FizM6TYahbipOTTxKYodoWPtBuAQAEBGwVzf9mKJA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CGRaCAYplfnKcR02UaDGTIj/FhrQcQGfUEQ5IM7FPJdupPjjgys4bfHvEEGQT8ffy/s/iSeuMx5/AnQinnzoaSumdweQujmWbld9xlVkSdw5Tk5vDid0ytSMJNTANL2QKEkyRHbL0cK3822Gieu9vE0amJx4bhHYLaAsP54rB1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZpZUeukr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZpZUeukr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D7F9C19421;
	Wed,  8 Apr 2026 10:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775644629;
	bh=a9FizM6TYahbipOTTxKYodoWPtBuAQAEBGwVzf9mKJA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZpZUeukrfGWQtohkQJgHbb3EaNmyPT1zc0RwPz+mHTOon07fZMVaazxUbkgMWp3WH
	 Xutmma5vRYwHW6EPgyxP9ZetLIu7v0XBNnIuA12EWdCEm1Ss6nJ1hmJHmJBCsZuegI
	 in01Y71QDJfTNOFaMDz4VwXsAAo+FATmnUmpaw4OLSdoTQ3PgKW+3bpVEn2A4jbfrT
	 RS+A5b5bbHoYGYEs6gfWvGVMLS23ioKm7xHyRvmm/+qwEj5KoEonNoqkM60+mlql3l
	 nDgm3ft766hAKbaYUivzIOfRjWOkxxV9i0OroocGOUqUlKDRWYTJK+SU5l4X/EQsLu
	 a1tJr6fZIUhSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347711073C8B;
	Wed,  8 Apr 2026 10:37:09 +0000 (UTC)
From: Aakash Bollineni via B4 Relay <devnull+aakash.bollineni.multicorewareinc.com@kernel.org>
Subject: [PATCH v6 0/3] rust: workqueue: add safe cancellation and status
 methods
Date: Wed, 08 Apr 2026 16:06:37 +0530
Message-Id: <20260408-workqueue-v5-sent-v6-0-0dc184c5343d@multicorewareinc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALUv1mkC/32NQQ6CMBBFr0K6dkxBiuDKexgWTTvIRGlxCkVDu
 LuVA7h8L/nvryIgEwZxyVbBGCmQdwmqQyZMr90dgWxiUciikqU8w+L58ZpxRogKAroJdN0oq3J
 jyk6JtBsZO3rvzVubuKcwef7sFzH/2X+1mIMEK211UkXdGC2vw/ycyHjGRTOSM0fjB9Fu2/YFy
 7iSQb0AAAA=
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn.roy.baron@gmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775644627; l=2705;
 i=aakash.bollineni@multicorewareinc.com; s=20260402;
 h=from:subject:message-id;
 bh=a9FizM6TYahbipOTTxKYodoWPtBuAQAEBGwVzf9mKJA=;
 b=DZIfOHuE5RheOtbfsuBI8e/LrqL4NiMIPHf2wR3m0HWGBeg5vWXZPIvZQFWfjYXNacf6Ks1qY
 zrHR7cpV626Cv9MJ1RdDB1M77GOprChHcsdFOXTO5u9mSZxUpJyAQvr
X-Developer-Key: i=aakash.bollineni@multicorewareinc.com; a=ed25519;
 pk=r3Gonl+2k+8RozN9U/XwfICQdnRlAcLeeAfsExmurdE=
X-Endpoint-Received: by B4 Relay for
 aakash.bollineni@multicorewareinc.com/20260402 with auth_id=711
X-Original-From: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
Reply-To: aakash.bollineni@multicorewareinc.com

Changes in v6:
- Refactored rust_helper_init_delayed_work to ensure robust, single-pass initialization 
  using standard kernel macros, avoiding redundant lockdep and timer setup.
- Simplified impl_has_delayed_work! macro by using direct pointer casting for 
  work_container_of.
- Added missing # Safety documentation blocks to reclaim methods for Arc and KBox.
- Improved documentation readability by adding vertical whitespace to all examples.
- Cleaned up link syntax by using direct inline links and removing redundant reference lists.
- Removed unused rust_helper_get_dwork_timer_fn C helper.
- Link to v5: https://lore.kernel.org/r/20260407-workqueue-v5-sent-v1-0-d0d635289ca0@multicorewareinc.com

PLEASE IGNORE v4. This version (v5) corrects a critical KUnit build error 
and formatting regressions that were present in the previous submission.

Changes in v5:
- Fixed missing arc_count helper in rust/kernel/workqueue.rs that caused KUnit
  build failures.
- Fixed formatting in samples/rust/rust_workqueue_test.rs via rustfmt.

Changes in v4:
- Fixed Reported-by/Closes tags and metadata for robot tracking.
- Improved commit structure to separate API changes from tests.

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

 rust/helpers/workqueue.c            |  27 ++
 rust/kernel/workqueue.rs            | 500 +++++++++++++++++++++++++++++++++---
 samples/rust/Kconfig                |  10 +
 samples/rust/Makefile               |   2 +
 samples/rust/rust_workqueue_test.rs | 191 ++++++++++++++
 5 files changed, 695 insertions(+), 35 deletions(-)
---
base-commit: bf074eb6891be799174ff42e0051492681fdc045
change-id: 20260407-workqueue-v5-sent-a895d51cc4f5

Best regards,
-- 
Aakash Bollineni <aakash.bollineni@multicorewareinc.com>


