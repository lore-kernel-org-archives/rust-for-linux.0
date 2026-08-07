Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218143909BF
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 08:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786090529; cv=none; b=NNYVfYn1ceaa3qZfPB11G1JDhaDBTjeW34yKfoQ7hFk+S0TxUR6TCVeEHEHYjpDmyjH/am2Q/N09pKip3Ytt8tny+in+kMiuxkOh+HndZwVFx3uh/+EexNaLNZG2lUKBP+UQ4idmXIWzHB6E8Ez8S0R7UytxVUVs9u7KBQJVlMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786090529; c=relaxed/simple;
	bh=2TV7ebtbvkj1szJHQaiHLbPPgbAjz9bEw83GICTxwwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tR3wyjFRuw9X7wYOJlw+EY267cpQRc/Qw8ax8LZe163Sthlv7aIJWXP5/S5R8i/T4iJnGeGG5MX5km3XqInXyjL4tLwrr4GedvplADNvM6HMlHr8ikTLfMLsbp5qCzSX6prAI3HWeU7UrcVPQvSMyJ/Xp26c4502EHUnaE2li54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so2980741b3a.1
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Aug 2026 01:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786090525; x=1786695325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SG3tL/12wgrOEhpyoLjgZFw1i9B1GNATu65IvCzKwy8=;
        b=LrrWFtfzQYCoxnc7mZUCLFJINauFEmh1VKh92ZTgnt1gSN4n+MsT6/QT7ighadyacY
         +Gu6Xd3yVoxSmTNSBlK3BlqbIP/qRv+MncduxbzCTLpX5pEW2h8Pi1K/6qRUwBFAOllf
         i1uQjZQ3SlrocDimj4hSPAVpE/bkphAqXNPep21XAMf21H/Aph6TvWfCe4SsrukP0qFP
         npnVNp44/8QN9LGkCYgmfpZ3qPajg/cj78EuV9uG/JF+sHF/xh/BEVLitgEU9oCLz1eR
         I4q6GtlcC6IsEIqfxDLeqsy9yrVFZooXIizdU5MvTyFmlY0c2wx4+rpam3hfg00In67J
         gD0g==
X-Gm-Message-State: AOJu0YzM1lnzzyl68SfqWA25+koGu1VBl/BhK5qnk2twJRcVOnanfnTr
	DKi9hxhNUk9guFH0NPK6//GujRyf622A70kkKJCL75JMSpChqqXtyUZZ
X-Gm-Gg: AR+sD10lCmfFpPp63PxYXcFjykWpG30LCUqy1l2DVFfQIOsrpRt3HHgr6xwi1Q+FWQe
	qrIVKA58bmnVcgHkZ8WPb6CGlz1Pvs/M3A3Dh5Z6uBTQ74GSJ2e7XSQDGQ1eL3fdAIa2X8YupAd
	X4FECh/cyQ1358quPgIWCUg1mGPtpvlr+nMr5a5HFMUCCOXEtiJyNvK2c9F1lZEdeXn0nc4HDCh
	fPS9QjXRjgBRCvqFtgzxtNHG5hZvNdl3yyKBCt2VbgbYuVSibCCeF9UDzbE2NESwZ02I6XIKvex
	7YbsXhg6xYvHc/HEuHCA+dE+pzT1oaBIQ4fsj//MqwbJpc/Vk9N60m/x8zBTgPE+JzVdSaUl9AA
	/O8rG9M/pL3CmUpMFVemn24F3kvU4tdmY0vLGe246hM+8MVsdt27eKChqkwqMw0qNQr5wjGcybW
	Rk646WYxTqQXot4/ps6DECV0ogX6jftyRnw7ONpKwp
X-Received: by 2002:a05:6a00:4c12:b0:84e:b7ed:7d50 with SMTP id d2e1a72fcca58-84f2dfe8da7mr24449041b3a.16.1786090524996;
        Fri, 07 Aug 2026 01:15:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3c948bsm630035b3a.17.2026.08.07.01.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:15:23 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Date: Fri, 07 Aug 2026 16:14:53 +0800
Subject: [PATCH v14 1/2] rust: fmt: fix {:p} printing stack addresses
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-hashedptr-v14-1-817009769ffb@kylinos.cn>
References: <20260807-hashedptr-v14-0-817009769ffb@kylinos.cn>
In-Reply-To: <20260807-hashedptr-v14-0-817009769ffb@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786090507; l=1203;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=2TV7ebtbvkj1szJHQaiHLbPPgbAjz9bEw83GICTxwwE=;
 b=fJImUI8K+tRDvmv19v690yBFDoQrgfWvErEdlYbmlU/8PDi2F+2oZo7MtG8BRWOsGMSk54f83
 9dpdMlmEkjABkuJto3GaH6G/vRqqf2LDZWgW95fdpOT7mtT1TnQC2BH
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=

The `impl_fmt_adapter_forward!` macro forwards `Pointer` for
`Adapter<T>` by destructuring `self` into a local `t`, causing `{:p}`
to print the address of that temporary stack variable rather than the
actual pointer.

Remove `Pointer` from the macro and provide a manual impl for
`Adapter<&T>` that passes `self.0` directly.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 73afbc51ba33a..cd7d9664ff5b9 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -43,7 +43,14 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
     UpperExp,
     UpperHex, //
 };
-impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
+impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
+
+impl<T: ?Sized + Pointer> Pointer for Adapter<&T> {
+    #[inline]
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        Pointer::fmt(self.0, f)
+    }
+}
 
 /// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
 ///

-- 
2.43.0

