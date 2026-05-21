Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4352FFDE1;
	Thu, 21 May 2026 08:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353665; cv=none; b=kg+k6QUi8nzcwRPQJUG6G8UGT9RB27DQFTK4LB7xqp6SDwCFDN1MdyCRsMlXe7/6MgT8d/5mpjquZdjtmYOobx1eBZmtmgAMnU3MY/KpA8+sv1dwUnyttBDkGI0rHuU47RDKH5x5zdJ8k7kzUxd87be3EWSlaatZTdpExt+9dcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353665; c=relaxed/simple;
	bh=JkRJHVk7qN/2HRUS21hbOKzxptWiZsFdwOwUimf7mFY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hzRbpx+zWCCesz/tidZzNUImHgAJ28Ey500DaPUrWW4pr3pA+ABHVt6XLXgmn2G01debWsa9NIpdD6tq4ALY830hexPu1nady2gpB0mrcFfLIhnQEKP+xrmUzN/cFf2jGPUnxF1bNmmTXqTCuUWJIq4yQ38bBL7C2T/m7uVeKpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAyWKnCe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAyWKnCe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A234C2BCB4;
	Thu, 21 May 2026 08:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779353665;
	bh=JkRJHVk7qN/2HRUS21hbOKzxptWiZsFdwOwUimf7mFY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MAyWKnCe6foY7mldJeaskIhpv/UdO4ABYPMygbXiJ6upDK/V2MCY0gwB4n9eyNivu
	 kSyhx+SzLrN2h3NRpJ21us3KaFUPa3cUZGIwL/ZT1sg3RsJRMzlvKTYaI0Iwfk6mBw
	 smj6qNXLPPhXY86dpYFkEI01JF/ghRS/BI+S/woXHihs37hC7uRlRN1psCCNY6B/gn
	 39BJ3HBCaVxhnEnHqJTWLlLZC4LgcZy3uYQdNd98KGemuWEr1nJQd9TrfvmcVmIJAk
	 G7od2IJ27yThvK6c+EGxFhIi2fISATCohJsh9kEjEQOwzD2X1VYnBIqTgU1YRECNh7
	 NSRD+5G5FT4Zw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9E2CD4F5E;
	Thu, 21 May 2026 08:54:25 +0000 (UTC)
From: Aakash Bollineni via B4 Relay <devnull+aakash.bollineni.multicorewareinc.com@kernel.org>
Subject: [PATCH v7 0/3] rust-helpers: add workqueue helpers
Date: Thu, 21 May 2026 14:24:20 +0530
Message-Id: <20260521-workqueue-v5-sent-v7-0-fb4b4dde35ec@multicorewareinc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADzIDmoC/33NQQ6CMBCF4auQrq1poYXiynsYF2Q6SKO02kLRE
 O5uYeVCXf4vmW9mEtAbDOSQzcRjNME4m6LaZQS6xl6QGp2a5CwvmWAVnZy/PkYckUZJA9qBNqq
 WWnIA0UqS7u4eW/PczNM5dWfC4PxrexH5uv7TIqeMaqbLQuaqhoYd+/E2GHAep8ajsbAH15MVj
 uUnpr5hZcKYBq4EyEIU+ge2LMsbtoKrTAoBAAA=
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779353663; l=2149;
 i=aakash.bollineni@multicorewareinc.com; s=20260402;
 h=from:subject:message-id;
 bh=JkRJHVk7qN/2HRUS21hbOKzxptWiZsFdwOwUimf7mFY=;
 b=Jz4Y9g9j6UIWH09s9vu9Px451gKp+Dcy24rChDOv6wSSkxijYjo0gbYhydgI4K6TbkshWbxSE
 WXR7+/rYyh+Ag3k58euJBGYfcdgsm4EV1wbMMT5mYpS6zKYO0V46HYT
X-Developer-Key: i=aakash.bollineni@multicorewareinc.com; a=ed25519;
 pk=r3Gonl+2k+8RozN9U/XwfICQdnRlAcLeeAfsExmurdE=
X-Endpoint-Received: by B4 Relay for
 aakash.bollineni@multicorewareinc.com/20260402 with auth_id=711
X-Original-From: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
Reply-To: aakash.bollineni@multicorewareinc.com

Changes in v7:
- Fixed KUnit and rustfmtcheck errors reported by the 0-DAY CI Kernel Test Robot by correctly restoring the `arc_count` function and removing orphaned `#[cfg]` attributes.
- Added an explicit `depends on KUNIT` to `CONFIG_SAMPLE_RUST_WORKQUEUE` in `samples/rust/Kconfig` to prevent randconfig build failures when the sample is enabled but KUnit is disabled.
- Fixed an E0277 trait bounds compilation error for `TestDelayedWorkItem` by utilizing the `impl_has_delayed_work!` macro instead of a manual unsafe implementation.
- Link to v6: https://lore.kernel.org/r/20260408-workqueue-v5-sent-v6-0-0dc184c5343d@multicorewareinc.com

rust: workqueue: add safe cancellation and status methods

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

---
Aakash Bollineni (3):
      rust: helpers: add workqueue helpers
      rust: workqueue: add safe cancellation and status methods
      rust: workqueue: add KUnit and sample stress tests

 rust/helpers/workqueue.c            |  27 ++
 rust/kernel/workqueue.rs            | 500 +++++++++++++++++++++++++++++++++---
 samples/rust/Kconfig                |  11 +
 samples/rust/Makefile               |   2 +
 samples/rust/rust_workqueue_test.rs | 191 ++++++++++++++
 5 files changed, 696 insertions(+), 35 deletions(-)
---
base-commit: bf074eb6891be799174ff42e0051492681fdc045
change-id: 20260407-workqueue-v5-sent-a895d51cc4f5

Best regards,
-- 
Aakash Bollineni <aakash.bollineni@multicorewareinc.com>


