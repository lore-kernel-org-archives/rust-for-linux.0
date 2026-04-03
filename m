Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC5B1E834B;
	Fri,  3 Apr 2026 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214427; cv=none; b=GGBDK3gkkLDF2L22VF6pvY/3g0wRPVAenzywvndSi8aj5OIqU+DGsvka6CnuAvpzkdl0t82EMpy5jFzpKbs8pr/TXz7WVFgLZ7QPJi0iA1yTuYMNs+DL9R+mgS+R9bnRo+uQE9e4s0hzKqVWx0noNq7AuGpVw1TstGK9nuYYdc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214427; c=relaxed/simple;
	bh=LQuTGRFuMGDvZhUjpEenEBzJ7iSFUxEEIm0vvNjcSrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=epL5CEwh1y6rcynEscOAfEUR6N2Z4qdbOUCWuYCy1u9llHGqCFvTRyym54Ci4pV5GTGfQSIPuu28ya4zx08vXEiZRz6x92xctnT7JdxmR9yGnfrPlr1lT8B1nMEhiaCq+cczPWBIHZmcNCLeCGUxd2XmoIhF3uYQR2CAeZHpjcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pA0Ll/Iu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pA0Ll/Iu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73CFCC19424;
	Fri,  3 Apr 2026 11:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775214427;
	bh=LQuTGRFuMGDvZhUjpEenEBzJ7iSFUxEEIm0vvNjcSrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pA0Ll/IuGoKRkzC8p0PWtZfuRn7xWWl0h0VF96Pre4X2AQ8uQMqqkx0WEimTdF9r1
	 PT3lQf5iYpJB8AadM7M55hSVL8RHxBui/Gd+d4EF4tUHgAxovQQFXKDko7BCqJzW+o
	 dW50QDWLGIgAqtj6nNgD1zRp1bSO7v1/aLinma4UftBwnGf2kGFkmgwInNta9CdzBT
	 5FQ8EDdT1FvS25DwO9G1iwRi17ATSsIK5tdfuEybzqP41Kc+GGdrMcesMqeCBQLPwD
	 kRihbVS4gXRJkRGb1nGeGLunur3QLK2y7lQ9LGt/mhkmdt7EqbOyb4E6TJ1z3hNfjR
	 t3LRlMMsO5SIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D77E7E370;
	Fri,  3 Apr 2026 11:07:07 +0000 (UTC)
From: Aakash Bollineni via B4 Relay <devnull+aakash.bollineni.multicorewareinc.com@kernel.org>
Date: Fri, 03 Apr 2026 16:37:05 +0530
Subject: [PATCH v3 1/3] rust: helpers: add workqueue helpers
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-workqueue-v3-final-v3-1-6ffc3950d804@multicorewareinc.com>
References: <20260403-workqueue-v3-final-v3-0-6ffc3950d804@multicorewareinc.com>
In-Reply-To: <20260403-workqueue-v3-final-v3-0-6ffc3950d804@multicorewareinc.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aakash Bollineni <aakash.bollineni@multicorewareinc.com>, 
 work@onurozkan.dev
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775214425; l=2221;
 i=aakash.bollineni@multicorewareinc.com; s=20260402;
 h=from:subject:message-id;
 bh=TWgLPab5a3CzaBmRxYd/7ukOEqxyGwyfOaFPDSJ64gE=;
 b=3BD6m0iX07GZCCtrhtQZmupoYutUrZcdSYgbfzxAVV2yFhXC6XvXfVA2dLonYQGCfJrbd5JR6
 WNwQO0y+5+aB+jECXg/nd/BPKFcyJ1R1Y2RMdUWpIWGWHkoqkYQwjF7
X-Developer-Key: i=aakash.bollineni@multicorewareinc.com; a=ed25519;
 pk=r3Gonl+2k+8RozN9U/XwfICQdnRlAcLeeAfsExmurdE=
X-Endpoint-Received: by B4 Relay for
 aakash.bollineni@multicorewareinc.com/20260402 with auth_id=711
X-Original-From: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
Reply-To: aakash.bollineni@multicorewareinc.com

From: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>

Add C-helpers to bridge the Rust workqueue abstraction with the
kernel's C workqueue macros. These helpers wrap core workqueue
functions that are either inline or macros in C, making them
accessible to Rust FFI.
New wrappers:
- rust_helper_work_pending(): Wraps work_pending().
- rust_helper_cancel_work_sync(): Wraps cancel_work_sync().
- rust_helper_cancel_delayed_work_sync(): Wraps cancel_delayed_work_sync().
- rust_helper_init_delayed_work(): Performs robust initialization of
  a delayed_work structure, ensuring the correct timer function
  (delayed_work_timer_fn) and lockdep maps are initialized using
  standard kernel macros.
These helpers are essential for supporting safe cancellation and
correct DelayedWork lifecycle management in the Rust workqueue API.

Signed-off-by: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
---
 rust/helpers/workqueue.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
index ce1c3a5b2150..85a6c0b9e4d5 100644
--- a/rust/helpers/workqueue.c
+++ b/rust/helpers/workqueue.c
@@ -14,3 +14,35 @@ __rust_helper void rust_helper_init_work_with_key(struct work_struct *work,
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
+	INIT_DELAYED_WORK(dwork, func);
+	lockdep_init_map(&dwork->work.lockdep_map, name, key, 0);
+	timer_init_key(&dwork->timer, dwork->timer.function, TIMER_IRQSAFE, tname, tkey);
+}
+
+__rust_helper void *rust_helper_get_dwork_timer_fn(void)
+{
+	return (void *)delayed_work_timer_fn;
+}

-- 
2.43.0


