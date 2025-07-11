Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF801E834B
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 19:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752263179; cv=none; b=encB6iADUN7vdFgV926kIT3QvoLEQX7H23XGGhIAvRCR0TpLNe22R5uULySUsl1HH/IOOE9u4V5ry4fhkcQ072a6S3FYagJTgdgTFAKdcZnfHMd/GPuFNsfaaL68OOii5/kn3czOgI2O7/9uiCYKg+MPPusK/L2sccda8GEWWHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752263179; c=relaxed/simple;
	bh=3XZTvPjvB4R6wnDsFDBTbHp2HDNWsnF4EUoOhsYeC0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ggRwe6jiGW5x4a6HF8n1zY8PTcUPUJZcdDwYZhf4hb/h8KfY+DVRexC78QT7OHdb0xnmEE7M1ifwtXjG83Kcp2Q9hPiZ32xno1/Kq1qh5ZQqUQxxsIRnKUROlEZwkm8E0IWte9XzDbO3mtR8VdukwE4xJNXdvRfccqGihmGxgF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hpFOQvHS; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hpFOQvHS"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7490cb9a892so1615349b3a.0
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 12:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752263177; x=1752867977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5+3IuIbTGtFY2nGYSuEXP86kkX+tfkAPCryfH6oHp8=;
        b=hpFOQvHS7nEZ/9CPQUcAh7S1z8bs5bgGroDENNp6WkEP6SXgtk87fMAxMjkA+sdaJD
         39jAobdtfBsJ+LbkqTLl4tZQX6YWGVKlH2Aa054QQl83rcZJdmseds3frwDf9CHmSLyA
         PjToh4UcP++tptSsOPO+IwLglngfXpCMo/zlVrY7JtkJN+i09GLkn+ggTw32bLJvuiye
         BcJl8E76kewr7oKq8n4jgVT/FczEqotLs2pymU2j/StzKzfFtyMP1iZFXsIhkV71oZTQ
         0F1XwFRqnO3UOhD9NRcFABplww+2IEk0S7Vkgbs3cXJsl94RHPOH7ValJCncAiObzDnO
         5A8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263177; x=1752867977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5+3IuIbTGtFY2nGYSuEXP86kkX+tfkAPCryfH6oHp8=;
        b=lc79/fwu5o9KwcVKCyk4pqoAghjaCgHBOtAwUMqfsnqtdrV644l2S56fQjoOSjCQbP
         TaerxmWaTxuit8mD384uZzzUeRv9/yfnl6GxGsAsLJwLvRv1ucltJrGcsHhytxEPFWbl
         1Tcc7xgacdMSCeg46hFJEfa7+D3HxlPP1PVMFTYQHLIr0lzqCyYaM0PJkE/IkROEBTm6
         HUqbfPCDlNvR5Xqk0g++ZZ5Pc2pX2TdM/kEKczhBJ2JNesOyTgqcw9GqMuKFk871NTPI
         CdU978LzCpmfcn/0y8loLCP9vbSI+0jnUzdCp+jHKog8YdQnRHSR1wUwCi+e39Ng1aoZ
         MbuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4/OeMwJD9ykih7lW358ixs/wiMFshzO/KAtikIoxVN8q3bHMWhVloWr36rZyVm+SDdageUssccCqjMBci7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJRpIB4/Tprq8wlfXGLztLHV2lfIc0pcyjwW3wUHEF6ojgu9Ud
	k+bmuU7e6l2Bp17YcZD115JNAsGSxGDyQ2dYPXdYHqw4G25QKCKx2dcX9nqo+DpAOPE=
X-Gm-Gg: ASbGncvwj+tlx+sXDCtd8NbHeIPMIfPG4RYTppJR5B7mLd3sxotMcLE/9fiMDWwouw6
	2kZGUqFZYiwahkdM9JZ0qgAU0ChEdhJ/rbnAIwTRAmmR01OqGGkdJCa4dD2BqF/rrDvH08XkQVW
	LoKp1Dn3tyhG+xjmGok2TIsSg8+g4YR6shlLFMcKj0VKNwGD/WOFYl+WtRQE3snLN3Rjqb9BDTj
	0JEhwbwpPuzOGfTD+lwzyph6knYG3mn+lQ0jSkW3m+JThYG3jI6cryfS+vyhAvUHvt2LNW6laAM
	XJv2lbBlkIHQ7cxxmC77fKc8a51MRAUUmOkX007BB4oiA/hUXRTXvKLBoqeyYrmRZXyCf4NR+oz
	FiHRXHUTLql6nhwBYaIk/cXJ3DV0MopkSPBxG4hPIfaI=
X-Google-Smtp-Source: AGHT+IHiT9dG2vPXDdmDzQOmWqgagw8g0E9RV6u9tAfh1pEL4PA1GTNnT+r9tqhN9VGCtBB45cyRbQ==
X-Received: by 2002:a05:6a00:b90:b0:746:27fc:fea9 with SMTP id d2e1a72fcca58-74ee2c51089mr6267738b3a.11.1752263176893;
        Fri, 11 Jul 2025 12:46:16 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06995sm5840977b3a.38.2025.07.11.12.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:46:16 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 11 Jul 2025 12:46:06 -0700
Subject: [PATCH v18 01/27] mm: VM_SHADOW_STACK definition for riscv
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-v5_user_cfi_series-v18-1-a8ee62f9f38e@rivosinc.com>
References: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
In-Reply-To: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

VM_HIGH_ARCH_5 is used for riscv

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0ef2ba0c667a..eb48924105c4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -353,6 +353,13 @@ extern unsigned int kobjsize(const void *objp);
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_6
 #endif
 
+#if defined(CONFIG_RISCV_USER_CFI)
+/*
+ * Following x86 and picking up the same bitpos.
+ */
+# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+#endif
+
 #ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif

-- 
2.43.0

