Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAFC34F47C
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 20:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764878684; cv=none; b=S3F/EOiXTpAVXd6gWZ003MmjEqnjQsr47Tk1WvJrPCL/jhPBr5B8YdUeJKbpao3csaw84KdSJuaz3/VycX7oA5QfzPBE/mvAOG01fJHVieJ3ecbS81gOlViDbZ+ZITWaCb1yrY8HIKsDK1109sd9jkyoig23Njv+qYD+P0WWDQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764878684; c=relaxed/simple;
	bh=o+mupBbwLM9S2HS2KmSc2gYbDSK/gb3i74YBTExGXIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QBv2InIgWyrosmKZSLCKmbwXJ93R0CWSvKa2JOqQlKJ/lN3waQn4pcWn5gNHMMihdIm6bD4QKc0mpN6uiXKrJeuDgWA3KPC8xB/TZKoBORdk5ISpu4AtwsqOIpDCjC3KjjVKmaDNGvg4ujchnaOiZ6Da2RZoYXnjBIuqudqTmIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=McIF2QDm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="McIF2QDm"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29812589890so19083555ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Dec 2025 12:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878679; x=1765483479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caVRo7M49OcsqhffOXnqYtJLXHun4v2kvB6IB4MWH/w=;
        b=McIF2QDmlMmRS6IiK5z+fC7KEpPH2atdMt9l1wAsasOvh8Pq+fd3xz6jp6kN5tiznB
         JXPad+wxfW/wbhqbrKZWetkW+tVet9nXHaRtlQvcJtEzt5C/9hK7U1n4l0n+uo/BYedv
         tM5Io9J8Y3Veydq/wyjcXHKpBOSG17jqignomYMrRwxanUhnuZ+S6ciNKJj9zjiVEKND
         GAvNE5PtM+ySINMzrt7jx5jEcCrC8G6VuTiOlOFX7+S4eJ3IPCtElhMZXFW8eTPxcA3Q
         lEP6yfVrv5jRYlQs04qinAPaznWX5/8PeWmRTkRtEt0KxK/ERHbd8jeyzZASIpsz5RXX
         xC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878679; x=1765483479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=caVRo7M49OcsqhffOXnqYtJLXHun4v2kvB6IB4MWH/w=;
        b=TzizDeaM4DDPhrUM7jMYRF3RQ0s4lTNOSkOXUs1NIvBHKFg+YK1u7SDbkfBCXrXU9G
         oxjaHlNkvsWdxMbPChhpX2EgPdkrQN5LMxbqAW9dQnqxpZBra73uzgBSFraHsPrWxBry
         oZATW2nJYFC47PlUEF6EiDaqRZBQxTXYtr8RGk81f8fLvDmo6+o1hoWvJsaj041RpiIB
         qdSkOf/Jyw1YWcR/W3QRs9bz1w+79mEutUhT2bW58PT5TaRExQr7b8FrbkAW8GImv08V
         0YvDgBXmhH9OeRNErV58BVKZA/TuC7TlOHSDDZPjNgD4MDKwfYHM1lsH5Uafw9yznJky
         4NjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7bO7Jk+yQkiswSRFpQwJegGEGmnvu0H/3nbSc7QAwj7LV8XDOQRWh5/toa35tcBMjpHwZF//1l3YBSkjIHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YysCVGRbDN45iO/oa21PCuCukyvv8zZRP5V6W9VIFvToKalBcq0
	ZfUEjwqW6Y3Bjj8fRbIyDYd/iGYgXgR+AgC4X7/XgIOcmUZaTtN4gCwwGoNShG6zFUA=
X-Gm-Gg: ASbGncvXE0PE1Sfv/lv+M90EaASf3S/86uWdzyxfmNIn2GeT3YqCyaW5Vb9zUgDbDgD
	yC1Z+FbLrICF2bg/i74PQxATsMFfM1bElPb56VyFQo1s/i9YqJd7VF7fgLtKiOvkfMWodt+FFB9
	AKwtqcSIp3Ebbowhvmr+s1iuXRRmeN5XZ1hRh1a5UwKAlU7UWEtmIrO/LVTof9gFDCNqVZAfRDA
	i5hLTdosel/kqoVWwRv7TNPZjToy/uyrSakuY0CRP9IPf+PJUA+xxrFJkS4HMJDllB3oBezi+BW
	HXW3VcaNBGi1iiDl0oY6OMCBKTWBmYazOSV96AyIhQU0ceIFlVgeg8Ieg1fthvP/SgAFssYPQPG
	+EnXTe3RuDVHaEDr8XyArpZb3M5V24TDEDb1AWXxe0QvSmELA9ELT0UGKIIaVkgKzLiZ46ApidT
	W9KGa++L31i1O2OwlI6iAp
X-Google-Smtp-Source: AGHT+IH8WfNOBR0WYTIAjC7h4KWRD4arxZjj56t6ot/oIQda4VPJ+vPnGe9pfxDTosFlvlQPrVkwhQ==
X-Received: by 2002:a05:7300:2d06:b0:2a4:4e38:9a39 with SMTP id 5a478bee46e88-2ab92e786eemr5009491eec.34.1764878678491;
        Thu, 04 Dec 2025 12:04:38 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:04:37 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:04:09 -0800
Subject: [PATCH v24 20/28] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-v5_user_cfi_series-v24-20-ada7a3ba14dc@rivosinc.com>
References: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
In-Reply-To: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878636; l=1494;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=o+mupBbwLM9S2HS2KmSc2gYbDSK/gb3i74YBTExGXIE=;
 b=2TL36FQBTxYHJECnsPKiEOH953BZcSJpF1TPScxWirFZpsiwieknY9HPgz7ctQuE/tNNnQFHX
 qay7b5jPJ7wCN1QiFJshFM+JS1yjoWqf4sTvAxW/wwYUz2revUqCcLB
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Reviewed-by: Zong Li <zong.li@sifive.com>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 5d30a4fae37a..0efc9c7d1199 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -82,6 +82,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
 #define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 59)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 60)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 000f4451a9d8..d13d9d0d1669 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -114,6 +114,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOM);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICNTR);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);

-- 
2.45.0

