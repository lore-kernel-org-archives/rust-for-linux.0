Received: from forward204a.mail.yandex.net (forward204a.mail.yandex.net [178.154.239.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19D4367F35;
	Fri, 13 Mar 2026 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773393854; cv=none; b=ZnvAOM59CCnI1DjnP5ri57kAGaJpIkSxl+atooISSy/r7t1R5FeGtwsrclcMOYXLQZ2yQDUQC0kWQomrZRNszDs2y63EDjo00uEuN9WRwCHrY52mfqjxCZiGrvzn5qQQXwC7GfjcQZZBW0t55U2I7XOgspyuZ2pNtRxtibiG9Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773393854; c=relaxed/simple;
	bh=l2zVABx0ukHupTK6cqX0MYpdDRqgh2ztr5w6jsiRguQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NACQLTu5nt0CYqfpPWYcTbkop5JwIlNkwZU65PHTdo7Ct5lKKTLb/9lZGBuuhDsGKV8mg2tlPQkaB2ZP5inI+Y4RHWYTK+IGRrSJK0mZ1XLMxvFG8l3095oO94XNxAMLxwxVe+Xw6wx5UsNzdOh7qKUD3hxSLrx2tLmMj0F0Ar8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=gHaIEutB; arc=none smtp.client-ip=178.154.239.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="gHaIEutB"
Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d102])
	by forward204a.mail.yandex.net (Yandex) with ESMTPS id D79658370F;
	Fri, 13 Mar 2026 12:18:00 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:571a:0:640:23e3:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id 2EFB8C00BD;
	Fri, 13 Mar 2026 12:17:53 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 3HEusrTGkmI0-BP8TrAT5;
	Fri, 13 Mar 2026 12:17:52 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1773393472;
	bh=tdqZdIhYVneZTBKoqZpd0WXEPrwKrA6bsUPN0bxfmEQ=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=gHaIEutBFRdy7RkBqeg/y8j/aSGIwNuscD3rYoELHt5ldb05h+76hDxXJTQC/Q5Q6
	 5Zjw9znOQCww5bC5jc/oApxZlCEoVxLwNWbBXY5ktMHfH2Rmd4uljXqO4z20Tfngdf
	 ccrmyZrW7AgYRDQwy3uVpDCPhNAw5xfploqGEkZo=
Authentication-Results: mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: linux-kernel@vger.kernel.org
Cc: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v1 RESEND 3/4] rust: add ordered workqueue wrapper
Date: Fri, 13 Mar 2026 12:16:43 +0300
Message-ID: <20260313091646.16938-4-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260313091646.16938-1-work@onurozkan.dev>
References: <20260313091646.16938-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add an owned OrderedQueue wrapper for alloc_ordered_workqueue() and
destroy_workqueue().

This gives Rust drivers a simple way to create and own an ordered
workqueue with automatic cleanup in Drop.

Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/helpers/workqueue.c |  6 +++++
 rust/kernel/workqueue.rs | 47 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
index ce1c3a5b2150..7cd3b000a5b6 100644
--- a/rust/helpers/workqueue.c
+++ b/rust/helpers/workqueue.c
@@ -14,3 +14,9 @@ __rust_helper void rust_helper_init_work_with_key(struct work_struct *work,
 	INIT_LIST_HEAD(&work->entry);
 	work->func = func;
 }
+
+__rust_helper struct workqueue_struct *
+rust_helper_alloc_ordered_workqueue(const char *name, unsigned int flags)
+{
+	return alloc_ordered_workqueue("%s", flags, name);
+}
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 6acc7b5ba31c..d5aa61a5ef93 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -195,6 +195,7 @@
     types::Opaque,
 };
 use core::marker::PhantomData;
+use core::ptr::NonNull;
 
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
 #[macro_export]
@@ -346,6 +347,52 @@ pub fn try_spawn<T: 'static + Send + FnOnce()>(
     }
 }
 
+/// A kernel work queue that allocates and owns an ordered `workqueue_struct`.
+///
+/// Unlike [`Queue`], [`OrderedQueue`] takes ownership of the underlying C
+/// workqueue and automatically destroys it when dropped.
+pub struct OrderedQueue(NonNull<bindings::workqueue_struct>);
+
+// SAFETY: Workqueue objects are thread-safe to share and use concurrently.
+unsafe impl Send for OrderedQueue {}
+// SAFETY: Workqueue objects are thread-safe to share and use concurrently.
+unsafe impl Sync for OrderedQueue {}
+
+impl OrderedQueue {
+    /// Allocates an ordered workqueue.
+    ///
+    /// It is equivalent to C's `alloc_ordered_workqueue()`.
+    pub fn new(name: &'static CStr, flags: u32) -> Result<Self> {
+        // SAFETY: `name` is a `&'static CStr`, guaranteeing a valid, null-terminated C
+        // string pointer for the duration of this call.
+        let ptr = unsafe { bindings::alloc_ordered_workqueue(name.as_char_ptr(), flags) };
+        let ptr = NonNull::new(ptr).ok_or(ENOMEM)?;
+        Ok(Self(ptr))
+    }
+
+    /// Enqueues a work item.
+    ///
+    /// This may fail if the work item is already enqueued in a workqueue.
+    ///
+    /// The work item will be submitted using `WORK_CPU_UNBOUND`.
+    pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
+    where
+        W: RawWorkItem<ID> + Send + 'static,
+    {
+        // SAFETY: `self.0` is valid while `self` is alive.
+        unsafe { Queue::from_raw(self.0.as_ptr()) }.enqueue(w)
+    }
+}
+
+impl Drop for OrderedQueue {
+    fn drop(&mut self) {
+        // SAFETY:
+        // - Pointer comes from `alloc_ordered_workqueue()` and is owned by `self`.
+        // - `OrderedQueue` does not expose delayed scheduling API.
+        unsafe { bindings::destroy_workqueue(self.0.as_ptr()) };
+    }
+}
+
 /// A helper type used in [`try_spawn`].
 ///
 /// [`try_spawn`]: Queue::try_spawn
-- 
2.51.2

