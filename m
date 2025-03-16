Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3677E198A32
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 06:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742106049; cv=none; b=q2KYzA6OX3lZs5gw3xTkg4umqzmCRLpKA0j4R/qq/bjrbueLjJuatX02NHOI/o+QZ9Z/OEUdSXeD1/gNNAkd2zLYwP6FpdeQc9xbxJwDLvPrNFXatMzY98JTyr4yFkRfW1yFIMb0SCdQfPw8kvCTFjjJIsHjtykBC4UGPnIe7YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742106049; c=relaxed/simple;
	bh=DCCZ3zSHAje0FWAK8UKvdqHAHS2xwd6Ei/WwMlNchpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IsIWWfHkIm83Ap8n8F2uxsk8lPdtD6Jinwno1Dik3IUOM0QInAvFUpmkYRCbIlpKtsRE+TSbadPq2yY1DjvKznNIN7AvvAPFhjAeVnCVuRVw+12m8O98zeSHjkkgcwNbvnBON0Mlphzvg76QAQUfAHhICoKp46qYRqz943mJ+HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=v9QkjAhr; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="v9QkjAhr"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e5ad75ca787so2890263276.0
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 23:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742106046; x=1742710846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgXYCZoIbp3+FQSUFxgLFXAA6h9RyUssleXI5NM4+uk=;
        b=v9QkjAhrRPErcO5472Th54wIuu2Wru7bUTQJGZasm7OrPwRxpmuvOtJitzSxPMst7s
         EmNWry2wG+wJ0aVXIhZwWqYkCm6qrRpIUZ8vdYXMmQCYEUDEfz+GB0YVSW+gf0m3wzOI
         wwhoVDZROE7LgTJE4GsJsl2YZozKYKz0THCt5H2Rhnn9SPC9F1m9GGTEsBQe7ohVJtMf
         +M5BfbRf02rhE2kMNm/f27K3dVs+odRElOKXJv2/pjnHWLobExqFRAseltodeXTx0R8D
         q6XzaOO3Npk6S9ApCGQrOftSN1CoGLFNK2ybpCmrGCACvYK9Cy4KKW7UOEjD55d7qH7z
         p6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742106046; x=1742710846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgXYCZoIbp3+FQSUFxgLFXAA6h9RyUssleXI5NM4+uk=;
        b=QHLk/LrVuwQNDu06YGe34Btz5sUW2AbiIMZvj00MDpGbHi+3i0tFj1gGBsCALxY8NT
         S9h4S44/CjkqkGFGjZHaOO4qWdCQ95/BtE2CJhdDkwiHW3iot41mwa8iD1ThhhK4UCaW
         ekfZzw+y9DscCU7hfIQbelpAVuQsXgKL6C8j5d2bY4nsXChGjH4L5Kp2rhHQSqK5wuds
         pacPijRfHOYqZuBlgfOzCp2xc8gohDSv+ee7iBS3/+UINVey6Tdd3ZKtvTEqC0fuTFc/
         iTfxy8QPwi63oWEXphf3algDPhyFR4rQYtB51b1TsS+Zy5S8z1kCJ/x0E6vknXZk+TNy
         adxw==
X-Forwarded-Encrypted: i=1; AJvYcCXRRmGkXMS740w8vGqOWoKik/h6RFTugXSOxuFGnK6koagDVULB8iu/o4dlhXavRu5Ox4cU2u5n/31oje7QSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVjNfE8BJVxW/rciLIX/AsV9fJKXqWiAez74wcOE5s7xzLhTwB
	mJIu4ced8sgKeN5NZZmLpVIYyWByrl8Sh72TiwGY7TEBBlhrVrzxh067wm8c23U=
X-Gm-Gg: ASbGncuJ3IXgm8TmCpUSHTftNWm5fYsjVqYTcaK9TVGZczIHMyF7r6XJbEWowBvibYn
	dHcSKpokSEsy9E/jk2KeyaQkDgAuw8mq5Yt1SFgesIcApmHuDw2T+lbJdrzFqftHsK+OAJyEZL4
	EDK0Zc742bOYG5KcAYNhwSW1hEkMUMikh54PB44pLcD0Xee+G1zoLPzCfSmEGIAxmd4WL3SUlxf
	an7bkcHM9/38OGglaZWv3SIZ/eW3t6IHdxDLSt75L9swzHfSFT2lHMsJgwyYKTfxGBYqRPWq+YG
	2VIN2P1fNMrF8ZsCW5z/n1pibmZI4V9jtt9wsb3s9ZhXGlIRJLGKdA8KtUwoxGjovI1WzZPeM0h
	XZhOhHTpYufFOe+/q5R3AWVVlJKmmGyAaIrJXtdCj
X-Google-Smtp-Source: AGHT+IEx3oMNZnBzMXazeUa5U7og3XXby62pIZ4BVRtR8qqnmhOeVv1VgBmfkomrXokKtJVLbNQXTg==
X-Received: by 2002:a05:6902:2788:b0:e63:c936:c07f with SMTP id 3f1490d57ef6-e63f870c83dmr9695475276.2.1742106046218;
        Sat, 15 Mar 2025 23:20:46 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e63e53fd277sm1618673276.11.2025.03.15.23.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 23:20:45 -0700 (PDT)
From: Antonio Hickey <contact@byte-forge.io>
X-Google-Original-From: Antonio Hickey <contact@antoniohickey.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Trevor Gross <tmgross@umich.edu>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/16] rust: net: phy: refactor to use `&raw [const|mut]`
Date: Sun, 16 Mar 2025 02:14:20 -0400
Message-ID: <20250316061429.817126-12-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316061429.817126-1-contact@antoniohickey.com>
References: <20250316061429.817126-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of!(place)` and `addr_of_mut!(place)`
with `&raw const place` and `&raw mut place` respectively.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const`, `&raw mut` are similar
to `&`, `&mut` making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/net/phy.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index a59469c785e3..757db052cc09 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -7,7 +7,7 @@
 //! C headers: [`include/linux/phy.h`](srctree/include/linux/phy.h).
 
 use crate::{error::*, prelude::*, types::Opaque};
-use core::{marker::PhantomData, ptr::addr_of_mut};
+use core::marker::PhantomData;
 
 pub mod reg;
 
@@ -285,7 +285,7 @@ impl AsRef<kernel::device::Device> for Device {
     fn as_ref(&self) -> &kernel::device::Device {
         let phydev = self.0.get();
         // SAFETY: The struct invariant ensures that `mdio.dev` is valid.
-        unsafe { kernel::device::Device::as_ref(addr_of_mut!((*phydev).mdio.dev)) }
+        unsafe { kernel::device::Device::as_ref(&raw mut (*phydev).mdio.dev) }
     }
 }
 
-- 
2.48.1

