Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E9F3033F6
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 14:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154437; cv=none; b=HandhMUoZyZMo+4qd/NJpjFTdROLVfb+w027dVwbC847feKu+WrN1ZGY5ediLEICQlMJl+AlJgl7eTe1IVhkm1oQdiX3j8OcZZwlF7wqfCtjWa5KWplKC21pBg/aoh3cGPzykueyDkKbYm1cXFCHOdEb50FdvXbIH9jOonXGWZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154437; c=relaxed/simple;
	bh=cY6DKEz6B6F9rSWVgqrMMhttMqGc5V6Xd0spRFKA5+0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZApiujlF/cIJKVhPkP6VNZ6a2IaAbdNdFHFo0COaaR6N2OkB9CCXLhPtske8fL7rdNa0wA4lgBI4K6LCkb5uwhkWghq3x5HmqKz+rrXI4YAzBHZCqAwHEu7MXjTv64P0+W1FFJCZ5Bd2rwh7Ai6MD+5Ps8fozq1G9hBzqNGZzsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZG3zkdFT; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZG3zkdFT"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-661827d7a81so4575233a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773154432; x=1773759232; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LXxRsUcVZGooITxYkuZC3aEN++rGhCtcSjN37MU6sY8=;
        b=ZG3zkdFTdLn2A8uGkkKpKvmVvXjkJc9z+lKfHHNsKBjRAkSEQLgII8K8RzarRzlIMh
         hwGp/mxVrxmWL1gICJe4qlZkR0R0WrsPwF7c9OrDCnAcR3OGPJHuWfrG3C3wmJm303oZ
         0XitoHyHNCLX6NlGL/H6UUd0TUvRyGUmVfVT6CHjzvsBR+Dt0vGzrnhzUS8MJH3PCOG2
         etuzwCzk08KL8JPrLgSUidAocl0fR4D6IV36rJBSP9WeSWMCd2xGJyOFt4hQvhO2aS+O
         OBK3jkKFeRFIrjxZ2dP5nEfIyslUrpM6u5HlzyW4gEG06EFaAdV2GVoH7MWuPgOpXrPv
         hVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773154432; x=1773759232;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXxRsUcVZGooITxYkuZC3aEN++rGhCtcSjN37MU6sY8=;
        b=iyfYfwNfzL67REWPpirf5Jry7mFvLiSIjfnUAp9hyMipyC+c+ggDgwbSWIC2SMF9KZ
         Q6pq9LwG9w+Q4IYYuL5VUzV7rhXnimsaYpFaywDceIZ3N4VfHDw5zVCdWjrNtekzqE7R
         Ijboj6yjkBQW6NJZcwM5Eb0rXxeK/znB9onX18strxeE0ZcTZek4ymFb/Gg0v94GVNSZ
         spIe+56j0h7wcxgZHQgP6DIML3PbySQgRiMF0dBMtXDklAtP8ZFdFTJWh4G643uSSZ1s
         R7YToNOyUyGLdaTH+Xj1Bz0zI0Naf4IQ3nRsrP0ZNUEQshAXKEV4+W+kIWiKynnFFmE6
         yGJg==
X-Forwarded-Encrypted: i=1; AJvYcCU5IaiGaFNDXEaX6VzcYfdeWY+Kwd5o1oSMwqNn2c7WWo9dxeYPbGxEi2FC7jAOSpACaSbyRRXluKDM/cM0Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsUjhT8Xqv7qDZj/WLiCJuKc0q/wqvatmF/3Ie1bmCRfOM2X5o
	+aonOHNhcfgdPQ4NkoFi9KgdPqJxvCGXqf67Z0LfrMbM4zVZvvG7umDAC5OxTOPOGdTHgNTHVWO
	InerefeJHyzB8QxUHEQ==
X-Received: from edbgy4.prod.google.com ([2002:a05:6402:5bc4:b0:662:d4e3:3c3f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5297:b0:65c:5def:26f2 with SMTP id 4fb4d7f45d1cf-662ba75c08cmr2251051a12.11.1773154431614;
 Tue, 10 Mar 2026 07:53:51 -0700 (PDT)
Date: Tue, 10 Mar 2026 14:53:41 +0000
In-Reply-To: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=cY6DKEz6B6F9rSWVgqrMMhttMqGc5V6Xd0spRFKA5+0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpsDB7jo28XWHraaIbZEs4ZPiy/1gjlkLBiQ/rz
 rz0Yb0G+XyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCabAwewAKCRAEWL7uWMY5
 RmUwEACQk9pcbTkR4VN+emXNH4WS1qlo1JojOLfRikbe8ojkFYZm2BZbxG26HFPzMVV+1FnpndX
 O1unZmK8CcGYNYGk080M41kDzqgpfgW8aoM4yvwmEJbFTvec7I6r8vuXf18aRrQSdPK7CfhVxtc
 BSHYd0aTmhoG1lyvfE3PeW9Aa65hlTpYLPdQWKqcutopqBvEphxDaixoFKme06L4u8Q6vZga23z
 DNMLw+2o/XEIP8J2a6q1Z/0JLi3FY5RJu9vDQliw+6qBCx/27SjZigcTdVz8XCNgz2Cju/QI7GR
 Ju/WLkcjKQaY93xN36FJlaIPZjk0synEAC5bBsWf/cHNMhtsQUfzff5FIojrPSDTdabifRgQ+rY
 2Dp4uUPf+XFhJFCtTePv+rD3M677OR2aMfE7baMLnUBqYxn+dJezj2UNrUvK5j8YU0ROfDeovIZ
 t08DmScIf6s9yvT38uIXQrbLITN4UE6s++Cq1xHuNkHY3FyquLohKUlXSfmeEY9eBcpvU4v97Rj
 kdAIJW2JFVytog4ICUz9J6iQ1OGbVQtG/NXnNUZjVsEIn5xNLB5VVHV5a3NE+f3utJ5SDmHGmLl
 tC6KvoUyWmZEDNLsK5N88GQ180bdz1agD7tFjZb//49fD7UTuGKIPsWLRMtyIZx7Yk7ZS/JPWgc L/PQNYIbYDypoxA==
X-Mailer: b4 0.14.3
Message-ID: <20260310-binder-crate-name-v2-2-0f7c97900d36@google.com>
Subject: [PATCH v2 2/2] rust_binder: override crate name to rust_binder
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The Rust Binder object file is called rust_binder_main.o because the
name rust_binder.o is used for the result of linking together
rust_binder_main.o with rust_binderfs.o and a few others.

However, the crate name is supposed to be rust_binder without a _main
suffix. Thus, override the crate name accordingly.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/rust_binder_main.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index aa5f2a75adb4..14162af0f5a5 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -2,7 +2,9 @@
 
 // Copyright (C) 2025 Google LLC.
 
+#![crate_name = "rust_binder"]
 //! Binder -- the Android IPC mechanism.
+
 #![recursion_limit = "256"]
 #![allow(
     clippy::as_underscore,

-- 
2.53.0.473.g4a7958ca14-goog

