Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A21386C37
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 06:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343762; cv=none; b=Iz+PxAK5wQTbX2n9Ya43w5knK44K3nRCt36LcP3n/9+NMBVI6V8WzUgOrYvlL6hZ7FlWQr+BJN7c+nHc7zzporvOv4qOARYmfB3hkQfI/UiLWGIRiFvcCmRuPcvDm9lxTqL1RZj17dCZl/RVBDR9xpa3T/ofoIGjXFP1rnAVKNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343762; c=relaxed/simple;
	bh=2TV7ebtbvkj1szJHQaiHLbPPgbAjz9bEw83GICTxwwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NOwVMgPH4AW/WJbFvkpo9RQIxn0KGX2NP2d+H8WL7ehjtApovklb2SyeAgNSDyXRDzDsmi98ZiKRwXmEKgO+wb2d4dkPSDTxSQbmTqCyqka1WDt65zEfxpOlBCIj+3LmRQ5SolvJrHhssIcJfrBZyI53s9fuCtw2rZk/WOlEcuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so1085818a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Aug 2026 23:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343760; x=1786948560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SG3tL/12wgrOEhpyoLjgZFw1i9B1GNATu65IvCzKwy8=;
        b=rNGyyRS0+5vMbfWIxOy2XKIWRjXTrXiJo4uW4uEX16714lMrsgw1joJ0eY0ks9KqRY
         fCSI7R7UIRzgDumsiP+O9KedEHwHN69Ub98qJ0YMoiGETLKadA9fSWWJ5a6nAhGALX/J
         xT7Txhi3lsYf/Zn8Q5WrGeOhI9fttAEJ7eh1TbP6CYqk8zrFtp8AhbiWqcEOHU5Xzzz+
         MAki3P3HJ9pQfaxuqODwtG8DN4CNE2vXePWY1WrrU7KxcHKT9LJrChor/rKGOgZyI54H
         9pnjeiFWAZjGhOHm9Xl8vg8W2i0JWvytk9gyXUvT9wbNPDPE9tZLL2g3HheoXmEenSEN
         GR+w==
X-Gm-Message-State: AOJu0YzCt+J9aK1bbhaImzhSww5rNnVUJTOBYB5Kp3pqALyygH1q3cDI
	qtrMKSOeODT+HzjNKdFk5Aw3cVGIdVhRWKAb+bmQg2kInWOT0NmcxCFRPQOD88rY2vzaSw==
X-Gm-Gg: AR+sD11b7ObtsRV1eT3jEH7II9PLnvCy1fcs9sWPawxjnnlOadQXPthnBB8v1f1Ruhv
	sW/Z3NjbN9ALNh2X7n99bwEqaoj8OVf8a05FY5Dj4Q0hXy30AORh9urh9PhAqcURoPPoSZ/xHVn
	TSYatgNPhTNvde9jeGXuxFxfDY3Pko62eb6oT7p73rQmA6P0zKqBvL1s4Oh3/lbJmHk2ggHMTxt
	VFSQrsDNeSp6wwjJoDH8KRamW60sibo9G0K6dcJaiNGg2Ru6vyTceYfgHnTiBAyolqHr2G/Bt+R
	eecHn9xdUMJGaFazRg0jCN99NpvBRU979qe6JP80ncUD4KRReD2TPwnk8MF30z8Cg3bz+d0CYKn
	Mrb54nJ62YaZ9rFHqEJRs9/Q+wkw2e2ry2Veawp/aLPb+Q9HL/pqbDVftfnI7LFktCcuaUpebke
	RmjKJWAo5NAEmI66vCV8BSMBpq6A8bRQ==
X-Received: by 2002:a17:90b:4cca:b0:38e:c1ba:4f94 with SMTP id 98e67ed59e1d1-392845f8ee6mr7628615a91.2.1786343759799;
        Sun, 09 Aug 2026 23:35:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm46754021eec.28.2026.08.09.23.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:35:59 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
Date: Mon, 10 Aug 2026 14:35:42 +0800
Subject: [PATCH v15 1/2] rust: fmt: fix {:p} printing stack addresses
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-hashedptr-v15-1-eafd27d36476@kylinos.cn>
References: <20260810-hashedptr-v15-0-eafd27d36476@kylinos.cn>
In-Reply-To: <20260810-hashedptr-v15-0-eafd27d36476@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786343747; l=1203;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=2TV7ebtbvkj1szJHQaiHLbPPgbAjz9bEw83GICTxwwE=;
 b=/W9MnBgX+LnoQ9+qbWR18YBHHziLWg4K+AtkvDnHPpOOAPRx3lmNQ3tS6AbZUu0VQeEc8ECeJ
 q9ZwcuGQFdaAaLcu6HkoOV+GMbcXCGdmDXHtPFMYN+0QSV4QYpmSuym
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

