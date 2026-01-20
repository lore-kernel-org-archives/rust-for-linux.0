Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EB0271476
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768898345; cv=none; b=hFzRfNYGygH4lIGcpvqIxgLmE3lQJmPg9/hq/Zo9Tg6A4ysTgFOP+9i9w5cPINx/pKdpH4v/fBKHTTKkRNBTeVXvxQMkdRBe/4bMTgAzBQnCyNmGMN45iTKDFVtqRIMyAq27B4ogdv9BpnCGCs30ZvjTCsPQH3fAshoW5WKtGqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768898345; c=relaxed/simple;
	bh=XXyaKUhgqvvA+I8AbsjjOk7ctLZjW5eRB7YhvfSqx54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SrzPC+WR8YAfqFqfduYDXI5EYwEsFjglxyeNplTghWlFWRMuSZQC6bQLWs4WCuPxo694JQO4arNTzHevBgICs5L4wAO48drtjUA6nWMQ0kWtejfkP1DSag3nKXqqHrNe2Mm1hj6zzpGzAmPzLwRG1XjPphSHeVMjUOlN80Cz+wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso32078435ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 00:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768898343; x=1769503143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o/LFVsId4oZbrPaKvMdkJkxerPhSS0s1jsJVMY7vjtI=;
        b=mQ0Y6rZahrR6LWMYGhivo8IvKSh8iuDpNkh6KZ+RZgV4kN+FNZg8KnvMCts/LFK4gT
         1uZrvPg3p6zRP+7YGYqtHsZ5Y4QjYrMjzScDld0PvLRhheKRjA1Rf/nVoRrm2vNc4P7P
         RZcPIYK15ZBu1YwvnRTfPZy1i4yqQWrTc8Y5+Fwvbgw2Z7V1Su+90HJ0gKxNZ8T0etV+
         mzj9N9EJNTiNX/Jw7lCjx3/Whf9TJLV0d09W6b1Ahsw8ElscWaTuKZOxgddETgUxJaeH
         Pcxd3smXb+4dPALp63sTwI+NoiAM/hKbom84isZng4Hd6w9CeWKDa78n1Ndr1kJ6EQnJ
         q9dg==
X-Gm-Message-State: AOJu0Yyp0ZU1EeCKbe/pljsh3NhuvbQKbQnTrNhnzEoPL2QLEMOZ8vzO
	oJcj9/TvBHvSJM/ZjRTuZADd4BKsnfUK1Q2assmwwOPgzUwkWg7XJgCKSZmJMCwOGTM=
X-Gm-Gg: AZuq6aIhU8VE7cWxQyduM7j3D0XxKJytQx1rja6CPoUEtLcwj/wiGmPJwPdKX2Meg9+
	cKSJzOr1QLES2hBCDvMMX4Ni1jwosX6qaXdmXchN+wQGBQYG7+MKRWDfowakV3fsZBu5p1IuEPI
	1iMuc/Otto1/zY0SRiduqlHxe4utWxhssOOS+PNXfLTtp3XR7ND1+LMzHvD2/aKVec0L3apSJox
	VdPb1yJHyLYupZuNVY2K45e46PyqHLHvnDwaIwoGxl3abRSEjIGL/zM/OtO78Ro5KJB6SfidEU1
	mWHhBUE8sQdoq3QvZ2ms4EvZejYbvgYbuiUtIGL9GI7+/qdbs/iNHkoRUUAjdzPZhQw9oaIVruI
	wWaCqMzpDxQAYRgQA1CWxjtOMxA0Vv6/u2Dby7BRs6v2wZ1nIWqzOss6D9ZQ9KLwqVgedXddOXQ
	7hr9X03/WXU5d8YrznGuU=
X-Received: by 2002:a17:902:ea02:b0:2a2:f0cb:dfa2 with SMTP id d9443c01a7336-2a7698f854bmr11443135ad.13.1768898343446;
        Tue, 20 Jan 2026 00:39:03 -0800 (PST)
Received: from localhost.localdomain ([45.142.165.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm115114625ad.23.2026.01.20.00.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:39:03 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: rust-for-linux@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v2 6/7] rust: pwm: use pin_init::zeroed() for pwm_ops
Date: Tue, 20 Jan 2026 16:38:22 +0800
Message-ID: <20260120083824.477339-7-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120083824.477339-1-sunke@kylinos.cn>
References: <20260120083824.477339-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace unsafe core::mem::zeroed() with pin_init::zeroed() for
pwm_ops initialization.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/pwm.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
index cb00f8a8765c8..da3ff73b6ea77 100644
--- a/rust/kernel/pwm.rs
+++ b/rust/kernel/pwm.rs
@@ -496,9 +496,7 @@ pub(crate) fn as_raw(&self) -> *const bindings::pwm_ops {
 /// This is used to bridge Rust trait implementations to the C `struct pwm_ops`
 /// expected by the kernel.
 pub const fn create_pwm_ops<T: PwmOps>() -> PwmOpsVTable {
-    // SAFETY: `core::mem::zeroed()` is unsafe. For `pwm_ops`, all fields are
-    // `Option<extern "C" fn(...)>` or data, so a zeroed pattern (None/0) is valid initially.
-    let mut ops: bindings::pwm_ops = unsafe { core::mem::zeroed() };
+    let mut ops: bindings::pwm_ops = pin_init::zeroed();
 
     ops.request = Some(Adapter::<T>::request_callback);
     ops.capture = Some(Adapter::<T>::capture_callback);
-- 
2.43.0

