Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4F4211A09
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 15:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870239; cv=none; b=cwXIrPmRLWhzKTts2ZOvJiKaVM8WNdintWmLVHLxTnpqB6etGXsjfjFHaUjK2y+dPVyD/sVTwBdGcjRs0P5tUn1BBe3YeIVvX3jMSouglwllG3Ek23BmQ6cTXxl+erD6OtKXVSuQhqaWfNOsXxmI2pogmVdWWBn+6X06v2vETBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870239; c=relaxed/simple;
	bh=bSRx8gzU1P9HLkyXSFQmZ4ZPmUgPAb6Mx7i2pO169ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NJhgnFBL1YLC1NL46MAOXhdJurEqwWL7OTL89+4H7BHBxjJul1RakEBZ9YIc23eDdU4QsD2PPH2kJ+7y30MUD1TyIGyYcm3jSzuEFOliT1u6Ier5U4OHKF/zIsBQW2n0tR9RGGCqeUWsEigIAFHN3egNz5YagE/yzo+nZX8o+cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqMQ07/8; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqMQ07/8"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dcbade417so769128a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 08:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783870237; x=1784475037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZxTi4ddCQW6xW5dWZpbLnP7mAc018/mNCKwB9sEIer8=;
        b=JqMQ07/8t6FMa7Dyeagw+L3FmxVX4FaxUcO6iiDH9x/rgmO4Wq44l0cu6xJ+FTYozm
         djruGCWc5ay8LuEyYvGUSYtn8kJiXz6tYCIlq6I2SOETzQ9+/WUyPgYMbA0ea/4qyecZ
         sgjKefwN6p3suBzylTYJEm1bvV7jqbILL5dc1HdGEeUWXqwMqq0DWRvXDuIPSFQMjMpm
         vWSJbfg6BlLRcdV2OLPEmQH9QaOiQwBlzhAPUntlDIaBxUfh9uVycn/KClLyA6h4wOBe
         yI5cRi7UgTCXuRzGOyU0zM29OqXsKs03/gxLgiM6momYQdXdzhJRzaOA57HZ+uDinrQi
         V3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870237; x=1784475037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZxTi4ddCQW6xW5dWZpbLnP7mAc018/mNCKwB9sEIer8=;
        b=NTiGDuU/wcufLKLYkCfCTYxPo52+VNJQ9odRpGY9t0VUFApaPJ13aScVTnDO3l8bHl
         vXMvH4f0UQZPvYwUmhSe8u//mm0ul+wZsLmv1H+enB4Rwf7IjZQJhHNoeUe4jsb1IwGV
         9zrSlIw5dEmypwYFPdkTDiwFvFg2MFIZjJY5eePfhMM0EGZhBAlCFxAMp57O0gpjgLSt
         O1wnIRAUlSLCITh8a87ToDJaAdudXd96w9Iaqst+18LqU2MIncFhmCxdkoJ5LEvdwjTd
         DFzee+wu993doop17B+FMXXVrvxLH1ZrfblNM7qTIFfysj8qSHZAH8zfkw8eI74n3HxX
         0W1A==
X-Forwarded-Encrypted: i=1; AHgh+RprIC8FYek1LnCCiHpo69nmse1i+e1xsf1VbZqEY1t+LeuGW+e8JVMpUMRaQBvRYFX9cJwQ5T6rZDyco+hIWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq+w1LZQbAW/azS4zEiNXAnlKPHMhOFLaB0zhKEhS2aeMKglzj
	Kzy7t6n3L74GY/tjg3iKYTAx39bdAXYvcd9ndb3J4BIjhZi1j8LWkKAz
X-Gm-Gg: AfdE7cmSZ3dE/KMYXJQ1eC1VV0TaU2QftbWYJvyu3eWUWWbIcLIYTbNYDJv6N3yGchB
	ck6nyGUmzru/gC65QF4GSFAJRcKGDUcnihl47rLdM8XItbrSK/qWasXI3oKoEkM1/znfocwZkOb
	z4mZ6qgcmDXEIxKm6GE0oHFjP4FTqAgIFjGW7UsJTaXOXd8zFYJYoqu614YjciQCg60QI5ckP6m
	eVssHLJWUFQdUWERuXd8CxFU0ru0kVkgu+Ai90KJ4F5kW7/sWPcii59MsJGR5NtMMpfC+mf5k1Y
	VWsGghSTwssYS4ZG/+lPoJ1vviPVrjIaN5Ag+0dpm/AVcMdL74fpOnt/LfbgliGoRTlyUUiZA4d
	BYyw6Re63ELsZDgq7in/on4NNTRgM4z7G+OpZ7QotxfW0ixrM/g0jOsBFpQewi+S7zP4QXKIHJ1
	rr3/KqZreuKC+vu7OoGyHFHI64zlFifAf46/o=
X-Received: by 2002:a17:90b:3805:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-38dc77ee67cmr6442019a91.21.1783870237512;
        Sun, 12 Jul 2026 08:30:37 -0700 (PDT)
Received: from Excalibur ([117.254.186.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm41468147eec.24.2026.07.12.08.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:30:36 -0700 (PDT)
From: christopherjoshy <christopherjoshy4@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	aliceryhl@google.com,
	lyude@redhat.com,
	daniel.almeida@collabora.com,
	work@onurozkan.dev,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	tamird@nvidia.com,
	acourbot@nvidia.com,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Christopher Joshy <christopherjoshy4@gmail.com>
Subject: [PATCH v2] rust: kernel: add SAFETY comments in aref doc example
Date: Sun, 12 Jul 2026 21:00:27 +0530
Message-ID: <20260712153028.896-1-christopherjoshy4@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.2
In-Reply-To: <20260712123517.392-1-christopherjoshy4@gmail.com>
References: <20260712123517.392-1-christopherjoshy4@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christopher Joshy <christopherjoshy4@gmail.com>

Add the missing `// SAFETY` comments in the `ARef::into_raw` doc
example, replacing the `TODO` placeholders from issue #351.

For the `unsafe impl AlwaysRefCounted`, explain that `Empty` has no
data and its `inc_ref`/`dec_ref` are no-ops, so the liveness
contract is trivially satisfied.

For the `ARef::from_raw` call, explain that `ptr` is derived from a
valid reference (so it is valid) and that the required refcount
increment is trivially owned because `Empty`'s `AlwaysRefCounted`
manages no actual refcount.

Link: https://github.com/Rust-for-Linux/linux/issues/351
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Christopher Joshy <christopherjoshy4@gmail.com>
---
 rust/kernel/sync/aref.rs | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index b721b2e00..5e8b8476b 100644
--- a/rust/kernel/sync/aref.rs
+++ b/rust/kernel/sync/aref.rs
@@ -124,7 +124,11 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// struct Empty {}
     ///
-    /// # // SAFETY: TODO.
+    /// // SAFETY: `Empty` has no data and its `inc_ref`/`dec_ref` are no-ops, so the
+    /// // `AlwaysRefCounted` contract holds: `inc_ref` need not keep anything alive (the
+    /// // zero-sized object lives on the stack while `data` is in scope) and `dec_ref` frees
+    /// // nothing. The caller ensures `data` outlives any `ARef<Empty>` (here `data` is a
+    /// // local that outlives `data_ref`).
     /// unsafe impl AlwaysRefCounted for Empty {
     ///     fn inc_ref(&self) {}
     ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
@@ -132,7 +136,10 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// let mut data = Empty {};
     /// let ptr = NonNull::<Empty>::new(&mut data).unwrap();
-    /// # // SAFETY: TODO.
+    /// // SAFETY: `ptr` comes from a valid `&mut data` reference, hence it is non-null,
+    /// // aligned and points to a valid `Empty`. `ARef::from_raw` also requires owning a
+    /// // refcount increment; this is trivially met because `Empty`'s `AlwaysRefCounted` uses
+    /// // no-op `inc_ref`/`dec_ref` and so manages no actual refcount.
     /// let data_ref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
     /// let raw_ptr: NonNull<Empty> = ARef::into_raw(data_ref);
     ///
-- 
2.43.0

