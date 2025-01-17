Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E1C3B1A2
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Jan 2025 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123779; cv=none; b=HQxX0uJoZrizNHV7H4rGjUkIddCpaUQ7u0jcFhGUiBZHlFxOj+mLetaxbmNV6VLY+n70WUkytpnZ2SWWbJTCgy/2oEmpopJaeeJle34YPJaH55T8OfbGnVc5MCLk84eVGvnLzfFIxEBqNxk71ATPviMYM1Tdr96Xd1SzsbnVoiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123779; c=relaxed/simple;
	bh=k4Xpn2RmY6NCWHMXL/iKfqAqRheyeJPA8UiAb1hhX9Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=D+IJuc4mkadZu+x75/N7zuOD3UbBg1ql2O/LapGhKuqdxPJCNQPytWJp+hdWpqOjUFbVOW2pxPw1T3BPJXWbbxaKl2tVp4mNT5aAtE+HEkCAnOWmL72PmzJxGRLpqxUL47AkoboYnnKJ8IVJ5IBGa2sEZjuU2R4enXHj5yeDyAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=juLpm+S+; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="juLpm+S+"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-38a2140a400so1759815f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Jan 2025 06:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737123776; x=1737728576; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KMDIxJKKFqAnFYferYlNcN4gVN8VQWHhPTDkuCDbFUY=;
        b=juLpm+S+5cCiKKtKAy8h16GDcErL3I2lh6y3+hf8y6Wdvg6TuK7v1FT4ox1QT9/5qw
         OAfqyAOuRfFqKntmQ5KXzUSOZc0voskc7fhdIHgfWelfM6NRIcSf89LGHQRoLyN695OY
         kAt4fAr+rwk6t6g6UKM8OCKQc2SovS44uPbVG25zrqxdYnXgrBPxhAwYZ1ArdLHDyLO9
         Mdnq4ZG6gZOk2ThPPwt4/i+ArxYJmMQQ2kELIixCCl+XqP6xi/tQC2opEMjqieZX0lDb
         qg/hOMBZELUGh5B5pqv0RxHNHnOq73//pwe1VCim09fobwvasjmyW78h52CwvgQWXXQb
         fipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737123776; x=1737728576;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KMDIxJKKFqAnFYferYlNcN4gVN8VQWHhPTDkuCDbFUY=;
        b=i/piDH2rQDEZl5U5B4fr78zHHRVx43HuABLpgAO6QH/HOfVst551kcluNYhKkL9hcO
         gsEbT1ePdjiGVYjYT/0oofd8jfS14DbV5/JgvqM9rMf86UTq7Kw+CpAPN+2LNzTQ5D3c
         Y0phRN3gTU04hY1uo3giklGcm33BHcK8FFl27nvHgX7R6l5ZFp+hRpfHF/g0txTZEhLH
         Xrk5YrSbFNvSpFUoIfG1uM7F7anP2zyZb+Y5mVYXGcOTD8a7zz6jt/aL7Qg5hv5GIT+Y
         fdpJc7prtX55CJjiFwCuqWdmJtgO4FmFRfTh667M2DaCJiKgsBuMh4ClkMrDMrBR3S/2
         tRvw==
X-Forwarded-Encrypted: i=1; AJvYcCURCHZKlIKNqyNcwdNkPmWuS1fHdOKEaYfaqFJtp1ihoYSo+UHlL5FMU+uWYPGczUBKUXK0zO/OfYIYAg0/bw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6hFMhU5v3ni2JpchgO7Uoi55jlds0LK1Tv3LUO5YXNDETvAIR
	h+tqsqy6AmPuPUajIf3zgORklvqv1LQKWC4rRa0TorfkqR5Kuse+OP5WjDk4SV9jRWOBwvyXV8o
	ERrAAXqzibH359Q==
X-Google-Smtp-Source: AGHT+IEHnEo27D6Xsau2YhGT46bG5LyVTfwZZeX6wiKnxjGwLHKC+EVmwP3+zlOCVGOY0M4JOUv83UQPRG2gzwg=
X-Received: from wmbg17.prod.google.com ([2002:a05:600c:a411:b0:434:f513:bb24])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1ac6:b0:385:f07b:93da with SMTP id ffacd0b85a97d-38bf57bf69bmr2558965f8f.47.1737123776195;
 Fri, 17 Jan 2025 06:22:56 -0800 (PST)
Date: Fri, 17 Jan 2025 14:22:32 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKhnimcC/y2MywqAIBAAfyX2nKAbZvUr0SF0rT30wIUIpH9Po
 uPAzGQQSkwCQ5Uh0cXCx17A1BX4dd4XUhwKA2q02hinNhYfiuhJxeMU9VvY6sZiDF1vHZT4TBT 5/sbj9Dwv9/tfcWgAAAA=
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=15060; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=k4Xpn2RmY6NCWHMXL/iKfqAqRheyeJPA8UiAb1hhX9Q=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnimeqxReb7orNnmaYOfFfrPSDGWq0wudLQtFCs
 1fOsjoEie2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ4pnqgAKCRAEWL7uWMY5
 RlmEEACsoSr3E71KSv1JTxXQdyhxOL/ywLjfk1CG890FHA4qgAPEKuO6DVQtl057K51t8b8UfRR
 gqTLg5gEwXhao3Yc9xFZPAT7iU7P5c5aY8FVzM/6NrJ4VRzop7oV033tQO7euh2UXErbGtbeVXP
 ZYfoK9C18RiMBfmhuWTX6KhABn7dLwRKRSbRWyRYzBn/2YTX/Llkuy04nS8lN3B6uM4NQS5Y3w4
 iDAW2Q0zu8yRyta7pwkghlx9Q4NHZAyosiiayIxmHBaIk0fKy4p3u4qySOqV7zgnKJdGJ8vSmhr
 LGccrtTauYPK4Fe8voFVU1zvmFAFHFAarcvwYTF2epyDLduZZDj70y8sudQDMNAVR0euzBSz+Pq
 +AYe7XqsLR6adqrzkXUM/bpTf0KxBbihlxGiocsj48DMLUx9Ac4lbOORT9l41/lc01ABTg/XjRe
 LIqklY6987aQWS4LyG7rFed1mFrhDdqVfbZ9aS6oN3xCXG+VUSrYvOsg6hu2nCqf3fDw1fEP748
 BHnS+2V64ZJ2YD3zk2CEPlb0v2fpqKvlCARPeyVIZIG3IILLv+B+V+pTsbtT89jvSfgZ/+5xkB5
 aYdE3QVYZB1+OsJf5eY05PG6a/nqDoSB9H31qYYiN3m1upOfJCRfTwkat0dnOmuYboq4IO69UBH nQIhKtO8w13WTrQ==
X-Mailer: b4 0.13.0
Message-ID: <20250117-miscdevice-fops-change-v1-1-ec04b701c076@google.com>
Subject: [PATCH] rust: miscdevice: change how f_ops vtable is constructed
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

I was helping someone with writing a new Rust abstraction, and we were
using the miscdevice abstraction as an example. While doing this, it
became clear to me that the way I implemented the f_ops vtable is
confusing to new Rust users, and that the approach used by the block
abstractions is less confusing.

Thus, update the miscdevice abstractions to use the same approach as
rust/kernel/block/mq/operations.rs.

Sorry about the large diff. This changes the indentation of a large
amount of code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/miscdevice.rs | 295 ++++++++++++++++++++++------------------------
 1 file changed, 141 insertions(+), 154 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index dfb363630c70..ad02434cbeaf 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -39,7 +39,7 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
         let mut result: bindings::miscdevice = unsafe { MaybeUninit::zeroed().assume_init() };
         result.minor = bindings::MISC_DYNAMIC_MINOR as _;
         result.name = self.name.as_char_ptr();
-        result.fops = create_vtable::<T>();
+        result.fops = MiscdeviceVTable::<T>::build();
         result
     }
 }
@@ -164,171 +164,158 @@ fn show_fdinfo(
     }
 }
 
-const fn create_vtable<T: MiscDevice>() -> &'static bindings::file_operations {
-    const fn maybe_fn<T: Copy>(check: bool, func: T) -> Option<T> {
-        if check {
-            Some(func)
-        } else {
-            None
+/// A vtable for the file operations of a Rust miscdevice.
+struct MiscdeviceVTable<T: MiscDevice>(PhantomData<T>);
+
+impl<T: MiscDevice> MiscdeviceVTable<T> {
+    /// # Safety
+    ///
+    /// `file` and `inode` must be the file and inode for a file that is undergoing initialization.
+    /// The file must be associated with a `MiscDeviceRegistration<T>`.
+    unsafe extern "C" fn open(inode: *mut bindings::inode, raw_file: *mut bindings::file) -> c_int {
+        // SAFETY: The pointers are valid and for a file being opened.
+        let ret = unsafe { bindings::generic_file_open(inode, raw_file) };
+        if ret != 0 {
+            return ret;
         }
-    }
 
-    struct VtableHelper<T: MiscDevice> {
-        _t: PhantomData<T>,
-    }
-    impl<T: MiscDevice> VtableHelper<T> {
-        const VTABLE: bindings::file_operations = bindings::file_operations {
-            open: Some(fops_open::<T>),
-            release: Some(fops_release::<T>),
-            unlocked_ioctl: maybe_fn(T::HAS_IOCTL, fops_ioctl::<T>),
-            #[cfg(CONFIG_COMPAT)]
-            compat_ioctl: if T::HAS_COMPAT_IOCTL {
-                Some(fops_compat_ioctl::<T>)
-            } else if T::HAS_IOCTL {
-                Some(bindings::compat_ptr_ioctl)
-            } else {
-                None
-            },
-            show_fdinfo: maybe_fn(T::HAS_SHOW_FDINFO, fops_show_fdinfo::<T>),
-            // SAFETY: All zeros is a valid value for `bindings::file_operations`.
-            ..unsafe { MaybeUninit::zeroed().assume_init() }
-        };
-    }
+        // SAFETY: The open call of a file can access the private data.
+        let misc_ptr = unsafe { (*raw_file).private_data };
 
-    &VtableHelper::<T>::VTABLE
-}
+        // SAFETY: This is a miscdevice, so `misc_open()` set the private data to a pointer to the
+        // associated `struct miscdevice` before calling into this method. Furthermore, `misc_open()`
+        // ensures that the miscdevice can't be unregistered and freed during this call to `fops_open`.
+        let misc = unsafe { &*misc_ptr.cast::<MiscDeviceRegistration<T>>() };
 
-/// # Safety
-///
-/// `file` and `inode` must be the file and inode for a file that is undergoing initialization.
-/// The file must be associated with a `MiscDeviceRegistration<T>`.
-unsafe extern "C" fn fops_open<T: MiscDevice>(
-    inode: *mut bindings::inode,
-    raw_file: *mut bindings::file,
-) -> c_int {
-    // SAFETY: The pointers are valid and for a file being opened.
-    let ret = unsafe { bindings::generic_file_open(inode, raw_file) };
-    if ret != 0 {
-        return ret;
-    }
+        // SAFETY:
+        // * This underlying file is valid for (much longer than) the duration of `T::open`.
+        // * There is no active fdget_pos region on the file on this thread.
+        let file = unsafe { File::from_raw_file(raw_file) };
 
-    // SAFETY: The open call of a file can access the private data.
-    let misc_ptr = unsafe { (*raw_file).private_data };
-
-    // SAFETY: This is a miscdevice, so `misc_open()` set the private data to a pointer to the
-    // associated `struct miscdevice` before calling into this method. Furthermore, `misc_open()`
-    // ensures that the miscdevice can't be unregistered and freed during this call to `fops_open`.
-    let misc = unsafe { &*misc_ptr.cast::<MiscDeviceRegistration<T>>() };
+        let ptr = match T::open(file, misc) {
+            Ok(ptr) => ptr,
+            Err(err) => return err.to_errno(),
+        };
 
-    // SAFETY:
-    // * This underlying file is valid for (much longer than) the duration of `T::open`.
-    // * There is no active fdget_pos region on the file on this thread.
-    let file = unsafe { File::from_raw_file(raw_file) };
+        // This overwrites the private data with the value specified by the user, changing the type of
+        // this file's private data. All future accesses to the private data is performed by other
+        // fops_* methods in this file, which all correctly cast the private data to the new type.
+        //
+        // SAFETY: The open call of a file can access the private data.
+        unsafe { (*raw_file).private_data = ptr.into_foreign().cast_mut() };
 
-    let ptr = match T::open(file, misc) {
-        Ok(ptr) => ptr,
-        Err(err) => return err.to_errno(),
-    };
-
-    // This overwrites the private data with the value specified by the user, changing the type of
-    // this file's private data. All future accesses to the private data is performed by other
-    // fops_* methods in this file, which all correctly cast the private data to the new type.
-    //
-    // SAFETY: The open call of a file can access the private data.
-    unsafe { (*raw_file).private_data = ptr.into_foreign().cast_mut() };
+        0
+    }
 
-    0
-}
+    /// # Safety
+    ///
+    /// `file` and `inode` must be the file and inode for a file that is being released. The file must
+    /// be associated with a `MiscDeviceRegistration<T>`.
+    unsafe extern "C" fn release(_inode: *mut bindings::inode, file: *mut bindings::file) -> c_int {
+        // SAFETY: The release call of a file owns the private data.
+        let private = unsafe { (*file).private_data };
+        // SAFETY: The release call of a file owns the private data.
+        let ptr = unsafe { <T::Ptr as ForeignOwnable>::from_foreign(private) };
+
+        // SAFETY:
+        // * The file is valid for the duration of this call.
+        // * There is no active fdget_pos region on the file on this thread.
+        T::release(ptr, unsafe { File::from_raw_file(file) });
+
+        0
+    }
 
-/// # Safety
-///
-/// `file` and `inode` must be the file and inode for a file that is being released. The file must
-/// be associated with a `MiscDeviceRegistration<T>`.
-unsafe extern "C" fn fops_release<T: MiscDevice>(
-    _inode: *mut bindings::inode,
-    file: *mut bindings::file,
-) -> c_int {
-    // SAFETY: The release call of a file owns the private data.
-    let private = unsafe { (*file).private_data };
-    // SAFETY: The release call of a file owns the private data.
-    let ptr = unsafe { <T::Ptr as ForeignOwnable>::from_foreign(private) };
-
-    // SAFETY:
-    // * The file is valid for the duration of this call.
-    // * There is no active fdget_pos region on the file on this thread.
-    T::release(ptr, unsafe { File::from_raw_file(file) });
-
-    0
-}
+    /// # Safety
+    ///
+    /// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
+    unsafe extern "C" fn ioctl(file: *mut bindings::file, cmd: c_uint, arg: c_ulong) -> c_long {
+        // SAFETY: The ioctl call of a file can access the private data.
+        let private = unsafe { (*file).private_data };
+        // SAFETY: Ioctl calls can borrow the private data of the file.
+        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+
+        // SAFETY:
+        // * The file is valid for the duration of this call.
+        // * There is no active fdget_pos region on the file on this thread.
+        let file = unsafe { File::from_raw_file(file) };
+
+        match T::ioctl(device, file, cmd, arg as usize) {
+            Ok(ret) => ret as c_long,
+            Err(err) => err.to_errno() as c_long,
+        }
+    }
 
-/// # Safety
-///
-/// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
-unsafe extern "C" fn fops_ioctl<T: MiscDevice>(
-    file: *mut bindings::file,
-    cmd: c_uint,
-    arg: c_ulong,
-) -> c_long {
-    // SAFETY: The ioctl call of a file can access the private data.
-    let private = unsafe { (*file).private_data };
-    // SAFETY: Ioctl calls can borrow the private data of the file.
-    let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
-
-    // SAFETY:
-    // * The file is valid for the duration of this call.
-    // * There is no active fdget_pos region on the file on this thread.
-    let file = unsafe { File::from_raw_file(file) };
-
-    match T::ioctl(device, file, cmd, arg as usize) {
-        Ok(ret) => ret as c_long,
-        Err(err) => err.to_errno() as c_long,
+    /// # Safety
+    ///
+    /// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
+    #[cfg(CONFIG_COMPAT)]
+    unsafe extern "C" fn compat_ioctl(
+        file: *mut bindings::file,
+        cmd: c_uint,
+        arg: c_ulong,
+    ) -> c_long {
+        // SAFETY: The compat ioctl call of a file can access the private data.
+        let private = unsafe { (*file).private_data };
+        // SAFETY: Ioctl calls can borrow the private data of the file.
+        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+
+        // SAFETY:
+        // * The file is valid for the duration of this call.
+        // * There is no active fdget_pos region on the file on this thread.
+        let file = unsafe { File::from_raw_file(file) };
+
+        match T::compat_ioctl(device, file, cmd, arg as usize) {
+            Ok(ret) => ret as c_long,
+            Err(err) => err.to_errno() as c_long,
+        }
     }
-}
 
-/// # Safety
-///
-/// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
-#[cfg(CONFIG_COMPAT)]
-unsafe extern "C" fn fops_compat_ioctl<T: MiscDevice>(
-    file: *mut bindings::file,
-    cmd: c_uint,
-    arg: c_ulong,
-) -> c_long {
-    // SAFETY: The compat ioctl call of a file can access the private data.
-    let private = unsafe { (*file).private_data };
-    // SAFETY: Ioctl calls can borrow the private data of the file.
-    let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
-
-    // SAFETY:
-    // * The file is valid for the duration of this call.
-    // * There is no active fdget_pos region on the file on this thread.
-    let file = unsafe { File::from_raw_file(file) };
-
-    match T::compat_ioctl(device, file, cmd, arg as usize) {
-        Ok(ret) => ret as c_long,
-        Err(err) => err.to_errno() as c_long,
+    /// # Safety
+    ///
+    /// - `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
+    /// - `seq_file` must be a valid `struct seq_file` that we can write to.
+    unsafe extern "C" fn show_fdinfo(seq_file: *mut bindings::seq_file, file: *mut bindings::file) {
+        // SAFETY: The release call of a file owns the private data.
+        let private = unsafe { (*file).private_data };
+        // SAFETY: Ioctl calls can borrow the private data of the file.
+        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+        // SAFETY:
+        // * The file is valid for the duration of this call.
+        // * There is no active fdget_pos region on the file on this thread.
+        let file = unsafe { File::from_raw_file(file) };
+        // SAFETY: The caller ensures that the pointer is valid and exclusive for the duration in which
+        // this method is called.
+        let m = unsafe { SeqFile::from_raw(seq_file) };
+
+        T::show_fdinfo(device, m, file);
     }
-}
 
-/// # Safety
-///
-/// - `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
-/// - `seq_file` must be a valid `struct seq_file` that we can write to.
-unsafe extern "C" fn fops_show_fdinfo<T: MiscDevice>(
-    seq_file: *mut bindings::seq_file,
-    file: *mut bindings::file,
-) {
-    // SAFETY: The release call of a file owns the private data.
-    let private = unsafe { (*file).private_data };
-    // SAFETY: Ioctl calls can borrow the private data of the file.
-    let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
-    // SAFETY:
-    // * The file is valid for the duration of this call.
-    // * There is no active fdget_pos region on the file on this thread.
-    let file = unsafe { File::from_raw_file(file) };
-    // SAFETY: The caller ensures that the pointer is valid and exclusive for the duration in which
-    // this method is called.
-    let m = unsafe { SeqFile::from_raw(seq_file) };
-
-    T::show_fdinfo(device, m, file);
+    const VTABLE: bindings::file_operations = bindings::file_operations {
+        open: Some(Self::open),
+        release: Some(Self::release),
+        unlocked_ioctl: if T::HAS_IOCTL {
+            Some(Self::ioctl)
+        } else {
+            None
+        },
+        #[cfg(CONFIG_COMPAT)]
+        compat_ioctl: if T::HAS_COMPAT_IOCTL {
+            Some(Self::compat_ioctl)
+        } else if T::HAS_IOCTL {
+            Some(Self::bindings::compat_ptr_ioctl)
+        } else {
+            None
+        },
+        show_fdinfo: if T::HAS_SHOW_FDINFO {
+            Some(Self::show_fdinfo)
+        } else {
+            None
+        },
+        // SAFETY: All zeros is a valid value for `bindings::file_operations`.
+        ..unsafe { MaybeUninit::zeroed().assume_init() }
+    };
+
+    const fn build() -> &'static bindings::file_operations {
+        &Self::VTABLE
+    }
 }

---
base-commit: 01b3cb620815fc3feb90ee117d9445a5b608a9f7
change-id: 20250117-miscdevice-fops-change-260352fd8957

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

