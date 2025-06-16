Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E6B2CCDE
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 13:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081566; cv=none; b=eT+nExKJBYdmj8CtsQB1W2g9YnZ607TzcdZhTCHgdigO2/HT4mFxkv48cA3LYRcwYY8E75ksvnzpwgkxZ3KmMAJ0aHuRjLYBDN29PwbqYgkQLST4NyztUa6HpwjrX0kMxsgH5lX4gU7Jik0K81HlLJgwvKcqxG2SGp3LyQbrxwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081566; c=relaxed/simple;
	bh=aEbYFDucCdn8AY05gAnUYahnE5uqdSom+qcx0sFTvP0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=WrHaBPE+GGaRnzJITb5YzHIJZXz3VUV4Gs3Y+B/d7IjvdcBWFbytouW4lfyhtWmjG29Ph4SBFywjYtgOKXm5BzXBCdGmKSTGRtIpccgRLV9jQDMG9Yrd37HhccEDTnTQUeRktpt6UpS8iqdy2xN3afhkBoPVv3QM+LbEcdLR8IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZdyRuDGv; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZdyRuDGv"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-450d290d542so28049135e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 06:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750081562; x=1750686362; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DsEGPretBT8k50L7A/h44CtJ+/WU/apHALpuC2yw0NM=;
        b=ZdyRuDGvrXchKYZamRfqxB8h5tYW10kBJkjAzDkTFYqRozGZp8eUKMaBf1zyias5G5
         yYmIsl2Cu/fQ3nLnejqgbh/xY6oEeu5t2yw35JfP8ArqAceP3wcc1RBsMWKBf/kVzix1
         b76Bq+PnpDOyaQzcGq/5tJYJosPdzNVKtMx8Spg2DkMBSExAJ/xEjxLUTWPy7i3VKVf8
         qxmIrRjMpLZceijFiYK1hiW1XSyY7t9aEqhyXXmb7Ia1WZfJHS5M7w+LZxE80dhIwzEd
         TJXtQnEiYv02ctn9AdXQIkgWZl/aiQ08jqkv/Bb1XxiHdva0Cl5fi9TgrhxbCtEXeQ4Y
         xWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750081562; x=1750686362;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DsEGPretBT8k50L7A/h44CtJ+/WU/apHALpuC2yw0NM=;
        b=mOxAHNpMztdxhTRhUWSIW36IlXU4QJmesGFADxKQ2eIJ1EnPpgT2mrE6u326oc0GtV
         /7QZg0Ki9LM7F4c277UOMePVGj3zrTYF0Zkgq3os5EZoj9g2f9QhPkgkHQBS8Vj46rsb
         xBh4l/+973R6za4r6NyMRq/ngsXBCaw04c+C9o1prh8q6lnKxTB6ohD2m20ERHAw0ZVJ
         mKt5w9mygJpqugRJGxNXwpihTXWJlYkCacxMHHM9Ccs7o0iz9WNzExU7S9C+4/AtITfd
         XT2mOdKJONTzdduOq4lASIxESIKri+6HI5SxPg9WK1b2UT9fpH/WEP0t9vGRKEc7f+sl
         34Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUEj2L1xUwfxJ3wmJB5yimriy2A0Lc9O3d5DO6mZFEr5R5UlITL0pbqJf+a1dv4DELF8BDbW7d6uoAz6A34qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7cTk9eNDjXtIvzWOPtMOdnEyP0Un5d+1m1P20Dxwp0S/3bNMC
	zWcx0hPRwMknzjIAATBkR8oBxvofE95V3K2dQ3ee4eAk92IZg8evfwE0s7NczE89bXgkToDM5m5
	/Reco416QzxoishtOiw==
X-Google-Smtp-Source: AGHT+IEZ52fUSowyyD58XOxmQDJWiWmP164DOzf7++UqplO0kQRJTzmzZ/pjAzWN7tuj52f0Aw+/Sl7pMetgqeo=
X-Received: from wmbh14.prod.google.com ([2002:a05:600c:a10e:b0:450:da87:cebb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c12:b0:441:d43d:4f68 with SMTP id 5b1f17b1804b1-4533ca6acccmr99911965e9.15.1750081562375;
 Mon, 16 Jun 2025 06:46:02 -0700 (PDT)
Date: Mon, 16 Jun 2025 13:45:57 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABQgUGgC/3XPQW7DIBAF0KtYrDsR4EBsr3qPqgsbBgepNi4QW
 ivy3YPJIq2iLP9I8/7MlQT0FgPpqivxmGywbs6hfquIOvfziGB1zoRTLqigEi55YYkeZvyJ64L
 ADZW0bYSq64HkrcWjsb9F/Pi8Z4/flwzH+/DhdlVRj/wIIfpZLSsY76ZSAcxwTeVAldbYJbHTQ
 x8QlJsmG7sqyQOT4BUje8vZhuj8Wt5IrNS8vDgxYNBTI02jsDVKvI/OjV94yHTBEv8D8NMzwHf g1LSaS2nyjf+Abdtut72MvVYBAAA=
X-Change-Id: 20250506-userptr-newtype-2f060985c33b
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=9741; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=aEbYFDucCdn8AY05gAnUYahnE5uqdSom+qcx0sFTvP0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoUCAYhlKPflbkCgrFcs3ABF21XUvxW6EPWSIiG
 CnjaeWxt5mJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaFAgGAAKCRAEWL7uWMY5
 RgsLD/9PPICxmq0LF68XUucW8VBmkgIuB+sSTUBedRX9+cYan2xuNKvR08Ex0DvtPtAXOA1eVAS
 hPzEVZTIR+2AdyO1wcltQHFRz6IUEb+JRQ+QUdzghMg1rCRYSUq2lfJcTHlk21tiwKlmqt/34Fn
 8ERt5/9QgixA78C/oobYD9yzhbyi1MI2T2lov1Np1O652AEWTJmUVkVFizUohST6IWv398ae4OP
 uNojXCsd/bcSRC8/rtQfwYaYrpTrmCOgPOtzavuUoaVCYyiwq1pCb7XGu1OXoPZX/+jy7xpDpcQ
 I6gIwIHvkzM9dhgrRTyhB5RJGuB/GJtdjRIG9Y2l6C61ZhxZzW0dY1z3pgqo0W5gNapqbvjQNbW
 npTBe8CPLcqr9rBP5sFBox5viT2ii+bBUug6u7CZ7yFY2eHq/mo8nk2WKu4uJ5t9gwpGfW2U/UP
 GPDo6R2LIYGrFhk1PExFUhPhKpHiYcfztBo5QeOnh6vfoRTUV5F85iYCA8vXqPr8jy2QgrGIUeo
 ig0fNjjr8BHRZdIUWadLS6fFIoqVjeW/B0LTMdpzrc71RUTrd5SsA7OKCbDgDsJ2k+hG9GirL9p
 vSPKcgxflBKczXbHfKMfbt9tiz8/pTM8ZvDd2w8f4dymtfTj02KRt0uz96u/JSdfxVQsaI2Lh8L AGJPFIv68pE99oQ==
X-Mailer: b4 0.14.2
Message-ID: <20250616-userptr-newtype-v3-1-5ff7b2d18d9e@google.com>
Subject: [PATCH v3] uaccess: rust: use newtype for user pointers
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Currently, Rust code uses a typedef for unsigned long to represent
userspace addresses. This is unfortunate because it means that userspace
addresses could accidentally be mixed up with other integers. To
alleviate that, we introduce a new UserPtr struct that wraps a raw
pointer to represent a userspace address. By using a struct, type
checking enforces that userspace addresses cannot be mixed up with
anything else.

This is similar to the __user annotation in C that detects cases where
user pointers are mixed with non-user pointers.

Note that unlike __user pointers in C, this type is just a pointer
without a target type. This means that it can't detect cases such as
mixing up which struct this user pointer references. However, that is
okay due to the way this is intended to be used - generally, you create
a UserPtr in your ioctl callback from the provided usize *before*
dispatching on which ioctl is in use, and then after dispatching on the
ioctl you pass the UserPtr into a UserSliceReader or UserSliceWriter;
selecting the target type does not happen until you have obtained the
UserSliceReader/Writer.

The UserPtr type is not marked with #[derive(Debug)], which means that
it's not possible to print values of this type. This avoids ASLR
leakage.

The type is added to the prelude as it is a fairly fundamental type
similar to c_int. The wrapping_add() method is renamed to
wrapping_byte_add() for consistency with the method name found on raw
pointers.

Reviewed-by: Benno Lossin <lossin@kernel.org>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
This is based on top of the strncpy_from_user for Rust patch.
https://lore.kernel.org/r/20250616-strncpy-from-user-v5-0-2d3fb0e1f5af@google.com

I don't see a clear owner of uaccess in MAINTAINERS, so I suggest that
it lands through Miguel's tree.
---
Changes in v3:
- Use ptr::wrapping_byte_add in UserPtr::wrapping_byte_add.
- Add missing #[inline].
- Add Reviewed-by tags.
- Rewrite commit message.
- Rebase on v5 of strncpy_from_user.
- Link to v2: https://lore.kernel.org/r/20250527-userptr-newtype-v2-1-a789d266f6b0@google.com

Changes in v2:
- Change usize to raw pointer.
- Make field private.
- Rename wrapping_add to wrapping_byte_add.
- Add to prelude.
- Rebase on v4 of strncpy_from_user
- Link to v1: https://lore.kernel.org/r/20250506-userptr-newtype-v1-1-a0f6f8ce9fc5@google.com
---
 rust/kernel/prelude.rs           |  2 ++
 rust/kernel/uaccess.rs           | 71 +++++++++++++++++++++++++++++++++-------
 samples/rust/rust_misc_device.rs |  2 ++
 3 files changed, 63 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 2f30a398dddd1e4529fd9811c64f8371ac80ceca..9a1a830f605c1dc9c819ef731d0c07124cb1742b 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -46,3 +46,5 @@
 pub use super::init::InPlaceInit;
 
 pub use super::current;
+
+pub use super::uaccess::UserPtr;
diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 106aa05ea1b88868fe48f64ca9c86b20ad7db68e..c41a370b2ea886216ff2068b964fb8c44c63b247 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -14,8 +14,51 @@
 };
 use core::mem::{size_of, MaybeUninit};
 
-/// The type used for userspace addresses.
-pub type UserPtr = usize;
+/// A pointer into userspace.
+///
+/// This is the Rust equivalent to C pointers tagged with `__user`.
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub struct UserPtr(*mut c_void);
+
+impl UserPtr {
+    /// Create a `UserPtr` from an integer representing the userspace address.
+    #[inline]
+    pub fn from_addr(addr: usize) -> Self {
+        Self(addr as *mut c_void)
+    }
+
+    /// Create a `UserPtr` from a pointer representing the userspace address.
+    #[inline]
+    pub fn from_ptr(addr: *mut c_void) -> Self {
+        Self(addr)
+    }
+
+    /// Cast this userspace pointer to a raw const void pointer.
+    ///
+    /// It is up to the caller to use the returned pointer correctly.
+    #[inline]
+    pub fn as_const_ptr(self) -> *const c_void {
+        self.0
+    }
+
+    /// Cast this userspace pointer to a raw mutable void pointer.
+    ///
+    /// It is up to the caller to use the returned pointer correctly.
+    #[inline]
+    pub fn as_mut_ptr(self) -> *mut c_void {
+        self.0
+    }
+
+    /// Increment this user pointer by `add` bytes.
+    ///
+    /// This addition is wrapping, so wrapping around the address space does not result in a panic
+    /// even if `CONFIG_RUST_OVERFLOW_CHECKS` is enabled.
+    #[inline]
+    pub fn wrapping_byte_add(self, add: usize) -> UserPtr {
+        UserPtr(self.0.wrapping_byte_add(add))
+    }
+}
 
 /// A pointer to an area in userspace memory, which can be either read-only or read-write.
 ///
@@ -177,7 +220,7 @@ impl UserSliceReader {
     pub fn skip(&mut self, num_skip: usize) -> Result {
         // Update `self.length` first since that's the fallible part of this operation.
         self.length = self.length.checked_sub(num_skip).ok_or(EFAULT)?;
-        self.ptr = self.ptr.wrapping_add(num_skip);
+        self.ptr = self.ptr.wrapping_byte_add(num_skip);
         Ok(())
     }
 
@@ -224,11 +267,11 @@ pub fn read_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> Result {
         }
         // SAFETY: `out_ptr` points into a mutable slice of length `len`, so we may write
         // that many bytes to it.
-        let res = unsafe { bindings::copy_from_user(out_ptr, self.ptr as *const c_void, len) };
+        let res = unsafe { bindings::copy_from_user(out_ptr, self.ptr.as_const_ptr(), len) };
         if res != 0 {
             return Err(EFAULT);
         }
-        self.ptr = self.ptr.wrapping_add(len);
+        self.ptr = self.ptr.wrapping_byte_add(len);
         self.length -= len;
         Ok(())
     }
@@ -262,14 +305,14 @@ pub fn read<T: FromBytes>(&mut self) -> Result<T> {
         let res = unsafe {
             bindings::_copy_from_user(
                 out.as_mut_ptr().cast::<c_void>(),
-                self.ptr as *const c_void,
+                self.ptr.as_const_ptr(),
                 len,
             )
         };
         if res != 0 {
             return Err(EFAULT);
         }
-        self.ptr = self.ptr.wrapping_add(len);
+        self.ptr = self.ptr.wrapping_byte_add(len);
         self.length -= len;
         // SAFETY: The read above has initialized all bytes in `out`, and since `T` implements
         // `FromBytes`, any bit-pattern is a valid value for this type.
@@ -386,11 +429,11 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
         }
         // SAFETY: `data_ptr` points into an immutable slice of length `len`, so we may read
         // that many bytes from it.
-        let res = unsafe { bindings::copy_to_user(self.ptr as *mut c_void, data_ptr, len) };
+        let res = unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), data_ptr, len) };
         if res != 0 {
             return Err(EFAULT);
         }
-        self.ptr = self.ptr.wrapping_add(len);
+        self.ptr = self.ptr.wrapping_byte_add(len);
         self.length -= len;
         Ok(())
     }
@@ -413,7 +456,7 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
         // is a compile-time constant.
         let res = unsafe {
             bindings::_copy_to_user(
-                self.ptr as *mut c_void,
+                self.ptr.as_mut_ptr(),
                 (value as *const T).cast::<c_void>(),
                 len,
             )
@@ -421,7 +464,7 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
         if res != 0 {
             return Err(EFAULT);
         }
-        self.ptr = self.ptr.wrapping_add(len);
+        self.ptr = self.ptr.wrapping_byte_add(len);
         self.length -= len;
         Ok(())
     }
@@ -445,7 +488,11 @@ fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> Result<us
 
     // SAFETY: `dst` is valid for writing `dst.len()` bytes.
     let res = unsafe {
-        bindings::strncpy_from_user(dst.as_mut_ptr().cast::<c_char>(), src as *const c_char, len)
+        bindings::strncpy_from_user(
+            dst.as_mut_ptr().cast::<c_char>(),
+            src.as_const_ptr().cast::<c_char>(),
+            len,
+        )
     };
 
     if res < 0 {
diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index c881fd6dbd08cf4308fe1bd37d11d28374c1f034..e7ab77448f754906615b6f89d72b51fa268f6c41 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -176,6 +176,8 @@ fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Se
     fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result<isize> {
         dev_info!(me.dev, "IOCTLing Rust Misc Device Sample\n");
 
+        // Treat the ioctl argument as a user pointer.
+        let arg = UserPtr::from_addr(arg);
         let size = _IOC_SIZE(cmd);
 
         match cmd {

---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250506-userptr-newtype-2f060985c33b
prerequisite-change-id: 20250424-strncpy-from-user-1f2d06b0cdde:v5
prerequisite-patch-id: a683dbdea04daab269af0a6c90873e4dd139fe31
prerequisite-patch-id: 3db271c7acaff1a96836640e034d0321e5f412f5

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

