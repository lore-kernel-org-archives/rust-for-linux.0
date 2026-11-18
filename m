Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021808;
	b=wznYJvjb8nvUaYsF0oiVIE0g5d0YVh4JW7ZHw0XFLOLt+VwtLJlxcrGWAlN19SXYUOhh
	 1OeT4yh3mQtaYiVqLRDyQfUMn2PvOiTz5pX4ID8RVOGdNCxZ3DGTRdJsW2KRY70IP/2zW
	 cIbM32UKW1EXo9R3qGW6FbEGHDAQNZWuDUOi3a4vJU7CYC81MrCQ9jPIM7ES//7Z2BXXo
	 XPTbmIepYD4p2wYoD1ml8uessSLmZ8xvXQ9TjsawiVdcdx5t7UlM+kmgM9qYYtTsHXWJf
	 5zr3Ru49xpGN4IzBb0c/+OhVN+f/mR9ed5Gi/cl7348K/TTPYPEq9S4g8yqxoIMvTtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=upxsZjZd23/rE94pnRNu7XdEGLc2MTF7owyJv89u1r0=;
	b=Ma6TQ6y/rrStvcNu+/yx+gM5S4a2UBYTHSh4GqbhDpibP7exr9+09wc5LjcHYkX5sxRC
	 Zsi9XbNnE+HR04BUdvyYzDnNJkhUVaOvejLKSpOHBUikeJ3AoM2qM3FDsSVA4wzi6ipde
	 MAzSvWrfK1NIRP6rkHVmAZFQomtD87bkUWdUdMrUZfkOUM2K+Ygrq5/tnEjWfOsmxSpVY
	 NjOBP9ZOCqN4jFiQmVIxXMC3t+FaogOMwkgQGo5Kv0lO9X5F5D9Qw1r13MPrOtMlJFwm3
	 2610XQpV39tPrf/IWbIvVKNsVTEom2HICCyBBiKMJ6jNLuJ1sRZ6vbk9itARFpwYJEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E7BFRAzH;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085C560A2623
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 17:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 085C560A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E7BFRAzH
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso9673415e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 09:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795021806; x=1795626606; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upxsZjZd23/rE94pnRNu7XdEGLc2MTF7owyJv89u1r0=;
        b=E7BFRAzHwOu8MPdDKyvAsqHvgNd5UTFf3H+TKU7c/gSlCGgN/HUGtjJ3kwlwEEG087
         VoFwrs5R37nkI6Bg90E8/oz/tr8l5ZhL9IJFIpGi3BGsx7P6YH5jQBBiBCiDPn4pnhFs
         kapdXD2Iek4cq5Fj9SeXy2IDys87M63CZ8HuMSV9l0B6zy1lmk9lkgjrdMAACnHIEobA
         XPh9NtKCDyfDF/O3wnrY3OCCkrxZKZzFCC/uivkab7QR5Fa/objxqJedHIw8mNixhQuP
         xr5ol2mbRioxmNokYSN9UTnFED8asM/wYeC0ffjeTquk40IRywCGodTdGRmpsK0yZIlv
         QbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021806; x=1795626606;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=upxsZjZd23/rE94pnRNu7XdEGLc2MTF7owyJv89u1r0=;
        b=YSyWq1K6RVdR0g4y/kLG5NcjhobWaTzTF/ZkXrgxK/uR7/5OS85O7jlCS3wPyH9lj9
         F0JgGJFadNaXwL0cwoqP3YLff8a6nYrg2qcJIdwVm2ycJ5zYd8L6NjQv38UmQOJ7dpdy
         ERXd60Z9KXZgKgI/rUUrL0atNKp3BCWYuQxxd1e/3HyGtNiPCWwJjTTLvdofbAifkVVM
         m7v5WE7OTbUS8LAtnxXwz4Vuroi37y0d5SKhQDFw3yGZayYUzopRr3wLYTuQRKZX9hj/
         JMj58ddUdSGqSOPeHhZIHjimSP5SCrTnLV60hBsqaitktWecy8L28p3ixCkLOMoy3a0I
         Ltfw==
X-Forwarded-Encrypted: i=1; AL+hErE1vHXOKPMJT6ry9MKQCb2hSlCEcxg+ulxvAGSt1KO2gX0xx02/oZ2IegGpEgm8lkUywEyNlyTcEdHWvQBHDg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ReEtPMitcwITzkoE4rQqPz70f9P08b+PLjYOy4R07zh72yOc1
	v/V8pFuUpqVxECwMpV/+r8Wg74XBHWBvB2m15mj7c5g9nyU6JNNeQZS2fx8abn/exQcRJBE+vJ2
	YfnXd3eCpKTUmUzLGqw==
X-Received: from wmbdr23.prod.google.com ([2002:a05:600c:6097:b0:4a2:8b4:78e1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e11:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb7d578be5mr70523065e9.0.1795021805907;
 Wed, 18 Nov 2026 09:10:05 -0800 (PST)
Date: Wed, 18 Nov 2026 17:09:52 +0000
In-Reply-To: <20261118-ordered-wq-cancel-v1-0-916e01f9affe@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118-ordered-wq-cancel-v1-0-916e01f9affe@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4847; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Xu/sW3b3m/uzBSmDGW/8Hbncj3Ai/sXo4vu+FkRqaDo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/dvox4g8vhDKk566WX3T16iHQaAmZHkBk//92
 M3vG/2KvN2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCav3b6AAKCRAEWL7uWMY5
 Rl1iEACFig3wS7IisPl6v58G8IIV6kpnKlfzz4ioHVi7mJSEZEqn1rcY+49YkZeNgku1WTXkS0N
 qn0/Jp+ekIQWGwpD9dWHZneJxYl2pR5sRE4fas5iZzNyEVcLFK5COJp+7agxaFupYZfcJm/F+tE
 QfkyqYS0BfgX6SaDNcL6TMuj7CWtxvsssd+t8pLqZvTXHs7tq5TUMXQluBNK0zETysWX1R07xck
 8ggnMly7tyvb5670Y68i2f2xUhwBGABAHgwEmWwflYO2AWE10wpOcOlkhxHJtO0ouD5kgSDgNmO
 RMyzC+Nq6rW79km+XtWQtUOtYLXYEAnhllPwYDyuz6W7J5NXbz6DvqRuXjPugBix4I+ucx8kV5m
 glJxGZzi+Lg7a27aRAAMXtjfamDL3rS2lS8ejxH06zB6MDWDRe3i177OWw3FtnRCUCU92yVmBub
 HaWw/jLpnjOEYo2e7NO08NpPEUcWBK7wiStRDQk3YdxdiJiPcVH2y8oJk8l2LNnkUJcyb6VfLqc
 JST6/COHadrQD61G8iVlrZd8mYeZd2tF5z/nwHbLZ1Y/U9Eff2Ng2hCQAJnGF9E5aDIFa8yLu6p
 AHZmZBvMT3PyHhGYTqn/GbK8uFQSlCe2hlxBK+XSqc8KxRKySZrUUh7iRQ6J3Yo9O64wuCuYArE 2FDvU6bcoKF3n1A==
X-Mailer: b4 0.14.3
Message-ID: <20261118-ordered-wq-cancel-v1-2-916e01f9affe@google.com>
Subject: [PATCH 2/2] workqueue: doc: clarify cancel_work_sync()
 cross-workqueue behavior
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The kernel-doc comment for cancel_work_sync() claims that it waits for
@work to finish even if @work "migrates to another workqueue". However,
this has not been true since commit 606a5020b9bd ("workqueue: gut
flush[_delayed]_work_sync()") replaced the all-pools scan with
start_flush_work(). Consider the following scenario:

1. @work starts executing on wq A (pool A).
2. While @work is still executing on pool A, it is queued onto a
   different workqueue wq B (backed by pool B). Because __queue_work()
   only redirects to last_pool when re-queueing onto the same workqueue,
   @work is queued on pool B (where it may even start executing
   concurrently with pool A) and work->data is overwritten with wq B's
   pwq / pool B.
3. flush_work(), cancel_work_sync(), or disable_work_sync() is called on
   @work.
4. start_flush_work() only inspects the single pool recorded in
   work->data (pool B) and returns once @work is no longer pending or
   executing on pool B, while @work is still executing on pool A.

Queueing an in-flight work item onto another workqueue already violates
the documented non-reentrance conditions in
Documentation/core-api/workqueue.rst. Thus, update the kernel-doc
comments for flush_work(), cancel_work_sync(), and disable_work_sync()
along with workqueue.rst to stop claiming that cross-workqueue migration
is supported, and link directly to the non-reentrance conditions
section.

Fixes: 606a5020b9bd ("workqueue: gut flush[_delayed]_work_sync()")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 Documentation/core-api/workqueue.rst |  7 ++++++-
 kernel/workqueue.c                   | 17 ++++++++++++-----
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
index bb770f556568..007dee698ede 100644
--- a/Documentation/core-api/workqueue.rst
+++ b/Documentation/core-api/workqueue.rst
@@ -769,6 +769,8 @@ The work item's function should be trivially visible in the stack
 trace.
 
 
+.. _workqueue_non_reentrance:
+
 Non-reentrance Conditions
 =========================
 
@@ -784,7 +786,10 @@ executed by at most one worker system-wide at any given time.
 
 Note that requeuing the work item (to the same queue) in the self function
 doesn't break these conditions, so it's safe to do. Otherwise, caution is
-required when breaking the conditions inside a work function.
+required when breaking the conditions inside a work function; in particular,
+flush_work(), cancel_work_sync(), and disable_work_sync() only track the last
+queued instance and may return while an earlier execution on another workqueue
+is still running.
 
 
 Kernel Inline Documentations Reference
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index d7acedfb8b27..5c7018ea0b48 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -4634,7 +4634,9 @@ static bool __flush_work(struct work_struct *work, bool from_cancel)
  * @work: the work to flush
  *
  * Wait until @work has finished execution.  @work is guaranteed to be idle
- * on return if it hasn't been requeued since flush started.
+ * on return if it hasn't been requeued since flush started and the
+ * :ref:`non-reentrance conditions <workqueue_non_reentrance>` in
+ * Documentation/core-api/workqueue.rst hold.
  *
  * Return:
  * %true if flush_work() waited for the work to finish execution,
@@ -4764,9 +4766,14 @@ EXPORT_SYMBOL(cancel_work);
  * @work: the work to cancel
  *
  * Cancel @work and wait for its execution to finish. This function can be used
- * even if the work re-queues itself or migrates to another workqueue. On return
- * from this function, @work is guaranteed to be not pending or executing on any
- * CPU as long as there aren't racing enqueues.
+ * even if the work re-queues itself. On return from this function, @work is
+ * guaranteed to be not pending or executing on any CPU as long as there aren't
+ * racing enqueues.
+ *
+ * Care must be taken if :ref:`the non-reentrance conditions <workqueue_non_reentrance>`
+ * in Documentation/core-api/workqueue.rst are not upheld for this work item.
+ * In that case, this function only waits for execution on the last queued
+ * workqueue.
  *
  * cancel_work_sync(&delayed_work->work) must not be used for delayed_work's.
  * Use cancel_delayed_work_sync() instead.
@@ -4843,7 +4850,7 @@ EXPORT_SYMBOL_GPL(disable_work);
  * @work: work item to disable
  *
  * Similar to disable_work() but also wait for @work to finish if currently
- * executing.
+ * executing; see cancel_work_sync().
  *
  * Must be called from a sleepable context if @work was last queued on a non-BH
  * workqueue. Can also be called from non-hardirq atomic contexts including BH

-- 
2.56.1.703.gf848ed807c-goog

