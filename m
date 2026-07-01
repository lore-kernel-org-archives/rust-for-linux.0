Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3A4245008
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Jul 2026 17:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782927687; cv=none; b=o/F2Mmyk4JxzPcNdnmlF1P7uk+6m5tNhxNpf0pmqN/B99GWdARcKKzpYh8mzyzERmWOotl3IdRnAcn4rus1mzizRZvNNjc35I8zJwumY530ZZBrPlAMNFTQXREXZGQ0r1U4FECtFnMFjBJAaqu3j8PfEAnbbW+qAq2RDKqc5Mn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782927687; c=relaxed/simple;
	bh=g7R8tEi4i6Q6H+mFQbeH+wY/GGgNqL+C96OYgFFuf/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HI2PtFs7UiEgJi8monVkgemcw5GnlDcn+hOGbpPNXXvzo8l/EvGXTXPjtHx08ReDnkVVHQEnfwBnstWeu820Uu8gc5SQdRL+vt1lJA7Ii3/k/be72TSO0Ck6yz9LLN2HQsVC1Q6g83NRsnYyWXO/+MAoQtYTm5CXomzEVOR7Sr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=Jy7K2SPI; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="Jy7K2SPI"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-847921eed4aso775544b3a.3
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Jul 2026 10:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782927685; x=1783532485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGgdNIxUjLSQ4UNZW/FdSoJV4OLj/5NQZw2raQ+vfnI=;
        b=Jy7K2SPI5N1lfDKzh2rABCQc+57uw+EKBPlwUTlt8UTfmxgdGqxCcvkPi+/urlO4/c
         qLRNxDsmgfPuMmPixcyy0pwTmpPQa9iSv5YzzDv/YOXeTscGwlEhVmBlM78mRCN91tkX
         p1jP47Rb49/tGQiEX+2KErvu5FOVy3tq1gWGlAS5iH5+dIcjLrC0T0a2+8nsXv6GqmGh
         otWIKlwAPkz5vuG8btSQ0NZzeyyPNxiq9yVrL7o8UfMy2dgKJuvGiKRigVWcvUqOcJuB
         E1lH2zYhYQTDo/7Pv24HMFMCJE2UkONkEn3iNtVwLr0Kp2bQqWClddlT5O+UKY0+i68i
         xJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782927685; x=1783532485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UGgdNIxUjLSQ4UNZW/FdSoJV4OLj/5NQZw2raQ+vfnI=;
        b=IaESH7rR4D6R4BZqZ/jJFlG7wQiKVc2PKVbnMvdwn3nDgq++6oaLkAebTlhCHePsSu
         DNYKSR61un4Oxo3dAsQjCNlkEW9a09fiETRcmCwrAnfdmppto4+XA80yub3/0LI4+CTJ
         fmPXn8mhORb4ffD3BVRvSoypYkcYEQGCyt7wuI90YkllqdHIYtBkPj+jyoDVZ6AkoMxO
         qaEhIgWCbgqOzuhbrocRmtLlLdSUlgznAy7PIxMaqEjUFurHI05YoPd4a0nlUAx43mns
         nsuxNRUgN2ugfYr6PAth2LAjzzXDPJ5zu06KF6zhdmlOXsWDjrfgZi+o1lKjXOrlgFvs
         oYHQ==
X-Forwarded-Encrypted: i=1; AHgh+RriC+NGHrmDsj3wHzBAbOICujSAHQNjwpACVg8Uqu+xIFkeDtWq9ahRJrsR63aQtBZohGejQ3qbWPGxnU5erQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7w4bYvH2ahU6afvvE2SKv9U0GnatjauloclgktG6YeXoA4POF
	4I76f+saJfxo7zxygjHQ6PGqeb6HtGZ06SMUZ6NkDUQJMKu2/tlaA3+dpwq2Io2a2AM=
X-Gm-Gg: AfdE7ckdjRZ8/nZmZjxpf4QU4K3Cx40TDP5H1FiXSl/XJXDstu9ge0ZbkM3pXqz5uuI
	74CSPYDm4LANjRjT+nbLtHKjJ8TLIjRNRPaVHMyMUTfhy42rReTKmiWeR5lQf8ttlG/+VmUc9k7
	JJ4XJrODdK/FNh3xMSwRd2J+TeMAdpXu0rskUwy2ExB4zAZiO0Y5i5U2gNcdFmKeZ65IY6NBNhK
	vwhe5WQna1Vz+RqtY/ht28KikNXZeVHSKo/Ge8bFaox+Ak1YT3qyHdAanfG8n/NpAbrYcFy3Oon
	p/RxTKO3jehkNQP59zeHQmKvH1lyDPhLgO1zsiconcmFG66pa5QIcs8gX0VkwYdB3zxr/G3L56d
	0zCPEV7/2HvQwD34qHXKHuAQ+yPAC8hWXnYGkOR+lz+tludvnvYVecxCLYuoyteVlc7tSy1yJ+4
	7HKmvsTrQJ4naL7/CpKNwtFl+fHQ==
X-Received: by 2002:a05:6a00:806:b0:847:7a61:e692 with SMTP id d2e1a72fcca58-847c5141198mr1623689b3a.41.1782927684998;
        Wed, 01 Jul 2026 10:41:24 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dc4d0sm150943b3a.3.2026.07.01.10.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:41:24 -0700 (PDT)
From: Pedro Yudi Honda <niyudi.honda@usp.br>
X-Google-Original-From: Pedro Yudi Honda
To: dakr@kernel.org,
	acourbot@nvidia.com,
	apopple@nvidia.com
Cc: nico.antinori.7@gmail.com,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [PATCH v2 4/5] drm/nova: use `zerocopy` in bootloader.rs
Date: Wed,  1 Jul 2026 14:40:55 -0300
Message-Id: <20260701174056.12604-5-niyudi.honda@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701174056.12604-1-niyudi.honda@gmail.com>
References: <20260701174056.12604-1-niyudi.honda@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pedro Yudi Honda <niyudi.honda@usp.br>

In firmware/fwsec/bootloader.rs, replace the following `transmute`
traits with their `zerocopy` equivalents:

- `transmute::FromBytes` -> `zerocopy::FromBytes`
- `transmute::AsBytes` -> `zerocopy::IntoBytes`
- add `zerocopy::Immutable` where necessary

Update call sites accordingly.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 .../gpu/nova-core/firmware/fwsec/bootloader.rs | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 66b9f4d1b41c..03d3090bd9ef 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -18,15 +18,9 @@
         Alignable,
         Alignment, //
     },
-    sizes,
-    transmute::{
-        AsBytes,
-        FromBytes, //
-    },
+    sizes, //
 };
 
-use zerocopy::FromBytes as _;
-
 use crate::{
     driver::Bar0,
     falcon::{
@@ -57,7 +51,7 @@
 ///
 /// Most of its fields appear to be legacy and carry incorrect values, so they are left unused.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct BootloaderDesc {
     /// Starting tag of bootloader.
     start_tag: u32,
@@ -73,15 +67,13 @@ struct BootloaderDesc {
     /// Size of data section in the image. Unused as we build the data section ourselves.
     _data_size: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
-unsafe impl FromBytes for BootloaderDesc {}
 
 /// Structure used by the boot-loader to load the rest of the code.
 ///
 /// This has to be filled by the GPU driver and copied into DMEM at offset
 /// [`BootloaderDesc.dmem_load_off`].
 #[repr(C, packed)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, IntoBytes, zerocopy_derive::Immutable)]
 struct BootloaderDmemDescV2 {
     /// Reserved, should always be first element.
     reserved: [u32; 4],
@@ -120,8 +112,6 @@ struct BootloaderDmemDescV2 {
     /// Arguments to be passed to the target firmware being loaded.
     argv: u32,
 }
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for BootloaderDmemDescV2 {}
 
 /// Wrapper for [`FwsecFirmware`] that includes the bootloader performing the actual load
 /// operation.
@@ -160,7 +150,7 @@ pub(crate) fn new(
 
             fw.data()
                 .get(desc_offset..)
-                .and_then(BootloaderDesc::from_bytes_copy_prefix)
+                .and_then(|b| BootloaderDesc::read_from_prefix(b).ok())
                 .ok_or(EINVAL)?
                 .0
         };
-- 
2.34.1

