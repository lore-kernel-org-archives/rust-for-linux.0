Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89911386C9
	for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 12:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764420207; cv=none; b=hoK0uVHeY+kVzGSHJ3eNHqO73WlL3wJsoSEE2soo2CErdVdxha+yacje8B39cfpp4wXz0fyZpOmYdjCRiKTLOWvDhr2bWKBOIwk8aZeD1pL1OWf9yuZUtE4CoyKNF7wW5Y6THpoF0jGjoULKRDAKphL47ilB/5u1QWx1FQK+epA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764420207; c=relaxed/simple;
	bh=GfnRAPFlz0VoAVhnGfTML/TnCUEksdTbMGcMz5wo0oA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XbSsuO95+7aoJrT/Q+NbHq+YweZz6c7yMVFTskdHq/B6luhVaUa/UHo7/Kzwv4rCkYWthBI4uvXTTJOSaWe1qbRK4NfW/KF3mH2JyQzMJjzPUY6DbUBzaNq8fTm6QVwNGSjbCRCAntrDfwklH58YqRHDLhuZ9PT5fxVaLeDEvTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KR86HKXe; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KR86HKXe"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3436d6aa66dso1640438a91.1
        for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 04:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764420205; x=1765025005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VMpAum3ytrZsOSIHQuzOVHbPX8U7X6vjdmvEEcNGlRc=;
        b=KR86HKXeAyg5TDWxK9nAsLyOrKtW5jFWi1jgn2kSlZfmXBSNXe7l3SXFG4IhPp2dl7
         MYZGNbnb7wJ3tyd7gJFUDxH8iDvQ+V5NME2v1UJ8B5Q4jOYwpvmnSotCSFPUCIAOmV/r
         47GEDfzFf8/awRAGc5WW1o1BexN4vGm0hJRwiEw8TIPdax24lzqVi8F6nXYPIAT/z+/w
         h/2u0MgOaiw6OvCnZthu7OP00r/zmOb1AuVYK3kR+jQAt7omZdnvZZ+9I6FCQf+XfojL
         WXEY/Mr0v61rHSdh9d4boc0nF7nDsC4ViCNBsLZLlqh0wlPvSdgExkaM3TFzFLG6/mam
         3Qsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764420205; x=1765025005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMpAum3ytrZsOSIHQuzOVHbPX8U7X6vjdmvEEcNGlRc=;
        b=rq3e8FNz5TfJHuHa71zZHry83/lOogT/2K7heFLpkjRM4hl3H8zqR71r4pBx47DOrS
         QUKyhMQxavFFmPfBipQIbh7AJ/IeD+wMXgZZEdAKFrsTZOuSsP8uJBn08uyoaspFShdy
         Jdu02Q+a37q7tKIg2fYTJrAVFyx06difydSgX80ya50wWZHlyYJVADoa5qomEGTIGKmS
         gpBmgDVrqA2Xdwg7kco45pHu9r+vXNDjSdDo1DR8e3TAGUHEIwOWZz6/5M1rZshyGxVX
         TCx7rluRVPZfNE8JewuQS/L7Yoe8x409rsqzJILF14akUjUfSLodAPhKOl8KNs4njRpH
         kw2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWo/h78LYT7LF1t2cWV6awGBjqDi7xSmhYCBi51D40bE13z3jVsioQT2wBtJ49GQF0ZOf3TTUWUnRGa0QM/ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3kME5bE4enFoGSUhYZNiaJzOxudaO2P7GnngBPidFhCGs0kNJ
	PbplWi0D8861GrDP2kAX8VLjVkUHGnwbT9y86Xq0scxJ4K1Xa93RgaAX
X-Gm-Gg: ASbGncug31AvL7QyNxx1C//TEFqkIDWRpuPbq9XpUxg38PzUAWmqb3wUZ55ibS70FgP
	KBubRrG47rPugxHvMP32tC0ThDRyIvfIHltuz2jpvPxyJc1LIW/Md/0SYCzG2DH0qLPfKyqCd5F
	zkq3XIoTr1SlDU2o00z59cJ58oFJMS4l1YvP8cN0F/nH75ANfwrRgbS2SLpOCSMGEQ3z2sBckfJ
	GPEiANUYIm9JAG6xSzMHp+mJK4pLntG5NOi5XbWOVS/ccDMeNHRxAdfuYBjVtAqhol/YueW+ECP
	YGnh4qo5NLEeXpO8MUN9VJPj7uKkeOy5JrB5dlIbFdGWiEF43X5He6/EVk01FrOlnIEgTbt/ISw
	rh0T++dWIc17SZe9O+8Nltpp2WN4SScVIHYjJ5Rr6YDkqvahIaKN2xD+fIyFZPf2TeA7N4Jt1Y5
	Gp8svh9GTc/P4GURW7YGyZprgjR9Yeqm/Ld36UxzV6znpIqpM1h2M8r1qeC2LjaNfG
X-Google-Smtp-Source: AGHT+IF1Kq9+vv5FkGAM9RELAb7ruZLNGMlKBrlB0gsvt2AiDgH7vYi8G1mGuhj8JoZdzjvNm4+AHA==
X-Received: by 2002:a17:90b:3bc4:b0:343:7410:5b66 with SMTP id 98e67ed59e1d1-347298a9f91mr31974970a91.11.1764420205074;
        Sat, 29 Nov 2025 04:43:25 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx.. ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a43ac07sm11374777a91.0.2025.11.29.04.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 04:43:24 -0800 (PST)
From: Atharv Dubey <atharvd440@gmail.com>
To: gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: david.m.ertman@intel.com,
	ira.weiny@intel.com,
	leon@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atharv Dubey <atharvd440@gmail.com>
Subject: [PATCH] rust: auxiliary: use `pin_init::zeroed()` for ACPI device ID
Date: Sat, 29 Nov 2025 18:13:09 +0530
Message-ID: <20251129124309.25572-1-atharvd440@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the previous `unsafe { core::mem::zeroed() }` initialization
for `bindings::acpi_device_id` with `pin_init::zeroed()`. This removes
the explicit unsafe block and uses the safer pinned zero-initialization
helper.

Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 rust/kernel/auxiliary.rs | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 7a3b0b9c418e..67c5d356d754 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -108,11 +108,7 @@ pub const fn new(modname: &'static CStr, name: &'static CStr) -> Self {
         let name = name.to_bytes_with_nul();
         let modname = modname.to_bytes_with_nul();
 
-        // TODO: Replace with `bindings::auxiliary_device_id::default()` once stabilized for
-        // `const`.
-        //
-        // SAFETY: FFI type is valid to be zero-initialized.
-        let mut id: bindings::auxiliary_device_id = unsafe { core::mem::zeroed() };
+        let mut id: bindings::auxiliary_device_id = pin_init::zeroed();
 
         let mut i = 0;
         while i < modname.len() {
-- 
2.43.0

