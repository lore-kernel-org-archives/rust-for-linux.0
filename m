Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39BD34AAE8
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 18:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760552068; cv=none; b=AlPhE/Tv0S6P/w+dd0XqG+FDLK/pDQzBTtdVrU1Z6IujaVQrqy2LSCmwHuRQtoaFpuW4h7wun8JKgblyV4vDY7q9rmx1TfhNgp5GDlMDFwPNItLUE5JFVBag/f97+du5lTHOQE6worfIC0EJ30kcO2nJFu60FHYcuBjSYXJ6v20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760552068; c=relaxed/simple;
	bh=wP5UX7zWs0Sv1DUPgXKgMTygpamqW2/FxBkyaeLpPmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ujhh8gcJIEMfJZhiso/01HMiSVxHrCJSZw6dagni6mwWL/szg3OGAbZL2EiirZ/cG/nf014u3fr2zHYJLEtAm6UAhN0Q9lkd+mPe5AbA9gViyevQ6y3EUeINCYEAxRxVLAIDKL6VAESC2JhQCK/rsVBAovhXKx4YXdGsCEmXxqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=N6GdJLk+; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="N6GdJLk+"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29091d29fc8so3020105ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 11:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552065; x=1761156865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tg1KhEMZfMefo+THEb4ueoLXzfJu3WY6LEuxXprwk8=;
        b=N6GdJLk+J7nbk2G2CeAp3gSTDE30HTW52rRb2yNSnfwuI9IvLXrhRJLgg3r9cC0eVT
         9u4zH4/XVOhXM5VbeebL96pYT9SNfEuM6tJ/h2rh1Wi1zs2jbVpFcZNkDAV0GRW07fBp
         IkYi1gSnziecLzIYw3X6Y4er6mUzAe2hCTCsu3IuQSPmCtQ0bVlWy73Zp197cgK4FMFO
         jcdptpHNcdNvly5vguVLoXcc6DG86TSEdz/XPuZyA5PF322IwbwK7+PdO5Ob5KxexGbt
         8U9N3atmVzGfIFZ5H2592DlpMCMtE2ry2EloD4yWAK2iJRbe0VcAMxALi+xIclzHNv2x
         B7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552065; x=1761156865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tg1KhEMZfMefo+THEb4ueoLXzfJu3WY6LEuxXprwk8=;
        b=tS0vyx0WE7ufOHj8VdkOwKBe+asdhyhpPPrUssdJhiUos9BClxKgK+VF9cSLFVxYgh
         ppF4UCp1tj+nPdygI12DHU3iePFyGEtzv++gorklo5ZluAH46jgOIMYapiLinlQK9y43
         6i7jRD/sda/48LSfqxegf5WDm1zp4h9dZQiX8pnAvmgdi2p+ccWqYPDLJFCHVpzn5Qqs
         OwkhAhhj2AJQyg6v/jLOtZMA3XX1F5+INI9A1X3wa3LuBTCHEo6Pzgx0fnk48ae+q5PR
         TEVxYknwLxrirB4JSP3fUudNYog6b/OH8G60eRJjZlmDHxwNopLb4jgn6WACqNdpkFjS
         xQAA==
X-Forwarded-Encrypted: i=1; AJvYcCVTkRi2NN5QCad+92dJ9+n9yLmi4WGbiHa79cUR+PrlKxJTWnMsrQGky5CYsOeaUKMVjQ4TZ4pjTC5dpS021Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQcGdTj9G04lstHB6wcViEd7ywz6VCPNW3XnUbe3YeHUJGJdup
	R8tI66Whljnqp2xAu+8rQit797PCe+IgF0reveayZFr8v04ANrd6t15hCX1Y12AKtkU=
X-Gm-Gg: ASbGncvZhT7m5uv7kR2jWBv9QzNjPwJJins07LL1X4zjzAFsOq97gKqIDWQ7szViwjn
	C5UT73tiIHkVMtqFetBccMwI3MI27i3OAVbUzRJJEoJCVrpVr8E9z66DsrSo5G3TqdMlQkFelmK
	hpU7PKfqjUkl3Y7CnLcl4YlA8ViQprCq+tU9fNKqiC2uMN+EdK9YMSbnK4H3cXTEeduZzg4hJgS
	DlAlF4q3agUZHO9YnTb5QnEjThuif6xE1qUoUMVP6mIchvFuJDgTLuXdA2V0bFIELe6VR2zHdan
	eYqpAheXJ8Z2/VPWbOLHybYjLMo0bzpwN2hXM6YVeh3ADaYCHvujB26RKvunqOThyzj3yOog65v
	Ujm/IHlbjduFeTZ6oDpNFBCI16JpBcpKq/uN1puGIy5zdcFFdZo4=
X-Google-Smtp-Source: AGHT+IFJldQrTahc3Q8sVNu0r3ng0kmfHptGVJgLteMAPNepRvaTO19nK3n/je32vdUKI1tH6x0IYQ==
X-Received: by 2002:a17:903:2f84:b0:28c:834f:d855 with SMTP id d9443c01a7336-290272667bcmr408470055ad.27.1760552064765;
        Wed, 15 Oct 2025 11:14:24 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:14:24 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:50 -0700
Subject: [PATCH v21 18/28] riscv/kernel: update __show_regs to print shadow
 stack register
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-v5_user_cfi_series-v21-18-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
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
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
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
index 49f527e3acfd..aacb23978f93 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -93,8 +93,8 @@ void __show_regs(struct pt_regs *regs)
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

