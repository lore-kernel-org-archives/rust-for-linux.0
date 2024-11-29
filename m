Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F5B1A0BC5
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 16:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732897986; cv=none; b=qHtWTDFNWy5+w6yel60XM85cc6rM0Dlr2iE9iR8BAg2EqfjFYq6+KPcC9aeeQ4ROxWFM9SgLPKrLykoCyvxJEfbrRX2bbuqwqSdjlzQaQaoYs6AuuQQpFj2YbUskkwHCI8m61Xa8ELAH6eTiuEP3fIAqdcUXkQwdTL/yg+JdXqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732897986; c=relaxed/simple;
	bh=rBEGLc7KJG1nI+I3PCkS6QqEUHC7WTE77ZFEyztUDIc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kWqFOPIr/0srko/JVAdhLCElxxBdj0g+EEkc3ipnwFuhHrL8DzxR1CSw4ln6FD2U982U89xR2Ym19L9kRC3znnUyBMuulSVUvEE+Ui17scpf8EK1+OnqnpuogsztVUbsC+BXBVOLlEWPS2PyE4LjGwMv2r+OnEVrP6jgks4guss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hWqOxIlD; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hWqOxIlD"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-385d80576abso748885f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 08:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732897983; x=1733502783; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NxiAaOQixinTmMpuFlr9Z7Cs/OKNMeW1CE1Bg5Rf1Zc=;
        b=hWqOxIlD7vG5pd4lsDxI+x8sLdVFcI2YqsNskLtWGk5Zix4f5Es1PfJ3j2k6WriogO
         WTjK/BnCgV340HfVvQFxyssGmNQ7ksslZx3h8oRZ8Ire3RMCPTUduDQ9plWAZebU1ijH
         9io07cXjMSvROzrjyPElqrzFDWSXDNbQmEuNNZU+S8hbu3Mz+rH/w6wVck+c/Y5BtMVB
         zA/46uM9ISAibnZXwrD1Vrhpj5gRX7TWKaTjB6kZOkkCE03uH9g88Y6+jhYE2yESG/W9
         sIZH11TP/umTfHVorBfY7SNDnyuGVW9GTmUFiNPXCbQt+CDeElEqAQ0EiCLKbIQuQ5v6
         k90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732897983; x=1733502783;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NxiAaOQixinTmMpuFlr9Z7Cs/OKNMeW1CE1Bg5Rf1Zc=;
        b=roGDy0JPNDqaU5NQq+04zbNd6KHtr6FqFucitKxiiuT2S4qrP0Fd70vb81yW8QKIfu
         UsC5kJOdewCZIDnmMn2gEEFQMeGZc8UAL5fDrCpSAxtxJlsk1U7jaF3JleRjduAonRdJ
         /DHz5L4FFEigafRkTuc290mNabQ3HA8o2r2MaN1PPVx3o1jSdGU6Gyvp2cR5mF6mU44N
         /r9ufkztbmCbqUxGW8EyD1TljoF0pYdTew5rRvDPBAs2kAwL7leUgDhu9ZSewHtUREG2
         7qnoOdGeckqcgs92y4Yl8P57UTfqi/ICua7ivzEScmqlxTbh1bpL1v0dAHoDB7exDqUZ
         rdAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1BP0wD6NiXCnqlshGjEXBGvwx8PS+qEzH3t4TbYG1Z2oQ+dgB4nglehqBjWSfrAAsu8o69h6EyEq+yJdCBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqoJVgrE/U0FMQF+sYFpO+SRqsfYGHgQGYJHtk39B72aPqklK3
	JIbvwB1gPQccRJWHnNskaYlTLZiy5mLiptO0C+xljeQaZjyfOZXc644SkzPqXqkWj+LUt0UZfbn
	IQFWOiWeVN+ST1Q==
X-Google-Smtp-Source: AGHT+IGYb3T/wZgxg6wvfixNQvKu7OW4dXOoNjGb+FLVFT5jRj0xJ7uK1bZMJYsE5nPmUYdm2iSLsb9tE8N9Qhw=
X-Received: from wmbjw2.prod.google.com ([2002:a05:600c:5742:b0:434:a4bc:534f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:400b:b0:382:486f:1360 with SMTP id ffacd0b85a97d-385c6ed9824mr13201148f8f.44.1732897982795;
 Fri, 29 Nov 2024 08:33:02 -0800 (PST)
Date: Fri, 29 Nov 2024 16:32:38 +0000
In-Reply-To: <20241129-vma-v10-0-4dfff05ba927@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241129-vma-v10-0-4dfff05ba927@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=rBEGLc7KJG1nI+I3PCkS6QqEUHC7WTE77ZFEyztUDIc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnSeywnZuEoxDobqs4lWzeHdYCGEpayHKpr1Fk9
 ltPcXjwVWmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ0nssAAKCRAEWL7uWMY5
 Rn6LD/9y8AHiDmndnB+qvZq4H5F9U2hmnc+pviQiE0r46f7JiYFx/m2fKqG1YdHnt/8lz0N/DOU
 3Z11N+ebn5UZJO4QiuZExGBwoDzEonp95mZYKWwSEM5lYWr/tIPZPlrN4jY2tULm1UvEFZ6S/R5
 otdlUsOhvEE3MOTA7EjE9pTiZ2vMp+i/hjeTCBqWzywDv3hAML9oTk/16e00eFdrY0mtCvLQxk0
 2alwCGptjDvpQOvmUvELwBFKJtlVeTdIZ7RO617X6WtZaKBDvAKXnAxTyCaMPfFyfY6qjVQJgQ+
 kbCteUJ0B9ryxuzxddA4Te9UE/wGptVhi8MF39q/huixQByiX9OPDdXnHo4vOoBJA3kahq1AgLl
 /oH4XHgOxJCX52Cqr9BaqgW7xTfMru7F3cijFzKaoeOzFZwuIamuH0x8a/OdpXML//YwQ80AY73
 uz42oob1f8bbvTTPjmtA+wLBZW9ieYSDvbdWno+UOkAR3c8TFWnT/k9kluifCzxlwRN+gJGNkrP
 4Ibj7905Fxe4hcKeErmMbzpalPlgTm0K7ERQN6XrD1aasl+GImueaArIqjEKrggKMJxZzl1boRd
 /CVUyTwmyJOHFEPjEahnBOGSWpVnqa2V18wURAduN8jAF8xde9A7xARVv9ZLP1pmo8kgeukX4f6 sVuweJAEgw6IiCg==
X-Mailer: b4 0.13.0
Message-ID: <20241129-vma-v10-5-4dfff05ba927@google.com>
Subject: [PATCH v10 5/8] mm: rust: add mmput_async support
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

Adds an MmWithUserAsync type that uses mmput_async when dropped but is
otherwise identical to MmWithUser. This has to be done using a separate
type because the thing we are changing is the destructor.

Rust Binder needs this to avoid a certain deadlock. See commit
9a9ab0d96362 ("binder: fix race between mmput() and do_exit()") for
details. It's also needed in the shrinker to avoid cleaning up the mm in
the shrinker's context.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/mm.rs | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index 425b73a9dfe6..50f4861ae4b9 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -98,6 +98,48 @@ fn deref(&self) -> &Mm {
     }
 }
 
+/// A wrapper for the kernel's `struct mm_struct`.
+///
+/// This type is identical to `MmWithUser` except that it uses `mmput_async` when dropping a
+/// refcount. This means that the destructor of `ARef<MmWithUserAsync>` is safe to call in atomic
+/// context.
+///
+/// # Invariants
+///
+/// Values of this type are always refcounted using `mmget`. The value of `mm_users` is non-zero.
+#[repr(transparent)]
+pub struct MmWithUserAsync {
+    mm: MmWithUser,
+}
+
+// SAFETY: It is safe to call `mmput_async` on another thread than where `mmget` was called.
+unsafe impl Send for MmWithUserAsync {}
+// SAFETY: All methods on `MmWithUserAsync` can be called in parallel from several threads.
+unsafe impl Sync for MmWithUserAsync {}
+
+// SAFETY: By the type invariants, this type is always refcounted.
+unsafe impl AlwaysRefCounted for MmWithUserAsync {
+    fn inc_ref(&self) {
+        // SAFETY: The pointer is valid since self is a reference.
+        unsafe { bindings::mmget(self.as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The caller is giving up their refcount.
+        unsafe { bindings::mmput_async(obj.cast().as_ptr()) };
+    }
+}
+
+// Make all `MmWithUser` methods available on `MmWithUserAsync`.
+impl Deref for MmWithUserAsync {
+    type Target = MmWithUser;
+
+    #[inline]
+    fn deref(&self) -> &MmWithUser {
+        &self.mm
+    }
+}
+
 // These methods are safe to call even if `mm_users` is zero.
 impl Mm {
     /// Call `mmgrab` on `current.mm`.
@@ -171,6 +213,13 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a MmWithUser {
         unsafe { &*ptr.cast() }
     }
 
+    /// Use `mmput_async` when dropping this refcount.
+    #[inline]
+    pub fn into_mmput_async(me: ARef<MmWithUser>) -> ARef<MmWithUserAsync> {
+        // SAFETY: The layouts and invariants are compatible.
+        unsafe { ARef::from_raw(ARef::into_raw(me).cast()) }
+    }
+
     /// Attempt to access a vma using the vma read lock.
     ///
     /// This is an optimistic trylock operation, so it may fail if there is contention. In that

-- 
2.47.0.338.g60cca15819-goog

