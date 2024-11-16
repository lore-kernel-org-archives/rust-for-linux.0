Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B7F191F91
	for <rust-for-linux@vger.kernel.org>; Sat, 16 Nov 2024 19:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731786762; cv=none; b=Z9OVVR1vwAsZwxKTQQzyf+uj1ZdaXLQxzBf7Xm2XLP40Lhe2iId03XIAYec+Z3anlKrcEfMu/bHTjmzf92Z5xuYvjPgsKT4EoITorRIZIqK4vSBhGSD0sxMzpYj+vrEqdAqPUhcBm8pCuHVQqzj6ixw61c+vv+DBnfAEHpoucsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731786762; c=relaxed/simple;
	bh=IbyNCVlr+pUYPq/QluXQhltzdkvVNx9OgXhrqpA+hlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g14sfNfy52JhZRqR9ympH3rsJmizGr2lPwrtTeEsbaFYNea1MCw5Hqivfv/cGR3z1MVFHQyPiGuwmzcuTGYsxWYU29O5iCYr4HS3zfxNMEMl3aQFAD6khMVesU6587WTrSvN4EU1uNSH+NTHeJ/SYUJ+3CTyPwQ718ndPnr0CWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=LoICD/rw; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="LoICD/rw"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so15647145e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 16 Nov 2024 11:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1731786757; x=1732391557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfMu5DtG1mWSN15sff/1/SqGqqAyWbyF59+g7Oztrts=;
        b=LoICD/rwmmmdqhbJvvujci6PfMgwjQr9rgo33Q7NOND4EBqOd2SVZfa8rws1uh7mI9
         8lBuAdt9HvAUSwDV3FJJrYv7RvbYMJXfZ4HrVLKGmZDojRroTxrt7FZP2mUNXJQ4VWhD
         487TAbdmSQpTBBUbnOeihiy5HQK57j0IgGzUgHPBOk4eGZ5Ek1hiAbubbh158ywoX9Km
         qgMxBilDyk4XuF3GLD7dLa0wzhkqNp1uSQuxawIrrdh74ZTYXFnIoFjPMKeEETBCzbp6
         UB1LFwH8mLO+xQZO8AYz3YL6DO+J41EQ/mn+wZPs/5R1uatDkhwBceg9/ddQiTnPs0Y2
         gmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731786757; x=1732391557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfMu5DtG1mWSN15sff/1/SqGqqAyWbyF59+g7Oztrts=;
        b=wFcPQ6SLDVUIRjfJqPOR1kxOV1jRRh+NvQJuvqvPnpS7s43Ky08YpwCeyFZlMzRXzK
         jU1eRNFSotnXDlQmsE7ysrm/B8aFnEzgtVWN19DS8yYhR+qaJD86ZpMpSmBql9kOzSP7
         ZpQ5gSrD6x9VAZTE1r0bc27L5U6hZHLsipEcEixXxHd+TSAuEvCJB0l2W7Aj3E9oqUSV
         3JdjuwEjAalU/t8MZLRASo0W5mSM4FcW9iflHEHzQqdTPJ1hh/ArgC3YV8pTu7ywAzUa
         jo8c1Ri93TKfRhh/8DFZcx+cngASQNVjS32vs4TzWQgBvI5ZSmjbxCS5EzDGn5PJOZIP
         oR6A==
X-Forwarded-Encrypted: i=1; AJvYcCWtQUbWX6lzDLxNN1N2piTI8sc2+i2PmzROMHfV1OXMTP5/DCjIp8A2g+Rugp4ay4N5ba1ap+qWN7lgOSel8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEll4KGsQC4YQJtinK1bxATGw6HcmLPekAtsBKbMcyDC3i+2oN
	sLvE3Y1DZecAxo7C7+bYO35+y7wUSlUKAgOsyLLLClJ2/7h/JpCoT3wrbR/MNaY=
X-Google-Smtp-Source: AGHT+IGw+lDen8mxyVGE3pmgcoYoDONPdtwM9MY4yzpYhTD6Ne4Sq/JoP/RAD2kLDAptvjImji+38g==
X-Received: by 2002:a05:600c:3b2a:b0:431:6153:a246 with SMTP id 5b1f17b1804b1-432df726227mr61614255e9.13.1731786757477;
        Sat, 16 Nov 2024 11:52:37 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da27fcb4sm102846905e9.23.2024.11.16.11.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 11:52:37 -0800 (PST)
From: Daniel Sedlak <daniel@sedlak.dev>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Daniel Sedlak <daniel@sedlak.dev>
Subject: [PATCH 1/2] rust: kernel: init: replace unwraps with the question mark operators
Date: Sat, 16 Nov 2024 20:46:17 +0100
Message-ID: <20241116195221.373332-2-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241116195221.373332-1-daniel@sedlak.dev>
References: <20241116195221.373332-1-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Link: https://lore.kernel.org/rust-for-linux/CANiq72nsK1D4NuQ1U7NqMWoYjXkqQSj4QuUEL98OmFbq022Z9A@mail.gmail.com/
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
---
 rust/kernel/init.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 347049df556b..81d69d22090c 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -1076,8 +1076,9 @@ pub fn uninit<T, E>() -> impl Init<MaybeUninit<T>, E> {
 /// ```rust
 /// use kernel::{alloc::KBox, error::Error, init::init_array_from_fn};
 /// let array: KBox<[usize; 1_000]> =
-///     KBox::init::<Error>(init_array_from_fn(|i| i), GFP_KERNEL).unwrap();
+///     KBox::init::<Error>(init_array_from_fn(|i| i), GFP_KERNEL)?;
 /// assert_eq!(array.len(), 1_000);
+/// # Ok::<(), Error>(())
 /// ```
 pub fn init_array_from_fn<I, const N: usize, T, E>(
     mut make_init: impl FnMut(usize) -> I,
@@ -1120,8 +1121,9 @@ pub fn init_array_from_fn<I, const N: usize, T, E>(
 /// ```rust
 /// use kernel::{sync::{Arc, Mutex}, init::pin_init_array_from_fn, new_mutex};
 /// let array: Arc<[Mutex<usize>; 1_000]> =
-///     Arc::pin_init(pin_init_array_from_fn(|i| new_mutex!(i)), GFP_KERNEL).unwrap();
+///     Arc::pin_init(pin_init_array_from_fn(|i| new_mutex!(i)), GFP_KERNEL)?;
 /// assert_eq!(array.len(), 1_000);
+/// # Ok::<(), Error>(())
 /// ```
 pub fn pin_init_array_from_fn<I, const N: usize, T, E>(
     mut make_init: impl FnMut(usize) -> I,
-- 
2.47.0

