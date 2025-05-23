Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0902A28689E
	for <rust-for-linux@vger.kernel.org>; Fri, 23 May 2025 05:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747978334; cv=none; b=LFV8Suv+QTdYUiCnsZVQx71HLgGK3MbDr9Hbit8ObOBEVjJXXJyC5TyDQhPTi1xyP7oNtkzeQK+26hLQ4BAMVRkR/4ZY6G1uP/Z0kMseaNb9fNbtpjMRNNwFrICPp6VIH93ZmuEmWaw7tuEROZ5Rxb3f0Cd7nLlPQh2hX0si460=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747978334; c=relaxed/simple;
	bh=HSj61/DKHbscjrSxiKNrJbrvkTbOzS+iDBZfj2iqRRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r/ERpl1QWcPJsz2AJSMcbvy89HoBEo98wjw4gaNvHMSm+8oqoXrlghows64IQu7BP7SqUiWKLf9LEMUpe1f+UFeiUkQ16tEE5I0F8DBiLIwTf2iMEh+18jBphwMEwjlGmnBYupq6h1vw3vsmVruEMkWAMUczwTriD9vz0wpx0ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ULQ6F2bJ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ULQ6F2bJ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-742b0840d98so5219935b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 22 May 2025 22:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978332; x=1748583132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=;
        b=ULQ6F2bJvfCXlcwydP437F6pyvq9Ke3SJwB6OfNEPnlFejpqstWr99hf4fcRAVaJk9
         PStB4ajAYoTpaUigsTioJXaklL3UGn/VO/YMtc7+YAheMxQrM4shN9K4ut6EG4RIhpn3
         1OYfqelTC3vaRU1urbblLeaCZI4K3zfeS4eEZPPgo0wBIQmEq0Yma4gazsfWfjqOrrq9
         3RxmLENDQgTLt1C6XOXZBd3C7LqhWnxwwQfgC+qwOvxZWm5+vxjFAz4HGJ6d0Iz9YOy/
         tk84kW85mnoCdt75zNkpsWtTO8N65yyEIAv3X7ATEQuHVGdoh0QYXHEZGiP0JZnyvS4a
         0pYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978332; x=1748583132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=;
        b=cbmyEWYNEEq74uYa9rcW+WTUXKg3JIsNSqGTC2M2+wioN2pMgNnZnYY9TNk5p/jNkM
         HRvpDS+zMQTvzKWFCRcAQIliK9Cl7LTfOMGNsU5x4f2GAKMvdlZr2/dHl+wTDc0I7MWQ
         c/nXuj1FY/yCsBwnmwl4zHrw0HtdsFsBl4XvFLdgBYGTuH8SnEJm2nsYXkYREW0qQy+W
         sp4f1z0XRpNx4XEz7j5KP+GcOVAQlnUVHSwJOzA0wg5R2T5a5QPWsBkadvay1JvuyPxY
         DoEFU3AddfFPailxhlzcGJPEUmRWTDObKC/xwLS5D1LB6nrqRyko1wCtbpUit+11o5q8
         q95A==
X-Forwarded-Encrypted: i=1; AJvYcCX7ox34A45HS0R9I5mt81CsedTvK0heU2vvUYi1tP9RYDOcVuowZsNG8IgwQEHUu2ZonHkxSqBlrrAZf11daQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxPiZ0TVhmShaBgsQFyP5AUuu+DJLtBw8zgeU6qVryt1fdQYfK
	GNDPOyPZs3dWiYmaeKZUJiQyeKezk1ulnRgZKRZ3dLwMnyttIGuSkqHCxqM4Z5AYuxo=
X-Gm-Gg: ASbGncu+wCKV7obbxp0hjGEyERIAGenZEY1+De114UyRMRyRzYsWcsV+wJa+FuwlwW6
	BUsp6C0iLRJlRwXVfB/5bLbXmnmb00qib6Cxr7WoYDosF9v1YxriRogTTFYutLOFiXolHn6OvK+
	L0B9d0jt77CZYan1bhgAsnMAQnkh0/mg+Nnz3cUTapLamVPlb6BLy0bvDVslAzXkF6sYjzAkUgH
	fBxqmu6RA99KcAr/Y5QRn2C5btwhbCLeyMmH7zlVcviMoKgpVL3cHTNOCDR79PZMdbr6WpELkaO
	ou+pKzgxwpljLgrdVoQX0Eg2ozNTNIRayX4YP5WIUwY6X0x+l8ddpf18OtWhvQ==
X-Google-Smtp-Source: AGHT+IFN55/S0MavLUpf3quM1MMMkDLsdFfjkZf4p3h1dkJqctJAGjee587t4XJRgbN3gdxjRXpqKw==
X-Received: by 2002:a05:6a20:7d9b:b0:1f5:8e33:c417 with SMTP id adf61e73a8af0-2170cb051b7mr42162455637.2.1747978332230;
        Thu, 22 May 2025 22:32:12 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:32:11 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:21 -0700
Subject: [PATCH v16 18/27] riscv/kernel: update __show_regs to print shadow
 stack register
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-v5_user_cfi_series-v16-18-64f61a35eee7@rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
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

