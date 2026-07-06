Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8991C5D72
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 05:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315153; cv=none; b=ixcEf8kq6LPn/Nq7z9cJbRhW6Qt8OCfh1KeWgDHULOOJ0oGFTfRJSbN2fdqKPVsRrYjUHiY7R3z1qEzfXX20RHCwxVDPUNX7Ou312x2sP2zJVKI23BEu8rL5uahwab3JgnFg5nK0ajADsuJm9MjlzEdvy9741KD9e72N86T7qpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315153; c=relaxed/simple;
	bh=2TV7ebtbvkj1szJHQaiHLbPPgbAjz9bEw83GICTxwwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFps/3qlswlUqnyRsZTfNkQwoug9MqmG+/7uEFQ3JnA9jbyLXZR+O3iidR/uOe+g8XxUEJP+ANfuKXT8LJEyUSOGCcchYzlGzZDB9ww/ISd+sgnIRuZLWbAIi7H5bruOnOhKCVUCSWHWPwURntNJWeJZCAKEUmMlgA4UX5ub/5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38175907a56so1375556a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Jul 2026 22:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783315151; x=1783919951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SG3tL/12wgrOEhpyoLjgZFw1i9B1GNATu65IvCzKwy8=;
        b=ndKQW0/20rOJXHOLCQtFwUluGhm05dR9dr+cfqi/lUWGWpz5df5yxqHD5EAEs8+16t
         6Ykm8+VrhoB7PZm2mJtS4bcx4nXSU0xf4pkTBCYnFOzv84gJ4mv2UBWjP7J1j8FQT6RG
         VHIosvKrs49/P8J5XnVIli2XkDaPjPzt8KVMUlGeCBeufa5+Px1Iftz372AEdZMkblrj
         wiMItTeHeVCwm/pHbuKYV+N1dp8N716gph5OFFQjGfHj4t0lD87r5TyyamEb4tSzqIzp
         xfU7ca9K8mSz2vRocVYODKEJ5i7PvqwYWfoNV4u0Q+OkaMW1eaRKOHP0esvmk9eWvEQt
         HCCw==
X-Gm-Message-State: AOJu0YwPQaHg5fhbZgfQkllW9YWZXf6x8FXKpmtvmaC4BTyMQXWhQfqJ
	fBLWpQAf7jAjHksnD8fm85PR4Oho/vPA4PL6HERKeq8Oj9kylVtFutHi
X-Gm-Gg: AfdE7cmOtSHnklOPTsOMtlGWts29kn6EErUi/vpxxAAgUu8sNeqhkf/pLQRGtiNyzIu
	rVty+XgjB3MiwrT7mTXrbXzm0pMceGqQEyAVKuClMyb8+fnjlxxZz5lbm0R45TjDIC+fAkMFdnH
	oz0uMtXoK0SNcP0x9i4pWNgE7CExLV0JS9vBMLW7BBTHXr2zbGhmOF/z1HoIEhJvLisDN1Hkfjn
	OzqhtEAMyqdW+xIorL9VmQ1x4Uu3kKKjNSVg4SFFlnm6GNJ6sLTBZAdmbkmAEeLtktsETQc7FCD
	ZcOvAFH+w2MNwBC9eyt5OrSSgM3FG/wTRuoVXb/7IuEpEtw77l1sRDC756ATnZnh5rtq1JXr9mv
	tjD6uSg7U7Hd6t+Ruj6YpLLzfnXwvzdtHdB798StYpz8hhEPRR0DIxtjClg==
X-Received: by 2002:a17:90a:da83:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-381122ebe5amr13997267a91.11.1783315151134;
        Sun, 05 Jul 2026 22:19:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3d92c44bsm26511081eec.19.2026.07.05.22.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 22:19:10 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Date: Mon, 06 Jul 2026 13:18:43 +0800
Subject: [PATCH RESEND v13 1/2] rust: fmt: fix {:p} printing stack
 addresses
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-hashedptr-v13-1-377a07f2f78d@kylinos.cn>
References: <20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn>
In-Reply-To: <20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783315138; l=1203;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=2TV7ebtbvkj1szJHQaiHLbPPgbAjz9bEw83GICTxwwE=;
 b=eqSWgBVZ+FVyrbLZJienBVfjIU2THagw/3ffhtfSt2u7Dh9HNf6x4uBkI3nzlEse2DJKwpF8C
 EzTqSUFKfS6BbRqq1xcsdbzQubjRZAYmqosEW+p+yKM5/RrEQfd56j7
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

