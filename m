Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260141E9915
	for <rust-for-linux@vger.kernel.org>; Fri,  2 May 2025 19:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746215389; cv=none; b=IBTK/a4AL16eL1Dp9Tsv9cGpegRWFhdgErCI746r3tifyBXfLpy28O4M2tSIcshbSAKihBiZPP4CkNN9JAlAS8XR5fJiPFO9q9vUn/VQcY0TnyYPOEjz8B3g4l6VA+nx1aMCGAZvS5OuoGobE40ckVejSoG/2W+oZA1VaueWTFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746215389; c=relaxed/simple;
	bh=EHBhfCwaB/PnpKByIIKrHGgj32DfG0VS+hMiv2azs7Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j7xcar7YEMqODEVpJXIJT25z295TEvVF2j2kAsPw/80GqgBAFG3+cJo8SIKnGK61TpLeaIDa5q+nXkSEVO9lr/DtYMaaTfi2qUcvGEOeaEpIancU1+eStxwB0SLmf1WG6JWHDlRspeOCJiS/JI8ASM/0VWcMCimgtK9HrXGmLfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FjA//ZqG; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FjA//ZqG"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30a2b6c8ff2so2561001a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 02 May 2025 12:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746215387; x=1746820187; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GsTDMr/FRX+ryl4d/GP3feYD00SUaTvz4M5O3cBtWhE=;
        b=FjA//ZqGqSYOtFL/UCG/wODp4Tr6mrGHTN/TQmVmSGZnqfvUgc5nJmrr75pvmwgl98
         zs3GVuS0Edt1ebRMfeVrcVXZPx/QybHb7vggVNU66j774xMS9oViG5nGMaQ/CfxN7T1r
         t7Kb9A56j+C5JheqwvVDjwWWMAMWRcQusiNH2mjBs5sLBt8wWquudKreGKINaGMb9LIv
         gU/fkEeINCwMrrLEzNtuCyOI49KmJBOjnBlH759lo5DWQ8WlTKNWVAcUyDeOY9FLnTxW
         ET4PzigKY7VsJSDZnGqYTeKKlqqIwNjEl6LQ36+AI/y+5KlMS+PUNMW4MkmgzkefacbC
         qakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746215387; x=1746820187;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GsTDMr/FRX+ryl4d/GP3feYD00SUaTvz4M5O3cBtWhE=;
        b=cU5kADJoeR/to8yJLUzcr49sR/IsGkqEF3g6HFxfR60JFD8jm+1+RcCwhACmoNHpn6
         Vv8XVKWrgF3vhH/4OZ1Js+eQiMd53Rl9/lTj2jvih1k89uE5ZkOav9aWLtP+BCEOsvXK
         hISlkYKy/Mdpnf8S7in6gDCXsuX0yd3URlPAJNogvEe2SVGHXH4O3ykb6HO0bV3y0BDk
         lNixY+775+agv2bfmpiDXlCLCGwRKok3kTmZzrvB5hhQlifNmW1W2Be3jcYXz5AiU+5o
         /6pbA8hHwt8wT3FPWo2TeqGXdMo4XIaA3f0d2KrMQBx72n6kzU8hxHaylkSo8x241a5C
         XdYA==
X-Forwarded-Encrypted: i=1; AJvYcCXb7F1vLERrP6Xau7O8KvoIbL9qwgXe5Xzlf/HI6zR1uaInfD+a5hkK4o8wCvUhJ6hXZEW8lROn1EqbNjiM7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHryirPiSTSwmCoxarVm8Gbq6C1yc86x/9jUokMZ1H/af0RmSZ
	7lffMzFHxoYBY8btJEKFuiO+WKI7YVJAlgFTxVmm8ocYFHPwtAq9xw0GNp18yfz75Padc3sBum0
	OQu1azA==
X-Google-Smtp-Source: AGHT+IFr5KNNHP4xPoSKk/lUdp6dvgVBFZdQPVsIclv4/vIvl/QoBnVbfpDue/W09ra4J8bsX86pvUKjL55U
X-Received: from pjp6.prod.google.com ([2002:a17:90b:55c6:b0:2f8:4024:b59a])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:57e7:b0:30a:214c:24c9
 with SMTP id 98e67ed59e1d1-30a5adf9577mr681765a91.3.1746215387472; Fri, 02
 May 2025 12:49:47 -0700 (PDT)
Date: Fri, 02 May 2025 19:49:30 +0000
In-Reply-To: <20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746215384; l=7773;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=EHBhfCwaB/PnpKByIIKrHGgj32DfG0VS+hMiv2azs7Q=; b=yIYL/whoKwzDfKcDmWIHRAgn6Na22JDKKT0b1CxDWcKXcpURN+jcPF/Or45klFrbjmuuJJMA0
 46lBzUW4g4uCLOYpBbFd/n2GhPlvWrYiWn2LbUxj5u7/TIG6Asr0mjl
X-Mailer: b4 0.14.2
Message-ID: <20250502-debugfs-rust-v4-1-788a9c6c2e77@google.com>
Subject: [PATCH v4 1/4] rust: debugfs: Bind DebugFS directory creation
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Support creating DebugFS directories and subdirectories. Similar to the
original DebugFS API, errors are hidden.

By default, when a root directory handle leaves scope, it will be cleaned
up.

Subdirectories will by default persist until their root directory is
cleaned up, but can be converted into a root directory if a scoped
lifecycle is desired.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 MAINTAINERS                     |   1 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/debugfs.rs          | 159 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 4 files changed, 162 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 906881b6c5cb6ff743e13b251873b89138c69a1c..a3b835e427b083a4ddd690d9e7739851f0af47ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7271,6 +7271,7 @@ F:	include/linux/kobj*
 F:	include/linux/property.h
 F:	include/linux/sysfs.h
 F:	lib/kobj*
+F:	rust/kernel/debugfs.rs
 F:	rust/kernel/device.rs
 F:	rust/kernel/device_id.rs
 F:	rust/kernel/devres.rs
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 8a2add69e5d66d1c2ebed9d2c950380e61c48842..787f928467faabd02a7f3cf041378fac856c4f89 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -13,6 +13,7 @@
 #include <linux/blkdev.h>
 #include <linux/cpumask.h>
 #include <linux/cred.h>
+#include <linux/debugfs.h>
 #include <linux/device/faux.h>
 #include <linux/dma-mapping.h>
 #include <linux/errname.h>
diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
new file mode 100644
index 0000000000000000000000000000000000000000..41ac1711e9c0e66de1a434217c363176f806f434
--- /dev/null
+++ b/rust/kernel/debugfs.rs
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! DebugFS Abstraction
+//!
+//! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
+
+use crate::str::CStr;
+use core::marker::PhantomData;
+
+/// Owning handle to a DebugFS directory.
+///
+/// This directory will be cleaned up when it goes out of scope.
+///
+/// # Invariants
+///
+/// The wrapped pointer will always be `NULL`, an error, or an owned DebugFS `dentry`.
+#[repr(transparent)]
+pub struct Dir<'a, const KEEP: bool = false> {
+    #[cfg(CONFIG_DEBUG_FS)]
+    dir: *mut bindings::dentry,
+    // We need to be outlived by our parent, if they exist, but we don't actually need to be able
+    // to access the data.
+    _phantom: PhantomData<&'a Dir<'a, true>>,
+}
+
+// SAFETY: [`Dir`] is just a `dentry` under the hood, which the API promises can be transferred
+// between threads.
+unsafe impl<const KEEP: bool> Send for Dir<'_, KEEP> {}
+
+// SAFETY: All the native functions we re-export use interior locking, and the contents of the
+// struct are opaque to Rust.
+unsafe impl<const KEEP: bool> Sync for Dir<'_, KEEP> {}
+
+impl<'a, const KEEP: bool> Dir<'a, KEEP> {
+    /// Create a new directory in DebugFS. If `parent` is [`None`], it will be created at the root.
+    #[cfg(CONFIG_DEBUG_FS)]
+    fn create<const PARENT_KEEP: bool>(name: &CStr, parent: Option<&Dir<'a, PARENT_KEEP>>) -> Self {
+        let parent_ptr = match parent {
+            Some(parent) => parent.as_ptr(),
+            None => core::ptr::null_mut(),
+        };
+        // SAFETY:
+        // * `name` argument points to a NUL-terminated string that lives across the call, by
+        //   invariants of `&CStr`.
+        // * If `parent` is `None`, `parent` accepts null pointers to mean create at root.
+        // * If `parent` is `Some`, `parent` accepts live dentry debugfs pointers.
+        //   so we can call `Self::from_ptr`.
+        let dir = unsafe { bindings::debugfs_create_dir(name.as_char_ptr(), parent_ptr) };
+
+        // SAFETY: `debugfs_create_dir` either returns an error code or a legal `dentry` pointer,
+        unsafe { Self::from_ptr(dir) }
+    }
+
+    #[cfg(not(CONFIG_DEBUG_FS))]
+    fn create<const PARENT_KEEP: bool>(
+        _name: &CStr,
+        _parent: Option<&Dir<'a, PARENT_KEEP>>,
+    ) -> Self {
+        Self()
+    }
+
+    /// Constructs a new DebugFS [`Dir`] from the underlying pointer.
+    ///
+    /// # Safety
+    ///
+    /// The pointer must either be an error code, `NULL`, or represent a transfer of ownership of a
+    /// live DebugFS directory.
+    #[cfg(CONFIG_DEBUG_FS)]
+    unsafe fn from_ptr(dir: *mut bindings::dentry) -> Self {
+        Self {
+            dir,
+            _phantom: PhantomData,
+        }
+    }
+
+    /// Returns the pointer representation of the DebugFS directory.
+    ///
+    /// # Guarantees
+    ///
+    /// Due to the type invariant, the value returned from this function will always be an error
+    /// code, NUL, or a live DebugFS directory.
+    // If this function is ever needed with `not(CONFIG_DEBUG_FS)`, hardcode it to return
+    // `ERR_PTR(ENODEV)`.
+    #[cfg(CONFIG_DEBUG_FS)]
+    fn as_ptr(&self) -> *mut bindings::dentry {
+        self.dir
+    }
+
+    /// Create a DebugFS subdirectory.
+    ///
+    /// This returns a [`Dir<'_, true>`], which will not be automatically cleaned up when it
+    /// leaves scope.
+    /// To convert this to a handle governing the lifetime of the directory, use [`Dir::owning`].
+    ///
+    /// Regardless of conversion, subdirectory handles cannot outlive the directory handle they
+    /// were created from.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// let parent = Dir::new(c_str!("parent"));
+    /// let child = parent.subdir(c_str!("child"));
+    /// ```
+    pub fn subdir<'b>(&'b self, name: &CStr) -> Dir<'b, true> {
+        Dir::create(name, Some(self))
+    }
+}
+
+impl<'a> Dir<'a, false> {
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
+        Dir::create::<false>(name, None)
+    }
+}
+
+impl<'a> Dir<'a, true> {
+    /// Upgrade a non-owning directory to one which will be removed on drop.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// let debugfs = Dir::new(c_str!("parent"));
+    /// let subdir = debugfs.subdir(c_str!("child"));
+    /// // If subdir were dropped, the directory would not be removed.
+    /// let owned_subdir = subdir.owning();
+    /// // If owned_subdir is dropped, "child" will be removed.
+    /// ```
+    pub fn owning(self) -> Dir<'a, false> {
+        Dir {
+            dir: self.dir,
+            _phantom: self._phantom,
+        }
+    }
+}
+
+impl<const KEEP: bool> Drop for Dir<'_, KEEP> {
+    fn drop(&mut self) {
+        #[cfg(CONFIG_DEBUG_FS)]
+        if !KEEP {
+            // SAFETY: `debugfs_remove` can take `NULL`, error values, and legal DebugFS dentries.
+            // `as_ptr` guarantees that the pointer is of this form.
+            unsafe { bindings::debugfs_remove(self.as_ptr()) }
+        }
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index c3762e80b314316b4b0cee3bfd9442f8f0510b91..86f6055b828d5f711578293d8916a517f2436977 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -45,6 +45,7 @@
 #[doc(hidden)]
 pub mod build_assert;
 pub mod cred;
+pub mod debugfs;
 pub mod device;
 pub mod device_id;
 pub mod devres;

-- 
2.49.0.906.g1f30a19c02-goog

