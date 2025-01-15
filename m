Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2127A2475E2
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 13:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948176; cv=none; b=hgkv+14Pk05e7Q6hlOLS6ToS5KI2wwzwvBIkDwGEIszO8iCKcocvF4fC6C5WAtZeiD9BS9kA3nl4QE0Dd/o7zORDagcDFv9zM084Tau7nVqVqoAfyLnz2X52X/s04Abm+AUGyRyfm6MtSAjYLxrLDXwlvkAgUxO8hT7MBl0E5Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948176; c=relaxed/simple;
	bh=fLfkFNdLYfHgKfZa0dsXjtc9votv5zCA9qLsVLeeLkE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mlpZvFqshAsInWokxe2TGfIlsTclEuFVAKIlbCg7xI5mf2slxxwpxwzeORrR3JSIdLnm4/qQR79DbUlGqFdEGU769Rw+PNtPR9mgEvS5NAzPF1Ko35Lb8w4ue5D2P3FNi6pJsV2iAK6ohFS+WcmBNVk+dVNbkG50Py5lTwuR6Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UbID/AhC; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UbID/AhC"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-385d80576abso4501096f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 05:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736948173; x=1737552973; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WyGEiOkhmdNY/fU37LXSLgzBjmVwObw0G8SyyivcNjI=;
        b=UbID/AhCU5wGAdmP8a9yEH+ARVYetQUbaV316StcVGsm48Zj9nACuFSB6YMpxQsjIP
         7put3y7fPNJ61fsM1Inm/MiB+KFmYV8XH2FshVKDbv2fxAa9qE0nLbsDTbGvz5JpI4zY
         2NCM2Pb5ZFPnE1YcLvqc2HeyDPjYwNP38LQ9EPb2xKo7gRA3Vn+e7P4L7wxkymkDUvw/
         91Pqd2micGLS9WCmnhfLoKoIOTFCWP8TUE7Mu7D6Gjx0eQa2pjNZBP3kICoS2AFBDpbP
         mF8qFUJ9CetmQbXDq8W2aOuvLdcdpsdDXBBRyptR3epB0CA6umMMUEiHa0u2/rmr8XT0
         SaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948173; x=1737552973;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WyGEiOkhmdNY/fU37LXSLgzBjmVwObw0G8SyyivcNjI=;
        b=kF31AmV9mxAtX26IgX8zYvvbqJVi0o5EGIgDd6zh6dnMFZGQwNICtx/RrxJtU+6YPf
         OO9H6vyqgjeUSV33aNefLZloyKvEeN6O+/KCTWC85SPjHD7z5GRI9N4OltzubU3lfuuc
         0bMYnjIkcXW/GfyKnNkfVC82bPodibE89yZOcSPvHNVy0nuw5OYVfsRzFjzb+7q/8Lv5
         R5bxlETo58Rj3Qun67zZ6yVJXg1xmpL+juGXoq6w7OLMBa7flZ624zO1u1KngNu63Bt1
         piNiZFkiUCITc05u1w6nfBwov0zv7+32ARFPVncO8pMek1IE+P3wWLIYTQBTik+imj8U
         mKIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmdxb442Nn13B6u0h2P6z5WsO9ddQtD9M27/SJ8fM+/B5bieX40XR8M8d4YVPnAM265I6wtZbwlZfu8M/quw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+q2TEMkrHZ+jee8mWJh0gSBTyQovid/XQSu19TglsbU7VOKui
	Vk/yGxPie1iTISfSbjTSeK2qd1igc+eziP5h1okbekUJigqn7EE3P+2+aO8CrkaaKAue9Ebk5zi
	4kKivYOeWEGOcEQ==
X-Google-Smtp-Source: AGHT+IH6kBJKdmdDV5w19iOE843iDVldxJ9in2s0SPbV23iN1Txz+OJHqSf7ZYmSD6HRC4mZ8sg2KRgO82avk5s=
X-Received: from wmbfl11.prod.google.com ([2002:a05:600c:b8b:b0:436:e755:a053])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:184e:b0:382:46ea:113f with SMTP id ffacd0b85a97d-38a872fc1b3mr27766198f8f.10.1736948173574;
 Wed, 15 Jan 2025 05:36:13 -0800 (PST)
Date: Wed, 15 Jan 2025 13:35:07 +0000
In-Reply-To: <20250115-vma-v12-0-375099ae017a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250115-vma-v12-0-375099ae017a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4078; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=fLfkFNdLYfHgKfZa0dsXjtc9votv5zCA9qLsVLeeLkE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnh7m/l8GboGpN/qusvnLxbok1uTnWuhzUiY+SS
 PCNfbEvgfSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ4e5vwAKCRAEWL7uWMY5
 Rg80D/9JzLVe2s09/Ey8IChe2f9AxrZWGc5rUDwgfHi/y8u+2zvnVesQGWFxUhTaCR435B8OVxl
 Ytf7xmAkpx69EK9ykOXhedM7v8VjGiD4aQDdY6PVvJPSn2MqV1yR+vLN6qIFWT6yBAVpVIkP1td
 +w5eKL6SIUPPOy8Soh/Dc4TAsEXq+JL9JEW80gfxcGXh3wsQzWc13ckoRPk5LdcT5GCVnLiaKYN
 wfkm3PWmgvVayaKk2PLF1RmN3hzwu9K2dn8BVptE+M6Fr0SafY6i8Oi0VE1ofzMxxUX29xyFkhZ
 uQWnNU/gdc93rgpgmNxxmRznFlMnBmEtNTH4kmI6YlrR8xXpdMPx2VIXTpg9vFHzrrcRI4c9dLD
 TiqK5aexQj6lRpVzWPdj7Sv6HE0sfCR+Orv7MPYgn8EGY+X69KmsutvARRFIvuCesfCmmBwHwfV
 Gfk2+CiL4ynj6qx9lZDg5DmW+68O3r/5DMyFtqB7uevUcSZ/HPmC9i5KcWTAtvVS3uL0EmKPePb
 fd8Gi72oo1oQ3OjvzaS0SBeHHlVE0FWz1n+TAOa+uPSShuMSx+4ki2JShfkmUWc2kfYxZYPNTpq
 lsHyUCXtL46uBkw221SbwO0R/tyz+0ABzNVR7dKEpjkbktYrrQ0dYY4V32dS0IsS1gpv0UJnqli M1k0GU7PNicgsmg==
X-Mailer: b4 0.13.0
Message-ID: <20250115-vma-v12-4-375099ae017a@google.com>
Subject: [PATCH v12 4/8] mm: rust: add lock_vma_under_rcu
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
Reviewed-by: Jann Horn <jannh@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/mm.c |  5 +++++
 rust/kernel/mm.rs | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

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
index ee1a062ec7d7..60dc66972576 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -18,6 +18,7 @@
 use core::{ops::Deref, ptr::NonNull};
 
 pub mod virt;
+use virt::VmAreaRef;
 
 /// A wrapper for the kernel's `struct mm_struct`.
 ///
@@ -160,6 +161,36 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a MmWithUser {
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
+        // Silence warnings about unused variables.
+        #[cfg(not(CONFIG_PER_VMA_LOCK))]
+        let _ = vma_addr;
+
+        None
+    }
+
     /// Lock the mmap read lock.
     #[inline]
     pub fn mmap_read_lock(&self) -> MmapReadGuard<'_> {
@@ -228,3 +259,32 @@ fn drop(&mut self) {
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
2.48.0.rc2.279.g1de40edade-goog

