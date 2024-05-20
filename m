Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816641386D7
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 17:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716226030; cv=none; b=duao/z2GZMuXwOxYyxrgzlLScpk+8EmqQzqbpxuzyHZ8w1nn0Y26kYSCV8j0E21Frf3GcgiljVevmkWbKZNNj+Ij6OD9tqdgmKkDHKh/YY8oRQOu68tO//qjizhIgFg8uuVACJp6N9F/+rThwHisxeGssDFHroage+JBYrK+b2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716226030; c=relaxed/simple;
	bh=wZpumSaAgofzk39YfBsp32v4+ebHuETq3cEP9jzCvOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cmBJ+6BsBCfF++IUlE5bF5D0wAQz9DvABWsRNSyxPDSBkSB0amjCRBXEWqW5NzJo7S9riW64tHOs19YY7CfzvZtBXdZWCqVfwlQ01JzV3nEEBP80AjzXzZHUyRfWmFr10UHEWLLKIny4sc8ANt+OLONebvMVqPExMVfZGesNSRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZdcgrX0g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZdcgrX0g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716226027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5CImq0b4mEhq1pg3qJ1z+g35+FLQKy2u4BGJkZOUedY=;
	b=ZdcgrX0gwASRj/Xzs5ogmuSIi4iI3hLcbJJZNJyo7ui/jjnMyFGSMJdgqolPKoAB3PEeAd
	BED9MhKMV7mxxJ0EMQoD39epNTCqFihQeSkzPi60R0k0Ufx24KXc2PGkzTqJpj4ZxjjgZY
	m1UcsLN8c7V9sYn/DXueWawj4HdRtMk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-BIqiU0RDPquzkgy1JVmqjA-1; Mon, 20 May 2024 13:27:06 -0400
X-MC-Unique: BIqiU0RDPquzkgy1JVmqjA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42015260835so39352515e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 10:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716226025; x=1716830825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CImq0b4mEhq1pg3qJ1z+g35+FLQKy2u4BGJkZOUedY=;
        b=oj/8p0o5eGCLC9nYs8eeATBai2ZBZQHqfeEii63IvF71XYjcJdZiqttAaprK+ePT/B
         rQ8zVdVhCYlqcQSf8Rn3wKlIVTmjBIUPpq3BtvQuj9VSqw0v2zIRhvlJTzYzL9lzVGZ9
         HZitpFrWEoZiTAlRSHQReZCvlbglfu48C6ET5GGfS3uQkaro4zuGG6oSzPI66rg8j3TT
         3/Wdk9CrzwI0udJjmD/+sUwD7lb3VVtgZREtQUwzkvdWb4tWaLUTLfC764gTCTgVQpEt
         N68FWLJSfgdTSvTZlyxpC3TATp3rYklgc/7c2d34/pWunUwvpgsAEaNqhiwlntcaDuYW
         G/zg==
X-Gm-Message-State: AOJu0YyBgwKNgI0TGuJ7IAgKXWuGvqARXAogrAJQz4w/a7S7tdxWU6NK
	9VwBxX1ll8jkE5Q7i+L4hw5H+2duk0qvHTrbxU0M8z+vsRSFPpROVSPr06VSxzzHmZ6EgWiJR+C
	V/8+kAMtsNDGwQu5eAg3QGjtDwV+OQLGy1IQD0cj/0hNVa/5DyUKMpfUo7cgBWGQ7
X-Received: by 2002:a05:600c:4f93:b0:41b:e416:43d3 with SMTP id 5b1f17b1804b1-41fead6a51dmr216213125e9.35.1716226025164;
        Mon, 20 May 2024 10:27:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/bF4bRoSUln2A7cqDJukXexNcMjambbxJHYjat/XzwST1JPeAlpPwPz2OHv0SZFXR65NeCA==
X-Received: by 2002:a05:600c:4f93:b0:41b:e416:43d3 with SMTP id 5b1f17b1804b1-41fead6a51dmr216212835e9.35.1716226024359;
        Mon, 20 May 2024 10:27:04 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42028c7730dsm189604005e9.25.2024.05.20.10.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 10:27:03 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	bhelgaas@google.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	airlied@gmail.com,
	fujita.tomonori@gmail.com,
	lina@asahilina.net,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH 03/11] rust: add rcu abstraction
Date: Mon, 20 May 2024 19:25:40 +0200
Message-ID: <20240520172554.182094-4-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520172554.182094-1-dakr@redhat.com>
References: <20240520172554.182094-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Wedson Almeida Filho <wedsonaf@gmail.com>

Add a simple abstraction to guard critical code sections with an rcu
read lock.

Co-developed-by: Andreas Hindborg <a.hindborg@samsung.com>
Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/helpers.c          | 15 ++++++++++++
 rust/kernel/sync.rs     |  1 +
 rust/kernel/sync/rcu.rs | 52 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)
 create mode 100644 rust/kernel/sync/rcu.rs

diff --git a/rust/helpers.c b/rust/helpers.c
index f9d2db1d1f33..1d3e800140fc 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -27,6 +27,7 @@
 #include <linux/err.h>
 #include <linux/errname.h>
 #include <linux/mutex.h>
+#include <linux/rcupdate.h>
 #include <linux/refcount.h>
 #include <linux/sched/signal.h>
 #include <linux/spinlock.h>
@@ -158,6 +159,20 @@ void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
 }
 EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);
 
+/* rcu */
+void rust_helper_rcu_read_lock(void)
+{
+	rcu_read_lock();
+}
+EXPORT_SYMBOL_GPL(rust_helper_rcu_read_lock);
+
+void rust_helper_rcu_read_unlock(void)
+{
+	rcu_read_unlock();
+}
+EXPORT_SYMBOL_GPL(rust_helper_rcu_read_unlock);
+/* end rcu */
+
 /*
  * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we can
  * use it in contexts where Rust expects a `usize` like slice (array) indices.
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 0ab20975a3b5..1806767359fe 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -11,6 +11,7 @@
 mod condvar;
 pub mod lock;
 mod locked_by;
+pub mod rcu;
 
 pub use arc::{Arc, ArcBorrow, UniqueArc};
 pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
diff --git a/rust/kernel/sync/rcu.rs b/rust/kernel/sync/rcu.rs
new file mode 100644
index 000000000000..1a1c8ea49359
--- /dev/null
+++ b/rust/kernel/sync/rcu.rs
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! RCU support.
+//!
+//! C header: [`include/linux/rcupdate.h`](../../../../include/linux/rcupdate.h)
+
+use crate::bindings;
+use core::marker::PhantomData;
+
+/// Evidence that the RCU read side lock is held on the current thread/CPU.
+///
+/// The type is explicitly not `Send` because this property is per-thread/CPU.
+///
+/// # Invariants
+///
+/// The RCU read side lock is actually held while instances of this guard exist.
+pub struct Guard {
+    _not_send: PhantomData<*mut ()>,
+}
+
+impl Guard {
+    /// Acquires the RCU read side lock and returns a guard.
+    pub fn new() -> Self {
+        // SAFETY: An FFI call with no additional requirements.
+        unsafe { bindings::rcu_read_lock() };
+        // INVARIANT: The RCU read side lock was just acquired above.
+        Self {
+            _not_send: PhantomData,
+        }
+    }
+
+    /// Explicitly releases the RCU read side lock.
+    pub fn unlock(self) {}
+}
+
+impl Default for Guard {
+    fn default() -> Self {
+        Self::new()
+    }
+}
+
+impl Drop for Guard {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariants, the rcu read side is locked, so it is ok to unlock it.
+        unsafe { bindings::rcu_read_unlock() };
+    }
+}
+
+/// Acquires the RCU read side lock.
+pub fn read_lock() -> Guard {
+    Guard::new()
+}
-- 
2.45.1

