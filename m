Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C3F1DEFE0
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 15:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732290080; cv=none; b=SYVFN86PXpk+hu7CmbmhmclAOkArvf/yAxMVeChQTvh5ETjPjgk9hpF07p6Skydy3KZu4gHyfOrq3tGx265dBbx9Tby93v+2JdNN2TCyfwOFvpXJw7EvDjrZ1sIZBKxboJniZPYM+wUyNaIju5kY+wytU6e3kWQlaSiY6Z+829A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732290080; c=relaxed/simple;
	bh=8XMIdsAyhjsVKz2sE1Ods0Tz2Vq4I2NxznUSr3oMZoc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fCNQ5e/FEd5sV3fr+aKvtHXx+q/2YGdqfM4ojz+N7jSuHkM5zDu0cvmrIGd/GW/yiRFpD5ewXZtIUWgE2t3+voxbgbzUkqjHeRul+zlGDfwpel2qKrNP5Y6k8S7UXCLWcnb9CiT8EdwcqiTQLFkR9h0hpyZDu563Ckb3YyayxSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h+lluuPy; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h+lluuPy"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6ee6c2b65b9so38038107b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 07:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732290076; x=1732894876; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L4qSVcgbBLdeeMk9S8eo1cKOTa/uPhWh7RI1+zhYfKE=;
        b=h+lluuPyZtB2FOANaI0ezavn47KdHAMy33FbtAhXP0zYJr1mYTcwzJLe5k3dpsmh7h
         Qjw5aH9qB7Cb5OhIvIIQk9TM9jShhkhNVSHbOOlg9UpX8GzsZX9YYE3QS0LvY3ALANWK
         6jOYUodLeJRHpbMA2W4ZFuF9f1w644Na+JjPMn3wwv4GoWEMUFooLcNmSUt5bv2+pafc
         p6hfkuyYw7qIbEUI6gR464dLUbuqj+RVwG4PWrbhNClw1bBGpyILnHxrjzwsa4RBRCHf
         Vz2pqKTv6sHb4lwX0OZi281LjSLh2NoOOwunU2XBf1iCiZOvxnn7ET757AhJbsexN/GP
         JKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732290076; x=1732894876;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L4qSVcgbBLdeeMk9S8eo1cKOTa/uPhWh7RI1+zhYfKE=;
        b=DQk8wC+nCGNMwh4nXQBkyYRmufciL7HWLQhhsKclPmIOi+jnSYASo+BD3xy/s70OY3
         lyK2acuRKj97iFQlR56pVGxhDKykHy3WUbu7Yc20WTDoHcN7MH2zBAr8UY6qR3klBBgn
         pmGkI1WJZjUhKB13/fRZ7Zr9VAZgeovYA5TbfMG2gmfzHyCs5dpWN2f26YAclSmImEp7
         aT/JhMlx1rfGQRSQeghlg8spDDyK+Zq9ReO7jGsQbLcfyXkBMceYUGjJx0P9MOv3mb7p
         G7DpltzZ7kvrBam0taJbeyNyQ4lH7J/Y8amKuIwp4mg0Mb7+LcGQCT5yraFw7VoCLI6h
         6BsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMRP1a87o/V5ic2aejRf38K2YaLqki5LuGKVzkrqw4FqP9xepw9YKranC9uPDyu5qAX8Swz+PlhYU6jaqhNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynjVd/j8/l/+Uf96ouQdCUc1ArTO2AZqCvSbFp3osO9QfS0ilb
	rPh5Ks6P8NbdZvgA1v28qzhQX6iNryRDo67P3G9PrDusuvzz7Nbw5hhX/FjrKJBslZL/LKwD9m8
	RPoPu5ib957h+4g==
X-Google-Smtp-Source: AGHT+IEzCJ8qWwWmshtRsITg+icfUQjN5P4TA8fmdquEW+McT4r0JS2lWAyQ7jrcDuQUs5kS2JoVK2CCYBJKDgo=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:68:fe9:ac10:f29e])
 (user=aliceryhl job=sendgmr) by 2002:a81:d809:0:b0:6e2:12e5:356f with SMTP id
 00721157ae682-6eee0a3cd59mr78657b3.3.1732290076176; Fri, 22 Nov 2024 07:41:16
 -0800 (PST)
Date: Fri, 22 Nov 2024 15:40:31 +0000
In-Reply-To: <20241122-vma-v9-0-7127bfcdd54e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241122-vma-v9-0-7127bfcdd54e@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7936; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=8XMIdsAyhjsVKz2sE1Ods0Tz2Vq4I2NxznUSr3oMZoc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnQKYKwgMhFK1o/1aUXbls2k8sejghL5FzITqk6
 S2R7cFzIkiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ0CmCgAKCRAEWL7uWMY5
 RgGdD/4iPoTTUbdLe33P5pBqMrDOdAKUntngkTdsYYX2OucalMMc62TwR9LizWRDXfNwM/sGDD/
 87pFB785Ie1GL1dBGmpBpL8gr8XP08IDdKU9PYdiWkrcl1M857BBrRZr5fvznourPha8Ge75nMF
 fUYwl16MYhoFseaPFlUXgdpty952Hj07bkZ3cbr/Dqaj+MHqd00kbuW3EhwLxiFieJRIA45bot+
 ZUe+itpME+XKjA5eahHCbDq1h0yvWglatQsdgDi85VQesQtdZ0Awk9bWnS5n07udlTTvnqt2St0
 HO74zVpaB/N+ERz3pBpj2ArIj5C8yo37m8gDSFiUsZ8cCkvBRYY8c9xia19JKX/pX4/kiSn74yu
 u5Wd9SN2cX/FGXGn1EXcbY8cmy242VYZ4LuF9ZKeUqA7YaKml4fBbSdYumBnHnsJhc1ZrBhPDpi
 rlqY2MgjKdUrO0KgIyDT0TdHU8Xcd4Q1cyRFQgg9AajEuLT9XLsKvhjNOqRnoKiVEO7xFvj19OP
 kQZOMqGPIuNlKhMPOGFMEVzwsGrJL3Qg2ViTs051E9a7EMgY/P0F+4ruzh3mNn1FTwrKAbYAKzo
 r0tx5ODyv4xYh6z0aAkpluZ/ILnd980jLVIk7IXf9lncUD+K9DFxBjBnN7MjDpOMjwaoYQwvsUE V+xrKnZ7t1hXKuQ==
X-Mailer: b4 0.13.0
Message-ID: <20241122-vma-v9-6-7127bfcdd54e@google.com>
Subject: [PATCH v9 6/8] mm: rust: add VmAreaNew for f_ops->mmap()
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
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>
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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/mm/virt.rs | 179 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 178 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
index 3e494e40b530..2a49c29a49c7 100644
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
@@ -155,6 +155,183 @@ pub fn vm_insert_page(&self, address: usize, page: &Page) -> Result {
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
+    /// This marks the vma as being a memory-mapped I/O region.
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
2.47.0.371.ga323438b13-goog

