Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DA1182
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 00:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737504887; cv=none; b=uj3N88eZOrM2QTffW3LGwhntRT/OZ1ewPopCY4npJzwj1zTZbGXvy7M+xZ/gqpcCLMHCR2ZV918KT3qfhGXHiM3u/1E4LXETwJB3G+jmUUWD1j5mYFMwWUm/IwdxCYrD2mMQIEWL37J50dJ1xZ9l3jzKxWM6zeaRICDHdff9olg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737504887; c=relaxed/simple;
	bh=FwYJaStDXdGMdB0qjyLfGzemUoqUNCxgZQGdmS2F2P4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gT3Xqo4ZgUOkZp1fSiaQbaVGoyVCFfNt//SWOHeS3Xy8HbfNQY8ZIHBG0PwaLrYobQttzDqxt432xC5kp1ADIWuWe2cDGRp6+ZQ1FpxxUVU5AHVjVs6CVchamiozdAjhwJ4fFf9N12lzWvLDfLWQWLPvcOfcNba2ei5bHRMHVlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NLsbktni; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NLsbktni"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f5538a2356so11460155a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Jan 2025 16:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737504886; x=1738109686; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pYaho9hyTknTGpu45IGAstiusf8bXdQAQ8h+cpS7izU=;
        b=NLsbktni8x9mcg7HDYF3pOWi20awZqkVSSFdHlbZs+3uXW5+MxFjhbSgURI9C/V/NC
         OCdMj1ZjycqKUSKgvuFeN3rYJ/VMb1c7xpmhvNJLmXtvDXLljQ2iF5rGvMG6CJz9aJOK
         pXZYhMOYw60Ni1jyE5XFAP6hnVbV08ViFQkUtON3yEYwZ66I4gS7Can/dCAZKV71sxj5
         Q4LOZm2RSr2oRDeRRecFjY5NvMU0fuFOTaHT6NfYOQySwpEDwm5DFNqdSrS6dx4DEfmR
         Ao3lc1XnTrzMZe/0rbJKYdxpa15AwoSwA0L4ufJ5ElhzvCDqKFS9iBZlph9PvRH1wZSM
         xdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737504886; x=1738109686;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pYaho9hyTknTGpu45IGAstiusf8bXdQAQ8h+cpS7izU=;
        b=N6kOtydhzqJYFoA0hZ3qvo1GbnE4zgC5GP9faulop6sVnWRMjkZvP8X2UKtiaZ4wdh
         FkCakjgt5SA1v9PAUV7V33LVLbNZhQ2RRttBNYKSO990/wcqDiWTW8VwadjRTXCr0EWi
         DKvMwirxm8RYxu4YpwbaDiGjvUAFU8e9x3giF+MaBpd8B8TBna/iyJSzxhk1a+wW1c8a
         iu4CVlNTMhsjOysQ9kzUCl4Z2V/ts7hTQkghravqt4Wuk0ShYRwXKog8rbXaQHFxwU9a
         6ZvyqGH1B8Fv+Rzx2ymyCPI/mLsFH+ihr4QAK/MDCwH0D9BDRhc0xkZZ9++u6qMCtU9Z
         tutQ==
X-Gm-Message-State: AOJu0YxZv0LD5TwiD3V24A8DaOclTYkOQeRovDK7Lzay+hIoLN0Ksw7Q
	d0gxB9UbY6BHxtymEkH46Dcs5+NRBzMzvKULvFlHaVxgGsgSNjW9hKd0th3K409qZ8SLfYwuqgs
	MRFtAXg==
X-Google-Smtp-Source: AGHT+IETq99d638srfDvUmEZerQh8rahFiGVspnc2A9FdV/8o4aliKIB++mQUz3umfayyWSxK4GsSygnKQ4G
X-Received: from pjty12.prod.google.com ([2002:a17:90a:ca8c:b0:2ef:95f4:4619])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d444:b0:2f1:2fa5:1924
 with SMTP id 98e67ed59e1d1-2f782d38336mr24033784a91.26.1737504885662; Tue, 21
 Jan 2025 16:14:45 -0800 (PST)
Date: Wed, 22 Jan 2025 00:14:43 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHI4kGcC/x3MwQrCMAyA4VcZORtoC3PFVxEP2Zp2YVglcToZe
 3eLx+/w/zsYq7DBpdtB+S0mj9rgTx1MM9XCKKkZggu98/6MhWv6kObFvnfDhYwq6movDGMaaXJ hyDFCy5/KWbb/+no7jh/MAxueagAAAA==
X-Change-Id: 20250116-gendwarfksyms-kasan-rust-2bdbac027f88
X-Mailer: b4 0.15-dev
Message-ID: <20250122-gendwarfksyms-kasan-rust-v1-1-5ee5658f4fb6@google.com>
Subject: [PATCH] rust: Do not export generated KASAN ODR symbols
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

ASAN generates sppecial synthetic symbols to help check for ODR
violations. These synthetic symbols lack debug information, so
gendwarfksyms emits warnings when processing them. No code should ever
have a dependency on these symbols, so we should not be exporting them,
just like the __cfi symbols.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index ab300bfb46f6a3e386b86d58120d7aeddc57da37..4f212bd41e74ec9f25445d3af76818332f288e15 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -329,7 +329,7 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ;
 $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
 	$(call if_changed_dep,bindgen)
 
-rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ { printf $(2),$$3 }'
+rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ && $$3!~/__odr_asan/ { printf $(2),$$3 }'
 
 quiet_cmd_exports = EXPORTS $@
       cmd_exports = \

---
base-commit: 0939156bc07c9fd2b554d9813352c386dacfc3d9
change-id: 20250116-gendwarfksyms-kasan-rust-2bdbac027f88

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

