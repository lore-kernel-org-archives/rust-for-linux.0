Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2F836CE0A
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765979513; cv=none; b=OapGeC/lzpLkr2X79F3KUlH72myYKl0tMBmCfRIL+Fd4nOABgoZ0g7ydrkl5zkPRysixiQROQQtTUGDAUVHAFmMxKqH8PqLROpH67CG7IWF7oCt2+0fmzXXTZ4JFthT+wDypuvzuXyfet0LN/UT/5XqwgrWxz67oIC6iZz3MBjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765979513; c=relaxed/simple;
	bh=b9tLxmTlkPsgshvAK0Im+EAXHIzMVLNaqysHM/Vq8r4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=srdTPO6gTR2z9qIFnRhfkm38jRTlvYqoCUr3eDs9KXMozWmcPMhhNgGYXgYi58J7371DGcL4octUmfReptIDUDRDq2XN2tYV47qw1BigPb/cHvLYTsXx0ta7FBqvz5ZpqZJJBZXg3Gb4Pw9mpKx3PKbXqtfkHz+CXSA/Ko7Dwfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q+XUmJ7a; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q+XUmJ7a"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477cf25ceccso58011615e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 05:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765979510; x=1766584310; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l2tA9BvGJM/MXAqqEEc2vFp7vn6Bv4CPAQxGvvw/yM8=;
        b=Q+XUmJ7aeh/nzWz5WfSAfO0w+j7WAEFf0ezWd/49X7nZFHQZueioHHCmshgU6QHMhT
         u5cXzg51g2tPacTt67d9TvRMoCYkwZh5OR3l6s4pO/KgtDGPz1jolG8lS1rX+l6ZAOwV
         kFc+nkze4C9PD17NriX8L+TgCJovBG6pgvdC201DkYzV7bEZUZrJ+xLU6e4CPumQqvu2
         cpmY4U1ytUObZ0ES19W7ZoYragD1gNEAJpy0JWXSdXYJRB1xDL3/VKYgYrAYR9A4IzMy
         6Es7QX46ssms9efpZEYsqUQX8SltTNCwxxRkJZt2Ihlhqt5GxJ1g+d/cB6aeUiIGcmpG
         Y7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765979510; x=1766584310;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l2tA9BvGJM/MXAqqEEc2vFp7vn6Bv4CPAQxGvvw/yM8=;
        b=se0AJBW/KifxL7wniAg09kSwzL4wsUVWeZqs5bP3+gEzZWJIoIfwD8rvGs9/17gSug
         Wvaev6SRObOeq8Mq+avp0I8l0iPV/sqTQx0uqq0l39DW5KO8V70N5wnhewJJaBpGwcWP
         ZMIGl5ongAKNwA+AE2m8nwF1ghav/demvDum31bnm9zxZuLguTaCKqLEGUWMZv2tmVni
         N1ouZUs++dgVx6WYDDAR/mjzg00NxpkGbzwhkRkazRkuXac3gVRBTX7qEOOJmP5KzAiR
         A0ArXxksnz2fqdn4o3wSOSRmejrm2PuwGXMBROXNMpfhzGm4z7xttsGQFtmYVVFPQM6D
         lYFA==
X-Gm-Message-State: AOJu0Yz6YfhlGkYppOl+tDN235igqXx/LAWVDaul2Zk29ImlBsGQledD
	LnczFwW/mwoH1UjoND23dDGL/9ZRgrnHCTqG3RkdVA1CpekmPoAOrRWkslqZcdHEE9skpKDXp1/
	yPTu16y4NwqgMI2WbBw==
X-Google-Smtp-Source: AGHT+IFPVDyOX0LkIVlD6oMuakoX3YifvaEbSUmOSHDAI6aH226P19wCyhK4tsWgAf+69nYIAMZYUMZmpEkeUvM=
X-Received: from wrbgx27.prod.google.com ([2002:a05:6000:471b:b0:430:f96d:ccfa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8115:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-47a8f8a9c26mr182934425e9.3.1765979510506;
 Wed, 17 Dec 2025 05:51:50 -0800 (PST)
Date: Wed, 17 Dec 2025 13:51:29 +0000
In-Reply-To: <20251217135131.153557-1-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251217135131.153557-1-aliceryhl@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=663; i=aliceryhl@google.com;
 h=from:subject; bh=b9tLxmTlkPsgshvAK0Im+EAXHIzMVLNaqysHM/Vq8r4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpQrU9HNPCrr4bYOpVk0CqroewBViv8WqtWXtFt
 tSBtYvc4R6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaUK1PQAKCRAEWL7uWMY5
 RtVgD/4xh++jJ7tUA+8RQpTwyYGllZCtDFvYSEtMNZWT7+Z5/pJjVLSsye4aRH7PXB2SLLn7uM4
 lfAOWnmxc0gXnARI9NCgrDjFvQwT1l5VG8KSfCYN5JOAMLBd3iluKJz4Ecjig6Mm8R+/k04+LgO
 0ZcjTflsJ8gemOnCCHfHj3rCnCPWMv5tlbGp5uc9JPjI6gBHtCofyuwyAJQXG1aWNn3UkRFgNTK
 NTPJMomMzN6pxKSJvrYtbznkCRnN29/YWk2x+DOqsVZWyF7solvyOgnzxtZRQdI9+X7A3LFLqdr
 qSqFKVyY94dq0TdSVmdlZi/Olb3RGlecme2ABZDsd52IGDDrAW3/uUSR5D2jfJLgF0SSnLEX0Rr
 Bmx6Yba15NwuTp8Rw0l4ZcPvEY/YuhS/cTF1Vk00AwQrIIKMOm5uWZC0f1XVnwVOrpQucl8/2hM
 YAmo5+Q9YVmyBPbjlnR8ine2a75FoFeZ9TpqoiGfgVhoFAEe3YGrVyQUbJTRwZxN+m0gBc5nlyO
 edQCukF2Q3vokNAKMchRzls7u4KZHcKRk0SprWYaC+PMYplWzuQQeJ9KSNdxYaskD9jRFS28pul
 0wrPWDyy/zxTvQ+VH5g3F5jR+6z8kn8JMJaEsSvqR/Xf5Zv0vN0n6FP1VEXa9QpdH1GMdgLeIZL 5U0yj4ye9e5emnw==
X-Mailer: git-send-email 2.52.0.305.g3fc767764a-goog
Message-ID: <20251217135131.153557-2-aliceryhl@google.com>
Subject: [PATCH v2 1/3] rust: bitmap: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/bitmap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/helpers/bitmap.c b/rust/helpers/bitmap.c
index a50e2f082e47..e4e9f4361270 100644
--- a/rust/helpers/bitmap.c
+++ b/rust/helpers/bitmap.c
@@ -2,6 +2,7 @@
 
 #include <linux/bitmap.h>
 
+__rust_helper
 void rust_helper_bitmap_copy_and_extend(unsigned long *to, const unsigned long *from,
 		unsigned int count, unsigned int size)
 {
-- 
2.52.0.305.g3fc767764a-goog

