Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69800284A6F
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948182; cv=none; b=A8tUJWzXufQkfIvsT4L1OwA+x8XGfHQXZxirJytv2+d2pN8C4/6qTit0RyPokYHEMVvOCnWWKsnvTIQudXIm3dpLQVho5yC/nqPolUMtOYPZFDN6Bvf/a4SvI2gKTEdWQSEjQnrfn20hMLuKWXfuAZx/cMoX2icaP4NW8rZlZfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948182; c=relaxed/simple;
	bh=XaI6NH0XnJmRP4+EcHKB+RqgempmG+WN3YGnzXiE0G8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ndCZLloiVrP6EK+aOYaPGlwHku1FmJ1hgftl6cgIUjqn3cj58LLch55RSvfK6FxxxyaeRH1vCjCVKw3ZWdYLNExleWo05crxcQ0pxzozbW652c1ulnsC/UtUqpjZTXAK7DfOIAqYagxDU3ZImTflcdNFsHKBRZcIjkdAu2dyRRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qnFKc0jD; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qnFKc0jD"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43624b08181so4454015e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 05:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736948178; x=1737552978; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DamytgltoVfeocbQeMx8nCBv52GuJHF7pCRdLZ/tNgc=;
        b=qnFKc0jDEl7R9p9iHwVeQMsvoDht8BxbRTxZrbycNdL1aWzK6OtH7rZfAB5luvaLfC
         qy4ev3qZ5SIYRDNF2Fd0iNnyn3v6dLoZsq1fRBonDFzwCp1aOtN0EkoHq6CE2HaA1UFW
         /8+WxrYbYvq0+JrkzYJJU2c612GOM3jtQMaRwKbtXW4G6ukThb1E59Tw2lt1uvCigi3N
         rDEtnxc9QQ1bLWK+/5Ljtl4ycVW2f7HWod6PHWEP4azvnaoVv99fUnoirQSlIZOCMNXJ
         UFsW9zjj8qmXSOpddFQJlzjADaeFZGh2Raj+Oo+GGRY9wwGWLLrPHfevG5+mszPbsZyl
         PkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948178; x=1737552978;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DamytgltoVfeocbQeMx8nCBv52GuJHF7pCRdLZ/tNgc=;
        b=XDjvh4MsdihM8IAhU61OlSSzJk9/+Uxh0baE4tAkqKjcqFHu3/fk46wO5U9zfUEjLj
         hDbqvjYoJKRl9EERAeRLrsdb8hMfQv9lnCCUw+TiKJmHveZ/2ejBFEmCuXlrcFfRVtLc
         2Bw6yoqhu/XUUSJvMH8KovKp9z7C8op9RdRj5O5FPXJ7q+WKiMXFlC03S9JI/4Sajzne
         vG2mF/MyqjoTU4Dz7PFDRcoTbwwWY2tGUo6qFL6zoC3/LAZf9+EtxQOcvxqGPre1zTdh
         wbU655hGZcHIXjzIgFLooerNd2UKLRRhZLPiCucK2VkRyvmv4nVQY8KkWy7e1/ZteH91
         opvw==
X-Forwarded-Encrypted: i=1; AJvYcCXkIZlCVXjGWbnsDr7Nvjx2YgPE0EJK6PtUDn+foPxYDX/CM3WCfWJO1uSNq1Gar6KyKb3q0mYMxMgWlMnb7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeZBPmVvYxgEx4qAUbWe/aN4eccxCiwTRUPuTS339qwJPiIClr
	vXsiXPzwj1Tk1K7Ss5jZ76YWhkYCN98v+20KEB1UOdyiZTnvTQ+K3Y1TiUhUHmdEATkhf944jw5
	WZW5wjto7PZ7Pdg==
X-Google-Smtp-Source: AGHT+IELx9AJKZV8sItrJFa+G/e/yL/ebbqw7wwoZFqBDXagGmIfBN3Ggcgo9ka6F5wgyrAjnxYDVlZBAHgwK54=
X-Received: from wmbez6.prod.google.com ([2002:a05:600c:83c6:b0:434:fe2b:fea7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5cc:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-437c6af202cmr25099885e9.4.1736948177970;
 Wed, 15 Jan 2025 05:36:17 -0800 (PST)
Date: Wed, 15 Jan 2025 13:35:09 +0000
In-Reply-To: <20250115-vma-v12-0-375099ae017a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250115-vma-v12-0-375099ae017a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8588; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=XaI6NH0XnJmRP4+EcHKB+RqgempmG+WN3YGnzXiE0G8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnh7nAGt/I2v83P5iCzUqj5ZXeXUI8e+dMSkVQz
 nx0HwcJCmOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ4e5wAAKCRAEWL7uWMY5
 RjcSD/47K/3DO60B2Djq16CVAghmS7WUkxL/INITcyHRwb6oJ8YyJhj8TK4JqkPdRZkgehr6WpE
 UqWj8HfVf2ETduU02zEMH7DeWGL0InDF98h6k1ceM5BxZJZv3YkLzK/RHzERmuSBXNAjSh6dvLX
 61fnzSxecO8s+2Wpew8AmqVgWbBGAjYEi+3VElElWycZMHTQqsu4s4Y3/9wnRBXF68JnTcaDPvI
 L/yuifcqD1EC8/mF6NiQkoW5S+gXPUOSUefteN9/S+ShXCUtGla0pyK2RzzAJqt1l6kP3p/nyzO
 OtLgYmlG7lSBWtX3opa/E1iQFE81tTvgbN1VGWVfp+ZW+HsGc8+Nij/6GNrobLS4GI98/75fpEj
 WRB78vEl0vEgcfRMi8GXtPKFWr0wwj7jhGbRpGutntjl46DzYxn4/lVriP/oGiGGPQHKXYc7LHU
 S3IuTdyr5eU5x9otUQ7z46m3ppB8ZooIYC/KFEUisOz9qkL4CSyyViR6UyM7AdpTrxG4gZOFCqg
 BNcWZr2LtyQm1HNI6UX61cMFt2zWQawXDoraJ1vfiImRSjc+IAZnDYnEKFyfoblOnhgLKv4SWGT
 +aE4UhZ5F9fPg5rnIYwlrOLeEhbbZ+f2FYtfsvVCemJTdoE5MikdWKLFvmu1AF7yL3LKhnDJ4S+ wcRVfT/ozzI9kkA==
X-Mailer: b4 0.13.0
Message-ID: <20250115-vma-v12-6-375099ae017a@google.com>
Subject: [PATCH v12 6/8] mm: rust: add VmAreaNew for f_ops->mmap()
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
 rust/kernel/mm/virt.rs | 186 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 185 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
index ab89a526d3e4..ef940973e231 100644
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
@@ -203,6 +203,190 @@ pub fn vm_insert_page(&self, address: usize, page: &Page) -> Result {
     }
 }
 
+/// A configuration object for setting up a VMA in an `f_ops->mmap()` hook.
+///
+/// The `f_ops->mmap()` hook is called when a new VMA is being created, and the hook is able to
+/// configure the VMA in various ways to fit the driver that owns it. Using `VmAreaNew` indicates
+/// that you are allowed to perform operations on the VMA that can only be performed before the VMA
+/// is fully initialized.
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
2.48.0.rc2.279.g1de40edade-goog

