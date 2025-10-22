Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7901F3081BE
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 23:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761175785; cv=none; b=l+CZXCoHicmh0EoJt3Phl0ggkESiVS31WGff6QAYp/OWuQy9wqe6iCNsG5J0wtMxgJ1o4DNT25qY5D64zpyMZItQcxggiwFeBMFeuzAqB+ovLT3RyIC2LiqaNYSlKXoYkqfyJ6QEQ946NlPjI6pMMOAeK8YcR05xDxtSxmsNrN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761175785; c=relaxed/simple;
	bh=onQZPDO/5PI+EGQWomoauY3V7EJZG9au2H7fkbOgnBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D3SnGp9zPw7Fasi2I9DVDj6bTn3/Qx5P8Qcm34bg3qhYsTu/gLGddC0QDCau2Afet74IfRe4g8L4pfxLGClTRoJtY+4jCWqIH/4LNrRjmhw9QKj1yjz9oYLbKyqJ/wE+WMm/+ceQ0C1SEFwhbVy5YvTvfmFkGNFVzGOg7wX/FFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=gEuYBfbO; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="gEuYBfbO"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77f67ba775aso227813b3a.3
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 16:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761175782; x=1761780582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Vc18KrWuMNfUoArR2DO1WTDm9aMJ2VnekXi8RaYkOI=;
        b=gEuYBfbOdMce+cg02sUIh5v1DyQsYyxHSy1AybOIkKpkOo4rGuXaNU/Bb2KQ85SfZf
         /7IM7QS9xDqqEHcbKIiMo1Eqwfew6hUQn05eb/iz9zMFFUNjHiE6d4Dj+/8BZU1o0uGi
         ZIEZvvaibnfQcTrd74SMTvxwuhg+e3xoi9eWWnuQgEFiZNEzTJkUo3zMpdV/0+jXEM9Q
         0Hr70VJag4vSK8VTkjUFBVmq6wEMmVx7wqrFe49Wxod58w39skdPsQlOgPh5dOZdX9jR
         oIAbZ6tfQrG2RxOVA6SiluHAoqtqznM3H9G7tEl+CCORwMh5fdwXUutBjBSjDOdV68pX
         OAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175782; x=1761780582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Vc18KrWuMNfUoArR2DO1WTDm9aMJ2VnekXi8RaYkOI=;
        b=xNfGbYoOmg1JDnvxcB7KeaM5eZZsdQPwB5lSNwmWt/aWiKJpikt4esVNyMs/z+5BDh
         gPaseO7HB0LZvjvHyNH0NjMMb7IFWs4RV+X+05BJKjRuIU412oFyObKPE9MtC46qr3sU
         DftHURmLQckhDcWq4gbBQMwNpLybOdtIUYhakBlGj/LHZOXsfvVf9SsSAgbg3Jx+q14E
         79ACDteBH53CImCIk/rlhf54C3SklZYI3wwsblAInn6KC9seHzR9c8ovectYvj5pl52O
         6e+aEJLE6W+R9IQ2MjlRZQsiDBklGWNXHwlAjKrNtWrYkNkmiUxZ7RLiN3t0pmVtiTdI
         JSGg==
X-Forwarded-Encrypted: i=1; AJvYcCXNzAnFEu2N6XmzNLIAv9qslXMtWSDLC/WLAJgcQOpwRhm2HlL+PDXS9GZsKC8wOEfPBP2ML2KeIWMENgNeMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFImcKbn/IEXrtNlLT5yDjJZCyPKxzvMTVnpVIjtw/aksspv4J
	uAPBfIRsulzYPnuRVUPYKqMmYOrEjxKG1Htuo4UJKoA8j6/IrwQeKMHuX1IYp5zc0q4=
X-Gm-Gg: ASbGncsy8g8MAuKeiiNpo9a1SDTcf3d/ndst0j1NDmQqBp5SDGan7pWdVvV0yjLTJFB
	VzGwTPpRw8rcxLhTHIKP1eBoLtAf2+QYoCjfFK0uOx7dyWBY0vhP+jvWsZaNziGFSt4uw9dYR8M
	M1s3aCw1QpZxPURxkv0H8HbOcq3qD2YVKNjdGOMYGG8c573i4LSyPSuAdF22X/Y+i/40M3gO1c9
	WQALXJcQqcFS4NKvbTDT6NTRuu5wWkS1kZTMtN61PDuvxLHZ96GpOox8n6MIZT/1A/5Ik0bByK4
	70SvuRCoNGGhBLhr2rYSvdXm47hObzEbntd6qFb1eXJlgIJe2VGSXOKhu7xtNjsg1iiwCn5bhSh
	LqXdzVmDDosvEeCOszCPgyKab7F5jlcP8zr8ECIQj7BeU8a3EzjZEDKDk0oPQJSOM+CdlAF6tP6
	PpDr3ye4rHdw==
X-Google-Smtp-Source: AGHT+IEmNDRmBGQ90oJZVfBuso221N4gx1WrV0qlXlFna773Bu+yBYH9fzM5J7wk1l162T475OZz0A==
X-Received: by 2002:a05:6a00:21c9:b0:781:32e:53cb with SMTP id d2e1a72fcca58-7a220a56abcmr28815176b3a.2.1761175781543;
        Wed, 22 Oct 2025 16:29:41 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274dc12b2sm392646b3a.67.2025.10.22.16.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 16:29:41 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 22 Oct 2025 16:29:28 -0700
Subject: [PATCH v22 02/28] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-v5_user_cfi_series-v22-2-fdaa7e4022aa@rivosinc.com>
References: <20251022-v5_user_cfi_series-v22-0-fdaa7e4022aa@rivosinc.com>
In-Reply-To: <20251022-v5_user_cfi_series-v22-0-fdaa7e4022aa@rivosinc.com>
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

Make an entry for cfi extensions in extensions.yaml.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 543ac94718e8..3222326e32eb 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -444,6 +444,20 @@ properties:
             The standard Zicboz extension for cache-block zeroing as ratified
             in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+        - const: zicfilp
+          description: |
+            The standard Zicfilp extension for enforcing forward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
+        - const: zicfiss
+          description: |
+            The standard Zicfiss extension for enforcing backward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
         - const: zicntr
           description:
             The standard Zicntr extension for base counters and timers, as

-- 
2.43.0

