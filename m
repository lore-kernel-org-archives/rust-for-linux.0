Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD440337B80
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762953399; cv=none; b=J+UwIwdJ+gf8hJXrVdE2TARZSi+FcaHP4Up7UYqqcAmBCxL15FkkUi0T8UnDntYoUg+pLSGVPdFbPeWPZajhaA/dn3NqzdPbf5d/tXAQwyVr8DmPa0owQWXezbcQqvfpPOYY8YVyazXTCgTVyhVMzYvTU6ITjcV84o1/9/PMuNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762953399; c=relaxed/simple;
	bh=AdkWczVvVv8ju7J2b1sy0l2IToURdDQN1MtYU3m0vYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VLdHgj7d0eIZNIpx1wPpQQx4v559E7GFeypl/dZk6zWl5ggALcbyPDxkXuSyI/3Y43XE2z0vn4osjsVNdfopgBZAGzHxPH2J259dl3LH29+vpWKa9EiGupFbfCuuOZdHh/q+7C8xLGEtCpcP+qErT5yzjSp7QIroTl5acAMigks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3F2Z6/K; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3F2Z6/K"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-bc09b3d3b17so414542a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 05:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762953397; x=1763558197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgHeXCs1yExV6oK6GfCPcyjDL4yLWKFr1PuaEI6I+/A=;
        b=Z3F2Z6/KeK22354c7cxpqDB4lUaUVigL0xUypSc5XEGzZ7PwdHmVhmrMG5E/R0u6eK
         lJ151nlOJoa5CuS2lo9kDt/lbcMVUeeAM8icrpcwNc4D8+52qOGTd5z+j/+bR0N0vGfd
         vrz5w3ImJrZ4wn/KF8tq82G2YRhIUCRp7/FVVDC+HFmXbrirJT1b+9hVedFEv4sHbcv7
         tKzGERy/WlHpMfgfQoMTg+HqpizPaNIMGZQlZQI4aMukMdMmThaBTPCUjWDhzsklRKXr
         oFQUCin0h31wGIuo+j3pCD0nF00UL0OaBRnKsbFachfsc5LcNHLYHc7YPPT7t6Jviljy
         ca3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762953397; x=1763558197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgHeXCs1yExV6oK6GfCPcyjDL4yLWKFr1PuaEI6I+/A=;
        b=ThTAR5D0W6vRF3xEwlpMaShD2Kk9ZRjR7VR6TDkL2V+QLOolVNkjx7FoD1IqGlazXU
         T+eU2OsBWrYgQK1VTPZCtuQwWW3F3Qc3L2/CSR6eTxByk40003U+JOepp+BzR1YfHE4b
         pNGOppgOribsRgLQ0oO/UxoXokcaWzzaq3m0piOWUl2v2LDJWQZVep5FvbWx4YcO36+r
         I5QzEaTtlw2jyR593k7DTqt7fTc/Q9SXhYOEi2Qp6SHqMM0J491JXJPSZst5FTQMv3AX
         FODw1WjAE6plKW3I9ZDl2zhZtkRf6ADljAY3tNGZCt8yAQC2lgSODbRrWOog7mCBHOUy
         R3FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL8GRHHtUIC27+xpXNA0m4HCFSk5uAhADlmhzDIlpXlaikXBTEkD2tIHn9H88+v263SP27K0PiqVS9xUgtEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0fkyBysTVg4DS5yZ4ek3Z1k22AbhATlTVNa/K1ijluFHdVEAx
	+EQWp9LmPdps5E91Z0YM6wsNvmmaoflRjD8iMfxV3CZMZGFGE09llYi1
X-Gm-Gg: ASbGncv0ilRXpGigPq0cPn4FgRMD1uh3yNhGrpnFGL6IEB/Y9mwRA+5/9wNJR27db3H
	cD28/oFbglvfnOEIj6xdKFvxggZ25V4u9HN4zj8EOhYcnVT8qdlcezBPUUJixwGNfAZ3Rt8yVO/
	0HdILE8k456cL+zXnFopr1hOE2lyn0qp5K0hB2jhgh586GS4KfLMat2acdbCKsrOd7S3g9PyAjD
	rBEUxnr5/+WlGJ5RsxjOn0fyxiskolYbfABUw8WGYsSurWFBHBj3cVJdiUjwuRPXrKWpLhjLHLQ
	pZ2BhlMcJv9q736yVX+j1DxKvAifjrFmHRNAEYMXDFM5tJ/fHdcEuX4B//VlwpvjmK+olSwO45v
	/ZjcBPgyU9sM8nUMzxiaBG9DnND+wKgPjIwOjQSgZ3EMymyPLouyO03FbrgWfBS9zUwHLpflwpa
	u0mpDFNbMRIWH2rPGkMHY1aJ8bUg10LfAg2zGBzTBG4mbKpN92
X-Google-Smtp-Source: AGHT+IEJe73vHLkvoa/K5V6D1Xt390k2N3eiaJwSFccUHwThA2gzOPOLnClx1PZst77Xnw2qUSzslA==
X-Received: by 2002:a17:903:2b03:b0:297:f7fb:7b66 with SMTP id d9443c01a7336-2984edf3d08mr40735945ad.57.1762953396972;
        Wed, 12 Nov 2025 05:16:36 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dbd93c0sm31732485ad.6.2025.11.12.05.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:16:36 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: alex.gaynor@gmail.com,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v2 0/2] Add support for print exactly once
Date: Wed, 12 Nov 2025 22:16:17 +0900
Message-ID: <20251112131619.3585510-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the Rust equivalent of the kernel's DO_ONCE_LITE and
pr_*_once macros.

A proposal for this feature was made in the past [1], but it didn't
reach consensus on the implementation and wasn't merged. After reading
the previous discussions, I implemented it using a different approach.

In the previous proposal, a structure equivalent to std::sync::Once
was implemented to realize the DO_ONCE_LITE macro. The approach tried
to provide Once-like semantics by using two atomic values. As pointed
out in the previous review comments, I think this approach tries to
provide more functionality than needed, making it unnecessarily
complex. Also, because data structures in the .data..once section can
be cleared at any time (via debugfs clear_warn_once), an
implementation using two atomics wouldn't work correctly.

Therefore, I decided to drop the idea of emulating Once and took a
minimal approach to implement DO_ONCE_LITE with only one atomic
variable. While it would be possible to implement the feature entirely
as a Rust macro, the functionality that can be implemented as regular
functions has been extracted and implemented as the OnceLite struct
for better code readability.

[1] https://lore.kernel.org/rust-for-linux/20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io/

v2:
- improve do_once_lite micro syntax
- move once_lite.rs to kernel/sync/
- add comments (including ORDERING)
- fix rustdoc errors
- use vertical layout for imports
v1: https://lore.kernel.org/rust-for-linux/20251105054731.3194118-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (2):
  rust: Add support for calling a function exactly once
  rust: Add pr_*_once macros

 rust/kernel/print.rs          | 70 +++++++++++++++++++++++++++++
 rust/kernel/sync.rs           |  1 +
 rust/kernel/sync/once_lite.rs | 83 +++++++++++++++++++++++++++++++++++
 3 files changed, 154 insertions(+)
 create mode 100644 rust/kernel/sync/once_lite.rs


base-commit: 3b83f5d5e78ac5cddd811a5e431af73959864390
-- 
2.43.0

