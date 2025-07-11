Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D164F1465A1
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 14:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752244387; cv=none; b=KhJHFPEgc3r+j0JbO0ook4GDhvzMY9jzudFsqClP3/TD+e77pBgO31mFEbrDX+w+RMdhhEcvCe1YOLjGfl5TnMm9Ro1BZjSuWD6xcXwZoQtUHI+5HppQix0kgal+ifXYNj9LOaS6mpiNLWvPwQQKYZueY/u8BILAHRDWmmjvFB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752244387; c=relaxed/simple;
	bh=ZB9cfxxbIVyP7KXrPJ/Yfc0y2pVJ5wU7NtYTFa0gomc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PCn94QeajXveKXIGpbshuM8Myo6UHGS9PNNwcZVEISXVEdYUZFyIKwt73Ujk5nMRzfLKQwsLr6qpkpmq1JhDIuz0nXc/FgB/TmokWCAy8NcV4F+uuNXaVVQ9jjcm8VtwLvNP2l9bZ3lF3fR4wAE1Zlor+PH2qecu9lDIke1Pofw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dfe6M2+s; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dfe6M2+s"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74b50c71b0aso1341347b3a.0
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 07:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752244385; x=1752849185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=acNe71zhPgHfE83GbVhM4d777Q2BYU21y6svlMAOGRE=;
        b=Dfe6M2+sY9Yim4UVuReNdBuSSUfD50D4t88orR+39NXqmTdUVnssVNQgPzaGlQSSt1
         QasLqQbOVe8FSOlosjHSvR1G9jMU46TH7fk+QlgQDbcIKF1UmI4XXjRMTJZYP8amZz48
         UzCuTdVmwPQDlkWQW8ON/bISKH6RQvhV4P70AcF0Bv3O+JO+IqY5ASNy61uAoCwvW4dF
         8EZ4Zi9xjNkzzGkwb3bNLuRnX+U/3ul1BFEAkzCWQYCIk7EiBVsTq90CCkxgIP2c1JY3
         A38k+Er1PdiByv9uHSPBTTSPZI21w150LLD9KoXkz/pUQdqB2hA/OUjPMO7zaz207cpQ
         6juQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752244385; x=1752849185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=acNe71zhPgHfE83GbVhM4d777Q2BYU21y6svlMAOGRE=;
        b=riur4ZfZl6tFMZV5CC1fklAsZRDkZ28Tk/+Ad4Rxk8vKxq4XcBZmHaTyJlzD80+l/g
         +F1d0Dpnp6pSHhVCuR4wUg7FMJXWPQkLwj41tfLeZbhf7c1V2o5KvCbOSVJvSSzJfxEd
         PfxQgzCBUTDLcqgJuh3CsLh6Bc41+C/9cQYAMnD4bpOyHFPAkBhLoE01hEO7bFCvlFfQ
         lk7Ox+UeWqd7b6ZSN9P3zk5gpvN2iTi7J5EbJZBcemWCHf0uhsPXVY15mQHFi1EDQE/i
         BJanXk2UEnMTnhp6JiRy/LVSk55qc6hHXro0miP6nVsphXeKswfbVLuypCM+K+cQ+UPV
         YzAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbNe03viTfv7RGv6NWx1fDOhhSaKyddDL79io/EGfVrF4ct10oyoEoqrO62mz/PIPVCnR2PeDvSAVRynVWBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNnAveRYkOh/Og1q65eszeagfY7R3CI/rXEsRvqhozRir0GVSj
	JGvHx9oxuDQLwwhvQBDF4Kt8ul+lCqcH88B8xwIuzglZYv+x6KNwDSV+
X-Gm-Gg: ASbGncusgkbInqPooNXicw9eBzGGhXekpV0yGHtXXQzSOJ6CTxjGdgJ6uWvRWbu3kNL
	TboHTHOUIXIsTUMnavOG6i7R9lwcQ0HD6nVpzqeown9MUPMigmWYzbFMEztJh3PwhzKp53RmUfE
	BXUKtyebc2dUQhrG7UpIHX5U8EHrWkK0Kik69Gm3AL77KqSeu/qfBtJ3EVo9VWaVcBvyj/MhNAQ
	tD0k/HXwcXvHY8JdnbF5egNjU8sNRBp4IzhpQ79cfHaTeHDnpqzM0ggkC8ki3CzeWGfPjC+Wq0q
	5p/IPxiuCYYRcv8poOmZcwYIBQlSojWVef8yfeDFHt4qZ5H1UDAFmc+HuQROIbfosgJElLqXRQq
	ztVr2D9+Y3kx/F8S7kc0PAxUivMUC58xgY8A=
X-Google-Smtp-Source: AGHT+IHCBl2Ct9u4cEmnI9ibeur2ruPx+KDOjyokjKQUOwqgx86j3vrpjtCl/ksguQiqygI1/TChPQ==
X-Received: by 2002:a05:6a00:a94:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-74ee07b6f50mr5447600b3a.8.1752244384977;
        Fri, 11 Jul 2025 07:33:04 -0700 (PDT)
Received: from quat-desktop ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f22c01sm5975883b3a.101.2025.07.11.07.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 07:33:04 -0700 (PDT)
From: Rhys Lloyd <krakow20@gmail.com>
To: acourbot@nvidia.com
Cc: Rhys Lloyd <krakow20@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] gpu: nova-core: fix bounds check in PmuLookupTableEntry::new
Date: Fri, 11 Jul 2025 07:29:51 -0700
Message-ID: <20250711143141.9690-1-krakow20@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

data is sliced from 2..6, but the bounds check data.len() < 5
does not satisfy those bounds.

Fixes: 47c4846e4319 ("gpu: nova-core: vbios: Add support for FWSEC ucode extraction")

Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
---
Changes in v2:
- Ensure commit description does not spill into commit message
- Fix author to match SoB
- Add "Fixes:" tag
- Add base commit

---
 drivers/gpu/nova-core/vbios.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 663fc50e8b66..5b5d9f38cbb3 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -901,7 +901,7 @@ struct PmuLookupTableEntry {
 
 impl PmuLookupTableEntry {
     fn new(data: &[u8]) -> Result<Self> {
-        if data.len() < 5 {
+        if data.len() < 6 {
             return Err(EINVAL);
         }
 

base-commit: 215a3f91713383a3c0d2da82d223a608a3c17ac1
-- 
2.50.1

