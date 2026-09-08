Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EF94B4866
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 20:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899937; cv=none; b=m8gVwd/z2kMccYaGWgJQu81ITrU93vb/FjKRfKHUs3Gu6AElooboMXq+BxgOAAGxs1sE4sA6khkP1P4XdDSOvEkSNT8V6eeRaPjRz2ezzcPi9/JH7MSTPhSpH/jOudDC6FXhtUGmfkOLiDxUHkzDup4JBIppPd5TgaedANhUie8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899937; c=relaxed/simple;
	bh=arNrw+iPsal8AZsnLzzOB1CyT7mCNMqIyMK/IIGqaGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sADrS5q4igsHQHEpIR5vRFHstENbqQA1YJ5ylbDDlVAZYA0b8DfEJKqFEZBYEJkkDFZqE6k9Mri01ueu7Gg0vsY6jaPHRmKRs5O4tgzUdPkzW0NafgBqHPOvsrUbMhljvt5BGjt7/5d/eaJhSqvaJAoTexalgSewbtUQbgXmpSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBEpBbWW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBEpBbWW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so5465705e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 13:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788899935; x=1789504735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/lPuDw+ORGOHKBcreKD51QJa/ZGL09ksPm4bGJzobvM=;
        b=iBEpBbWW/oblC+2+wo9HQoR1q4Vynzwb1C9ei/1IIK1x7DoWx50Ji/et/3Z462RyTt
         Ce6Lhlfq1Ia8Nr6/z06jzWu9+QnIjhc7UXreBOutNL22Sf1OLh/YFIoqkZKXKkqNoL5b
         TQpZSO4XT3ppS5Sx1Rji1p8LgnJoRX5gpUH54IVUPxltgqKuaeG5Sn+/wG5gcX4cKZIi
         txnSYtNKAP4TkSskjwVESeH3RqQzSQV3cXiUEBRpjGlxLbQQAldhqzAC7lflyjjMtTbR
         BTPUxfi/SGx92o1dTjBL3CKpkIYYdP6QVwXdsyDCOYH8EEQLElkGH238d6+GyBGbf6XX
         sKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788899935; x=1789504735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lPuDw+ORGOHKBcreKD51QJa/ZGL09ksPm4bGJzobvM=;
        b=eTqTP1GdjUFIaYaEMF1JM2+oJNgfdrbpvPOzBmoDO8vCxD636a5V2NmprekqIFtVNQ
         B7LshS51qTu+CaGnWQnppgmdHRtDoempUhApTWciyNzwRhMYT14G9IB1+GlIszLweILh
         5jR2KyHtZgzDNbqZS3O6LzTWzfDw5mjF8mqDym+Ash9xJewvDYo8JNNHEOlrSmCMNf/H
         oD1Fo2+fvrNLi5yO3HUVNb+V4ew1orz9JgD3UjdKRPVcSFMd0J7uYpLT1EAFmloMrw4y
         T0XkkoA7bMMOijWAdFFOLDPzE+Gf7p6ZWmM2EZM1Y9qvB1KHOFq7cJtXGee2BZ+E76j/
         Ptag==
X-Gm-Message-State: AFuF++mesopC5fQ/OluSqVkuMO+PJ/gg/rMwj4qGAVIKmtKRs79H7Sc9
	dNt8i2JqmW7ijYYyTThIoqcDYgY1Xf8Cls5ddOaw+e6JJo5iBVf190MVaTQNfglo11w=
X-Gm-Gg: AYBFou3kTI+5LqzpY/gUtuVXohTsvdXAWlYVr11Hbn0CvOFDKSV9RzOMG27Oajv9+iH
	qN3JoieZg/CGfG81tr0B1/ELO3MPqSjBTkX5yVmQrkPqCGnKEKGe3IZgL4rIBmB6QRVyv7xs9gI
	2YiG6RZ8CLVjuRespxTRaO5XlNEr8t2v2QXt9K11zrK6dRP7CuFrQHp2vzAdVosOSHytdw31Gtl
	5RiILr2GUvyPeutDL09JfAUg4eVxBYOiDrNdH2dkTsxDTSBhVOKxSbEpU9FXD0xi+nYx4665Xyw
	F+Yzp73LeVXpB/1+zhnU0TayVa7VRluA1zjrmQkvOZQwwzCemSqrif+RuubudfuJq4wcF+OU1Rt
	xu1vk4sIb9w/Iba6Fr/9dw4TMuHcaLGXCEdPT+eLlDLKYmbnl4dYFZHJmh1jb8z4zXPBJNWK/KL
	cZ+b+tnkwJbrQ/+8FgUcQsC8r9x/kSJBxKftw4qu5I0p7A6HJg1W2hmPlKpex/VJIe10YXqMlRE
	C5PecIljb2S5VAMD3TB7niDKq7cDR1p8ewkidHRYzOmMpMmCWanmZSy23imfEEgeUSU
X-Received: by 2002:a05:600c:b8d:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49d1754e950mr101462935e9.4.1788899934457;
        Tue, 08 Sep 2026 13:38:54 -0700 (PDT)
Received: from moosama76.. ([156.193.105.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20dae82csm3943805e9.3.2026.09.08.13.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 13:38:54 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	Mohamed Osama <mohamed.osama189110@gmail.com>
Subject: [PATCH] rust: print: document safety of printing functions
Date: Tue,  8 Sep 2026 23:38:50 +0300
Message-ID: <20260908203850.952156-1-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>
---
 rust/kernel/print.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 0d62beeedca5..def6ef5a1dec 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -29,7 +29,8 @@
     use fmt::Write;
     // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
     let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
-    // SAFETY: TODO.
+    // SAFETY: `ptr` is provided by the `%pA` formatting path and points to the
+    // `fmt::Arguments` passed to `_printk`.
     let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
     w.pos().cast()
 }
@@ -109,7 +110,8 @@ pub unsafe fn call_printk(
 ) {
     // `_printk` does not seem to fail in any path.
     #[cfg(CONFIG_PRINTK)]
-    // SAFETY: TODO.
+    // SAFETY: `format_string` is one of the fixed format strings, `module_name` is
+    // null-terminated, and the `%pA` argument is a pointer to the valid `args`.
     unsafe {
         bindings::_printk(
             format_string.as_ptr(),
-- 
2.43.0

