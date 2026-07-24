Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F873F328C
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 23:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784936320; cv=none; b=Xxbmna4ONW4tza5S6+lWgJ7Zl6ceDu5Bglcbo3C13T2Ke6IJ/eTJ1HT376dlG2K6AoPWebGofBycDYL6wQvs8K17XhwhKrp1bFhvI9oiOdUToVrsQEr+mZ0eCXqSvl/orlw9pfqF4KhD83jdCp4CFC1WvL4N+JOZeL8kXHnPn3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784936320; c=relaxed/simple;
	bh=R4aeED2qviRrSYHBk8tIzRI9ITwvLrUADpb7MhsLkTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lo/XpEMfZwDxT/coPC2OrAhSLzZ5Wd/G9Ck5vmldAbwHxFvoKeM6ouk6Kulc5fpfDy5x+eLFfP5lBAAzn3PCs0y41Z9jXorvXDz2k9VADiD3d0R3Vo3Ss+lxM7aYJiJRoPEIt+S1NY8u09yYnVE3ee7f8klXqwCahjW4YNdBeuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNRLJxa8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNRLJxa8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954afac04bso10403875e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 16:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784936317; x=1785541117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f39CLR4g0AB+NJDog9MggUnlDTuwvf2U9/I9mdNOEyg=;
        b=RNRLJxa87EOc75cIJkCOvjGgM5bWpiQaIeuukyjolgotWMTqgdrwfCS42s+WxSsRm/
         WRaSr/e1GrSIPAFCdzk5VCo+tEHl5xYQqknlQ66j8B8hjvYmUF/V/yHoImKPJQBNah4b
         5QV5hEzuGmIzUO7xruhgvxqQ2e4xNwM1FLtx7amifubp3QhFzkIk7asYrq0mDV4UrZ2Y
         /U2/NszVNMzyiyjX7ezi4l4Zwi6Gu4+1ys4cwSQ5G/XCP1SM3cWZ9JsMpkOf9oiLnK48
         CIVeE6MRECuvjTflEDO57U0eWgP1a/BJkNGCpBPp4UWghEityK6fCdY8Yi74eyAOdIUB
         +t9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784936317; x=1785541117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f39CLR4g0AB+NJDog9MggUnlDTuwvf2U9/I9mdNOEyg=;
        b=WAZLAc/hlMxMHtoCYXy9HtcQK3R8faYgpzjD7Pi5K/8xeQcgYrrFbNJf0TAfIUfexP
         6zx7Ykn+Z7fQL4W6LzDeugGYBtUMG9lJjFkwmxBbo+fwSAUEjzC39b2Kb8dWQiN3Qhkr
         dtWb21iCvXfJIquKc8nVgfXsT/MGLEIFdS7eHfwZ+bnchuZPU4a3dgPtAqB2UT7eZMN0
         iEl/iXpcjTmblIrphATuu1PR9At1xpVuXUZuvjgFJpccjFX1dUyjhUoBzQoJAGJba8Uv
         +1zdFcqKAemIpOihhNWLEDTpPsBJByMNPlidMI894HkiODkCl+NkJpa26SEEyEDGtyzP
         FFZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtbjAh1nyk+U/lEqDjudjpyqbZvFDyEefAOmsyNmdazvKN5EAlBYIPHAWXcjAY37rpg2biDD6ZJ/7KRvDu2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWALktxUiQhZuSo5HO0xdibUx3enA0Q7avre99ghs8zIB2+K6G
	8tIP/eKlNIH9tH06QBYNpbKF/Ms7NqatzViTcqg8RgPJtGrq+ay2yAWv
X-Gm-Gg: AR+sD10o6lW6dZfg9Slk0NtkYuXmyT6Jhqs3tZuquPU+G8B9k+7CDYbFwi/MnQR+ryl
	zwaNBq0dbBzLqa7rW+khxeO/1Pen2Fhtowponh7KVt8rkN4e4BWQ8DXWFZYeM2+0zJFkMrJZlKq
	yI/o4k0YO87gqJMML4NBmEfQtLNRhynvXGUszKiXP4iKxPHtsnuZsU53XMrtjdipFKwfcQ152m0
	CzTrbVruZmjILynQLAhAjAmHwblLGbmxajC1NRV4WwRY3q3AKjRdTLLbddbo70NyArMcpYWEfTl
	IE9pBytOMJWqkIj8k6PDSVCTKLaqCL+fN9pN20WZMHjsM5A9pI1AdQ18DRRMlEXFKsAo19qNWyJ
	LKOoP7RueBsBBgwqyvD6G44ri/Vu0JE4XBYGIsj+4PR2LyAatWqK+gcCAJDCvydWfrSt9es0yWP
	t61QHSStW5E9dG5YoIRxGpKJIj/Pgh6lcv/hHkIxMJRr7gQpTDJGjKJVrv
X-Received: by 2002:a05:600c:4e0d:b0:495:5b4a:53b7 with SMTP id 5b1f17b1804b1-496b56f143dmr4023275e9.19.1784936316788;
        Fri, 24 Jul 2026 16:38:36 -0700 (PDT)
Received: from Cian.taile2c8f4.ts.net ([2a02:8084:d03:fa00:819d:8e1d:c966:142d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957b5f35a1sm72226775e9.0.2026.07.24.16.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 16:38:36 -0700 (PDT)
From: Cian McGuire <cianmcguire167@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cian McGuire <cianmcguire167@gmail.com>
Subject: [PATCH v2 1/4] rust: aref: document safety of ARef doctest example
Date: Sat, 25 Jul 2026 00:38:22 +0100
Message-ID: <20260724233825.1321247-1-cianmcguire167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `into_raw` doctest contains two `unsafe` items whose SAFETY comments
were left as "TODO.": the `AlwaysRefCounted` impl for the example's
`Empty` type, and the subsequent `ARef::from_raw` call.

Both are sound for the same reason: `Empty`'s `dec_ref` is a no-op and
never deallocates anything. `AlwaysRefCounted`'s "keep alive until
matching decrement" guarantee therefore holds vacuously here -- no
decrement in this impl ever frees the object, so it cannot be freed
while a live increment remains. The object's actual lifetime is governed
entirely by ordinary Rust scoping instead: `data` is a stack value that
outlives every use of `ptr`/`data_ref`/`raw_ptr`, none of which is ever
dereferenced in the example.

The same fact justifies the `from_raw` call. Elsewhere in this file,
`Clone` and `From<&T>` justify their own calls to `from_raw` by pointing
at a preceding `inc_ref()` call, but no such call happens in this
example. That is fine here specifically because `Empty` does not track a
real reference count at all, so there is no accounting for `from_raw` to
violate, regardless of whether an increment "really" occurred.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/351
Signed-off-by: Cian McGuire <cianmcguire167@gmail.com>
---
v2:
- Reworked the `AlwaysRefCounted for Empty` comment: v1 only argued the
  `dec_ref` half of the trait's contract; now it also explains why the
  no-op `dec_ref` means nothing is ever freed through this impl, so the
  "keep alive until matching decrement" guarantee cannot be violated,
  and notes neither pointer is dereferenced in the example.
- Reworded the `from_raw` comment to state concretely which invariant is
  vacuous, instead of just asserting "vacuously satisfied".

 rust/kernel/sync/aref.rs | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index b721b2e00b98..37dcd0a0f406 100644
--- a/rust/kernel/sync/aref.rs
+++ b/rust/kernel/sync/aref.rs
@@ -124,7 +124,11 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// struct Empty {}
     ///
-    /// # // SAFETY: TODO.
+    /// # // SAFETY: `dec_ref` is a no-op and never deallocates `data`, so the object's
+    /// # // lifetime is governed entirely by ordinary Rust scoping, not by this impl; the
+    /// # // trait's "keep alive until matching decrement" guarantee holds vacuously because
+    /// # // no decrement here ever frees anything, and neither `ptr` nor `raw_ptr` is ever
+    /// # // dereferenced in this example.
     /// unsafe impl AlwaysRefCounted for Empty {
     ///     fn inc_ref(&self) {}
     ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
@@ -132,7 +136,9 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// let mut data = Empty {};
     /// let ptr = NonNull::<Empty>::new(&mut data).unwrap();
-    /// # // SAFETY: TODO.
+    /// # // SAFETY: `from_raw`'s contract concerns a reference count that `Empty` doesn't
+    /// # // actually have; since `inc_ref`/`dec_ref` never touch any state, there is no
+    /// # // invariant here for `from_raw` to violate.
     /// let data_ref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
     /// let raw_ptr: NonNull<Empty> = ARef::into_raw(data_ref);
     ///
-- 
2.55.0

