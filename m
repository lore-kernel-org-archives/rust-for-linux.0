Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1F3248185
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 13:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948179; cv=none; b=MBp9/HwdA5UDXkRZdZewlff4K03E8hHhcuQYLMiqm5slU6kOjMHx4uM82Sqr79A3/rJ/eWk97/VyPUfVqrMpuSTtOLpfMGqgd80sT2+KGn+1yrJxYgLGud8/jibEH8kXXT9e0ejIvs7BhD7LJWrcXfqx0CahQz66oCxn1tH3jVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948179; c=relaxed/simple;
	bh=30XR2NvyOSBS+jDMS4+B8d4GBDe/RpEg1dR1knprL04=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AW+TW8njJMmFR8Ag6uU6eAh+hP/U6oivhtxr8L2pRMbnE62EHdqVxOe1IFYRXZirGZmUFO1XudYQV20yqdXjdJKzA88X0kGBUlhHKueEGrPgfV0cttTQh0q3+m1kunO4mlB3C8xfb3EyByIWN2sfkfgF8wmHij1k97RlB7S8udM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I7prBL8M; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I7prBL8M"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43623bf2a83so53778475e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 05:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736948176; x=1737552976; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9rKypNB63ajEZUNiwKcfWGkLNs9kznO8TMtZ1K+RxGI=;
        b=I7prBL8MiSVSMVcPydgc/pJklFjdw2e4djeXk/kA0sOq2GYeXq2kJyaK0SDUoiiZDk
         0Mjlcejle6SZ2p2tnS792G5n6e9kEO+5szlBLuMZV+WQ7SOdDYg/iIUGSBjc9gJ29jPm
         8Cc2S01FR025MDRzTpV0aSfnXBwMDHu7PxL54EhftuxjLVuymqIvNDhdocXkN/SolUUP
         XD3siPS2wbd3Bs40puLCprgxH71bHBRn2AT4y3x85TYDxniK/UD4BNjnEw9V469APgNk
         zX+rPfO2xX3iouElCsKA3qBfqazCY80q1OQuaGPXzx8kURZNSN1zFKdqSrkxoD1AvvaN
         57DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948176; x=1737552976;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9rKypNB63ajEZUNiwKcfWGkLNs9kznO8TMtZ1K+RxGI=;
        b=bTznW2nC+6HsUtC90lmbKnj5ssFsyF5LYyg806JSeqgwJ5ElCokRGG0/qYc/s9s8pk
         VfCVcz0zkOjTTI4mz9yKJU2a2YA804UAx6O8j+1waOv+SR0LU0Y1W8M48rafaU7X3+qi
         czT4Yji2+CmLw/YwJV1L7F5AuJdakGMKRvypR6VXcixzRjtru6knxYEZ4MbbNEr+E+Th
         90N2W4ioe/SL1Oo0j1+DWyGttkLCHh2aZ/0YzcUlWXVXy9eakPcm+r51oIdr7xSIEz9M
         GLVlow2kiTRn8akZIm8H+/TSNe2rLnsAgmeMCsPIDFNDu+sYD69guG/Ij4Izx7mwlAFO
         iimw==
X-Forwarded-Encrypted: i=1; AJvYcCWDvGg6dLpYoQVBcVT3+p1Gpmodhw4BsWdHe6VXEn/An7Sh4rTWroAvjlMQ5YUl2QeSfvNkaP3YcL+Y5aDx/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvEIv+JxozSYwyB93KL+jvty1YwnhfBA9X+IGvNUSPrPp2+HtJ
	865Q43y6j49iWapUSGsK0dSNW96hQIZFO50Q/qLB8kMlSStRRKuW0RUp8e2KbpXapFnAv8SWxiC
	pGqF/6IUyjw5edA==
X-Google-Smtp-Source: AGHT+IGsuwZ1l0g4W3y3Qu+FgJ8iww+9A3FLFIVNNL+wg7yBLfHHRHUpzUWCiouwB9ZiGGEoPnqIBOqi1jWjsVE=
X-Received: from wmbfp18.prod.google.com ([2002:a05:600c:6992:b0:434:9fab:eb5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:348c:b0:436:ed33:1535 with SMTP id 5b1f17b1804b1-436ed3316a4mr227011565e9.12.1736948175968;
 Wed, 15 Jan 2025 05:36:15 -0800 (PST)
Date: Wed, 15 Jan 2025 13:35:08 +0000
In-Reply-To: <20250115-vma-v12-0-375099ae017a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250115-vma-v12-0-375099ae017a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3168; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=30XR2NvyOSBS+jDMS4+B8d4GBDe/RpEg1dR1knprL04=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnh7m/n84l75cPhMeQdlYkKqGCd0G/G16B/EPtL
 8EOZEg0z1eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ4e5vwAKCRAEWL7uWMY5
 Rh8YD/0UTFeQviTFRZ0rYolNkH7u7m9ndG6cRTDSh6VUOR6SOTsz3T0HZAXgaIzUB4ansQZ5FZa
 Hj2AfkIysDwMHYRE792KZNGtY4D5HnhPG0UvY3yCPTVplkT7QXvyCE+/xmFL0Nd8aoJGRKv25M0
 hpm0ihktW9H6xXBBuHgGiF2IVx2QRxsUIWDMw8b+1sByiPrjMoc8QhkOcAxiG5bPrTtgdyjuwkz
 HbFI8TvbCblTU5qgb1syg8w5crYZiXH3RAnZWA4Nykd1csEn6iNepKikxxADNbht3qjj2/owiAQ
 TXs26xwpbh5H6M3dwl0QOArMRffQ602vtsmTd2zeAjCpSas1BGt/e141lB2pzMImtmmCM7OFu7J
 1OeELsA671/xBaQLwFxqyOhI349LfXixRgGleNTwTdzOfMq3bUvzUEcAenXA6N5fxv78lee6klv
 OmtUgXTkopsrc7fV/IMu+mvhxVBEVYbflPUoPEeNW6R76MEldQR8HoDvmmKweZt3bGRpuR2F7kL
 Wo6Q27nXpOZsknq2dCGwxH9Y1DyuIT3y0ah+dYMulo2AQy5jM5iZZBM2Yp5xqHJUPW9tazwd6/8
 H63sV0iAZhbIci7jP6KlcVGERq6kLTyAfsz3NBmmfedhmfaLo5Ph0qm3v0+wRTr3c9YIljrqHLT qOJ+CFShyk701OA==
X-Mailer: b4 0.13.0
Message-ID: <20250115-vma-v12-5-375099ae017a@google.com>
Subject: [PATCH v12 5/8] mm: rust: add mmput_async support
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
index 60dc66972576..3bb2ccd5fda1 100644
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
2.48.0.rc2.279.g1de40edade-goog

