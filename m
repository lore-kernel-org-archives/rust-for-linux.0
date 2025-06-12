Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A87E197A8E
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 06:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749708792; cv=none; b=sDMe0skYQKjtO4mLCd2EKzEoKkzaKU70LuQEfYDY5OJX9TGMsXso+ewHQg6eljV9jKg1sd785sQGY1Wn1NBLUCYlS8qULTWywdv4r5UY5Vsy3RTMBuJt3p3IAA9UhjzRwy2TfnTRuXOOKhOrxFkskaq9DZBZKDAzgqxCiaTWGRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749708792; c=relaxed/simple;
	bh=S9glXHzIybILfvmr2H5idHynF8JmYgABzWUlyAqWRrc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m+3U4AGrltyphxi6l0hMGfPPCevCvH1DQiZh//aD765a+1iWs9ohf0RJkYf0KI31tU1OFlCnU4ti+vYFSspPfqb/nVU4m+v3rwCcxFGDEfw92ZixFmZvyoyS2wOgIOaI0rWXHB3zF6Repq1X9jrC3qbAZ8PPZBlNFx4p7MfQYtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJWSFjnw; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJWSFjnw"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2350fc2591dso5187205ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Jun 2025 23:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749708790; x=1750313590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8cctumh0qJSQiEcOg45VXIeM3UNK48mkdXcluVQSy+I=;
        b=NJWSFjnwNsf9fNybgRyQ1zDa6K4nnH7KE7N6nhetl0YSpcUsh87bca7yg+6eJSK2q1
         hzK5KIf8fTvU6Dtwcb+pPv2RWrAiFqx1pA5DnTA3u+zkiiSoXWWdP+1wUX9g6iDdtFtg
         fYk7uX5itKEVzcK/a8mcCjSDolRnhzobEj+18GrH07ROM8DYCXHV6vjsEV55u50t2Eo9
         28Nz+6sISP9l2EIADYWF3yZqKsNP7u4fIFsgQiYkhZUhue2mlIY3WybyA+4UTLAjLRxI
         65b05gv7FA2dsPJU0BZMRpnsuoIaszBqnd6hOOgmWdNmEMCg99l0OLaQmDFqsEaLKuaq
         5g8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749708790; x=1750313590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8cctumh0qJSQiEcOg45VXIeM3UNK48mkdXcluVQSy+I=;
        b=j3cHuY/+u4VlEgbJlJfLWPa/xIkrI3AFS5bmpjfU4IUdSRQqxdfmgc5BZYtC8ZCSt4
         sKm1C3Sv4iYOAkEGD+URHNPJpO1DY4IL+8NejjmMW7l22Kv6k8mAMBH98bwsxwLhN9KH
         bKslw4E6YoUV2TKK2XhPn4bpV9rQPCydo6O4MXiAIRgof18fjLJtIQV62tc1neFAkIiF
         Y+xM6u6ferHZHAyLtGz9M1cEkBACZFI62vMdWKT3tcM5mWQr77bBVyStl155kHy+NYkt
         8oT7bLLLPj4a1wnQkBcdtwgXKlOnD8xKYZcXcaOMEBGcA+lJOoczukPrv2CwP/yxxhQc
         AJFw==
X-Forwarded-Encrypted: i=1; AJvYcCV9V7DJ7Pq19Wn31iuRDPinehtz/oa0rdb2P9qiovjqkzk2SnwqGAEygvBtHUH99ZgBu5Ooeb6aiP1wHWo+bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGhnvkzk5HvEli1wsPuVPDb6TVtAKNv1RWYtls1fQ6beaRenlH
	7gsPn/B2tSQ266o9HkdleUTR74MVqdKmJd0u/2P/bZZIxncCO+GPdqw+
X-Gm-Gg: ASbGncvQMtZeuZhgqnJ5XAzdT1uzHiLWe4NaaRwbT05ouc4sk/lelH983ABY2DIY7IP
	KjDnYv/QXYxzSWR3xLgeUk3X889zEuf57bZhGBgcvJ4G5HgDJwOMLAj1TxCIlqktaROdYs9Eg4s
	/i+i34ksILfkVyPYhscO/TLPq+M39uNQNWY7t/lY1+D60jVfP0aOD8yPvEU9kFE8l9vTMMJoMhq
	hWmmmyRLHYiw5yCFyQlFQHwA0FjIh7zaTtDOkqzMw0T1kkpZ5ckebpsiKEyP/DoM0pxbqxzAiaY
	I9uBXqUwDHQDW9pcctvj0EZ4HeZm6zW51wgoJnU12VMf8zJfoWbmsJIqgeSoIxI=
X-Google-Smtp-Source: AGHT+IEn/IaJIYhdydWeAN2OrtqXDUxfWWpFlfeT0AUIrP49SsXJ5f6/7r0RJEeAeUCczX1EkIwYug==
X-Received: by 2002:a17:902:ec8c:b0:234:8a4a:ad89 with SMTP id d9443c01a7336-2364cedc714mr28171725ad.1.1749708790359;
        Wed, 11 Jun 2025 23:13:10 -0700 (PDT)
Received: from pop-os.. ([2401:4900:1c96:fdb4:1ab5:9891:a855:515])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e71a576sm5963905ad.218.2025.06.11.23.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 23:13:09 -0700 (PDT)
From: Abhinav Ananthu <abhinav.ogl@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Abhinav Ananthu <abhinav.ogl@gmail.com>
Subject: [PATCH] cpufreq: rust: Use C FFI types in bios_limit_callback
Date: Thu, 12 Jun 2025 11:39:30 +0530
Message-Id: <20250612060929.28773-1-abhinav.ogl@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the bios_limit_callback function to use C FFI-compatible types
(kernel::ffi::c_int and kernel::ffi::c_uint) for its parameters and return
value. This ensures ABI compatibility with the corresponding C callback
signature.

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://lore.kernel.org/rust-for-linux/CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com/.
Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
---
 rust/kernel/cpufreq.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index b0a9c6182aec..7ef2f64d8f34 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -1277,7 +1277,7 @@ extern "C" fn update_limits_callback(ptr: *mut bindings::cpufreq_policy) {
     /// Driver's `bios_limit` callback.
     ///
     /// SAFETY: Called from C. Inputs must be valid pointers.
-    extern "C" fn bios_limit_callback(cpu: i32, limit: *mut u32) -> kernel::ffi::c_int {
+    extern "C" fn bios_limit_callback(cpu: kernel::ffi::c_int, limit: *mut kernel::ffi::c_uint) -> kernel::ffi::c_int {
         from_result(|| {
             let mut policy = PolicyCpu::from_cpu(cpu as u32)?;
 
-- 
2.34.1

