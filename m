Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9F530DECE
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834924; cv=none; b=EX4GLEl8mb5RPaX5Q88YBxUFbr4jqSHWuZhrrbpF97855E4Q+f/u9VF9jggqyNPgtRq3M7Ki19wXocAxueKJCliEB/LrGAxL4VN00ht12molhIC0zpx/Dz0YlaoMXCKK+E0ufKKoqZPIszcEs+KjhwCGg+Fdk+HxohFkiIalDhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834924; c=relaxed/simple;
	bh=3qpxref+fIz2xXinhbe3sx3733zbNSv6/Z2ffSx178M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k5d2qtYYO6i2L0LoRRcGZcrzFdGKptNySdkGMRCj0yQbnV1ndc2v3Tnsn52ZcQIHTVgxXZdOUkG3QLNQFqClnyUdsblpNUt4EEbXIZMjGIKmDIPuNd4slg/axjS+1YynpWQd7T1lptBHkMIkAfb6rcc/2PuEX4qf5zhZkskM+Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIElW2u5; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIElW2u5"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37cd7f9de7cso4748801fa.1
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 23:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834920; x=1765439720; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9GoQPHU9Mpip9gR91Y3C4UfAkxVzcGqXTOlsYo71eKE=;
        b=EIElW2u5jB6al2G7Hz4H+ICcnjJydJC5JEg8pDOmsOWs1WAHX+3gKmCLNjnbIXH5J1
         axb1jYI3oe7p0xaP7oU5IyB8yywm4dqcT+9lfJZGNJWPVDWh7hsZjEEMYKYzgrmxGfOW
         lJ8ZYfvYI2UlsYAn8/f+oqydj1qRGjmCk49x6uL9uIQfpbXU/VO/dQWU+myioW1H4iIY
         F4n7WtBZRrBefDZmEZoNvqA41zy1yUe7SQeb/ojksSIR/+OBaNByKJrydX1lcoVTMK5C
         mUVAUEU8lK5qGqgDtR+0arsJYcsi5IQBb2tLAXKOtPtpUn7571fZx4tRL7DcnANmwn+g
         dLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834920; x=1765439720;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GoQPHU9Mpip9gR91Y3C4UfAkxVzcGqXTOlsYo71eKE=;
        b=jZ+jkZ+rPqN4wNIiuy1+aK5FYOdNZo9M0BkVcP54eXBXSvN9NUVp0ARm515VbFGoYR
         dCi3/cBzQ/v5uyvS5zrtzNS0/Rn8HOpuM9n70X+NG5YZifZDNP3C0BMyfCqtIs3Sw3lY
         l+FZpPA5jW1m1ttWh7d10wlGivJWIK6+7H6sBPWPcW8Ye5DUL6IE8Ty8rmYg2ExVzGDQ
         F13s8xs5oT7Q4MhpsiM7YQLBqu/8d/ra4ynM0H2P9UIH27oLznsccAts3dw3ZC5o06+Y
         OVKTquhXgXTU9GCrIJ6FHKJqBow8tC7jSsuUJUX+wcpSaH4x2RbcILDb997a6gCPoSAt
         mtCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmbLYnem4etlWRF1TnQ9/OeJJ06S/Z4yzMzkKYTOuI9rzUJvs9E35/Q3sVT56lvPxsRnx8SPi6gg4dz2e2eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvApkRidWA8peHNN35aIljFfJLcl0/UAqD5Co2NQ9++p2mvZbX
	VhJTB0dqAlTiLv6gyCN0pxLdEwVhxk7Y3/SxcE3Xxj/fpfcu9YN95VDF
X-Gm-Gg: ASbGncsiexaz8pB93bUu7ZE7TE8J98+Pk4l3ZcznWTDtxJ6j3OR78f9JbWOv3Qrr+2Q
	EZICf9UqfjuMudyNe32BomCNARTaengpk1AU7I9LG+b5Zi8gZLBC8QMTkEAmF4lixPj3Cow2SZN
	43a2p1zq2llnTsLmlGjQBITrpgAKAWQT1/vGlkzgSpfdf+dGdZQZEjh55wW2JFyIOnmTJlgrJ0k
	0Q2G8bTdrL/2bMJ4nh8wGnuU0s6HTq9V8HE2aT/yqJPMKylA//KvSicd1gqvIoNPA9FM72hCALh
	rJm/PA8rC5tFG+BTB2bu9yQmngEeDDLgMlmJmpD6+C46U9qHzVP4Ig5pJA23R3oP3pRJv7aRRZ5
	WugjgCssg3QTBYdEt3kbYsBSQytyqcub2aFOgtT5hB85JdwGV2+KopSx5WIB1RW7VCUtS9A==
X-Google-Smtp-Source: AGHT+IHbKKwv3Cd14fMbRlzVZpxoDoNXbiyghddISZDjVQeIjBR6wf7cZ5tNAwGCF94LJdZf6RcGDg==
X-Received: by 2002:a05:6512:3f14:b0:594:27fb:e7f5 with SMTP id 2adb3069b0e04-597d3feb5f1mr1891895e87.42.1764834919370;
        Wed, 03 Dec 2025 23:55:19 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:18 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Subject: [PATCH v5 0/4] EDITME: RISC-V: re-enable gcc + rust builds
Date: Thu, 04 Dec 2025 08:54:50 +0100
Message-Id: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEo+MWkC/x3MTQqAIBBA4avIrBvwJzddJVqIjjYbCy0JwrsnL
 b/Fey9UKkwVFvFCocaVjzxgJwF+dzkRchgGLbVVWs6YvMdy1wubReeip0BGkTMwirNQ5Oe/rVv
 vH4A+U+BdAAAA
X-Change-ID: 20251204-gcc-rust-v5-aafcede31ea3
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>, 
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 Asuna Yang <SpriteOvO@gmail.com>, Asuna Yang <spriteovo@gmail.com>
X-Mailer: b4 0.14.3

Previous v4 patch:
https://lore.kernel.org/rust-for-linux/20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com/T/#t

Compared to v4, this v5:
- Placed `include Makefile.rust` under `ifdef need-compiler` branch. From my local testing, this did not cause any issues.
- The Kconfig function now only tests backend flags and has been renamed to `bindgen-option`, without depending on environment variable. Added a comment explaining the meaning of "backend".
- Improved the wording of commit messages and provided further details.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
Asuna Yang (4):
      rust: export BINDGEN_TARGET from a separate Makefile
      rust: generate a fatal error if BINDGEN_TARGET is undefined
      rust: add a Kconfig function to test for support of bindgen options
      RISC-V: handle extension configs for bindgen, re-enable gcc + rust builds

 Documentation/rust/arch-support.rst |  2 +-
 Makefile                            |  3 ++-
 arch/riscv/Kconfig                  | 35 ++++++++++++++++++++++++++++++++++-
 rust/Makefile                       | 11 ++---------
 scripts/Kconfig.include             |  5 +++++
 scripts/Makefile.rust               | 14 ++++++++++++++
 6 files changed, 58 insertions(+), 12 deletions(-)
---
base-commit: 559e608c46553c107dbba19dae0854af7b219400
change-id: 20251204-gcc-rust-v5-aafcede31ea3

Best regards,
-- 
Asuna Yang <SpriteOvO@gmail.com>

