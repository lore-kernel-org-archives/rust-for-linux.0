Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE9437F727
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 20:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782505904; cv=none; b=UYXCTsNoz3LHvjD3F/E+Y5+8U2DMOk81uSiivNX++biTpN2lIXU+0blWen0ZUGUD9mOwW6PYxk4970zQ0no0Xslw25dqp2cqm5amgbydgTYybI/R7d1DIxrn3uN2lnLx2l9/z8mYxgmsp52TRqREyehtHTrslXS8h7HSICXIY6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782505904; c=relaxed/simple;
	bh=8COOnbZMJUxF4xVAYNoIlb7bDxzTG9J03+R0KaoyutE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sBGO3ex/eD2zZyFsnNsvIGUE3gf3mABKV9zwyo3r5Glzj5kC7xTP0cRWe7jI03caogF1KNfB24JBFawz4R4hwPr0ghSUNw0CPfWIxcZYMI08nGVRIyX6OySdYZvjVJQfphaUKUM9cs1OEsNwQwlt13D08wi03dnTxYU4vcwi+Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIYHK+8W; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIYHK+8W"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30c9c8c2697so1508548eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 13:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782505902; x=1783110702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=saLU0AoA9Cmy1VJ6xB3QXKeFOZEGeKiaAK6r/QB287s=;
        b=RIYHK+8W1lur2g/OqyILUgWtB99o8VsTMh4Y4lUo8Qa3qSVD0gNiUxd0+VDL7VuMOc
         czE/reXvEu3akGeg+ySOerOcnDj6Q6II6POolDgaNJIB65tbck587m5BRrqWaqXG7hc7
         1CzCa6MgLwx+LxfErg/HAH/yuP92YOv6GwCicCDIzYoT7EiNT4V+muUpsBu+dgUy7sLj
         ph7FbZ+WUTnkWh9nMZrqg25JB3sYPqOTSvK5X6teT45HmlpXaP3Grkntes/ebk51A40c
         ko/R2+zb2D14emMP0DcpD6kphKJqBn9mhOdA4mJtTLrYYsyP97Q+ITroi3KllT9jpINk
         A9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782505902; x=1783110702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saLU0AoA9Cmy1VJ6xB3QXKeFOZEGeKiaAK6r/QB287s=;
        b=iLa+0Hjx+7xAm4XZILueKSY7tDSjzNU5ljKZfppAbY5tzGsRyEGidUrlj2x9UbvnEV
         IR8pZvgNjktCpsIRreprfkR0YebToeRy+6xGybA+AByVigPerAcVFbdURxmqPXIjXruY
         oZOXUDfyMV70t1lDAo9Utw2fWPYHHsFiKBdGIcTCCi6zF8XgCHXsKyz/kipZ6Q2Jy5i8
         oad8ZjvrGE5p2BaAsyXR8H9fi/MSXp7iNjRykyBlZIbar0j2AcPYfT505on/GZCSp2kQ
         akNVcQMw/8+DDX7rj9XnCFDDNp/Bq3bEJCHS2mGVkzic9YzfbdK2yFCSypXIjZVKDV4A
         s7hg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6AE9Kch5OEC9ldrxqTc+2ZnimhcJK/iwxbeuXMwoWw977SPsAv+B6EeeL9uyMN0BBUU3mY/rWIaCEtv6IIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgvcyGS8+GMIcFBzSPTbQcfI2ORNP3kUWZIv8qMA2tOuSBfyqQ
	i0qr66Jm2DG5BdYKQ1ssxLkLqJ+HBymf1LNtDAFi47nShLbEHw1DaDU=
X-Gm-Gg: AfdE7clGOVDuKxBGOlMnw3bCNQN1qMJpP47aA36pNVQnCjZJfh64m6yoKt+Bvct5g3y
	XAfjcZUM5ynVsfGtCy7TPo2gR3iWaiddQem5SsV+i7tM6bL8khJg0KwXSGNikMx2a1p9f2dFch2
	5hPehRogroOhgJgo5LcHmySYPmqOuWTulmlq9b085WsoG0pP4doNi8lAZzDO34sUojK6LVK+s4W
	oo2r827gO4qcVUQhpcvSTa4+b9+pVickEX2EdreWMFWQrDoOVQ5VTXhZN6Bkhgrg5YaG3zAzrMj
	qB82GamYf1Pwjb2Wd2+sEg1e7gzXl7ZAHgd44dntNfdL2mCa8wVtWVSZJOG+qXlWByW4HChruod
	c7mVacdLP9dHc/Yo9jqnOOLcEsScDnh8CqAggzFaLNBH8IMSptsQszLm0jAhIIO/XcxpWeeCs6y
	ZAvN4A3O9nTqX+WE9EX27tDcASV/8c+qf2uk9lqfRkLWNOglepjgHC9rrU7WsK2qM3
X-Received: by 2002:a05:7300:7246:b0:304:630d:e4ec with SMTP id 5a478bee46e88-30c84dc428cmr8616976eec.28.1782505901801;
        Fri, 26 Jun 2026 13:31:41 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c58831asm22580134eec.13.2026.06.26.13.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:31:41 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] rust: iommu: replace core::mem::zeroed with pin_init::zeroed
Date: Fri, 26 Jun 2026 17:31:19 -0300
Message-ID: <20260626203122.713317-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All types in `bindings` implement `Zeroable` if they can. This enables
using `pin_init::zeroed()` for `io_pgtable_cfg` initialization instead
of relying on `..unsafe { core::mem::zeroed() }`.

This change improves readability and removes an unnecessary unsafe
block.

Link: https://github.com/Rust-for-Linux/linux/issues/1189
Suggested-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/iommu/pgtable.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/iommu/pgtable.rs b/rust/kernel/iommu/pgtable.rs
index c88e38fd938a..8faa1d8d9fad 100644
--- a/rust/kernel/iommu/pgtable.rs
+++ b/rust/kernel/iommu/pgtable.rs
@@ -102,8 +102,7 @@ pub unsafe fn new_raw(dev: &Device<Bound>, config: Config) -> Result<IoPageTable
             coherent_walk: config.coherent_walk,
             tlb: &raw const NOOP_FLUSH_OPS,
             iommu_dev: dev.as_raw(),
-            // SAFETY: All zeroes is a valid value for `struct io_pgtable_cfg`.
-            ..unsafe { core::mem::zeroed() }
+            ..pin_init::zeroed()
         };

         // SAFETY:
--
2.47.3

