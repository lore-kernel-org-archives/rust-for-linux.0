Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D9230B507
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834926; cv=none; b=abDz542WYsSJaAWlCKroy4RoudcSaX5p/rtRrUp1RgLqEo9NrnpcAv5NtKNWJmsDJ/KloCFoEd1wH8Ow3+Zm14brKgs6QsSNWuysMu9lby8Btfj6/1T0ATuamGv14SRg90jaWvYT94J07VXKv5ya0uEGZykjDDZ+e53WmJa4rrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834926; c=relaxed/simple;
	bh=iTlPMjznJPbXtJOmJD38qd13ozQfx2VEj/0hkHnAJ+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q2zYjno80dto1zaUEr1l69pIER5c30zIqFiat1+l0gHvYLJ0AtK1XcPE5EYjbNK/fEfUio2jSEik1Of/lsUlx09bvs3p3J7pPJRbJk/A2r/iYdfhNdGBKbJVUZbdk7Dm15jfIVIi9t50yAFUoQBQHx4qLMUSTkNzhkf7ZnGfHdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVBfDhLn; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVBfDhLn"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59578e38613so600383e87.2
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 23:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834921; x=1765439721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5CWhh0bivbAxLbPHjrdPNLbMwbFtGK6KhcOChIXS0I=;
        b=WVBfDhLnXSfCvsS1SAxp6E/otJpTNFOuveXhI8D1iYshreuNdrS800sKYNJDTC30Vq
         gHAZ3pZV73fhL5jPH9kw8tCcTKUBye+e5Qvud5yZg0RmDPogngx5ojRvjKZdGpeApKyw
         L7FQismbl6mDqUvAgJ8cMg4UbxBZkKKzmLZ4jB+wcxR+RrpVfSG8Bebjvt+b1UBzSrHt
         HbYJGJphm/RpRTx5PrPBcw9pRUmHd9AVwQ7FkkkS3dxlT2Yge9cLDyLPCJt8pNraUeh0
         JsqAH21FDLra4YgzdM4mT8RSQKqdjikS2FcYhO+iN605wlJkPNlWoIMYHvTAF0W6YPTW
         xrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834921; x=1765439721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l5CWhh0bivbAxLbPHjrdPNLbMwbFtGK6KhcOChIXS0I=;
        b=ruCGXLT0Auu23kal1RxjmSlUTT+DwFdus/lZIOYdHVA7I4Exm+02111c+QbauDEvgQ
         /TJF4BKjluV1Y5aL1qlQRv8ScCGOyjCRejCNm2MaM8q3dBNY7wU7I3ET59bxmD1lFyD9
         uDTRwixc1B0mhxT6edYbNZVUuYK69aroqPhcPbW9+dhCQgWlRlrsoYe3yV3rQiW4FLun
         QANTqnI2hLTzOjBWVs3X+vBp1LZU9cxdbWUEVemZa9IJq8oqfQdHXUNK2gPCPq2YwwpH
         ChzRzSgkIO8CEMqOTd6y2u958pIhG5d6lolTEgFuWUDvvW7asRZmVnZBlkAVMlmYBjk2
         DO8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgldpzIsTQbEJspJyo/VBWgr22Va2D+sbNTXxVKsDjzm5leYerbky7VRd2bRO/Wh48RIaBDMiNfghMyvw0Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwfrClDKrizp3nD3wn31/TUTkrRvCKWsNeP4dD+FmN/vJnXUX0
	lxJ3xCgAGZ7TUGMi/8Pa1xsEJlwLd1+LV/k2+44RFN5V4mx180R7Vqd9
X-Gm-Gg: ASbGnctUL2lVySIj48AA6Ew9C1j4xzaQPgk6l0ngPVZdA8AOVhrIryHABok6kvxU6bb
	HrVgBO2MzprKQmSWcZuBx8A0lJfMf3Roqaf8qCXSbuygUz/mE20cm0D9njkeySWPaNNDUhnydnD
	uZi8OXFu1euhnNOTZOikn6fybL+vwubulcdT1bPRy+ALmtfDRYEBFsjh9neI6bJLY6r0G1bRBK4
	OzY9v2imisdHrGwl5Ub/dnGg8vQHBPQGVI47ApRWHAMOS1w9/hIwLGPhMmzjh0AKFjiS1nF7vTy
	0WE9hXGUQtFd0XhBv9EdVsgvlYrw/lyg4n5T1wzXdqmwxYySarlyrLCCQuCJLU1toUei5xWty0Y
	28pWRXH3flVj8ozm61bpPlIHXSxqNNnCpxtqkbneJhdkQumZZdyRqw3wPdkjgSm225dXGsw==
X-Google-Smtp-Source: AGHT+IHtNtKovriM8w2pLkDHwyMQApqeD8GW60UnConeyFy7gFY99L8zBySpoiS8naABTGPgdJC9Sw==
X-Received: by 2002:a05:6512:159b:b0:592:f521:188a with SMTP id 2adb3069b0e04-597d6709d9emr571551e87.49.1764834921103;
        Wed, 03 Dec 2025 23:55:21 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:20 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Thu, 04 Dec 2025 08:54:53 +0100
Subject: [PATCH v5 3/4] rust: add a Kconfig function to test for support of
 bindgen options
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-gcc-rust-v5-v5-3-2d4f20d86c24@gmail.com>
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
In-Reply-To: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
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

From: Asuna Yang <spriteovo@gmail.com>

Add a new `bindgen-backend-option` Kconfig function to test whether the
bindgen backend supports a given flag.

A subsequent commit will use this function to test for RISC-V extension
flags.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 scripts/Kconfig.include | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index d42042b6c9e2..5d4d29eed0b3 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -78,3 +78,8 @@ rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
 # If you are testing for unstable features, consider testing RUSTC_VERSION
 # instead, as features may have different completeness while available.
 rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null --out-dir=.tmp_$$ -o .tmp_$$/tmp.rlib)
+
+# $(bindgen-backend-option,<flag>)
+# Return y if bindgen backend supports <flag>, n otherwise
+# For now, the backend refers only to libclang, so more specifically, this function tests whether the given flag is recognized by the libclang used by bindgen.
+bindgen-backend-option = $(success,trap "rm -f .tmp_$$.h" EXIT; touch .tmp_$$.h; $(BINDGEN) .tmp_$$.h -- --target=$(BINDGEN_TARGET) $(1))

-- 
2.51.1

