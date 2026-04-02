Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A51F299943;
	Thu,  2 Apr 2026 03:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100229; cv=none; b=R09KAL3BlJ/UBy5G0sJBWqnnRwcU0G0dlR5Mwsig4ZCiuSDjNAxzuL475ubB+5cto2DOlvWppGueNkXSF5z//lB40UaYT6h1xYXXXuEGSLEeqHaq0WiFdhsZXaaAGbdLO+WGHrlL2LhZNR4i0RMSrsA5pQezqkZppo9gRSCM69I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100229; c=relaxed/simple;
	bh=NAevoZnfcNs3+ozdq6T4miOpHYGB4ulcSVDjELVWttE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qgxr20MA+JxtTUv+CEJgL+vn4V4VM7wqjfZvLOEmjyo/AaX6VIJFKb233uHm81nOw7bOSg4z6XP7Izkw8bPDjrwAFFyXetaGBLZ7i9bJiI8MJwSVsHzdi9RWk6fhn9fXyRhuyMEVnXkDiIPkO84jFHi3BR/Rk7UEnuB09i3fvx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlZwKSE7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlZwKSE7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49A0AC19421;
	Thu,  2 Apr 2026 03:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775100229;
	bh=NAevoZnfcNs3+ozdq6T4miOpHYGB4ulcSVDjELVWttE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jlZwKSE7KfBC37sgzm8LVJLNPybs1fO3HqgM+T6Un8SCGOrgPxRuCVcj1LVjBURy+
	 F8pVVVrmkaO5nuNiQ322x2XE9/E8bLTwYLZutQzoJB5rtfOZ7i0bl1i3kWU0QAFz2q
	 M81f+gsI/i2pUgKir4zYNNdkHU8dNRRoIZ2KsSUt0l6DMh9pEfaYBdkN29Z4PZC22P
	 5H3SSQ9PCwXG5wMyFS9vvcxZGb5h54dQjToyCf/5ZjFGYEr3t4jcmeG31jnSh2/NX9
	 IFKy0Hs5bsuUWRkbwEb5KP07CrVssTHQtJS0CyTeT8M1pclfQxkpdoynNls8/vxPu8
	 SrO0ACYlP0nxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388AE111227B;
	Thu,  2 Apr 2026 03:23:49 +0000 (UTC)
From: Aakash Bollineni via B4 Relay <devnull+aakash.bollineni.multicorewareinc.com@kernel.org>
Date: Thu, 02 Apr 2026 08:53:46 +0530
Subject: [PATCH 1/3] rust: helpers: add workqueue helpers
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-rust-next-v1-1-0940bb8f201c@multicorewareinc.com>
References: <20260402-rust-next-v1-0-0940bb8f201c@multicorewareinc.com>
In-Reply-To: <20260402-rust-next-v1-0-0940bb8f201c@multicorewareinc.com>
To: rust-for-linux@vger.kernel.org
Cc: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775100227; l=2252;
 i=aakash.bollineni@multicorewareinc.com; s=20260402;
 h=from:subject:message-id;
 bh=wZ0Dz1PhUI/Psa+wxQ3zKnWwUiWulSm2trcU2tpe4UQ=;
 b=go69+KD4+Ci2CE4Wrsc43j78PKvHKlfOVwoPNu5ygpADwWPGB4Eux5gK83ogUI5RV3r4dN20j
 ebJnafbai3ADvG2hxMBI60fcK+WAQnMasa8Zuqxgj4QVCrFnbRzl339
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
 rust/helpers/workqueue.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
index ce1c3a5b2150..06447bec912a 100644
--- a/rust/helpers/workqueue.c
+++ b/rust/helpers/workqueue.c
@@ -14,3 +14,37 @@ __rust_helper void rust_helper_init_work_with_key(struct work_struct *work,
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
+	__init_work(&dwork->work, 0);
+	dwork->work.func = func;
+	lockdep_init_map(&dwork->work.lockdep_map, name, key, 0);
+
+	timer_init_key(&dwork->timer, delayed_work_timer_fn, TIMER_IRQSAFE, tname, tkey);
+}
+
+__rust_helper void *rust_helper_get_dwork_timer_fn(void)
+{
+	return (void *)delayed_work_timer_fn;
+}

-- 
2.43.0


