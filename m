Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F2417D2
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Nov 2025 05:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763183008; cv=none; b=I4pwPdS4jN3ifYF9oaI1Mnx89olkDUVaf0CkRlU4aZt4M0Sbbvj6nxmmGPsQfDDxrXsx+QAC4jLNjTiNmV/QV9sU5TnSLiX/mgGBr8pjzy7r4adErIaEp/hSg9v5TFgw1zEbImr/VsI2a2OsCkAq4FZzR1okVqbYaorvgfLW8pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763183008; c=relaxed/simple;
	bh=xXtJcg1+8xAFgoUk0fJBgpWjhDLCQamyMBMstN22910=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bYl4VaIgscE5ixvpOFOT9tvvnULnVY624diZPFpbwwf7He5lu2x1kNI8oY2DbiK7FUYmI2fmouN+MVU8eyq0q98ucV8k8o/MXLbQYFHzGGmLTw5ki4UfctBVd1D68qw15AGS2rn0YdBwhULQrK3xFkrW8aXB/VjcesrmE+3ct3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7KokRyi; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7KokRyi"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-298145fe27eso32497905ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 21:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763183006; x=1763787806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i837asSELdbboU+X5oPeJgbHU6OTIhjaA1+cRKi+nu8=;
        b=S7KokRyibVHxIo/vY+DCnwwqDi/UCMvJIoVYZMRRe8og6aBbv/EKa5FpmHae9KObVK
         RumLOI5dc+ntb6Zx1AuDDGeEa46ufxdG56fJ2pmpbZnsXXKIPJdMD79rdN8MojjvZshf
         /IobkmDV/7Mvxejqln3Ev57OBjo+/JofiOC3xkIeIBUpxPPWzgthBZUAbEomrrqEAOIT
         15+kXKDWsVAAFN3wquqVESIFhHz2564flV+U7VxHBxITN+mYB43m5AYB/I1t3SY4FuwM
         5xRiQBkZVD0NILDKPHrt7IsjcaAPpcHD7R8NgIRmwI5AL1awqzHCc6nrq+DfGtkX1Nnb
         7pUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763183006; x=1763787806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i837asSELdbboU+X5oPeJgbHU6OTIhjaA1+cRKi+nu8=;
        b=qCbOGcJP1UOlJYAdM2J1DcXhBT4xi95Hcn+eVMMuew0uLK2E+3vYsSwxciylqxlLz5
         4O2DO3CuhX6FSS6jVHqBZ2L/p2k1c3G4TlS+KWPe/wGiRtNACj3SRYVmpphxceIrOUuD
         ZjuyT7ysfT46gDPD8s9XQJntD1PwOIydxoH1L62a4FkjS1tSuhCSQlmCwnnqvIy+Bx9j
         SmYo0yEUaHXy4+oe2e23rQVvXRFXb0GzZzeWaWQvXSeo6hwEEMZw8USRuXdvapHT2B9S
         e3YBEBXqTWEdZ2f0T2WfnJ1Jh8djbEBltfY0Ic6b+KEpLCVk9elBHRsTY0POCJ+X1Om5
         5IEw==
X-Forwarded-Encrypted: i=1; AJvYcCW+jXTcWlfJlcNdpdL8nwORnIfDwF/lftHQ1QYGOJXHlVpBIgNh/enRR2KFNNrVn36yTvWidaxff89hO6Zepw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTbnE6AxL4Whc4vb5G0FVhrG9uhvRU+Lssvv5y1bSj8W7V6O95
	TyF58W7kFsm2Yr+knZL+YOTv7iKxlOTwqUHgi0C4eWkqudA5S/H4BFHq
X-Gm-Gg: ASbGnculm9lm/GHCFZgY4apLSVBvuPqA7j5Z9fiZTZrdhnfSWNuhtrKeXPex+uMl6yL
	i3g17kZrwzmpufQCT40/VimXkld5LzKCgwyKKsMH5nr0vFBhzhLKz6kR0B/ACCuV6okZ2ENqWBo
	oZLWNAp324pj7Iv0uQsE3Ov+MZwJE30KqDx6WCaWpcmkELw0Mg8u5WmD1RikP/a+w4Vowz3WOWV
	ikJylVp744vLsJDrHOTEpT9zhNl9ahQZMjpiNVTIBibc8ZvmFmtEyGuDgmqwlQ+0DuAH58JzZfI
	cRk6Szg+lFk4jM1bQUXRI2/5CQEpMEs1Qd+ZGgWhEYDvyJ6/jiPkKjgN+J59EAMs488eU/E5VFl
	pD5aBhNpbC6OOqb3oMV9PHpaIA0OEyF/X6FXLpxNCfNRa1wCY7ectNTm+SKG4SrjzmzO/CuRYx+
	cetYfDiL6rdDLJASCWqxCrE/7rzIS7+D3iQJTJSguzLycQBLkWJbmcWcQ8V7jcTFqWffDQ7A==
X-Google-Smtp-Source: AGHT+IGoIuBJ2zkW6X6qBKKJdTdqHGBsToE1rtmw/xWasj/jESJrOf7yc10DKt0/QmNwXGr6V2nXLw==
X-Received: by 2002:a17:903:8c7:b0:298:450d:6926 with SMTP id d9443c01a7336-2986a73b0aamr66209665ad.34.1763183006199;
        Fri, 14 Nov 2025 21:03:26 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245c4asm72261935ad.33.2025.11.14.21.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 21:03:25 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	peterz@infradead.org,
	will@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v1 0/3] rust: Add i8 and i16 atomic support
Date: Sat, 15 Nov 2025 14:03:02 +0900
Message-ID: <20251115050305.3872412-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds Atomic<i8> and Atomic<i16> support; including
load/store(Relaxed) and load(Acquire)/store(Release) operations.

Relaxed operations can be implemented purely in Rust using
read_volatile() and write_volatile(), equivalent to C's
READ_ONCE/WRITE_ONCE macros.

load(Acquire)/store(Release) use smp_load_acquire and
smp_store_release helpers. These helpers internally use the
appropriate architecture-specific instructions.

FUJITA Tomonori (3):
  rust: sync: Add smp_store_release/smp_load_acquire helpers
  rust: sync: atomic: Add i8 and i16 support (load and store)
  rust: sync: atomic: Add store_release/load_acquire tests

 rust/helpers/barrier.c               | 24 ++++++++
 rust/kernel/sync/atomic/internal.rs  | 85 ++++++++++++++++++++++++++++
 rust/kernel/sync/atomic/predefine.rs | 24 +++++++-
 3 files changed, 132 insertions(+), 1 deletion(-)


base-commit: 7a0892d2836e12cc61b6823f888629a3eb64e268
-- 
2.43.0

