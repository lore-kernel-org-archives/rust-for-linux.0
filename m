Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16542145B25
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Dec 2024 13:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733663762; cv=none; b=nSISoCGQxtb0sbgtdN+QheVle4EDsRfUNfthrR7m2G5WkhhiN5Nstgf3rUcsTbKIIpNsDtUCoBuy+K0OREazMcBdMppBKNmTDwvcdYCnL1++i9r9LA92RBXmhs1tVkwGCFE61l929h8L8bwoDNXfUavFp3+oPG3/1N00KlOTvfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733663762; c=relaxed/simple;
	bh=0oLjgeB/cJcae2SbRH3nR+1jA849GCwjr4vfbgfSI0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLlT7o7w1whfMN5szFm+LSyQNGEIqQdupSYo4mSkQRkLUseRKQn3akuCbWbUGoCmfAbLfADpVMsWGQmVyuKVHf+N66L9vYX2xzeMcSE5hiXngxNZq4ZYud2S7g46yATyxGuP4q0QSpI2DvV/pHUi9vYhShc271gSCouD+ibPuos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=Ckvy9IKt; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="Ckvy9IKt"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3d2a30afcso2701743a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Dec 2024 05:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1733663758; x=1734268558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60jpBfK0tyVrO7NCZJKuTJXHbrEC8lr3GIi+TiMo5FM=;
        b=Ckvy9IKtDlLa2avkZEY5yT45PjGda6pfuONnKCHvhqwMB5Y7QozCzvM6GH7ijpYlqq
         0ZA0y5tlMZQAre53eQM1HmOWClCWYHyvxGkWppumj2U4KnJeafny6woO+Of5rG4d7LFS
         PXMfnqmwTj782Jr22K9Q9uzYBYsHRoW7x2NAitsUufc7cWxwFpg1EQIW6/7m5S2glEVt
         w2LWaq8PUHdD804izWn7In6LM1VFA9hOMawVn7UGJZtC5mfkLsi5PZB6kLcIIHFagljA
         +2SO2NkYd9i+/J0EMGM7De6+ha3jo/3LhGWJJcJKqZSOVKbz1n649odZTRwvgJqPcRRC
         x+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663758; x=1734268558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60jpBfK0tyVrO7NCZJKuTJXHbrEC8lr3GIi+TiMo5FM=;
        b=ZbCFoVwx2/RhKl6mtKPwoWT8reChQSepXu1zFbNGS1VrYsZGVGVnOODjS1Jrz+AUFi
         5sUlqwQ3OhNicjWfjWB7nYjlFm9yu8i/2KFJdWlzLCFxzlY+lDox+MXaW7cEHmPA0bdN
         ++ijLQeEzVRGLn+t0X1035Iht7wU3x3AbhV0d0h+75mgCfYuVwLTTWJ+sc1+m2+PUO0O
         NEMzI7ZAhRokzgRr+oXvUlw/BSlkWoc7pf+trK4oo5AUUMPWpkYZxfKxiphDhuH5Mpjv
         OZgDUjC0LQIJoPmwZXoDUvyxrez+XjmaAKc3tJsFNFJ5dGwzZ6JHItl2VOLGJLH/6Pz4
         Q/MA==
X-Forwarded-Encrypted: i=1; AJvYcCWQxQZc4+XxS6U/LLpqKoxDgXDu4Cnoahzg5Taoyl3TYWy54XcYVuW6W/n7aRPtjnggQUEyoKKo8xj2wgSYSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUqwzzsGR1H3P752oKa+EUOnKialH+qJWSwSoj9s5teUNGm+Xp
	GhHk3kd5m8N0TB6etLJxq+N3TR2Veq3174Lb9IdPbAQ+unpUB3f6Xtp7tWFzdEg=
X-Gm-Gg: ASbGnctv2cyMe5MGKbPJdfSKGZsWDhTaibUv5a1MpcJ7PDKq+1YYOfSPrgxEhvHZDWq
	1bwqVZ81yJBUKb4ktrqnydaN38h03Nz+nLDNo8fZdrDMVIu/eMRPBCrJg0JlMVMh0pvGpcyIIcS
	uigt3x21dDCQffkhrJynqBB2P+RnQ/7sfyM6Op94R5zFHLb6S4Y/6UQf8MiOVkqiU4omptNHcvf
	MzlqQSbapRqU0tcQvNgBT7b9TNguEZsjR2IGjPSAC0=
X-Google-Smtp-Source: AGHT+IH77ui/wx6w4CER+5pt8Pmu9+0AJn+r6KefZ2b9N36pylYm3Kbz9yOySN0GG2PrIu9WCCa7nQ==
X-Received: by 2002:a17:906:9d2:b0:aa6:8520:718b with SMTP id a640c23a62f3a-aa68520738emr56489366b.56.1733663758090;
        Sun, 08 Dec 2024 05:15:58 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e96c19sm529078966b.42.2024.12.08.05.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:15:56 -0800 (PST)
From: Daniel Sedlak <daniel@sedlak.dev>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Daniel Sedlak <daniel@sedlak.dev>
Subject: [RFC PATCH 2/3] rust: kernel: kobject: basic sysfs implementation
Date: Sun,  8 Dec 2024 14:15:44 +0100
Message-ID: <20241208131545.386897-3-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241208131545.386897-1-daniel@sedlak.dev>
References: <20241208131545.386897-1-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement initial support for interacting with sysfs
via kobject API from the Rust world. Rust for now does
not expose any debug interface or interface for tuning
knobs of the kernel module. Sysfs is used for exporting
relevant debugging metrics or it can be used for
tuning module configuration in the runtime (apart from
module parameters).

This patch builds on a prior work [1] by Martin RR, which
is listed in the old patch registry [2]. However the [1]
seems to be only focused on exposing devices to the sysfs,
where this patch tries to be more broad, not only specific
to the devices.

Link: https://github.com/YakoYakoYokuYoku/linux/commits/sysfs-support [1]
Link: https://github.com/tgross35/RFL-patch-registry [2]
Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
---
 rust/kernel/kobject.rs | 271 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   2 +
 2 files changed, 273 insertions(+)
 create mode 100644 rust/kernel/kobject.rs

diff --git a/rust/kernel/kobject.rs b/rust/kernel/kobject.rs
new file mode 100644
index 000000000000..9fcc026c83db
--- /dev/null
+++ b/rust/kernel/kobject.rs
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0
+// TODO: Add unsafe doc documentation.
+#![allow(clippy::undocumented_unsafe_blocks, clippy::missing_safety_doc)]
+
+//! KObject wrappers.
+//!
+//! TODO: Write more
+
+use bindings::PAGE_SIZE;
+use core::marker::PhantomData;
+use core::marker::PhantomPinned;
+use core::mem;
+use core::ptr;
+use kernel::c_str;
+use kernel::container_of;
+use kernel::error::code::*;
+use kernel::prelude::*;
+use kernel::str::{CStr, CString};
+use kernel::types::Mode;
+use kernel::types::Opaque;
+
+/// Reference to the subsystems from the non Rust world.
+pub mod subsystems {
+    use super::DynamicKObject;
+
+    macro_rules! declare_kobject {
+        ($name:tt, $subsystem_ptr:expr, $($doc:expr),+) => {
+            $(
+            #[doc = $doc]
+            )*
+            pub static $name: DynamicKObject = DynamicKObject {
+                pointer: kernel::types::Opaque::new(
+                    core::ptr::addr_of!($subsystem_ptr).cast_mut(),
+                ),
+            };
+        };
+    }
+
+    declare_kobject!(
+        FIRMWARE_KOBJECT,
+        bindings::firmware_kobj,
+        "Firmware subsystem dynamic KObject."
+    );
+    declare_kobject!(
+        KERNEL_KOBJECT,
+        bindings::kernel_kobj,
+        "Kernel subsystem dynamic KObject."
+    );
+    declare_kobject!(
+        MM_KOBJECT,
+        bindings::mm_kobj,
+        "Memory management subsystem dynamic KObject."
+    );
+    declare_kobject!(
+        POWER_KOBJECT,
+        bindings::power_kobj,
+        "Power subsystem dynamic KObject."
+    );
+
+    // TODO: Add rests of the exported Kobjects.
+}
+
+/// DynamicKObject is same as [`KObject`], however it does not have any state.
+pub struct DynamicKObject {
+    // The bindings export `extern static *mut bindings::kobejct`, however
+    // we need to have double pointer because rustc complains with
+    // `could not evaluate static initializer`.
+    pointer: Opaque<*mut *mut bindings::kobject>,
+}
+
+unsafe impl Send for DynamicKObject {}
+unsafe impl Sync for DynamicKObject {}
+
+/// KObject represent wrapper structure enables interaction with
+/// the sysfs, where the KObject represents directory.
+///
+/// TODO: Add examples?
+pub struct KObject<K> {
+    data: K,
+    pointer: Opaque<bindings::kobject>,
+
+    // Struct must be `!Unpin`, because kobject pointer is self referential.
+    _m: PhantomPinned,
+}
+
+impl<K> Drop for KObject<K> {
+    fn drop(&mut self) {
+        // SAFETY: This KObject holds a valid reference, because it was allocated
+        // through kobject API.
+        unsafe { bindings::kobject_put(self.pointer.get()) }
+    }
+}
+
+#[doc(hidden)]
+struct KObjTypeVTable;
+#[doc(hidden)]
+impl KObjTypeVTable {
+    unsafe extern "C" fn release_callback(kobj: *mut bindings::kobject) {
+        unsafe { bindings::kfree(kobj.cast()) }
+    }
+
+    pub(crate) const KOBJ_TYPE: bindings::kobj_type = bindings::kobj_type {
+        release: Some(Self::release_callback),
+        sysfs_ops: ptr::addr_of!(bindings::kobj_sysfs_ops),
+        ..unsafe { mem::zeroed() }
+    };
+
+    pub(crate) fn kobj_type(&self) -> &'static bindings::kobj_type {
+        &Self::KOBJ_TYPE
+    }
+}
+
+unsafe impl<K> Send for KObject<K> where K: Send {}
+unsafe impl<K> Sync for KObject<K> where K: Sync {}
+
+impl<K> KObject<K> {
+    /// Attaches KObject to the sysfs root.
+    pub fn new_in_root(name: CString, data: K) -> Result<Pin<KBox<Self>>> {
+        Self::new(name, ptr::null_mut(), data)
+    }
+
+    /// Attaches new KObject to the sysfs with specified KObject parent.
+    pub fn new_with_kobject_parent<L>(
+        name: CString,
+        parent: &KObject<L>,
+        data: K,
+    ) -> Result<Pin<KBox<Self>>> {
+        Self::new(name, parent.pointer.get(), data)
+    }
+
+    /// Attaches new KObject to the sysfs with specified **dynamic** KObject parent.
+    pub fn new_with_dynamic_kobject_parent(
+        name: CString,
+        parent: &DynamicKObject,
+        data: K,
+    ) -> Result<Pin<KBox<Self>>> {
+        Self::new(name, unsafe { **parent.pointer.get() }, data)
+    }
+
+    fn new(name: CString, parent: *mut bindings::kobject, data: K) -> Result<Pin<KBox<Self>>> {
+        let this = KBox::pin(
+            Self {
+                pointer: Opaque::new(unsafe { mem::zeroed() }),
+                data,
+                _m: PhantomPinned,
+            },
+            GFP_KERNEL,
+        )?;
+
+        let code = unsafe {
+            bindings::kobject_init_and_add(
+                this.pointer.get(),
+                KObjTypeVTable.kobj_type(),
+                parent,
+                c_str!("%s").as_char_ptr(),
+                name.as_char_ptr(),
+            )
+        };
+        if code < 0 {
+            return Err(Error::from_errno(code));
+        }
+
+        // TODO: Not sure whether we must check for return code of `kobject_uevent`.
+        unsafe {
+            // We are  responsible for sending uevent that kobject was added to the system.
+            bindings::kobject_uevent(this.pointer.get(), bindings::kobject_action_KOBJ_ADD)
+        };
+
+        Ok(this)
+    }
+
+    /// Creates a file for a given KObject.
+    pub fn add_attribute<A: KObjectTextAttribute<K>>(
+        self: &mut Pin<KBox<KObject<K>>>,
+        attribute: A,
+    ) -> Result<()> {
+        let vtable = TextAttributeVTable::<K, A>::new();
+        // TODO: Can we use it later?
+        let _ = attribute;
+
+        let code = unsafe {
+            bindings::sysfs_create_file_ns(
+                self.pointer.get(),
+                ptr::addr_of!(*vtable.attr()) as *const bindings::attribute,
+                ptr::null(),
+            )
+        };
+
+        if code == 0 {
+            Ok(())
+        } else {
+            Err(kernel::error::Error::from_errno(code))
+        }
+    }
+}
+
+/// Attribute represents a file in a directory.
+#[macros::vtable]
+pub trait KObjectTextAttribute<K>
+where
+    Self: Sized,
+{
+    /// File permissions.
+    const MODE: Mode = Mode::from_u16(0o777);
+
+    /// Name of the file in the sysfs.
+    const NAME: &'static CStr;
+
+    /// Gets called when the read is called on the file.
+    fn show(this: &mut K) -> Result<CString> {
+        let _ = this;
+        Err(EIO)
+    }
+
+    /// Gets called when the write is called on the file.
+    fn store(this: &mut K, input: &CStr) -> Result {
+        let _ = this;
+        let _ = input;
+        Err(EIO)
+    }
+}
+
+#[doc(hidden)]
+struct TextAttributeVTable<K, A: KObjectTextAttribute<K>>(PhantomData<(A, K)>);
+#[doc(hidden)]
+impl<K, A: KObjectTextAttribute<K>> TextAttributeVTable<K, A> {
+    #[doc(hidden)]
+    const fn new() -> Self {
+        Self(PhantomData)
+    }
+    unsafe extern "C" fn show_callback(
+        kobj: *mut bindings::kobject,
+        _attr: *mut bindings::kobj_attribute,
+        buf: *mut core::ffi::c_char,
+    ) -> isize {
+        match A::show(
+            &mut unsafe { &mut *container_of!(kobj, KObject<K>, pointer).cast_mut() }.data,
+        ) {
+            Ok(cstring) => unsafe {
+                bindings::sized_strscpy(buf.cast(), cstring.as_char_ptr(), PAGE_SIZE)
+            },
+            Err(error) => error.to_errno() as isize,
+        }
+    }
+    unsafe extern "C" fn store_callback(
+        kobj: *mut bindings::kobject,
+        _attr: *mut bindings::kobj_attribute,
+        buf: *const core::ffi::c_char,
+        count: usize,
+    ) -> isize {
+        match A::store(
+            &mut unsafe { &mut *container_of!(kobj, KObject<K>, pointer).cast_mut() }.data,
+            unsafe { kernel::str::CStr::from_char_ptr(buf) },
+        ) {
+            Ok(()) => count as isize,
+            Err(error) => error.to_errno() as isize,
+        }
+    }
+    pub(crate) const ATTR: bindings::kobj_attribute = bindings::kobj_attribute {
+        attr: bindings::attribute {
+            name: A::NAME.as_char_ptr(),
+            mode: A::MODE.as_u16(),
+        },
+        show: Some(Self::show_callback),
+        store: Some(Self::store_callback),
+    };
+
+    const fn attr(&self) -> &'static bindings::kobj_attribute {
+        &TextAttributeVTable::<K, A>::ATTR
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index e1065a7551a3..f2a921ff38b1 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -42,6 +42,8 @@
 pub mod init;
 pub mod ioctl;
 pub mod jump_label;
+#[cfg(CONFIG_SYSFS)]
+pub mod kobject;
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;
 pub mod list;
-- 
2.47.1

