Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0181A256F
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 16:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732897988; cv=none; b=btq+GHfoo4/T8Xo4TbqcpQgsatyhmILCRllN2uRxgxCAhhcHaxDiD4PogfpPOLCi10qPXEdQf5+wH4P21fUrhaYsSyPBogoAqrVtUv9JN4mEYMoqQzIRnShljaWQF0nkttSWWmVPdPvvxkkzww2YYwgumKg6NbLrkaNFrBmwHjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732897988; c=relaxed/simple;
	bh=gC7RalGfFyvdhxyetp0qLjWhd8M+19FgWoTk8eiPyqo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k7XuKuNiFHyqRc+FLMZ/2aPvSucdKfK2hirfdM9V/6okY9jcPrQLoHXWL7FokAiDmC6zG02lbz4YjaVS+MdIBVxiX0MR94ReYjWpt3nbYGU+yYW4CjhE4bnYb8JEyJf/2hHOia8oq0OvYf6bYBHO6GDxRhngwK8SaF46lowfMAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PM1QYGz6; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PM1QYGz6"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-434a37a57dfso17489385e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 08:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732897985; x=1733502785; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FQmeIT5gOsUotOB7o6QXCtotwfAnfjr1q7Rp4w0i4JU=;
        b=PM1QYGz6HpxWdrFKeEuuz7tj//0xKw8z4SrNqugh96q0NcUSCvIodwsobAx80uDF54
         ai3PgNAyHiD7SnJmaCpFf4aTmOIhWX1Xc+fPOOvKlQ9LbRH3HbCC45un0M3kR/gdf2Ig
         AhraUTjX4eqe3pBaStBeC808Bh1laRt/elK1TXLL9xPvip9zZow1p8v5GICEF/4UMAa5
         Yocn8A+5+GrQeFu0ECR6JFSHp/F/aC4mr6U287rfFvHtArLY9YkyaGUshv+IKl22F0Co
         zVeHRp323rJDzqyBaDaeMO/hjUdWA8XKIWYlPd4qbFVvaSCPOd0HlCA9i/eC34Ihflnr
         xzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732897985; x=1733502785;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQmeIT5gOsUotOB7o6QXCtotwfAnfjr1q7Rp4w0i4JU=;
        b=CrIHQv8VSWRPjm0OzItpIN8GaWxDU7a/6O2dq6eWLnNz+WDj5jpYlcUDm2xaflrel9
         ex8dwBNApWR5g94TtrWTTBnpGz4minjV+ZQZ5PW95lH7ZYHH0nmx827lbBRXYTvliSHG
         U8lymHTVWzjEuWkKiXQWHzGVeLQC9T6zoHtOn1nMGMZOa5601D7Tm0ep5rdiqQJmdT0D
         N2BXFPHG5z2hDiF/eDp2OkzWG7GxAF22zIoo1MeKtTa2I6mDOeFF7N3Me1ZAC+Kg8ZGa
         SFt2S9/7HzevWYljR2mqKRQOwmiFk+jz9owq2L0BogehSc5YPxCF77zbdUnIL+/prPjQ
         VGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqz5fZb03KSoPybz3mim1BPGj5X8y34pkLjcu2XN49nIoAbIuwSGWNiUrcjmoLCBT0K43dGxbQ5SbMEmEEVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8lw32yA8k5/hX1iGT5MbA3+pfJ00De85M62pGIEJO9I94+h2n
	e9fNQ1Swk3+lelkTiLCdnIXvJ4RmWvApj9Kgr8ixi4t4/GhOeu5s1DCbRJg4ROGCxJlqyce6Bg7
	rcp43zvR95q/5JA==
X-Google-Smtp-Source: AGHT+IFsZCkak00uYhITnMwKRsDF3s5UKpxdm1Ck5P9OOToSqry0Xi4dvkplER8/UfrYyNysD4wuKqkPHmyCm60=
X-Received: from wmbjx1.prod.google.com ([2002:a05:600c:5781:b0:42c:b2f6:e6dd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19cc:b0:42c:bb10:7292 with SMTP id 5b1f17b1804b1-434a9dbaee2mr101296295e9.1.1732897984863;
 Fri, 29 Nov 2024 08:33:04 -0800 (PST)
Date: Fri, 29 Nov 2024 16:32:39 +0000
In-Reply-To: <20241129-vma-v10-0-4dfff05ba927@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241129-vma-v10-0-4dfff05ba927@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8218; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=gC7RalGfFyvdhxyetp0qLjWhd8M+19FgWoTk8eiPyqo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnSeyw5vs6i/9T0252bYqbEn7nkN41XOkM+MXze
 3wvucuoTyGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ0nssAAKCRAEWL7uWMY5
 RgTfEACfVuMxx1SnP/BL8wCAsPuxX5JGhXxnfaLz7ZZzUax2XN12bzlMqd5YfYKXzKdwcoYnEwV
 94lofBlwvf6N8t5Sz959Mm2XikEzfX1OL3r9waiomQSC9WWgZcMbzlQSTFz64/ZuGS4bvAeRqA/
 w4o+9qWe1CE89aDPwR6zabLo4hkqThpqUaSw2ubox3Tw29PgjTJFY6ka5juhsobw1jIEfrFROBl
 raa4dfyZER0pRuJ1XdHUybuXA/9fi+nPi5/Is8WVM/WYi8CTgPvZvfeyo7cUXZhqS6asQgNcGHx
 WoXQlaMbC80sDbMtIJp5sRe5Leub6xL0sDvG1mdsi9tUqJE4t/tc9c6BT4cj7UVRgqMkUI/nDUe
 yFZiNPPdWYxuAQV/uJxvU5ZcX9hyMErXL3I1i9KfGCeHEUAW2KYxFO4POdMd9SP8/P1GLrl70zk
 LOjgMq4yUyeO8bFwU76m0th2qEkPUF4SawjKMSR8PrenLElrz0JU7e1Dn4V5JWOX16FxM+DBt7f
 P13GF+rp0/nalQifLMrem7cwLe3VIwclC5uzajUOW6fFdfpbddG1Ae/FfgjrOp4M3a8W7sKFp49
 8Vt+43lDn8Fe2EbwTiBlJqyMTRS5OYKfJIcFVvuybRRzWEGSiJQxlukqy2/sZHcTrI5MKdP3tnE gk+7FY2H7FGOs0w==
X-Mailer: b4 0.13.0
Message-ID: <20241129-vma-v10-6-4dfff05ba927@google.com>
Subject: [PATCH v10 6/8] mm: rust: add VmAreaNew for f_ops->mmap()
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
index fa1fd6aa703c..790b8cb91c27 100644
--- a/rust/kernel/mm/virt.rs
+++ b/rust/kernel/mm/virt.rs
@@ -6,7 +6,7 @@
 
 use crate::{
     bindings,
-    error::{to_result, Result},
+    error::{code::EINVAL, to_result, Result},
     page::Page,
     types::Opaque,
 };
@@ -161,6 +161,185 @@ pub fn vm_insert_page(&self, address: usize, page: &Page) -> Result {
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
2.47.0.338.g60cca15819-goog

