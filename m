Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7D92DF121
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 11:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765453148; cv=none; b=b4NwqdGqsW1cfmVA4Ajjv2nYOmEWHWpx6ZSvAIB0NLXPIiIxt6lMa0ZUkOER9yT4fptmK7pvl45TaaWRUzsjJaboknX4OCGvrKqhiD57bvPHViD5Kw6Z9Rq854ZjpxJpWYPR5wvZRZz8zHRasjqZCTCoi4YQl+PjYeZtWh9/cxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765453148; c=relaxed/simple;
	bh=elWuHl1WJhA3q+X45uTVoaGgih8FU+HaVATh5WEeOBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRSGozDE54SOGTSkSQLL7xAG7iUKrzspvFXvyxVbJ2DqNqidtV6YDHWkloLHR64L7F9prsEvOssN53AwaT+am8RhlWDdfX8pSXESINHj6WcASqg3vBc+dvplC8JPo6NUu3rvBE0PJ21gCe9LjHW1jVzKSGN5kYkqtBTIoBCXamo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNJMIc+t; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNJMIc+t"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so882166b3a.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 03:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765453146; x=1766057946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAODmJxOiVZT8ni3izxRjYgzhxVLmJbCxcdrm5qXouQ=;
        b=dNJMIc+tR/k6UPCB2BbwebwGT1/vDeqqfIYX7kYrNmXw6q7d43oCkYpEkOosqrtBZp
         HlIeWPQr4jHPSygmhdO2sFj10q7PvmpQ0vmDq9YUoolSqlM0iN8Ak/wjkGWxlHRVrDxR
         e4fl+x+wZmAg8MHay7+wym6LDc3SIuaWrgUmJWTr8alYlDo1jVgfN+jZjeLJXQ1eryUX
         fqhao0P91r4d5TwNstwOuNi/cZqwUQkUnWgeomHrJ+vvi8klxAcS0z87nye9+19vk0TB
         blzZ8ML9bkHc5pp1RlgZVG7uaYdybtAZcoIBkiIWtNl8vcvjJhj55xa/Htg97iVJN7zs
         iDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765453146; x=1766057946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eAODmJxOiVZT8ni3izxRjYgzhxVLmJbCxcdrm5qXouQ=;
        b=XFReDrkBTpfWLYN5DRk5HIXaUrDO98sGsQj+L2aiAkSElmKaUtkDw65blk4Myi8v7Y
         USoiopZO0BJl3Mlr7Fr33iuIm2jLInBUQ1bA+swCtrUlZVWXoMz88IBa6Zj/pHALR49W
         EQhRT6eAt4TPTez9UWw2BfnNlSa6YjNQJ8lOIThill64LDQbXIsejAC8RgXnaWhadgOO
         5xZ0/iZHA/mCVRcftY1/4U2OM/2JnvySKF/bbLGS1ER2jX9yWW6sMOVZB52Y8UryoiD+
         yteUzVRv7kSqP6tm3JhJ0Fcc0b0702U1frD6VjqhY1AuJV0hsAZ3oboBb3wfFrx/k/YB
         qNhQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9APAHunuglBMwiTjJzf9OYYMwDKLX1umkeQdsBYOaW1FkTBE6ctJHg9GgtSXXdWfTRm7ADB7K+djUKKaEfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS/CdU8lW4lF25xL2he4Qd4WcK73kCsQPfOAkjWivEo+yxSiOH
	W/OpTSYEY28eerpbSBd2dgYM4vyOIo9WQtIEDD1kVEJ53ohP2nRyWQZXzPaCoh2x
X-Gm-Gg: AY/fxX4jZW6wWkgMKNOJyP7Ptson3zPOLzYanZ6LL89PWE0Oax8UW0XgGLsnKJlPIKz
	umRHmkGL7b0ugYPS0UWsHkpVN7ssGGNaThNsXuCulScD5HeKGFBgsK4odR4yxqxScyQreH8s/Uj
	TGMaFSTtYBmrkr/JtGvvq5GLeoYmNZe+j9zMocrJrnlPutvDyD90SC6yF8LMxYnVQeV0/Ta/Bh1
	seVhJTRoJ2pI3M4Q9z7ijyFzfeh1cPcQj18w7Nk7RC12MiLWTRu5UI+EHXrGiJUQ/rwnx0FmZ5R
	RJtUgKUS0I6CLPC6q8QfE0zg1VFmZT+d74UXK/Ur/OIXHKuFHQkgoehAaF8mJ0LZXzgsHbikHxa
	HgXgSgaPfgbQi51ZLT46Qq8kIkEmpuiBKcfYekAndy/1i+Q1JtoBrb5THFy6uybk0DIpyJoIbQD
	lQhQasM/+VJL2isoKkueTFK+vFfBQlOXpNn77A8aejrfYgxvfFgVW4k3xnSvUgnQ==
X-Google-Smtp-Source: AGHT+IFxhUAwm5OX7wlegEvG0ii2RNgTO221GIvYt0b7tgubWslQNJbxUpLqueYauyS1cRpbXX4WKg==
X-Received: by 2002:a05:6a20:918f:b0:366:14ac:e1f8 with SMTP id adf61e73a8af0-366e30b62eamr5665332637.74.1765453146146;
        Thu, 11 Dec 2025 03:39:06 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a9264e4f6sm1780337a91.2.2025.12.11.03.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 03:39:05 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: acourbot@nvidia.com,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 4/4] rust: sync: atomic: Add store_release/load_acquire tests
Date: Thu, 11 Dec 2025 20:38:26 +0900
Message-ID: <20251211113826.1299077-5-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211113826.1299077-1-fujita.tomonori@gmail.com>
References: <20251211113826.1299077-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add minimum store_release/load_acquire tests.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic/predefine.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 09b357be59b8..51e9df0cf56e 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -137,6 +137,16 @@ fn atomic_basic_tests() {
         });
     }
 
+    #[test]
+    fn atomic_acquire_release_tests() {
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
+            let x = Atomic::new(0);
+
+            x.store(v, Release);
+            assert_eq!(v, x.load(Acquire));
+        });
+    }
+
     #[test]
     fn atomic_xchg_tests() {
         for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
-- 
2.43.0

