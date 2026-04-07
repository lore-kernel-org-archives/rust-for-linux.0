Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC573AA1B2;
	Tue,  7 Apr 2026 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559979; cv=none; b=k4p+RbIkk+Lbys3Ssf6XzWjQ9c9g/zM4iEecjNxd3rU2RcQ5lPTO8cRIC7Uhm903wymaxD7b4kGaMr6Nl8Zgc3YvdJPeCGKmHOIDSXeC9o+0RXfFdey389Wex+bZOG5l/Am9TM5oBQR+dBnRfH4ytuWXlp2smh+pyCI0b8Uvm18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559979; c=relaxed/simple;
	bh=LQuTGRFuMGDvZhUjpEenEBzJ7iSFUxEEIm0vvNjcSrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SxCiDbtt5iP01I8emNZ7dlxctgm1G0LGpPBhJhKGBIdwX8xRTDIt6GWEJ9fuOZDwPfpXDtbI+xbUGJKRdUhIs1sh5hpQYTL0XgKM5yGcxOdbTRvaDvJsxj3KX/2u/zb8sB5rM/0kw25dQQNrQe2PUQphu7BoUG1eieuO5PjN5vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tVHQdZmH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVHQdZmH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D6AEC2BCAF;
	Tue,  7 Apr 2026 11:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775559979;
	bh=LQuTGRFuMGDvZhUjpEenEBzJ7iSFUxEEIm0vvNjcSrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tVHQdZmHur2JVUN+ddcG6GaS/MF2Itlyu+7wXw2uR4jxO60xBSGu069GOG05wQPzA
	 +uKn/mu2yWFDJ3Zrd0m9U7qlbFuXB67nzrI88WUvfkwDXs70jS1riTrUDQlHgJi0xb
	 J4+5ehrXaSu7Z1psT410UrlqkN5TzF7uxWlqBXQ5Gxhgovkp1QP5KITV71SsVDpN1v
	 /n+Acup0Q7dlCf4YBWLF7deXo42lIihjQRKrpLx6C73oJyH0Jz7qd5ty57PlL/Cpqf
	 zy3oHdDScJoBEu+uJTUnRM3VQCDs/lUxepuYAH1WzCnfsu//0LvxbbPs4jFeMtuEW9
	 B6G3mV7SoJpRw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157B6EDB7FD;
	Tue,  7 Apr 2026 11:06:19 +0000 (UTC)
From: Aakash Bollineni via B4 Relay <devnull+aakash.bollineni.multicorewareinc.com@kernel.org>
Date: Tue, 07 Apr 2026 16:36:14 +0530
Subject: [PATCH 1/3] rust: helpers: add workqueue helpers
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-workqueue-v5-sent-v1-1-d0d635289ca0@multicorewareinc.com>
References: <20260407-workqueue-v5-sent-v1-0-d0d635289ca0@multicorewareinc.com>
In-Reply-To: <20260407-workqueue-v5-sent-v1-0-d0d635289ca0@multicorewareinc.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn.roy.baron@gmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775559977; l=2221;
 i=aakash.bollineni@multicorewareinc.com; s=20260402;
 h=from:subject:message-id;
 bh=TWgLPab5a3CzaBmRxYd/7ukOEqxyGwyfOaFPDSJ64gE=;
 b=1bOf85qwYDnEa3MjoP5H2i0CEEh9z04YKpSFr6NHorWBu2w90d9KvpigrWG0eTk+waQ3jbRLm
 42ydP+LPSG0CbZyGNs4aAS4xS54I095RZV1ZOaqwRSkiH9LvJbCGy7Q
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


