Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FDA1DED5B
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 21:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783804194; cv=none; b=ACtPvnPk28xs+9ctZ1tpcBEJjq4X+V6uXdlLCZ+SWRokIccPhRq4G8qMSzu/5FFBB2ADmuPEYoctSBbnUwGR9FVV0jGJIswWtO3jsnD046CPosJ5k5IxKwnhF38fBZBV0EdKyTANG4nS983eTHsII7ihqmtj06rq5AFb7xRJ6k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783804194; c=relaxed/simple;
	bh=EuYXo+5nz9W/MTl5qgLELN1ck1LGg9k5c/7/3V6andw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JECyW0qXmysZwXWOr1G+EjTZICSpsWMF/F60yhBrmxwH89s5XNkS+t2S8/RxylT2kr0xJ4b+8pT8qeOUcrDj9eDdtLplvHfWH52U0KPajkMzhPL89QBh1D2IWJttSB0LgXfLXJyKH4+gUveMfhf4ha9IqV8TwHFq8Na3OOFpLqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ssd3Xs8r; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ssd3Xs8r"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso18628185e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 14:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783804191; x=1784408991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NwgTKzBosdlCxHbnu0swjHQWX5sLh92P2MJ9y08e2gQ=;
        b=Ssd3Xs8rXonrwWes/xjkDPCryKwbf4uPmUedQvzpf96TemcW1lX4YIC1cM1ffXFUY6
         Yz4R2nNU/mzucv9+IgOX6MNS7kG+f4dDP4W+Zx5hdUFcUZ94/NTZA61qRhckLT58YaXX
         cYg/JgVBVoj43gYIyyPmzxd+EqcvggMmqjYswznJYUfP4jAIPfMWI5y0qtCMGeoKWgES
         ir1RAX+OlVVlnnnUj1uYIxsyWLDEIQCEeTNaOMcO+CJHXvW32LEV2c6V9fGZLUotPctm
         l+KyQYrCvZg9pLdqh5tzd7CkjldbgN5z1BiDHcbdQDgfNRE4L0wV2E+l6rho9s4NxKcc
         LhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783804191; x=1784408991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NwgTKzBosdlCxHbnu0swjHQWX5sLh92P2MJ9y08e2gQ=;
        b=fbCWkIJZymsGdiC8xrLwlkkDzQYYE1vToqMLd4d7NI7Ii5gx+VmSuKKe48asps1ttG
         eQ0f4RlUnl/582J9wnx9AhwkQj4/tO+xT1Xo+HImEvW/oeYmD+KCavDXpZxvLRLMiv4F
         bnxzQWQKD2BT0syLrBjCpA+aylo27YxCS/tWOdu7H6hTp7n1UPR4dmR3E0XLaTmOaT6A
         yoCoR3cj8Mo58FL3+C+71bN4D0JLp2NP0OLq8HxH6F27plrPKXsY6S8dhehgGedaoS2d
         iqAAdAi+2TvoQIm6BNIsQ+DIF7RCQkJjb0PC0ntZGmENT8FtEbzht0FnOv+gvPwOWaOf
         c0gw==
X-Gm-Message-State: AOJu0YyZ2wC+ILyGeBcPleA0vXvvIgRz8Ke1GZ6YCaP9ePzrWVDrCA4e
	cSd4FlfAh+ri6kWHGW3WsxPJHhJLql02xT7OHhMZjsmm2Pux9iyRCFBL
X-Gm-Gg: AfdE7cn7wuCsnF2ZtkcYsF4/+ULGLDCiiSF6gyspuZl2y7odDK+nZDz09md9rWkW3i4
	7ylz/MoO5IRaeSXINn/2m7ExiFPmzKUDb3NEnC4wjYSmTMDCGD7wkngIECs1lhtqWnXGraMqvKH
	DhrCFUPOd7bBj+IoktjItVGZXBw5GJ/tb3zg4UJVPt8RZvBA9CW9O7HH/0RYwr5D80nEhixjUTu
	VZKpqiOLC5B+6QfczvMX2dSoSlf+RqQVx6yicPVOAe/Ht7FpGwiEGCUWK1uuH6cr6Bnoogq0aX7
	V25yGZdaJuQnCaFAKeosngNpxfrzuIfpvl+lWsjQMssAWsLEcMOUvAUCiqeaS0C48tzaqw7FeXQ
	6lcY1DCSZNOqM4zOdr/1ClD9pHq4HPyZqQDa5kypSihBgDeoFIXUvGhFE0sZrQ+nNuSNLtBif7J
	7Wylo94W4iAHUCS3jUab0qqeVDKtYkzA==
X-Received: by 2002:a05:600c:a14:b0:493:e311:5f10 with SMTP id 5b1f17b1804b1-493f87e72ecmr35443425e9.10.1783804190760;
        Sat, 11 Jul 2026 14:09:50 -0700 (PDT)
Received: from fedora-dell-ale.Home ([2a0e:424:a465:0:bdde:db24:d709:ef36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2a38b19sm116367555e9.0.2026.07.11.14.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 14:09:50 -0700 (PDT)
From: alessioMaroni0 <alessiomaroni0@gmail.com>
To: ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	boqun@kernel.org,
	alessioMaroni0 <alessiomaroni0@gmail.com>
Subject: [PATCH] rust: error: use pr_warn_once! in from_errno
Date: Sat, 11 Jul 2026 23:09:19 +0200
Message-ID: <20260711210919.33619-1-alessiomaroni0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace crate::pr_warn! with crate::pr_warn_once! in Error::from_errno
to prevent logging noise if an invalid errno is repeatedly passed.
This resolves a pending TODO in the file.

Signed-off-by: alessioMaroni0 <alessiomaroni0@gmail.com>
---
 rust/kernel/error.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index a56ba6309..2d3e31aff 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -123,8 +123,7 @@ pub fn from_errno(errno: crate::ffi::c_int) -> Error {
         if let Some(error) = Self::try_from_errno(errno) {
             error
         } else {
-            // TODO: Make it a `WARN_ONCE` once available.
-            crate::pr_warn!(
+            crate::pr_warn_once!(
                 "attempted to create `Error` with out of range `errno`: {}\n",
                 errno
             );
-- 
2.55.0

