Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456F9224AF3
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 13:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742478814; cv=none; b=AufUiuup4rFkafNtvbvId9BkOUVc3vr8QI3skdrfAJz3lxrDh9nZZdioZ5La4bzikB5SlaLZJ3fjVFzeVU9459rwVCoirnUs6UMdnzwpoomhJKWAjlkDSM2Fmfawn398oh5xDIIUuzoGtMDnvk0iPQ+4KQVkDrJk3J603fcNBYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742478814; c=relaxed/simple;
	bh=yLjhmMd/m/H55074HEYVORdOcdctvj3JoTlXaRNTHPM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AfAmL7gb2p7jF15sI9oHDi9mjuTBJ1PcekzEIYYlgDJ0zuhNATMfu2BxRIqxEek6mJw8PjYL/0hXux04ymyQqWB9fjy8wj+EtCqnPUZklN1HnNclMbaE1Q7KE117+fLsgniG78Dpb+L1nMhUqRMYta4ysEjZx+3b6RQH04UaTvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mY20bmNc; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mY20bmNc"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43bc97e6360so4285355e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 06:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742478810; x=1743083610; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nuEUHx8MPrCQicFsoRZBu6HG4ZIchgsQHrIZJXNn6G4=;
        b=mY20bmNcbOhQuK5OJuUq5f6lDU4YpRtEPgse8m/erTsLI4CVootXl7BnNyp/+lyUTl
         60ZG6Omab675/8ZD+lLVLMkHi6iPsDvVrFf8FQrSX00olNbbOv/fKTwoojNPfwA/XXfs
         H8QSyAyxPHlrTtyu1iarTZTqFOsaX+Gyerq/OSQ5sKdgJfQPSk1C4IzI9hIUR1FC9RRX
         xtBUgyNnoBxGseanOMDgnwRyx63fNkhvoG9bcdFmucegY1C4I9PfzlvcTN1LogVr2QuP
         J9Nk/g5Kyu+r1TNkFzylj/2YXWTih2U0MqQB7ARpUM/csnQDNclZyeqoYn+HpLEWwGT8
         14QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478810; x=1743083610;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nuEUHx8MPrCQicFsoRZBu6HG4ZIchgsQHrIZJXNn6G4=;
        b=WLrC9383AA1g8GfkRFfxq3n4lo1KBqx7PkcAJ9fXkzv2HTOni/emnY6yndsw3o0vqS
         ATN+h5uZEx8YVD0yhJ/IEMSOGcGP+tXPPj4dQLqiNAC3ybYF1z/fJIPectGrfAsEO32I
         VF1ut7kZ8YboXVN4t20czP6xkg5ZLAspfT64CQBEsGMUcROZ3JFq0d9Q59J7Te+Mwfiv
         SHTdiFgmxV6iRdZkAwbvisfvFYCzZVmdp0WjojtWQFBkns4lIsFdMcp0eYWcdKFXzQgG
         GWN7ZnQ0rbGdSan3mgO0G3zwECiONIz1kiwoIG+Bp2r38MsPVDOyCXH7nDRIw2Erbn7s
         1/JQ==
X-Gm-Message-State: AOJu0YyY96H1SvcI8XKGEyQ73OuZubALb4j8NNvs/+mcKCyfzjNfXWBO
	u2XPmQLoIQ0qt0fM09+mxpOM5ww1oiUbpxe9T/SPLKiCfumVd+Fb6POd73YjRhTZGJTu7H3+djx
	gTP62E9NJrwq0vA==
X-Google-Smtp-Source: AGHT+IEqYmzU76ihbeSsWGVf5seCrmCHx0d0WG+50BExIHwTnel5Diq5fLh1i+SQTHQN/ZBzeS1vpm7r+Yy9MPw=
X-Received: from wmbeq8.prod.google.com ([2002:a05:600c:8488:b0:43c:eba5:f9b3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e90:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-43d438813bfmr67438825e9.31.1742478810733;
 Thu, 20 Mar 2025 06:53:30 -0700 (PDT)
Date: Thu, 20 Mar 2025 13:52:59 +0000
In-Reply-To: <20250320-vec-methods-v1-0-7dff5cf25fe8@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250320-vec-methods-v1-0-7dff5cf25fe8@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2941; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=yLjhmMd/m/H55074HEYVORdOcdctvj3JoTlXaRNTHPM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn3B3OfmokVlnLyfYpQimu+G/cgJ5t7bDTRFR/A
 sifydHpS2iJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ9wdzgAKCRAEWL7uWMY5
 RqVRD/wOBuAntCDhrO5Fl/e4wRgNmEkbNX6Qf6AgPY3lZnPz2qlp7QOhyF3SZbRqcRN98R/G0ab
 3FPlQQe36AbbuynfJe1jC1HX05SHDXdbT2z5BBfT8iTjSoddqpFuB/lArYQzXsdVLWzKmesspgx
 /YzZmA0NQbwX4oxvA7yEvH9Jf8gI8fpotiNc1fgFpbR6rijGGFXHz9Rbw6AUHm75UI6waVZj6sN
 S6AGjQc6n0JqadxRQ4/chOR1dT8lDCHZ0lX+dM64+NJAtf/SPbtsFrpwFusoZlnAts2mTd4P3Wc
 pNx8l4yh7Q094MiAO4mQvfjNGu5v7UzpiEmmCmP7VlBKaAs5o+KTi6cbvxJvHNuO14rIAhpS0CP
 WAr04TEvq4PX/4R3kIv/UIes4VUIh0oS850NiiPRdTgWZDiYeCD6bmUeHr9gf3DaKRRO1fVapuj
 FvT073Kewq/pUsZDLCmoPPXQVJDY9mW7IXAqftpLEOz1kTGNRdtQUIFg5+kRY3nt+yzGi+UY5UU
 NoA/go5nMtwktKOvsnVG2ZSaknxqUS4+2Cr3iTs779lgYKHRuHSC+T/UPtEtcC6vZRf2yN/lXF7
 vrjchCbjJWhLXrs7kdlnq0Oz5jcjf/uqwqsc1F3n7nSSNo7Ah1zbzHg27jO2yUEhsp2tspcREYG D9nRHCgKEPm0L6g==
X-Mailer: b4 0.14.2
Message-ID: <20250320-vec-methods-v1-4-7dff5cf25fe8@google.com>
Subject: [PATCH 4/5] rust: alloc: add Vec::drain_all
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This is like the stdlib method drain, except that it's hard-coded to use
the entire vector's range. Rust Binder uses it in the range allocator to
take ownership of everything in a vector in a case where reusing the
vector is desirable.

Implementing `DrainAll` in terms of `slice::IterMut` lets us reuse some
nice optimizations in core for the case where T is a ZST.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 57 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index df930ff0d0b85b8b03c9b7932a2b31dfb62612ed..303198509885f5e24b74da5a92382b518de3e1c0 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -564,6 +564,30 @@ pub fn truncate(&mut self, len: usize) {
         //   len, therefore we have exclusive access to [`new_len`, `old_len`)
         unsafe { ptr::drop_in_place(ptr) };
     }
+
+    /// Takes ownership of all items in this vector without consuming the allocation.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = kernel::kvec![0, 1, 2, 3]?;
+    ///
+    /// for (i, j) in v.drain_all().enumerate() {
+    ///     assert_eq!(i, j);
+    /// }
+    ///
+    /// assert!(v.capacity() >= 4);
+    /// ```
+    pub fn drain_all(&mut self) -> DrainAll<'_, T> {
+        let len = self.len();
+        // INVARIANT: The first 0 elements are valid.
+        self.len = 0;
+        // INVARIANT: The first `len` elements of the spare capacity are valid values, and as we
+        // just set the length to zero, we may transfer ownership to the `DrainAll` object.
+        DrainAll {
+            elements: self.spare_capacity_mut()[..len].iter_mut(),
+        }
+    }
 }
 
 impl<T: Clone, A: Allocator> Vec<T, A> {
@@ -1049,3 +1073,36 @@ fn into_iter(self) -> Self::IntoIter {
         }
     }
 }
+
+/// An iterator that owns all items in a vector, but does not own its allocation.
+///
+/// # Invariants
+///
+/// Every `&mut MaybeUninit<T>` returned by the iterator contains a valid `T` owned by this
+/// `DrainAll`.
+pub struct DrainAll<'vec, T> {
+    elements: slice::IterMut<'vec, MaybeUninit<T>>,
+}
+
+impl<'vec, T> Iterator for DrainAll<'vec, T> {
+    type Item = T;
+
+    fn next(&mut self) -> Option<T> {
+        let elem = self.elements.next()?;
+        // SAFETY: By the type invariants, we may take ownership of the value in this
+        // `MaybeUninit<T>`.
+        Some(unsafe { elem.assume_init_read() })
+    }
+
+    fn size_hint(&self) -> (usize, Option<usize>) {
+        self.elements.size_hint()
+    }
+}
+
+impl<'vec, T> Drop for DrainAll<'vec, T> {
+    fn drop(&mut self) {
+        if core::mem::needs_drop::<T>() {
+            while self.next().is_some() {}
+        }
+    }
+}

-- 
2.49.0.rc1.451.g8f38331e32-goog

