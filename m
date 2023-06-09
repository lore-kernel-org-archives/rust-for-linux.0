Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9328AC7EE37
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:57:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjFIG5E (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234257AbjFIG4j (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:39 -0400
Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC14D30FA
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=69598; q=dns/txt;
  s=iport; t=1686293789; x=1687503389;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U0cwih9PdEnku7LVbzA2s7TgvQaEpoV76vMT83iS2ic=;
  b=Mx8QuN1tXZ+IG065Im96oZFk6rV8upE/ol3+9U9zEStY8UbCYvI251aO
   QT8Ms/3/jxRBadaoxlWGRmvlgP+4eyrferjH6WgV2EnZHIV2YTL54uAGP
   mH2J37pQYS8FkMl7zVrWvswlvXZy7wMLQC7DVLzaj5dP8pmOrDWaYPKAd
   s=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5453674"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:38 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VICx055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:37 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 05/80] rust: kernel: add libraries required by the filesystem abstractions
Date:   Fri,  9 Jun 2023 09:30:03 +0300
Message-Id: <20230609063118.24852-6-amiculas@cisco.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609063118.24852-1-amiculas@cisco.com>
References: <20230609063118.24852-1-amiculas@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-User: amiculas
X-Outbound-SMTP-Client: 10.61.198.236, [10.61.198.236]
X-Outbound-Node: aer-core-5.cisco.com
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Add cred.rs, file.rs, io_buffer.rs, iov_iter.rs, mm.rs, pages.rs and
user_ptr.rs from the rust branch.

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 rust/bindings/bindings_helper.h |   4 +
 rust/helpers.c                  |  35 ++
 rust/kernel/cred.rs             |  46 ++
 rust/kernel/file.rs             | 913 ++++++++++++++++++++++++++++++++
 rust/kernel/io_buffer.rs        | 153 ++++++
 rust/kernel/iov_iter.rs         |  81 +++
 rust/kernel/lib.rs              |  11 +-
 rust/kernel/mm.rs               | 149 ++++++
 rust/kernel/pages.rs            | 144 +++++
 rust/kernel/user_ptr.rs         | 175 ++++++
 10 files changed, 1710 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/cred.rs
 create mode 100644 rust/kernel/file.rs
 create mode 100644 rust/kernel/io_buffer.rs
 create mode 100644 rust/kernel/iov_iter.rs
 create mode 100644 rust/kernel/mm.rs
 create mode 100644 rust/kernel/pages.rs
 create mode 100644 rust/kernel/user_ptr.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 556f2e7c3ddb..b4297f6cb99f 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -12,6 +12,10 @@
 #include <linux/sched.h>
 #include <linux/fs.h>
 #include <linux/fs_parser.h>
+#include <linux/cred.h>
+#include <linux/poll.h>
+#include <linux/uio.h>
+#include <linux/uaccess.h>
 
 /* `bindgen` gets confused at certain things. */
 const gfp_t BINDINGS_GFP_KERNEL = GFP_KERNEL;
diff --git a/rust/helpers.c b/rust/helpers.c
index b042d496649f..ffe62af5ee20 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -27,6 +27,7 @@
 #include <linux/sched/signal.h>
 #include <linux/wait.h>
 #include <linux/fs_parser.h>
+#include <linux/highmem.h>
 
 __noreturn void rust_helper_BUG(void)
 {
@@ -156,6 +157,40 @@ int rust_helper_fs_parse(struct fs_context *fc,
 }
 EXPORT_SYMBOL_GPL(rust_helper_fs_parse);
 
+const struct cred *rust_helper_get_cred(const struct cred *cred)
+{
+	return get_cred(cred);
+}
+EXPORT_SYMBOL_GPL(rust_helper_get_cred);
+
+void rust_helper_put_cred(const struct cred *cred) {
+	put_cred(cred);
+}
+EXPORT_SYMBOL_GPL(rust_helper_put_cred);
+
+struct file *rust_helper_get_file(struct file *f)
+{
+	return get_file(f);
+}
+EXPORT_SYMBOL_GPL(rust_helper_get_file);
+
+unsigned long rust_helper_clear_user(void __user *to, unsigned long n)
+{
+	return clear_user(to, n);
+}
+
+void *rust_helper_kmap(struct page *page)
+{
+	return kmap(page);
+}
+EXPORT_SYMBOL_GPL(rust_helper_kmap);
+
+void rust_helper_kunmap(struct page *page)
+{
+	return kunmap(page);
+}
+EXPORT_SYMBOL_GPL(rust_helper_kunmap);
+
 /*
  * We use `bindgen`'s `--size_t-is-usize` option to bind the C `size_t` type
  * as the Rust `usize` type, so we can use it in contexts where Rust
diff --git a/rust/kernel/cred.rs b/rust/kernel/cred.rs
new file mode 100644
index 000000000000..16bd883b5fb5
--- /dev/null
+++ b/rust/kernel/cred.rs
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Credentials management.
+//!
+//! C header: [`include/linux/cred.h`](../../../../include/linux/cred.h)
+//!
+//! Reference: <https://www.kernel.org/doc/html/latest/security/credentials.html>
+
+use crate::{bindings, types::AlwaysRefCounted};
+use core::cell::UnsafeCell;
+
+/// Wraps the kernel's `struct cred`.
+///
+/// # Invariants
+///
+/// Instances of this type are always ref-counted, that is, a call to `get_cred` ensures that the
+/// allocation remains valid at least until the matching call to `put_cred`.
+#[repr(transparent)]
+pub struct Credential(pub(crate) UnsafeCell<bindings::cred>);
+
+impl Credential {
+    /// Creates a reference to a [`Credential`] from a valid pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid and remains valid for the lifetime of the
+    /// returned [`Credential`] reference.
+    pub(crate) unsafe fn from_ptr<'a>(ptr: *const bindings::cred) -> &'a Self {
+        // SAFETY: The safety requirements guarantee the validity of the dereference, while the
+        // `Credential` type being transparent makes the cast ok.
+        unsafe { &*ptr.cast() }
+    }
+}
+
+// SAFETY: The type invariants guarantee that `Credential` is always ref-counted.
+unsafe impl AlwaysRefCounted for Credential {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference means that the refcount is nonzero.
+        unsafe { bindings::get_cred(self.0.get()) };
+    }
+
+    unsafe fn dec_ref(obj: core::ptr::NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is nonzero.
+        unsafe { bindings::put_cred(obj.cast().as_ptr()) };
+    }
+}
diff --git a/rust/kernel/file.rs b/rust/kernel/file.rs
new file mode 100644
index 000000000000..1b5934838833
--- /dev/null
+++ b/rust/kernel/file.rs
@@ -0,0 +1,913 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Files and file descriptors.
+//!
+//! C headers: [`include/linux/fs.h`](../../../../include/linux/fs.h) and
+//! [`include/linux/file.h`](../../../../include/linux/file.h)
+
+use crate::{
+    bindings,
+    cred::Credential,
+    error::{code::*, from_kernel_result, Error, Result},
+    fs,
+    io_buffer::{IoBufferReader, IoBufferWriter},
+    iov_iter::IovIter,
+    mm,
+    sync::CondVar,
+    types::ForeignOwnable,
+    user_ptr::{UserSlicePtr, UserSlicePtrReader, UserSlicePtrWriter},
+    types::ARef, types::AlwaysRefCounted,
+};
+use core::convert::{TryFrom, TryInto};
+use core::{cell::UnsafeCell, marker, mem, ptr};
+use macros::vtable;
+
+/// Flags associated with a [`File`].
+pub mod flags {
+    /// File is opened in append mode.
+    pub const O_APPEND: u32 = bindings::O_APPEND;
+
+    /// Signal-driven I/O is enabled.
+    pub const O_ASYNC: u32 = bindings::FASYNC;
+
+    /// Close-on-exec flag is set.
+    pub const O_CLOEXEC: u32 = bindings::O_CLOEXEC;
+
+    /// File was created if it didn't already exist.
+    pub const O_CREAT: u32 = bindings::O_CREAT;
+
+    /// Direct I/O is enabled for this file.
+    pub const O_DIRECT: u32 = bindings::O_DIRECT;
+
+    /// File must be a directory.
+    pub const O_DIRECTORY: u32 = bindings::O_DIRECTORY;
+
+    /// Like [`O_SYNC`] except metadata is not synced.
+    pub const O_DSYNC: u32 = bindings::O_DSYNC;
+
+    /// Ensure that this file is created with the `open(2)` call.
+    pub const O_EXCL: u32 = bindings::O_EXCL;
+
+    /// Large file size enabled (`off64_t` over `off_t`)
+    pub const O_LARGEFILE: u32 = bindings::O_LARGEFILE;
+
+    /// Do not update the file last access time.
+    pub const O_NOATIME: u32 = bindings::O_NOATIME;
+
+    /// File should not be used as process's controlling terminal.
+    pub const O_NOCTTY: u32 = bindings::O_NOCTTY;
+
+    /// If basename of path is a symbolic link, fail open.
+    pub const O_NOFOLLOW: u32 = bindings::O_NOFOLLOW;
+
+    /// File is using nonblocking I/O.
+    pub const O_NONBLOCK: u32 = bindings::O_NONBLOCK;
+
+    /// Also known as `O_NDELAY`.
+    ///
+    /// This is effectively the same flag as [`O_NONBLOCK`] on all architectures
+    /// except SPARC64.
+    pub const O_NDELAY: u32 = bindings::O_NDELAY;
+
+    /// Used to obtain a path file descriptor.
+    pub const O_PATH: u32 = bindings::O_PATH;
+
+    /// Write operations on this file will flush data and metadata.
+    pub const O_SYNC: u32 = bindings::O_SYNC;
+
+    /// This file is an unnamed temporary regular file.
+    pub const O_TMPFILE: u32 = bindings::O_TMPFILE;
+
+    /// File should be truncated to length 0.
+    pub const O_TRUNC: u32 = bindings::O_TRUNC;
+
+    /// Bitmask for access mode flags.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::file;
+    /// # fn do_something() {}
+    /// # let flags = 0;
+    /// if (flags & file::flags::O_ACCMODE) == file::flags::O_RDONLY {
+    ///     do_something();
+    /// }
+    /// ```
+    pub const O_ACCMODE: u32 = bindings::O_ACCMODE;
+
+    /// File is read only.
+    pub const O_RDONLY: u32 = bindings::O_RDONLY;
+
+    /// File is write only.
+    pub const O_WRONLY: u32 = bindings::O_WRONLY;
+
+    /// File can be both read and written.
+    pub const O_RDWR: u32 = bindings::O_RDWR;
+}
+
+/// Wraps the kernel's `struct file`.
+///
+/// # Invariants
+///
+/// Instances of this type are always ref-counted, that is, a call to `get_file` ensures that the
+/// allocation remains valid at least until the matching call to `fput`.
+#[repr(transparent)]
+pub struct File(pub(crate) UnsafeCell<bindings::file>);
+
+// TODO: Accessing fields of `struct file` through the pointer is UB because other threads may be
+// writing to them. However, this is how the C code currently operates: naked reads and writes to
+// fields. Even if we used relaxed atomics on the Rust side, we can't force this on the C side.
+impl File {
+    /// Constructs a new [`struct file`] wrapper from a file descriptor.
+    ///
+    /// The file descriptor belongs to the current process.
+    pub fn from_fd(fd: u32) -> Result<ARef<Self>> {
+        // SAFETY: FFI call, there are no requirements on `fd`.
+        let ptr = ptr::NonNull::new(unsafe { bindings::fget(fd) }).ok_or(EBADF)?;
+
+        // SAFETY: `fget` increments the refcount before returning.
+        Ok(unsafe { ARef::from_raw(ptr.cast()) })
+    }
+
+    /// Creates a reference to a [`File`] from a valid pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid and remains valid for the lifetime of the
+    /// returned [`File`] instance.
+    pub(crate) unsafe fn from_ptr<'a>(ptr: *const bindings::file) -> &'a File {
+        // SAFETY: The safety requirements guarantee the validity of the dereference, while the
+        // `File` type being transparent makes the cast ok.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Returns the current seek/cursor/pointer position (`struct file::f_pos`).
+    pub fn pos(&self) -> u64 {
+        // SAFETY: The file is valid because the shared reference guarantees a nonzero refcount.
+        unsafe { core::ptr::addr_of!((*self.0.get()).f_pos).read() as _ }
+    }
+
+    /// Returns the credentials of the task that originally opened the file.
+    pub fn cred(&self) -> &Credential {
+        // SAFETY: The file is valid because the shared reference guarantees a nonzero refcount.
+        let ptr = unsafe { core::ptr::addr_of!((*self.0.get()).f_cred).read() };
+        // SAFETY: The lifetimes of `self` and `Credential` are tied, so it is guaranteed that
+        // the credential pointer remains valid (because the file is still alive, and it doesn't
+        // change over the lifetime of a file).
+        unsafe { Credential::from_ptr(ptr) }
+    }
+
+    /// Returns the flags associated with the file.
+    ///
+    /// The flags are a combination of the constants in [`flags`].
+    pub fn flags(&self) -> u32 {
+        // SAFETY: The file is valid because the shared reference guarantees a nonzero refcount.
+        unsafe { core::ptr::addr_of!((*self.0.get()).f_flags).read() }
+    }
+
+    /// Returns the inode associated with the file.
+    ///
+    /// It returns `None` is the type of the inode is not `T`.
+    pub fn inode<T: fs::Type + ?Sized>(&self) -> Option<&fs::INode<T>> {
+        // SAFETY: The file is valid because the shared reference guarantees a nonzero refcount.
+        let inode = unsafe { core::ptr::addr_of!((*self.0.get()).f_inode).read() };
+
+        // SAFETY: The inode and superblock are valid because the file as a reference to them.
+        let sb_ops = unsafe { (*(*inode).i_sb).s_op };
+
+        if sb_ops == &fs::Tables::<T>::SUPER_BLOCK {
+            // SAFETY: We checked that the super-block operations table is the one produced for
+            // `T`, so it's safe to cast the inode. Additionally, the lifetime of the returned
+            // inode is bound to the file object.
+            Some(unsafe { &*inode.cast() })
+        } else {
+            None
+        }
+    }
+}
+
+// SAFETY: The type invariants guarantee that `File` is always ref-counted.
+unsafe impl AlwaysRefCounted for File {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference means that the refcount is nonzero.
+        unsafe { bindings::get_file(self.0.get()) };
+    }
+
+    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is nonzero.
+        unsafe { bindings::fput(obj.cast().as_ptr()) }
+    }
+}
+
+/// A file descriptor reservation.
+///
+/// This allows the creation of a file descriptor in two steps: first, we reserve a slot for it,
+/// then we commit or drop the reservation. The first step may fail (e.g., the current process ran
+/// out of available slots), but commit and drop never fail (and are mutually exclusive).
+pub struct FileDescriptorReservation {
+    fd: u32,
+}
+
+impl FileDescriptorReservation {
+    /// Creates a new file descriptor reservation.
+    pub fn new(flags: u32) -> Result<Self> {
+        // SAFETY: FFI call, there are no safety requirements on `flags`.
+        let fd = unsafe { bindings::get_unused_fd_flags(flags) };
+        if fd < 0 {
+            return Err(Error::from_kernel_errno(fd));
+        }
+        Ok(Self { fd: fd as _ })
+    }
+
+    /// Returns the file descriptor number that was reserved.
+    pub fn reserved_fd(&self) -> u32 {
+        self.fd
+    }
+
+    /// Commits the reservation.
+    ///
+    /// The previously reserved file descriptor is bound to `file`.
+    pub fn commit(self, file: ARef<File>) {
+        // SAFETY: `self.fd` was previously returned by `get_unused_fd_flags`, and `file.ptr` is
+        // guaranteed to have an owned ref count by its type invariants.
+        unsafe { bindings::fd_install(self.fd, file.0.get()) };
+
+        // `fd_install` consumes both the file descriptor and the file reference, so we cannot run
+        // the destructors.
+        core::mem::forget(self);
+        core::mem::forget(file);
+    }
+}
+
+impl Drop for FileDescriptorReservation {
+    fn drop(&mut self) {
+        // SAFETY: `self.fd` was returned by a previous call to `get_unused_fd_flags`.
+        unsafe { bindings::put_unused_fd(self.fd) };
+    }
+}
+
+/// Wraps the kernel's `struct poll_table_struct`.
+///
+/// # Invariants
+///
+/// The pointer `PollTable::ptr` is null or valid.
+pub struct PollTable {
+    ptr: *mut bindings::poll_table_struct,
+}
+
+impl PollTable {
+    /// Constructors a new `struct poll_table_struct` wrapper.
+    ///
+    /// # Safety
+    ///
+    /// The pointer `ptr` must be either null or a valid pointer for the lifetime of the object.
+    unsafe fn from_ptr(ptr: *mut bindings::poll_table_struct) -> Self {
+        Self { ptr }
+    }
+
+    /// Associates the given file and condition variable to this poll table. It means notifying the
+    /// condition variable will notify the poll table as well; additionally, the association
+    /// between the condition variable and the file will automatically be undone by the kernel when
+    /// the file is destructed. To unilaterally remove the association before then, one can call
+    /// [`CondVar::free_waiters`].
+    ///
+    /// # Safety
+    ///
+    /// If the condition variable is destroyed before the file, then [`CondVar::free_waiters`] must
+    /// be called to ensure that all waiters are flushed out.
+    pub unsafe fn register_wait<'a>(&self, file: &'a File, cv: &'a CondVar) {
+        if self.ptr.is_null() {
+            return;
+        }
+
+        // SAFETY: `PollTable::ptr` is guaranteed to be valid by the type invariants and the null
+        // check above.
+        let table = unsafe { &*self.ptr };
+        if let Some(proc) = table._qproc {
+            // SAFETY: All pointers are known to be valid.
+            unsafe { proc(file.0.get() as _, cv.wait_list.get(), self.ptr) }
+        }
+    }
+}
+
+/// Equivalent to [`std::io::SeekFrom`].
+///
+/// [`std::io::SeekFrom`]: https://doc.rust-lang.org/std/io/enum.SeekFrom.html
+pub enum SeekFrom {
+    /// Equivalent to C's `SEEK_SET`.
+    Start(u64),
+
+    /// Equivalent to C's `SEEK_END`.
+    End(i64),
+
+    /// Equivalent to C's `SEEK_CUR`.
+    Current(i64),
+}
+
+pub(crate) struct OperationsVtable<A, T>(marker::PhantomData<A>, marker::PhantomData<T>);
+
+impl<A: OpenAdapter<T::OpenData>, T: Operations> OperationsVtable<A, T> {
+    /// Called by the VFS when an inode should be opened.
+    ///
+    /// Calls `T::open` on the returned value of `A::convert`.
+    ///
+    /// # Safety
+    ///
+    /// The returned value of `A::convert` must be a valid non-null pointer and
+    /// `T:open` must return a valid non-null pointer on an `Ok` result.
+    unsafe extern "C" fn open_callback(
+        inode: *mut bindings::inode,
+        file: *mut bindings::file,
+    ) -> core::ffi::c_int {
+        from_kernel_result! {
+            // SAFETY: `A::convert` must return a valid non-null pointer that
+            // should point to data in the inode or file that lives longer
+            // than the following use of `T::open`.
+            let arg = unsafe { A::convert(inode, file) };
+            // SAFETY: The C contract guarantees that `file` is valid. Additionally,
+            // `fileref` never outlives this function, so it is guaranteed to be
+            // valid.
+            let fileref = unsafe { File::from_ptr(file) };
+            // SAFETY: `arg` was previously returned by `A::convert` and must
+            // be a valid non-null pointer.
+            let ptr = T::open(unsafe { &*arg }, fileref)?.into_pointer();
+            // SAFETY: The C contract guarantees that `private_data` is available
+            // for implementers of the file operations (no other C code accesses
+            // it), so we know that there are no concurrent threads/CPUs accessing
+            // it (it's not visible to any other Rust code).
+            unsafe { (*file).private_data = ptr as *mut core::ffi::c_void };
+            Ok(0)
+        }
+    }
+
+    unsafe extern "C" fn read_callback(
+        file: *mut bindings::file,
+        buf: *mut core::ffi::c_char,
+        len: core::ffi::c_size_t,
+        offset: *mut bindings::loff_t,
+    ) -> core::ffi::c_ssize_t {
+        from_kernel_result! {
+            let mut data = unsafe { UserSlicePtr::new(buf as *mut core::ffi::c_void, len).writer() };
+            // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
+            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `release` callback, which the C API guarantees that will be called only when all
+            // references to `file` have been released, so we know it can't be called while this
+            // function is running.
+            let f = unsafe { T::Data::borrow((*file).private_data) };
+            // No `FMODE_UNSIGNED_OFFSET` support, so `offset` must be in [0, 2^63).
+            // See discussion in https://github.com/fishinabarrel/linux-kernel-module-rust/pull/113
+            let read = T::read(
+                f,
+                unsafe { File::from_ptr(file) },
+                &mut data,
+                unsafe { *offset }.try_into()?,
+            )?;
+            unsafe { (*offset) += bindings::loff_t::try_from(read).unwrap() };
+            Ok(read as _)
+        }
+    }
+
+    unsafe extern "C" fn read_iter_callback(
+        iocb: *mut bindings::kiocb,
+        raw_iter: *mut bindings::iov_iter,
+    ) -> isize {
+        from_kernel_result! {
+            let mut iter = unsafe { IovIter::from_ptr(raw_iter) };
+            let file = unsafe { (*iocb).ki_filp };
+            let offset = unsafe { (*iocb).ki_pos };
+            // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
+            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `release` callback, which the C API guarantees that will be called only when all
+            // references to `file` have been released, so we know it can't be called while this
+            // function is running.
+            let f = unsafe { T::Data::borrow((*file).private_data) };
+            let read =
+                T::read(f, unsafe { File::from_ptr(file) }, &mut iter, offset.try_into()?)?;
+            unsafe { (*iocb).ki_pos += bindings::loff_t::try_from(read).unwrap() };
+            Ok(read as _)
+        }
+    }
+
+    unsafe extern "C" fn write_callback(
+        file: *mut bindings::file,
+        buf: *const core::ffi::c_char,
+        len: core::ffi::c_size_t,
+        offset: *mut bindings::loff_t,
+    ) -> core::ffi::c_ssize_t {
+        from_kernel_result! {
+            let mut data = unsafe { UserSlicePtr::new(buf as *mut core::ffi::c_void, len).reader() };
+            // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
+            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `release` callback, which the C API guarantees that will be called only when all
+            // references to `file` have been released, so we know it can't be called while this
+            // function is running.
+            let f = unsafe { T::Data::borrow((*file).private_data) };
+            // No `FMODE_UNSIGNED_OFFSET` support, so `offset` must be in [0, 2^63).
+            // See discussion in https://github.com/fishinabarrel/linux-kernel-module-rust/pull/113
+            let written = T::write(
+                f,
+                unsafe { File::from_ptr(file) },
+                &mut data,
+                unsafe { *offset }.try_into()?
+            )?;
+            unsafe { (*offset) += bindings::loff_t::try_from(written).unwrap() };
+            Ok(written as _)
+        }
+    }
+
+    unsafe extern "C" fn write_iter_callback(
+        iocb: *mut bindings::kiocb,
+        raw_iter: *mut bindings::iov_iter,
+    ) -> isize {
+        from_kernel_result! {
+            let mut iter = unsafe { IovIter::from_ptr(raw_iter) };
+            let file = unsafe { (*iocb).ki_filp };
+            let offset = unsafe { (*iocb).ki_pos };
+            // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
+            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `release` callback, which the C API guarantees that will be called only when all
+            // references to `file` have been released, so we know it can't be called while this
+            // function is running.
+            let f = unsafe { T::Data::borrow((*file).private_data) };
+            let written =
+                T::write(f, unsafe { File::from_ptr(file) }, &mut iter, offset.try_into()?)?;
+            unsafe { (*iocb).ki_pos += bindings::loff_t::try_from(written).unwrap() };
+            Ok(written as _)
+        }
+    }
+
+    unsafe extern "C" fn release_callback(
+        _inode: *mut bindings::inode,
+        file: *mut bindings::file,
+    ) -> core::ffi::c_int {
+        let ptr = mem::replace(unsafe { &mut (*file).private_data }, ptr::null_mut());
+        T::release(unsafe { T::Data::from_pointer(ptr as _) }, unsafe {
+            File::from_ptr(file)
+        });
+        0
+    }
+
+    unsafe extern "C" fn llseek_callback(
+        file: *mut bindings::file,
+        offset: bindings::loff_t,
+        whence: core::ffi::c_int,
+    ) -> bindings::loff_t {
+        from_kernel_result! {
+            let off = match whence as u32 {
+                bindings::SEEK_SET => SeekFrom::Start(offset.try_into()?),
+                bindings::SEEK_CUR => SeekFrom::Current(offset),
+                bindings::SEEK_END => SeekFrom::End(offset),
+                _ => return Err(EINVAL),
+            };
+            // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
+            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `release` callback, which the C API guarantees that will be called only when all
+            // references to `file` have been released, so we know it can't be called while this
+            // function is running.
+            let f = unsafe { T::Data::borrow((*file).private_data) };
+            let off = T::seek(f, unsafe { File::from_ptr(file) }, off)?;
+            Ok(off as bindings::loff_t)
+        }
+    }
+
+    unsafe extern "C" fn unlocked_ioctl_callback(
+        file: *mut bindings::file,
+        cmd: core::ffi::c_uint,
+        arg: core::ffi::c_ulong,
+    ) -> core::ffi::c_long {
+        from_kernel_result! {
+            // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
+            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `release` callback, which the C API guarantees that will be called only when all
+            // references to `file` have been released, so we know it can't be called while this
+            // function is running.
+            let f = unsafe { T::Data::borrow((*file).private_data) };
+            let mut cmd = IoctlCommand::new(cmd as _, arg as _);
+            let ret = T::ioctl(f, unsafe { File::from_ptr(file) }, &mut cmd)?;
+            Ok(ret as _)
+        }
+    }
+
+    unsafe extern "C" fn compat_ioctl_callback(
+        file: *mut bindings::file,
+        cmd: core::ffi::c_uint,
+        arg: core::ffi::c_ulong,
+    ) -> core::ffi::c_long {
+        from_kernel_result! {
+            // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
+            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `release` callback, which the C API guarantees that will be called only when all
+            // references to `file` have been released, so we know it can't be called while this
+            // function is running.
+            let f = unsafe { T::Data::borrow((*file).private_data) };
+            let mut cmd = IoctlCommand::new(cmd as _, arg as _);
+            let ret = T::compat_ioctl(f, unsafe { File::from_ptr(file) }, &mut cmd)?;
+            Ok(ret as _)
+        }
+    }
+
+    unsafe extern "C" fn mmap_callback(
+        file: *mut bindings::file,
+        vma: *mut bindings::vm_area_struct,
+    ) -> core::ffi::c_int {
+        from_kernel_result! {
+            // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
+            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `release` callback, which the C API guarantees that will be called only when all
+            // references to `file` have been released, so we know it can't be called while this
+            // function is running.
+            let f = unsafe { T::Data::borrow((*file).private_data) };
+
+            // SAFETY: The C API guarantees that `vma` is valid for the duration of this call.
+            // `area` only lives within this call, so it is guaranteed to be valid.
+            let mut area = unsafe { mm::virt::Area::from_ptr(vma) };
+
+            // SAFETY: The C API guarantees that `file` is valid for the duration of this call,
+            // which is longer than the lifetime of the file reference.
+            T::mmap(f, unsafe { File::from_ptr(file) }, &mut area)?;
+            Ok(0)
+        }
+    }
+
+    unsafe extern "C" fn fsync_callback(
+        file: *mut bindings::file,
+        start: bindings::loff_t,
+        end: bindings::loff_t,
+        datasync: core::ffi::c_int,
+    ) -> core::ffi::c_int {
+        from_kernel_result! {
+            let start = start.try_into()?;
+            let end = end.try_into()?;
+            let datasync = datasync != 0;
+            // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
+            // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the
+            // `release` callback, which the C API guarantees that will be called only when all
+            // references to `file` have been released, so we know it can't be called while this
+            // function is running.
+            let f = unsafe { T::Data::borrow((*file).private_data) };
+            let res = T::fsync(f, unsafe { File::from_ptr(file) }, start, end, datasync)?;
+            Ok(res.try_into().unwrap())
+        }
+    }
+
+    unsafe extern "C" fn poll_callback(
+        file: *mut bindings::file,
+        wait: *mut bindings::poll_table_struct,
+    ) -> bindings::__poll_t {
+        // SAFETY: `private_data` was initialised by `open_callback` with a value returned by
+        // `T::Data::into_pointer`. `T::Data::from_pointer` is only called by the `release`
+        // callback, which the C API guarantees that will be called only when all references to
+        // `file` have been released, so we know it can't be called while this function is running.
+        let f = unsafe { T::Data::borrow((*file).private_data) };
+        match T::poll(f, unsafe { File::from_ptr(file) }, unsafe {
+            &PollTable::from_ptr(wait)
+        }) {
+            Ok(v) => v,
+            Err(_) => bindings::POLLERR,
+        }
+    }
+
+    const VTABLE: bindings::file_operations = bindings::file_operations {
+        open: Some(Self::open_callback),
+        release: Some(Self::release_callback),
+        read: if T::HAS_READ {
+            Some(Self::read_callback)
+        } else {
+            None
+        },
+        write: if T::HAS_WRITE {
+            Some(Self::write_callback)
+        } else {
+            None
+        },
+        llseek: if T::HAS_SEEK {
+            Some(Self::llseek_callback)
+        } else {
+            None
+        },
+
+        check_flags: None,
+        compat_ioctl: if T::HAS_COMPAT_IOCTL {
+            Some(Self::compat_ioctl_callback)
+        } else {
+            None
+        },
+        copy_file_range: None,
+        fallocate: None,
+        fadvise: None,
+        fasync: None,
+        flock: None,
+        flush: None,
+        fsync: if T::HAS_FSYNC {
+            Some(Self::fsync_callback)
+        } else {
+            None
+        },
+        get_unmapped_area: None,
+        iterate: None,
+        iterate_shared: None,
+        iopoll: None,
+        lock: None,
+        mmap: if T::HAS_MMAP {
+            Some(Self::mmap_callback)
+        } else {
+            None
+        },
+        mmap_supported_flags: 0,
+        owner: ptr::null_mut(),
+        poll: if T::HAS_POLL {
+            Some(Self::poll_callback)
+        } else {
+            None
+        },
+        read_iter: if T::HAS_READ {
+            Some(Self::read_iter_callback)
+        } else {
+            None
+        },
+        remap_file_range: None,
+        sendpage: None,
+        setlease: None,
+        show_fdinfo: None,
+        splice_read: None,
+        splice_write: None,
+        unlocked_ioctl: if T::HAS_IOCTL {
+            Some(Self::unlocked_ioctl_callback)
+        } else {
+            None
+        },
+        uring_cmd: None,
+        write_iter: if T::HAS_WRITE {
+            Some(Self::write_iter_callback)
+        } else {
+            None
+        },
+    };
+
+    /// Builds an instance of [`struct file_operations`].
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that the adapter is compatible with the way the device is registered.
+    pub(crate) const unsafe fn build() -> &'static bindings::file_operations {
+        &Self::VTABLE
+    }
+}
+
+/// Allows the handling of ioctls defined with the `_IO`, `_IOR`, `_IOW`, and `_IOWR` macros.
+///
+/// For each macro, there is a handler function that takes the appropriate types as arguments.
+pub trait IoctlHandler: Sync {
+    /// The type of the first argument to each associated function.
+    type Target<'a>;
+
+    /// Handles ioctls defined with the `_IO` macro, that is, with no buffer as argument.
+    fn pure(_this: Self::Target<'_>, _file: &File, _cmd: u32, _arg: usize) -> Result<i32> {
+        Err(EINVAL)
+    }
+
+    /// Handles ioctls defined with the `_IOR` macro, that is, with an output buffer provided as
+    /// argument.
+    fn read(
+        _this: Self::Target<'_>,
+        _file: &File,
+        _cmd: u32,
+        _writer: &mut UserSlicePtrWriter,
+    ) -> Result<i32> {
+        Err(EINVAL)
+    }
+
+    /// Handles ioctls defined with the `_IOW` macro, that is, with an input buffer provided as
+    /// argument.
+    fn write(
+        _this: Self::Target<'_>,
+        _file: &File,
+        _cmd: u32,
+        _reader: &mut UserSlicePtrReader,
+    ) -> Result<i32> {
+        Err(EINVAL)
+    }
+
+    /// Handles ioctls defined with the `_IOWR` macro, that is, with a buffer for both input and
+    /// output provided as argument.
+    fn read_write(
+        _this: Self::Target<'_>,
+        _file: &File,
+        _cmd: u32,
+        _data: UserSlicePtr,
+    ) -> Result<i32> {
+        Err(EINVAL)
+    }
+}
+
+/// Represents an ioctl command.
+///
+/// It can use the components of an ioctl command to dispatch ioctls using
+/// [`IoctlCommand::dispatch`].
+pub struct IoctlCommand {
+    cmd: u32,
+    arg: usize,
+    user_slice: Option<UserSlicePtr>,
+}
+
+impl IoctlCommand {
+    /// Constructs a new [`IoctlCommand`].
+    fn new(cmd: u32, arg: usize) -> Self {
+        let size = (cmd >> bindings::_IOC_SIZESHIFT) & bindings::_IOC_SIZEMASK;
+
+        // SAFETY: We only create one instance of the user slice per ioctl call, so TOCTOU issues
+        // are not possible.
+        let user_slice = Some(unsafe { UserSlicePtr::new(arg as _, size as _) });
+        Self {
+            cmd,
+            arg,
+            user_slice,
+        }
+    }
+
+    /// Dispatches the given ioctl to the appropriate handler based on the value of the command. It
+    /// also creates a [`UserSlicePtr`], [`UserSlicePtrReader`], or [`UserSlicePtrWriter`]
+    /// depending on the direction of the buffer of the command.
+    ///
+    /// It is meant to be used in implementations of [`Operations::ioctl`] and
+    /// [`Operations::compat_ioctl`].
+    pub fn dispatch<T: IoctlHandler>(
+        &mut self,
+        handler: T::Target<'_>,
+        file: &File,
+    ) -> Result<i32> {
+        let dir = (self.cmd >> bindings::_IOC_DIRSHIFT) & bindings::_IOC_DIRMASK;
+        if dir == bindings::_IOC_NONE {
+            return T::pure(handler, file, self.cmd, self.arg);
+        }
+
+        let data = self.user_slice.take().ok_or(EINVAL)?;
+        const READ_WRITE: u32 = bindings::_IOC_READ | bindings::_IOC_WRITE;
+        match dir {
+            bindings::_IOC_WRITE => T::write(handler, file, self.cmd, &mut data.reader()),
+            bindings::_IOC_READ => T::read(handler, file, self.cmd, &mut data.writer()),
+            READ_WRITE => T::read_write(handler, file, self.cmd, data),
+            _ => Err(EINVAL),
+        }
+    }
+
+    /// Returns the raw 32-bit value of the command and the ptr-sized argument.
+    pub fn raw(&self) -> (u32, usize) {
+        (self.cmd, self.arg)
+    }
+}
+
+/// Trait for extracting file open arguments from kernel data structures.
+///
+/// This is meant to be implemented by registration managers.
+pub trait OpenAdapter<T: Sync> {
+    /// Converts untyped data stored in [`struct inode`] and [`struct file`] (when [`struct
+    /// file_operations::open`] is called) into the given type. For example, for `miscdev`
+    /// devices, a pointer to the registered [`struct miscdev`] is stored in [`struct
+    /// file::private_data`].
+    ///
+    /// # Safety
+    ///
+    /// This function must be called only when [`struct file_operations::open`] is being called for
+    /// a file that was registered by the implementer. The returned pointer must be valid and
+    /// not-null.
+    unsafe fn convert(_inode: *mut bindings::inode, _file: *mut bindings::file) -> *const T;
+}
+
+/// Corresponds to the kernel's `struct file_operations`.
+///
+/// You implement this trait whenever you would create a `struct file_operations`.
+///
+/// File descriptors may be used from multiple threads/processes concurrently, so your type must be
+/// [`Sync`]. It must also be [`Send`] because [`Operations::release`] will be called from the
+/// thread that decrements that associated file's refcount to zero.
+#[vtable]
+pub trait Operations {
+    /// The type of the context data returned by [`Operations::open`] and made available to
+    /// other methods.
+    type Data: ForeignOwnable + Send + Sync = ();
+
+    /// The type of the context data passed to [`Operations::open`].
+    type OpenData: Sync = ();
+
+    /// Creates a new instance of this file.
+    ///
+    /// Corresponds to the `open` function pointer in `struct file_operations`.
+    fn open(context: &Self::OpenData, file: &File) -> Result<Self::Data>;
+
+    /// Cleans up after the last reference to the file goes away.
+    ///
+    /// Note that context data is moved, so it will be freed automatically unless the
+    /// implementation moves it elsewhere.
+    ///
+    /// Corresponds to the `release` function pointer in `struct file_operations`.
+    fn release(_data: Self::Data, _file: &File) {}
+
+    /// Reads data from this file to the caller's buffer.
+    ///
+    /// Corresponds to the `read` and `read_iter` function pointers in `struct file_operations`.
+    fn read(
+        _data: <Self::Data as ForeignOwnable>::Borrowed<'_>,
+        _file: &File,
+        _writer: &mut impl IoBufferWriter,
+        _offset: u64,
+    ) -> Result<usize> {
+        Err(EINVAL)
+    }
+
+    /// Writes data from the caller's buffer to this file.
+    ///
+    /// Corresponds to the `write` and `write_iter` function pointers in `struct file_operations`.
+    fn write(
+        _data: <Self::Data as ForeignOwnable>::Borrowed<'_>,
+        _file: &File,
+        _reader: &mut impl IoBufferReader,
+        _offset: u64,
+    ) -> Result<usize> {
+        Err(EINVAL)
+    }
+
+    /// Changes the position of the file.
+    ///
+    /// Corresponds to the `llseek` function pointer in `struct file_operations`.
+    fn seek(
+        _data: <Self::Data as ForeignOwnable>::Borrowed<'_>,
+        _file: &File,
+        _offset: SeekFrom,
+    ) -> Result<u64> {
+        Err(EINVAL)
+    }
+
+    /// Performs IO control operations that are specific to the file.
+    ///
+    /// Corresponds to the `unlocked_ioctl` function pointer in `struct file_operations`.
+    fn ioctl(
+        _data: <Self::Data as ForeignOwnable>::Borrowed<'_>,
+        _file: &File,
+        _cmd: &mut IoctlCommand,
+    ) -> Result<i32> {
+        Err(ENOTTY)
+    }
+
+    /// Performs 32-bit IO control operations on that are specific to the file on 64-bit kernels.
+    ///
+    /// Corresponds to the `compat_ioctl` function pointer in `struct file_operations`.
+    fn compat_ioctl(
+        _data: <Self::Data as ForeignOwnable>::Borrowed<'_>,
+        _file: &File,
+        _cmd: &mut IoctlCommand,
+    ) -> Result<i32> {
+        Err(ENOTTY)
+    }
+
+    /// Syncs pending changes to this file.
+    ///
+    /// Corresponds to the `fsync` function pointer in `struct file_operations`.
+    fn fsync(
+        _data: <Self::Data as ForeignOwnable>::Borrowed<'_>,
+        _file: &File,
+        _start: u64,
+        _end: u64,
+        _datasync: bool,
+    ) -> Result<u32> {
+        Err(EINVAL)
+    }
+
+    /// Maps areas of the caller's virtual memory with device/file memory.
+    ///
+    /// Corresponds to the `mmap` function pointer in `struct file_operations`.
+    fn mmap(
+        _data: <Self::Data as ForeignOwnable>::Borrowed<'_>,
+        _file: &File,
+        _vma: &mut mm::virt::Area,
+    ) -> Result {
+        Err(EINVAL)
+    }
+
+    /// Checks the state of the file and optionally registers for notification when the state
+    /// changes.
+    ///
+    /// Corresponds to the `poll` function pointer in `struct file_operations`.
+    fn poll(
+        _data: <Self::Data as ForeignOwnable>::Borrowed<'_>,
+        _file: &File,
+        _table: &PollTable,
+    ) -> Result<u32> {
+        Ok(bindings::POLLIN | bindings::POLLOUT | bindings::POLLRDNORM | bindings::POLLWRNORM)
+    }
+}
+
+/// Writes the contents of a slice into a buffer writer.
+///
+/// This is used to help implement [`Operations::read`] when the contents are stored in a slice. It
+/// takes into account the offset and lengths, and returns the amount of data written.
+pub fn read_from_slice(s: &[u8], writer: &mut impl IoBufferWriter, offset: u64) -> Result<usize> {
+    let offset = offset.try_into()?;
+    if offset >= s.len() {
+        return Ok(0);
+    }
+
+    let len = core::cmp::min(s.len() - offset, writer.len());
+    writer.write_slice(&s[offset..][..len])?;
+    Ok(len)
+}
diff --git a/rust/kernel/io_buffer.rs b/rust/kernel/io_buffer.rs
new file mode 100644
index 000000000000..d5a258a5ff8f
--- /dev/null
+++ b/rust/kernel/io_buffer.rs
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Buffers used in IO.
+
+use crate::error::Result;
+use alloc::vec::Vec;
+use core::mem::{size_of, MaybeUninit};
+
+/// Represents a buffer to be read from during IO.
+pub trait IoBufferReader {
+    /// Returns the number of bytes left to be read from the io buffer.
+    ///
+    /// Note that even reading less than this number of bytes may fail.
+    fn len(&self) -> usize;
+
+    /// Returns `true` if no data is available in the io buffer.
+    fn is_empty(&self) -> bool {
+        self.len() == 0
+    }
+
+    /// Reads raw data from the io buffer into a raw kernel buffer.
+    ///
+    /// # Safety
+    ///
+    /// The output buffer must be valid.
+    unsafe fn read_raw(&mut self, out: *mut u8, len: usize) -> Result;
+
+    /// Reads all data remaining in the io buffer.
+    ///
+    /// Returns `EFAULT` if the address does not currently point to mapped, readable memory.
+    fn read_all(&mut self) -> Result<Vec<u8>> {
+        let mut data = Vec::<u8>::new();
+        data.try_resize(self.len(), 0)?;
+
+        // SAFETY: The output buffer is valid as we just allocated it.
+        unsafe { self.read_raw(data.as_mut_ptr(), data.len())? };
+        Ok(data)
+    }
+
+    /// Reads a byte slice from the io buffer.
+    ///
+    /// Returns `EFAULT` if the byte slice is bigger than the remaining size of the user slice or
+    /// if the address does not currently point to mapped, readable memory.
+    fn read_slice(&mut self, data: &mut [u8]) -> Result {
+        // SAFETY: The output buffer is valid as it's coming from a live reference.
+        unsafe { self.read_raw(data.as_mut_ptr(), data.len()) }
+    }
+
+    /// Reads the contents of a plain old data (POD) type from the io buffer.
+    fn read<T: ReadableFromBytes>(&mut self) -> Result<T> {
+        let mut out = MaybeUninit::<T>::uninit();
+        // SAFETY: The buffer is valid as it was just allocated.
+        unsafe { self.read_raw(out.as_mut_ptr() as _, size_of::<T>()) }?;
+        // SAFETY: We just initialised the data.
+        Ok(unsafe { out.assume_init() })
+    }
+}
+
+/// Represents a buffer to be written to during IO.
+pub trait IoBufferWriter {
+    /// Returns the number of bytes left to be written into the io buffer.
+    ///
+    /// Note that even writing less than this number of bytes may fail.
+    fn len(&self) -> usize;
+
+    /// Returns `true` if the io buffer cannot hold any additional data.
+    fn is_empty(&self) -> bool {
+        self.len() == 0
+    }
+
+    /// Writes zeroes to the io buffer.
+    ///
+    /// Differently from the other write functions, `clear` will zero as much as it can and update
+    /// the writer internal state to reflect this. It will, however, return an error if it cannot
+    /// clear `len` bytes.
+    ///
+    /// For example, if a caller requests that 100 bytes be cleared but a segfault happens after
+    /// 20 bytes, then EFAULT is returned and the writer is advanced by 20 bytes.
+    fn clear(&mut self, len: usize) -> Result;
+
+    /// Writes a byte slice into the io buffer.
+    ///
+    /// Returns `EFAULT` if the byte slice is bigger than the remaining size of the io buffer or if
+    /// the address does not currently point to mapped, writable memory.
+    fn write_slice(&mut self, data: &[u8]) -> Result {
+        // SAFETY: The input buffer is valid as it's coming from a live reference.
+        unsafe { self.write_raw(data.as_ptr(), data.len()) }
+    }
+
+    /// Writes raw data to the io buffer from a raw kernel buffer.
+    ///
+    /// # Safety
+    ///
+    /// The input buffer must be valid.
+    unsafe fn write_raw(&mut self, data: *const u8, len: usize) -> Result;
+
+    /// Writes the contents of the given data into the io buffer.
+    fn write<T: WritableToBytes>(&mut self, data: &T) -> Result {
+        // SAFETY: The input buffer is valid as it's coming from a live
+        // reference to a type that implements `WritableToBytes`.
+        unsafe { self.write_raw(data as *const T as _, size_of::<T>()) }
+    }
+}
+
+/// Specifies that a type is safely readable from byte slices.
+///
+/// Not all types can be safely read from byte slices; examples from
+/// <https://doc.rust-lang.org/reference/behavior-considered-undefined.html> include `bool`
+/// that must be either `0` or `1`, and `char` that cannot be a surrogate or above `char::MAX`.
+///
+/// # Safety
+///
+/// Implementers must ensure that the type is made up only of types that can be safely read from
+/// arbitrary byte sequences (e.g., `u32`, `u64`, etc.).
+pub unsafe trait ReadableFromBytes {}
+
+// SAFETY: All bit patterns are acceptable values of the types below.
+unsafe impl ReadableFromBytes for u8 {}
+unsafe impl ReadableFromBytes for u16 {}
+unsafe impl ReadableFromBytes for u32 {}
+unsafe impl ReadableFromBytes for u64 {}
+unsafe impl ReadableFromBytes for usize {}
+unsafe impl ReadableFromBytes for i8 {}
+unsafe impl ReadableFromBytes for i16 {}
+unsafe impl ReadableFromBytes for i32 {}
+unsafe impl ReadableFromBytes for i64 {}
+unsafe impl ReadableFromBytes for isize {}
+
+/// Specifies that a type is safely writable to byte slices.
+///
+/// This means that we don't read undefined values (which leads to UB) in preparation for writing
+/// to the byte slice. It also ensures that no potentially sensitive information is leaked into the
+/// byte slices.
+///
+/// # Safety
+///
+/// A type must not include padding bytes and must be fully initialised to safely implement
+/// [`WritableToBytes`] (i.e., it doesn't contain [`MaybeUninit`] fields). A composition of
+/// writable types in a structure is not necessarily writable because it may result in padding
+/// bytes.
+pub unsafe trait WritableToBytes {}
+
+// SAFETY: Initialised instances of the following types have no uninitialised portions.
+unsafe impl WritableToBytes for u8 {}
+unsafe impl WritableToBytes for u16 {}
+unsafe impl WritableToBytes for u32 {}
+unsafe impl WritableToBytes for u64 {}
+unsafe impl WritableToBytes for usize {}
+unsafe impl WritableToBytes for i8 {}
+unsafe impl WritableToBytes for i16 {}
+unsafe impl WritableToBytes for i32 {}
+unsafe impl WritableToBytes for i64 {}
+unsafe impl WritableToBytes for isize {}
diff --git a/rust/kernel/iov_iter.rs b/rust/kernel/iov_iter.rs
new file mode 100644
index 000000000000..01c7fa065dba
--- /dev/null
+++ b/rust/kernel/iov_iter.rs
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! IO vector iterators.
+//!
+//! C header: [`include/linux/uio.h`](../../../../include/linux/uio.h)
+
+use crate::{
+    bindings,
+    error::code::*,
+    io_buffer::{IoBufferReader, IoBufferWriter},
+    error::Result,
+};
+
+/// Wraps the kernel's `struct iov_iter`.
+///
+/// # Invariants
+///
+/// The pointer `IovIter::ptr` is non-null and valid.
+pub struct IovIter {
+    ptr: *mut bindings::iov_iter,
+}
+
+impl IovIter {
+    fn common_len(&self) -> usize {
+        // SAFETY: `IovIter::ptr` is guaranteed to be valid by the type invariants.
+        unsafe { (*self.ptr).count }
+    }
+
+    /// Constructs a new [`struct iov_iter`] wrapper.
+    ///
+    /// # Safety
+    ///
+    /// The pointer `ptr` must be non-null and valid for the lifetime of the object.
+    pub(crate) unsafe fn from_ptr(ptr: *mut bindings::iov_iter) -> Self {
+        // INVARIANTS: the safety contract ensures the type invariant will hold.
+        Self { ptr }
+    }
+}
+
+impl IoBufferWriter for IovIter {
+    fn len(&self) -> usize {
+        self.common_len()
+    }
+
+    fn clear(&mut self, mut len: usize) -> Result {
+        while len > 0 {
+            // SAFETY: `IovIter::ptr` is guaranteed to be valid by the type invariants.
+            let written = unsafe { bindings::iov_iter_zero(len, self.ptr) };
+            if written == 0 {
+                return Err(EFAULT);
+            }
+
+            len -= written;
+        }
+        Ok(())
+    }
+
+    unsafe fn write_raw(&mut self, data: *const u8, len: usize) -> Result {
+        let res = unsafe { bindings::_copy_to_iter(data as _, len, self.ptr) };
+        if res != len {
+            Err(EFAULT)
+        } else {
+            Ok(())
+        }
+    }
+}
+
+impl IoBufferReader for IovIter {
+    fn len(&self) -> usize {
+        self.common_len()
+    }
+
+    unsafe fn read_raw(&mut self, out: *mut u8, len: usize) -> Result {
+        let res = unsafe { bindings::_copy_from_iter(out as _, len, self.ptr) };
+        if res != len {
+            Err(EFAULT)
+        } else {
+            Ok(())
+        }
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6cf267119fda..dd9c39071391 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -13,7 +13,9 @@
 
 #![no_std]
 #![feature(allocator_api)]
+#![feature(associated_type_defaults)]
 #![feature(coerce_unsized)]
+#![feature(c_size_t)]
 #![feature(dispatch_from_dyn)]
 #![feature(new_uninit)]
 #![feature(receiver_trait)]
@@ -31,11 +33,17 @@
 #[cfg(not(test))]
 #[cfg(not(testlib))]
 mod allocator;
-pub mod fs;
 mod build_assert;
+pub mod cred;
 pub mod error;
+pub mod file;
+pub mod fs;
 pub mod init;
+pub mod io_buffer;
 pub mod ioctl;
+pub mod iov_iter;
+pub mod mm;
+pub mod pages;
 pub mod prelude;
 pub mod print;
 mod static_assert;
@@ -45,6 +53,7 @@
 pub mod sync;
 pub mod task;
 pub mod types;
+pub mod user_ptr;
 
 #[doc(hidden)]
 pub use bindings;
diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
new file mode 100644
index 000000000000..779359d0c5cf
--- /dev/null
+++ b/rust/kernel/mm.rs
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Memory management.
+//!
+//! C header: [`include/linux/mm.h`](../../../../include/linux/mm.h)
+
+use crate::{bindings, pages, error::to_result, error::Result};
+
+/// Virtual memory.
+pub mod virt {
+    use super::*;
+
+    /// A wrapper for the kernel's `struct vm_area_struct`.
+    ///
+    /// It represents an area of virtual memory.
+    ///
+    /// # Invariants
+    ///
+    /// `vma` is always non-null and valid.
+    pub struct Area {
+        vma: *mut bindings::vm_area_struct,
+    }
+
+    impl Area {
+        /// Creates a new instance of a virtual memory area.
+        ///
+        /// # Safety
+        ///
+        /// Callers must ensure that `vma` is non-null and valid for the duration of the new area's
+        /// lifetime.
+        pub(crate) unsafe fn from_ptr(vma: *mut bindings::vm_area_struct) -> Self {
+            // INVARIANTS: The safety requirements guarantee the invariants.
+            Self { vma }
+        }
+
+        /// Returns the flags associated with the virtual memory area.
+        ///
+        /// The possible flags are a combination of the constants in [`flags`].
+        pub fn flags(&self) -> usize {
+            // SAFETY: `self.vma` is valid by the type invariants.
+            unsafe { (*self.vma).vm_flags as _ }
+        }
+
+        /// Sets the flags associated with the virtual memory area.
+        ///
+        /// The possible flags are a combination of the constants in [`flags`].
+        pub fn set_flags(&mut self, flags: usize) {
+            // SAFETY: `self.vma` is valid by the type invariants.
+            unsafe { (*self.vma).vm_flags = flags as _ };
+        }
+
+        /// Returns the start address of the virtual memory area.
+        pub fn start(&self) -> usize {
+            // SAFETY: `self.vma` is valid by the type invariants.
+            unsafe { (*self.vma).vm_start as _ }
+        }
+
+        /// Returns the end address of the virtual memory area.
+        pub fn end(&self) -> usize {
+            // SAFETY: `self.vma` is valid by the type invariants.
+            unsafe { (*self.vma).vm_end as _ }
+        }
+
+        /// Maps a single page at the given address within the virtual memory area.
+        pub fn insert_page(&mut self, address: usize, page: &pages::Pages<0>) -> Result {
+            // SAFETY: The page is guaranteed to be order 0 by the type system. The range of
+            // `address` is already checked by `vm_insert_page`. `self.vma` and `page.pages` are
+            // guaranteed by their repective type invariants to be valid.
+            to_result(unsafe { bindings::vm_insert_page(self.vma, address as _, page.pages) })
+        }
+    }
+
+    /// Container for [`Area`] flags.
+    pub mod flags {
+        use crate::bindings;
+
+        /// No flags are set.
+        pub const NONE: usize = bindings::VM_NONE as _;
+
+        /// Mapping allows reads.
+        pub const READ: usize = bindings::VM_READ as _;
+
+        /// Mapping allows writes.
+        pub const WRITE: usize = bindings::VM_WRITE as _;
+
+        /// Mapping allows execution.
+        pub const EXEC: usize = bindings::VM_EXEC as _;
+
+        /// Mapping is shared.
+        pub const SHARED: usize = bindings::VM_SHARED as _;
+
+        /// Mapping may be updated to allow reads.
+        pub const MAYREAD: usize = bindings::VM_MAYREAD as _;
+
+        /// Mapping may be updated to allow writes.
+        pub const MAYWRITE: usize = bindings::VM_MAYWRITE as _;
+
+        /// Mapping may be updated to allow execution.
+        pub const MAYEXEC: usize = bindings::VM_MAYEXEC as _;
+
+        /// Mapping may be updated to be shared.
+        pub const MAYSHARE: usize = bindings::VM_MAYSHARE as _;
+
+        /// Do not copy this vma on fork.
+        pub const DONTCOPY: usize = bindings::VM_DONTCOPY as _;
+
+        /// Cannot expand with mremap().
+        pub const DONTEXPAND: usize = bindings::VM_DONTEXPAND as _;
+
+        /// Lock the pages covered when they are faulted in.
+        pub const LOCKONFAULT: usize = bindings::VM_LOCKONFAULT as _;
+
+        /// Is a VM accounted object.
+        pub const ACCOUNT: usize = bindings::VM_ACCOUNT as _;
+
+        /// should the VM suppress accounting.
+        pub const NORESERVE: usize = bindings::VM_NORESERVE as _;
+
+        /// Huge TLB Page VM.
+        pub const HUGETLB: usize = bindings::VM_HUGETLB as _;
+
+        /// Synchronous page faults.
+        pub const SYNC: usize = bindings::VM_SYNC as _;
+
+        /// Architecture-specific flag.
+        pub const ARCH_1: usize = bindings::VM_ARCH_1 as _;
+
+        /// Wipe VMA contents in child..
+        pub const WIPEONFORK: usize = bindings::VM_WIPEONFORK as _;
+
+        /// Do not include in the core dump.
+        pub const DONTDUMP: usize = bindings::VM_DONTDUMP as _;
+
+        /// Not soft dirty clean area.
+        pub const SOFTDIRTY: usize = bindings::VM_SOFTDIRTY as _;
+
+        /// Can contain "struct page" and pure PFN pages.
+        pub const MIXEDMAP: usize = bindings::VM_MIXEDMAP as _;
+
+        /// MADV_HUGEPAGE marked this vma.
+        pub const HUGEPAGE: usize = bindings::VM_HUGEPAGE as _;
+
+        /// MADV_NOHUGEPAGE marked this vma.
+        pub const NOHUGEPAGE: usize = bindings::VM_NOHUGEPAGE as _;
+
+        /// KSM may merge identical pages.
+        pub const MERGEABLE: usize = bindings::VM_MERGEABLE as _;
+    }
+}
diff --git a/rust/kernel/pages.rs b/rust/kernel/pages.rs
new file mode 100644
index 000000000000..c0c1f9fe03fc
--- /dev/null
+++ b/rust/kernel/pages.rs
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Kernel page allocation and management.
+//!
+//! TODO: This module is a work in progress.
+
+use crate::{
+    bindings, error::code::*, io_buffer::IoBufferReader, user_ptr::UserSlicePtrReader, error::Result,
+    PAGE_SIZE,
+};
+use core::{marker::PhantomData, ptr};
+
+/// A set of physical pages.
+///
+/// `Pages` holds a reference to a set of pages of order `ORDER`. Having the order as a generic
+/// const allows the struct to have the same size as a pointer.
+///
+/// # Invariants
+///
+/// The pointer `Pages::pages` is valid and points to 2^ORDER pages.
+pub struct Pages<const ORDER: u32> {
+    pub(crate) pages: *mut bindings::page,
+}
+
+impl<const ORDER: u32> Pages<ORDER> {
+    /// Allocates a new set of contiguous pages.
+    pub fn new() -> Result<Self> {
+        // TODO: Consider whether we want to allow callers to specify flags.
+        // SAFETY: This only allocates pages. We check that it succeeds in the next statement.
+        let pages = unsafe {
+            bindings::alloc_pages(
+                bindings::GFP_KERNEL | bindings::__GFP_ZERO | bindings::___GFP_HIGHMEM,
+                ORDER,
+            )
+        };
+        if pages.is_null() {
+            return Err(ENOMEM);
+        }
+        // INVARIANTS: We checked that the allocation above succeeded>
+        Ok(Self { pages })
+    }
+
+    /// Copies data from the given [`UserSlicePtrReader`] into the pages.
+    pub fn copy_into_page(
+        &self,
+        reader: &mut UserSlicePtrReader,
+        offset: usize,
+        len: usize,
+    ) -> Result {
+        // TODO: For now this only works on the first page.
+        let end = offset.checked_add(len).ok_or(EINVAL)?;
+        if end > PAGE_SIZE {
+            return Err(EINVAL);
+        }
+
+        let mapping = self.kmap(0).ok_or(EINVAL)?;
+
+        // SAFETY: We ensured that the buffer was valid with the check above.
+        unsafe { reader.read_raw((mapping.ptr as usize + offset) as _, len) }?;
+        Ok(())
+    }
+
+    /// Maps the pages and reads from them into the given buffer.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that the destination buffer is valid for the given length.
+    /// Additionally, if the raw buffer is intended to be recast, they must ensure that the data
+    /// can be safely cast; [`crate::io_buffer::ReadableFromBytes`] has more details about it.
+    pub unsafe fn read(&self, dest: *mut u8, offset: usize, len: usize) -> Result {
+        // TODO: For now this only works on the first page.
+        let end = offset.checked_add(len).ok_or(EINVAL)?;
+        if end > PAGE_SIZE {
+            return Err(EINVAL);
+        }
+
+        let mapping = self.kmap(0).ok_or(EINVAL)?;
+        unsafe { ptr::copy((mapping.ptr as *mut u8).add(offset), dest, len) };
+        Ok(())
+    }
+
+    /// Maps the pages and writes into them from the given buffer.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that the buffer is valid for the given length. Additionally, if the
+    /// page is (or will be) mapped by userspace, they must ensure that no kernel data is leaked
+    /// through padding if it was cast from another type; [`crate::io_buffer::WritableToBytes`] has
+    /// more details about it.
+    pub unsafe fn write(&self, src: *const u8, offset: usize, len: usize) -> Result {
+        // TODO: For now this only works on the first page.
+        let end = offset.checked_add(len).ok_or(EINVAL)?;
+        if end > PAGE_SIZE {
+            return Err(EINVAL);
+        }
+
+        let mapping = self.kmap(0).ok_or(EINVAL)?;
+        unsafe { ptr::copy(src, (mapping.ptr as *mut u8).add(offset), len) };
+        Ok(())
+    }
+
+    /// Maps the page at index `index`.
+    fn kmap(&self, index: usize) -> Option<PageMapping<'_>> {
+        if index >= 1usize << ORDER {
+            return None;
+        }
+
+        // SAFETY: We checked above that `index` is within range.
+        let page = unsafe { self.pages.add(index) };
+
+        // SAFETY: `page` is valid based on the checks above.
+        let ptr = unsafe { bindings::kmap(page) };
+        if ptr.is_null() {
+            return None;
+        }
+
+        Some(PageMapping {
+            page,
+            ptr,
+            _phantom: PhantomData,
+        })
+    }
+}
+
+impl<const ORDER: u32> Drop for Pages<ORDER> {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariants, we know the pages are allocated with the given order.
+        unsafe { bindings::__free_pages(self.pages, ORDER) };
+    }
+}
+
+struct PageMapping<'a> {
+    page: *mut bindings::page,
+    ptr: *mut core::ffi::c_void,
+    _phantom: PhantomData<&'a i32>,
+}
+
+impl Drop for PageMapping<'_> {
+    fn drop(&mut self) {
+        // SAFETY: An instance of `PageMapping` is created only when `kmap` succeeded for the given
+        // page, so it is safe to unmap it here.
+        unsafe { bindings::kunmap(self.page) };
+    }
+}
diff --git a/rust/kernel/user_ptr.rs b/rust/kernel/user_ptr.rs
new file mode 100644
index 000000000000..9fdacc2826ef
--- /dev/null
+++ b/rust/kernel/user_ptr.rs
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! User pointers.
+//!
+//! C header: [`include/linux/uaccess.h`](../../../../include/linux/uaccess.h)
+
+use crate::{
+    bindings,
+    error::code::*,
+    io_buffer::{IoBufferReader, IoBufferWriter},
+    error::Result,
+};
+use alloc::vec::Vec;
+
+/// A reference to an area in userspace memory, which can be either
+/// read-only or read-write.
+///
+/// All methods on this struct are safe: invalid pointers return
+/// `EFAULT`. Concurrent access, *including data races to/from userspace
+/// memory*, is permitted, because fundamentally another userspace
+/// thread/process could always be modifying memory at the same time
+/// (in the same way that userspace Rust's [`std::io`] permits data races
+/// with the contents of files on disk). In the presence of a race, the
+/// exact byte values read/written are unspecified but the operation is
+/// well-defined. Kernelspace code should validate its copy of data
+/// after completing a read, and not expect that multiple reads of the
+/// same address will return the same value.
+///
+/// All APIs enforce the invariant that a given byte of memory from userspace
+/// may only be read once. By preventing double-fetches we avoid TOCTOU
+/// vulnerabilities. This is accomplished by taking `self` by value to prevent
+/// obtaining multiple readers on a given [`UserSlicePtr`], and the readers
+/// only permitting forward reads.
+///
+/// Constructing a [`UserSlicePtr`] performs no checks on the provided
+/// address and length, it can safely be constructed inside a kernel thread
+/// with no current userspace process. Reads and writes wrap the kernel APIs
+/// `copy_from_user` and `copy_to_user`, which check the memory map of the
+/// current process and enforce that the address range is within the user
+/// range (no additional calls to `access_ok` are needed).
+///
+/// [`std::io`]: https://doc.rust-lang.org/std/io/index.html
+pub struct UserSlicePtr(*mut core::ffi::c_void, usize);
+
+impl UserSlicePtr {
+    /// Constructs a user slice from a raw pointer and a length in bytes.
+    ///
+    /// # Safety
+    ///
+    /// Callers must be careful to avoid time-of-check-time-of-use
+    /// (TOCTOU) issues. The simplest way is to create a single instance of
+    /// [`UserSlicePtr`] per user memory block as it reads each byte at
+    /// most once.
+    pub unsafe fn new(ptr: *mut core::ffi::c_void, length: usize) -> Self {
+        UserSlicePtr(ptr, length)
+    }
+
+    /// Reads the entirety of the user slice.
+    ///
+    /// Returns `EFAULT` if the address does not currently point to
+    /// mapped, readable memory.
+    pub fn read_all(self) -> Result<Vec<u8>> {
+        self.reader().read_all()
+    }
+
+    /// Constructs a [`UserSlicePtrReader`].
+    pub fn reader(self) -> UserSlicePtrReader {
+        UserSlicePtrReader(self.0, self.1)
+    }
+
+    /// Writes the provided slice into the user slice.
+    ///
+    /// Returns `EFAULT` if the address does not currently point to
+    /// mapped, writable memory (in which case some data from before the
+    /// fault may be written), or `data` is larger than the user slice
+    /// (in which case no data is written).
+    pub fn write_all(self, data: &[u8]) -> Result {
+        self.writer().write_slice(data)
+    }
+
+    /// Constructs a [`UserSlicePtrWriter`].
+    pub fn writer(self) -> UserSlicePtrWriter {
+        UserSlicePtrWriter(self.0, self.1)
+    }
+
+    /// Constructs both a [`UserSlicePtrReader`] and a [`UserSlicePtrWriter`].
+    pub fn reader_writer(self) -> (UserSlicePtrReader, UserSlicePtrWriter) {
+        (
+            UserSlicePtrReader(self.0, self.1),
+            UserSlicePtrWriter(self.0, self.1),
+        )
+    }
+}
+
+/// A reader for [`UserSlicePtr`].
+///
+/// Used to incrementally read from the user slice.
+pub struct UserSlicePtrReader(*mut core::ffi::c_void, usize);
+
+impl IoBufferReader for UserSlicePtrReader {
+    /// Returns the number of bytes left to be read from this.
+    ///
+    /// Note that even reading less than this number of bytes may fail.
+    fn len(&self) -> usize {
+        self.1
+    }
+
+    /// Reads raw data from the user slice into a raw kernel buffer.
+    ///
+    /// # Safety
+    ///
+    /// The output buffer must be valid.
+    unsafe fn read_raw(&mut self, out: *mut u8, len: usize) -> Result {
+        if len > self.1 || len > u32::MAX as usize {
+            return Err(EFAULT);
+        }
+        let res = unsafe { bindings::_copy_from_user(out as _, self.0, len as _) };
+        if res != 0 {
+            return Err(EFAULT);
+        }
+        // Since this is not a pointer to a valid object in our program,
+        // we cannot use `add`, which has C-style rules for defined
+        // behavior.
+        self.0 = self.0.wrapping_add(len);
+        self.1 -= len;
+        Ok(())
+    }
+}
+
+/// A writer for [`UserSlicePtr`].
+///
+/// Used to incrementally write into the user slice.
+pub struct UserSlicePtrWriter(*mut core::ffi::c_void, usize);
+
+impl IoBufferWriter for UserSlicePtrWriter {
+    fn len(&self) -> usize {
+        self.1
+    }
+
+    fn clear(&mut self, mut len: usize) -> Result {
+        let mut ret = Ok(());
+        if len > self.1 {
+            ret = Err(EFAULT);
+            len = self.1;
+        }
+
+        // SAFETY: The buffer will be validated by `clear_user`. We ensure that `len` is within
+        // bounds in the check above.
+        let left = unsafe { bindings::clear_user(self.0, len as _) } as usize;
+        if left != 0 {
+            ret = Err(EFAULT);
+            len -= left;
+        }
+
+        self.0 = self.0.wrapping_add(len);
+        self.1 -= len;
+        ret
+    }
+
+    unsafe fn write_raw(&mut self, data: *const u8, len: usize) -> Result {
+        if len > self.1 || len > u32::MAX as usize {
+            return Err(EFAULT);
+        }
+        let res = unsafe { bindings::_copy_to_user(self.0, data as _, len as _) };
+        if res != 0 {
+            return Err(EFAULT);
+        }
+        // Since this is not a pointer to a valid object in our program,
+        // we cannot use `add`, which has C-style rules for defined
+        // behavior.
+        self.0 = self.0.wrapping_add(len);
+        self.1 -= len;
+        Ok(())
+    }
+}
-- 
2.40.1

