Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475B67E107
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 05:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737005193; cv=none; b=te4EMgR/LpvqyoED0zIlVvdP6FD/rMoNVXEzMDSxqO3oHU/CSsadqjrDOfJdL9cN1PAzDsqMsPbTvOvyX6Vu4tkacsvOrzmGi0JKk4wY6Bjlv9qYT+2CgGEfxs4Yx6Pv9GyPUDhMxzKfR4wJp9JuQccdGDOhbCPDeoQW5P/ZWvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737005193; c=relaxed/simple;
	bh=9TS+koL66f3GotKZ4XO5Qsc/vswyLYIomvI7/0lU2pg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MqT/igy6ckxtF+Vow/YYXermjN5QZV+I3MhZ2vgrNgO5gb5AvKE+Kt0iFqid5jWJqYfKxMEUURXRi3MDcTYHLJvyug4KrWKogmaUmv/2VdY9kvCfIXpMrxng6jl0CMKmP8pG+dmAgnm2U0keswnyBPyZy7D6imiwxBi6/6b9fc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WK5Y9iSN; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WK5Y9iSN"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-216395e151bso8020235ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 21:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737005189; x=1737609989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l1RUMYvlMm1lLnQi22sXmfs/EsutO/fQrHWo9t2Ngos=;
        b=WK5Y9iSNVrParyxLYAbWTdY9pQHJ/DjuZmCmLuQ+PcFMDzISCc6Tw/ZWco7TCS9o+x
         Kqm0Q5+gMCHzlBF1FFUSSxE7fkwO+7uhA9tB7bSnjrASRGTODqUCPhUoMlhlUIP7z+Zk
         h5Z3DlV9QvcVSOjpw+mQ18mdAcu1BZdifqb5Y5LFzpsS7HcPdhSCDJ3PXzBtr6ArCo2M
         BndpzcALxQjrfwLdA27bYNR9YVUUBw4uq0kTMg9cFojhp2OgB4KJ+kemxpU9mukpwWGW
         dxe5y9Eec6vCMQxjOM3FVgHw7Tr7hYKgAUc35fe+3fqgWL1Vu9qShdla/nwecEQfQfKV
         WODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737005189; x=1737609989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1RUMYvlMm1lLnQi22sXmfs/EsutO/fQrHWo9t2Ngos=;
        b=HGRlDsOdIfaNg0mtW76+SjE5AG3jcs5v5cP1+XH2ZV1IVkBLwB67OxdfSlHyDI/R7+
         ENEaqgy9Mq79KM3XlvI0fXFgAFlsjh7NYH55wh3WNRfo5ekBQFIBOidIqgyxxAy7T8Tg
         vzLrakzT2ACNI192shRsJA/MbfvgwCRd3RjhF4Q4QsEebZEXfwyL3eTGr7rIkzRdXER7
         37Yw+PAlwWVSmrWGhpy1JM5s5HmLOTZ45SuuLh7MHMqlxeP9Tf5sAE7zG11KuV8f3tuX
         Cp5Fe4xkJ7ycIINIGhv4dkLf311H1w1pKjdjUAFySLY/arucIHP5MR02Q6xzrTR6RI6m
         ZZCw==
X-Forwarded-Encrypted: i=1; AJvYcCXbgXanYXqcr52TjXqbMxk0A0yVhvJr8pBZGmge0WSozvx2XD3JwwPwDAMOZzoAWM2neLYDqy9V7hgeTJ/Ocg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxskdiJ6P2IKspEfYV1kshdb6CeyqLsx3eS5mB9GwrxsN9x1+9
	1JER9OpiuxWFwjYktN46+vo7/E4KeuqUvMCFqkJKPDUJRHA90F158K+XJpBjaf4=
X-Gm-Gg: ASbGnct4ZFxGyogMyQ/6cX1px0Q0I9i/kOY4MsO3DTfCzY3xP7Ba01BphFcYczoqixi
	sjXrMo7O0LqL1XrUVg1WSW9nArOBo0J2bRvXlLLwGSg5lzX13RKZvmm9J5WP+Q6jfyAVARqcJJS
	NJMy3UCJeUqrMF6+K/vsos0CXA8rAF4yBnocUZi72ZEQ+mrqnOOCC7uGesKZB/K5reJoWC40xp5
	5MtduIySyYEj+Sw8gVhf/DcDkdYMDYON4t5CLFxbOOodieSs/ZantXrTDo=
X-Google-Smtp-Source: AGHT+IFvDSRcLamSLgl/ch/NDC2Y927o8MX3Ir8leFHaDj2BX5MRxe7tcJrkYtgA40IUuuMOEMfYig==
X-Received: by 2002:a17:902:e54a:b0:215:7287:67bb with SMTP id d9443c01a7336-21befecb4dcmr105848885ad.0.1737005189564;
        Wed, 15 Jan 2025 21:26:29 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f254984sm91780035ad.211.2025.01.15.21.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 21:26:29 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: device: Replace CString with CStr in property_present()
Date: Thu, 16 Jan 2025 10:56:21 +0530
Message-Id: <e97dcbe0418cc1053fb4bcfac65cc02a0afcdf78.1737005078.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The property_present() method expects a &CString currently and will work
only with heap allocated C strings.

In order to make it work with compile-time string constants too, change
the argument type to &CStr.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
Adapted with Rob's version a little.

 rust/kernel/device.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index e8c4cda5aacc..c775266ae164 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -6,7 +6,7 @@
 
 use crate::{
     bindings,
-    str::CString,
+    str::CStr,
     types::{ARef, Opaque},
 };
 use core::{fmt, ptr};
@@ -183,8 +183,8 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
     }
 
     /// Checks if property is present or not.
-    pub fn property_present(&self, name: &CString) -> bool {
-        // SAFETY: By the invariant of `CString`, `name` is null-terminated.
+    pub fn property_present(&self, name: &CStr) -> bool {
+        // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
         unsafe { bindings::device_property_present(self.as_raw().cast_const(), name.as_ptr() as *const _) }
     }
 }
-- 
2.31.1.272.g89b43f80a514

