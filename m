Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A7B2D2381
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 07:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768806208; cv=none; b=uAyDR8lVu/EleNIFFZZW/+K7kp8xM5aFGvQOLDwnmTtZdVM7wb2tRKiDcpTzVF4cyfualWiW6B0qcqElZQZCCG/aoVKo+PGzutnQt6o4MWSpmF61/qMHqpGWHZ1KmEEato0/m+jeugk2ODGVIh1KtRBpjJYAI2RBh9SyqRjPj2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768806208; c=relaxed/simple;
	bh=DnUvty5fEhmGooNNY41FoeTe6wQG9s3tqCjRUhwiopU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2+vD1cUs3+Z+j+hp8vU5iAU26p8c7qukWRuSLoATupDpHIgITU/uv3iUGmUZEm1MIfdHwlS97dfiOK4klOoF9mJyp8mh5vaHL58zgMzE/H4qQP3RVC1pVb3a524Yfiql7RqpjB5XJauQzQw9GeSknPpnrl9VjrRcqYGagYJyDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c227206e6dcso2633431a12.2
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 23:03:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768806207; x=1769411007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YfyjDzBReX2iUu5QOav6MpBPfhGE1pp98Ma8lGDieF4=;
        b=OWzSFgqz12J44jR7CkzGWsVr2vczCm/2335ZCB+J5bLCUqAigC1l5m7Knj0l7f2Ns7
         Ba9YV06cM+YRQGWqnmVBTETOH3QK1LUNFjwj+wPmDw0ePLGagUFKRIkLRe66a5cmLTiJ
         4H+n2CXCJ8Ul7XxtZVCgib+T5gcVqvS2NCikljq/lsno5gjbinAshBo2lsFcLjVyfCk7
         fy3X26aJDzl99aUNQ85gQD9R5OUmwcRAWVW0pvM3w1ZVFet0ouxTrxZ5dITWjfzT8kBm
         +ns9liVZfVmuJPiPLlvoyVfuGGhr9ZamTLk6WVKsU5k5FdGmoc+crA422oqMWQhg9Djq
         3TLg==
X-Gm-Message-State: AOJu0YzJ53eWcvN+NS3PGjztQShDHplQvtiEPX4vlYhQNzuCyuYqt+3Z
	Q9PwH71jAGiUnbcDDiJIGq5TmB0S/EMsNeWmWu2siXGsDwlin+utcQJZ0TCxMtQL
X-Gm-Gg: AY/fxX6K+D0qvAItIU5FEDA2jXMmAUtE8BOV3e5nRiwmRKc9e6672Bq5AA19SVWhReh
	cPoCquBqhgaBe8Iul7ta60wSASPrB/TJFpTJHiQWwhefRwOJujVg0ZX8RP5JBun+B8URynmHVmA
	J0Uu41WNzFvXainjIzH07anbEzvOGLoXzARqitbEB0eknElXfEn2sbg/0b3Ipu0sGq3VS9jSp/M
	0zfJUx8fNXH7XoCMd5c20Nr2mMaxkelFVr8SoqCnCfBhCylDeWi3BVuyhtd3DykFcS5oxyRHcDA
	DdBTX+chIqyGWZE4tO1xV7D6wut6lmtgeM1TB84Tx4vUOd1sW985bDyj0/5Mh3vOxb+zmfqFO6a
	CAaAmRGwZucKNNMc7Ja4SnpI46BFovIwNotpKCHJ8hQjPgLvfiiz9dGMnwtDQs3gcDNO8lzyFKN
	5c9Vh0HssAXD5tOqiRUC9ZHr3uCuPQJEj007YV9fWZbzu4CTshT3RHq38=
X-Received: by 2002:a05:6a21:1796:b0:35d:6bbc:e9ce with SMTP id adf61e73a8af0-38dfe5b7e45mr10011449637.16.1768806206886;
        Sun, 18 Jan 2026 23:03:26 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352677ec702sm812660a91.5.2026.01.18.23.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:03:26 -0800 (PST)
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
Subject: [PATCH v1 7/7] rust: security: use pin_init::zeroed() for lsm_context
Date: Mon, 19 Jan 2026 15:03:17 +0800
Message-ID: <20260119070318.1926739-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119065859.1914178-1-sunke@kylinos.cn>
References: <20260119065859.1914178-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace unsafe core::mem::zeroed() with pin_init::zeroed() for
lsm_context initialization.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/security.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/security.rs b/rust/kernel/security.rs
index 9d271695265fb..2410a3a75690a 100644
--- a/rust/kernel/security.rs
+++ b/rust/kernel/security.rs
@@ -62,8 +62,8 @@ impl SecurityCtx {
     /// Get the security context given its id.
     #[inline]
     pub fn from_secid(secid: u32) -> Result<Self> {
-        // SAFETY: `struct lsm_context` can be initialized to all zeros.
-        let mut ctx: bindings::lsm_context = unsafe { core::mem::zeroed() };
+        // `struct lsm_context` can be initialized to all zeros.
+        let mut ctx: bindings::lsm_context = pin_init::zeroed();
 
         // SAFETY: Just a C FFI call. The pointer is valid for writes.
         to_result(unsafe { bindings::security_secid_to_secctx(secid, &mut ctx) })?;
-- 
2.43.0

