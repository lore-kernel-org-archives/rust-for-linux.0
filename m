Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B884343BDA7
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011306; cv=none; b=kMUxOhRPhPjStuBx/4IWGEycDgQPfzhYRlW6lwKtegt4ppczG4EzzPY47pv2n7bvFhtOFtM5AK83ta/GO+LS1I9RecBbVjKV9BztmI4JyuTBBsaQVV02LHCdyJ3sph+DY/WxiseAnAqOEp2TYpX0gXLXZ9ScYYGs7T9MP1hSGQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011306; c=relaxed/simple;
	bh=/1IThqNZdMCBQDkEFek6hXi6ulwTTyOpmnCMtAXyxtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M74m4nVT6cfq1ppVOQorLXPiUtja3ahLYCDAcFG6gmwu0Lrtwn6VtYtQjSOGxvyub/QF+gUadMc2DxrJNfVNJGYNqgY1yHHiU8n3QrBz2hedgRSRwKFymDHDEwIJ+pSEX1RGntsEiLQU3AKHR3yB8T4nwlFhHmVWP2xpld7zcH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfciAAWJ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfciAAWJ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso18825765ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Aug 2026 03:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011304; x=1786616104; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wV7tV6jRZ/wrxgtJ8vfKgjHl3r8tGZBMqdy8W9OvNng=;
        b=WfciAAWJ/Hpmo5ukdXb/rh8u5cIs+a84g08ew2B1k2ER+dHI0b+1IQNxdlUjFgQ57t
         m1gy95pWUSBnuFht9FrdsQr4kwm6ZWkC4/Eqmx553iYjvBY5pvydSfxmZBytenvA97bP
         P9s7yv3YZON5nZTOptcuOW624DNpdy1eNtdOt22ebcM+dzf/5FxPjjVoA7HIWXanwb3U
         +Z3ouLCnlrHHtW30LG9KGZUQ7e8+ve9I9P/rhqgCmQKh9uAbT4u+wsMyCiavRtOHUUDq
         Pznw5OHXEoZzzTg1ijdNg60IQZmkTrgeLHW4oFIBdwjEKYU4A4lA2zztgrlzwI4C9Avs
         k/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011304; x=1786616104;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wV7tV6jRZ/wrxgtJ8vfKgjHl3r8tGZBMqdy8W9OvNng=;
        b=N0cnhX5B2faE/Njbq1T2OyS1pTcvAJGDdb3cgsGwkg7k17SQKZry0FrbL8ns/GveIO
         dfdMShcl70aET1Fu/oOFUzPencJGX5z+SdAoStrv/XhjTgr1AOCNJd5JH+UH7m6Ogf5n
         hgj4QJsX2hxji42KJQtxZNeZ/YV2ZlLd/DOrGx23ETFU6nUOyoOHXX6fDklCMOvfPMmm
         8x12zk2rpy2aoOizOaZxzh1laaxsyBAgUX3JCMDyM6qMUwwNGWDr1NRX6ZUGvLRFIaEl
         9/QOEu4NdLS8Z4Re2aonLpmCgoGBJU414Mm6p1PqDmyGRu+ENr33XA5gYWEH5tg/Q8Kk
         BOWQ==
X-Gm-Message-State: AOJu0Ywsl7Yqe+BouoJGW0qal9sLA1a9rsd7YFWZb3yV1WR1/lhH9M7N
	vro4dfcypRgq9n6mzeFQj3I7VETJHyaXznxQnoshGuLioYrCea3rU1hz
X-Gm-Gg: AR+sD11mAZQsr99d70nN/VYMkmKLuFkmRtq22hA+jnRZogJDBjqfc7LMP9yf7WwBGIi
	zG82aF1sb58P9ZjDnPLkfcpzVWXfOXbvNbtdd5pKro286kYT10wab2hTsvPi6LzSDb9LudCR1rO
	9ZCRPrPuC/jEw7PGd8OATDM61tTwGDHmNpKvIE9lQC+GlAnN+cqXMxnu8R0nwX4zIIMyBlIzYo8
	Ck0aTwO/xgLiUqarF6UYuxE7I11zEGav+g53ZDLOaSk3wq3GsRWDnk0HRBlgNn9azYHXiFn/OYu
	pNhQtk4CmiZXkyaINITEtV14MTEDDtYPofbdQGWQmJfQuhUCNEpVeJGoAPKq+AImVRBE3hMWKf0
	1T4hiJr2q8eCnSf9zPHB7KnLV7v47pDSllSjOsBxcpSyC0DxLrx+eV8xqctEqinWAEcrV2ebBH3
	tmlBrsn+SVtbwUSGmaCfw95OiPEZRB2hunFoEfGaRnrLFp1bOFDoC1jfHvMIwDfMQBxIIzW8cfD
	dYIDkFJya2MEk15RuiQ4ud6
X-Received: by 2002:a17:902:d986:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2d0caa031e5mr167981045ad.21.1786011303938;
        Thu, 06 Aug 2026 03:15:03 -0700 (PDT)
Received: from localhost (S0106c4509ca6eb5e.vc.shawcable.net. [24.80.190.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f8fc8csm30758685ad.15.2026.08.06.03.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:15:03 -0700 (PDT)
From: Ethan Plant <plant.ethan@gmail.com>
Date: Thu, 06 Aug 2026 03:14:32 -0700
Subject: [PATCH] rust: macros: Allow omitting trailing commas in module!
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-module-optional-trailing-comma-v1-1-d04811335e59@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNywrCMBCF4Vcps3YgtiGoryIuxmRaR3IpSSqF0
 ndv1OUHh/9sUDgLF7h1G2T+SJEUG86nDuyL4sQorhl61Rt1UQZDcotnTHNtS/JYM4mXOKFNIRB
 qTcNgnBuNvkKLzJlHWX8H98ffZXm+2dZvFfb9AAmF12KCAAAA
X-Change-ID: 20260806-module-optional-trailing-comma-44a336ddf649
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, Ethan Plant <plant.ethan@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2181; i=plant.ethan@gmail.com;
 h=from:subject:message-id; bh=/1IThqNZdMCBQDkEFek6hXi6ulwTTyOpmnCMtAXyxtc=;
 b=owGbwMvMwCXmcODvRtktquaMp9WSGLJK4pZJR6j3xv1lr/69+Uq8+2Zxsxc6io/6DTmzwv9d8
 fmT9v9FRykLgxgXg6yYIkvol6n7tyaf8VjyVooJZg4rE8gQBi5OAZiIjgQjw96t/nf3C30oMljb
 o5RUm7Znkeu2AB2lE/Mmd2hKcKtf4mT4p26/PvZ9IMscy2UhvqLOv+M+f5mktNLTcpfOX+15LX1
 pXAA=
X-Developer-Key: i=plant.ethan@gmail.com; a=openpgp;
 fpr=55F495BFB563CC48A4ED1A0240C0FDB11DB42537

The module! macro currently requires a trailing comma after the final
argument, despite using syntax modeled on Rust struct initializers,
where trailing commas are optional.

Allow parsing to finish after the final field when the input stream is
empty. If more input remains, continue requiring a comma, so missing
separators between fields are still rejected.

Document that the final trailing comma is optional and update an existing
module! doctest to exercise the syntax without one.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1172
Signed-off-by: Ethan Plant <plant.ethan@gmail.com>
---
 rust/macros/lib.rs    | 4 +++-
 rust/macros/module.rs | 7 ++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 4a48fabbc2682..f6474b194687f 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -61,6 +61,8 @@
 ///
 /// [`Module`]: ../kernel/trait.Module.html
 ///
+/// The trailing comma after the final field is optional.
+///
 /// # Examples
 ///
 /// ```ignore
@@ -112,7 +114,7 @@
 ///     authors: ["Rust for Linux Contributors"],
 ///     description: "My device driver requires firmware",
 ///     license: "GPL",
-///     firmware: ["my_device_firmware1.bin", "my_device_firmware2.bin"],
+///     firmware: ["my_device_firmware1.bin", "my_device_firmware2.bin"]
 /// }
 ///
 /// struct MyDeviceDriverModule;
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 06c18e2075083..57ee79b49a7ec 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -261,8 +261,13 @@ macro_rules! parse_ordered_fields {
                 }
             }
 
-            $input.parse::<Token![,]>()?;
             seen_keys.push(key);
+
+            if $input.is_empty() {
+                break;
+            }
+
+            $input.parse::<Token![,]>()?;
         }
 
         for key in REQUIRED_KEYS {

---
base-commit: dc01dfb37b34beeefcfe1c3055364d41a4070c7e
change-id: 20260806-module-optional-trailing-comma-44a336ddf649

Best regards,
--  
Ethan Plant <plant.ethan@gmail.com>

