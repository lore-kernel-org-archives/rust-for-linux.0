Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65B5324B2E
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 13:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764079202; cv=none; b=XTDsQzow/S2qRqq77uY3EfN7gHDuj8VCok0JFQkAJK1i+OxTKnkTDwxJxIhTsjHZx99GfqThOAIzp1B3B+0HgoXpLggOYBEgPFjUWVhIuD4taSNFkbAYVjP+g4nPOZganMvLt0BHSFSXrLAIUGqWzWZUrsaclRDqbQqTxhgyPRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764079202; c=relaxed/simple;
	bh=L3V/hjYTh4TcX40q392ZKDq3r/3+jf1d4NHStYeCYDw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jtuAaoX28QVPpFOTotCJjz0D2Bo90r9OUXwlwPFyy5PMNsUn8VVHu9Nou0P/kxxwNMLEuIaB07youOeroOSY2u/7ovW6I7Kyu+7Ol5EVa/oZqRovV5qc+X7ccoNmHPIexslhvxuvqfffmmd7F845euuXJo3pWd6DyiZHqdaPy1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qY9Mm7hM; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qY9Mm7hM"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b70bca184ccso707460666b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 05:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764079198; x=1764683998; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mYICst1qwypuMGrR3BVNHhiHZNySi6HJ91X6sJpgEH0=;
        b=qY9Mm7hMftYLNvrW9rzgOiN5ReU1HbJPISx9kXF7RIlpa5aOTqBF4vyYfxHyBJ1hpD
         2L/DLlK6jblDc14zj+6l+iRtVf+i0VZXjfZj1sy8EKvlCRd5rzB0aWKtvYFmHHykmrDI
         ucEFdu14hPUeetH4EpHM0FIZgv6dlH9celi/MzXMsQG97ODV6UWQd/2uIVzCK9TajaUV
         6gn33XKDjwOVhJ8iCo+m0uIeBNA0KQ0qXkNk8fU0ob+iruF+kMiZ/E51EKP1eWbZoQMh
         +dKMR9Wo06ZjoHUPu4o58SRKoq87FJ96najL1PfNdsEuXF1ZXUdC3UzChGoBAZxxN0Vc
         088A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764079198; x=1764683998;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mYICst1qwypuMGrR3BVNHhiHZNySi6HJ91X6sJpgEH0=;
        b=wSCKdEeAkcSd+tVb8Z4czzUm6+3Gs3LyAZdJTkj7U7InwwuzDgCpi3lGLg9zggaggQ
         SqQTitBXO2sFzHFwe3/9cZSiWcTLtcDk/+8gR5zR0VBACGFXs0KfTwVxNDn0oiP5Kux5
         Ny9X2ofA29WN3jydGeepX8SkF6D2Ncz9d5zLKT9/IbYOiW4BZqrvJP1cibnIJRY0pVdN
         5jEw2q0A03szDti1ld3g82d3zE1WJafyNGERlB0/ggiXN3z1zQmAFuOst8i/cyreC2z7
         E+54Trwosixot2uYUNwQQhf9yhjIC9f49TiIStS7QMfLogSvHjapU2xld7GHEtr8A+0K
         IgbA==
X-Forwarded-Encrypted: i=1; AJvYcCXwipjohcoElBOSToTxM5pSB/VTKMWntKxcdAw++KbvhB4jLeGOYIT5bMLG2I1hAEY0noqP22nZttNjNIMSCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2DyIx2CTgtZihgzIlWDdGeVS/Mkn/hZUnG3vR6udEAmfP4nN6
	zPl3WQRPKty02cO/9WbXiUP/JnTCv3nm3Bc6wCT6+WOCc3YBQoRGvbv2+LZ4/xGy5CwLSBfc1Yk
	R7JUkWlYxhlYttbrb3Q==
X-Google-Smtp-Source: AGHT+IEdtZeVuESzqfQa48LfHPw+m+ViYXyfo2jQlTY7KINvNtoXCJIYAmkzm+U6yaLcIfB5QkfViMaZA5seMWw=
X-Received: from ejctz9.prod.google.com ([2002:a17:907:c789:b0:b73:5d0d:776f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:fa0c:b0:b76:8077:4eaa with SMTP id a640c23a62f3a-b7680774fecmr1022841766b.6.1764079198071;
 Tue, 25 Nov 2025 05:59:58 -0800 (PST)
Date: Tue, 25 Nov 2025 13:59:39 +0000
In-Reply-To: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=L3V/hjYTh4TcX40q392ZKDq3r/3+jf1d4NHStYeCYDw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpJbZY5UyJaMWpH7olMyhiF1A4pqajsthJcWOUT
 BLc5cw0c16JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaSW2WAAKCRAEWL7uWMY5
 RuauD/9f5YvyxMXU8Sd5fDOAmwtzP2TPTv+96udUc8i3bB1pa9RY8h2Q7pbttSahKdx+9Mq+FGG
 LMxc8dW7hK1KpvwzbI1tNHkb5wkD9GT8aF2GR115Bk0QHyeUDj+a0LB3ncVIal1b2sqKAn00nOr
 EV75V+G9VSQP8toXlkJ1wKzurOZmKgV95pSvO97oC8W7Kn+CP6kGX36TIY4RkuMorRUn6xWDvk9
 AeCX1+gqBtl1HcZMppkFNp6g3yLTM85U3BmCTtyzohBqLdBNRCsz/9wEtC6rGCorTQXRR475mDz
 zTgqeY4lw/AM1QiXPrzkFRZqDnDqnu41gOrMXZMc18h/todlO1kGocLSQLzUgIMTX8RmyFnZiC9
 zszL93bpojGkp17eD31+sBjtGyG/bFp3p2lWbuu0Xv99iZ+2Ayi2QPQlXBl1y04tm0QYRUjNMqZ
 HrQEwnQIujZ6KE7tT8SmXBJRSOH0BCTZEr5D9np3XYiilbivtagS83tUlAdDM4ok5peiNpFiQ1o
 IvXqY3nQYAK2q0AJ2dDh6SJLQADomfhYqa6sxf+GDTdS6xlevfb8lKrju3+y2RA3lPJWp2ejGLA
 eblyOJvqiYzI7UgPT7FKBMUnb40bIG7dXmNoskZC5RWSm+UROxqy0HEGTmgWWCwv69asJ3ibZ1D 6GmGffPbaIAU+vA==
X-Mailer: b4 0.14.2
Message-ID: <20251125-binder-bitmap-v6-3-dedaf1d05a98@google.com>
Subject: [PATCH v6 3/6] rust: id_pool: rename IdPool::new() to with_capacity()
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>
Cc: "=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

We want to change ::new() to take no parameters and produce a pool that
is as large as possible while also being inline because that is the
constructor that Rust Binder actually needs.

However, to avoid complications in examples, we still need the current
constructor. So rename it to with_capacity(), which is the idiomatic
Rust name for this kind constructor.

Reviewed-by: Burak Emir <bqe@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/id_pool.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
index 0b1f720a1f7df8766a8481f3c0b332d4cff3b4ad..7968b6c5566bf7022b865b5f59deaf46c96f747d 100644
--- a/rust/kernel/id_pool.rs
+++ b/rust/kernel/id_pool.rs
@@ -26,7 +26,7 @@
 /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
 /// use kernel::id_pool::IdPool;
 ///
-/// let mut pool = IdPool::new(64, GFP_KERNEL)?;
+/// let mut pool = IdPool::with_capacity(64, GFP_KERNEL)?;
 /// for i in 0..64 {
 ///     assert_eq!(i, pool.acquire_next_id(i).ok_or(ENOSPC)?);
 /// }
@@ -93,13 +93,13 @@ pub fn realloc(&self, flags: Flags) -> Result<PoolResizer, AllocError> {
 }
 
 impl IdPool {
-    /// Constructs a new [`IdPool`].
+    /// Constructs a new [`IdPool`] with space for a specific number of bits.
     ///
     /// A capacity below [`MAX_INLINE_LEN`] is adjusted to [`MAX_INLINE_LEN`].
     ///
     /// [`MAX_INLINE_LEN`]: BitmapVec::MAX_INLINE_LEN
     #[inline]
-    pub fn new(num_ids: usize, flags: Flags) -> Result<Self, AllocError> {
+    pub fn with_capacity(num_ids: usize, flags: Flags) -> Result<Self, AllocError> {
         let num_ids = usize::max(num_ids, BitmapVec::MAX_INLINE_LEN);
         let map = BitmapVec::new(num_ids, flags)?;
         Ok(Self { map })
@@ -129,7 +129,7 @@ pub fn capacity(&self) -> usize {
     ///     },
     /// };
     ///
-    /// let mut pool = IdPool::new(1024, GFP_KERNEL)?;
+    /// let mut pool = IdPool::with_capacity(1024, GFP_KERNEL)?;
     /// let alloc_request = pool.shrink_request().ok_or(AllocError)?;
     /// let resizer = alloc_request.realloc(GFP_KERNEL)?;
     /// pool.shrink(resizer);

-- 
2.52.0.460.gd25c4c69ec-goog

