Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B4A2236F0
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768806166; cv=none; b=lnPKCIkUnhm4rLmm1mNJbq9+7oXXLn2zoRcBS7OAt+KO7NFEh0+/4Lh0hA7v6dINhrOSUcoa7cdj7Kp817fBnS2BrLcKbVSezHFGmjMqLo1moRaAshmIxT8tZfwpiRNs/5noCYbutNCq8pMJe8skpccJq9QPW6mD91Fmn5ekcfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768806166; c=relaxed/simple;
	bh=SHZUF3VYHq7wC00OuhTM1/riEtwF8xDl9wAoaBaxtWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=isaiXp9CNayvLv3Lvq2+AVCyJoEw8fy0nQlx49L0CIF8vnGiT47h4FKjda37fkZwjgq4Sghv915zgKOugSvkwyCwrjIMbvgOY/8kQ6fRWa0tLrW11oT9wnNFE9VpNPGr43+Pb/h3bRxkej9cRty9JJc3yCfvqJEQsvn+r+O8XpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c46d68f2b4eso2459448a12.2
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 23:02:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768806164; x=1769410964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QK1gfTwgRyN5xSMXuSoAZuU7QBmAplLTdHI3ZMYDZnA=;
        b=lwKvAwfbV6s8AtJX+S9lup3ldlkkyIoK0CZmtDoqbksuRMed40S3v7iZZWYvss0fLt
         4dyNR5/E2g67I0bDEBljLHnqfcVYOh3T/CZLR6KDw1lz3xwXCHskA6lkmtKRPq27iAga
         ls47H8nvI/I2pIItRoSvFNX2gvpY/CIYdKynwrVE/3Hq+DS7WB/VcvwLYZLHIfDMlfgs
         IWMrkIvxM1j6zBQIMHxC0GcUIQmM/pGdM31Dcoa3nqD2QjNsyKm0agtrNNHooy6jedT4
         t4eIyIPvcQnieKKDSNQrWr4lidwoadsqopfUl2VHz6iRxerjeSgK4NZ/RbvzTRyx3OpI
         mw7A==
X-Gm-Message-State: AOJu0YzfEQvEeyVKHQTIEor7uaJ5cE7+NgH7bp+FU8k0SRK7dW4PV0kd
	YHgx9tgxz9F1c71SFBB4Z2ZRymXVssK9A6PfuAtbHJ24KK3L3xhAliO/M4YreilA
X-Gm-Gg: AZuq6aLg8GexXVBvxbHStttPcEsXEyQpNM7y5ZNA9uvBdWHuvGlL36wxKot0rPAWLOl
	BGSKWaNQqu5lAhQW5yFWH1dE4tzFYoYU8ZUHDtdVv5ssbm7NFzSuAQNWYuS38vNyWSC8Q3myn+P
	sPEQ8D+/GH0vjox9ro4nEUg2GF6lzh6KvR/ouS5DXf77+gUgbNiJeCz4LRGF8nunocOnh3WbbyM
	BPqidrNzhLD8Nd0aipwnxXfX31PAZbHizn/1OgetwAEkSNQs2aCVKqtL4ZbaTthPKqeHv2QwCPl
	DMpUuPalZTjbRpaKUpcSFE8UVDouy5M1hI2AfeC0jmetCNCW4ycTsh+xJY1XSAaLniE6dnswHyY
	9BXQXpUnv0WlKcbGYs28f3IzyqNbAkC5mlsX1B+34psYnBgLgEsHVTzsK6g5bQr/bh8Jqm5jfzW
	9VanZ0KxyENjc5EC3SvhMDXcIEmWSWtKFAYWfFuZL7v9aJ
X-Received: by 2002:a17:903:3850:b0:2a0:7fa0:7b5c with SMTP id d9443c01a7336-2a7176cc6bcmr102147375ad.55.1768806163693;
        Sun, 18 Jan 2026 23:02:43 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71940659fsm82353355ad.83.2026.01.18.23.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:02:43 -0800 (PST)
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
Subject: [PATCH v1 5/7] rust: of: use pin_init::zeroed() instead of unsafe zeroed
Date: Mon, 19 Jan 2026 15:02:33 +0800
Message-ID: <20260119070233.1924202-1-sunke@kylinos.cn>
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
of_device_id initialization.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/of.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
index 58b20c367f993..44b30c05d4964 100644
--- a/rust/kernel/of.rs
+++ b/rust/kernel/of.rs
@@ -36,8 +36,8 @@ impl DeviceId {
     pub const fn new(compatible: &'static CStr) -> Self {
         let src = compatible.to_bytes_with_nul();
         // Replace with `bindings::of_device_id::default()` once stabilized for `const`.
-        // SAFETY: FFI type is valid to be zero-initialized.
-        let mut of: bindings::of_device_id = unsafe { core::mem::zeroed() };
+        // FFI type is valid to be zero-initialized.
+        let mut of: bindings::of_device_id = pin_init::zeroed();
 
         // TODO: Use `copy_from_slice` once stabilized for `const`.
         let mut i = 0;
-- 
2.43.0

