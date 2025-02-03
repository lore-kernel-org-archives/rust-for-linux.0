Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9524204C39
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Feb 2025 12:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584926; cv=none; b=J7D+vSsgQpG2tBtsK3ajaDLjk+22DlM3GexyOVXiK5pvni8LguE2HTkSk1IL3XIWbJ8U0ydCQ0xhZNmkDgPa7qOwNTkVIDI2YOtpkJ2NcJooPyr2uFlnZwqBsSznaRf+hpwmAsUauo1L6ZEnapnGCd4WJvzElijxX5ypyx2Ol98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584926; c=relaxed/simple;
	bh=ACsxo5nqWOfFud7GSbyxer8izfkYzgJ6Pryyu1sTy1I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S+UxcXBskKDgf5uSMJFQJ2JBaMUKXqzkjNK90fPnWrIcbCauFd6JmOXcvwjCDZTGG3UV4VRSKzwiihkVk1TaGQpjZJosUXEIi3QNVsGCd9z6eYIOMAXVwqyel7nVXiBi8UJOYIVmtJ6CWtLq0W+421BXb9eELljlkFvx7tBnmek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MQJqJ6dE; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MQJqJ6dE"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43646b453bcso21007955e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Feb 2025 04:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738584923; x=1739189723; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6wKw9Mczsy3GQd6f513sHnBPndDv3PUBzx6N+4yBSao=;
        b=MQJqJ6dExfCsOCrTdiPN/ieZA8/Tz6p63iYsRJeQcHQFLQ45CNCGPEHtBCurzgPiZo
         D2rfIU6if3WUdhRlpaJ9x7k60rWYssE6QcwYims6cUCt+wWQ9lIiP3BYyKFKLLSUXAvQ
         qsU/+bpcvktrTZZ5Ux6g4kS8scG18zdvjYtyVBE9+Xq41IhV3No74VZttFYzw6AgcVwY
         kXaHUry+xUSzUpqXf73znmuWf9QepOJuEaiVVk2uP0i8oyUDwr7qVRCcFZM5DkiAPVPr
         icNJKXFKVajVcCBQ1tZfT3qr7x4Eg4T8VhaPAsFPhg5zBANmgdSw6IhPLpbhDlv207Yu
         rn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738584923; x=1739189723;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6wKw9Mczsy3GQd6f513sHnBPndDv3PUBzx6N+4yBSao=;
        b=dx0eaH/KqBSP6hxn3Rue6piF/sZKhfdUNItWN3RoWkcmL7CuASORZgGS6dfTCP3vTP
         /YPxzAfATKulNvwMDh7lq3lWZLCW3pwURwLac+slmVvyMvl9Lxc11qbcJ+AQi8Wun15m
         4hqpP0RBQqzYK0e8ebUQvTaOapTPK8UgND9ccWwU3dqDdBaZt4UeAwDfLvf5nKXtkl64
         vtgYgGeF+N69hZhM9KrjozaL9tOTXAGLXD28ebWR3B9inzGmjphZT1AYL/c4Yb8z3G74
         URB143Av3bjZKyOUseYY1xZ658LoVQL5wpXwGxtca5+BK4vkBY+0dULt0Loi9vvF+JIL
         lxsw==
X-Forwarded-Encrypted: i=1; AJvYcCWyYKPFMBRuPlM+cGrU7Y34ZIu8L3UZAX81CMOvY8Ko+in31M9Zhz3CWtPSseX7iJ99vOZC94B+Tz+2oyE4LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVMiayL8ATaQfAEfMDt3GMT+HgzpPERPGIfdvWX6dya6AyVM9e
	Gsc6BWhDMs96RcIza8fvy69XWNmrn371vzzBm6bly25cbIjyRvnlhymmoYKqLs1SNTxhwoXwtPM
	ipIYAeEdQh5hsWg==
X-Google-Smtp-Source: AGHT+IGCacv+6M717acz2TK1/3JVC+EAq8qtKNOoyAR0vAmx15aLEyGhA+8TxKSJtahX9auTkLFiUsit2j20Pw8=
X-Received: from wmbay23.prod.google.com ([2002:a05:600c:1e17:b0:434:f299:5633])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3c89:b0:434:a7e7:a1ca with SMTP id 5b1f17b1804b1-438dc40ffaamr172046805e9.20.1738584923172;
 Mon, 03 Feb 2025 04:15:23 -0800 (PST)
Date: Mon, 03 Feb 2025 12:14:40 +0000
In-Reply-To: <20250203-vma-v13-0-2b998268a396@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250203-vma-v13-0-2b998268a396@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3164; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ACsxo5nqWOfFud7GSbyxer8izfkYzgJ6Pryyu1sTy1I=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnoLNL4o53AT5ZPycfgR+LVXykH5mUGeHNBJb86
 PLfYDNydpeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ6CzSwAKCRAEWL7uWMY5
 RiVkEACBiFS6xSL3eKzx6Ld9VzUml20GBqlKuHKgONIlsSMzAChjH+2qe05ePtG6sKfXIaQR9sZ
 6iur0KMizrFbW7s66SOtt+cdm+p6Vnn6Jm+IoPzZqOMNZeAEbr7OHiO74Bg/ebwRHevUyCUQ7g+
 1l9CNSBR4la/6gY0ZZYVN/a9EqbCiwpXB6MppK0IOlZblODbko3NbpbCvd9+EMKcVf8M1pYnNgm
 rgZPCBrAeH2hb9hh1AhYJmD+iWtkVbFNtgkK8crLJahPfED5mGv3ezMmgO7XcZbsAvZh01mp5hb
 F+v1g99IzTWvWxgDmujStn9sSgS9lG1wRX0LAtY6MejBJZRZ+EZAnyjKvg42G626oq+Rw+S957Q
 LcOW34tMJGTKNF3PKuMoBzb6OFeeft3zZ3DBhDsJPG0mIX0YiJbYN5+ZGGO41yjBFghFja2Q+ZI
 W1BUhho9nvX97vcq/7OTzmWvx+aZ3p3Mlm70hNHAyWxqmhZ3lk5EmOKI9JOLSiLGz8aQiTqyPXy
 UNcZwUe/jh40mxP+WzrKbG/d+lx2DkhWKl1djkyMfavqjFB2zNF/B62kXjxJlrgEvOe0SCy11NM
 2JBX2r9rPWoOIL4kLE5W6/emdo/nTlXLmInzZsmBNXGaTikC3bgIBqBIb/VbRetmQY0g1JXVL1Z 9+Xz+7ht6LLxR/g==
X-Mailer: b4 0.13.0
Message-ID: <20250203-vma-v13-5-2b998268a396@google.com>
Subject: [PATCH v13 5/8] mm: rust: add mmput_async support
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

Adds an MmWithUserAsync type that uses mmput_async when dropped but is
otherwise identical to MmWithUser. This has to be done using a separate
type because the thing we are changing is the destructor.

Rust Binder needs this to avoid a certain deadlock. See commit
9a9ab0d96362 ("binder: fix race between mmput() and do_exit()") for
details. It's also needed in the shrinker to avoid cleaning up the mm in
the shrinker's context.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/mm.rs | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index 88167c0cbd93..1c43e51c9cca 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -110,6 +110,48 @@ fn deref(&self) -> &Mm {
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
     /// Returns a raw pointer to the inner `mm_struct`.
@@ -161,6 +203,13 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a MmWithUser {
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
2.48.1.362.g079036d154-goog

