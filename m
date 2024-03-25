Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1896141C79
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 17:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711388995; cv=none; b=n7NsbrqERzM01Gxv/KIP0FpesMGa+qKAPeVE+U1NBDO/c1SVYd8XUxbl4mEalLuKmK6YgCZKKTApHzavtCPA3vEV26gTgbp4f3w0FVx344gk7XRSk8sInttDSsd/LAYm+qIccRR4kLrTTm6kjHugRAbOkiPURMhqjhznRltAkz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711388995; c=relaxed/simple;
	bh=EVuWp1zGaihYsT1Hf2wJ2HU9PQ7XKXhZMB/sdA784QE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lyADWcLGmfBOHGVKtttru93MElQVs5peaR3LEY4Wjc1vmPI1xqw66oqs+ZFDS0e8qFuwatxJ+3YX1f//0Y8fznzTDJNjk/DG6FhWVr6236KBNdLPhgFt4q97UgJj09b5Ljfr1o4Ddqhb++bffVrEAawJA/JqYfyZS9Cfk8H839w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L27ScfBr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L27ScfBr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711388993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lum2Y4ltlaF+Imf4CoR5OYwHrzy4PUHZ9DV7KjS3VX8=;
	b=L27ScfBrhGtUbRP/cTwMOqCnm8P0M3ayK4AxEPE6FnKlRO9reVYvuK9hcfGSAcux0Lnor3
	8Bpo+Qgiur+PkvfJvRVnbz8bn6IZq05P6uzwVQif6jvq+Z/yre/NTPFXCcwRqaSqUUlcSY
	51MHSDavd2um57gtdVzKU4pxyVtxDl0=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-BMzWPkeeOeK0jVUy5R-Upg-1; Mon, 25 Mar 2024 13:49:51 -0400
X-MC-Unique: BMzWPkeeOeK0jVUy5R-Upg-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2d48af389acso35858551fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 10:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711388990; x=1711993790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lum2Y4ltlaF+Imf4CoR5OYwHrzy4PUHZ9DV7KjS3VX8=;
        b=hclA6mE/dd7UxMRur+hywFrYzYqZb5IPedkz+w6OI+JnOegGw+6HwArGC7w40w6mzX
         r039/zVMWu8C+lcsF4sdmZ2zL2IK2+++H2Eiv4SEnF6TFWPJ4oeZ0pJGD3S5XVtEcwNG
         n1c/lGwp4sfQnFSqFCC+gYvXdlZioZUuPITaUaeq7pnXsxbuz583ZGj4ExHcLMXz/0g5
         X1vKnNtl6lj23NvspdcdZBgnf8oyymCdglT+uu3B6jKF0Tbv/JSPy044ZHzIZU8JRzoW
         gQOHt+c4URZa1nfRkXfUJs/PtK80GEc1yzIxmy0iW4jbEcItAeXZapgR7/K18PRqp52u
         ANvg==
X-Gm-Message-State: AOJu0YyLlsNPRcOzJG+ed0ROfnq9hC15ITvXR7Gb2iONduoNYxz59j/4
	YCKApI6e36kMwTqoxNa0LG1S4yLNXmTzQ2y1FrXZalaU+DwitAgU7o0dkK4V65KUWm834tTAZ8W
	cHi9s6+p9jgzVLVA/54Kbp7T7hbNvKoMMl5QZkDevmpAbzlw/YM/QNphdxX4pF5uz
X-Received: by 2002:a05:651c:2108:b0:2d6:cd05:1890 with SMTP id a8-20020a05651c210800b002d6cd051890mr4246245ljq.0.1711388989991;
        Mon, 25 Mar 2024 10:49:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtt/fYmTQQ1pPtmdh7pY0Rm7XiHlNWFUgwVQM8q8rIhLCIJdFMIaIl9LytXACy6hFqvIHVng==
X-Received: by 2002:a05:651c:2108:b0:2d6:cd05:1890 with SMTP id a8-20020a05651c210800b002d6cd051890mr4246221ljq.0.1711388989622;
        Mon, 25 Mar 2024 10:49:49 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id r16-20020a05600c35d000b004147de73a5asm9021760wmq.24.2024.03.25.10.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:49:49 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: rust-for-linux@vger.kernel.org,
	x86@kernel.org,
	lyude@redhat.com,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	airlied@redhat.com,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 5/8] rust: add rcu abstraction
Date: Mon, 25 Mar 2024 18:49:09 +0100
Message-ID: <20240325174924.95899-6-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325174924.95899-1-dakr@redhat.com>
References: <20240325174924.95899-1-dakr@redhat.com>
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
index 1e40661a33d1..3b9ef2868c7c 100644
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
@@ -170,6 +171,20 @@ const char *rust_helper_dev_name(const struct device *dev)
 }
 EXPORT_SYMBOL_GPL(rust_helper_dev_name);
 
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
index d219ee518eff..874a45b0c168 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -11,6 +11,7 @@
 mod condvar;
 pub mod lock;
 mod locked_by;
+pub mod rcu;
 
 pub use arc::{Arc, ArcBorrow, UniqueArc};
 pub use condvar::CondVar;
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
2.44.0

