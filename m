Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27E11DE2C3
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 14:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114590; cv=none; b=us3xlZPW4Dq9VewicWR8cqxXjVGgs6tFGmcEA66OfXMj1h7inlMscPShcRjaAPdEVpEDSn93moYBFMvTevJNHBy1T3g4GGIpHxzrSOHDKiYgdRCorIun8duWNqRc1NABKBxxWRGP30MhVwuvdoQ9AG/jOB4NmdIWVXA5yzL1Z34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114590; c=relaxed/simple;
	bh=B1j9P1BH0bxfU/zafa6FVQxd9ysL+wMPMIqevg6Rsd4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mZoI7j2ORU0kqNyNTCu7rObYM1afT2nJUvMVw4epBMBawtRueuQu/UBrVaUU6CSL/QhGePFTC0NJfz7vuz3QO3xVxC7DFz7r7RNYRoy7DeCHxvM5PloH1XWEdGZO7ieqms7AoCLrjy+aNBv05rmx1sWL1L5eRTRxWi6xOwvqfSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lw70bLx9; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lw70bLx9"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-431604a3b47so16575445e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 06:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732114585; x=1732719385; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aoiANS11czrxWVbduQfnhGruCAXv4HeO9pq8nZpI/0M=;
        b=lw70bLx9BueIGk+NNdHKfZJiCDpTRlqE/Qvjq8nOAdNhHYO3HYKGAqyAER9/Zgz/9X
         HvcmtH0+7UxZoconMzzHdAXU2zDT5iWzrAqQC0SpSpt/e52V7vqnl4uGgLhYbDaeza11
         feONvutOQN5By8iwP7ar4OnuWdm+SzRVTMLLx2tsKoAIaYy2QFrhugZnvcC+Yv/TJ/jd
         Vr5tnsnYigiCn3dwaxJDboBjc8ZUrCGGlEETxyGOelbabEHw6aUjOPoX/rVfphVfbV6V
         lhb8EPaBB8RGydlRRiFO9n75JDorw+fXkjI7ulmzQu64LM9TtXhG05ZH7VuHnQub8SBt
         MzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732114585; x=1732719385;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aoiANS11czrxWVbduQfnhGruCAXv4HeO9pq8nZpI/0M=;
        b=NU07NcqsmikgJbNUuCVRirzaS05n6lx5xFqEWglnxwLY9w+3RtN7V7yiMk4OczYNcq
         D1E3gaBIFdZf7RDdYNlkLqoVn+yf5cBb1YVoDd6w4dyLgujwONQ4Kkcv2ynuk0vJaA3D
         VpZtbVUfPBpKWyjolMmkOo+Vx7AaAsjNiIXA1XtNoKID1BT1v6PD7qfWHT/g9ywVspvt
         anC248ReYpPk+2i8f6ZGZKNnv8iwtN0fAIz9xG6h8BQaB4Q52qekqVrTN7Fus+p0Z29j
         5bh435dc4hjz2vu3rBJ0i3TcrjS3G4Sw6fD1yy5h+TI4eaKXwJ84ALvIPPleTjW2Mms9
         T7/A==
X-Forwarded-Encrypted: i=1; AJvYcCWEmHAP0x0Xu9poRN8L9qQ2Gx3B3yzodDfsfZ6U41zQX6GwbrCSC/1jQffhTv5prf5NZDM8RG5/JufihMn15Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz12XkPKjz6yJw6ZZxiJgKSIxq19CS8zMtHG/1TmYwtwgYveIPY
	PtVxV6IbF3UEDvKFBmt1W/H98piKQ8gkpxU7TqffNO95RpIaGwiXb5AQXuX0sWIpvpaQCeyqU65
	mDp8dib1jOtKCFQ==
X-Google-Smtp-Source: AGHT+IE6KZ4EvG2+AyBS7X0AsuANcRIXcFSazw3+PxVfaxNaYxLQx8x02Y7MetgM2m0JyIIKmjeIwnAHQKtRbjc=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:68:fe9:ac10:f29e])
 (user=aliceryhl job=sendgmr) by 2002:a05:600c:46d0:b0:431:4162:6adf with SMTP
 id 5b1f17b1804b1-4334890546fmr124315e9.0.1732114585303; Wed, 20 Nov 2024
 06:56:25 -0800 (PST)
Date: Wed, 20 Nov 2024 14:49:58 +0000
In-Reply-To: <20241120-vma-v8-0-eb31425da66b@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241120-vma-v8-0-eb31425da66b@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3357; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=B1j9P1BH0bxfU/zafa6FVQxd9ysL+wMPMIqevg6Rsd4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnPfiKB1ELULsXYa5P1N0NhjBWmvy5M6u0nsExs
 po7gAjq23aJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZz34igAKCRAEWL7uWMY5
 RtPwD/kBvIn5klKFHqApPc2S/WCAcomjz5SYvwUslE6FeJGQvZfkTdXTuEoZJq0lsxJmNbs6Hp5
 Q9oxbRPey0lnHYyCJQ/nry7A6FNxk3n9Y8GhK4ctlNZr0glylb7YifGxTYNJhuEoFjnoYOvnlfb
 RZ5yfmziAthnvy/QooPSnoRzSB9L+hyK/vtg+ReOZ06qfImvN6lBFkaAyNklhP/zbjpFSClY2sy
 vNCOingHCvMKFKWxfGQhiVkonR4nQYVisrQZQRpkq2OJu+V9CMKBsR4tYGX/8bfJKXABOyYKV2X
 7cxgf984gDAZfBzM/7VQAret1qyVxQh/R4Pb1Dc4hrXanMJy7Y1yp4nzlP3Q7P0iU6hfY/L01eQ
 YL6kMdNVuU+FIFSUEIP4qVOlcWZcQ9c+nJANEx1d6x4M7gXDzvusU6N1pBRXaqMS1Ll3aP1CvC5
 sfIAd93vWwYZNuZ2yfoIxT/uXDmoVCG04mfKN1RpM8vGzcnonzACkX7DimqwXqGtZZhF/tHSsyu
 ze2wduW0hjSyD49/eZMEaNrlmxBFaxs9uZqjJUim+WJzRPNbzhgcbtSPUp3iw4RrqTVREicitdr
 41uVHMtohgbKannriawy40MiB6pUjr6QUYmB+ljpC2gJ54cbV8uFiZ2Dl2vm7BAEwxR2NRTgesh 2OzPc8WMU/3D7Lg==
X-Mailer: b4 0.13.0
Message-ID: <20241120-vma-v8-4-eb31425da66b@google.com>
Subject: [PATCH v8 4/7] mm: rust: add lock_vma_under_rcu
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="utf-8"

All of Rust Binder's existing calls to `vm_insert_page` could be
optimized to first attempt to use `lock_vma_under_rcu`. This patch
provides an abstraction to enable that.

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
index ace8e7d57afe..a15acb546f68 100644
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
 
+    /// Try to lock the vma read lock under rcu.
+    ///
+    /// If this operation fails, the vma may still exist. In that case, you should take the mmap
+    /// read lock and try to use `vma_lookup` instead.
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

