Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C69211A08
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733913469; cv=none; b=GLD3pKrXTNjmifE6YZWiU546/gpsBdg+KKw8b7HdYBIcdfPleysbEZRHw3EXIP/WiFkKPKMY0vZaBJvv0tqgij+fONs4lQ0XYExCAqVVNQ9eYMV/pKCqy02eLWQ4Wphg3DPppO3KqizK3L3SdsbX9sEWwcsR5qFFTdoxip03Pgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733913469; c=relaxed/simple;
	bh=seaPzXRr+ND8q/GQYnUjLUdeX+eDlOtmUd9qc8R35Uw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bVJFS/xju/YMf5XQv/pdxq/pjT11fhj5oxhipcfxOHX6P0pcC2hf2QOUqr5FK1FVsXYFSRtwGI8JNlJlbox4mfezX4pM9nv1YDA7fVmMMAgKB10EE/0WHP4bnS3wPHoNncOarLja2x3gZ/TyuDGQ7RREyGUDxdQKzHKzEtGoaHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r4zwL1Sl; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r4zwL1Sl"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-434f852cb35so2245985e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 02:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733913465; x=1734518265; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H9J7APDOlzo7bms4ez8DHMnNHWyqhL35jyR1kYpr9QI=;
        b=r4zwL1SlABpgTLct/fbhgNey/m5H+/wHBmv4fAoNu761+s6Bb5bMSvehYbvoBpUa8X
         rjP88O0OohFmW8QThTlXG92uc/A+iJeBhXBH3vX7uljjchcaPXTIkOXbJHQMFrqWjGg5
         aEFCRC5ji5wzjtvR3Lk1I4v8WJB6DKOJZ2UVv1zBmx5ekIXHSqXN3MWw2VB6/FDzqUQP
         ULkhd+lETKksuttnkYln970qzJ1akFKquDIujrPjKt39X7t6sF/6uLoKkGdk+t/wKZtA
         vgGBR7pS2SqL/J9Q+bEW1aT7W8ZxZIFBgWhYZTgHTogWH+isnc1FLQWwCZnGRsEg9T5i
         FDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733913465; x=1734518265;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H9J7APDOlzo7bms4ez8DHMnNHWyqhL35jyR1kYpr9QI=;
        b=S7of81O4eXwEYedQEIpl+07s2ZoxkGKbZ3zGirwiHRl1T+olsOVHHs3YiMDo+bWIRS
         4MnrJ2wpzJ9ZPSGWM9a7VvbY4CDkfVxEqinhlVe+SWf+oZ0K+CKisuGxU77eeAt0sfL4
         /aM6xJAHBZRjgU4DwIcnx9JXpk1UBTEehASQ7WctCjiE4v7T2TyOc9GrtUR/5iqNy6O5
         jwNu01kSz1P81eFuSgehmtptLC/9iIuPfXRERBcPXVTbX+u8Z01iHyNti0DTamN7RKnx
         8gThTwTk5oLRNVmziSW9frTPAPRIXvTIN5qgWU2GJ5fBDo7cnfsSz/LXdn/GSp1Q23mK
         oI0g==
X-Forwarded-Encrypted: i=1; AJvYcCUgA0aG/o+sNXEnYpR4+UceCy822Gyh2bVeOyT4TiAs41FNhjhKuwLy7hDV9/1DwzBIg1IOXKq/H/DcZEtv9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7g7HQina8RQMcb7COnm5ZsXZddF6ibTzO8iCla0FfAlEttR60
	prFSow+2yHyZgcYLXONEU9eBZhMKkcP0dmwTPBWm/z0MaWRiNU4rnlky9WJ72BZh9ICrfo99E11
	fu02qr3BodV4b0Q==
X-Google-Smtp-Source: AGHT+IEHXGYW3IxnBDufE3uW2/yO/pfGqLpiPsVXzHTtpypegQgEznYG6piRm0MwSTPxkbuG6wjEylcUkB+RemI=
X-Received: from wmlu15.prod.google.com ([2002:a05:600c:210f:b0:434:f0d4:cbaf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b94:b0:434:f0df:9f6 with SMTP id 5b1f17b1804b1-4361c346814mr18704535e9.3.1733913465503;
 Wed, 11 Dec 2024 02:37:45 -0800 (PST)
Date: Wed, 11 Dec 2024 10:37:10 +0000
In-Reply-To: <20241211-vma-v11-0-466640428fc3@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241211-vma-v11-0-466640428fc3@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8235; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=seaPzXRr+ND8q/GQYnUjLUdeX+eDlOtmUd9qc8R35Uw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnWWtph/aiDjcWSnagWFqg3c8CayEabkssTHofo
 IIZe48WPGWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ1lraQAKCRAEWL7uWMY5
 RhAmD/48pALXpz/NRk7/Fwz/9MCuo0u66DfT05kQmm6LINIciACvTECWnSEQ0tqAKRNpsp/3Fex
 M4Jpu48j5eDcPWEe/l1C35rsiOmHX4W4JVrnnbQZp+/CjgyqyKCcGdDeeAsbF9Fup1VX8msId3D
 /03PP6NhmDZYipxZdlby2oUlmR34VgBi5vhQUaLndkfR7m4sEFY9dttHnlypa8gl+V0gKxmY79U
 9JhN1ZFWyvUIYXm8lClnAsbDLy08fgFrDbEUeFzSMhVR1kTYVdrrhv5dekv/RSP83A632PXlet0
 PYeKGYna7WKapvDmtx8K7d0S/9kzlS2ohG7IDbWe5ZGerwfda1ceER8EtUwLQcpx6Lodt9LYOWU
 0WrCa6ARlGG4I/YVU2U6dzSxkYI3Kozqnl6EzH58UkK9BXMGdSGAL+HX19s8k94rmcbVe5P7PHi
 W+05YwL+uuVwdmWJJ3JWrwvQTW1iF2nFdQXtgZ2iGluLiOIQYSiG9J8og/1HIcZ0hzT7VTzDTL7
 8A3/CIHP3KV5PwM6wFMQXsbOnuL1jQF2ZQmrxOfLskPlDXn3meCorLLNaO9pkEG5rjCOyNHwD6p
 7r6CLbjSBFYOiYh8+hJVc36KbYuQafNb+ARWM1sWBLGLoe0W8HWuM103Eetus0orFCyJ79zlJFI VIEfxrJdZ6KH4lQ==
X-Mailer: b4 0.13.0
Message-ID: <20241211-vma-v11-6-466640428fc3@google.com>
Subject: [PATCH v11 6/8] mm: rust: add VmAreaNew for f_ops->mmap()
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This type will be used when setting up a new vma in an f_ops->mmap()
hook. Using a separate type from VmAreaRef allows us to have a separate
set of operations that you are only able to use during the mmap() hook.
For example, the VM_MIXEDMAP flag must not be changed after the initial
setup that happens during the f_ops->mmap() hook.

To avoid setting invalid flag values, the methods for clearing
VM_MAYWRITE and similar involve a check of VM_WRITE, and return an error
if VM_WRITE is set. Trying to use `try_clear_maywrite` without checking
the return value results in a compilation error because the `Result`
type is marked #[must_use].

For now, there's only a method for VM_MIXEDMAP and not VM_PFNMAP. When
we add a VM_PFNMAP method, we will need some way to prevent you from
setting both VM_MIXEDMAP and VM_PFNMAP on the same vma.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
Reviewed-by: Jann Horn <jannh@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/mm/virt.rs | 181 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 180 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
index 3a23854e14f4..6d9ba56d4f95 100644
--- a/rust/kernel/mm/virt.rs
+++ b/rust/kernel/mm/virt.rs
@@ -6,7 +6,7 @@
 
 use crate::{
     bindings,
-    error::{to_result, Result},
+    error::{code::EINVAL, to_result, Result},
     mm::MmWithUser,
     page::Page,
     types::Opaque,
@@ -171,6 +171,185 @@ pub fn vm_insert_page(&self, address: usize, page: &Page) -> Result {
     }
 }
 
+/// A builder for setting up a vma in an `f_ops->mmap()` hook.
+///
+/// # Invariants
+///
+/// For the duration of 'a, the referenced vma must be undergoing initialization in an
+/// `f_ops->mmap()` hook.
+pub struct VmAreaNew {
+    vma: VmAreaRef,
+}
+
+// Make all `VmAreaRef` methods available on `VmAreaNew`.
+impl Deref for VmAreaNew {
+    type Target = VmAreaRef;
+
+    #[inline]
+    fn deref(&self) -> &VmAreaRef {
+        &self.vma
+    }
+}
+
+impl VmAreaNew {
+    /// Access a virtual memory area given a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `vma` is undergoing initial vma setup for the duration of 'a.
+    #[inline]
+    pub unsafe fn from_raw<'a>(vma: *const bindings::vm_area_struct) -> &'a Self {
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
+        // shared. Additionally, `VmAreaNew` is `!Sync`, so it cannot be used to write in parallel.
+        // The caller promises that this does not set the flags to an invalid value.
+        unsafe { (*self.as_ptr()).__bindgen_anon_2.__vm_flags = flags };
+    }
+
+    /// Set the `VM_MIXEDMAP` flag on this vma.
+    ///
+    /// This enables the vma to contain both `struct page` and pure PFN pages. Returns a reference
+    /// that can be used to call `vm_insert_page` on the vma.
+    #[inline]
+    pub fn set_mixedmap(&self) -> &VmAreaMixedMap {
+        // SAFETY: We don't yet provide a way to set VM_PFNMAP, so this cannot put the flags in an
+        // invalid state.
+        unsafe { self.update_flags(flags::MIXEDMAP, 0) };
+
+        // SAFETY: We just set `VM_MIXEDMAP` on the vma.
+        unsafe { VmAreaMixedMap::from_raw(self.vma.as_ptr()) }
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
+    pub fn get_read(&self) -> bool {
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
+        if self.get_read() {
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
+    pub fn get_write(&self) -> bool {
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
+        if self.get_write() {
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
+    pub fn get_exec(&self) -> bool {
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
+        if self.get_exec() {
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
2.47.1.613.gc27f4b7a9f-goog

