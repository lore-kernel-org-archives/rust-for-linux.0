Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD1218E0C
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Nov 2023 18:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3YrywKWG"
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E6C3119
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Nov 2023 11:02:24 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a7c97d5d5aso1403077b3.3
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Nov 2023 11:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698861743; x=1699466543; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i/6XZfo1xt29cN1naYzGKiL8MPrRh+1U9L/srRftA7U=;
        b=3YrywKWGyYmXrknlbPpezb3RIrA5WjlJNYjBnWXF2JFRaQ0nYrxVVLfV8ns3xB+4Q/
         W/sbaYfN61KLCSbTXcMUK1PiszvLX1WaaMc1iZfML8hfJ5sQMVApI0JYb7CD1N1wtO3S
         FjA35e1fCkRxhrchRnFEayCR2n96Fekp6GEiL4znrizXjlP7hLrnauro/WJFYC3B8uj5
         qlbypJu2fiUlP4g4+/NB6odigQ5DYdzMF89v747ojKvwLgc0BP0v5J6GQrHca8WzXPRN
         4fhIRyguYFRJOXzoZE8aoaKAnl0qMAlzYjk5sJwKLtJ++8qok7fXBuhjSGZiWNnbnG4G
         shzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698861743; x=1699466543;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/6XZfo1xt29cN1naYzGKiL8MPrRh+1U9L/srRftA7U=;
        b=mLWFmIMJ5NX6aqbD4lO+Cmsy9chVBALCgxSNA+nWqpWTMwc98BFT9zve04jhkuv6ec
         O++u+8BjjIIwBv2kZVZ/1HN1bRI5JoMHHGnsVjFNNzAZE2w5oZ9afPjvfWzmEvxp0aKx
         yYF/s8Y37WUGUKOuLuKJOHcF83aGjDSc/PLR7eO21lu5JOXgoP2rvNYzlRNBVXZ1uq8w
         RC3OQEJnKVf1A/07POkFcrhw+TJYMyYkiSB81BvN4OM8WUxemDiMi+8fwrP9LW9q4GxW
         PAYzhf/JErHSGcec5L/lvWMxby5z0cYZjbSUKMp3ntle/nhpr4b+/e3+jfhdyz7XYgI0
         t+Iw==
X-Gm-Message-State: AOJu0YxByRxYUUCera0NsMfLYjzH5EgGUuTjYy1daPAr/BIE6iUwm6gE
	opw2idmCXG2xLL3AebEFLFtW738lJDOjop0=
X-Google-Smtp-Source: AGHT+IGqn74LjGR/sVJ+qbXwXxOttmhUAfZDP6KBl1T1M4PcxndATg7rg5w83LFZHG39m2MvHB/X4Bepxn6n6eY=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:9392:0:b0:da0:cbe9:6bac with SMTP id
 a18-20020a259392000000b00da0cbe96bacmr335247ybm.11.1698861743329; Wed, 01 Nov
 2023 11:02:23 -0700 (PDT)
Date: Wed, 01 Nov 2023 18:01:33 +0000
In-Reply-To: <20231101-rust-binder-v1-0-08ba9197f637@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231101-rust-binder-v1-0-08ba9197f637@google.com>
X-Mailer: b4 0.13-dev-26615
Message-ID: <20231101-rust-binder-v1-3-08ba9197f637@google.com>
Subject: [PATCH RFC 03/20] rust_binder: add threading support
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Matt Gilbride <mattgilbride@google.com>, 
	Jeffrey Vander Stoep <jeffv@google.com>, Matthew Maurer <mmaurer@google.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The binder driver needs to keep track of the threads that a process
uses with the driver for several reasons:

 1. When replying to a transaction, it is assumed that you are replying
    to the "currently active transaction" on the thread you made the
    syscall from. The syscall does not provide any way to specify which
    transaction you are replying to.

 2. When a thread is sleeping while waiting for incoming transactions,
    the driver needs to keep track of where it can deliver a transaction
    to.

 3. The BINDER_GET_EXTENDED_ERROR ioctl gives you the last error
    triggered by a syscall on the same thread, so it needs to keep track
    of this value for each thread.

 4. For binder servers, the driver keeps track of whether a process has
    enough threads in its transaction thread pool.

Note that not all of the above items are implemented yet. Some of them
will appear in later patches.

In this patch, we add the structures to keep track of the threads and
implement item 3 and 4 in the above list.

Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Co-developed-by: Matt Gilbride <mattgilbride@google.com>
Signed-off-by: Matt Gilbride <mattgilbride@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/defs.rs        |  36 ++++++-
 drivers/android/error.rs       |  52 +++++++++++
 drivers/android/process.rs     | 108 +++++++++++++++++++--
 drivers/android/rust_binder.rs |   2 +
 drivers/android/thread.rs      | 206 +++++++++++++++++++++++++++++++++++++++++
 scripts/Makefile.build         |   2 +-
 6 files changed, 396 insertions(+), 10 deletions(-)

diff --git a/drivers/android/defs.rs b/drivers/android/defs.rs
index 8fdcb856ccad..86173add2616 100644
--- a/drivers/android/defs.rs
+++ b/drivers/android/defs.rs
@@ -2,24 +2,50 @@
 
 use core::ops::{Deref, DerefMut};
 use kernel::{
-    bindings,
+    bindings::{self, *},
     io_buffer::{ReadableFromBytes, WritableToBytes},
 };
 
+macro_rules! pub_no_prefix {
+    ($prefix:ident, $($newname:ident),+) => {
+        $(pub(crate) const $newname: u32 = kernel::macros::concat_idents!($prefix, $newname);)+
+    };
+}
+
+pub_no_prefix!(
+    binder_driver_return_protocol_,
+    BR_DEAD_REPLY,
+    BR_FAILED_REPLY,
+    BR_NOOP,
+    BR_SPAWN_LOOPER,
+    BR_TRANSACTION_COMPLETE,
+    BR_OK
+);
+
+pub_no_prefix!(
+    binder_driver_command_protocol_,
+    BC_ENTER_LOOPER,
+    BC_EXIT_LOOPER,
+    BC_REGISTER_LOOPER
+);
+
 macro_rules! decl_wrapper {
     ($newname:ident, $wrapped:ty) => {
         #[derive(Copy, Clone, Default)]
         #[repr(transparent)]
         pub(crate) struct $newname($wrapped);
+
         // SAFETY: This macro is only used with types where this is ok.
         unsafe impl ReadableFromBytes for $newname {}
         unsafe impl WritableToBytes for $newname {}
+
         impl Deref for $newname {
             type Target = $wrapped;
             fn deref(&self) -> &Self::Target {
                 &self.0
             }
         }
+
         impl DerefMut for $newname {
             fn deref_mut(&mut self) -> &mut Self::Target {
                 &mut self.0
@@ -28,7 +54,9 @@ fn deref_mut(&mut self) -> &mut Self::Target {
     };
 }
 
+decl_wrapper!(BinderWriteRead, bindings::binder_write_read);
 decl_wrapper!(BinderVersion, bindings::binder_version);
+decl_wrapper!(ExtendedError, bindings::binder_extended_error);
 
 impl BinderVersion {
     pub(crate) fn current() -> Self {
@@ -37,3 +65,9 @@ pub(crate) fn current() -> Self {
         })
     }
 }
+
+impl ExtendedError {
+    pub(crate) fn new(id: u32, command: u32, param: i32) -> Self {
+        Self(bindings::binder_extended_error { id, command, param })
+    }
+}
diff --git a/drivers/android/error.rs b/drivers/android/error.rs
new file mode 100644
index 000000000000..41fc4347ab55
--- /dev/null
+++ b/drivers/android/error.rs
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::defs::*;
+
+/// An error that will be returned to userspace via the `BINDER_WRITE_READ` ioctl rather than via
+/// errno.
+pub(crate) struct BinderError {
+    pub(crate) reply: u32,
+    source: Option<Error>,
+}
+
+/// Convert an errno into a `BinderError` and store the errno used to construct it. The errno
+/// should be stored as the thread's extended error when given to userspace.
+impl From<Error> for BinderError {
+    fn from(source: Error) -> Self {
+        Self {
+            reply: BR_FAILED_REPLY,
+            source: Some(source),
+        }
+    }
+}
+
+impl From<core::alloc::AllocError> for BinderError {
+    fn from(_: core::alloc::AllocError) -> Self {
+        Self {
+            reply: BR_FAILED_REPLY,
+            source: Some(ENOMEM),
+        }
+    }
+}
+
+impl core::fmt::Debug for BinderError {
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        match self.reply {
+            BR_FAILED_REPLY => match self.source.as_ref() {
+                Some(source) => f
+                    .debug_struct("BR_FAILED_REPLY")
+                    .field("source", source)
+                    .finish(),
+                None => f.pad("BR_FAILED_REPLY"),
+            },
+            BR_DEAD_REPLY => f.pad("BR_DEAD_REPLY"),
+            BR_TRANSACTION_COMPLETE => f.pad("BR_TRANSACTION_COMPLETE"),
+            _ => f
+                .debug_struct("BinderError")
+                .field("reply", &self.reply)
+                .finish(),
+        }
+    }
+}
diff --git a/drivers/android/process.rs b/drivers/android/process.rs
index 2f16e4cedbf1..47d074dd8465 100644
--- a/drivers/android/process.rs
+++ b/drivers/android/process.rs
@@ -13,11 +13,12 @@
 use kernel::{
     bindings,
     cred::Credential,
-    file::{File, PollTable},
-    io_buffer::IoBufferWriter,
+    file::{self, File, PollTable},
+    io_buffer::{IoBufferReader, IoBufferWriter},
     list::{HasListLinks, ListArc, ListArcSafe, ListItem, ListLinks},
     mm,
     prelude::*,
+    rbtree::RBTree,
     sync::{Arc, ArcBorrow, SpinLock},
     task::Task,
     types::ARef,
@@ -25,7 +26,9 @@
     workqueue::{self, Work},
 };
 
-use crate::{context::Context, defs::*};
+use crate::{context::Context, defs::*, thread::Thread};
+
+use core::mem::take;
 
 const PROC_DEFER_FLUSH: u8 = 1;
 const PROC_DEFER_RELEASE: u8 = 2;
@@ -33,6 +36,14 @@
 /// The fields of `Process` protected by the spinlock.
 pub(crate) struct ProcessInner {
     is_dead: bool,
+    threads: RBTree<i32, Arc<Thread>>,
+
+    /// The number of requested threads that haven't registered yet.
+    requested_thread_count: u32,
+    /// The maximum number of threads used by the process thread pool.
+    max_threads: u32,
+    /// The number of threads the started and registered with the thread pool.
+    started_thread_count: u32,
 
     /// Bitmap of deferred work to do.
     defer_work: u8,
@@ -42,9 +53,23 @@ impl ProcessInner {
     fn new() -> Self {
         Self {
             is_dead: false,
+            threads: RBTree::new(),
+            requested_thread_count: 0,
+            max_threads: 0,
+            started_thread_count: 0,
             defer_work: 0,
         }
     }
+
+    fn register_thread(&mut self) -> bool {
+        if self.requested_thread_count == 0 {
+            return false;
+        }
+
+        self.requested_thread_count -= 1;
+        self.started_thread_count += 1;
+        true
+    }
 }
 
 /// A process using binder.
@@ -127,10 +152,56 @@ fn new(ctx: Arc<Context>, cred: ARef<Credential>) -> Result<Arc<Self>> {
         Ok(process)
     }
 
+    fn get_thread(self: ArcBorrow<'_, Self>, id: i32) -> Result<Arc<Thread>> {
+        {
+            let inner = self.inner.lock();
+            if let Some(thread) = inner.threads.get(&id) {
+                return Ok(thread.clone());
+            }
+        }
+
+        // Allocate a new `Thread` without holding any locks.
+        let ta = Thread::new(id, self.into())?;
+        let node = RBTree::try_allocate_node(id, ta.clone())?;
+
+        let mut inner = self.inner.lock();
+
+        // Recheck. It's possible the thread was created while we were not holding the lock.
+        if let Some(thread) = inner.threads.get(&id) {
+            return Ok(thread.clone());
+        }
+
+        inner.threads.insert(node);
+        Ok(ta)
+    }
+
     fn version(&self, data: UserSlicePtr) -> Result {
         data.writer().write(&BinderVersion::current())
     }
 
+    pub(crate) fn register_thread(&self) -> bool {
+        self.inner.lock().register_thread()
+    }
+
+    fn remove_thread(&self, thread: Arc<Thread>) {
+        self.inner.lock().threads.remove(&thread.id);
+        thread.release();
+    }
+
+    fn set_max_threads(&self, max: u32) {
+        self.inner.lock().max_threads = max;
+    }
+
+    pub(crate) fn needs_thread(&self) -> bool {
+        let mut inner = self.inner.lock();
+        let ret =
+            inner.requested_thread_count == 0 && inner.started_thread_count < inner.max_threads;
+        if ret {
+            inner.requested_thread_count += 1
+        }
+        ret
+    }
+
     fn deferred_flush(&self) {
         // NOOP for now.
     }
@@ -139,6 +210,17 @@ fn deferred_release(self: Arc<Self>) {
         self.inner.lock().is_dead = true;
 
         self.ctx.deregister_process(&self);
+
+        // Move the threads out of `inner` so that we can iterate over them without holding the
+        // lock.
+        let mut inner = self.inner.lock();
+        let threads = take(&mut inner.threads);
+        drop(inner);
+
+        // Release all threads.
+        for thread in threads.values() {
+            thread.release();
+        }
     }
 
     pub(crate) fn flush(this: ArcBorrow<'_, Process>) -> Result {
@@ -161,22 +243,32 @@ pub(crate) fn flush(this: ArcBorrow<'_, Process>) -> Result {
 /// The ioctl handler.
 impl Process {
     fn write(
-        _this: ArcBorrow<'_, Process>,
+        this: ArcBorrow<'_, Process>,
         _file: &File,
-        _cmd: u32,
-        _reader: &mut UserSlicePtrReader,
+        cmd: u32,
+        reader: &mut UserSlicePtrReader,
     ) -> Result<i32> {
-        Err(EINVAL)
+        let thread = this.get_thread(kernel::current!().pid())?;
+        match cmd {
+            bindings::BINDER_SET_MAX_THREADS => this.set_max_threads(reader.read()?),
+            bindings::BINDER_THREAD_EXIT => this.remove_thread(thread),
+            _ => return Err(EINVAL),
+        }
+        Ok(0)
     }
 
     fn read_write(
         this: ArcBorrow<'_, Process>,
-        _file: &File,
+        file: &File,
         cmd: u32,
         data: UserSlicePtr,
     ) -> Result<i32> {
+        let thread = this.get_thread(kernel::current!().pid())?;
+        let blocking = (file.flags() & file::flags::O_NONBLOCK) == 0;
         match cmd {
+            bindings::BINDER_WRITE_READ => thread.write_read(data, blocking)?,
             bindings::BINDER_VERSION => this.version(data)?,
+            bindings::BINDER_GET_EXTENDED_ERROR => thread.get_extended_error(data)?,
             _ => return Err(EINVAL),
         }
         Ok(0)
diff --git a/drivers/android/rust_binder.rs b/drivers/android/rust_binder.rs
index 6de2f40846fb..64fd24ea8be1 100644
--- a/drivers/android/rust_binder.rs
+++ b/drivers/android/rust_binder.rs
@@ -14,7 +14,9 @@
 
 mod context;
 mod defs;
+mod error;
 mod process;
+mod thread;
 
 module! {
     type: BinderModule,
diff --git a/drivers/android/thread.rs b/drivers/android/thread.rs
new file mode 100644
index 000000000000..593c8e4f184e
--- /dev/null
+++ b/drivers/android/thread.rs
@@ -0,0 +1,206 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! This module defines the `Thread` type, which represents a userspace thread that is using
+//! binder.
+//!
+//! The `Process` object stores all of the threads in an rb tree.
+
+use kernel::{
+    bindings,
+    io_buffer::{IoBufferReader, IoBufferWriter},
+    prelude::*,
+    sync::{Arc, SpinLock},
+    user_ptr::UserSlicePtr,
+};
+
+use crate::{defs::*, process::Process};
+
+use core::mem::size_of;
+
+/// The fields of `Thread` protected by the spinlock.
+struct InnerThread {
+    /// Determines the looper state of the thread. It is a bit-wise combination of the constants
+    /// prefixed with `LOOPER_`.
+    looper_flags: u32,
+
+    /// Determines if thread is dead.
+    is_dead: bool,
+
+    /// Extended error information for this thread.
+    extended_error: ExtendedError,
+}
+
+const LOOPER_REGISTERED: u32 = 0x01;
+const LOOPER_ENTERED: u32 = 0x02;
+const LOOPER_EXITED: u32 = 0x04;
+const LOOPER_INVALID: u32 = 0x08;
+
+impl InnerThread {
+    fn new() -> Self {
+        use core::sync::atomic::{AtomicU32, Ordering};
+
+        fn next_err_id() -> u32 {
+            static EE_ID: AtomicU32 = AtomicU32::new(0);
+            EE_ID.fetch_add(1, Ordering::Relaxed)
+        }
+
+        Self {
+            looper_flags: 0,
+            is_dead: false,
+            extended_error: ExtendedError::new(next_err_id(), BR_OK, 0),
+        }
+    }
+
+    fn looper_enter(&mut self) {
+        self.looper_flags |= LOOPER_ENTERED;
+        if self.looper_flags & LOOPER_REGISTERED != 0 {
+            self.looper_flags |= LOOPER_INVALID;
+        }
+    }
+
+    fn looper_register(&mut self, valid: bool) {
+        self.looper_flags |= LOOPER_REGISTERED;
+        if !valid || self.looper_flags & LOOPER_ENTERED != 0 {
+            self.looper_flags |= LOOPER_INVALID;
+        }
+    }
+
+    fn looper_exit(&mut self) {
+        self.looper_flags |= LOOPER_EXITED;
+    }
+
+    /// Determines whether the thread is part of a pool, i.e., if it is a looper.
+    fn is_looper(&self) -> bool {
+        self.looper_flags & (LOOPER_ENTERED | LOOPER_REGISTERED) != 0
+    }
+}
+
+/// This represents a thread that's used with binder.
+#[pin_data]
+pub(crate) struct Thread {
+    pub(crate) id: i32,
+    pub(crate) process: Arc<Process>,
+    #[pin]
+    inner: SpinLock<InnerThread>,
+}
+
+impl Thread {
+    pub(crate) fn new(id: i32, process: Arc<Process>) -> Result<Arc<Self>> {
+        Arc::pin_init(pin_init!(Thread {
+            id,
+            process,
+            inner <- kernel::new_spinlock!(InnerThread::new(), "Thread::inner"),
+        }))
+    }
+
+    pub(crate) fn get_extended_error(&self, data: UserSlicePtr) -> Result {
+        let mut writer = data.writer();
+        let ee = self.inner.lock().extended_error;
+        writer.write(&ee)?;
+        Ok(())
+    }
+
+    fn write(self: &Arc<Self>, req: &mut BinderWriteRead) -> Result {
+        let write_start = req.write_buffer.wrapping_add(req.write_consumed);
+        let write_len = req.write_size - req.write_consumed;
+        let mut reader = UserSlicePtr::new(write_start as _, write_len as _).reader();
+
+        while reader.len() >= size_of::<u32>() {
+            let before = reader.len();
+            let cmd = reader.read::<u32>()?;
+            match cmd {
+                BC_REGISTER_LOOPER => {
+                    let valid = self.process.register_thread();
+                    self.inner.lock().looper_register(valid);
+                }
+                BC_ENTER_LOOPER => self.inner.lock().looper_enter(),
+                BC_EXIT_LOOPER => self.inner.lock().looper_exit(),
+
+                // Fail if given an unknown error code.
+                // BC_ATTEMPT_ACQUIRE and BC_ACQUIRE_RESULT are no longer supported.
+                _ => return Err(EINVAL),
+            }
+            // Update the number of write bytes consumed.
+            req.write_consumed += (before - reader.len()) as u64;
+        }
+
+        Ok(())
+    }
+
+    fn read(self: &Arc<Self>, req: &mut BinderWriteRead, _wait: bool) -> Result {
+        let read_start = req.read_buffer.wrapping_add(req.read_consumed);
+        let read_len = req.read_size - req.read_consumed;
+        let mut writer = UserSlicePtr::new(read_start as _, read_len as _).writer();
+        let in_pool = self.inner.lock().is_looper();
+
+        // Reserve some room at the beginning of the read buffer so that we can send a
+        // BR_SPAWN_LOOPER if we need to.
+        let mut has_noop_placeholder = false;
+        if req.read_consumed == 0 {
+            if let Err(err) = writer.write(&BR_NOOP) {
+                pr_warn!("Failure when writing BR_NOOP at beginning of buffer.");
+                return Err(err);
+            }
+            has_noop_placeholder = true;
+        }
+
+        // Loop doing work while there is room in the buffer.
+        #[allow(clippy::never_loop)]
+        while writer.len() >= size_of::<bindings::binder_transaction_data_secctx>() + 4 {
+            // There is enough space in the output buffer to process another work item.
+            //
+            // However, we have not yet added work items to the driver, so we immediately break
+            // from the loop.
+            break;
+        }
+
+        req.read_consumed += read_len - writer.len() as u64;
+
+        // Write BR_SPAWN_LOOPER if the process needs more threads for its pool.
+        if has_noop_placeholder && in_pool && self.process.needs_thread() {
+            let mut writer = UserSlicePtr::new(req.read_buffer as _, req.read_size as _).writer();
+            writer.write(&BR_SPAWN_LOOPER)?;
+        }
+        Ok(())
+    }
+
+    pub(crate) fn write_read(self: &Arc<Self>, data: UserSlicePtr, wait: bool) -> Result {
+        let (mut reader, mut writer) = data.reader_writer();
+        let mut req = reader.read::<BinderWriteRead>()?;
+
+        // Go through the write buffer.
+        if req.write_size > 0 {
+            if let Err(err) = self.write(&mut req) {
+                pr_warn!(
+                    "Write failure {:?} in pid:{}",
+                    err,
+                    self.process.task.pid_in_current_ns()
+                );
+                req.read_consumed = 0;
+                writer.write(&req)?;
+                return Err(err);
+            }
+        }
+
+        // Go through the work queue.
+        let mut ret = Ok(());
+        if req.read_size > 0 {
+            ret = self.read(&mut req, wait);
+            if ret.is_err() && ret != Err(EINTR) {
+                pr_warn!(
+                    "Read failure {:?} in pid:{}",
+                    ret,
+                    self.process.task.pid_in_current_ns()
+                );
+            }
+        }
+
+        // Write the request back so that the consumed fields are visible to the caller.
+        writer.write(&req)?;
+        ret
+    }
+
+    pub(crate) fn release(self: &Arc<Self>) {
+        self.inner.lock().is_dead = true;
+    }
+}
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index f78d2e75a795..b388f3d75d49 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -262,7 +262,7 @@ $(obj)/%.lst: $(src)/%.c FORCE
 # Compile Rust sources (.rs)
 # ---------------------------------------------------------------------------
 
-rust_allowed_features := const_maybe_uninit_zeroed,new_uninit,offset_of
+rust_allowed_features := const_maybe_uninit_zeroed,new_uninit,offset_of,allocator_api
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

-- 
2.42.0.820.g83a721a137-goog

