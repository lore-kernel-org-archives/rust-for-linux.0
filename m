Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736B41DF75E
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732290074; cv=none; b=SYAS67/G3kcvesWr9LBcQXcWVoEZfziPpOtYCYzN2xGsUA/SfirEh/2dGN78CsXXfhINdWST6Miz7hnO7LAomUDiBsgkt1xDt3BIKVFS3ylE7sK0P3+4jkfpMpTAA7zR3n4FqkZJl42IaxyLdNfUvUVANLWQXQo6HGBermbSvlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732290074; c=relaxed/simple;
	bh=fkBx2F6iPu2x+Ij6OXEgUbDcOuLkhOhWgbDBfI9k5bI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a0ETWQ3s/n+bxXpvxNg6sduI+oiZ8nl3Wh3m1j3BY99eVb7EfbgKO+TRKIrLVpLbD4ItBfAQadrjWjNSg3w4RACP72a+GK23VPLMcQmTycr0p5yBtP9bwwf+txItcFAX/v7vzpDnNHTaOdFQ170nYa+AJrDrRkt5XxZj6G1MqJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f8nQPmj2; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f8nQPmj2"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e3859de1c11so3977209276.1
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 07:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732290071; x=1732894871; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=St2nivlEGlwAOUor5slXoMT0nSTJUF24z+m1sub+EPE=;
        b=f8nQPmj2vEqhrOmUlu8fwQe7cFQGW7NGHlav/ifz0q76YlVHBFiAjWEBwbTHLabJei
         GYfZ/WBlQ5w6Ynj5CSpJfj1Z8r+fvRPGMI4mZ/wY6hWsiSBDMBPGYrXhSKdyzeSRfn20
         XBQpq7H6rMfMf6zWZqYqNRGq4pLwWfc0mtzC1pBhiyNBr++na/j+48oN6HNf0p+m40n1
         tsRCwgMThVDJ/wbEXWbRCzleSu84t4TpJyLFLr8lDadXT9bh7YtX4a7RPLexNpSFYZEX
         kmpMwm40v1G+M+EZP0g2+oQIVjpP0yOUpslxNcmNYcDKjdwtwIpSeGFSK7i//sKz2FNt
         F5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732290071; x=1732894871;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=St2nivlEGlwAOUor5slXoMT0nSTJUF24z+m1sub+EPE=;
        b=SYrl31dA4BsswlQKLTDCuOIuoLv2bkUDWW643tBTvLkA8R7NM5rlwldqGNpP9NaNLI
         DG0LC779rrfNlWw2vvd83o1qRUOKS0TSE6MPcfHbzRgXrOs3ncZPAVtp68LuG5zFywL3
         IFCptzLF5uGmIQwp3day+fNJth+mz3HTIq5K5mDVjSfuQJ4sGDfrqkf2lf+WiTQ6jb8s
         MX+zxyJdhgEamK+A1NavyfK4TAGUOW6kS+aQOLFk5QH29MH9cua3XaUSw5949kGDGdI4
         5aKS7ga2FV7qDdCc8K5wK3ACzNY4bdOIchVThw5qDKVsN+iQJLvZBq5FGOGYLfxzHWk9
         VMFw==
X-Forwarded-Encrypted: i=1; AJvYcCV2rXCJreDxQj9qoFCkIRy907rKm0u1SyYi126LQ7sWleuRMNyDlZ5mWjXc4yplzWmtmO8jsBsEKc9tv1mhZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy55qHo3kXI4KIXXs484XjNR3tNivGTZIA+rTJFee5vRkbe8RIm
	WkfDaiaHVpqifGMF8RC/PHob2u86CWcCXvZCwOwgFs4QQ2ZiUlqwRL02UZviNFwgeA99HMw9rHP
	KOZnpYGO+rO26pg==
X-Google-Smtp-Source: AGHT+IGihGzFbF764Ujgj/U6cdWN/yYJN8fQNEHsMDvsZY7MAEQSnHOETorjJsB9VNEV6/q+QcUl9/lfdUnOIbU=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:68:fe9:ac10:f29e])
 (user=aliceryhl job=sendgmr) by 2002:a25:d80d:0:b0:e38:14f9:cd0f with SMTP id
 3f1490d57ef6-e38f8bd8497mr2055276.6.1732290071512; Fri, 22 Nov 2024 07:41:11
 -0800 (PST)
Date: Fri, 22 Nov 2024 15:40:29 +0000
In-Reply-To: <20241122-vma-v9-0-7127bfcdd54e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241122-vma-v9-0-7127bfcdd54e@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3903; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=fkBx2F6iPu2x+Ij6OXEgUbDcOuLkhOhWgbDBfI9k5bI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnQKYIUymIZaDH58EKhKDYnMp2XcdauVFk9Sm61
 K6mH7jVt0qJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ0CmCAAKCRAEWL7uWMY5
 RgCfEACMPTyXW8HWQtwKk1nhcmhNoYFoxeHTiCbS+WoDdEOJSxJ3c+x20o6T0joQfWF8aB8rSS6
 TASaxo1CMMJ3r+AoFuMY78oczohJuVeXyUhJYgUitIgivvPiZNixny1hlMWK0Xrj6gIkjjB8DTt
 jkShgEo5cB33v67l0sRgK4wmY1SauayQ1ntYHyWSybXHtGfF15xJ3/nhxtiJ6rZaW+//wB/mucA
 ufgaHuVbWelVOe8GUxHBfG+R7rvn1Gjt0BqCDOXbQttgKSLD5SyHoCyGDZq4UasnoQ5A/X4sk3v
 nS5AFaB7/Mg6hyyl4KYCIIKxl3EYd16h5ZFbo+I+ql56DHocbFh5CI7Ua008D79AQ7cM6njhjyX
 HZJNHusiqgZhJvlRJni+AS1QFL/iwVXkWRIXOx08LHJz2pTnYNIYsyEBlKI9TajaIn114X4JcFQ
 9+tFvuikoWe3KltS+cRPIKw0yuhtnwOW8vrudu8qk8UDp+pqBa8KQUuUO/08gSQxQYsKSBjcT7+
 Ek79cFhxL5FHrSgMjpezkk1oD6SyO4zAtCU10r04fonsgBprYzdRJO2mmucn3aUjaTxDCI/vbHs
 ZAh6Omw23AffKbI5tymnUbecXpHG+lxRMHay6RHD3Ue9KH3GvLvC5pyFaqY5NsXg3WVT95KLASX 5Qz6Pc2WbMCv8HQ==
X-Mailer: b4 0.13.0
Message-ID: <20241122-vma-v9-4-7127bfcdd54e@google.com>
Subject: [PATCH v9 4/8] mm: rust: add lock_vma_under_rcu
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

Currently, the binder driver always uses the mmap lock to make changes
to its vma. Because the mmap lock is global to the process, this can
involve significant contention. However, the kernel has a feature called
per-vma locks, which can significantly reduce contention. For example,
you can take a vma lock in parallel with an mmap write lock. This is
important because contention on the mmap lock has been a long-term
recurring challenge for the Binder driver.

This patch introduces support for using `lock_vma_under_rcu` from Rust.
The Rust Binder driver will be able to use this to reduce contention on
the mmap lock.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/mm.c |  5 +++++
 rust/kernel/mm.rs | 56 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
index 7b72eb065a3e..81b510c96fd2 100644
--- a/rust/helpers/mm.c
+++ b/rust/helpers/mm.c
@@ -43,3 +43,8 @@ struct vm_area_struct *rust_helper_vma_lookup(struct mm_struct *mm,
 {
 	return vma_lookup(mm, addr);
 }
+
+void rust_helper_vma_end_read(struct vm_area_struct *vma)
+{
+	vma_end_read(vma);
+}
diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index ace8e7d57afe..425b73a9dfe6 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -13,6 +13,7 @@
 use core::{ops::Deref, ptr::NonNull};
 
 pub mod virt;
+use virt::VmAreaRef;
 
 /// A wrapper for the kernel's `struct mm_struct`.
 ///
@@ -170,6 +171,32 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a MmWithUser {
         unsafe { &*ptr.cast() }
     }
 
+    /// Attempt to access a vma using the vma read lock.
+    ///
+    /// This is an optimistic trylock operation, so it may fail if there is contention. In that
+    /// case, you should fall back to taking the mmap read lock.
+    ///
+    /// When per-vma locks are disabled, this always returns `None`.
+    #[inline]
+    pub fn lock_vma_under_rcu(&self, vma_addr: usize) -> Option<VmaReadGuard<'_>> {
+        #[cfg(CONFIG_PER_VMA_LOCK)]
+        {
+            // SAFETY: Calling `bindings::lock_vma_under_rcu` is always okay given an mm where
+            // `mm_users` is non-zero.
+            let vma = unsafe { bindings::lock_vma_under_rcu(self.as_raw(), vma_addr as _) };
+            if !vma.is_null() {
+                return Some(VmaReadGuard {
+                    // SAFETY: If `lock_vma_under_rcu` returns a non-null ptr, then it points at a
+                    // valid vma. The vma is stable for as long as the vma read lock is held.
+                    vma: unsafe { VmAreaRef::from_raw(vma) },
+                    _nts: NotThreadSafe,
+                });
+            }
+        }
+
+        None
+    }
+
     /// Lock the mmap read lock.
     #[inline]
     pub fn mmap_read_lock(&self) -> MmapReadGuard<'_> {
@@ -238,3 +265,32 @@ fn drop(&mut self) {
         unsafe { bindings::mmap_read_unlock(self.mm.as_raw()) };
     }
 }
+
+/// A guard for the vma read lock.
+///
+/// # Invariants
+///
+/// This `VmaReadGuard` guard owns the vma read lock.
+pub struct VmaReadGuard<'a> {
+    vma: &'a VmAreaRef,
+    // `vma_end_read` must be called on the same thread as where the lock was taken
+    _nts: NotThreadSafe,
+}
+
+// Make all `VmAreaRef` methods available on `VmaReadGuard`.
+impl Deref for VmaReadGuard<'_> {
+    type Target = VmAreaRef;
+
+    #[inline]
+    fn deref(&self) -> &VmAreaRef {
+        self.vma
+    }
+}
+
+impl Drop for VmaReadGuard<'_> {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: We hold the read lock by the type invariants.
+        unsafe { bindings::vma_end_read(self.vma.as_ptr()) };
+    }
+}

-- 
2.47.0.371.ga323438b13-goog

