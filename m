Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276D2385D8E
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 21:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784929820; cv=none; b=XnIt1zd89st6PTai08O8eooXx3EGEWhkO8BYMXGEVy/OnkxeoTv+iVTTH0DQkTRY7c9k74p+9zHe8IxMEv5oPbGVnzPRuoKlYbcGPJS6Snka561KMP3kC+eJbkMrdnH1NOAoga1Bvo9IhSUA5n6QMPppZRgJB2Y52Uf/NUOOFoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784929820; c=relaxed/simple;
	bh=V5p5t6p533rR7PFtS36zJUJAR2eu3ApCAg9w1qM18Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ObY5CWLvh5AJmsNM3zhpbkYUhl0HUzCVmLarlWTF5SDr/KFBsOn1RoyN99VqFHP+cAD59GjUx/nxm54az7H2FNYj7sWBCRaS2ZJqwPJU4ZssGpqSVxgF/J22OSid2hn7qtxsurluDbf6yq4QMAkYXkKz9qzEmzTaeBX1RKtkdQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jk3kknxm; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jk3kknxm"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f707e5d75so632924f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 14:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784929816; x=1785534616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X4sw7aR4x0a5vJsGtr8mrTyq++0FBtM5mNvWBcxr0UQ=;
        b=Jk3kknxm600gsC9wMaYN9996ekiEcXfMeZS2h2Chmw4JjLNlz48mr2dzbjm9WlOh/h
         8/a6YyOTbmsWia9/f/0tqDOn4hfWwJWjwhtoIURK6WCrEfm2aT1/aBdFXokkxNOdpCa0
         VlAUQbKwD7GayqTLFjZWabw1BuW4QcEibb8r3HZjQhH2ReJRUoU9DysCCR2cI8LDOvx6
         T+AqycBA2UiBR1MRgyJX+o4BkVl3ppIWI34wvN18Bi0FgCcH2jR1YRlPaGcryZVdM9nA
         W7oP92il5orygYrF/I+eNfnNav/bxj6cGYojPXP451duXxggw9ncBQpNK5XmjEVC8f0F
         L3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784929816; x=1785534616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X4sw7aR4x0a5vJsGtr8mrTyq++0FBtM5mNvWBcxr0UQ=;
        b=hFuep/d0vdU8q5/Ups9Nl+NJSDib8da+X7GynhSAbVOdLQbwlTinzs3iHbKc8lt2Xs
         wCWbVshAWFJgj01oi0xYvkTEp69cglQgBdsxv4D0tDgeBpHFTlPfYpXp7iB9LHsX4+Ya
         +VdyPpCczcMtgflMEAI565AdaIH7OUceKGeZpK0skn3tvRXEdFBm7/zvUq8193I7sz+W
         sl/ecbTqPLz7taxHw5WCkYu25MqLqQrnPXgriTW09VCP9t62KkBYaBY+LS3QYUhu8vGU
         E6/S4rAKG/VFejEjrgwRUoxqh70jeINziwwoLzAxviC6D6TCmwzhEBg7IVBCYA85hv6U
         4feg==
X-Forwarded-Encrypted: i=1; AHgh+RqEhW3QlHq/R/IHhShMFuSMkQfCh8wjy+3IMmvDJAa/dLoA9xYNd7KtpyTmFmnenuxl600XfkI43iofKce2Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr9TDJh+1UpvV4yqIykX7G7mJc32iVT3CnyXb6i0IoRd5M0ejw
	/CB99BmPBishrGsJ1g/6+ErKU1AgOTDJ6dPCvUKqvp8lbiPjDa8vMZtR
X-Gm-Gg: AR+sD10T8oge/cH7RkE1CPZKfPVwx/5QGg7O3SzlULAJX19+HjFpuXF56bgXX6Guk12
	hk6m6ZAOAltJcBzwbPKTjw2Pjs9uGJxdmopwurh9lg9AMzEpLo1tiF2Z2Bj9JHUBKLZmVqrGCOv
	sVB+lniulsycUw2agW1MTo0Oi+uhh0magX+jm1uLBwioU3/ZxX41xhOevB67BR2W68RUOFNaTDy
	NQzFONkt81GCzgWOnfPesIkUf6AiBaRKoy9chb8DrDwFWuHFduxvU7BmGw9CC/8jQxqET3LNY9N
	a2cs2KNsPE9dRa0vm4Xb1Edj2bmwu1tYIRs40h2lypc++x8QM6iycrHRtk5z4twG2Un/UYM0Bwd
	aBX9reDX+emy+uESbQlG44go7+2mX7bZ44oAthzd26z4Wv/XHDVcDCLQuOPRfoRBeWjtpWCamkE
	WV0Cxx8kCcrpjmZ0SvJYi8u+9wCTQM8dBOnhzB7ANR+EZCw+o00Bf09Ssa
X-Received: by 2002:a05:600c:6986:b0:495:4dea:f7f5 with SMTP id 5b1f17b1804b1-496b5726cccmr846045e9.29.1784929816376;
        Fri, 24 Jul 2026 14:50:16 -0700 (PDT)
Received: from Cian.taile2c8f4.ts.net ([2a02:8084:d03:fa00:819d:8e1d:c966:142d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4d8d6efsm17588265e9.0.2026.07.24.14.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 14:50:15 -0700 (PDT)
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
Subject: [PATCH 1/4] rust: aref: document safety of ARef doctest example
Date: Fri, 24 Jul 2026 22:49:37 +0100
Message-ID: <20260724214940.1070221-1-cianmcguire167@gmail.com>
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

Both are sound for the same reason: `Empty`'s `inc_ref`/`dec_ref` are
no-ops. `AlwaysRefCounted`'s safety contract only constrains `dec_ref`,
requiring that it not free the object while a live increment remains;
since this `dec_ref` never frees anything, that requirement holds
vacuously.

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
 rust/kernel/sync/aref.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index b721b2e00b98..a27b9b8f2eda 100644
--- a/rust/kernel/sync/aref.rs
+++ b/rust/kernel/sync/aref.rs
@@ -124,7 +124,8 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// struct Empty {}
     ///
-    /// # // SAFETY: TODO.
+    /// # // SAFETY: `inc_ref` and `dec_ref` are no-ops, so the requirement that `dec_ref`
+    /// # // must not free the object while a live increment remains is trivially satisfied.
     /// unsafe impl AlwaysRefCounted for Empty {
     ///     fn inc_ref(&self) {}
     ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
@@ -132,7 +133,8 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// let mut data = Empty {};
     /// let ptr = NonNull::<Empty>::new(&mut data).unwrap();
-    /// # // SAFETY: TODO.
+    /// # // SAFETY: `Empty`'s `inc_ref`/`dec_ref` do not track a real count, so `dec_ref` can
+    /// # // never free `data`; the safety contract of `from_raw` is vacuously satisfied here.
     /// let data_ref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
     /// let raw_ptr: NonNull<Empty> = ARef::into_raw(data_ref);
     ///
-- 
2.55.0

