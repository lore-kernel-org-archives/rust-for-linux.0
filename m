Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A134A2D9EDC;
	Wed,  8 Apr 2026 10:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644629; cv=none; b=L0WXYGBQe7MiX3jbrs8KNS26gKige8+MaaQVV5E2zRKpjkpywaWUKsUfifqaOZL/u55I3LAzoevLQgiBsTXGf2g2rrS0/qy1fHH3eQzhybFuG1Jftkbq+5jy0rx0bKRExHFF3+rgfWkotcjrYYwvHCcfFAgrAwaeUfLplpDvq1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644629; c=relaxed/simple;
	bh=FTgko1NThfwlhElxnXPhKt3juV5gU4QGVhTziOsckg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=of0WYA/PVyIL2D+rCI+zCvesh2c/F9ksB6DaSccwD2ERyDjn1mPcJpBOueu8ovXc5N+uyMUkZleRreL17IYYX7iiZaHISDeZu+pB4xJ5zGLTaJ/PmsKYkwnEhpWnAwh3xZWpUat/KJZWPc28xqUZWB+5DKc8U2Oe1Wg04h5gp/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iabswZ4t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iabswZ4t"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FDDEC2BCB0;
	Wed,  8 Apr 2026 10:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775644629;
	bh=FTgko1NThfwlhElxnXPhKt3juV5gU4QGVhTziOsckg8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iabswZ4t1DdhxgzYwh1Nfp5gsTbTBbiwS7VEJJMfOc/BNuSg8Ycp22cQJYjibCOll
	 9Boe8sIDqQvfG1HuCkPoDBYqQsxAPxeTQoytG/u65OQcEs6InXE1pCdAvfZC3qbgAI
	 sgAELedF28bDkEg5jPL2FzOWn20m1mgJNAoN0gXD+dKDDWLOjXRoWeG+mspoTyTCzU
	 9Iy4rd8FaNS/PrTXLFoa6/mBdVRBAceDpvfz8JK5UQrcQXgkw9wdtCh31bO3N70eP+
	 guHkMk9spslJBN0Lm6iGWt+dT+FCg7O/64rxXVvQDerVsp0kSAmfjRf8rg3sCsyjw9
	 lhHq9Xb4coacw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658DB1073C8B;
	Wed,  8 Apr 2026 10:37:09 +0000 (UTC)
From: Aakash Bollineni via B4 Relay <devnull+aakash.bollineni.multicorewareinc.com@kernel.org>
Date: Wed, 08 Apr 2026 16:06:38 +0530
Subject: [PATCH v6 1/3] rust: helpers: add workqueue helpers
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-workqueue-v5-sent-v6-1-0dc184c5343d@multicorewareinc.com>
References: <20260408-workqueue-v5-sent-v6-0-0dc184c5343d@multicorewareinc.com>
In-Reply-To: <20260408-workqueue-v5-sent-v6-0-0dc184c5343d@multicorewareinc.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn.roy.baron@gmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775644627; l=1654;
 i=aakash.bollineni@multicorewareinc.com; s=20260402;
 h=from:subject:message-id;
 bh=N914P+plvR5IEkLzAqjpGBi8jBApqGMRlOfflBmXQOs=;
 b=QvK2fubgv5E19WQ7IlP/eqlLSvbI0+sJ0P3wV1CuOEbzgzQjahmOjvjRnZbDNK+I2hE6jshgA
 WRnMve/9kbfCttf7a5GAcg+YcL51sk/KTXKMQF5xo+xak2GoGGPdAw/
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


