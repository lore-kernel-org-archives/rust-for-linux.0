Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6041179958
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 23:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718754063; cv=none; b=LfW/R6ofYjklZ9ASvg5J3Wn9+emMYWzY5PQ+cFnuTxRetpvzMUn181Nsm24b3YePjJAiM+za/9OuKjoCFPj12ZbP29uHx+CDVuUCUWnMhz3Pcv4TVgdLHcK61rtfOkpY8TpfnzmjDoinkOHW7y07MW/N+6GAO0cL9pfhFLEg4xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718754063; c=relaxed/simple;
	bh=8xOJgvmgRDc6UuoCbIh+OUfNqsEyrLgJDPK4zjjIFpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sVEI6O/TuS6pm8H/dvjhIaDykGRdxKiGEvxF6Q+AxUEqc05+KO+DJHAEJTxKcpCteAATTi78HLjxZFfLXOVc9tkvb6/WjlllLAiA7lgcU0MnOk0QCBKcQ3HxTrAhmx6KF9TGoOTwoGnLWYEe7Ng6flXv1aIUh2P1JJ0KU8u402Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gtA18Ap4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gtA18Ap4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718754061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jprPy2R3mhSfiLsY0D8Ey4z3vVsEHFqMm7nzo3vj3ew=;
	b=gtA18Ap4Ke3uRlRx2eBFugXVMpPoMpGdo+SSRKEsdnOYke/64GC2mwvNf7KuRauOetG05P
	TcWn6rLvfeWCdk4GyixpIEnhfrzh0MD+VGSUanSdwK2AkRXshmFyH1RmAQOslLBOQIFaSH
	N2oxrXobq1D7gM7JiqWCWx8b0pTDgpY=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-QMEbxJjcOnixWk60u-uvxw-1; Tue, 18 Jun 2024 19:40:59 -0400
X-MC-Unique: QMEbxJjcOnixWk60u-uvxw-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52c983f4285so4480140e87.2
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 16:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718754058; x=1719358858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jprPy2R3mhSfiLsY0D8Ey4z3vVsEHFqMm7nzo3vj3ew=;
        b=FXfnw2bwZ5O1j2IIV7zYgxSBt0UucbQSjAx8qj7w7K3yaqg5yO47kRXubSQA5vO3K0
         Mitso9Dlni4kHxGPtuvaek03Zu2nKn0ljsr+6FgwGQ5bMLPbhS0Z/qKIDX3LuSsaknp+
         ThzfS1fweZrcUX0OdK810unHLcFIAoMzlRHDZ2cKsEh9QNFksYcDNOlQ5akb6k95JSYc
         UYSjgUQZx1NLGQOZYjq0qrNC7pC/pM/eSusZBesga+3gEmPA+gvKKBtHzPG5K0c5rVND
         V29YJ3FiaY7O0/19Fb8dZNCZJmfNAekR5crzBSpttbaasT7GxIyZguhHCI8SKb2cxuw+
         momw==
X-Gm-Message-State: AOJu0YycqqHttKDQ7Rw3kLGHS2KJHiG4h922H0Xu+l/SWB77MrKGQNre
	Aa/5Ngd9yNOIZHElydIr/rgT1h4AV3F9ahDDmfmoIrKyDc53J1yLRfcxYu/7wKDB+bu4/Vl9P68
	WzCdtAswPjygIUhv/nwHud13btP7XNgXAAxQuj5lAp6w52SuPMHe9MtNQnlExlDru
X-Received: by 2002:a05:6512:3992:b0:52c:cc38:592c with SMTP id 2adb3069b0e04-52ccc385978mr111673e87.0.1718754058298;
        Tue, 18 Jun 2024 16:40:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6PRwRcXm8oRvxKpZbUxJQyrNH1GdkYsyClgqCZ2yzVNat84h8w9f3Fio+1+mz3vgR3u+6fg==
X-Received: by 2002:a05:6512:3992:b0:52c:cc38:592c with SMTP id 2adb3069b0e04-52ccc385978mr111652e87.0.1718754057790;
        Tue, 18 Jun 2024 16:40:57 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de623sm244364595e9.31.2024.06.18.16.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 16:40:57 -0700 (PDT)
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
	lyude@redhat.com,
	robh@kernel.org,
	daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2 04/10] rust: add rcu abstraction
Date: Wed, 19 Jun 2024 01:39:50 +0200
Message-ID: <20240618234025.15036-5-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240618234025.15036-1-dakr@redhat.com>
References: <20240618234025.15036-1-dakr@redhat.com>
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
index 0e02b2c64c72..0ce40ccb978b 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -27,6 +27,7 @@
 #include <linux/err.h>
 #include <linux/errname.h>
 #include <linux/mutex.h>
+#include <linux/rcupdate.h>
 #include <linux/refcount.h>
 #include <linux/sched/signal.h>
 #include <linux/slab.h>
@@ -166,6 +167,20 @@ rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
 }
 EXPORT_SYMBOL_GPL(rust_helper_krealloc);
 
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
index 000000000000..5a35495f69a4
--- /dev/null
+++ b/rust/kernel/sync/rcu.rs
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! RCU support.
+//!
+//! C header: [`include/linux/rcupdate.h`](srctree/include/linux/rcupdate.h)
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

