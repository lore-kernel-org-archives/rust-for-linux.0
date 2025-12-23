Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE4D238C33
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 06:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766470949; cv=none; b=Af5ZG1HVcV2LMcrGrNWywFGJTrDl2az4D+L5g4W/k31I2slD2Zu6gg9Jb/wOFrDXaE52BKKJtcHn98qjB9UrxTsf/m+y/E7rL+KrsOr3+DHvQsuCMfiwG0Ee5cv+hQIREdcdEsMb+o2DvwDbvwQeO3BsCKwjDZvG0GhbfOQI0l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766470949; c=relaxed/simple;
	bh=CAzqIn1NxWbBnmsyzqSrr/LhlLLbLy8JxidNUttic+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eHh/vYuaRCLnOFgt9d8/Z9NIuYO125gbWXxSFR4lhGSlwkEreEkAwFZEPnj050XvAJ9n1TEuIhMQ1J3RqQcTtV4whXZeJh58aVo3MNXap12QDsB8gojScEyZOqOaWpyOtqyGs0iSAVMVOJ+Ayf0OxfAzn5YJUFH8LBPx/mVabQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESdJ31ml; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESdJ31ml"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso5397175b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 22:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766470947; x=1767075747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwIMmpL7HRi3JDgDXRqtgrbht8A5w6aG4m2Qtk/qxLc=;
        b=ESdJ31mlXxakeopw5PLJVswl8qxENHJJ/owvnF7qc0HMHp5IcW+nOEmaCYY13V/yJF
         0UwyI5vXFs87zinwo8LrWL0ZSTbHBIbHYkb3/e8Zv9ViIMP+loQZQmfHSKZNm0qFFGbI
         cFVhVFJVm8G/iAgb2p7/Wwo8Wxtfmb5Muk8QhehZ3NjDAciL90uyucTMFV/0HOzvohPq
         5W7pYrfaerub7/Wmw5w/vTXUdN40EJbQWoTeL8n3NnhnbAW7ZRbmXxIGBZ1JSxTAVm9x
         H/sYlh/X9agxIpYZXovKuk6zsjVt2kGlvwXSMsnZQzpHhajM3UtuvkNvUbu+q4kOmD+O
         Vfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766470947; x=1767075747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QwIMmpL7HRi3JDgDXRqtgrbht8A5w6aG4m2Qtk/qxLc=;
        b=ERpOOSEGKNZ08aMAA5Rj0a56UGn8ejucmLyxofbsOG2sJbx68uhnP7Cagmu8UAagng
         Au6tQi+XDIEYEakOtWUMOHAXyXF+HCb/zPwuuD/BuQpa0JF/5byB2Ou7M1PFFhgcOHxK
         qCu6GlQnGePGt/+WxJwSDnf8oyAc3txVfTU2yTP/bLv7WQtLkW1Ueojs84tnKvP7OQrn
         zCbBSLjTPxnrncYWOHsEfszAHzvlMLyQpAklSW9Zbph3cU8aLbh1tysi2/r7ONhhzj/Q
         Mayll4L8dd4rZehYVMCW2ZTJ20GNRUf0zB/do6rQIVNkGXvhh/Y2jqfDgw+reFnBwMKj
         Tprw==
X-Forwarded-Encrypted: i=1; AJvYcCVvYkX+UUJZhc6nBQLonSuI9KTaM/DnJ6Hl5DCbXIDGokwcQpz4FaWkFGIm93xpY+1kWCHFA7yikL0zNyHCiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFBaB5m8B6sLTOxZ/F+xoDP7KX4SQfvMDA4gqphL2SnxLcH5aH
	K8CVKjrdFg/9/A2rgzcZ7lWDl/5nQtoq/eLJ8fxwj+sm9t6IP7ujHNdA
X-Gm-Gg: AY/fxX5BDFtlI4cABX41lj5/k4Gt1L+sFKcsRalcH+QLYnpoT5XHY8O7KinTsFIGOw1
	oOAE6bo+f5u6ZamvJzcRMxjZGrThW+/2j+g76JCsIXDfkbDRgDItZ60UIcl5fhbuRuImMsecODN
	ufHxJvw4UAU69+k1MI23ZdxG0woWSYg25pqGEU2H6+z0FafJaknJEWGeQTTdr1Wl9VLuhj/pr9/
	xxLDUE68DqIwH7c2ighNcbp2lPERvwwQew/CRlyzDCxBow9GwexN+ZWrY216ncJzoiRmxEXL8ss
	NFoeIHkHXl250R9GSlSs1SF57z8RvKOZWgwj4thd/5G04/N+877SDmbC5djIGBA6zhrYW7Yeueo
	O8P+iIRm0gRdjWQAItO0VXUJGNPz0+ddrnOn8hxyBIEeJ+OsT2eMGXf1/6hZ0fNbav1qeKbF5g0
	30XP3xGnmSD98ILABXLeYzUW4KMTeK9Bw/zuJSjl0y209vC0IlR1Hfa73rnaF8CA==
X-Google-Smtp-Source: AGHT+IHPU+0SQ+q0XOYb/8CVg8fHZEnjX9/sJMBQ6gXaryp0fDKm7joEP0BYIYZXLRSjCH3RsQpDeg==
X-Received: by 2002:a05:6a21:99a7:b0:2cd:a43f:78fb with SMTP id adf61e73a8af0-376aa1efc33mr13239340637.48.1766470946893;
        Mon, 22 Dec 2025 22:22:26 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfab841sm12395362b3a.35.2025.12.22.22.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 22:22:26 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v2 4/4] rust: helpers: Add i8/i16 atomic xchg_relaxed helpers
Date: Tue, 23 Dec 2025 15:21:40 +0900
Message-ID: <20251223062140.938325-5-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223062140.938325-1-fujita.tomonori@gmail.com>
References: <20251223062140.938325-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add i8/i16 atomic xchg_relaxed helpers that call raw_xchg_relaxed()
macro implementing atomic xchg_relaxed using architecture-specific
instructions.

x86_64 and loongarch use full-ordering xchg.

arm64, riscv, and arm v7 implement relaxed-ordering xchg.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/atomic_ext.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index a48bb632dc44..089f31bc8de8 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -80,3 +80,13 @@ __rust_helper s16 rust_helper_atomic_i16_xchg_release(s16 *ptr, s16 new)
 {
 	return raw_xchg_release(ptr, new);
 }
+
+__rust_helper s8 rust_helper_atomic_i8_xchg_relaxed(s8 *ptr, s8 new)
+{
+	return raw_xchg_relaxed(ptr, new);
+}
+
+__rust_helper s16 rust_helper_atomic_i16_xchg_relaxed(s16 *ptr, s16 new)
+{
+	return raw_xchg_relaxed(ptr, new);
+}
-- 
2.43.0

