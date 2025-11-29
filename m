Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9302919047A
	for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 12:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764420442; cv=none; b=oIJjAe6Jde286kILYdDB8LPLs5lbz2ZjbidgqkPlyPCA4Z+IBKonEye5yLYhZ/sOUr/oWI7BbWUiSnW5bhFlTgurk/UHbcK1VKFSXYMbL/N0IZWe4XUd4KY3PkN2c7MQDkvhUlhnJbd4ROupK/vbtNgDdPnHynpoGgOwWKZaahw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764420442; c=relaxed/simple;
	bh=6mDlJioaEFXyZiJpLXQiUkBglMchbv5u/KjkBzI7WJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oLNyE8WcyawzsnvVItpupyhNWTo2R5PfYP4jncbLnGY1Jm+Y2cFygYshKRGQcRvhcpSAz08ru1PQLa1AGvv5iufBxTzYuNPkJZ34Tz8bITbkRDG6wFLNi0aU8RswsgR4Ubj/6lRbfcPvViS4AZXFaHfQ7RHlbdRVrrI5pz3J/Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4mqvSrw; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4mqvSrw"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b75e366866so1267398b3a.2
        for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 04:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764420440; x=1765025240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=myYka0lw80HBdacWOVIn1Wt7z3itiEDwRyqD7GDqBz0=;
        b=V4mqvSrwj3riWSRQ0eI5bq2SIvrIL4tyQCamRGIEF+H4hrwIc1Tm7sf9BgztgO/Rmw
         p1s7uJ7a+wWskuhM6tQ5Jd5j8Jr1saaJCFm4xz1AnskEhAjXhsDyX147tSTNuUWSjYAN
         FuBquUDQhuhcbvBfBCdACikHdo1oJqzmeVzlV/yDS+tuaoMAdV9LAX/q165d55Rj6xim
         IO+a+LT7oN86XE3djHI7bTVEK6cz/ggM9Kzjeg5WtMsjbt/rFsxRcu/en8Ybfkk6twgZ
         kSOuJU2i0PXzk9U2V8zWg4xgdUqkLNYFPNeCxk0W3O2X5gCWw0UXbOYLrFcjMMezSYPk
         ZsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764420440; x=1765025240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=myYka0lw80HBdacWOVIn1Wt7z3itiEDwRyqD7GDqBz0=;
        b=bmacgLqdfm033seq+0/B9SXqnehSvr32wqBsGbGdlm5DZpruf4qJj825t3b+BvdEoz
         +fU0+5Reov/sMN4vMJcl5d8MceYyK6oiY4/zMbcsZLPRKiurzzvIhlHEsRLvlO6ZeTv4
         tKTaAZSykp2FMjAC7Dd6y+LxAQTwZQit+RdOKdkIRLzh1T8SYLQb6I+Hss2yzBgIzeGL
         EBVXmVemyPlQbi7pRPdpHzby7+Xi5bHUtFxdKfyVW12Smz05RAhmJPt/QWrziwkH09cM
         xcM/77JblssJwG9HP6pogrYYhj6MjhGYPMmTpqJRNe09T8hj6dapsJaCWIoU5vVpKApC
         v/UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBC/O+6pxSW5Fa1xCtzyZBRAghGBekzMA1vPhFjiKMKcLkLWFd/cdLaMarQIxd9KXwitN4HSw/D68FcuMoJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiFvSqTNq+tQGcQoNmarQlLRJGux8ZBGakLZOR7U+MY6wiqnlK
	wF3ijYC0LXzJ+cz6HXk8AJWeqWo3omerkC1Nw7g8peJK6XCYZDbODuj9
X-Gm-Gg: ASbGncsO/GBlQ7qOIv+xVtSLOTKyivQA3ByuecH10QcmWod8ZlZ0Kr2CzeW1LEI/zWL
	rjx/D8IGhHfFFsle8UNmswF23fc2ES0NcMkSyFOfLX5g9EZ+YgQ+ntTBqyPnTzdGyP1c1+dzvyF
	Rin0YByV8+npAVpcMfaXsoaPPyWk4dTWeVTO+CZhQbCDNnfkniBID/G6tbYWa9HrhvxXzwtpO6q
	Yfu1n39lnphQDCv4S8so2aLOaDdV1PmXLxNqoIbGx8pCsi3T7I7vsm9SKECCjv8mI7RAk96GRCy
	sovFU85XO8rLq3+8sNjXxEODVxC8p3KQ8x+Z6K1AYpv3dakH4FFjotAt++dZf4sKj9QhXzKAEyV
	4BCDWlUilKxIW9dfLFxPjGtQ0uexLTcdZnP8Z+mwfQ7v8x3nWiaZ2a/Rwqky4NPBPGUgEKP5mxl
	6SFSySM9eN5LAVw9KHuQ9lCONeHOlgg+N+4Yzw96+zhFph2rubwaGcgT8hk198sSH+9Uki+PrjU
	Gw=
X-Google-Smtp-Source: AGHT+IGqXBJe2gBhUE8Vi9KEkJFrIwyAmI+6yzB+Ly7GrVzNLCzenjE4jkEQRfqSGM5EqVkE27FTbw==
X-Received: by 2002:a05:6a00:2191:b0:7a3:455e:3fa5 with SMTP id d2e1a72fcca58-7ca8627223fmr19406751b3a.0.1764420439845;
        Sat, 29 Nov 2025 04:47:19 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx.. ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e9c3b8bsm7946145b3a.44.2025.11.29.04.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 04:47:19 -0800 (PST)
From: Atharv Dubey <atharvd440@gmail.com>
To: gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: david.m.ertman@intel.com,
	ira.weiny@intel.com,
	leon@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atharv Dubey <atharvd440@gmail.com>
Subject: [PATCH] rust: auxiliary: use `pin_init::zeroed()` for  device ID
Date: Sat, 29 Nov 2025 18:17:06 +0530
Message-ID: <20251129124706.26263-1-atharvd440@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the previous `unsafe { core::mem::zeroed() }` initialization
for `bindings::auxillary_device_id` with `pin_init::zeroed()`. This removes
the explicit unsafe block and uses the safer pinned zero-initialization
helper.

Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 rust/kernel/auxiliary.rs | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 7a3b0b9c418e..67c5d356d754 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -108,11 +108,7 @@ pub const fn new(modname: &'static CStr, name: &'static CStr) -> Self {
         let name = name.to_bytes_with_nul();
         let modname = modname.to_bytes_with_nul();
 
-        // TODO: Replace with `bindings::auxiliary_device_id::default()` once stabilized for
-        // `const`.
-        //
-        // SAFETY: FFI type is valid to be zero-initialized.
-        let mut id: bindings::auxiliary_device_id = unsafe { core::mem::zeroed() };
+        let mut id: bindings::auxiliary_device_id = pin_init::zeroed();
 
         let mut i = 0;
         while i < modname.len() {
-- 
2.43.0

