Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4655935DA68
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 02:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786414818; cv=none; b=ELRmkr2Lfsa+t8sXSlu/65WsU8UbR+rNphdCVEsWoD3nEXO3bEzyLLMmbKB/FM0waXpBnCHC6VV+ui5JObFc4nWl36DPgZ9S9PYPb2WMxsPu9VEsvnlN4WeeCXgxuRIow2eiiBZcKbWtYNpfFoZy7KiXw2aLbwDzX1rXRPrZZHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786414818; c=relaxed/simple;
	bh=JhyFdGFL7ZqR5okER1KewZZVztj9q2wxwAZJqLFlteQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hVCNtwCH1DrmEFufDK8PgNXczQB/8gQ0T3y4ynku+1qHnRSmwHXda5oBhDyV5UaOn4cGT4jEsoqFjdCiwnr7HYCK3QLyrzK+nbCsvAYVnfOC2pQL6xgxIJq4ezpdIkhV0Ii4YCzXxXOC0tJKgUHcQGsLIFEKFAEsSZu7qqsf9NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso2423863b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 19:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786414817; x=1787019617;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DNkJhpV10P25efhib8hHCCLaLUWaFjp8nGmVhvI8NNc=;
        b=Hch91E31enTEKQSxwic/3HK9oi2uHXfL12ol6xhAH6UVZVwKyZcEKI+y2OF75YOGbW
         nbqeOurrdnH2z6gmgIoT+576iggDM4zgOwMQvaPSIjAdO5gJ0vSnPSqfcPNBdDDmJ1Ia
         uZKhN5KSar9I67npEuwxkL0XQv+Mty4sAXtxHH/XTf44jLuXsOh26nGzIO5luMfR6f3P
         htfSOxTfl206PPXYNhcP7sXs0RV0bzellXIdV6QU94dbO8uxr1PltwqZBCm8vLWyPHA/
         qSUdFDYewlXyjOvWHnY/OApfol9Z2DjJxE8HSJLOKZxLS8UUYC6LwCgWjUf443BItziJ
         +TFw==
X-Forwarded-Encrypted: i=1; AHgh+RpYYyFcHVAoyjcsQ6lPKo2+rT+JnubcAMJXmG9TcEUMhaMtQ2mPlfaanf/GHbUxX+j6rpOhgbrBb/PCJN7aug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJKxozHmtWAQh6eLGRTqpb/uO7oBbLnr09MfZ1ODaRbkqj0jse
	hi31Oygc/zoHQKVj8nUySyJXTrp6Xu1m8TrrqmViH7IXzQHzMIcdGDW/
X-Gm-Gg: AR+sD11KihxhztMv1cfvLBB2ACMDt553oXB6BCsjsvKadQc0+nlbdKCy/d5od4980A/
	HNuTEJqnUR7hIzkxBNAzVaO4LncCwjBwb4vh03I/AUNu9/usleH1Y4iWkUj2ob83PlsWZTB3xp5
	RBcjnc5ukrFAzjdbOzPXXDYjWFylZngBRziXGo38fRVGX8mK2bUxt3DTGyVDlUaJJvgmwehSCKP
	DwAuQF/2Ft2FpqVan/FQ3vEBbxz9koD89SOzjGapQXcVzqkQoJOdvBaVxTjCAcm9ghR9zjNJIku
	1YkSUSnMF0Q27vcBdyfiII+cK/q0HgMG2YetggEXWBV0FDr+tXG8yVfRaThc1F1aQVkBewMAFlt
	MI70kkIvpbbzy12GyvZwpD6PhL2zrBkR0A9NzTnKbhIpzmm3fuQ9MC3moKgcn/Jl58bvmQOL3Fy
	JHtA2nEVB5imQsefRuG9ia83aQFtMMI4LuXU74MxrQde7pZPm8H7/MWQ==
X-Received: by 2002:a05:6a21:9092:b0:3c4:3b16:2979 with SMTP id adf61e73a8af0-3cc2bb0cec9mr299709637.30.1786414816539;
        Mon, 10 Aug 2026 19:20:16 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c1b2790d5sm1321592eec.24.2026.08.10.19.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 19:20:15 -0700 (PDT)
From: Ke Sun <sunke@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Ke Sun <sunke@kylinos.cn>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	rust-for-linux@vger.kernel.org,
	Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH v16 1/2] rust: fmt: fix {:p} printing stack addresses
Date: Tue, 11 Aug 2026 10:19:32 +0800
Message-ID: <20260811-hashedptr-v16-1-e21e70a58153@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811-hashedptr-v16-0-e21e70a58153@kylinos.cn>
References: <20260811-hashedptr-v16-0-e21e70a58153@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786414719; l=1341; i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id; bh=JhyFdGFL7ZqR5okER1KewZZVztj9q2wxwAZJqLFlteQ=; b=RZb/8+p/L4C7yze5DUM+UtKXDLJqMGKSbM3BsnY4AjpywI0ipujN3cDP5y6uevXHHCh5mL0dd AkZbBd0wbtoD+B7vc/kUFXtZ5nLpidEeDN7k8tFddFehS/Q6TQe9zpL
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519; pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
Content-Transfer-Encoding: 8bit

The `impl_fmt_adapter_forward!` macro forwards `Pointer` for
`Adapter<T>` by destructuring `self` into a local `t`, causing `{:p}`
to print the address of that temporary stack variable rather than the
actual pointer.

Remove `Pointer` from the macro and provide a manual impl for
`Adapter<&T>` that passes `self.0` directly.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Link Mauve <linkmauve@linkmauve.fr>
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

