Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E0F76026
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 00:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763943810; cv=none; b=GebxNlhyi+Hu0LxZCXmDu2UZa6nJ4eqvxJRrJv86x6UmBCWV48VpwrwrPl2iFn3KNp+o0k/mQkRTBR4sqBsGC88AQcXNqOjdLoAcYNxIARK8vu1DPQKv7CxfJ3DXdDlYh/387wfM35QbOO+EnxQ+Qq6QE/3RSnC2pc/al35tDbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763943810; c=relaxed/simple;
	bh=WbemIgKuUD0wTji/U5cdEGBHeKZfnMP3MRB40CeW1Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OLsSN7wXbfN3CuS73EBaRuLQ7dQSOr22eBQLzkAMiFiQIjgawHuNMyB2VLVKc1nJRp9HQ8SKf4Xz3V+vbUBQTZx7lkArUxromu26heo642GfvaC02TpIOAOr+WUfPpL3IkqCreNgCnSPVvG+YMtcO1ZwjVMHW74KbV7CUdU7qHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXhrMV1n; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXhrMV1n"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59578e38613so4252647e87.2
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 16:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763943807; x=1764548607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbGYlCQvEAxl7Ii7cRcs+Js6nTClE2kmQahDh35IFoE=;
        b=WXhrMV1nwjasSDnXIDViZKvJytOYRSKrlDBKdbBhCafU9zKoE1wWo6Wt06bYTQeZkH
         wzTwyIrcD3Zt+hm/+YXg9LgRLLFSXi7C7AdyR4MP+qtyD9nRDND+BVlP3+mY47E/9r5E
         a7Rh1Ar0zWOBs7khs7sVKUH3JZpJ8b6OEZ52UpNABjqyRTYLPR7PPNLxmY3SqPuRj9bD
         CMMBzwCtj9JbAdkQmKidK/tgB0i8xPxztTfHhL2dVrM1QhbsUJHE3RZR+ModdVEtxb1M
         2zEvvrkA2iR8+MKVS/WwLPj7QyFz8aH0tQlvyf3hKd32SAP5446RwLWsZrrjDUKFJIth
         fqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763943807; x=1764548607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qbGYlCQvEAxl7Ii7cRcs+Js6nTClE2kmQahDh35IFoE=;
        b=WPeB2qqHQ3ocDRMVVq7ZP1I2rVM4oSgco22IpjPdYaCbWw1s9icEjql/7Q9hx7bg/E
         FJ4Zxlxp485/eil4y5JWQUFUuDDo5QhQX/7klXKHcBYTI+pC2IrNLC86crse3NFv7t8D
         byuhG3uq1+750F231Nt0VI0wtozpsuuCuxqolRaFGFppghESky1igBQEg4wwr7/NtO5P
         6G/Jn+k+OZcF1gDdIWbN8YLcTpdBhFz5UwZ7XRQInAx+WDIDARcTPOm6Ent6yJ/iwcsB
         /DStLUy+lMe14u8x67zE7puj78WrDGjngQxd6WMFu2w4BKXkPVlDpfb/cGPO5kRt8sd6
         RgPw==
X-Forwarded-Encrypted: i=1; AJvYcCUdzmcuuhUO2ScfhKbgsyxSlSVs2fwqR3plvF0a4uuuQjVmqLvjcaZMkEIaVKd7CRF2hR158orQTaFv4ZH55g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlHbvqt1/0s+840QjSG41oLa4qjpIzEny/3USAkP40ja17ZKZZ
	BC/d4vnYuXORCHUPUzPmkdlKTQKPAuWA9hmLDYdM1O+EUCYNrDK1LP2Y
X-Gm-Gg: ASbGncu1H6ZJrf4omSwrn7zIBMCoOuhE5LqRem0rylUNfNk143V6PkpmfitTYLpCcMp
	/n1SZGOpElX0QF1VMRnliPhAbvuLZZijVyBQ7GJCmPRrNnlNtV0QXig3tdfMqLhpOsC9a4mPF6/
	UDvouWFrCweyb7G+ikzRlk2QDlFlMtqnicH3kFPeua1qkP5t4CxFLNlkAZiDhcPqNYez9OP35po
	Q/kkRmMQSEdTHL+nzWiOwRgUrOsDYuaJpch6KauyWT+jgzr4eaDv5jUuzH+DBaFBHO6GSeY2cbE
	gu6Jm0Bk6GcQYImXDstLeMg7VdHItk2ONcN7A/9tqmFXOlTEhGFaoW8FcUSljQIi05vsPMOi4Fg
	SEx4LzZLn+xgh01jFq03KzovuHtFO/lu/WDbUYUxYIRy+a1dOcALzBidZ4CCRerZdKVKJRg==
X-Google-Smtp-Source: AGHT+IEwZK8e0HsCARZb6AL+s2DVpYUXEissqZGhv69G7j9nHjSuwrkdy5uD1EZ2r86MmPczP46Jzw==
X-Received: by 2002:a05:6512:b19:b0:595:7fa2:acd with SMTP id 2adb3069b0e04-596a3eb2edcmr3569705e87.21.1763943806325;
        Sun, 23 Nov 2025 16:23:26 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5969dbd095dsm3708266e87.97.2025.11.23.16.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 16:23:26 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Mon, 24 Nov 2025 01:23:23 +0100
Subject: [PATCH v4 3/4] rust: add a Kconfig function to test for support of
 bindgen options
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
 Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Asuna Yang <SpriteOvO@gmail.com>
X-Mailer: b4 0.14.3

Use the `BINDGEN_EXTRA_CLANG_ARGS` environment variable to pass the
`--target` option for cross compiling, so that the function can be used
to test both bindgen options and bindgen backend options.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 scripts/Kconfig.include | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 33193ca6e803..a8cfe9f408a5 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -75,3 +75,8 @@ rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
 # If you are testing for unstable features, consider testing RUSTC_VERSION
 # instead, as features may have different completeness while available.
 rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null --out-dir=.tmp_$$ -o .tmp_$$/tmp.rlib)
+
+# $(rust-bindgen-option,<flag>)
+# Return y if the Rust bindgen supports <flag>, n otherwise
+# To test options for the bindgen backend, add -- at the beginning, for example: $(rust-bindgen-option,-- <backend-flag>)
+rust-bindgen-option = $(success,trap "rm -f .tmp_$$.h" EXIT; touch .tmp_$$.h; BINDGEN_EXTRA_CLANG_ARGS+=" --target=$(BINDGEN_TARGET)" $(BINDGEN) .tmp_$$.h $(1))

-- 
2.51.1

