Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C3E2C234A
	for <rust-for-linux@vger.kernel.org>; Sat,  2 May 2026 16:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777737761; cv=none; b=cxKGsy/Emk5nqUYpSbnugldq9fyalHcQpsQWXL1PoT67cO4yRKrNHoLYjpP+7o2b2+JmLG9ekz9WTLVugpejrCcLFhozEMiJam10bOLz+2MrM61PxsJdPgwJV3w9h8Oec30quPxM5a/HAw9SHUGPpW/KxZc1F8dGl2boSX1NaaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777737761; c=relaxed/simple;
	bh=8qSa77aY/XNbvCM/r6s3OceXcSqx7nvsqEC7QGsc8e4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iLaY64rgUJtcjyJyQa6x7FIpnPewOjJhdKFAJaVUEzQAXTeuUUsy/sw2h5FTfbqquohDN01+COS2vCrcd9UCuYGHvbS/fev4+TKh6xEztwOzclDPnXWCphBJYVTcdPwuhPlrb9GSevbSBJVChZgJCzUwFmXzUq/609GF8+3Iuro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nyi3n4/1; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nyi3n4/1"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7b4ee3a88e1so41456787b3.1
        for <rust-for-linux@vger.kernel.org>; Sat, 02 May 2026 09:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777737757; x=1778342557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XzYd4fPBil4bUHb9HMZz+lobxsDJUbIC7i9IHhMgZwY=;
        b=Nyi3n4/1vxjouPWtxQybGY7HCrbgXfVj8yQG6wv8iAFqsuQcBarVjrTkGrTUNU+tMA
         zETNz56RZG0h7Tz/jWNZbI1OsEEzr8yFTj+Pbr57vfmdvCEC0Bnf5hXt8wNlDtDhrv9p
         YV/+BLwPEtowGJDZjAsV9lYTFnpHGl5nGPPMYd2ayiWHkVSGql/NuvFTtuwkGahCl75d
         vAlUQeNGM0xnzrJ4YmjAjjVWqAbcbCUhEaxRRMC8W2kmJ/pHBKFRb4rCGQQ8Uuccx68s
         FQqWNdgkwaiqXvgvGTg/oNvAFFKwcgHsCBqrQfDJrtI/cHqphy2vOBYKsTNBd8TC8WS8
         Z+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777737757; x=1778342557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzYd4fPBil4bUHb9HMZz+lobxsDJUbIC7i9IHhMgZwY=;
        b=otOeQoA5uiiZ/0SaJp161Ki5wDJ28v8S9CydIPdcMQGoQdu27Q7w6+2SxpPe3ZiIZU
         flHrV3RAmYxR0Q2cN5+Pa5AIs7rGJ5zh+lUxIXFIALs7Lih5att3uRNPB58+ZXrvKWzJ
         uTyXfLTWhsoPdi42FIN1fjfVtWnx5fJKyL1sq5sdMONEXns/Btvh+SiuUm8S8qg3rWou
         lKwgX8lUoGVVabzbpoYT/Z1scYQPIPgL4EjhLaRq1QwBe36j/PW1ITQvzzzAB1rIsqnF
         I5effOR5FwDJaopxoILXZrQ7knjrsAdNkhCBsYJ/RKPtdX28hLkQ9uACcjmlfOwIhXY8
         haqA==
X-Forwarded-Encrypted: i=1; AFNElJ/jFXL4h2kreE6k5M/qgUIbbUO202aLx8+eTlOIKHMXvUqbX3wbvFCjPx0oNrv3sQYbgbUEt897itp/4xvtkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+VKSlZSNfKTj5rUh0gcx9buw6K/vZVI3NvnGAyTellzUM2+uf
	FQPFgnXV+QQloGzcYVuczKpojjJtWCOZWXFAvuh5mfv/uyn29t94J5M+
X-Gm-Gg: AeBDieuNdhXrXD0TmibLsaIBJhNxRyi7Wqmz2ZjrVSGQqV3NP9lOA5kwUb0U23tzIjC
	pBQDl6ElNGJuTniFhpKeCC5c5mWB7zP2OegcjwE90ke1cLXOt44Gg5BvOYCyg5WLEUO8aMlswbo
	WcsrUM8gD4Snr7tIM0jHiAQMjfpON3exMewyD5aUTfEql3ugw/Noo6EZ+PS32oXDtvs1jrEvW2U
	uemCsyoCIOkGEARBhdEWJYmltQZMay1+/XS4U8jrlhipfJlih3noXGW4P78Zw5eywpeK/2pA7ZE
	olLCKlYb/aMTWDdBsydlTfcFlLoJQ8c/TpKkDyhvJbL/a347KuAbwAEgVsqw5jrrcB+eQkhHtBG
	xI6oU9tgp4J3DLEOXK33YEhWfmj2x5IAxAsIt+kVlegbDv+H/yMAlf09TgJddsAcdNCEBcHxUx2
	KKX2HGyY4oAxDNXwWSr58NCogPz8neY8MRBrZoepBIAbWuTTvpxXBwu4BCrWrFoFaz2wPX+mvtD
	HJT28H6MNPVw9+wWcwE57IxGW8Ifj/fV56dO9Q=
X-Received: by 2002:a05:690c:39b:b0:7b9:edee:d8f0 with SMTP id 00721157ae682-7bd772855aemr35322947b3.49.1777737757062;
        Sat, 02 May 2026 09:02:37 -0700 (PDT)
Received: from TDC4045031631.e0cglfehwr0e5gttmepj3hi3hf.ux.internal.cloudapp.net ([20.63.37.123])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b5af36sm45267051cf.20.2026.05.02.09.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:02:34 -0700 (PDT)
From: Ashutosh Desai <ashutoshdesai993@gmail.com>
To: ojeda@kernel.org
Cc: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	boqun@kernel.org,
	wl@lyx.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Ashutosh Desai <ashutoshdesai993@gmail.com>
Subject: [PATCH v2] rust: sync: add #[must_use] to GlobalGuard and GlobalLock::try_lock
Date: Sat,  2 May 2026 16:00:57 +0000
Message-Id: <20260502160057.3402896-1-ashutoshdesai993@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Guard is marked #[must_use] since dropping it releases the lock. GlobalGuard
wraps Guard with identical semantics but was missing the annotation, so
discarding it would silently compile without warning.

Similarly, GlobalLock::try_lock was missing #[must_use]. Option<T> does not
propagate #[must_use] from T, so the attribute needs to be on the function
directly - same reason Lock::try_lock has it.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
---
Changes in v2:
- Remove explanatory comment above #[must_use] on try_lock (Alice Ryhl)

Link to v1: https://lore.kernel.org/rust-for-linux/20260419001141.211935-1-ashutoshdesai993@gmail.com/

 rust/kernel/sync/lock/global.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index aecbdc34738f..ec2dd84316fc 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -85,6 +85,7 @@ pub fn lock(&'static self) -> GlobalGuard<B> {
     }
 
     /// Try to lock this global lock.
+    #[must_use = "if unused, the lock will be immediately unlocked"]
     #[inline]
     pub fn try_lock(&'static self) -> Option<GlobalGuard<B>> {
         Some(GlobalGuard {
@@ -96,6 +97,7 @@ pub fn try_lock(&'static self) -> Option<GlobalGuard<B>> {
 /// A guard for a [`GlobalLock`].
 ///
 /// See [`global_lock!`] for examples.
+#[must_use = "the lock unlocks immediately when the guard is unused"]
 pub struct GlobalGuard<B: GlobalLockBackend> {
     inner: Guard<'static, B::Item, B::Backend>,
 }
-- 
2.34.1

