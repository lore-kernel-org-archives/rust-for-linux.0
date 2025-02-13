Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CE4215190
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Feb 2025 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739444694; cv=none; b=LTgIoCWzNueH8XDIE8v1/8AjJO63Sw+/2dmRIEQTc0pdo+JoNR4p+NQaP7TQ4cfQC2n43ybW8MqmtKmtgTyYISoPCeK/yzOrg6TB/Ve8kZTpVSPywZk+J6dKJXEg/fM74jR4AfXV0vwFnetTZETRZDrRAyZ3d6UR4xVdAU5NJg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739444694; c=relaxed/simple;
	bh=7pYVDkxLGS09DigBqO6pbnQoHpQKADY37T16seVY/5M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T4qg8f8e9cniCSnLupR9fJMT9WV8qtXuJSi9tz+5Frmq47nX8a63Ape2PGsKGk9+beYumwve6yrj6l43rdrOPqUqGpGYnvpX/rg+N3MJKhCDzEBQ21RDrouILSCB+CAM4303eH8T5Fbgw1Dh/ULQgpL7UDAXktZQUKgLA3Ib8+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1d5Hjtbx; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1d5Hjtbx"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-38dd8d11139so560477f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Feb 2025 03:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739444690; x=1740049490; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uW/Ty2fOlXPxtDtxLZmFYWp7FZLpKD6TeMqqX/rT2JY=;
        b=1d5HjtbxRHQLSwemcoIEjR1BD9d8D2ChXvdZ8x4+3g4pq21dR/vL148F1NUPSGe86K
         KyqGIOx5mvSb5WAKl9dzInKKvYvJD66XBYZgbMZtE3zy6ui7GW4zaL3XoHi5D7zWiHqm
         8fBVPnYC0Up8Cr/4gsQYs0lCiqKpJkjWUNHkQRk9o/a+/FCt1ZPD8VU9kC9sz9ck++T0
         q2HRI3PiK9aaXIbRfsciYP9h4SDXV8V8gnWvzWTTNymwnm26fKj7YinCIE1vEjBSSDUt
         qY7zkD0yHz+aj+k/+aZJ8OFI4GnMcfnhEIgavh/2FyJtPHv8GW0vp1EhqP/vCkBwCt+R
         og6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739444690; x=1740049490;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uW/Ty2fOlXPxtDtxLZmFYWp7FZLpKD6TeMqqX/rT2JY=;
        b=QUc+de2qE92PlTMiffWpyRIfRcfqZEWsoziNgDx614kjI57amrMGHBSl5fUiWmOsE+
         ziIcFPPhvDRjed+QTYOTpd7kjUX1vYGKwAMVrd7f/hO7O23NMarZXB7TO7y7wy/paeeR
         C883scZoZFVdURvqAMkdnG5JgoSy1W38yGRVAYYAUnttOJb5rBPpgjNolmZ4M3NO5LKb
         ROiUU+v4bs9jLIvnKLKi9G5KbZyMXeVmqsBrNCNpEqG57aw2j2fV9+kAkTVHW/wWw5mP
         3N+72jaONWpA+1Px4bYJ+cB4pE+zbluFWOUUu+wcNKAA/BMvviprEk0+akAxMYJXX5aS
         U0aw==
X-Forwarded-Encrypted: i=1; AJvYcCX3CcACp02skygMczYGkSnOcDCCqD7AZ2FCxchFLC+LwaMJ6E2umVNdR/ATFzsl3p237WTVlB41aFtOANC0xA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygkfbXATLcuv10b9lC8hb3EnC4Mpv3qkIlGBjoaSX7wCk1V9nA
	68hUAgrkMbwZBl6ebbRiEZPqyDXacu9TUr6hyjMD/PCwD/YropEz2RgV/zIiRoO4ai74EDCd36Q
	TGeFTtCYIig4u4A==
X-Google-Smtp-Source: AGHT+IFf80WLAYmWuMESuCsRlEKC2D4+AWF643A9VnDB796H1Sc9MR5GfacRO+WmOsDE1DcsoXPNr2jsbgDj6bM=
X-Received: from wmpz19.prod.google.com ([2002:a05:600c:a13:b0:439:468e:a94b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:584c:0:b0:38f:28a1:501d with SMTP id ffacd0b85a97d-38f28a15761mr1140823f8f.25.1739444690305;
 Thu, 13 Feb 2025 03:04:50 -0800 (PST)
Date: Thu, 13 Feb 2025 11:04:05 +0000
In-Reply-To: <20250213-vma-v14-0-b29c47ab21f5@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250213-vma-v14-0-b29c47ab21f5@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8586; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=7pYVDkxLGS09DigBqO6pbnQoHpQKADY37T16seVY/5M=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnrdHBPqs4jQruLh6dcALn9+kKABa5Ht3oQjY1+
 +vcelNnxJGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ63RwQAKCRAEWL7uWMY5
 RoegD/9QReh2ab4/0o7RdV9QbH4EgO9m6OwqpDj+W9QmyXARO7Ruo0kO/4TqUdNIaMCj3jla/KV
 30nO+8ABp6pB+ytxxCEuWSbUNhYggNXvQ8yeOS6lQ+cZt4ltoU1HWlPUCLpqof8/DUXQwJxI0ZP
 gGmJzLTu3akLT46yhxKz2RbPo3uY5snGt2qFQ/dTg88bzz0+t2rQkwv43PkW829KZaCUq1kvflL
 DWvf3KjhbasZ4O29c89f/lJO4HDBt35g6SeDWNVOSTxZmQrqqkaB9crY+tSORD/SiCR5uYV9lpt
 gFXf3IJ8vx3toO1pJ4yHzYA3uA+HEzYi4OQyUebkScsjgOAlnLucnMjvl11NfcSbz0qtTVpMrsr
 A6K/o4ByC4bf4ZVMpf1bDcntvhlu+FGy8rPUr4QJ2GI62qz01/Zbg9lccJw6llQbYQGOh9WAIq8
 FLGwqlNQnDw3a1xEkSMstwXjBXg3ZHlnznMRV+m/P0VWp8aKx8hocFESO15ruq2Hbt8HYOeZkMe
 cSfm0aG4pe8B0ym7ao4oRSJXjupndKzMh/ukacbJJQ9J9QJqTP0Scxdvln6WlUf8uIXAhTyNjcR
 5d3V4cdKI9NhwmF3IqQVTbPvb269/pa4lnxzsbulPSkhqs7GzDlnjLgOJcI7sNXHr8kSu0RfPn6 EenvfoAFmtQcfdA==
X-Mailer: b4 0.13.0
Message-ID: <20250213-vma-v14-6-b29c47ab21f5@google.com>
Subject: [PATCH v14 6/8] mm: rust: add VmaNew for f_ops->mmap()
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This type will be used when setting up a new vma in an f_ops->mmap()
hook. Using a separate type from VmaRef allows us to have a separate set
of operations that you are only able to use during the mmap() hook. For
example, the VM_MIXEDMAP flag must not be changed after the initial
setup that happens during the f_ops->mmap() hook.

To avoid setting invalid flag values, the methods for clearing
VM_MAYWRITE and similar involve a check of VM_WRITE, and return an error
if VM_WRITE is set. Trying to use `try_clear_maywrite` without checking
the return value results in a compilation error because the `Result`
type is marked #[must_use].

For now, there's only a method for VM_MIXEDMAP and not VM_PFNMAP. When
we add a VM_PFNMAP method, we will need some way to prevent you from
setting both VM_MIXEDMAP and VM_PFNMAP on the same vma.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Jann Horn <jannh@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/mm/virt.rs | 186 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 185 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
index 3e2eabcc2145..31803674aecc 100644
--- a/rust/kernel/mm/virt.rs
+++ b/rust/kernel/mm/virt.rs
@@ -16,7 +16,7 @@
 
 use crate::{
     bindings,
-    error::{to_result, Result},
+    error::{code::EINVAL, to_result, Result},
     mm::MmWithUser,
     page::Page,
     types::Opaque,
@@ -198,6 +198,190 @@ pub fn vm_insert_page(&self, address: usize, page: &Page) -> Result {
     }
 }
 
+/// A configuration object for setting up a VMA in an `f_ops->mmap()` hook.
+///
+/// The `f_ops->mmap()` hook is called when a new VMA is being created, and the hook is able to
+/// configure the VMA in various ways to fit the driver that owns it. Using `VmaNew` indicates that
+/// you are allowed to perform operations on the VMA that can only be performed before the VMA is
+/// fully initialized.
+///
+/// # Invariants
+///
+/// For the duration of 'a, the referenced vma must be undergoing initialization in an
+/// `f_ops->mmap()` hook.
+pub struct VmaNew {
+    vma: VmaRef,
+}
+
+// Make all `VmaRef` methods available on `VmaNew`.
+impl Deref for VmaNew {
+    type Target = VmaRef;
+
+    #[inline]
+    fn deref(&self) -> &VmaRef {
+        &self.vma
+    }
+}
+
+impl VmaNew {
+    /// Access a virtual memory area given a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `vma` is undergoing initial vma setup for the duration of 'a.
+    #[inline]
+    pub unsafe fn from_raw<'a>(vma: *mut bindings::vm_area_struct) -> &'a Self {
+        // SAFETY: The caller ensures that the invariants are satisfied for the duration of 'a.
+        unsafe { &*vma.cast() }
+    }
+
+    /// Internal method for updating the vma flags.
+    ///
+    /// # Safety
+    ///
+    /// This must not be used to set the flags to an invalid value.
+    #[inline]
+    unsafe fn update_flags(&self, set: vm_flags_t, unset: vm_flags_t) {
+        let mut flags = self.flags();
+        flags |= set;
+        flags &= !unset;
+
+        // SAFETY: This is not a data race: the vma is undergoing initial setup, so it's not yet
+        // shared. Additionally, `VmaNew` is `!Sync`, so it cannot be used to write in parallel.
+        // The caller promises that this does not set the flags to an invalid value.
+        unsafe { (*self.as_ptr()).__bindgen_anon_2.__vm_flags = flags };
+    }
+
+    /// Set the `VM_MIXEDMAP` flag on this vma.
+    ///
+    /// This enables the vma to contain both `struct page` and pure PFN pages. Returns a reference
+    /// that can be used to call `vm_insert_page` on the vma.
+    #[inline]
+    pub fn set_mixedmap(&self) -> &VmaMixedMap {
+        // SAFETY: We don't yet provide a way to set VM_PFNMAP, so this cannot put the flags in an
+        // invalid state.
+        unsafe { self.update_flags(flags::MIXEDMAP, 0) };
+
+        // SAFETY: We just set `VM_MIXEDMAP` on the vma.
+        unsafe { VmaMixedMap::from_raw(self.vma.as_ptr()) }
+    }
+
+    /// Set the `VM_IO` flag on this vma.
+    ///
+    /// This is used for memory mapped IO and similar. The flag tells other parts of the kernel to
+    /// avoid looking at the pages. For memory mapped IO this is useful as accesses to the pages
+    /// could have side effects.
+    #[inline]
+    pub fn set_io(&self) {
+        // SAFETY: Setting the VM_IO flag is always okay.
+        unsafe { self.update_flags(flags::IO, 0) };
+    }
+
+    /// Set the `VM_DONTEXPAND` flag on this vma.
+    ///
+    /// This prevents the vma from being expanded with `mremap()`.
+    #[inline]
+    pub fn set_dontexpand(&self) {
+        // SAFETY: Setting the VM_DONTEXPAND flag is always okay.
+        unsafe { self.update_flags(flags::DONTEXPAND, 0) };
+    }
+
+    /// Set the `VM_DONTCOPY` flag on this vma.
+    ///
+    /// This prevents the vma from being copied on fork. This option is only permanent if `VM_IO`
+    /// is set.
+    #[inline]
+    pub fn set_dontcopy(&self) {
+        // SAFETY: Setting the VM_DONTCOPY flag is always okay.
+        unsafe { self.update_flags(flags::DONTCOPY, 0) };
+    }
+
+    /// Set the `VM_DONTDUMP` flag on this vma.
+    ///
+    /// This prevents the vma from being included in core dumps. This option is only permanent if
+    /// `VM_IO` is set.
+    #[inline]
+    pub fn set_dontdump(&self) {
+        // SAFETY: Setting the VM_DONTDUMP flag is always okay.
+        unsafe { self.update_flags(flags::DONTDUMP, 0) };
+    }
+
+    /// Returns whether `VM_READ` is set.
+    ///
+    /// This flag indicates whether userspace is mapping this vma as readable.
+    #[inline]
+    pub fn readable(&self) -> bool {
+        (self.flags() & flags::READ) != 0
+    }
+
+    /// Try to clear the `VM_MAYREAD` flag, failing if `VM_READ` is set.
+    ///
+    /// This flag indicates whether userspace is allowed to make this vma readable with
+    /// `mprotect()`.
+    ///
+    /// Note that this operation is irreversible. Once `VM_MAYREAD` has been cleared, it can never
+    /// be set again.
+    #[inline]
+    pub fn try_clear_mayread(&self) -> Result {
+        if self.readable() {
+            return Err(EINVAL);
+        }
+        // SAFETY: Clearing `VM_MAYREAD` is okay when `VM_READ` is not set.
+        unsafe { self.update_flags(0, flags::MAYREAD) };
+        Ok(())
+    }
+
+    /// Returns whether `VM_WRITE` is set.
+    ///
+    /// This flag indicates whether userspace is mapping this vma as writable.
+    #[inline]
+    pub fn writable(&self) -> bool {
+        (self.flags() & flags::WRITE) != 0
+    }
+
+    /// Try to clear the `VM_MAYWRITE` flag, failing if `VM_WRITE` is set.
+    ///
+    /// This flag indicates whether userspace is allowed to make this vma writable with
+    /// `mprotect()`.
+    ///
+    /// Note that this operation is irreversible. Once `VM_MAYWRITE` has been cleared, it can never
+    /// be set again.
+    #[inline]
+    pub fn try_clear_maywrite(&self) -> Result {
+        if self.writable() {
+            return Err(EINVAL);
+        }
+        // SAFETY: Clearing `VM_MAYWRITE` is okay when `VM_WRITE` is not set.
+        unsafe { self.update_flags(0, flags::MAYWRITE) };
+        Ok(())
+    }
+
+    /// Returns whether `VM_EXEC` is set.
+    ///
+    /// This flag indicates whether userspace is mapping this vma as executable.
+    #[inline]
+    pub fn executable(&self) -> bool {
+        (self.flags() & flags::EXEC) != 0
+    }
+
+    /// Try to clear the `VM_MAYEXEC` flag, failing if `VM_EXEC` is set.
+    ///
+    /// This flag indicates whether userspace is allowed to make this vma executable with
+    /// `mprotect()`.
+    ///
+    /// Note that this operation is irreversible. Once `VM_MAYEXEC` has been cleared, it can never
+    /// be set again.
+    #[inline]
+    pub fn try_clear_mayexec(&self) -> Result {
+        if self.executable() {
+            return Err(EINVAL);
+        }
+        // SAFETY: Clearing `VM_MAYEXEC` is okay when `VM_EXEC` is not set.
+        unsafe { self.update_flags(0, flags::MAYEXEC) };
+        Ok(())
+    }
+}
+
 /// The integer type used for vma flags.
 #[doc(inline)]
 pub use bindings::vm_flags_t;

-- 
2.48.1.502.g6dc24dfdaf-goog

