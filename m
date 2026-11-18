Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001145;
	b=uDwdtd82XBybet54YX/8nPCfTPxAoNVwz/rw9AHuopyE/0O0rtqJLtJpIrFJHTbLUfbH
	 +Ep7e+q0cxcfOs9d7f3cbgWVnbap6sjplWbMeoMwKSavgQYlszwU5ydsselXsedb7GLPi
	 EIAW/aabUONSrDeu+ek1jtapIqs3b5WHxwUs/pQg4+2OqPJ8Xqg6rZHfBciIbavML8c9j
	 st6wmZcwxs8ZLHQfNRC7LEGzl/S8JftTvxzAn6uo7wbcL+vEEy2glwpknAHQ46GP4mOMa
	 Y2A8UlovPBW8qfOANqCtCzKE2ka45KoWcpm8WG0GRoALgfyGvdB8VXWNGCa1gWWaRiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Jj3AiIIXmRC9FyTihY7j7RN1Wu5qfeANt23v7y2ZS24=;
	b=DBCi3npfFLk44UATMnHNvt4G7su46VUFaja1QnW3sPu8UYT7LGiqMA5LUJdjwGo6OD9I
	 juaTWu5SAqWGBrGwCzzQ9dFakTESJGGNzefQksWH/RtY2YqDtmcBiXBx3UVwUh0PzsGvp
	 UNRpLhY+omKLkxBXEOgLQeP6eUbcp2YpaZZdsUG/9/LTcfPifS0yUASFWh5J/N1/1fTCA
	 YstoRNQOLeAN/RrWUSnf4WSUHrlAGUtoOBWosXFP1PSDvne5FphQtcQ/UaMxCpuKjJYI1
	 BlXboEHoAPQFybXbPitKKlz99yLnvKILKfts9WYNHQtTblxa4vJdPfJH3kuiwQN5nLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cqskiwFE;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90DC606A320
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 11:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90DC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cqskiwFE
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a204ac318aso3989075e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 03:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795001143; x=1795605943; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jj3AiIIXmRC9FyTihY7j7RN1Wu5qfeANt23v7y2ZS24=;
        b=cqskiwFE/oWO/rqVLm4kkogciIji3y4Kjq4RgbP821CCVY/g4AxdF16yvfpwBFVFGp
         tGEazMi+uCxsu+p2LZn50ixtULmFWxHVge+hVo/5D+4DRD/AdfXTrOOOP6g2cVZIPjkH
         xIc8+ihl+8Elr0xhuw6ORHwxcWo117GwjA7/dLJDyZpYUYTSZgIXNppmZM9yrKc2B3dC
         L+es4JT0fWntwtEF9WzX4Ae8vtjS3xpIdp5wPdAWSxnd7jFZrMPLIPzfxdzaN1mk3bH5
         XWFHfOfqUuhvPrc2Kg31cD8+/T5OrywHWQSF7rv3r3TN9zoOO/Vw9CGrYectyl2v7Vfe
         nzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001143; x=1795605943;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jj3AiIIXmRC9FyTihY7j7RN1Wu5qfeANt23v7y2ZS24=;
        b=sA1W9a8p4yVkqaQMLlRaFNfD37nFTurV8XUh5LnI0GIdmodDU8Swj8gJx9QblBvECa
         AMDzDH5RaMGsATkeR75FIAcKr62aFa56jEEBQJqCVqSwRqbxkEqZu+Tk8QDmzEZW+YtX
         JWjmlFPxYgi+3KxOTU9soBLBhcqX9KhgwVywhnw4H7QeS2AmMXDAnAMei2mLcFLIzU1u
         uQMspSmBaLnGDWc7y2DlUHVmC+ssyecOiBD5/kK89i8zwgq3awkCl5nmC/54XlHqcDSd
         PIIAdF449W8wqlFfktTnxpqlt4kmP/CWMUUS8sYjtuZmjBkqRXlRXB33gBdWb26VKVZb
         cu2w==
X-Forwarded-Encrypted: i=1; AL+hErGo+9/WjQtQE2BHozClJaeFg2lPbd/PIgnp9bP3ez3TRNmOyaNhj3TmzTzp37WwAM6Caupuh4MeMmr+Aie6RQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/gAdm+1Vr5HpqYoRL0C0WZR/yIRUJkVEVnLAiigpVbCF1CYd27
	LbaGofFRy88WGB0GKhZjlPJAlbuA87vq4NVSEBBVQfX7baFAxBHozC/bWZM4CMEq20oNYKym21E
	KZtWbyVoJx9SVcp74oA==
X-Received: from wmte3.prod.google.com ([2002:a05:600c:8b23:b0:4a1:e44e:ffd0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:82e4:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb7da0f6edmr48886255e9.6.1795001142665;
 Wed, 18 Nov 2026 03:25:42 -0800 (PST)
Date: Wed, 18 Nov 2026 11:25:40 +0000
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADOL/WoC/x3MywqDMBBG4VeRWTuQCaK0r1K6MOZvOyhjSfAC4
 rsbXH6Lcw7KSIpMz+qghFWzzlYgdUXDr7cvWGMxeedbcf7BQS0i8WKjzZsx1NZ+YnGN66IgBAG V9p/w0f3+vt7neQFEjIZgZwAAAA==
X-Change-Id: 20261029-binder-unknown-einval-10407d1ebb1e
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=+SUG3kGuFCHmoOrycx6vsE5gV58r45W54JR1JLI8nZM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/Ys1O60Q4+eQ4Q/yuYRDRcG8xoT83OLtaGNPV
 vXdNKpiB/WJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCav2LNQAKCRAEWL7uWMY5
 RnQzD/9rqO6NyxT/nmnnELkRkLu7U9+ISwS+vCpWIzuwnmpCfBmyxPgj/Lpx7AIsNSxXI5pqtgH
 NN9NXXhKca+hm996cJudy5RwJtUq2ap9g7dUYSjxDuaO4Hy38ZqWuH1yi9NiPcN0FkL/j7Lcjab
 rnJsuslLGOjndwf/oWqboGBXUP/Grk6iFSVcWvrlHrXZIIA9d37DAWb+PYjJ7NCF5psHnNWjsKn
 DpdrDJwdPilNHOvFaR8WJBZqz29D5oypCZZAbwsasBEM8XcX1tvPzZMFXQmloGJffcqB5bycJyO
 Oz0NhTdFw2L4Acv10bSgcNNs8xKvVeSQFTdWB/e2Hf7ZcUnHAAZOqAJ13NKyPtyTm4gdUvwdqu5
 XUvmQLfE8VnXaTbETDRDpTOVaFMFRIl6hXDbUdorYojNeJvtiuxMpz3mk1vS7AIXOunT1n+wfsh
 lSnCvwPriX5Y8LVe/pFHsyMNOUh2V2CXuUg/szkfQ+LEqGMOXsuo2wXSSA3tJpF895C0BGq0amx
 kjUA7MYUv6QkVJCG87FjiYuTfRdrEB6ZHLRx4WP0OT4Vb1lHc2sNnXrnziaJU83f0ZRohOmLcYw
 35hRKL0RmopHM0iXWkSfTzmYyf+tesZ/t3BMZkCUdonjdNjzL5l52ywt55+mktTzEvMDKcz2FRq idU6S63mf9dD0gw==
X-Mailer: b4 0.14.3
Message-ID: <20261118-binder-unknown-einval-v1-1-ef4ece277b26@google.com>
Subject: [PATCH] rust_binder: report EINVAL for unknown handles
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

Currently unknown handles are reported as ENOENT, which userspace
doesn't treat as a fatal error. However, providing the wrong handle is a
fatal API violation, and indicates UAF in the userspace process.

Thus, change it to EINVAL to match C Binder and make userspace treat it
as a fatal error.

Cc: stable@vger.kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index e97213250beb..406d80cfff08 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -958,7 +958,7 @@ pub(crate) fn get_node_from_handle(&self, handle: u32, strong: bool) -> Result<N
             .lock()
             .by_handle
             .get_mut(&handle)
-            .ok_or(ENOENT)?
+            .ok_or(EINVAL)?
             .node_ref()
             .clone(strong)
     }

---
base-commit: 917fcbf033154a6c8d83cfa6c88f012b71eb37b2
change-id: 20261029-binder-unknown-einval-10407d1ebb1e

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

