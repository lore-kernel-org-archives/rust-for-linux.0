Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8891224225A
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 13:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948172; cv=none; b=p43vmys6aE9Wp8q1YWOqfER7jQoSBjVKce30N/IkdnqoJwjcru81vrDyy4ybyQKx90YG6ivekmCUjyK5qPS5YI7mtst8CYeh3sfPVInDkyiYUpYmwllr3yhexo8tCyBEwemSwXiOdXt8dF/FRu0EV0NDIUbwaFqfGHAAfEttgp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948172; c=relaxed/simple;
	bh=QOlRN108XsMWfGHd4EUDmGqdXLByOcXjEpSpb+5Nkxw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LAdZdyxDlqNzxH1T756R2kbSTp5hu5IAm4XYMRotqeaXtk0nyNbg/JWdlffUTZ/9dKlY8Oahf9SNzM5A05eeHzb+GBdCijzmV+N9Y6unP4F1GzqNJuD9DkuvKfRzgVSPzL4tWia+H1RktRbYALSzNKkBg33EtpI5KvEAvO56Yf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hxafh0az; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hxafh0az"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-385dcadffebso3175760f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 05:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736948169; x=1737552969; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ya/fxaSnf1SEqFKMY4TDHESa1dZdTGioTOn3JAAXwI4=;
        b=Hxafh0az4QBe9D7ZQOEjhhjdlg7mg2O9ChK/2Oa4UcmArPtHrjjAqxG9cpJWlaSCOQ
         PXDnY0JMwj94e2GLcjiVzkCGTFuo5oqwln/d4QuydWCHV9JPH4e+txC4LzhwRQCyCE6f
         u8gU9Nia0/SnWhxxbAA5SNMpVRK4DdCkWdx1OpdLIstXOpfqX1tGJmA+hH8f4obTrO3R
         rcX/jiyxd/+h8V3jC7hN1b3+htOson2dDGZrlTzKZo5AV+dIxW7JfoJBYYcAf2rtH2c2
         dO14UonxFlJ7cVbKtEicOPuDM2urT2kjs/x/Ok0Z8oTYv1VIX1X70PbMLlTDnJEb1OPq
         MK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948169; x=1737552969;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ya/fxaSnf1SEqFKMY4TDHESa1dZdTGioTOn3JAAXwI4=;
        b=QUPX2QpNCuR5PJY3t8L6LCMbOdeuK1p4+Pr2aVLYOuQ4HEkBfqXu6/fU7yxRPKSdd/
         VZjaLQnNGqRq0pMkUFNbBQjWpeaIINoSwy9vfDBE3uY7tUonaBwYscFGTlrFHUfeLMPM
         stO+qkRozQYEDf/vt8ZGMx9kwV6UEpIAdcwTfo5WwKD4FSxnhBORBKDzqv2fpd0oJnhL
         xb0jW5y/+HdGb0MW4w7u/vDdPImhjzGSgffAKhPCrB+YN+qgJuZT4FKjKoG00mcp2IvJ
         Oor3nwYj302T63KypTVyB5u3voNkO5fg3X2vwt2i8tQiEhzKiOB5dovITDeXPiu2KhG0
         0ZOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy3AzzE1s239gi81oblKDOIYp7luASFFy7oeQ4Jb4ZA7Rbnpil8jWHViepE303iNNsT2GQIDpqBMzTjPDUVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRrLalmhQktDkQ+6ulVJNQ1+Uvap7btVbjiAPSy8hBkGeOCPFM
	a0IRF36vT8dsP8ypDZQrVpS+H25feSg1p6djKeWOXYfT4fZXReYwp0j2zEsF6R1LYBQgp2HQv8r
	lGLImWAyD/1rBJA==
X-Google-Smtp-Source: AGHT+IEEOUuyOBCf8IcyxS1o5uyy5iTIdNXcjMWrtrUVHUECJs06QuKQ9EcQ4AA8mLcrc83eTJVAQLiN4y8LWyQ=
X-Received: from wmbez6.prod.google.com ([2002:a05:600c:83c6:b0:434:fe2b:fea7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1acf:b0:385:e2c4:1f8d with SMTP id ffacd0b85a97d-38a87303f90mr22556236f8f.19.1736948169055;
 Wed, 15 Jan 2025 05:36:09 -0800 (PST)
Date: Wed, 15 Jan 2025 13:35:05 +0000
In-Reply-To: <20250115-vma-v12-0-375099ae017a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250115-vma-v12-0-375099ae017a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=11748; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=QOlRN108XsMWfGHd4EUDmGqdXLByOcXjEpSpb+5Nkxw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnh7m9WvlRbZQObnak5+wtq7CgBZq7hLM/eCfTF
 lPZEeBo+IWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ4e5vQAKCRAEWL7uWMY5
 Rm6yD/wP0UVoOG6bmiLYU6Qqhm25x+hZZB6dLvh4LLNZv7LLVM/H3ISW6cX7v8OttgZnVscdXBZ
 FJczNPPcDy0+wTAt8TScAmi1hE6+c9c4jn0dxHD6uAmwkK4LM1TmHzvZ9Pof6BsAICdqdLO0OtX
 Ahp+0oMGUjXonkRgsKkxdBb01kIKLJAYbn7F5dU1lcXci7Kigjp17uSrp0zUvLaZQpBATnOscW7
 Y0LAEpfiWW/VWokrxjJ7SghmqmTmQb1D+muAUO862QlkMwazGG1VwMHrZqvMiXgi3xA4x3YTDbF
 iZCUjoG54SpHUs/HEYMBRqFf4Q6pWVBgHwVPlc+9OliIEapK1l+pCfDaRnaCBSCP6oNo4Mejv27
 fS0AwXvap2o7b4crb+/HfxWbmQugSDmmeHvGWSU1de0Y+0rBiPx9weLukK6E3MrnJ7bJv+QeVUx
 +T9f/xdj8GcqK66LTI/YtjWBSEmBQoF0pQ4l5IJLZt+vN7X6y8dJxrNLvhQUe2M2idOSbTuoxSJ
 lIPgS9Rd5Q1y8VrIpl0tx34H8y0E6CN9Pk/Ks5ZkVT6+E9nBYJhNiYKOMhB9j2JDPzyWtLbON/q
 tH/fN1d/Dfni4vUv6L3OYcwjEBncMZr03OtqdKlVbSFF9OQVGDdZLxJSZCjrsKqNgCEiNP3qnUM O8kV99e5k87/X0g==
X-Mailer: b4 0.13.0
Message-ID: <20250115-vma-v12-2-375099ae017a@google.com>
Subject: [PATCH v12 2/8] mm: rust: add vm_area_struct methods that require
 read access
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

This adds a type called VmAreaRef which is used when referencing a vma
that you have read access to. Here, read access means that you hold
either the mmap read lock or the vma read lock (or stronger).

Additionally, a vma_lookup method is added to the mmap read guard, which
enables you to obtain a &VmAreaRef in safe Rust code.

This patch only provides a way to lock the mmap read lock, but a
follow-up patch also provides a way to just lock the vma read lock.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
Reviewed-by: Jann Horn <jannh@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/mm.c      |   6 ++
 rust/kernel/mm.rs      |  21 +++++
 rust/kernel/mm/virt.rs | 215 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 242 insertions(+)

diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
index 7201747a5d31..7b72eb065a3e 100644
--- a/rust/helpers/mm.c
+++ b/rust/helpers/mm.c
@@ -37,3 +37,9 @@ void rust_helper_mmap_read_unlock(struct mm_struct *mm)
 {
 	mmap_read_unlock(mm);
 }
+
+struct vm_area_struct *rust_helper_vma_lookup(struct mm_struct *mm,
+					      unsigned long addr)
+{
+	return vma_lookup(mm, addr);
+}
diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index 2fb5f440af60..ee1a062ec7d7 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -17,6 +17,8 @@
 };
 use core::{ops::Deref, ptr::NonNull};
 
+pub mod virt;
+
 /// A wrapper for the kernel's `struct mm_struct`.
 ///
 /// This represents the address space of a userspace process, so each process has one `Mm`
@@ -200,6 +202,25 @@ pub struct MmapReadGuard<'a> {
     _nts: NotThreadSafe,
 }
 
+impl<'a> MmapReadGuard<'a> {
+    /// Look up a vma at the given address.
+    #[inline]
+    pub fn vma_lookup(&self, vma_addr: usize) -> Option<&virt::VmAreaRef> {
+        // SAFETY: We hold a reference to the mm, so the pointer must be valid. Any value is okay
+        // for `vma_addr`.
+        let vma = unsafe { bindings::vma_lookup(self.mm.as_raw(), vma_addr as _) };
+
+        if vma.is_null() {
+            None
+        } else {
+            // SAFETY: We just checked that a vma was found, so the pointer is valid. Furthermore,
+            // the returned area will borrow from this read lock guard, so it can only be used
+            // while the mmap read lock is still held.
+            unsafe { Some(virt::VmAreaRef::from_raw(vma)) }
+        }
+    }
+}
+
 impl Drop for MmapReadGuard<'_> {
     #[inline]
     fn drop(&mut self) {
diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
new file mode 100644
index 000000000000..2c7de0460e0a
--- /dev/null
+++ b/rust/kernel/mm/virt.rs
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Virtual memory.
+//!
+//! This module deals with managing a single VMA in the address space of a userspace process. Each
+//! VMA corresponds to a region of memory that the userspace process can access, and the VMA lets
+//! you control what happens when userspace reads or writes to that region of memory.
+//!
+//! The module has several different Rust types that all correspond to the C type called
+//! `vm_area_struct`. The different structs represent what kind of access you have to the VMA, e.g.
+//! [`VmAreaRef`] is used when you hold the mmap or vma read lock. Using the appropriate struct
+//! ensures that you can't, for example, accidentally call a function that requires holding the
+//! write lock when you only hold the read lock.
+
+use crate::{bindings, mm::MmWithUser, types::Opaque};
+
+/// A wrapper for the kernel's `struct vm_area_struct` with read access.
+///
+/// It represents an area of virtual memory.
+///
+/// # Invariants
+///
+/// The caller must hold the mmap read lock or the vma read lock.
+#[repr(transparent)]
+pub struct VmAreaRef {
+    vma: Opaque<bindings::vm_area_struct>,
+}
+
+// Methods you can call when holding the mmap or vma read lock (or stronger). They must be usable
+// no matter what the vma flags are.
+impl VmAreaRef {
+    /// Access a virtual memory area given a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `vma` is valid for the duration of 'a, and that the mmap or vma
+    /// read lock (or stronger) is held for at least the duration of 'a.
+    #[inline]
+    pub unsafe fn from_raw<'a>(vma: *const bindings::vm_area_struct) -> &'a Self {
+        // SAFETY: The caller ensures that the invariants are satisfied for the duration of 'a.
+        unsafe { &*vma.cast() }
+    }
+
+    /// Returns a raw pointer to this area.
+    #[inline]
+    pub fn as_ptr(&self) -> *mut bindings::vm_area_struct {
+        self.vma.get()
+    }
+
+    /// Access the underlying `mm_struct`.
+    #[inline]
+    pub fn mm(&self) -> &MmWithUser {
+        // SAFETY: By the type invariants, this `vm_area_struct` is valid and we hold the mmap/vma
+        // read lock or stronger. This implies that the underlying mm has a non-zero value of
+        // `mm_users`.
+        unsafe { MmWithUser::from_raw((*self.as_ptr()).vm_mm) }
+    }
+
+    /// Returns the flags associated with the virtual memory area.
+    ///
+    /// The possible flags are a combination of the constants in [`flags`].
+    #[inline]
+    pub fn flags(&self) -> vm_flags_t {
+        // SAFETY: By the type invariants, the caller holds at least the mmap read lock, so this
+        // access is not a data race.
+        unsafe { (*self.as_ptr()).__bindgen_anon_2.vm_flags as _ }
+    }
+
+    /// Returns the (inclusive) start address of the virtual memory area.
+    #[inline]
+    pub fn start(&self) -> usize {
+        // SAFETY: By the type invariants, the caller holds at least the mmap read lock, so this
+        // access is not a data race.
+        unsafe { (*self.as_ptr()).__bindgen_anon_1.__bindgen_anon_1.vm_start as _ }
+    }
+
+    /// Returns the (exclusive) end address of the virtual memory area.
+    #[inline]
+    pub fn end(&self) -> usize {
+        // SAFETY: By the type invariants, the caller holds at least the mmap read lock, so this
+        // access is not a data race.
+        unsafe { (*self.as_ptr()).__bindgen_anon_1.__bindgen_anon_1.vm_end as _ }
+    }
+
+    /// Zap pages in the given page range.
+    ///
+    /// This clears page table mappings for the range at the leaf level, leaving all other page
+    /// tables intact, and freeing any memory referenced by the VMA in this range. That is,
+    /// anonymous memory is completely freed, file-backed memory has its reference count on page
+    /// cache folio's dropped, any dirty data will still be written back to disk as usual.
+    ///
+    /// It may seem odd that we clear at the leaf level, this is however a product of the page
+    /// table structure used to map physical memory into a virtual address space - each virtual
+    /// address actually consists of a bitmap of array indices into page tables, which form a
+    /// hierarchical page table level structure.
+    ///
+    /// As a result, each page table level maps a multiple of page table levels below, and thus
+    /// span ever increasing ranges of pages. At the leaf or PTE level, we map the actual physical
+    /// memory.
+    ///
+    /// It is here where a zap operates, as it the only place we can be certain of clearing without
+    /// impacting any other virtual mappings. It is an implementation detail as to whether the
+    /// kernel goes further in freeing unused page tables, but for the purposes of this operation
+    /// we must only assume that the leaf level is cleared.
+    #[inline]
+    pub fn zap_page_range_single(&self, address: usize, size: usize) {
+        let (end, did_overflow) = address.overflowing_add(size);
+        if did_overflow || address < self.start() || self.end() < end {
+            // TODO: call WARN_ONCE once Rust version of it is added
+            return;
+        }
+
+        // SAFETY: By the type invariants, the caller has read access to this VMA, which is
+        // sufficient for this method call. This method has no requirements on the vma flags. The
+        // address range is checked to be within the vma.
+        unsafe {
+            bindings::zap_page_range_single(
+                self.as_ptr(),
+                address as _,
+                size as _,
+                core::ptr::null_mut(),
+            )
+        };
+    }
+}
+
+/// The integer type used for vma flags.
+#[doc(inline)]
+pub use bindings::vm_flags_t;
+
+/// All possible flags for [`VmAreaRef`].
+pub mod flags {
+    use super::vm_flags_t;
+    use crate::bindings;
+
+    /// No flags are set.
+    pub const NONE: vm_flags_t = bindings::VM_NONE as _;
+
+    /// Mapping allows reads.
+    pub const READ: vm_flags_t = bindings::VM_READ as _;
+
+    /// Mapping allows writes.
+    pub const WRITE: vm_flags_t = bindings::VM_WRITE as _;
+
+    /// Mapping allows execution.
+    pub const EXEC: vm_flags_t = bindings::VM_EXEC as _;
+
+    /// Mapping is shared.
+    pub const SHARED: vm_flags_t = bindings::VM_SHARED as _;
+
+    /// Mapping may be updated to allow reads.
+    pub const MAYREAD: vm_flags_t = bindings::VM_MAYREAD as _;
+
+    /// Mapping may be updated to allow writes.
+    pub const MAYWRITE: vm_flags_t = bindings::VM_MAYWRITE as _;
+
+    /// Mapping may be updated to allow execution.
+    pub const MAYEXEC: vm_flags_t = bindings::VM_MAYEXEC as _;
+
+    /// Mapping may be updated to be shared.
+    pub const MAYSHARE: vm_flags_t = bindings::VM_MAYSHARE as _;
+
+    /// Page-ranges managed without `struct page`, just pure PFN.
+    pub const PFNMAP: vm_flags_t = bindings::VM_PFNMAP as _;
+
+    /// Memory mapped I/O or similar.
+    pub const IO: vm_flags_t = bindings::VM_IO as _;
+
+    /// Do not copy this vma on fork.
+    pub const DONTCOPY: vm_flags_t = bindings::VM_DONTCOPY as _;
+
+    /// Cannot expand with mremap().
+    pub const DONTEXPAND: vm_flags_t = bindings::VM_DONTEXPAND as _;
+
+    /// Lock the pages covered when they are faulted in.
+    pub const LOCKONFAULT: vm_flags_t = bindings::VM_LOCKONFAULT as _;
+
+    /// Is a VM accounted object.
+    pub const ACCOUNT: vm_flags_t = bindings::VM_ACCOUNT as _;
+
+    /// Should the VM suppress accounting.
+    pub const NORESERVE: vm_flags_t = bindings::VM_NORESERVE as _;
+
+    /// Huge TLB Page VM.
+    pub const HUGETLB: vm_flags_t = bindings::VM_HUGETLB as _;
+
+    /// Synchronous page faults. (DAX-specific)
+    pub const SYNC: vm_flags_t = bindings::VM_SYNC as _;
+
+    /// Architecture-specific flag.
+    pub const ARCH_1: vm_flags_t = bindings::VM_ARCH_1 as _;
+
+    /// Wipe VMA contents in child on fork.
+    pub const WIPEONFORK: vm_flags_t = bindings::VM_WIPEONFORK as _;
+
+    /// Do not include in the core dump.
+    pub const DONTDUMP: vm_flags_t = bindings::VM_DONTDUMP as _;
+
+    /// Not soft dirty clean area.
+    pub const SOFTDIRTY: vm_flags_t = bindings::VM_SOFTDIRTY as _;
+
+    /// Can contain `struct page` and pure PFN pages.
+    pub const MIXEDMAP: vm_flags_t = bindings::VM_MIXEDMAP as _;
+
+    /// MADV_HUGEPAGE marked this vma.
+    pub const HUGEPAGE: vm_flags_t = bindings::VM_HUGEPAGE as _;
+
+    /// MADV_NOHUGEPAGE marked this vma.
+    pub const NOHUGEPAGE: vm_flags_t = bindings::VM_NOHUGEPAGE as _;
+
+    /// KSM may merge identical pages.
+    pub const MERGEABLE: vm_flags_t = bindings::VM_MERGEABLE as _;
+}

-- 
2.48.0.rc2.279.g1de40edade-goog

