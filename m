Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3162ED16D
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 21:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229241; cv=none; b=AxRY1a5pj/UqxrdAWqymwFlVNhj5QiGZEbrm/U+46pRQp1/fUsS6ZDTpblzdCxdJL7zVBI1WPn5GFpW+sByfJdGDvgfyc6Y9Z3U7ODNCHXpon7DQ/KxQD0wRexA9wWO+YAPuc0OKQ5kSR6nGkE36RB62bVKD1t7/2QsRgDkoeGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229241; c=relaxed/simple;
	bh=aw7jen9Y6mLuF43Ihyg0muw+h1WHGZzxGUd9JmT4Jjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f45J9SJvkwt8ir8f+yIAw1zJG+7RZE4az+IYGs2kMoim5eBwwt5QtLybEbjTVpn/KndxPBnWimzq0+6DuUTRFYBw42ja2Sf+3e12ejpNjpgzou+wLhFThuOs3chQf4fhfmRJhFYcCgwZnHtewZqB95gTGNKJftppmSDyFe9ulXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OPDWjswI; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPDWjswI"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bdcb30fe8aso4576740eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 13:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772229239; x=1772834039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TURvnTXNSG+YFpbkN95wBHl3Myvzl19SQUgrJTkS/64=;
        b=OPDWjswICUHgR+z6uWA59Eqe0HfzvpC41g1uVsZPcR4ybiMT/UME1jbY8YGuHLnwlS
         K41A6LYFfLc76ZEhAwKmCbQb8+ifVibybhKxA59P7t5XXoxQwYMGXrEl1oktC+OO7sqH
         ce5EaYBvHlofU1nN/fNlZkq2H9KYReDJBhKZg0uFdqE4FowOSusSA2t2NOXmozE0aO8m
         SIN4WlXQhkvPbTgYB30AAzM6p4K+Vj2x75ZXYHxB6Y+21hTV8NydlSkyd17cnwMc2q+Y
         H3qzXWYTrK+ds39tKw4+JA5z0ArkF+ZxawHzk9FTBQFPqUjamPkpXFh/GingqdwaYsD4
         ZXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229239; x=1772834039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TURvnTXNSG+YFpbkN95wBHl3Myvzl19SQUgrJTkS/64=;
        b=S7iBPpyVqEgE4iQ7HIhO9bilRXFBoW5T/ugoNGVECKYJuoh0n7ZJgB78aaQDVjtMno
         MuCjvqlRAFi7PR9S/OYsvkxBp/0XpU+m4QcLX0sEi2QFp83A1M3NyJE5EGifwFHK74nf
         YJg2tVFtOY5+qOTXdj3p3SKPy+rkJi8k4eN9YBwzZmDPjigk+652pREWRgLs9lsnubJ3
         GdtSyxaeohmzO55nwzLWps5uhWQXn3lxbSNT78w4HqKADJ3FRdSWFMBvtU1bD4QzSVxX
         JsTZ8OKDRPO2JekGwHvoNie5VCM4EniYWbK+Svo3zWY4INej+MbPffn5LSSHYL3giz0T
         xwrg==
X-Forwarded-Encrypted: i=1; AJvYcCWOXpF1Gxu116qnEPPntm1fYeheMfuqa4T7w7EXgY2XSCpD2Epi3pMA4T9hgIYWQGCFYw3rgcE/hWBa73mfmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOcqrm0Zgne58Fd2pzFJi0ybFQCVusgLx3KxuHG4YkWJFDlxum
	Bgien9s2f52sXMEv2r0OhWI4f2z5Z0M+//dOmGgjXw3NqjMSxe1341Ne
X-Gm-Gg: ATEYQzzjqJG52il0M1igN6uIoE3hRL59IxnqykrdjljkdwptC7H+epY8n6eW77EiOnT
	jcx/6OR3rJROy2nYM2Do1cTNNhRW3HwNyGO9roBH+BO+aIlQms06x+WNNtf+QaVYmtya5U+6pHt
	RNFwDcp42QpXhVqCc5/fWpT6qVZTjHy9t0MRFxto8y6NWcgvIzdsLdLhHP3O+SonuKks/gACbuO
	NlelMeOfRzqDqDwm0E460i7gsE8wD+G4UwtiCwq5REKU2mj8j3QRdHwpTg+BULjEeq9BjO9tCWM
	akYuJeQpeBNRnmm0boG5eFiEtO/3cIKunl9YN0cadkr0xKidNZuBj4zUoFro0I1K2iJaD5bVX68
	R1JJuHnxC61DQcGrXIgv6Elg7dO97LH1tPPdV3sEbfxbU/OLNYhIq7NvTlGWUETKndWC718t+ZK
	mQp4FfLj4o04qKce3CCQ/BgjrZJcHD/A==
X-Received: by 2002:a05:7301:1f10:b0:2ba:6b03:909b with SMTP id 5a478bee46e88-2bde1c989b0mr2264381eec.19.1772229238416;
        Fri, 27 Feb 2026 13:53:58 -0800 (PST)
Received: from localhost ([2600:1700:22f5:908f:1457:7499:d258:358f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1bcde84sm4427866eec.4.2026.02.27.13.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 13:53:58 -0800 (PST)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Breno Leito <leitao@debian.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] rust: console: add abstraction for kernel console drivers
Date: Fri, 27 Feb 2026 13:53:56 -0800
Message-ID: <20260227215357.667257-1-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a safe Rust abstraction for the kernel's `struct console`,
enabling console drivers to be implemented in Rust that provides:

  - `ConsoleOps` trait with a required `write` callback and an
    optional `setup` callback, mirroring the C console_operations
    interface. The trait requires `Send + Sync` to reflect that
    console write may be called from any context including IRQ.

  - `Console<T>` struct that wraps `struct console` using pin-init
    and `Opaque<T>`, with automatic unregistration via `PinnedDrop`.
    Registration is performed through a pin-initializer returned by
    `Console::register()`, which uses `pin_chain` to set the data
    pointer and call `register_console()` after the struct is pinned.

  - `ConsoleOpsAdapter<T>` that provides the extern "C" callbacks
    bridging from the kernel's function pointers to the Rust trait
    methods. The `#[vtable]` attribute on `ConsoleOps` enables
    compile-time detection of whether `setup` is implemented via
    `T::HAS_SETUP`.

  - Console flag constants re-exported from the C `enum cons_flags`.

C helper functions are added for `register_console()`,
`unregister_console()`, and `console_is_registered()` as these are
either inlines or macros that cannot be called directly from Rust
through bindgen.

This abstraction is a dependency for a Rust netconsole implementation
I am working on.

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/console.c          |  22 +++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/console.rs          | 230 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 5 files changed, 255 insertions(+)
 create mode 100644 rust/helpers/console.c
 create mode 100644 rust/kernel/console.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 083cc44aa952..eeddf2374f00 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -43,6 +43,7 @@
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/configfs.h>
+#include <linux/console.h>
 #include <linux/cpu.h>
 #include <linux/cpufreq.h>
 #include <linux/cpumask.h>
diff --git a/rust/helpers/console.c b/rust/helpers/console.c
new file mode 100644
index 000000000000..b101c6c749fd
--- /dev/null
+++ b/rust/helpers/console.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Rust helpers for console.
+ */
+
+#include <linux/console.h>
+
+void rust_helper_register_console(struct console *console)
+{
+	register_console(console);
+}
+
+int rust_helper_unregister_console(struct console *console)
+{
+	return unregister_console(console);
+}
+
+bool rust_helper_console_is_registered(struct console *console)
+{
+	return console_is_registered(console);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index a3c42e51f00a..2b818126ce02 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -22,6 +22,7 @@
 #include "build_bug.c"
 #include "clk.c"
 #include "completion.c"
+#include "console.c"
 #include "cpu.c"
 #include "cpufreq.c"
 #include "cpumask.c"
diff --git a/rust/kernel/console.rs b/rust/kernel/console.rs
new file mode 100644
index 000000000000..d78b04a9846b
--- /dev/null
+++ b/rust/kernel/console.rs
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Console driver abstraction.
+//!
+//! This module provides safe Rust wrappers for implementing kernel console
+//! drivers, which receive kernel log messages and output them to a device.
+//!
+//! C header: [`include/linux/console.h`](srctree/include/linux/console.h)
+
+use crate::{bindings, error::Result, prelude::*, str::CStr, types::Opaque};
+use core::marker::PhantomData;
+
+/// Console flags from `enum cons_flags`.
+pub mod flags {
+    /// Used by newly registered consoles to avoid duplicate output.
+    pub const CON_PRINTBUFFER: u16 = bindings::cons_flags_CON_PRINTBUFFER as u16;
+    /// Indicates console is backing /dev/console.
+    pub const CON_CONSDEV: u16 = bindings::cons_flags_CON_CONSDEV as u16;
+    /// Console is enabled.
+    pub const CON_ENABLED: u16 = bindings::cons_flags_CON_ENABLED as u16;
+    /// Early boot console.
+    pub const CON_BOOT: u16 = bindings::cons_flags_CON_BOOT as u16;
+    /// Console can be called from any context.
+    pub const CON_ANYTIME: u16 = bindings::cons_flags_CON_ANYTIME as u16;
+    /// Braille device.
+    pub const CON_BRL: u16 = bindings::cons_flags_CON_BRL as u16;
+    /// Console supports extended output format.
+    pub const CON_EXTENDED: u16 = bindings::cons_flags_CON_EXTENDED as u16;
+    /// Console is suspended.
+    pub const CON_SUSPENDED: u16 = bindings::cons_flags_CON_SUSPENDED as u16;
+}
+
+/// Operations that a console driver must implement.
+///
+/// The `write` callback is the only required operation. It will be called
+/// to output kernel log messages.
+#[vtable]
+pub trait ConsoleOps: Sized + Send + Sync {
+    /// Writes a message to the console.
+    ///
+    /// This is called with a buffer containing the message to output.
+    /// The implementation should send the message to the console device.
+    ///
+    /// # Context
+    ///
+    /// This may be called from any context, including IRQ context.
+    /// Implementations must not sleep.
+    fn write(&self, msg: &[u8]);
+
+    /// Sets up the console.
+    ///
+    /// This is called when the console is registered.
+    /// The `options` parameter contains any boot command line options.
+    fn setup(&self, _options: Option<&CStr>) -> Result {
+        Ok(())
+    }
+}
+
+/// Adapter for console operations vtable.
+struct ConsoleOpsAdapter<T: ConsoleOps>(PhantomData<T>);
+
+impl<T: ConsoleOps> ConsoleOpsAdapter<T> {
+    /// Write callback for the console.
+    ///
+    /// # Safety
+    ///
+    /// `con` must be a valid pointer to a `bindings::console` that was
+    /// created by `Console<T>` and has valid `data` pointing to `T`.
+    unsafe extern "C" fn write_callback(
+        con: *mut bindings::console,
+        s: *const u8,
+        count: core::ffi::c_uint,
+    ) {
+        // SAFETY: By function safety requirements, `con` is valid.
+        let data = unsafe { (*con).data };
+        if data.is_null() {
+            return;
+        }
+
+        // SAFETY: `data` points to a valid `T` per the type invariants.
+        let ops = unsafe { &*(data as *const T) };
+
+        // SAFETY: `s` is valid for `count` bytes.
+        let msg = unsafe { core::slice::from_raw_parts(s, count as usize) };
+
+        ops.write(msg);
+    }
+
+    /// Setup callback for the console.
+    ///
+    /// # Safety
+    ///
+    /// `con` must be a valid pointer to a `bindings::console`.
+    unsafe extern "C" fn setup_callback(
+        con: *mut bindings::console,
+        options: *mut u8,
+    ) -> core::ffi::c_int {
+        // SAFETY: By function safety requirements, `con` is valid.
+        let data = unsafe { (*con).data };
+        if data.is_null() {
+            return 0;
+        }
+
+        // SAFETY: `data` points to a valid `T` per the type invariants.
+        let ops = unsafe { &*(data as *const T) };
+
+        let options_cstr = if options.is_null() {
+            None
+        } else {
+            // SAFETY: If not null, `options` points to a null-terminated string.
+            Some(unsafe { CStr::from_char_ptr(options.cast()) })
+        };
+
+        match ops.setup(options_cstr) {
+            Ok(()) => 0,
+            Err(e) => e.to_errno(),
+        }
+    }
+}
+
+/// A registered kernel console.
+///
+/// This struct wraps the kernel's `struct console` and provides safe
+/// registration and unregistration of console drivers.
+///
+/// # Invariants
+///
+/// - `inner` contains a valid `console` structure.
+/// - When registered, the console's `data` field points to valid `T`.
+#[pin_data(PinnedDrop)]
+pub struct Console<T: ConsoleOps> {
+    #[pin]
+    inner: Opaque<bindings::console>,
+    #[pin]
+    data: T,
+    registered: bool,
+}
+
+// SAFETY: Console can be sent between threads if T can.
+unsafe impl<T: ConsoleOps + Send> Send for Console<T> {}
+
+// SAFETY: Console operations are synchronized by the caller.
+unsafe impl<T: ConsoleOps + Sync> Sync for Console<T> {}
+
+impl<T: ConsoleOps> Console<T> {
+    /// Creates an initializer for registering a new console.
+    ///
+    /// # Arguments
+    ///
+    /// * `name` - The name of the console (up to 15 characters).
+    /// * `flags` - Console flags from the `flags` module.
+    /// * `data` - The console operations implementation.
+    pub fn register(
+        name: &'static CStr,
+        console_flags: u16,
+        data: impl PinInit<T, Error>,
+    ) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            inner <- Opaque::try_ffi_init(|slot: *mut bindings::console| {
+                // SAFETY: `slot` is valid for writing.
+                unsafe {
+                    // Zero-initialize the struct.
+                    core::ptr::write_bytes(slot, 0, 1);
+
+                    // Copy the name (up to 15 chars + null).
+                    let name_bytes = name.to_bytes();
+                    let name_len = core::cmp::min(name_bytes.len(), 15);
+                    core::ptr::copy_nonoverlapping(
+                        name_bytes.as_ptr().cast(),
+                        (*slot).name.as_mut_ptr(),
+                        name_len,
+                    );
+
+                    // Set flags.
+                    (*slot).flags = console_flags as i16;
+
+                    // Set the write callback.
+                    (*slot).write = Some(ConsoleOpsAdapter::<T>::write_callback);
+
+                    // Set the setup callback if T implements it.
+                    if T::HAS_SETUP {
+                        (*slot).setup = Some(ConsoleOpsAdapter::<T>::setup_callback);
+                    }
+                }
+                Ok::<(), Error>(())
+            }),
+            data <- data,
+            registered: true,  // Will be set after registration in pin_chain
+        })
+        .pin_chain(|this| {
+            // Set the data pointer to our ops.
+            // SAFETY: `this` is pinned and valid.
+            unsafe {
+                let con = this.inner.get();
+                (*con).data = &this.data as *const T as *mut core::ffi::c_void;
+            }
+
+            // Register the console.
+            // SAFETY: The console structure is properly initialized.
+            unsafe { bindings::register_console(this.inner.get()) };
+
+            Ok(())
+        })
+    }
+
+    /// Returns whether the console is currently registered.
+    pub fn is_registered(&self) -> bool {
+        self.registered
+    }
+
+    /// Returns a pointer to the underlying console struct.
+    pub fn as_ptr(&self) -> *mut bindings::console {
+        self.inner.get()
+    }
+
+    /// Returns a reference to the console data.
+    pub fn data(&self) -> &T {
+        &self.data
+    }
+}
+
+#[pinned_drop]
+impl<T: ConsoleOps> PinnedDrop for Console<T> {
+    fn drop(self: Pin<&mut Self>) {
+        if self.registered {
+            // SAFETY: The console was registered during initialization.
+            unsafe { bindings::unregister_console(self.inner.get()) };
+        }
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3da92f18f4ee..6381225cbe9c 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -78,6 +78,7 @@
 pub mod clk;
 #[cfg(CONFIG_CONFIGFS_FS)]
 pub mod configfs;
+pub mod console;
 pub mod cpu;
 #[cfg(CONFIG_CPU_FREQ)]
 pub mod cpufreq;
-- 
2.52.0

