Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B293112C4
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 13:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762779980; cv=none; b=cJzS0Ts//k387sEBSc4hth5m2f3/CSvEQBy9/+bBV8UzpFv8AqmK54sDGyjQR9e38jbOs1zJ5WvalblYwub0HS0hmL6b4qgB2rsd0Nv2uq9BW/6hU38EN+ANkgAAReQcZKhFfFBmIW+YCA+EDQ+iFHV6RTjTBHYAJ2t60EhBxDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762779980; c=relaxed/simple;
	bh=m1vVqdokFGJjs0Wc5xiNelJgyQeXsj1xAzq9sutLqvQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qFQoDUOq48B1F48LDRK2/LLQBffpwvTSSwHHw8MvDaTmf0jzLqYvZO7hqHk2iNbKl4mnBRTrzGGCDFWirpkpac9RAMmva3ejSqRrEWIBQEfIwk4g/iNw5HLvzZ8j06GqW5POBUDGU9aIT35i10BFX9Tq/yzgGBZmCcXO0yF1qZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YUchCdrJ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YUchCdrJ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-471201dc0e9so22407545e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 05:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762779977; x=1763384777; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cdy78GHJToK/JjNyIhLRtXUU+0hlDX8vDSmxqOI6fJE=;
        b=YUchCdrJTDw7QdmT5W4FwiyV3QbE+cJ/qegMxg9Mxty5DtwKTH1JN+8M460LYhzdWu
         TONoy9BFNpLSn+vgdVWI+juusSHKgSUu8FiL5wnTeSNe9/eNl5nzz4r43ofFQb4x1z66
         I8Dzx+sBHCDk5F0GpeMlyQZFM0el+8wTBazp/0p4drCV3eTEClXPTKga3TEf9MB0DgfO
         SvHghrqfS2Nv6hQc8B5L8KcHRvS7jcvo5dBVte2Ndndv5yrYeUY46vrsnOy6UFVea0Vr
         7SSekyxMPJnSRkUljBFKqKPyJXgTvK/e6JGCH42p1By5821Ck5E4oawMjWi9fTUaWvNu
         tfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762779977; x=1763384777;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cdy78GHJToK/JjNyIhLRtXUU+0hlDX8vDSmxqOI6fJE=;
        b=VPHzWXaJ466Lqoo+1IQ4lPdCCWi5Ij5F6K5KpGbvByd7pK/gWJSLKifc8AesTqNusC
         lF77wkbc6l8n9C4BVSc6jChcOWpk3irWfTqgTJh7d6bRSNainVuga1g4CIQhD3Z1JA8V
         oxYBlmvU8+YXru9bj8tMOeXLy/czhzYwiDG3SMErK2vJogpS+5VS746CrJbqzL0qZhBI
         r4P83pU1KbCpfaFHXbvXBPYIPURusB9ug20dOV5TfHW2ekW28MuiET+E6BljkJ7kt7yy
         Y8YoXRrhK+FXg+irlX6mtUi22khG89bZcfzuFBGJCFhClapbvY1vBTm9uLcU6x7h6Ubp
         LvuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyn8hNYzm//5h81Ormg1K3+WPfV0GjV0eZMPF1M9okoCOXOwJzLJotlmSqwfIPExVuNqOFya7oaoI2Z7bSoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2SG2ybWuLscPc3igcaA65/KfLKPjr7rYPIR0Z3EM1BBrEtd93
	loZnB7keyZcPVxPeGy180zvLp84DjEl4jp3JLC5mvh0OD7e/DKFro1i2gXETk3etbx7r2dLNg1o
	I5wVSgSq3c5hvtP1WFA==
X-Google-Smtp-Source: AGHT+IEc22nyf0SxRXO1MsTddRElJjOhoLrCVVBkpsoGR23XRROluM5qaNXAmsmXS0MF8ilFDXjhtNk6g+l6jOU=
X-Received: from wmmr22.prod.google.com ([2002:a05:600c:4256:b0:477:5b53:e6e6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35c8:b0:477:7c45:87b2 with SMTP id 5b1f17b1804b1-4777c458895mr25242705e9.16.1762779976819;
 Mon, 10 Nov 2025 05:06:16 -0800 (PST)
Date: Mon, 10 Nov 2025 13:05:56 +0000
In-Reply-To: <20251110-binder-bitmap-v4-0-5ed8a7fab1b9@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110-binder-bitmap-v4-0-5ed8a7fab1b9@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2473; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=m1vVqdokFGJjs0Wc5xiNelJgyQeXsj1xAzq9sutLqvQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpEeNDj0+4b38ogh/01MXmXpq9AWMLVEfFTgFI4
 ELaPwWpxTCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaRHjQwAKCRAEWL7uWMY5
 Ru5BEACjYUnsofpWcJ0H+hy5wsR6XrOYJ9I5zDeaF/4c1fr515jbIpNwBsjIJkijkqdipOllZ+T
 pi1JSDpE9A3FK6Ee8C14sITKmi7zvM1UXdlvwRo/LDrJgrWikJ6huduz+LhlQnL7VOL6nVVUAUs
 3woqAMAzCaZ+5cNO+p/FCTQBK5Kkt178AbIa091Jodjk32CGLs1bWa1HenYvfbZSV8LvClIbMel
 t3Uw/lQz9z95IeORgsZWqSPoCeaukP3phxLR2dSgD/b6weJcLX57ey/gsrNhNhPzmbvsOFU9StT
 OVgWATZ9Zd1i/jMDEpEZlKsVsIxgeCa7eHAmxChZMV6tjYdiBS2idR3PnhoHfznIs4rQR91MkMI
 cpkY3ceEVKdhUh2ovjfp9Wzg94k8zlWTaggpA74/DmFoVcObQ8GA6PDcebHbGE2gC2JvCPPU2n+
 nlMG3sNfC3V8Jg9V301jYDpJdYAaSF3cMsxnNBptfGUJ6g5kYzsKZvb5mW9PF2LGhN9oLqhww1H
 LMReh/32jqtU0wQUIGWrawdrF7SeVdbPTJEdoPXQsDH0b9LOyNCdXDKbCFwXln5TyUGSXtCwatQ
 8EZP7BoptWrI6yT1IrA3KswC+dRGVxGjACRKqF5Gxj9mBtw9Xso45AS0TogcObsb3w8B2ebQ6/d 8CV9FBblUsXQUWQ==
X-Mailer: b4 0.14.2
Message-ID: <20251110-binder-bitmap-v4-3-5ed8a7fab1b9@google.com>
Subject: [PATCH v4 3/6] rust: bitmap: rename IdPool::new to with_capacity
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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/id_pool.rs | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
index a41a3404213ca92d53b14c80101afff6ac8c416e..5942f678db015e902fa482eb64c38512a468e449 100644
--- a/rust/kernel/id_pool.rs
+++ b/rust/kernel/id_pool.rs
@@ -28,7 +28,7 @@
 /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
 /// use kernel::id_pool::IdPool;
 ///
-/// let mut pool = IdPool::new(64, GFP_KERNEL)?;
+/// let mut pool = IdPool::with_capacity(64, GFP_KERNEL)?;
 /// for i in 0..64 {
 ///     assert_eq!(i, pool.acquire_next_id(i).ok_or(ENOSPC)?);
 /// }
@@ -95,14 +95,14 @@ pub fn realloc(&self, flags: Flags) -> Result<PoolResizer, AllocError> {
 }
 
 impl IdPool {
-    /// Constructs a new [`IdPool`].
+    /// Constructs a new [`IdPool`] with space for a specific number of bits.
     ///
-    /// A capacity below [`BITS_PER_LONG`] is adjusted to
-    /// [`BITS_PER_LONG`].
+    /// A capacity below [`NO_ALLOC_MAX_LEN`] is adjusted to
+    /// [`NO_ALLOC_MAX_LEN`].
     ///
-    /// [`BITS_PER_LONG`]: srctree/include/asm-generic/bitsperlong.h
+    /// [`NO_ALLOC_MAX_LEN`]: BitmapVec::NO_ALLOC_MAX_LEN
     #[inline]
-    pub fn new(num_ids: usize, flags: Flags) -> Result<Self, AllocError> {
+    pub fn with_capacity(num_ids: usize, flags: Flags) -> Result<Self, AllocError> {
         let num_ids = core::cmp::max(num_ids, BITS_PER_LONG);
         let map = BitmapVec::new(num_ids, flags)?;
         Ok(Self { map })
@@ -126,7 +126,7 @@ pub fn capacity(&self) -> usize {
     /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
     /// use kernel::id_pool::{ReallocRequest, IdPool};
     ///
-    /// let mut pool = IdPool::new(1024, GFP_KERNEL)?;
+    /// let mut pool = IdPool::with_capacity(1024, GFP_KERNEL)?;
     /// let alloc_request = pool.shrink_request().ok_or(AllocError)?;
     /// let resizer = alloc_request.realloc(GFP_KERNEL)?;
     /// pool.shrink(resizer);

-- 
2.51.2.1041.gc1ab5b90ca-goog

