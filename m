Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7D8213E65
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 00:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972194; cv=none; b=pL2suKEb/e7twgDWQWiMLFoD0yEJr3A2ZUC/9Uvg5aT6OuC04WV9CWFVrU6b9Ghb1TjD7fMjCzUUxumn+RQ042oXbCV9Nk03huW/FJuDyIUeVuUl/TWW7hW4Heu5sbgTTjyCyFsYKEhNcCyt1n7pBOgQ9K70NatHtYW2nx9D4s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972194; c=relaxed/simple;
	bh=0tq61D9uccU6FiQqC8xv/y4u19vkZ7ShJckqXhsFT6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H7UoD8cfiZQTt2ff7WmABfo+uDFhNWklmsrz8qZ/Ey7Y5R0fOcOnq3iuTFGwJMaiH6gpX93MKZW85Y09mdYn2ZpDeW1NeSYdwLH3wMj8oiiePxsAnZsjTPqU9a9mNhQXwpkpoZlBJORENmEFp+dlpG+jeJcElpWvjq5ZACIcHuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=sMC4GSVP; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="sMC4GSVP"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3081fe5987eso6356230a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 17:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972192; x=1746576992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHp8skVfcDwQ99Y8qvuLL+UOu6n4/KmOGLmf3JbJ7iE=;
        b=sMC4GSVPZdq+3xo/i9GAPn9J7xS8K31wIwYHW6wZbRo6kUZQcVMEzq94A+VRNVp1fr
         vT3x9Z4Y14DR8U6Rj3Q1Uqkk14sdYT4yNBEElyVqkXrGNBX6UO0QOSOCMxlBAsGkDBdx
         yYwVhhSZhrOkWGYUDCWvMKUGp/VhGpY6pT9/iV5Obe89LtQ8W1iSpNrT6nn5Hivgblcm
         h5biWDfm0s7+2UtNXJ2qOBt+9TYt++RFJXXKCUVmo1OBCP5nDJWZSW5JQ4XBrkJbLkGz
         LRePUqYsvhRFm+9MQct1fHW2c12vJg9A7CZzaeuI839YAA+gDwA3g3ROeEgEdw7GjGsT
         fx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972192; x=1746576992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHp8skVfcDwQ99Y8qvuLL+UOu6n4/KmOGLmf3JbJ7iE=;
        b=QkX80YoavPp7d+0ieri2EK1kqyHL/v3V2faV/Bx7xcueybxBUjFNI2N3sGQLVnYb2W
         i9zcDkhshzrkQ/Uay2AyogG23rEu6wSL7EN0XpIKzZCXAoiusqwHahBloghYKppsNq1I
         GCZOKRlJHqa54oZBVnT6PzsenuLQwD6E6a45PLVXwWLY1gvZw3fjjKXw7kqHEeM6OyRu
         J9MxhmjMtFrJa2xIBQ2DwWthcLVavrzbnzJ03tQadCKi/rBmnIpf9DdTJVZkzWLxbYRd
         x4jW6VE7LgJBn8Lg3wtuBS8e9RFfg4F7psjw98ii8McPlo9kF8ca3aC6CoKkggaAsufo
         Y6Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVd+82jTnCNUFXEzpc/1lEaG3yKYJ2Q7SdXBEyrHoO3zNmpox7ibYqqJIaZ6z6kl2C1AlwuvnR7yxdihKYyew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjWmwPB/l7Ai9LqtHhLcIY1ryjXtgBKp/oqlx3X1h4aQWyrDWV
	/jlZQ2VpPwSaV1WqrlOJc/R9+9HmsDGyjwAglRvKvkHnSQteTf/stwRvUdiXqwE=
X-Gm-Gg: ASbGncupyMH3ajk/hmgWeS4aEIWLC3iOIYL8B5foWSvXmUGt8to3Il7nzoKoZ4ofeNI
	n71fa7KLgz5fN1oSg1gWTj3OeaTuBrwdEartchecPB4MZrdaonQDm+Wx/LrOLnsJajgiPZonfbH
	WIcG2UrAHf7mq/dr9I4Llb+h+eGgrPQn9e/lai1iyIWiRVa8cUyl2PdIgKfEpaB3dxk1hUL79O4
	o9aAXx9vC9knD9WK5vmP6EDI6VahiwAObNrkvgMlVmz4Ujw+NixSTyEfTMMA5YVi0AQFRM3jd60
	Mlr7psmKapmF0AtmCJQik0a58h9vCIQKd9KjBEQ122p6QTjJ3so=
X-Google-Smtp-Source: AGHT+IFZqq9MjhSqj6zWUKle5rqAOmKZksHCBhGRQygZlDXBwlT0hJq0zTG/U4jkXRf2orxlgxORVA==
X-Received: by 2002:a17:90b:3d84:b0:309:f5c6:4c5c with SMTP id 98e67ed59e1d1-30a34450c14mr888187a91.25.1745972192207;
        Tue, 29 Apr 2025 17:16:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:16:31 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:19 -0700
Subject: [PATCH v14 02/27] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-v5_user_cfi_series-v14-2-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
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

Make an entry for cfi extensions in extensions.yaml.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index bcab59e0cc2e..c9e68bdbf099 100644
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

