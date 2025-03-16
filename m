Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A2819D8BC
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 06:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742106054; cv=none; b=eRtE2ehnNcnoqKxpm01+z3wZW4A8UxdtLKCU+1f0cwmkrI7PDxcnikVNjRye/tfvI+AYGGjKNxqdtUnSxVztY5lqQozqN5dDFSHttWzAH3fF4LwW4A6iTkhhFwIFT25npKNhtnpr1FMHsQUiQVcNJOR0pkvcJwwBu3X3q/QuamA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742106054; c=relaxed/simple;
	bh=KX3jPb+KdnhH7zSY4q+3YOyo/PiTXXKWO80j/bq2BPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oIutmdhnAUVqZNbvK2dbTDm43Xii0VbmuQfUZbDa2QKlhlVzoCUyomwjULvvaxFllLbQPuK2IzhcS/NO1elWaGK9FO27aUo70xbWcBDc/sgy6/OawrQMzvmm5kvU5AN7gYxbJvbSdN+6KKH9B1BJiI6icN6v+GmCRDtYXrMhS84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=Ghri5oND; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="Ghri5oND"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e639040ec74so3924496276.1
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 23:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742106052; x=1742710852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoSNx//L0CoaxkVlW3LsLIXWFgY8SicS6A0ILg7Zsv8=;
        b=Ghri5oNDcCXP0EHFcst+lK5Um5Yzb28c6U91m7gaOb0SxYhqhDiOAnwugJWS8IBoej
         Gvo8rQ4ntv1hMJb+svoJ4fWN9Uqyo1B+U/iBpDt+hVlCA5fQht+5AEHvO6SyNXHdLz6t
         sYTQWdU4DA/NyHSowQpR0Q76wtSPxPg/hPai0HlVA2G0HBywSdB5d7L7MEZmOFKajZ2b
         t2OSsI3dOvPf62RWAy9WoW1QzLD55hxPQEXmR2EiYn9OOrNh0GVogDp59groGpJ3vJHJ
         GDJEYkAeadKVUp9MJY38ORlI76wJn/wJaxWcTTtI6QZDiAQhyaLKFpmRzF61I7176uHY
         EB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742106052; x=1742710852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoSNx//L0CoaxkVlW3LsLIXWFgY8SicS6A0ILg7Zsv8=;
        b=Vw0PY7Ppro2VPxEj/mfoBkUfwW0SzA85alB7Kx26JLjlS4FkHZFEMFYL9XmDrbecKA
         pUlWfpYlVoDT8K6Lb6vRI3V4DrKG0W24ibB3T9SdPjHtTe5lV0KPRVUeSLl1wCuxIDRu
         WfOn6ARy7tboNgKX9dCpdsJ8k/+r0H1EDZK0zC8dMsYFe/tnGt9iakdeC5nPygbveOfs
         UEvFLf7Mxd09pjPE0gnHABLG9mtBJFg2fnj+ffr0qB4Oj6aUmJf3UaYhj6IakS7dWsB4
         1IK8kb9ZHrlFyPSOMw/Rd/hdiRqhTc55bL72//Zf9leENbTF1SIYEYuAyEiOptuBqGwv
         TViw==
X-Forwarded-Encrypted: i=1; AJvYcCXtMFbdpQiyRWmHEt3wtOasCIis65JlhlKcpqrCEW/nD4TF2c0hJIfp3fGyQXcaKwB78ZWLy/CDqLlKMZdaSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1QQLNXv7VatMGNdjCrrhAOxahtTJXzpP9O6m7UZTLiCr/w0A2
	fimQf5+p6FIrIur1IJhqn8kqkTXYV4ZUUmyZdaJtZ3ZyP0r1k42BaIxSSXr+ZR8=
X-Gm-Gg: ASbGncvNDTP1JYlVhTLTNFU4dRMc+9Mr19BGjsofHv/9VTicrwuV/t5Brvm2hLQHZfA
	YhguTXclRApALRwnFn4+8TlSJtfpUCE7AI/1vDhHGhbDLix1h0uLFSVimEGo8eCsI/1BiQKzq8e
	FVXdE27tcCaWo5fY+9glDXOeIakOgcw/8lupsIyWaQ6X0+Tc7jxIHpX1j6+d0sEs+YYXjP5c5Bt
	9V5hxUaRWUM8Ufbid3LxEuOKaSa8PO5rVhCSv7n9cKnnn9wPOgwmSc5os6AbK1KVw35a/jpIbdl
	t66uxV6vjbPfRIE1gkNwkBHy7rDq/S943FHAKJ2Gfc0v2NY2n5+slN1d+65BK0/3dPKz8oZdFaj
	68rFvq1nNXeHgw1zNwxft4XqSYH5JXg==
X-Google-Smtp-Source: AGHT+IFSIjA+P2B+BI21ghjlbCWIPcaxEXwFyOsBLfnkUoZXHa8ieEB+f05Rm6wSnN3mOs2lKgytsQ==
X-Received: by 2002:a05:6902:490f:b0:e5d:cc35:3e2d with SMTP id 3f1490d57ef6-e63e39c6b3cmr16371780276.4.1742106051819;
        Sat, 15 Mar 2025 23:20:51 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e63e53fd277sm1618673276.11.2025.03.15.23.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 23:20:51 -0700 (PDT)
From: Antonio Hickey <contact@byte-forge.io>
X-Google-Original-From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/16] rust: fs: file: refactor to use `&raw [const|mut]`
Date: Sun, 16 Mar 2025 02:14:23 -0400
Message-ID: <20250316061429.817126-15-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316061429.817126-1-contact@antoniohickey.com>
References: <20250316061429.817126-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of!(place)` and `addr_of_mut!(place)`
with `&raw const place` and `&raw mut place` respectively.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const`, `&raw mut` are similar
to `&`, `&mut` making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/fs/file.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index ed57e0137cdb..7ee4830b67f3 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -331,7 +331,7 @@ pub fn flags(&self) -> u32 {
         // SAFETY: The file is valid because the shared reference guarantees a nonzero refcount.
         //
         // FIXME(read_once): Replace with `read_once` when available on the Rust side.
-        unsafe { core::ptr::addr_of!((*self.as_ptr()).f_flags).read_volatile() }
+        unsafe { (&raw const (*self.as_ptr()).f_flags).read_volatile() }
     }
 }
 
-- 
2.48.1

