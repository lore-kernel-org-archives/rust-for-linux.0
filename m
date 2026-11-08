Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150665;
	b=3OZLOfwzmwKwpwE0iJh9cv8cZKDZPQAOiNZKGLLBC1ekzr9Z6x94n0yhhlrofJHtAQl1
	 lHK0RuzxnQzvh2N5Ik3O05EnQpwi0KI/kHUh+pYA8q5qnoSakjkv5cW2rwx6OytORIu2w
	 JVNONYsN21gUH2i8tM/UpRRYoiYrA+u1ItFP/sAaingzoKYrY+FplTTy0c+oIQYFiNpt5
	 ge1F8x5u14PBctTV4BijI5TZ3wn3lx3Hh6MX+Q3p7IuVjTGUtrE5aJjteRGXgi+1WShHd
	 OcFC+TTVNbcnU8f5Q/kC5wxriTobsjoagyFW/0CSHHCLgWcUi9bVBsDJ9bvM/bNlZKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:MIME-Version:X-Received:Date:
	 Message-ID:Subject:From:To:Cc:Content-Type;
	bh=buB+SNDrFBHZ1hWkragxqZalboFLs7Xvh8M5Rtl1Ros=;
	b=jUlLy672Wr/0Sf4DzKYlB9VoTAXpmlNRLB7qTKjB6BRMJ0TRETcyoZE6VJlgyClhcNtu
	 qS7BSdI60cxy6I40b6ol4N1fjEq9/lTodjLkhOeuDAhsiS5OJBwYbeYtKmBVI82UVOHHU
	 6Zl8HM+KqCnNm8HNuZmqs7wt0C18qpib8sjZ/QNmRpnVKE3YWVH+DjgoHF+xMCdrixoJc
	 1riPvymYp9etru0Re/KiM0ZbP/SsTYx5nIqSPtsdxQVA6FWCHuEv1C3biF9a2MqVlU2Cb
	 D7wAdmcYsQ3fo6gowgbQoXPO+30uFMB0CabaaPqBqve2FfL057kZv+hplqsZOdA2+dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ivEusNDn;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CC0606A321
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Nov 2026 15:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77CC0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ivEusNDn
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so213253eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Nov 2026 07:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794150663; x=1794755463; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:date:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=buB+SNDrFBHZ1hWkragxqZalboFLs7Xvh8M5Rtl1Ros=;
        b=ivEusNDnrfqIuIdRaP8LtJxm21MMlK9JerEehVrvr2l+LMByoIthz3CTqnPVSKmHst
         P3I7EqnddEk+6FptXbBY6n9wempFctfTmhts5vhpLJyMO4qsa0OuKKvJgn3jX/f2bBsg
         uKoFB/hM+1U+qgdz2YOGHUGk0ztkMnoNCwzZNb5dDQTZoy8+MHiGHuCJ3xkdV1PueFHE
         NtWltJihFbVu4Fpu+c1UN+uAdmpwkB3iNet2K8IYk0N93Jo1WDwIXXQRlWzh9eBDDJ2U
         S91e1jFVV3PXSb2v8tpsbgH5Gha0DCByTapHQxre5goBohybPpKMAWHRVL7Fx3ktLZNq
         7YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150663; x=1794755463;
        h=content-type:cc:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=buB+SNDrFBHZ1hWkragxqZalboFLs7Xvh8M5Rtl1Ros=;
        b=iblGW4cj4yI372IQ2iWgKzeNrrkazu1wzksNGaeCJBCmq5boAauB7FMptsfC8J+3gc
         aV1CODmMw3WicRNAFSvsz75QaDK8DXbyR/fJ2beoWkMSrvOgoGjc4LmJxxbC+uachKOk
         21CG8DA+zUolU6gTw1k+052iEoIwguQ99ge2T0AT7396fkoeqiy/0fOupRkVzHbhTOfh
         ykinKjHBt3bgkymW0ssvGQb/aLGxL+a7sEAP7v070FHG97X3PhxcjguPOmcp7p2PI9N7
         G9gtsbKb0eBGcVKOQ3fIoCATkG/g98jac9yD9toagwX8s5cnqKMqWfACGUhZZhWdJDav
         haMw==
X-Forwarded-Encrypted: i=1; AL+hErH2ONwXQk7cePveOi9wilJUN7bRfVAFzfaqSxdmH8Sx9GeCkNKIG2J2VNf7CIzv4QP9liYkGK5Ej5CS7KB01Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z96zBmohv5kM204TNa0SGGoSLjm+07u6QRN1alsGrgNMJvs9V0K
	n+m3s4+61OkeJCazxDhPYNYJvhIN04Uj6dn0odbKAuXcgngQcFzlwvMuyMVxkSfk2TpuldfH/XK
	jXGT5Q1UgKhRKNTvaI9jaOsCrtQuazQ==
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: from dybpg4.prod.google.com ([2002:a05:7301:4144:b0:36c:a067:eca4])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:730a:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-37258c2886bmr2826202eec.38.1794150663059;
 Sun, 08 Nov 2026 07:11:03 -0800 (PST)
Date: Sun, 08 Nov 2026 15:11:01 GMT
Message-ID: <18e61a85b0d13e9c.3137322e32332e3235332e313736.9c152.0000sendgmr@google.com>
Subject: [PATCH 1/2] rust_binder: reject sync transaction with pending sync work
From: Chris Wiseman <chriswiseman@google.com>
To: Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

When a thread replies to a transaction with TF_DEFER_COMPLETE, its
BR_TRANSACTION_COMPLETE work item stays in inner.work_list while the
next blocking read waits in Process.ready_threads. A new incoming
synchronous transaction can then be queued behind that deferred
completion in inner.work_list. If the thread's read buffer only has
room for the deferred completion, the ioctl returns to userspace with
inner.current_transaction cleared while the incoming synchronous
transaction remains queued in inner.work_list.

If that thread sends an outgoing synchronous BC_TRANSACTION before
draining its work queue, Thread::transaction_inner sets
inner.current_transaction to Some(t_out), and the read phase of the
same BINDER_WRITE_READ ioctl pops the pending incoming transaction and
overwrites inner.current_transaction with Some(t_in). This orphans
t_out from the sender's transaction stack so
Thread::unwind_transaction_stack aborts on exit, leaving a permanent
Arc<Thread> <-> DArc<Transaction> reference cycle that pins both
Arc<Process> instances and their mapped ShrinkablePageRange pages
after the processes exit.

Resolve the TODO in Thread::transaction_inner by rejecting outgoing
synchronous transactions with EINVAL when inner.work_list contains any
item where DeliverToRead::should_sync_wakeup() is true. Checking
should_sync_wakeup() matches C Binder's BINDER_WORK_TRANSACTION check
and ignores Node or NodeWrapper BR_INCREFS/BR_ACQUIRE items pushed
onto inner.work_list when Transaction::new translates flat binder
objects.

Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Fixes: 8eb05e8e47f1 ("rust_binder: add TF_DEFER_COMPLETE flag for avoiding userspace roundtrip")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Wiseman <chriswiseman@google.com>
---
 drivers/android/binder/thread.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index f5965e838a96..3ca5c95695e4 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1393,8 +1393,6 @@ fn transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResu
         info.to_pid = node_ref.node.owner.task.pid();
         info.to_node_debug_id = node_ref.node.debug_id;
         security::binder_transaction(&self.process.cred, &node_ref.node.owner.cred)?;
-        // TODO: We need to ensure that there isn't a pending transaction in the work queue. How
-        // could this happen?
         let top = self.top_of_transaction_stack()?;
         let list_completion = DTRWrap::arc_try_new(DeliverCode::new(
             BR_TRANSACTION_COMPLETE,
@@ -1407,7 +1405,9 @@ fn transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResu
         // it with the new transaction.
         {
             let mut inner = self.inner.lock();
-            if !transaction.is_stacked_on(&inner.current_transaction) {
+            if inner.work_list.iter().any(|w| w.should_sync_wakeup())
+                || !transaction.is_stacked_on(&inner.current_transaction)
+            {
                 binder_debug!(UserError, "got new transaction with bad transaction stack");
                 return Err(EINVAL.into());
             }
-- 
2.56.0.317.g454f8302e1-goog

