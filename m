Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9821246A28
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 13:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948174; cv=none; b=FPVZNN5FcOz5fKl99vGH+i+cM17SAyjKn8J+asev9rUUhcnr65LhUDDckzKM6nAvPlBnNSsN340CSw6KojIOHC2pIB1nrKUzHxS2qPr6V4QCioFS0KeEIfIIN/d7JrrWtsRJ7mIki1X+YEdEmwEiSPrhHZL76g319C0ItzyP834=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948174; c=relaxed/simple;
	bh=DkijNTCWjzL+GZ9A/ngSiwPnkdD9yqoZbhkXBZ1FzqQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u5pNdf8AsSOevPlzDa5OPV0IKdLJ2Ltk9LntxrKLeMyYXgWYssd1cGkVhZ+kC4RnNI74i5VmSiz2aITvIzlCLXdR5nu9UCsOTQ/v2W22rHWsQX2u09JNSFUys05XDhjciCPW3/+0nlgR9j+L+tEmdMjEK1YAaWdcVV0lmzbIo3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=opLg9mkD; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="opLg9mkD"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4361ac8b25fso36019115e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 05:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736948171; x=1737552971; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iAB5+MkDlqluj6B7QpzdYLJZpgBLqkqOo5ngR0sMgMc=;
        b=opLg9mkDHwaQoqtDK2mwhQgsLfl0LQvgnE89WgEE6JcyIk5GjjdRohX+2euhBI2ExR
         YGHcNmvA6Or6imGH1Pz4/DPSR6P4oencSU7opvKwn7IUxLadCuBnFT/qkPbkTSsTy0m7
         eurCE+oaHCYoxhdqi2ASpPmuubMYgIRrwc+a8udzjkyyw8a4NsaqZIjt4x7ESkj6GgIX
         99KO0Qlr987Y9K3hgEAWRX+auH99IR3Myl7bd0e+omEKDu7zNWVFVAPDM1gMyWLciQTb
         HE61Rx/x7ZtLKisybQyyWJ3sm0v2U/Wh9cW3gkrZND1HfayoCgPhDGoESdZH1hn7Y1Bq
         x/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948171; x=1737552971;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAB5+MkDlqluj6B7QpzdYLJZpgBLqkqOo5ngR0sMgMc=;
        b=ejjXuv2XMUQCUVcdqdK+Eje3hya8gbMVHCuz1ve3yr/74idyv5U7TWTV+76/tUbL59
         kDWmO93mBC89QaUbcpbF8KtxA4B3/Cxt9lXjrChQs9Mmre6Dpm6kYPh8e4ExtXvZaZ9s
         DLMkDlVoYt4hDo7mz1B/XPCwiFzCqogPhmdDvXXappufJuPzjCpkC4yjKxXcmJ1Egw31
         ZvaIV/ICkFIumPGlQ1NMwDluOWYCrYkXFBujPN2HhED96hwUfZnHwu+u84RZ5dXRF58d
         1OL4e0NuueCtM0VGB5Wmgvh7AjrM/k1+TaXfe5HS+h1mJkzOue+aBDf2xbudAfUAOLhX
         W/6w==
X-Forwarded-Encrypted: i=1; AJvYcCVh2rWfiikt1rvllKRUGdHyPWuXjEqqqofggePLbuVE+XhbhLcstEEmOTPPXU3D9Qi+f2csci00fZnqeqD0Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpkbLvXk429e+8s8X9KCan7Nvf8ZksLK1MPx0jgLJHFeyN0CxS
	lBltBZJeJYzYQ1eFBxDvYPZmIlRlNmYVkm1o0hBU0vRpu8B759MpTc64w9JbsCYDA2IzA8qmp9W
	oibmXHaN2g3RA6w==
X-Google-Smtp-Source: AGHT+IH4/tFhizC0Tlbso0pfJWClZ8vsinv7fWPPpakyMd1YYPpuWimTTutI9DYbU8xxDHrbDqgJ8v0xT0gjcNQ=
X-Received: from wmbhj18.prod.google.com ([2002:a05:600c:5292:b0:434:fd4d:ffad])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:314e:b0:434:a5bc:70fc with SMTP id 5b1f17b1804b1-436e269aad7mr260754245e9.8.1736948171131;
 Wed, 15 Jan 2025 05:36:11 -0800 (PST)
Date: Wed, 15 Jan 2025 13:35:06 +0000
In-Reply-To: <20250115-vma-v12-0-375099ae017a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250115-vma-v12-0-375099ae017a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4166; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=DkijNTCWjzL+GZ9A/ngSiwPnkdD9yqoZbhkXBZ1FzqQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnh7m+n+HRp6TVitWGzxTZmNyfMlBYn2nHJh85c
 gF39+HKacqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ4e5vgAKCRAEWL7uWMY5
 RkLSD/4hAr6ppSvTg25k4E1epqUVJqhwKwShK0kGDC2daG1PTdOf7HHIv2izh6j3qOiJU5pgh3e
 JBpHueh/ss+r9ARsw5Vp0y8VmJRhMphbTUgNJe6+f/TzTmBbwi5FWj36eKetwmB+6x32ApYd3bW
 b9zGR5ekfUIHCUKnn4ybbKv/+eO4qkmegPEzNpFE6ZemT/1bvOscQtuiU+1zEXtE6oMK6MhHrWM
 0ntaU/0JSoLHdsCRv2kkmLI741cNl9wpplYF17izNbhn2hbCXHOtqpuzPXyfbqr9Frte5i6Ea8p
 FJTF4wJ3KRxwb52DoikPJXCzUprqFedDHjaPo9NB9eXQcXDTktrviZs74nlCx2IVINhEQW9NFqT
 lxiyxB059onff3iZax0SYVxFr+jH4w/YdiPd4rrpf0s3eMtOPQ3rYVPOK8dA5JP8uxiYhOJHFO5
 XjQeCofzoPVvwKq5HLsa+/pMaIXrSQoDJ0SmdYtAAsQKCpI4XUrrXS9PVDisEsGcL+r9i3CrlCz
 jZwa2hoidoGaAip0/tCOyZPxeW9uO9X220T4m1wQeIzUS06ggzIWX3dbrSd7HpHg2/0U3OyZ4Zj
 l/0rq57Zp7TS9fPY2JWKtz2TEpyegxfM/AOuhYGKPzf6OTraPQnjWNhd8ncJL6WAWj0Zai8jcPC 0zsvqbfT7/0ElCg==
X-Mailer: b4 0.13.0
Message-ID: <20250115-vma-v12-3-375099ae017a@google.com>
Subject: [PATCH v12 3/8] mm: rust: add vm_insert_page
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

The vm_insert_page method is only usable on vmas with the VM_MIXEDMAP
flag, so we introduce a new type to keep track of such vmas.

The approach used in this patch assumes that we will not need to encode
many flag combinations in the type. I don't think we need to encode more
than VM_MIXEDMAP and VM_PFNMAP as things are now. However, if that
becomes necessary, using generic parameters in a single type would scale
better as the number of flags increases.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/mm/virt.rs | 79 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
index 2c7de0460e0a..ab89a526d3e4 100644
--- a/rust/kernel/mm/virt.rs
+++ b/rust/kernel/mm/virt.rs
@@ -14,7 +14,15 @@
 //! ensures that you can't, for example, accidentally call a function that requires holding the
 //! write lock when you only hold the read lock.
 
-use crate::{bindings, mm::MmWithUser, types::Opaque};
+use crate::{
+    bindings,
+    error::{to_result, Result},
+    mm::MmWithUser,
+    page::Page,
+    types::Opaque,
+};
+
+use core::ops::Deref;
 
 /// A wrapper for the kernel's `struct vm_area_struct` with read access.
 ///
@@ -124,6 +132,75 @@ pub fn zap_page_range_single(&self, address: usize, size: usize) {
             )
         };
     }
+
+    /// If the [`VM_MIXEDMAP`] flag is set, returns a [`VmAreaMixedMap`] to this VMA, otherwise
+    /// returns `None`.
+    ///
+    /// This can be used to access methods that require [`VM_MIXEDMAP`] to be set.
+    ///
+    /// [`VM_MIXEDMAP`]: flags::MIXEDMAP
+    #[inline]
+    pub fn as_mixedmap_vma(&self) -> Option<&VmAreaMixedMap> {
+        if self.flags() & flags::MIXEDMAP != 0 {
+            // SAFETY: We just checked that `VM_MIXEDMAP` is set. All other requirements are
+            // satisfied by the type invariants of `VmAreaRef`.
+            Some(unsafe { VmAreaMixedMap::from_raw(self.as_ptr()) })
+        } else {
+            None
+        }
+    }
+}
+
+/// A wrapper for the kernel's `struct vm_area_struct` with read access and [`VM_MIXEDMAP`] set.
+///
+/// It represents an area of virtual memory.
+///
+/// This struct is identical to [`VmAreaRef`] except that it must only be used when the
+/// [`VM_MIXEDMAP`] flag is set on the vma.
+///
+/// # Invariants
+///
+/// The caller must hold the mmap read lock or the vma read lock. The `VM_MIXEDMAP` flag must be
+/// set.
+///
+/// [`VM_MIXEDMAP`]: flags::MIXEDMAP
+#[repr(transparent)]
+pub struct VmAreaMixedMap {
+    vma: VmAreaRef,
+}
+
+// Make all `VmAreaRef` methods available on `VmAreaMixedMap`.
+impl Deref for VmAreaMixedMap {
+    type Target = VmAreaRef;
+
+    #[inline]
+    fn deref(&self) -> &VmAreaRef {
+        &self.vma
+    }
+}
+
+impl VmAreaMixedMap {
+    /// Access a virtual memory area given a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `vma` is valid for the duration of 'a, and that the mmap read lock
+    /// (or stronger) is held for at least the duration of 'a. The `VM_MIXEDMAP` flag must be set.
+    #[inline]
+    pub unsafe fn from_raw<'a>(vma: *const bindings::vm_area_struct) -> &'a Self {
+        // SAFETY: The caller ensures that the invariants are satisfied for the duration of 'a.
+        unsafe { &*vma.cast() }
+    }
+
+    /// Maps a single page at the given address within the virtual memory area.
+    ///
+    /// This operation does not take ownership of the page.
+    #[inline]
+    pub fn vm_insert_page(&self, address: usize, page: &Page) -> Result {
+        // SAFETY: By the type invariant of `Self` caller has read access and has verified that
+        // `VM_MIXEDMAP` is set. By invariant on `Page` the page has order 0.
+        to_result(unsafe { bindings::vm_insert_page(self.as_ptr(), address as _, page.as_ptr()) })
+    }
 }
 
 /// The integer type used for vma flags.

-- 
2.48.0.rc2.279.g1de40edade-goog

