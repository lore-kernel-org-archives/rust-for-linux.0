Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E76228C9D
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 19:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762285086; cv=none; b=NqfTQMmiwAyHj54DW84/hOQKz/awQ0EvHmYG2F2UqVj6kiz81DHeMXv7tNl01BhL17q07iugBrIAYE8oG9Zkrz0Db/8o+2AgVheFNpcwmWmoByW3LyT81U0aKWTbkcwBuNLPfXGUM0EqIF/yBJ5iBbTWRx7oNX9H1py2/cdXK8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762285086; c=relaxed/simple;
	bh=KKopLnaqdxOYzm8ka0T3yfGwqG+GHslnNlKG5VAXTEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nv79VpkXkuSGBZqUhmwOyLl+5OPRE+NgvvvDclzIe/YTwrSTxl/dgpHWJLxdIzUOBa242A0gku5VMial54kHIavdcxpqwv3ni6ayGMWcY9JkIVEttisGfzpIs8/7eXyjo995LeQjZS5Lz1mt3zGTEyWiE3amwRuXRkcnHXycXvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hr1exZBK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hr1exZBK"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-475db4ad7e4so23342985e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 11:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762285083; x=1762889883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Xypec85439AsoYQYRLT5jRDZoV8gj7wZ5fnhiAzlQA=;
        b=Hr1exZBKTHwPAmlhZou48F10JpavVJriQNsNIhyTxzHDHl995u9AGcGCJNTOtwHzt+
         OQAvhTLT8uSRnK+wq9WAmynx44XFyw6oJrAjwmrVK2Nle/CZLcWgnFlgOFb1V4MW0sG6
         hvk30CCnXv8kXANSAjN+tqY8DK+TEm4mDnoXTnLGgJinZg7lxJZN0bfvQY6nnbndHYpP
         1YaxfV5yEOH8mfhcb+uz/QZacd+BtqgPZzoX6K++4etayUFgspZBU8wVtSwO39Oj+JbA
         O2UWSBmmhli7cIvUtQibAaDV4OT4nauuWPQiRf2FRHgPOIotlIbS+9zHqQ94Fay4Ohwl
         Sf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762285083; x=1762889883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Xypec85439AsoYQYRLT5jRDZoV8gj7wZ5fnhiAzlQA=;
        b=ZiZD5Oa08gGcPKPEl3mvnF4vFTPGEXP7wj4SE/kijkVH9WE1dGYOxSEBLfaYG41VUZ
         qC/pkT6TzD0bYx5Rt0frwDKaxhMseYRmtK01KJu8ELZ3Bje8wcJOd0UIC9aT6K2vN7GD
         +G81Xf+EzB0r8Fgx7Nd0ZJwJf8q+zTWKSXeAQ2YWMLUOlcu5jak3q1NMYQor0Y+11IwY
         ojZDTIBOW0Ams/dN5egGQWXJeUvuJfOGeWhk3i1kJYtKgPBemtsP5uwFV+F9nYmImkRH
         hLpgHeM6lNZDwuohJr6HeJcMBkQolazkra0ugSfiFtgyVPjXfn4FYdncDmtAXlPBvY8l
         ZXWw==
X-Forwarded-Encrypted: i=1; AJvYcCUoNI5ordwl/n59+IDEnD+9+ViIPYg7c1BOLdmouMQ2L16ebpCZQJqnacCM7QEIaWmRKlzleDD3P/0OglCHRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ1BWXcl4K+iLo2u/Yom8k63v1Is5txMSyyt/F1IVIAx8npNPr
	jUjDzQtevJD5V3ggGzvK5RaYzYtGRz50gTSA58NDzBnubxsxP/4rKPCd
X-Gm-Gg: ASbGncspOuDwnCEMqqUXflDFaojjLAKhHZ1w2ZrlHuxG0Kt3G6I+QSxgqRb0HCRNK9G
	70du7c3O115bLIWqEvwFxNjXx8OYor1RXwXs6qmXuvqzMaTrqNluE/DvmcJ2MvUljqETUuM8Inl
	CSkRH2YQKHlcERQ4WR//xMtHs7h1Y08mk7tHzlv2CXJTZiCQ05C0YiFtqAtBOVBNFYT+FrSUo7l
	a7qgq5dBmSjmfyxIV2I9/RRQt2awz1ybDl6Pch3qiF6teGdFKS7atG4rffyA0Hm4zhzuzd3kyzz
	AtE2mN3yn5Tqpct3oE+TGxh/n0y456DX4LiZs9LHQ/g0thuhSQJCukBE0r7S3phpOyu8uzQzD9n
	Y5sSzjFCPFxKQWMuK/mEUapII4lHi5YKWeuxkSHh/KVFZEYmXvBCJoiOxboIIPPpLVSHH3l/875
	g3e8snA9Fa3N544+HGog==
X-Google-Smtp-Source: AGHT+IEg6aUY+0P7kqhINTv2xiPrN6T4RUVpHv5FGmHlhfMEaLbEGCK4acGBL7ICAZFqqzMOEyKd6w==
X-Received: by 2002:a05:600c:8216:b0:471:1716:11c4 with SMTP id 5b1f17b1804b1-4775ce20dcemr6765225e9.34.1762285082750;
        Tue, 04 Nov 2025 11:38:02 -0800 (PST)
Received: from archito ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce3ef38sm5549195e9.17.2025.11.04.11.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 11:38:02 -0800 (PST)
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
Subject: [PATCH v3 2/4] nova-core: Fix capitalization of some comments
Date: Tue,  4 Nov 2025 20:37:49 +0100
Message-ID: <20251104193756.57726-2-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104193756.57726-1-delcastillodelarosadaniel@gmail.com>
References: <20251104193756.57726-1-delcastillodelarosadaniel@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some comments that already existed didn't start with a capital
letter, this patch fixes that.

Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
---
 drivers/gpu/nova-core/firmware/fwsec.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 4f268fe09573..7d5203268313 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -35,7 +35,7 @@ struct FalconAppifHdrV1 {
     entry_size: u8,
     entry_count: u8,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FalconAppifHdrV1 {}
 
 #[repr(C, packed)]
@@ -44,7 +44,7 @@ struct FalconAppifV1 {
     id: u32,
     dmem_base: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FalconAppifV1 {}
 
 #[derive(Debug)]
@@ -68,7 +68,7 @@ struct FalconAppifDmemmapperV3 {
     ucode_cmd_mask1: u32,
     multi_tgt_tbl: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
 // SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
 unsafe impl AsBytes for FalconAppifDmemmapperV3 {}
@@ -82,7 +82,7 @@ struct ReadVbios {
     size: u32,
     flags: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for ReadVbios {}
 // SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
 unsafe impl AsBytes for ReadVbios {}
@@ -96,7 +96,7 @@ struct FrtsRegion {
     size: u32,
     ftype: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FrtsRegion {}
 // SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
 unsafe impl AsBytes for FrtsRegion {}
@@ -108,7 +108,7 @@ struct FrtsCmd {
     read_vbios: ReadVbios,
     frts_region: FrtsRegion,
 }
-// SAFETY: any byte sequence is valid for this struct.
+// SAFETY: Any byte sequence is valid for this struct.
 unsafe impl FromBytes for FrtsCmd {}
 // SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
 unsafe impl AsBytes for FrtsCmd {}
-- 
2.51.2

