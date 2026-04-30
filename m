Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30031377553
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 07:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533683; cv=none; b=Rv0pY9qZVOEQgEiuiq431GcG3Kbf/9LmV7gAMqN/wkcjWLG/X6RXg/S6vm8IvWl35+7tVY5njty0DUWiKa0rxd8nMcFTPw5yqd9Cuej6sGG3TO7sIp/FgoKQ0RtZK5XxgFs4FexzZJFnPiNjWW2iBCHghLrKq5lUi3+LWW2Q4MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533683; c=relaxed/simple;
	bh=i3+WLAKfAX+e6Ihn2lZUEvyidiW3sc/I2J2M/ndOF9Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=uPEd37LhlORuQxcsxxxc3L/3dR/kk+f/NpBMVLS9B9hgIaXiRKl9pG7GrFY7KjNmpL1JNbN19KxLKBOQ3A1f2mznZHfsvC1ZaRC/WfON1hZyANtm+s+OUUz09WY85C03cRt6WmifbAr8A0rmc4b7yeoI/0gBCMzWBD0kV0avcE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pXjhJNzn; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pXjhJNzn"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-824c9da9928so290342b3a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 00:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777533681; x=1778138481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GPGHrVasPB+CXaTZu+4tkkYEz/qnx98TzFtc857Z9wM=;
        b=pXjhJNzn7Pb4oVQBzZiFzoQiNQ9O998L3UWnTsyz8GlmhnoJa+CU8fyWOE2slSW6tI
         Y7656gi9h6O9IeRrwJV2WtfBq5jsRSsLxW0Z9f4Ezuh6KnDEeyaUwDhSywDo1LVdB+s2
         eXHl3U5ZIV9putW8gRQjSsBVvRlxkm3uzQ+dqd7erLQD0c+jmLRs/Adv8tTj4yUsq3x2
         zY/Ry/VQLXJ5LtcQU1/loArd8/LMwEol4bKE6PHsZFO/tg933qwseMs5ZXvnO3/KCvQ6
         PchTOPkjILOZbvgylvW3hXP3LWUSSBZID6LZfrsCDZrky1tgHE0x1pmBsjadNJ7eh+aQ
         rJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533681; x=1778138481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPGHrVasPB+CXaTZu+4tkkYEz/qnx98TzFtc857Z9wM=;
        b=MqqNVkGRqT2qGOGOnWLHLAQ/ee/HOj6vijvP526Ry0IW65DTGYNFfEpQx+rVET18O7
         zzC17PgBJ9cIUFQVFqFDD33X9RPFDiBUtddKkNX3MCAUlU0uIc9MOwrT0BROA9ODXa2u
         ONzcJaLiTjMt88aZ3QNpM71GI+Uv1V2QZoQpP71hOE+QYXTfwxjtq+ntyNl+1MCWsfAf
         jMVtGfZylefexb+YVdcykx+0yG6Tr1FcmusjIaYUMhuSp3p2yYt/9ifV4LenG6GvPBLI
         +Tg4We0fJnUYEDBNwwJGfeAISnxDGqjDeZjJqX1fwH+uj8JKnjj5FFsfdlBJCbxwfFHJ
         aeBA==
X-Forwarded-Encrypted: i=1; AFNElJ83/vBVYTsUfqcEwvLkNZ4eguDMNfiO/UxXaocTlrjOL9sm/X8cDd1SXJcXZDI9FbRPtFuQY4O1WzaZo84LSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjMkdl0IIgdxnRaROfOn/gLZUAFYXce5zU9kiv9nK4J7p8woLg
	kYNtkKGx/JiEzApErqNmJJOiE63k/Q00wVfwLc0Dqsw7Q9QwxsKEOQRV
X-Gm-Gg: AeBDiesnONIVVqtii6sRrqXjo051CNaNBoJkdtF+YuNAWGG1FUwOvYcqTW5D9Ytg1Ed
	3wneV0WfefsaVuY04heQty+NLBDA9Aebku/kHoau4/Aa7ySua/d5c/FHCAEsVLLgfD9B6/Kyqvb
	2MQPLxFDAddrxP5L82T3NvH3mrOghCYhSP2umZe9TZqy4GfD7fHXWeuPwcY9klLUve4dR8J899x
	y/9cS7nRdWdeuxsJWTLMi/VkeerZgYdOokf7nLWF6X2X9fvt3eIJJ0tgGzkhz1pN3EHOnkFechl
	hPzkALw+tugC7rbRuYWZO7ze1ifVzQkPi9AKBlQCCg9iK6Fm+46mtiU8HVf/ZzK+jnQIQ/Mn52j
	tUzB8T5yFSdyeB5npZvriKpg7M27GeLpJ7q72QS1Ac+fii32UUjyWAFv2mz52PppZ+e6b1YQaOj
	sZSljivQAaOt8F/NBajNmigzcsyxsLTcIsSDrmu05ZxcYe4It31Ws=
X-Received: by 2002:a05:6a00:1d94:b0:82f:52dd:4446 with SMTP id d2e1a72fcca58-834fe25dac2mr1882826b3a.45.1777533681515;
        Thu, 30 Apr 2026 00:21:21 -0700 (PDT)
Received: from Nighthawk.localdomain ([223.178.220.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5cd3b8sm4593856b3a.16.2026.04.30.00.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:21:21 -0700 (PDT)
From: Sagar Taunk <sagartaunk2@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Sagar Taunk <sagartaunk2@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rust: workqueue: replace SAFETY TODO for `WorkItemPointer` impl on `Pin<KBox<T>>`
Date: Thu, 30 Apr 2026 12:49:28 +0530
Message-ID: <20260430071930.73696-1-sagartaunk2@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original implementation left a `SAFETY: TODO` comment on the
`WorkItemPointer` implementation for `Pin<KBox<T>>`. This patch documents
the safety requirements that make this implementation sound.

The safety argument follows the same structure as the `Arc<T>`
implementation and relies on three guarantees:
 `__enqueue` strips the `Pin` wrapper via `Pin::into_inner_unchecked`
and leaks the box via `KBox::into_raw`, producing `*mut T` whose
allocation remains live for the duration of the queued work;
`work_container_of` safely reverses the `raw_get_work` offset arithmetic to
recover the exact `*mut T` that `__enqueue` produced; and the workqueue
guarantees `run` is called exactly once, making `KBox::from_raw` sound.

Signed-off-by: Sagar Taunk <sagartaunk2@gmail.com>
---
 rust/kernel/workqueue.rs | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 74c59f2b1c09..676ade0539e3 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -881,7 +881,15 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for Arc<T>
 {
 }
 
-// SAFETY: TODO.
+// SAFETY: The `__enqueue` implementation in `RawWorkItem` uses a `work_struct` initialized with
+// the `run` method of this trait as the function pointer because:
+//   - `__enqueue` gets the `work_struct` from the `Work<T, ID>` field embedded in `T`,
+//     using `T::raw_get_work` on the pointer obtained from `KBox::into_raw`.
+//   - The only safe way to create a `Work` object is through `Work::new`.
+//   - `Work::new` makes sure that `T::Pointer::run` is passed to `init_work_with_key`.
+//   - Finally, `Work` and `RawWorkItem` guarantee the correct `Work` field is used
+//     because of the `ID` const generic bound, and `Work::new` picks the correct
+//     implementation of `WorkItemPointer` for `Pin<KBox<T>>`.
 unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
 where
     T: WorkItem<ID, Pointer = Self>,
-- 
2.54.0

