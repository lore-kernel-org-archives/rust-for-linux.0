Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D563311C36;
	Thu, 21 May 2026 08:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353665; cv=none; b=Y3l/AEsQj4B/iznmkKtK2R4Qe0Jdw2F893ctNwKbP1a+Bhc0uu4/imfoVlEE1jXuH2fKQFyYLRVPoplxWbflPc6fy9sLuh/e0gAEQ4GGWxFVisBRRqs5tCVunqlkTCLs8qPb7MBHb9qUnmVSzRQo4BHrTddfHjpIciQbXNcE6zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353665; c=relaxed/simple;
	bh=FTgko1NThfwlhElxnXPhKt3juV5gU4QGVhTziOsckg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ibcZnxNT7va4Uri+L6GIMNn33dy5VSIT3abZflVKt4dHujnO3tdrj4F2A7CsNC4/Ksf1tZDj+leXaCkrFznDHPJcdkcLPNg/XyuwJ6bZ2vGu8EQLTmsFSoOc5EJ44TozYhqdKIrpMzynnHu5l0XKb7S0QS2Wf1Q/noCMC7EbZvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nP6VXUgl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nP6VXUgl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59373C2BCB9;
	Thu, 21 May 2026 08:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779353665;
	bh=FTgko1NThfwlhElxnXPhKt3juV5gU4QGVhTziOsckg8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nP6VXUglBi7wmfdZ5csvFlyQylmTk3qlubtgoBLSpSiYhA6sujta6a1TNcYjsoS51
	 2L8wtABi5bdK+ioOu/VBgi5FJ+iat3auUcHI/piKwzZRVqMFabYh4pemTcNOfBGWUh
	 C6vourFW/puihTCuzGEyN4VpyZQOcL4aywT3W2hYFWhX7nB+5S1w9izLpMm34jIBIW
	 ump/km69utEdpy10r4OddIYQc+uuA8m3Dy/tAIfWGisXThdR4HG2bDtPkgAGyWw+1r
	 kKQmtww1VCGC1MOTToxK/4ff0/fLqQLYgkI7+RMRcu1w8FO8es4kSl/Dr36lwTmZAP
	 QX8Kjgi+qYyPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44997CD5BA4;
	Thu, 21 May 2026 08:54:25 +0000 (UTC)
From: Aakash Bollineni via B4 Relay <devnull+aakash.bollineni.multicorewareinc.com@kernel.org>
Date: Thu, 21 May 2026 14:24:21 +0530
Subject: [PATCH v7 1/3] rust: helpers: add workqueue helpers
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-workqueue-v5-sent-v7-1-fb4b4dde35ec@multicorewareinc.com>
References: <20260521-workqueue-v5-sent-v7-0-fb4b4dde35ec@multicorewareinc.com>
In-Reply-To: <20260521-workqueue-v5-sent-v7-0-fb4b4dde35ec@multicorewareinc.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779353663; l=1654;
 i=aakash.bollineni@multicorewareinc.com; s=20260402;
 h=from:subject:message-id;
 bh=N914P+plvR5IEkLzAqjpGBi8jBApqGMRlOfflBmXQOs=;
 b=qn9w0ARO1aI0WSl7IXPulLtVyFbMCXlwUF/fPTD2ejSjRDQ8l3YnwcRZmgfFWM1LUfWvf77L8
 n9vYpnG4ln/DrbRINhSzGE2H0NsasdNo0HI0DrWgRmKCEiXOg/qGz+7
X-Developer-Key: i=aakash.bollineni@multicorewareinc.com; a=ed25519;
 pk=r3Gonl+2k+8RozN9U/XwfICQdnRlAcLeeAfsExmurdE=
X-Endpoint-Received: by B4 Relay for
 aakash.bollineni@multicorewareinc.com/20260402 with auth_id=711
X-Original-From: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
Reply-To: aakash.bollineni@multicorewareinc.com

From: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>

Add C helpers for work_pending, cancel_work_sync, and
cancel_delayed_work_sync to bridge the Rust workqueue abstraction
with the kernel's C workqueue macros.

Additionally, add a robust initialization helper for delayed_work
that ensures correct timer (delayed_work_timer_fn) and lockdep setup
in a single pass, avoiding redundant initialization.

Signed-off-by: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
---
 rust/helpers/workqueue.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
index ce1c3a5b2150..ef18d79f95be 100644
--- a/rust/helpers/workqueue.c
+++ b/rust/helpers/workqueue.c
@@ -14,3 +14,30 @@ __rust_helper void rust_helper_init_work_with_key(struct work_struct *work,
 	INIT_LIST_HEAD(&work->entry);
 	work->func = func;
 }
+
+__rust_helper bool rust_helper_work_pending(struct work_struct *work)
+{
+	return work_pending(work);
+}
+
+__rust_helper bool rust_helper_cancel_work_sync(struct work_struct *work)
+{
+	return cancel_work_sync(work);
+}
+
+__rust_helper bool rust_helper_cancel_delayed_work_sync(struct delayed_work *dwork)
+{
+	return cancel_delayed_work_sync(dwork);
+}
+
+__rust_helper void rust_helper_init_delayed_work(struct delayed_work *dwork,
+						 work_func_t func,
+						 const char *name,
+						 struct lock_class_key *key,
+						 const char *tname,
+						 struct lock_class_key *tkey)
+{
+	rust_helper_init_work_with_key(&dwork->work, func, false, name, key);
+	timer_init_key(&dwork->timer, delayed_work_timer_fn, TIMER_IRQSAFE, tname, tkey);
+}
+

-- 
2.43.0


