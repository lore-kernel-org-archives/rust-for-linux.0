Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98052FFFBE
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 06:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766470946; cv=none; b=DHvbDZko286cLj2gm6wqZmdo4N3bTSmm8s2k57zuZO9QqFBs4vZMQ60cVgl9hYIwJmboKElo0F29XdY8ttNw+98iddzfeL+XDD5BIENqD1Wp3GJME6w4H3JRWSzQ6Qwj1m0VG3s3nE5fjS8QM79njPLxA8bi6Ou30RE51mqfxkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766470946; c=relaxed/simple;
	bh=vq8ucebWVJ6DbYpYIK7arrOivfQkS5JNvL7qnmUHjxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vo0pBklfKAPxjh+/4nIbIBN1EEOILxGkXsKB6iBm5L0hLvJZmTJFdMu2mayOZ60tHtyvqnNz88zxmzvvj6g6WmNH9mF+teKKzqSoeUYzSuEYDy3PmJuoLmT7CgIqhLJTqyN6DL+wQ8WCr0y8Azf2PCH+5CyCUC3U06DWnMZGq9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlUKelN/; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlUKelN/"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so3700995b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 22:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766470944; x=1767075744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A23/BwoPpl4iTyohVo4Yx1n36ioI5UQicIsC2zaHSQk=;
        b=NlUKelN/w+G795x3Cz9yX63PMg3Mc8s5XbIpcuiGreGjD6poU9IgLFOUVxPNzPrBSr
         9geSzlpBo3hdSszQZAPs9f1nroMwFd+o+KEvitlJGSqhcWGA4eexoR4Q5AcTlCvDzbT8
         lrLWTSppBEdjBXWqwkKsQcXWR1pta3DFBvTErkrlzZkPaopCcjOzClpNIfYt53iP4eUk
         QKFF2Gi1ZRimcQDT0Tz91rfthzqtBA5zYr41tZn3qp8rT+hVXjCu9/2E1qX2xiVxA+Jf
         vakSvdhGw+s7oNA0G+FBzUVEY3kSh99M2tK5i7+xc9oTxr4MVqb7g/OwEkSi1JgoFxhE
         De7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766470944; x=1767075744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A23/BwoPpl4iTyohVo4Yx1n36ioI5UQicIsC2zaHSQk=;
        b=ph4cBlLMpTfPDiNgJY503ZD9+SCjvm3hHpotwPTaYZ49VfQlavBEqJY6aPvtpqiSaB
         1NjYMnDlEjqhLCktJLdVUk2cQFOy23uvKF7xZwBprftT12P0GR7eq4aQbbv707uAO29q
         b9t4XvDnAqF+ce2S7ucdxIj3yEWPZQM5oSZCq8WpsoJo/XhW/Gmx56g6WqvbfkDqldG0
         lOHXE1ZrXY+yNGKn9WWJTQo1jXN0S6yQUoVADUfcMuQ7QQZXDwmigsABIAW0d0yrrrB7
         hZfWIzNcVVSSX4pUyHsVO6K3YAitrICd2skXR+rcQk1fGsvJfiBFIqRk7Ke0bXCPJoip
         njAg==
X-Forwarded-Encrypted: i=1; AJvYcCVYZFNqQ2w8m2FhMl7oq7J28dTY6JQ7iEulLCcuc6sgWVdkWHIBKGwlN3o3XZ5NOpHfvQvX6GBWSCZ+wgI2jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy9WlYI20W+8WkLKObC9mQnGIXt+9ukgizA6SzuQe5mTmtGOFR
	0FOP8NGoVrr2L8WftgQn+vCw5Fmn9ZIDq6r5lHuRcIaWZLeG6ME/5wDl
X-Gm-Gg: AY/fxX62mceKeA1+KLydhXyieUIlmmYaSDfueasQ6CorK4e0Fk9dtdxhm2UgF9QGlCr
	tXTKAi7Xq3qfRBGsaP2GFAOIYPGowP0uhP1mDWqbZD1N1iv2mNCvDMuXs/8KvWJqnvxdacgNy3G
	/JqNJDNncZFX1+kwiyCAaWdWcOKZgQJbH/tAec5hViDvmuqAyHcuz1olraDS3eHFFUyh2O2P2eT
	VM/6YbwbRy4uoHDk/ys246gBuIvMy236LK44cBWLED/AgCPI/23UIkSUx+eST44YKf8z1K86pw/
	iEE93NiJhgfDNor+0YkLypGg6AvNBW8Tg44UsXrWCBoqHY6h8txaXg6o23uDyXt+1lycsa3ttGZ
	c4sfpKJ5SmG4ZLUHnWqS3AKKAPmm+Uo+u1hrI78x//jSCRwkVyHuGd5WL9EVVlYzMSUszoB45CP
	oyqBTuT3hcpS4wH1FZ9Tf4cix4/5GPac+4AKGunnuM2n833XGwIj31Fnie2ionoQ==
X-Google-Smtp-Source: AGHT+IGvMPYK4zPqautqeC1L9E7p6nNIQWcfDo8nBZ25WN6eA2Xs71rF3b8hE1FBu7lelDSbpjhCGA==
X-Received: by 2002:a05:6a00:419b:b0:7e8:4587:e8b0 with SMTP id d2e1a72fcca58-7ff65f7750fmr13025522b3a.35.1766470943904;
        Mon, 22 Dec 2025 22:22:23 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfab841sm12395362b3a.35.2025.12.22.22.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 22:22:23 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v2 3/4] rust: helpers: Add i8/i16 atomic xchg_release helpers
Date: Tue, 23 Dec 2025 15:21:39 +0900
Message-ID: <20251223062140.938325-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223062140.938325-1-fujita.tomonori@gmail.com>
References: <20251223062140.938325-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add i8/i16 atomic xchg_release helpers that call raw_xchg_release()
macro implementing atomic xchg_release using architecture-specific
instructions.

x86_64 and loongarch use full-ordering xchg.

arm64 and riscv implement release-ordering xchg.

arm v7 only supports relaxed-ordering xchg; __atomic_op_release()
macro is used to add barriers before the relaxed xchg.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/atomic_ext.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 538e0b10a15b..a48bb632dc44 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -70,3 +70,13 @@ __rust_helper s16 rust_helper_atomic_i16_xchg_acquire(s16 *ptr, s16 new)
 {
 	return raw_xchg_acquire(ptr, new);
 }
+
+__rust_helper s8 rust_helper_atomic_i8_xchg_release(s8 *ptr, s8 new)
+{
+	return raw_xchg_release(ptr, new);
+}
+
+__rust_helper s16 rust_helper_atomic_i16_xchg_release(s16 *ptr, s16 new)
+{
+	return raw_xchg_release(ptr, new);
+}
-- 
2.43.0

