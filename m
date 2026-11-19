Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097577;
	b=BZ3W3w97mYmlrmxpwFsEgUVGLx8dJUq5uiaoQY9lgDQft7tj3Nf/iEmOOZVvrUtKZDN4
	 iuWlYBaVpYi602WN72IoJhigioS+wMesQ6URTTG4uvFpsYr/9G6USs9wpmZJhkJ2M88WS
	 M0y3mwH1GQkq17LmuawgAALX53az6lx6GjXGjfie7L0WtkL9Hkot+X9mnRtMMBbJq8a4J
	 p1Jry+/AkdEKZmBETGeGK/IdUMb20wAy/SYuB7rW7Skfv6rqcwDEKtXpOtvUeh9yL+9nr
	 9HT5eBL43RPLqz/sj7abGjoFiLlS8OM7qJ1WDYMeThizj5v+tTP8LokdIvrE8rbEuaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=J4S66RXJTePpoG4ZrW1OWJwvFHsJXZkm4BOys2wDNFA=;
	b=XZbG4NMa5LtP0LKdwmtTJRfz9e7oETcc0ykU3hC3R9vguR40fptMbg9PpTYJmlqAK7ED
	 6dk+7hEcLx7L3v8tkfdElFrH6/YjxqpzRdIZgd4/v1C5Udu8BaCXcSw/D5Lr0XTkiKBZ6
	 nKvCs2AL0D+f4k3C3CFcyvKdqJZ2UZN4T5CFjwZDJxGcE73GqOrbXdTMWZdi8+gCtiA7R
	 Soo3l7aDyi2msS9/sYkaV7DjI4Y+YzHhmoOvZ4cjhb1DcyVyaAct7K2svctWKplRJmaDj
	 4vn4CCJyEsJkcurE4VxLfPIL/qYdu2VcCPoIWyd/+W3vb1Nc4Sohp1GjwIGyv1D167A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qI5Qn7EL;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88567606A330
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 14:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88567606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qI5Qn7EL
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4bb68d624baso21266835e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 06:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795097576; x=1795702376; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4S66RXJTePpoG4ZrW1OWJwvFHsJXZkm4BOys2wDNFA=;
        b=qI5Qn7ELrDvi1m6/s6gA/RICub041fGPaYRFc1c+OzZW8eAcPv9q73gwlARjRUhBOb
         WEOIb4CW1Su5+pzUQjProe+xPcb0gEEOWWOR83OdsyV6edQMvHcKj/Un7fAIEcxPOtIJ
         lxqeRdLhgWCmwRU7+BBbMuraOy7/PYp3FVtlIRJT04QE8oMQ/ZNF+sbK3PFm+psh6MZ8
         ERLc41inThcml2LxnbAD3XjJu7ELY5+8uuS2iXMGtnS7HJNINXsNOK39zOV/rl9FvHiW
         wFqD/N82FjvqwIbs3pHulgbTD8bdDNIv06I1C2WuIMJIMJfNYNN9PDcpgNy9/p1oTC0Z
         io/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097576; x=1795702376;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4S66RXJTePpoG4ZrW1OWJwvFHsJXZkm4BOys2wDNFA=;
        b=FJGGQs8ZRnnSfWpAls/MwzW2f92E9umNnkwyB8KLetH2jQYcLSMxQUmUE7T80JUXm1
         aRWqCO+NtA4lI9AEdTg5CTapyOlMT1xyUSIwQuPK94+ZYC/sZEIa47zadV3aoZByS38b
         B31pyN+z09U/h7fd/h/MVEx4gF7wAW/Uw5KGkY9dJcUlhqsuh8MgNryU04ew3oGCpfSY
         WLhd5QgowP53Ipd6V5UjgBMV3Cy/QvJNayIo9nAFrmWWrDYe2uXukmubNVoeFI+45wHq
         YsC07sobymQFCFv6T+EqsPOzyQ6Anyu6Z1tT13D+n3R/+ECoDVJDK1k6xQZ19lLgFiMd
         vTpg==
X-Forwarded-Encrypted: i=1; AL+hErGQHLt1ozWBqkkbcJ3WD/ePt7LN5zKDqSwP+cCyX15TVqSkVNlz0Sr1y+UbyZC5UzS+AL5ynJigKfi2bk5Hjg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9nQ+hQN/P4UETukeKbGsvx2k2JChP0f6xCdoS16DakJa9SXm0u
	ue8sANnf+pgyBFQt4RQ+5SEWz5GmHcxjNqkkX/XzeR/Gq9dJ2ChZY4jtEPHO78Xx6fqFumUSlVc
	rWrQR/WGcfBSNUqT1fQ==
X-Received: from wmco9.prod.google.com ([2002:a05:600c:a309:b0:4a1:fab9:8d7f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c173:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4bb7da064e9mr120053975e9.7.1795097575446;
 Thu, 19 Nov 2026 06:12:55 -0800 (PST)
Date: Thu, 19 Nov 2026 14:12:42 +0000
In-Reply-To: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3422; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Iru6sGFXC06+A/HPpsu4Zd4jaO7RI1x+UoHopl8nDg0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/wPjSRFd3HB3yvGFmBsHpbV/WViLPTWF2GSrh
 mYVlEH87aqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCav8D4wAKCRAEWL7uWMY5
 RjB1EACizlpNqOjvX1q1jC+NW7ztjl97VqoYQxC9L6MpqlVIX+bkJv7KSbC9k53P6UUI5SYPQlW
 zq/OpzZrckpE+aNY2UHJXrDXFMEoZk9IavfKq6fm0lQ5qrtdzx+s9Av+tEGEQX45aU/WHgg/4j0
 1ATpsP2JrUnIU3rqG/6o606EzCqMue2Iuj/haFtuSNMJ1EQ8zxgRHwnnOgzPKwIJp52ECLumoLK
 ypPbNeKXtzH8Nv/BYFVVFeCacbnaX8rUBtr6Q7CYuApzrEyLQE6UOCSkR1iBEbVP1hLxEOe4awR
 i6sCQlBMr6ttu+eOEE0DZS2Q9uU7K/B3leNk2cDk+gqOjdK2ncr+7Mlx58/LrlQ9b5WdARc8+00
 EZq17ntJnUNbhNAGX6sOnwUZ9D37acS6pA4CXoafTJIKse7Oa0ZFQhoJf8gH7Q9mcDZoLFtasJJ
 NX9nhqmoL8rfGssDT94CJCKuB5iJyWXENQsasKCY8kEdV7cL1gvm0I8cylAl4XfVwWidkMjqogy
 M9ekwjzTn6z8ep52+TfGcc4rCQl2SrgnRNFg97fvVj6RgYrfRQXNJpWcHiKaIrBVzwl02Wns+fa
 6C3k+FOFfd6bcY2l3SGDIrxSQi8Mqox0Mrsvd2CCDvv7em0k5MpB7OtpUtyI7cy7viALO5jcM8h AAQpiJjXewxFOmw==
X-Mailer: b4 0.14.3
Message-ID: <20261119-rust-workqueue-v4-1-707c68994940@google.com>
Subject: [PATCH v4 1/5] rust: workqueue: support stack-allocated work items
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Pass `object_is_on_stack(work)` to `__init_work()` in
`rust_helper_init_work_with_key()` instead of taking an explicit
`onstack` parameter, and call `destroy_work_on_stack()` when `Work` is
dropped. This ensures `CONFIG_DEBUG_OBJECTS_WORK` properly tracks and
cleans up stack-allocated work items without requiring separate
constructors.

Fixes: 7324b88975c5 ("rust: workqueue: add helper for defining work_struct fields")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/workqueue.c |  9 +++++++--
 rust/kernel/workqueue.rs | 13 ++++++++++---
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
index ce1c3a5b2150..337382acfbf5 100644
--- a/rust/helpers/workqueue.c
+++ b/rust/helpers/workqueue.c
@@ -1,16 +1,21 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/sched/task_stack.h>
 #include <linux/workqueue.h>
 
 __rust_helper void rust_helper_init_work_with_key(struct work_struct *work,
 						  work_func_t func,
-						  bool onstack,
 						  const char *name,
 						  struct lock_class_key *key)
 {
-	__init_work(work, onstack);
+	__init_work(work, object_is_on_stack(work));
 	work->data = (atomic_long_t)WORK_DATA_INIT();
 	lockdep_init_map(&work->lockdep_map, name, key, 0);
 	INIT_LIST_HEAD(&work->entry);
 	work->func = func;
 }
+
+__rust_helper void rust_helper_destroy_work_on_stack(struct work_struct *work)
+{
+	destroy_work_on_stack(work);
+}
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index a872f9fffb90..6eb6c40138f2 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -481,7 +481,7 @@ pub trait WorkItem<const ID: u64 = 0> {
 /// This is a helper type used to associate a `work_struct` with the [`WorkItem`] that uses it.
 ///
 /// [`run`]: WorkItemPointer::run
-#[pin_data]
+#[pin_data(PinnedDrop)]
 #[repr(transparent)]
 pub struct Work<T: ?Sized, const ID: u64 = 0> {
     #[pin]
@@ -513,7 +513,6 @@ pub fn new(name: &'static CStr, key: Pin<&'static LockClassKey>) -> impl PinInit
                     bindings::init_work_with_key(
                         slot,
                         Some(T::Pointer::run),
-                        false,
                         name.as_char_ptr(),
                         key.as_ptr(),
                     )
@@ -539,6 +538,15 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
     }
 }
 
+#[pinned_drop]
+impl<T: ?Sized, const ID: u64> PinnedDrop for Work<T, ID> {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: `self.work.get()` points to a valid `work_struct` initialized in `Work::new`,
+        // and the work item is not currently queued because `Self` is being dropped.
+        unsafe { bindings::destroy_work_on_stack(self.work.get()) }
+    }
+}
+
 /// Declares that a type contains a [`Work<T, ID>`].
 ///
 /// The intended way of using this trait is via the [`impl_has_work!`] macro. You can use the macro
@@ -686,7 +694,6 @@ pub fn new(
                     bindings::init_work_with_key(
                         core::ptr::addr_of_mut!((*slot).work),
                         Some(T::Pointer::run),
-                        false,
                         work_name.as_char_ptr(),
                         work_key.as_ptr(),
                     )

-- 
2.56.1.708.g77570a6a1d-goog

