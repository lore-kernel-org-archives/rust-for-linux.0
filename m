Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44878193402
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Oct 2024 10:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730284303; cv=none; b=jUwx/fQo3zb2CmKzLav+7DSjlHPy1xg3VSWpITtXOSHwtThLSu9GAm8WppzVPJKW9UJ/x19yZeQva1z8UzYCeJvzme1YmrMpBTO9IliCPXye6dEZIHaOjt8in1psn1WepRwde9oH0Q35mGBRPg1JgRedWirm+teFIvB8YJFZ2/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730284303; c=relaxed/simple;
	bh=HJK67huFrgBbh0oq3D9/SSpm2m6CsdbT12PbWndMQ+Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ff57xCI9dr9cLyIZZ7zTdHU2l6cdCg29k/kXP6TMWoPUV6RyUBF9uCJnb1qJkyA60JHYOVo+NagsTLCtFy1OehOoJSkFAGc6s3W6bFCDqSRWNXUu/x+mvzGnWHlonFccTttdfNKL53nudS8rmJmug7ZLk4yrTwhlDH0+xufi7r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C5FZRHHx; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C5FZRHHx"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-37d458087c0so485690f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Oct 2024 03:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730284300; x=1730889100; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k6MdjXaWjXuXFvZiq7sXgM/XS2xMntv/yleDKxQ87K8=;
        b=C5FZRHHxz8Rbz0bgu5Nx8pNogVLAdrarxhBwmhIFwta7ovbYmK1Nc+8wr6GXxH+9C6
         mpXK3ZfmnOQerpI8n/iROXbfmaL1iYAPdbZdMhMfsKjdhskqGmILvmANOEYGybxZodYm
         67FER3Cbt6MBEITvUweLQFK4IhLtq5+bu6DUNBcThZ1UY7hJlP9zTx72P4PrluGm+IMU
         AKimNlmXnV7lAIX3BpHuloc30JYVZjO8J8q9nV9NWUa7iFflmdfTl4pZKGWhnpBejLAj
         ZDwr3V8urj05wK4tiktBi1oHdlfCs+RbS0L6aQso97rRQBhxoUJ0yzAPmDrU8OoQnj8P
         hpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730284300; x=1730889100;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k6MdjXaWjXuXFvZiq7sXgM/XS2xMntv/yleDKxQ87K8=;
        b=kpTHWK7BMQvSg8F8lCdKBWJZ/+EOESx3ggpg48la5htVjjBnSKCkQG71ruPnfY5PFQ
         PFTQXE5bwqu2mjg1YoaQecnEwVHhozDYxuz2A+dZx5xsNeL3e6MLegg+8IeenvXFVn+1
         VmMcFwCg8yVOxVzGIk5ANV0Ew9FLCKF6016PA3qW5p9APyg+1BFz3V6rDKd2bidyHWoc
         7s5V/fsUjOqrDz4Zx4DQwfVeDu5oCD45cHi+MIzPxQlu4MnUanbENmEcvNYhwlQRC7zA
         IFO6O90Up9XQcMsxyMp6ZjeNi3/zcAcP9zqbMnU2m/+GcCkH31zC+e0BTiIalf70eSk+
         ZjFA==
X-Forwarded-Encrypted: i=1; AJvYcCWWWNP+AtS7p6ihLQc8i7uciAEekfiWuk2s4V7If0N/HmUYdB2hLvqz4IPjV+pxMNTSAjkuXxVFQeCpX5xGcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzGRZz6kIXOWfIu3q1w1XPJeli/8fxYmqy/NZpR33uQFnoKxl0
	hdvBiAdqEp8Cp8e0wS5zOJJM2saKgVwO+vTS6x9NcY/CjUJd4Ii34KTQb8zsCK2ezjFwVu9MfQy
	7dWIlLTb5s3l5OA==
X-Google-Smtp-Source: AGHT+IFnZQr30Y+M2jhTAmoir5ZrxKPXp/akJvD704Eg2oZKQaaz30lDM/zqxKc6KNIUk1EYIT5KPVY3MJkj4sQ=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:adf:ee0e:0:b0:37d:3878:ff42 with SMTP id
 ffacd0b85a97d-381b97ee8ffmr2906f8f.5.1730284299740; Wed, 30 Oct 2024 03:31:39
 -0700 (PDT)
Date: Wed, 30 Oct 2024 10:31:34 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAULImcC/x3MQQqAIBBA0avErBvQsSi7SrQwnWogLBQiiO6et
 HyL/x/InIQzDNUDiS/JcsQCXVfgNxdXRgnFQIoarYxCvwiKd/uO2mqDwba9CYEcdTOU6Ey8yP0 Px+l9PzrYWaVgAAAA
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1882; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=HJK67huFrgBbh0oq3D9/SSpm2m6CsdbT12PbWndMQ+Y=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnIgsIDkprsQHnquBzdddO8VG6yBx2gIzt/R/V5
 lOhbSIB5+qJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZyILCAAKCRAEWL7uWMY5
 Rg26EACVKjteAW4c2ejRnwDxOvD+WRYhuqP2MXBTJDi14yPKpgXf5UV7MXboKuBCpFJJuOXVePc
 WBanDEMSZZFSxR7lvkXUZLLwJd/sdKiZ13Zkoa2Q9KletFcqEGPFU7TMU0+pa6GccYWOYSBkNjv
 pndYPVexIcfWKGapv5dJvqJl6J/l9qeMkGfVSUOnEJdVlk3U/5x3238QmhaWFrOwruu6FkVx/Ns
 u1XpYfQY6MxpgUJNVejZ3iY5gOdnwiB1/7lzkHPDiQUm1ceipEz2mXamJ9Hsn5ORv3s3En5YJNo
 8DOwVj9owfmZMLU8BKJ+zQ9XBN+6JLQmOJ3/u6BzzPYryBhL9Gn/Qs+b5h/KYFd6Se4xGX0GyiR
 1uuLVlSiE/TrT00Uf4UWqKgMw/UGAhBtybtQqO/cuWuvlgVysD3NIuA0Bd11hcOZUhtbP40ybBf
 Awn6DMPJjSm9Hzm43vsBAryKKeCEOjM34MubEip40az9Ts5LAjIC/NZBcpVSl0JYlLMUhDvR3He
 s79reSUwhw4CkZEWcrqw6plhWTaYwMwzaTGnVQujYbHobrvADtywiDPs5rDroCkdulGQ3sxAjRT
 7cJSvjVU5GReIi4IlrQZoHJDgrP72U5PZi0NXkvURae6I/UWJD0gIHNURf0wJi+uolSh+iHeOsy s/2OSs2/mRYqwiA==
X-Mailer: b4 0.13.0
Message-ID: <20241030-cfi-icall-1913-v1-1-ab8a26e13733@google.com>
Subject: [PATCH] cfi: tweak llvm version for HAVE_CFI_ICALL_NORMALIZE_INTEGERS
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, kernel test robot <oliver.sang@intel.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The llvm fix [1] did not make it for 19.0.0, but ended up getting
backported to llvm 19.1.3 [2]. Thus, fix the version requirement to
correctly specify which versions have the bug.

Link: https://github.com/llvm/llvm-project/pull/104826 [1]
Link: https://github.com/llvm/llvm-project/pull/113938 [2]
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202410281414.c351044e-oliver.sang@intel.com
Fixes: 8b8ca9c25fe6 ("cfi: fix conditions for HAVE_CFI_ICALL_NORMALIZE_INTEGERS")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 arch/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 00163e4a237c..bd9f095d69fa 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -855,14 +855,14 @@ config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
 	def_bool y
 	depends on $(cc-option,-fsanitize=kcfi -fsanitize-cfi-icall-experimental-normalize-integers)
 	# With GCOV/KASAN we need this fix: https://github.com/llvm/llvm-project/pull/104826
-	depends on CLANG_VERSION >= 190000 || (!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
+	depends on CLANG_VERSION >= 190103 || (!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
 
 config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 	def_bool y
 	depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
 	depends on RUSTC_VERSION >= 107900
 	# With GCOV/KASAN we need this fix: https://github.com/rust-lang/rust/pull/129373
-	depends on (RUSTC_LLVM_VERSION >= 190000 && RUSTC_VERSION >= 108200) || \
+	depends on (RUSTC_LLVM_VERSION >= 190103 && RUSTC_VERSION >= 108200) || \
 		(!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
 
 config CFI_PERMISSIVE

---
base-commit: 8b8ca9c25fe69c2162e3235c7d6c341127abeed6
change-id: 20241030-cfi-icall-1913-d9583dd2a27b

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

