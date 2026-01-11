Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40F4125A0
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 05:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768107989; cv=none; b=Ugubz3vXhZ6oBLTWaWGhZoBk/IWIA1Uhhj+R4PLhhJpVPwSs1ZKZFhrMYFZEwOpJUo9npWtsg8lHLfPYbYlINMix+H9jncMYnGuqDEAgde58MylxTwt/y0EvV3X0s7yk4zdxENB4+gW7kb2ELgxOdOAOlIy3Zazd+4220i7s5aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768107989; c=relaxed/simple;
	bh=0JpDXafG3NNA59juLK1L6oa1axVrwXdvRwIGL5ERXPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6SIyE3O0UnEp3E9wLsjB6JLHMkOsNmmOxIDY4rbvZB9pFsfoQvMRotSBAcFgtKpOJX/GulHGNGxHp743gCxCTO8kX8gJjN2oa3+x2h3/wXSJD54VVltuCf8QJ6kyspx+Iirrcf8rPahW3nFlCRo8T5+Z2AdfbvlMUDTRL1g6OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PP6ZIVbE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PP6ZIVbE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a102494058so18724015ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 21:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768107988; x=1768712788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ya0JdCtBs6OKPJj1ghPaGL5+Y7h2c4nB58k3IMd8+nY=;
        b=PP6ZIVbEyGQ1c0zNzKQAWIHbCdHvtqKRisfkJBVNuWxHQnNAB7vNj8550PMBTX8r+O
         aTl6z0DiT/KUrVLRPLtN56BQ8EYiNMZ21Cpxk2haRbYiNjYOmZcoyCDdQg6leGEAXbFx
         2ADmY2i4o2Kd802TJlEUXwrCSWTL9C8X+SCKVtAInuhMfoJCMg0k0culDWUmsoWZaUs4
         Gb+J2rSHEepUjxWjZxuns5mn5hUcZ2xj3AyEA9vlqlME9wHpl4nTRiozOR+d2fD1gKrS
         3r3MILRQ9+NHc1MRwcZ0J7z0shcoZoWyrPkvVik7Y/9CyN5Aa20JulexH2rXvOliNk1D
         e4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768107988; x=1768712788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ya0JdCtBs6OKPJj1ghPaGL5+Y7h2c4nB58k3IMd8+nY=;
        b=pSEWFf99mUHMcyV9m+4Ba8Ve+rhNVXoqAcUWmsWA//upyYazm93b8/sJheb933OJ5Q
         F2aZf9e+Q31LHhmYRX4e0JnNBblwAaEP/hOUfCDFhJ2cqi7my1BJI2bJMrUAwpsUyCPq
         /K6UQTb2YRx0sL4d1rpZRf3rbai9eg6Jqp2CpfTr5jjChFeZ6OkruhttDFeBl369ALYk
         AuZW0f4SbU2wSyYfxWEtJKAcg26rsd2vwGzYdSBHfp3rVyprsf6evz2JqkZIrFOFFSQT
         juaSGQXOqxNtJiLBJRyKdEfb0Feo9yf10hnud1JcEkW1TGeulsFKr6k2pANufOpJ2nz6
         af/A==
X-Forwarded-Encrypted: i=1; AJvYcCXc+jBBouUG0PCF/LT0tt0IdRp8QbEuEg2o6b9ms3g20PmIQKJy2dxelzX75GDWeMSHdIdCqj7VTi/PUHEwMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+1ADPHUeJwPFSTZh0GrqqdGHjCPhK4vzSedmcEgFP6PSXX8tl
	fydlzfs8mXvMmPZQy3kw3T7zovGyQbziL+3PhrPEkvPXvZmQmxZ0JKXE
X-Gm-Gg: AY/fxX62s2EXboFz1GAgh8hxxlwr+GZAdq3ortc6o88gAsnAVkmGCPS9CUX1CFTEUss
	ALGzKydrQ5qGPRfeCzUA7qwIKRF0yFGkH9RGymjEw78AkZaNaYIM/Ck5z+/VqnY+uh2k8Pxwvbt
	iRMkyXQ+DpwIGIompWuZ5BmllTgo7GnSVq0oou5AkANPsKf5TQDCQ4gx2k7G3HsooVLgctMMapp
	5bB1VYSDOaLi1HE10uW2bqLowFWwWD1GZTdTGSroZPiSLBRPmk/Z4Cq5lkzIWiAmKxnKwHdGExt
	llvMyjcukcz8AIu7L7Teme4RxvG0HSk9xU1A2eiSDfC6sPohkEAdeQFQmKwnCsIWk3O2RK4BKTk
	iGiiZGXemFzAd2WRScseDZQx0/rBbvsqoo5oHpiTxQknWjitZplsxtMraRhvT4ai6REu5M9gYYe
	w+oHmlHEFF/X9yGqZvOHXR/cr4w+Nr3fV3XAaPFMZ0xias9ZIbx0ep5d7B7XnePVXv5iXdQhvd
X-Google-Smtp-Source: AGHT+IHxMmWBFeXFeF0YTDX+9TwtJ9U8sBlfR5M3uwADKAQkpK7c3mkL2mMgByyPkT6Xt0EfIqVZww==
X-Received: by 2002:a17:902:ec85:b0:2a0:a05d:d4a2 with SMTP id d9443c01a7336-2a3e39e5c4amr172035905ad.23.1768107987828;
        Sat, 10 Jan 2026 21:06:27 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbfd27953sm13965818a12.11.2026.01.10.21.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 21:06:27 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 2/2] rust: sync: atomic: Add AtomicFlag bool wrapper for easier use
Date: Sun, 11 Jan 2026 14:05:58 +0900
Message-ID: <20260111050558.3147975-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260111050558.3147975-1-fujita.tomonori@gmail.com>
References: <20260111050558.3147975-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Provide AtomicFlag as a thin wrapper around Atomic<Flag> so users can
work with a simple bool API for load/store/xchg while keeping ordering
controls.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic.rs | 46 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 473d3c07e234..c3039289b989 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -622,3 +622,49 @@ fn from(b: bool) -> Self {
         }
     }
 }
+
+/// A convenience wrapper around [`Atomic<Flag>`] that exposes a [`bool`] API.
+pub struct AtomicFlag(Atomic<Flag>);
+
+impl AtomicFlag {
+    /// Creates a new atomic flag.
+    pub const fn new(b: bool) -> Self {
+        if b {
+            AtomicFlag(Atomic::new(Flag::Set))
+        } else {
+            AtomicFlag(Atomic::new(Flag::Clear))
+        }
+    }
+
+    /// Loads the value from the atomic flag.
+    #[inline(always)]
+    pub fn load<Ordering: ordering::AcquireOrRelaxed>(&self, o: Ordering) -> bool {
+        self.0.load(o).into()
+    }
+
+    /// Stores a value to the atomic flag.
+    #[inline(always)]
+    pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, b: bool, o: Ordering) {
+        self.0.store(b.into(), o)
+    }
+
+    /// Stores a value to the atomic flag and returns the previous value.
+    #[inline(always)]
+    pub fn xchg<Ordering: ordering::Ordering>(&self, b: bool, o: Ordering) -> bool {
+        self.0.xchg(b.into(), o).into()
+    }
+
+    /// Store a value to the atomic flag if the current value is equal to `old`.
+    #[inline(always)]
+    pub fn cmpxchg<Ordering: ordering::Ordering>(
+        &self,
+        old: bool,
+        new: bool,
+        o: Ordering,
+    ) -> Result<bool, bool> {
+        match self.0.cmpxchg(old.into(), new.into(), o) {
+            Ok(v) => Ok(v.into()),
+            Err(v) => Err(v.into()),
+        }
+    }
+}
-- 
2.43.0

