Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D513BF684
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 10:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790505947; cv=none; b=tN7jPCLiur/wmh/1BA0vSQMz4Sn0745uBAuYV6Oan3g2BKl4c9MFPPpfakC3Ds7iuiN0f+QzULxu4bPjhLDS/ZIONY95/e/pxZVI0u1rCZEnuTMbHd5pHtuK8P5Ti0pPfUqR4hKG+RH58MyP1t5toJd4EFFBbuKNDCiHNhZ2Btc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790505947; c=relaxed/simple;
	bh=bG4MyftsdfdbaBykmDiiNfkzsWo9nnA1ngVnb4LMZM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jynXZgOvyHr1JJZpq6FoTGT74DLk2BzeqnjZvleHSJ9n4QwlXR27Ox2oEPsHjmRTx2jAmYq8mQbdnhSVoTRTJarBqKp0gQZ6NJTgjfPvQRO/2vQXAVbRfRDTPe2NnSyYuodwXhDS2zwInrUhBu55Tv2vRJsJLQx5405kVgvFmDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqskYMRb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqskYMRb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so15935515e9.1
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 03:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790505938; x=1791110738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPw5CBxQDFpFXhy4vfMV2uncUCg9SZRmO0QrAN2QOdE=;
        b=OqskYMRbZd61iQb9qDsr+rsuQD+5SZWdBQ+TQZbfvMOpNhcR9mDjA4ODiE10gIehEi
         Af/ocXLrPkzxENkzhYM41nxZ3Iy0Q3FSuBRE3Gw1WX7BSedLjdJ3P6a7pOBM130CBZkr
         Gk58OMXL5Q3Tru8M3/WJWKONUZbDSHKl6l3zvx6SWnJezL4VOUCQs8Et1bVc6VNLLTqB
         BTEj3puiTw+d+t4mOYGJ2pV+vCZBaILbXj5MExVYBEZkBFAazfOQ/Q6GAH+ZKT765BeE
         unGk/I37xeT8mVqzRCqKZ/WFQrd6qnILADAO1gjMI2l3pPIzRsPiVLloUsvOA0q6FZkh
         bHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790505938; x=1791110738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iPw5CBxQDFpFXhy4vfMV2uncUCg9SZRmO0QrAN2QOdE=;
        b=iS/067vj3UAHexs/Hd01GYM6HtEkIaDYFNWeuMEWddAtiEx6jEocZxtmNhV/ieSlhl
         AfN+FNXvwP+voYdDfF/By0NUKMLethWtU8EVzpNz2beYOfDmyDNWTmN1C4EvfNrad9+9
         jPMf5bHH21R9VA1oUInyDomVGhZBL9MDIeRm0TJrtSHBWogylD5mdbs/+cir/KcoY3vO
         OAk12KHK5+XW0WPEzHQGS379BSke9qbRRalEFl/Wc97PiDRwOxTB9bUwOnRCTJBNK9ha
         2T4WZxWXTE6iur2HA3ORH4n3FCu80M2TI6Q4oD4iwdnTLx6fykAne8CpzAmWAmydqrY/
         Dj0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwe8Rt8eoptqO+GMAMAooHkca992bwwTKBNnesIzRdxQRHGKcZqwMuwMSvicp2CVsICtmlPXaDJ6DjuqNtExA==@vger.kernel.org
X-Gm-Message-State: AFuF++nCzQePSEv9t2kZWX9wSfwfTCjyFgrO/if6ENr6KZqLo1aU+rrS
	EPFnPmRZ/LltrxeEKYwmK63dFsjZUo81t4YAOP5pUT4xSjCDmsb+bM3A
X-Gm-Gg: AYBFou0+T6bq+n4EStLq+Lo/srRL6wcfHj5URDGxTkwmmvZKn/HrwpRnFbO8tISxJtR
	OhLGJK3A+uuBljgufXZUSMhIVA5ysbh1ZnD+ue0yFzzrF7P8dkjcBhGZGjfH0mgxprPqT1Bw1CT
	W2/6jOoNwbBZLGKcVTST5E69GhR4mfoF9dMCUFtMd5ZVNyV8mb+yvS/FJ4tWFW5Q15Lw8WArL1+
	nkwzZZRRzp4RpbXLqXWt4xqZiygj8vMQYZvSsFDGR2ql38eu5rzjJA9AwubyHDpWCm+HK0GDL0y
	K/VxxgyFXrzKssssPrIg04UOa6FkM2k1k73Ge5/QmzfrtTkAYTBXo2PrGKd1jbEyoNFUWbifoJ0
	7rTjwq0RUmHUB38MoQG/ffwX3hoxqyRPTFL95ARTxS2xGvliCEKtdfLFo4SW7oqHXP4VIj3h6YL
	N/KCyYfjJXSvPXy3UitUKOdPOTQkcxSWx73MILUAN7imWkEgX+cuJWRRpsjxxlUjy0c/a9Ad2R6
	fhDQktHhsl6SDiqUbw8yECTG5bW/pUJkJSJ949Y2TespzyhPI1ihGw2h3lmhszUy44JhdMJkONO
	vw==
X-Received: by 2002:a05:600d:6502:10b0:49e:7cfc:a9b7 with SMTP id 5b1f17b1804b1-49fe67bc27amr127421625e9.18.1790505937936;
        Sun, 27 Sep 2026 03:45:37 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001915fc2sm46005195e9.14.2026.09.27.03.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:45:37 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	longman@redhat.com,
	lyude@redhat.com,
	linux-block@vger.kernel.org,
	linux-serial@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] rust: sync: lock: use DropGuard
Date: Sun, 27 Sep 2026 13:45:28 +0300
Message-ID: <20260927104528.103881-5-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927104528.103881-1-mohamed.osama189110@gmail.com>
References: <20260927104528.103881-1-mohamed.osama189110@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the ScopeGuard usage in the Rust locking implementation with
DropGuard.

The guard preserves the existing scope-exit cleanup behavior while using
the DropGuard API from the Rust kernel memory module.

Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>
---
 rust/kernel/sync/lock.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024..15f9cbe76c8d 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -7,8 +7,9 @@
 
 use super::LockClassKey;
 use crate::{
+    mem::DropGuard,
     str::{CStr, CStrExt as _},
-    types::{NotThreadSafe, Opaque, ScopeGuard},
+    types::{NotThreadSafe, Opaque},
 };
 use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
 use pin_init::{pin_data, pin_init, PinInit, Wrapper};
@@ -242,7 +243,7 @@ pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
         // SAFETY: The caller owns the lock, so it is safe to unlock it.
         unsafe { B::unlock(self.lock.state.get(), &self.state) };
 
-        let _relock = ScopeGuard::new(||
+        let _relock = DropGuard::new((), |_|
                 // SAFETY: The lock was just unlocked above and is being relocked now.
                 unsafe { B::relock(self.lock.state.get(), &mut self.state) });
 
-- 
2.43.0

