Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C3C23AE95
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 22:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755644028; cv=none; b=aN95mupLm8LU/AP2dsdhQkQ9rTQoaEObTndeVy3FzJaIYSK50Jx2LckqPy0juX6v/fci5JSXGeERuG+qwXiTx38eyToyDyAx24IjUIlBDXgPB1Yn6lC0l0gNcbktR4veXpbW1kWnpQtax5cyXnefB9rocMqa7vDg6yvwNK6+co8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755644028; c=relaxed/simple;
	bh=zm/+KjQEPIp+EtrHdVvycc6RQsnywHbzucuPtQjImAY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iue7hHx0VE7bsPI48KVQEn5uV3XAv5BB3GVooNJ+1UGg0lYi6z2dQyWra1Q4FJXpPEoD24dIr2Oxl48V8nOPy16iMgqKFb9mK/HQbmMOddAuao5LEdS9XeBsuK+VWDDMkIprOhbrE0ytYM1VmkJmJrUU58qpf45/Uz9z/rxoWdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XNbvYLBI; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XNbvYLBI"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-323267915ebso11752351a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 15:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755644026; x=1756248826; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s4Jzmac8xTrDRTqzeHLgtcseGNH14Ugiac3trTaCatc=;
        b=XNbvYLBIxJ2vD9bDHVCnqk3xbGKXmx6y0+HhWxzCgYxgPk4/6Dq/9qzmT5ue4DPGNJ
         bLWHMkyrrjeysrvMu670+YudraNVv3OsWo1D/E9h3SBmE31NuvrkMYSyS9Ajv/IU5wXx
         tFavwlxROACfWVCTzqoofZo//mRA6A6/Zajo20qIGk6LU6bYW9mjcpt/xSZi9JOIZ2g9
         OaywWQcnFvj/AAxYcIhwaBwsAP3CI/rFzLUCfCyJoJ76iVKETO0NFQxizlgDotmvOtLm
         T1EpWtZIsjp1ywfK1w/ZqyfEYaBzPNnZKOjIPv657klT6v6zoblajo2XB32YojPWtHK5
         4GBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755644026; x=1756248826;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4Jzmac8xTrDRTqzeHLgtcseGNH14Ugiac3trTaCatc=;
        b=svdYPgjZAj1XBSITjjGuJvyuWLOyQiHFwqewGN70PAGXscz+uULnm306VLQDWOgTZN
         WQqZkLYNGjNkYzrTIqh0KY69sQnm3DEsc/SO87HY5pdABqcZZStKZu6Hx/i4gk+Dl0Uj
         weyp7Ok7F01r2IVFNVtucsOk2HIcomZImXnmgbmL1T6QqQ1DG58AIHAynkwtAWfwH5GI
         BAynCcXfQohqaJddf/Qxn19N8Qitt+PYMfYA1FBAfK71PwT3wrZW+UJzvZNG5EqErEd9
         sDNqXVu4xb561pkuqx6Jh3gXQZE2pfAldgiAk10IIma5FHu4n1EoKGlIjvJB9hHmhO0r
         Kr5g==
X-Forwarded-Encrypted: i=1; AJvYcCUxYArJgECu4g6tjB2z/pVe33ZYxgnTJinK1XcEIWUWldlkKvayFj06buj60IWlWeHJgbr0rGPpjdSnrLM9Og==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiZk0PZE+eLckp4OtJ135uCryP/qHtUFK0Ge4t5JKwfLz3IUOn
	4ULOjmfTqP+qx118S3rLD014RSjwZC2wg3T2TZECfnGY4zzoKS0rmTWJsrSWZe3DwT00KI1yDGs
	x9xexvwJqEw==
X-Google-Smtp-Source: AGHT+IFCTfJyogs2xNZbquzoKUKRwhZa6iBMvrq2vrgnx/8y1STo8dQUoJKux2wc3q9TUHJXXb0iLl0AteNH
X-Received: from pjm15.prod.google.com ([2002:a17:90b:2fcf:b0:31f:61fc:b283])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2fcf:b0:324:e364:2c78
 with SMTP id 98e67ed59e1d1-324e364363amr43846a91.34.1755644026078; Tue, 19
 Aug 2025 15:53:46 -0700 (PDT)
Date: Tue, 19 Aug 2025 22:53:36 +0000
In-Reply-To: <20250819-debugfs-rust-v10-0-86e20f3cf3bb@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250819-debugfs-rust-v10-0-86e20f3cf3bb@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755644022; l=7374;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=zm/+KjQEPIp+EtrHdVvycc6RQsnywHbzucuPtQjImAY=; b=fHITCkOUehkW4i4iVZYq5nL0M0vlneb1dnFIkpSrVfKClEKMaaOs3mcj+YMFOt5ilA916h1vz
 ANwvHt2r4+nC5tzDr1PepJW44a6jkZMs+WEjWA9oC9CS3N4pHojthIh
X-Mailer: b4 0.14.2
Message-ID: <20250819-debugfs-rust-v10-1-86e20f3cf3bb@google.com>
Subject: [PATCH v10 1/7] rust: debugfs: Add initial support for directories
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, 
	Dirk Beheme <dirk.behme@de.bosch.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Adds a `debugfs::Dir` type that can be used to create and remove
DebugFS directories. The `Dir` handle automatically cleans up the
directory on `Drop`.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 MAINTAINERS                     |  2 +
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/debugfs.rs          | 82 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/debugfs/entry.rs    | 61 ++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 5 files changed, 147 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index daf520a13bdf6a991c0160a96620f40308c29ee0..8f2dbf71ca3f8f97e4d7619375279ed11d1261b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7472,6 +7472,8 @@ F:	include/linux/kobj*
 F:	include/linux/property.h
 F:	include/linux/sysfs.h
 F:	lib/kobj*
+F:	rust/kernel/debugfs.rs
+F:	rust/kernel/debugfs/
 F:	rust/kernel/device.rs
 F:	rust/kernel/device/
 F:	rust/kernel/device_id.rs
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 84d60635e8a9baef1f1a1b2752dc0fa044f8542f..e847820dc807fdda2d682d496a3c6361bb944c10 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -46,6 +46,7 @@
 #include <linux/cpufreq.h>
 #include <linux/cpumask.h>
 #include <linux/cred.h>
+#include <linux/debugfs.h>
 #include <linux/device/faux.h>
 #include <linux/dma-mapping.h>
 #include <linux/errname.h>
diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
new file mode 100644
index 0000000000000000000000000000000000000000..893aee54b920bac80f77c2726567da76929b7244
--- /dev/null
+++ b/rust/kernel/debugfs.rs
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Google LLC.
+
+//! DebugFS Abstraction
+//!
+//! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
+
+// When DebugFS is disabled, many parameters are dead. Linting for this isn't helpful.
+#![cfg_attr(not(CONFIG_DEBUG_FS), allow(unused_variables))]
+
+#[cfg(CONFIG_DEBUG_FS)]
+use crate::prelude::*;
+use crate::str::CStr;
+#[cfg(CONFIG_DEBUG_FS)]
+use crate::sync::Arc;
+
+#[cfg(CONFIG_DEBUG_FS)]
+mod entry;
+#[cfg(CONFIG_DEBUG_FS)]
+use entry::Entry;
+
+/// Owning handle to a DebugFS directory.
+///
+/// This directory will be removed when this handle has been dropped *and* all children have been
+/// removed.
+// We hold a reference to our parent if it exists in the `Entry` to prevent the dentry we point
+// to from being cleaned up when our parent is removed.
+//
+// The `None` option indicates that the `Arc` could not be allocated, so our children would not be
+// able to refer to us. In this case, we need to silently fail. All future child directories/files
+// will silently fail as well.
+#[derive(Clone)]
+pub struct Dir(#[cfg(CONFIG_DEBUG_FS)] Option<Arc<Entry>>);
+
+impl Dir {
+    /// Create a new directory in DebugFS. If `parent` is [`None`], it will be created at the root.
+    fn create(name: &CStr, parent: Option<&Dir>) -> Self {
+        #[cfg(CONFIG_DEBUG_FS)]
+        {
+            let parent_entry = match parent {
+                // If the parent couldn't be allocated, just early-return
+                Some(Dir(None)) => return Self(None),
+                Some(Dir(Some(entry))) => Some(entry.clone()),
+                None => None,
+            };
+            Self(
+                // If Arc creation fails, the `Entry` will be dropped, so the directory will be
+                // cleaned up.
+                Arc::new(Entry::dynamic_dir(name, parent_entry), GFP_KERNEL).ok(),
+            )
+        }
+        #[cfg(not(CONFIG_DEBUG_FS))]
+        Self()
+    }
+
+    /// Create a new directory in DebugFS at the root.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// let debugfs = Dir::new(c_str!("parent"));
+    /// ```
+    pub fn new(name: &CStr) -> Self {
+        Dir::create(name, None)
+    }
+
+    /// Creates a subdirectory within this directory.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// let parent = Dir::new(c_str!("parent"));
+    /// let child = parent.subdir(c_str!("child"));
+    /// ```
+    pub fn subdir(&self, name: &CStr) -> Self {
+        Dir::create(name, Some(self))
+    }
+}
diff --git a/rust/kernel/debugfs/entry.rs b/rust/kernel/debugfs/entry.rs
new file mode 100644
index 0000000000000000000000000000000000000000..d2fba0e65e20e954e2a33e776b872bac4adb12e8
--- /dev/null
+++ b/rust/kernel/debugfs/entry.rs
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Google LLC.
+
+use crate::str::CStr;
+use crate::sync::Arc;
+
+/// Owning handle to a DebugFS entry.
+///
+/// # Invariants
+///
+/// The wrapped pointer will always be `NULL`, an error, or an owned DebugFS `dentry`.
+pub(crate) struct Entry {
+    entry: *mut bindings::dentry,
+    // If we were created with an owning parent, this is the keep-alive
+    _parent: Option<Arc<Entry>>,
+}
+
+// SAFETY: [`Entry`] is just a `dentry` under the hood, which the API promises can be transferred
+// between threads.
+unsafe impl Send for Entry {}
+
+// SAFETY: All the C functions we call on the `dentry` pointer are threadsafe.
+unsafe impl Sync for Entry {}
+
+impl Entry {
+    pub(crate) fn dynamic_dir(name: &CStr, parent: Option<Arc<Self>>) -> Self {
+        let parent_ptr = match &parent {
+            Some(entry) => entry.as_ptr(),
+            None => core::ptr::null_mut(),
+        };
+        // SAFETY: The invariants of this function's arguments ensure the safety of this call.
+        // * `name` is a valid C string by the invariants of `&CStr`.
+        // * `parent_ptr` is either `NULL` (if `parent` is `None`), or a pointer to a valid
+        //   `dentry` by our invariant. `debugfs_create_dir` handles `NULL` pointers correctly.
+        let entry = unsafe { bindings::debugfs_create_dir(name.as_char_ptr(), parent_ptr) };
+
+        Entry {
+            entry,
+            _parent: parent,
+        }
+    }
+
+    /// Returns the pointer representation of the DebugFS directory.
+    ///
+    /// # Guarantees
+    ///
+    /// Due to the type invariant, the value returned from this function will always be an error
+    /// code, NULL, or a live DebugFS directory. If it is live, it will remain live at least as
+    /// long as this entry lives.
+    pub(crate) fn as_ptr(&self) -> *mut bindings::dentry {
+        self.entry
+    }
+}
+
+impl Drop for Entry {
+    fn drop(&mut self) {
+        // SAFETY: `debugfs_remove` can take `NULL`, error values, and legal DebugFS dentries.
+        // `as_ptr` guarantees that the pointer is of this form.
+        unsafe { bindings::debugfs_remove(self.as_ptr()) }
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index ed53169e795c0badf548025a57f946fa18bc73e3..828620c8441566a638f31d03633fc1bf4c1bda85 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -76,6 +76,7 @@
 pub mod cpufreq;
 pub mod cpumask;
 pub mod cred;
+pub mod debugfs;
 pub mod device;
 pub mod device_id;
 pub mod devres;

-- 
2.51.0.rc1.167.g924127e9c0-goog

