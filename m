Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1EA7D416
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Apr 2024 21:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713563441; cv=none; b=McrhPvzMijb8mmz5ACJFy5RVJ/R6wgvN+eXkwpp0oeoxDOgflJ6gna5DOLHG2/DVySnAXZLuyOa+rWJCibY7L8UOLjUjz5k9DMSOsHOSGE1E9AfM7N9RJ4K75uCFWn+5oXSImqfdOPsTHhWu0Y3ji2TVZhR/QewMbcXz++ihhro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713563441; c=relaxed/simple;
	bh=41X2THZM0m/PaozZOPK0icDq/oigTlF9Yc9S1rl7otY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PJE1ZZAJD8kDpjhwNyE8gKb9Y/wNJApcZ1euz36QazfbEf+s/ku1NMrcj3cVEwiWfZOqDFD9LWa3Kk1TN9mxPg6tx2XVJBgmuD5UvL844In1qxsdmcjbrFu1v7vnyTkT2zKxjqdw9jQGM0RlRLvFlTLmEKNVr6FE8VFssh41MO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSPzbBbl; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSPzbBbl"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-36b0ae2b7d7so10195195ab.3
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Apr 2024 14:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713563440; x=1714168240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kjpa884W5eNLunv5pI5HFGaI1+XkenAix31SZAwkygM=;
        b=HSPzbBblFugNjqJQjGjpEDzM7GqoN40bHejj/t9X+GMwM/w3pjG1L658mrFEIPidMe
         DNe1qk6u/GHLK7Z+V4UwrH/GSVDuaBtHQ/1PORw4zi/ka1LTcRkZpP72oBexIp9zLApS
         GTqjsDI/+jEB5u7vMBpeOMKC+/x9D8siWq3+zL9czEFESdxS1P/4pd0XZqtVFHvp9og7
         tHJ2e07pNiNbk/x2FJCpEsUznOsP9btLTLxesUdoaYNZNToPbP8JLj2AviTNaczkRE36
         ha3UdVHdAlnbFD/ZfwWfI9c3j+VeO9bJdfsN9+qruLvHEjb2L6VtI+nyPI9r/Rnx+1PF
         vtkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713563440; x=1714168240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjpa884W5eNLunv5pI5HFGaI1+XkenAix31SZAwkygM=;
        b=tfyD2K1PK8L3pXuxzxfC4UM0bqoCeD5w8+61Vysx0fmsNmVGI9K4DfmuAlQB3yMDzB
         onMdNzCeQM6KWMfWdiVm4jRumMIoUGVLiMlcBAQLX/LFrvea+FoBJtmro6ZsLgZLPvxv
         Tg0xYVm8yXQHV60/o0vHOID3+bHVz+iZJubzg4KrF6a/YS5hV7OxXyk3zuECIxMx1mzu
         2Y7uPo7bbctHSh4jwSpqQbqn6hgm0lzdjSSFB0PlwFgFFHK3A5HJ6k95x1ktDQDllbhK
         amBizQKq+jRhPImn7lbqAeB7KNJRTKHvkJ8bZOVis9rbfbF3m96UMwMgIVmtDc6TWKDr
         6zCg==
X-Forwarded-Encrypted: i=1; AJvYcCUZj0pEvqBfDRwqYP2aP9w4eKn4W2GaKaWlhUsfAG1rn5PQvpFVMsh9OE5CUs8hsTCzrHxaQxB/v7RuqGmaHOw7ZWZ1ACWV/SaW/nMBVJo=
X-Gm-Message-State: AOJu0YzJbCD1z9Gfe90wCCyhlRiBg1wvsNY5qw+OAbYiJRHvEq3NUVLa
	hT4KVrY7gM84Mi4NnDWnZtFtN2CsBQhaMmb77IOWGHtfv2h4jEnz
X-Google-Smtp-Source: AGHT+IEPr/JwqVyTr88cV4DWuVJbcysYg6MRNQC3YhW9uZSMbupllsMJDr66zeqPVUOprY9kio+CeQ==
X-Received: by 2002:a05:6e02:1e0a:b0:36a:3f10:7ef4 with SMTP id g10-20020a056e021e0a00b0036a3f107ef4mr4387662ila.29.1713563439781;
        Fri, 19 Apr 2024 14:50:39 -0700 (PDT)
Received: from rust-for-linux.vcn03240917.oraclevcn.com ([138.1.69.80])
        by smtp.gmail.com with ESMTPSA id y17-20020a056e02129100b0036b37f8b2d8sm971281ilq.51.2024.04.19.14.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 14:50:39 -0700 (PDT)
From: Aswin Unnikrishnan <aswinunni01@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Aswin Unnikrishnan <aswinunni01@gmail.com>
Subject: [PATCH 1/3] rust: remove `params` from `module` macro docs
Date: Fri, 19 Apr 2024 21:50:13 +0000
Message-Id: <20240419215015.157258-1-aswinunni01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove nonexistent argument `params` from `module` macro example,
because the macro does not support parameter list right now.

Signed-off-by: Aswin Unnikrishnan <aswinunni01@gmail.com>
---
 rust/macros/lib.rs | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index f489f3157383..520eae5fd792 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -35,18 +35,6 @@
 ///     author: "Rust for Linux Contributors",
 ///     description: "My very own kernel module!",
 ///     license: "GPL",
-///     params: {
-///        my_i32: i32 {
-///            default: 42,
-///            permissions: 0o000,
-///            description: "Example of i32",
-///        },
-///        writeable_i32: i32 {
-///            default: 42,
-///            permissions: 0o644,
-///            description: "Example of i32",
-///        },
-///    },
 /// }
 ///
 /// struct MyModule;
-- 
2.34.1

