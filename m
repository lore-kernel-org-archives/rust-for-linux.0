Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417807;
	b=N0bFkG8zVP4N7t3x//sCAF8if8kHHhY9T5adoIweR7xlmbkrNd9OZQ5TjAd3xnIvphKa
	 VPRp1MRruqg6PpLlzSiGfntrI+Gr5sG9JVr8JyKGMJuoRQUKSLbL2jNTQKEUYeknl2nt0
	 XTQFdHDS6wBCrQr1cxUtmgKTdnCQ9Ib1bxlBAtfAi45byCr+vHAlJnN2qAz/DRDl3NiFX
	 t/mSEy43455boPcXJMw49CGGlfsQczpd4cvO4pCAVAE9y3QAP+R0LKJ+Gs73nT7TU3Rmh
	 P0iYjTG0rPv0dcEmRSry2cK+5rSd5Pvdt3hd238UQZ3aXCk5aUsdhHmAqk7TGAiGrsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 Message-ID:Subject:From:To:Cc:Content-Type;
	bh=KoX5MehGX3/HTOl06b+T8IaxlQjMvOZwpuFJnlEfgOU=;
	b=vpAAes0ZrNHfMFzNIvrW153R+CEyxLffp/KO7vNvD6JyjJprEfr7babQcQCzba4Lu8OV
	 467Z08fSzpMXASY/SK0e3SOgYqlAnEjXW65DMemVyO6Hd/JSJisD+3Sw5EJ6rAo95+cEl
	 Sretqj3fEF6HYEV7QyOBBERuHYHj2N+Km8llkqF3ZgdahiKCVidfKfsrHcBVHYjdD4G8f
	 1oc2eLD9hVgGHKrYrO/uXY6M4sz161ohBUixdQvNb0OXVBo3DP4JWjqzkROGsnPtCIufc
	 xvQj9o5TZNrJgSJSfEvioT1lnvYoHH2kel9BoEep0JmhurkXETqtatPfzc2q+/xAExw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JCpGGmgv;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519C6606A326
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 17:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 519C6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JCpGGmgv
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so6798105eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 09:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794417805; x=1795022605; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KoX5MehGX3/HTOl06b+T8IaxlQjMvOZwpuFJnlEfgOU=;
        b=JCpGGmgv01ROa2XJ8BaG9Ez8onxmqlSmz/hlN57D7CMPd+ZlGWwNttQ/82wcpvSSN1
         cqrjYhSMCjTe7esaGebFkfKoUYA2ZuhAqOioj1Ev3D+mWPFvhT1bJIRCb31z8wQWUQJo
         8WiNLUMSLkid5JCa8f/gi+SPo5zafc3y20vvjDnntaFM36wCfwV9wlLEyJb2cIXcbGrb
         rPOGLyuiBLx4MaXBzMtmx1ssrrHHvMEYcuX/bijygoyfBvKidh8ACptYlAjdGq5n25/L
         gFFEP1Dh87f/i9Yciy/SUZlOKWuLe9Huo0u0/dIv9ojBmBF5KHPYVmpocvARpw9k23+k
         6bKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417805; x=1795022605;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KoX5MehGX3/HTOl06b+T8IaxlQjMvOZwpuFJnlEfgOU=;
        b=efemwhcEGnKkbZdOB4DejNyj/kI/4/djY3v9/giHu8CRCBIS2X7Qd5CfXdcOwAo3nu
         EcSbz7+td2fxwCo/rF/bJWBy6pLtDDLiBm6G57IylMbwfFG1rOJhQ2/Ze5AUKfR4Jbun
         NYfuCmqs04mbU8qQVAFHn53EHEh60Mx38J0Lubv6FVFFBLE16amsDNI1VQhaNbRt4Ycc
         vSm37bPtZFCA+VsYa1fH+/cNYLXx/KtSqNvu65C9Uk4K9BZEH4WqKCxrjzwtYDNXDLln
         BMPYWwnqcrhb9LkBXs9BhHnXaL4A6+SsLQi6uVCBmI+VFKPTOzKl0Dw7c3zOfvHw/yci
         yzbQ==
X-Forwarded-Encrypted: i=1; AL+hErEfLbFGYRpqC6YUEhgZ1QJpgjus4b2dRmV9Iy6YD1cZsF7nW7HoRNiSuJjCY5+bvnxwul7/KbMpmRzpaqKUOg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Gzzw73Ks8p/Cxe8YRH11wlnGLxwavJAmuQJIUwhqlogisMJa3
	bPDURKwAvddkD6ThRK9EkZqWPGAu4WjJw0PiS1p6pSrCsGC95N1vE8sd3o0bI+yBEZMGdaSZ6QB
	caWOJcpHYafARj1jYvtOHYhPX4ZDHIA==
X-Received: from dycam1.prod.google.com ([2002:a05:7300:fc01:b0:36a:209:32b])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:62dc:b0:33b:c24c:d31c with SMTP id 5a478bee46e88-37685c7aa0amr3301877eec.7.1794417804955;
 Wed, 11 Nov 2026 09:23:24 -0800 (PST)
Date: Wed, 11 Nov 2026 17:23:24 GMT
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Message-ID: <18e70d7c82c722e3.3137322e32332e3235332e313736.191fb9.0000sendgmr@google.com>
Subject: [PATCH v3 1/2] rust_binder: reject sync transaction with pending sync work
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
synchronous transactions with EINVAL in Thread::top_of_transaction_stack
when inner.work_list contains any item where
DeliverToRead::should_sync_wakeup() is true. Checking
should_sync_wakeup() in top_of_transaction_stack() fails fast before
Transaction::new() allocates the target buffer or translates flat
binder objects, and ignores non-transaction work items in
inner.work_list.

Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Fixes: 8eb05e8e47f1 ("rust_binder: add TF_DEFER_COMPLETE flag for avoiding userspace roundtrip")
Cc: stable@vger.kernel.org
Reviewed-by: Carlos Llamas <cmllamas@google.com>
Signed-off-by: Chris Wiseman <chriswiseman@google.com>
---
v2 -> v3:
  - No changes.

v1 -> v2:
  - Move the inner.work_list should_sync_wakeup() check into
    Thread::top_of_transaction_stack() so it fails before
    Transaction::new() runs (Carlos Llamas).

 drivers/android/binder/thread.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index f5965e838a96..763f0646a1e9 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1268,6 +1268,10 @@ fn is_current_transaction(&self, transaction: &DArc<Transaction>) -> bool {
     /// [`None`] if the thread is not currently participating in a transaction stack.
     fn top_of_transaction_stack(&self) -> Result<Option<DArc<Transaction>>> {
         let inner = self.inner.lock();
+        if inner.work_list.iter().any(|w| w.should_sync_wakeup()) {
+            pr_warn_ratelimited!("got new transaction with bad transaction stack\n");
+            return Err(EINVAL);
+        }
         if let Some(cur) = &inner.current_transaction {
             if core::ptr::eq(self, cur.from.as_ref()) {
                 pr_warn_ratelimited!("got new transaction with bad transaction stack\n");
@@ -1393,8 +1397,6 @@ fn transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResu
         info.to_pid = node_ref.node.owner.task.pid();
         info.to_node_debug_id = node_ref.node.debug_id;
         security::binder_transaction(&self.process.cred, &node_ref.node.owner.cred)?;
-        // TODO: We need to ensure that there isn't a pending transaction in the work queue. How
-        // could this happen?
         let top = self.top_of_transaction_stack()?;
         let list_completion = DTRWrap::arc_try_new(DeliverCode::new(
             BR_TRANSACTION_COMPLETE,
-- 
2.47.0

