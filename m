Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB77D22F38C
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740662595; cv=none; b=kPjHRIt5JsI5NqHCoTPAeiQHmOdMCMKcVX1KTI83vOFtEqq6+3i3AY1F+kBp1J8GxBB+nx6fh7+dIfw9u/6nCsaeVDq5rGT6dYPdhsZAULpMBBG9dtWovE87Q+IdsKxXutMgmFFVb9j43IBHqRW4R+jx9PqzgiDEtQJgEB2IFJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740662595; c=relaxed/simple;
	bh=Efb1yhqV4zYIOKTnZF5G7JuyCcgU9v/kNVgXbrLxcDk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=N5kXAkolUE+YfTVqK6aYZXqGd1M0FeQGJZ451lLwzQzCUgV4WcSXTGdXriPHa5cr/D9BrikFwyxWvOdEHCwRZMecMz8WMuurClb5mTi1js2Pz58qX6a7JM1lqVAcTWUFl3vHJV/yMpBUIuAV87MeE+gbWBEwfjQU2zriCz6gkMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rVz2X/xm; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rVz2X/xm"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ab456333aso8674335e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 05:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740662591; x=1741267391; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ScvIODhMioXpdAQWUjG4Ar/IdTwtbxdC6jG38Y+sxBU=;
        b=rVz2X/xmXMeCwzvKB2aM3UKnFaEw0974xfUJA/RCWLF4seYa4IOvwHJKbaspVqgLmk
         Xb4yoxln66tVMJrdWFyFlzj0ExXvWnjD+9u7VZ8K//f8QLh1HjGXduU6t8rOfCvPU46Z
         0btGljSaN1RlGG7X+dlEnd75hRTZjzSyArUa11Qe8XOzu3cwDuduluUO+iXmEXaSK8Wj
         /SfQidACewGsZGY7HxmlJIcJlqZKVk7NgJuEvY3CmBlSGDNQaOCZaEclnsRJkLmxGl6B
         cmlQLAjNJfkekRahwYqkzjbgfYmz4EglnbG/lpiiaXYyJsjS2JnWKaOw03MFdooznpqt
         5ohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740662591; x=1741267391;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ScvIODhMioXpdAQWUjG4Ar/IdTwtbxdC6jG38Y+sxBU=;
        b=iot8QcgyLBY8ebJ30iITM0uj4Pu5oNnGD+VicmLAeWLKhDsgywyAGkY4srfchMwYTp
         7TloxGAZ37wM1NCCzOC8bqxGVS/TfOOnHIr0OstfA+yvvsozwngczDpF/GyGBUg+NfRE
         MVd8rsyWHWErvAKdP983caC6wUOW1XN2OI9+dLoYprUUlXgGcZy5zeySZJthqqAKmRC+
         LGqxJF539gqozrugRP0pAS5SZrUPkAsd/lcjGkvSlNGb6byBZM38vPg8grvLRquMMZVw
         6luyA6Cw+HGK8FuJyqpifelyoz8cyQDDXRHZ3Nzfpk34TtTF7YNZp+tMPS37/k0AxPjI
         sNyw==
X-Forwarded-Encrypted: i=1; AJvYcCWZQeuaznLID7zJLdDlbO7U6xgl3+0ft8R+jzyxzIGu36Fu+CZXb1B+pxaeP1ZiZzg1GjejHKxBz+Dbb4IYtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd9mDe8psJpuk5aqapLD2+V2Vy5cU70MKm7CvObDqwqmyg9qk8
	iSvLY5FGoADcarkl3SE7k1PJbwwm1PUnRRNgjSTUHHnctwJEOLI8o3j8E9kA+qtwTuSzhNwOjJ9
	7TTMtagKvTxJ46g==
X-Google-Smtp-Source: AGHT+IEMEvQ8Up68R5/dRRV4pfxncO3q6iKq/BvOS0GuFO9p+zOQNflD6VgZjiakyJ7gMcGNiROsIZsR6vm74c8=
X-Received: from wmbjh9.prod.google.com ([2002:a05:600c:a089:b0:439:94f1:365e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:458e:b0:439:8c9c:6d32 with SMTP id 5b1f17b1804b1-43ab9d4c0c3mr79224805e9.13.1740662591266;
 Thu, 27 Feb 2025 05:23:11 -0800 (PST)
Date: Thu, 27 Feb 2025 13:22:31 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABZnwGcC/y2MywqAIBAAfyX2nKAbZvUr0SF0rT30wIUIpH9Po
 uPAzGQQSkwCQ5Uh0cXCx17A1BX4dd4XUhwKA2q02hinNhYfiuhJxeMU9VvY6sZiDF1vHZT4TBT 5/sbj9Dwv9/tfcWgAAAA=
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=15081; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Efb1yhqV4zYIOKTnZF5G7JuyCcgU9v/kNVgXbrLxcDk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnwGcdfjQ67CZ0jZaNq5LQpKCmgZxZ1Afq0HRlh
 gCE1x+7neCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8BnHQAKCRAEWL7uWMY5
 RuL5D/9UZalGOS9wraC6J++bOFSrBAUvyf31eCiyV8SG0YJGirNJnFU0qOZkv4fwkbAQ82Z0ik+
 +VX3mKOjHu7UDsEpm1TAf8eycvIe4fsqttMEjOykgfU1ZGSS4kz/O9FPa2kXtJzIfaVCl3l5wK6
 gB7ievfsaDRdfPlQYCTDDU+w+lQk9yNHM8E+HGwWu6v8mM46e10S1f4SUo56m0N9rLryukdfv8z
 wyVvoL+nGDB9blQUbl7SWhR8ocZM1y/biSer0ZmFH8mr7lx7SX9uNFwVaHYKBG9TjQBuc56Y4iZ
 KXfBB8CmR3hqSPhafnwK6pqsPKUOT134QZCBx6Sd23mNodhV0tJoBXAerYd5Tdmem+2myX98voN
 RDtCwJzLQ88F1RSWOc6ByK2hTSoQpl0/9OtWRAU5ZR1ham9WOySIQeiUPSGD2f9Go60Oyj/kK7L
 xDS6/7qMPYnhauLcTTtVwiCbYyA0h/MBCBCS9u3hAgTO1esPareFIvwtvoFof9cphKV4nG83eKT
 UeaWTLlaJxHP2UlFIoAqEpjDMHJ+3QMOl1/5rf9pMfKldZKkvpTQ1DGLryPHQFEimatJTMCea61
 iQNXoV9NzDw/NG/tKHq2J42zmuCEA57IdRL1AT2cIjqlBSvbfPXk+cCpeaiF1THRi8uK0q2V7AC iq0t1L4Mwe7AWlQ==
X-Mailer: b4 0.14.1
Message-ID: <20250227-miscdevice-fops-change-v1-1-c9e9b75d67eb@google.com>
Subject: [PATCH] rust: miscdevice: change how f_ops vtable is constructed
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Alice Ryhl <aliceryhl@google.com>
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

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/miscdevice.rs | 297 ++++++++++++++++++++++------------------------
 1 file changed, 143 insertions(+), 154 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index e14433b2ab9d..fa9ecc42602a 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -35,7 +35,7 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
         let mut result: bindings::miscdevice = unsafe { MaybeUninit::zeroed().assume_init() };
         result.minor = bindings::MISC_DYNAMIC_MINOR as _;
         result.name = self.name.as_char_ptr();
-        result.fops = create_vtable::<T>();
+        result.fops = MiscdeviceVTable::<T>::build();
         result
     }
 }
@@ -160,171 +160,160 @@ fn show_fdinfo(
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
+        // associated `struct miscdevice` before calling into this method. Furthermore,
+        // `misc_open()` ensures that the miscdevice can't be unregistered and freed during this
+        // call to `fops_open`.
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
+        // This overwrites the private data with the value specified by the user, changing the type
+        // of this file's private data. All future accesses to the private data is performed by
+        // other fops_* methods in this file, which all correctly cast the private data to the new
+        // type.
+        //
+        // SAFETY: The open call of a file can access the private data.
+        unsafe { (*raw_file).private_data = ptr.into_foreign() };
 
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
-    unsafe { (*raw_file).private_data = ptr.into_foreign() };
+        0
+    }
 
-    0
-}
+    /// # Safety
+    ///
+    /// `file` and `inode` must be the file and inode for a file that is being released. The file
+    /// must be associated with a `MiscDeviceRegistration<T>`.
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
+        match T::ioctl(device, file, cmd, arg) {
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
-    match T::ioctl(device, file, cmd, arg) {
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
+        match T::compat_ioctl(device, file, cmd, arg) {
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
-    match T::compat_ioctl(device, file, cmd, arg) {
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
+        // SAFETY: The caller ensures that the pointer is valid and exclusive for the duration in
+        // which this method is called.
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
+            Some(bindings::compat_ptr_ioctl)
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
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250117-miscdevice-fops-change-260352fd8957

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

