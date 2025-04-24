Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD3921FF3D
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 07:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479283; cv=none; b=e4H9NUMnSZhvjaewWlltfR0a4/irplVD+yn1feysh8iFGDbvcNVrGtmPsx62waDeet6CPm8Nl51cV06Zw++iUlBViK3sMLqzdv3wWkceVbhwxB/lwOR/tmd3qfcS1WeqOdi3MF2wBvOzL3Ger2Y0lSqfQ6uiFWIrkitJfEeXm7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479283; c=relaxed/simple;
	bh=HSj61/DKHbscjrSxiKNrJbrvkTbOzS+iDBZfj2iqRRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qVk57qs57OscuzAud6aG98rmCIye62yyFkdQ+CScTa9dZNws2ATna2s4R1QhTFwUqFbRzFGdENNXNnmUnyxpByaMPJKxcq7y4hke5kR/mbIq1+SHCDW8Clj1DT14ApetcGOOxg5BsbAg9NyS0kgAaxFQM56one/gPQSkYOD8vsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ubg6cZpa; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ubg6cZpa"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-227cf12df27so6535725ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 00:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479281; x=1746084081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=;
        b=ubg6cZpa5Vo6Fxp4Uf4waBarfwLeXRuCfcO/4vqI+fldUtLeg3Xx22zxIpeTEkrUay
         HsuBdUC+tJ+I1kp5tR6Q0ZqsH/bfmJC3GzVbx4DHQLeyTqNYCSeaQWO8RoS7tNWAarVj
         cflSY0Nge5CjCiFk3STI8oQKDo/gdP18lAXiMQtn9HFxM1l5a61OFBuA940E6+cI3nuk
         YJ2AWET8CwN+QBYeHaHRu2AklzMluGu+JAmgYD8Z5PKT/DBxzcObMjvY7fKUdaCrqrmJ
         oSulIA8fMwbtSGXjDZ7bW/WAuTovz/takJJtL4SX5Ea/ERtDKG0IH5+tUqoFuA3AnCkW
         DdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479281; x=1746084081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=;
        b=Sv73WDel1vx7SEkoqrL9qVVvFxoFlS6LdT3EBg9B02DQVwTPrXlkfE9PWcugtcQZKo
         YuzSZrJqKSrC21JoA7gA3ddwBQ7cNINe5Rr52P1frSCtgyNfbBIDjVqMMaCb2LhQWsca
         qekQKzEqVxQGX/0pE0LDX2nMqy+4Ajt5q+Gt9uHIdWX6i567+Xa4MY+LTTUtWAGMRqru
         mx7E0d1yPgB/5xkjZOBEyzY1N4YkuwzIAnZ5E5YU/Rr3vpSaix56FQhEiiQw4ZOnuyy+
         taWZdKyUOT5tDboEi3saJYJ9YlvlU+FMCX3FmnTbSCfomrbmG7sOHNFtLcbtHvPPWz9e
         HONQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHJKllrUX6JAE4UrkDisNPUfQGkeHvHXk3ePxW5K5lBYhGEOKGP6ceFfbA1U0MIKqE9JvUnvpwB9MWdZ5HZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8y77iI4+/3BeJ+1B11i0Hi5KfyMZo5c5OyrkKkE9ynBwMRKCc
	/ZyPnLkNB2Umbshy6oGOFeGImCUtW/BCqlvjhfb4g31T13cOF2sRkvJk6KdtL9o=
X-Gm-Gg: ASbGnctbMcFf205/s2oAepGMydCpwceqINfApl2Tup8LgVBg4pDjpNRBXZY/CusJtR3
	BaL5SjNImleIEjED/9L8ObDX9f+QfMVjz40ok58KJ2TZwZAE6jOFij6tO4Iwljo4PL/+cZla50/
	8yUTL8gOtqeBZoea4NGx3S49cOrWgs58I6BApLYuKCnQrfQDaCD96FlWimEkvGm1h+BZJx9Srb2
	C7SnYg4MQlqhy2zk5Yv+iQgqXuZw9fqVm3RvzQKIIgHnsEqv0BDGDKt1TvrN1BjitaGhYTlwv5L
	RWIm/ot9ALYDourQ+8Zv+VtarCTWzl3X9wSyDEOTMJXauWxZy3k=
X-Google-Smtp-Source: AGHT+IGB31thuufoxJYlKx2OJ9+59LtpnF6oD6iN+AzfxNeqUgzSARE3kzGHVOeHGGHAiVK6EGT83Q==
X-Received: by 2002:a17:902:c94c:b0:215:a56f:1e50 with SMTP id d9443c01a7336-22db47e5457mr21504655ad.8.1745479281373;
        Thu, 24 Apr 2025 00:21:21 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:21:20 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:33 -0700
Subject: [PATCH v13 18/28] riscv/kernel: update __show_regs to print shadow
 stack register
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-v5_user_cfi_series-v13-18-971437de586a@rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
In-Reply-To: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 4587201dd81d..6bb53ce72ed5 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -90,8 +90,8 @@ void __show_regs(struct pt_regs *regs)
 		regs->s8, regs->s9, regs->s10);
 	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
 		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
-		regs->t5, regs->t6);
+	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT " ssp : " REG_FMT "\n",
+		regs->t5, regs->t6, get_active_shstk(current));
 
 	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);

-- 
2.43.0

