Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919D039E16B
	for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576163; cv=none; b=T+jGDRacmwsH3bL3GoRz5w8/qMwy1lP14FCYgPA3ZH7K345fytzZ0Mq/uG+MiXKbq2agNQfCX7wZzpMXTkvhRLxlGe6WLpjfQddOP3NLZJBBpNl93jlSLMA47O3Q+MvDpYmDaEpEm5qNLj3SQRtmyCnCvzmHJYHelluDbrZf4ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576163; c=relaxed/simple;
	bh=TNw1b2tPZgOIqHF2PoNmdNFwLJu1oIllIC1dFgtv6rU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M4X+BwhEEXPa+6s3bU3lX5czLzctihs4QoAq8cr440LbVKlun6SSCNcVVlWwOqDp7O2Pvtuv9v5PvNAgUQueLM8imTTwl5cTnAv5Uc7leNP7kZKxhHTyUqPx+W/5VgcenUIxS+/y2qEPt2C9jwltRg50qff9godDZK9/zzoJ3iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ad9a9be502so32285105ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 01:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576148; x=1779180948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fSWP3YMJP0o1pSCYQkQoyka2chD97zl724ij7vaSWXI=;
        b=eFHHvW7CR4W12RWw6+Uw3Sp0+aALMqfiZR+83nS7myNKD1wtc9HUCLbAx34X20WSYu
         vcMqjMwFlEk6f+1wF7pYTFKJyaNNs69IiU5EOgVkX7vm6hKtTl40yp99Oxq9NB0hUu5h
         4o0zIRqOb9e2zAszNhChZPvHovJwZnpSYSDwzKGmbnVd/N7RLkX9eJrGVxFFwzGR+2lE
         n9d+DXbsfLKwH4khyu9iO9mZ/f0k6etcckHw6T3upuhS726QneENIMk1jWMRPcG02NqT
         EVuEj3gAjUKQCmLmGrJQK2mjJroVW/YCF+ItDQYUBTwNsKVoMG0UE5MwL3kkq7SJYdsw
         AmNw==
X-Gm-Message-State: AOJu0YxOZF8hoBJE0q0QDdBvRcPpxqIjgH6bFuqb348jU3MNG3xpRwpk
	aKZR8D0Wah03n0cwtOQe6LlqS33KYOVG3anhS82riDJQyjwQqbPaiZkw
X-Gm-Gg: Acq92OF1qCgwbfpaX83+M0R3KXw+bqVuj9OgUf7X5Ec28A9NHp0wOtd9z0nCAYdZUFY
	lpy3URqaEs1cmGBbmjE+7ibpSTMtkXMzAN/sY3TlJZk9b4DgGg7czin0WM46szN2AiJN5LFJj2I
	S5JySTaJ8xRQqD2A8MCYKYucPGwmclAB/sgY5ecTTuElRaX7FQwCEMAnz6NH6cRshILweD8egtF
	x+Xvh8KmtV/oZy9CutM0d2e/tvNZ72Q5+B7kdTWT1Yk+ijJ9Y5sbVh3F1pIbD1ecZQNkB5wPAZ7
	Y5dICxDrDM5hb/k7wuCtmCa5qsrqn+HhxQWEd65xn3VRmwEHrGtx24dKyC8PYZggiGobKpz5bEc
	kowkyLQcUNchItsRDGp3ZYSOpfGM7pf3emRHxREnX8zfuuBtB4jXPDQ+DnuqjiKgyC1o=
X-Received: by 2002:a17:902:e750:b0:2bd:907:2cf0 with SMTP id d9443c01a7336-2bd09072e39mr15136165ad.32.1778576148519;
        Tue, 12 May 2026 01:55:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e365a1sm124209215ad.44.2026.05.12.01.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:55:48 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Date: Tue, 12 May 2026 16:55:27 +0800
Subject: [PATCH v12 1/2] rust: fmt: fix {:p} printing stack addresses
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-hashedptr-v12-1-61d5c7786889@kylinos.cn>
References: <20260512-hashedptr-v12-0-61d5c7786889@kylinos.cn>
In-Reply-To: <20260512-hashedptr-v12-0-61d5c7786889@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778576135; l=1236;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=TNw1b2tPZgOIqHF2PoNmdNFwLJu1oIllIC1dFgtv6rU=;
 b=lDOMS8cEoHXYQ3l5P8a41MgiZEcfsSs0Ntx2JmCoOGWaVdcMxl1uzq/kQjN6/MgBCkoTspDXA
 hh2cNFJSY99CYB4uUHDwa72B26Qf09LOqgsVUnF+6zo3U2kzWYhkmz0
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
 rust/kernel/fmt.rs | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 1e8725eb44ed7..aba9f3dbd3175 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -28,7 +28,13 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
 }
 
 use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
-impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
+impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
+
+impl<T: ?Sized + Pointer> Pointer for Adapter<&T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        Pointer::fmt(self.0, f)
+    }
+}
 
 /// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
 ///

-- 
2.43.0

