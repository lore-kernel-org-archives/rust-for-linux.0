Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC5F1714A5
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Nov 2024 19:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731613371; cv=none; b=emWqYyVA57pBrze1kOILD/S/ugjabwidEdbfTDSvxUJ3cMOas9TZ+3Pd13II1RrVw+zI+5cG6IUA8H4+M00RIByYsNcRTaG2jAGbaO9uoD5Yh8+XCTJjrtVrsrqSXWS1tstNq0MmyPbNSxwFJPnYhZNuQXWfJZS4HidCwS9aR1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731613371; c=relaxed/simple;
	bh=XuDO2xPfXsCRFX6nWnNUamQS3cWhfIy96RMkTMVmWDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J1kT3U7CvvJlZCLpKyuMzhog0taLDoDBzJJFvKAQCv3Ow2106gZT7Ox7DMvk9d8J6Yhm8axlCnwk+AiEAnX9SWXK/BYGBno4z/ulVps8MIihMebilPQZarQjKuIzgd5XEHb8OnkvReUexexIv9K4iRDFhalRoNKJ8UKw/65szOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=0U62Ihpj; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="0U62Ihpj"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2958ddf99a7so873995fac.2
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Nov 2024 11:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1731613368; x=1732218168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vr7zna5CY0mtOPbR1MI4f56Ig1ycRAEcLIEKVOcAXDU=;
        b=0U62IhpjBJkJ8jhnp6PerzMO1yKTUf+kBJ+MX4jnAlkB3Xv9FH0hDBSct3JEZ/sRbT
         bSa46vv1CF/366VFsP1WvK56vQd5liLBgMUQYKE+PHMlKsBupb5F7/foIlC60Xe+Wqjb
         xxTURQNi05QKuCgEgQM2Hk65S8FoufTlzMlzWVGrLJAPUxnolCyxM5yrX34NISKnTr5W
         nIoLFVAQ2xwGJxOLQ7iuTs4wAgxdAlkGKycj0z52nyzA/RqoLHnQOQBfiKtQRRhlLI6P
         KNURSEPOR2ubiU5upDppXrjWDTMzTN22WapjuLzYI5VcrxvlDeBRQ2hlvOGZ8D8gu7/K
         GgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731613368; x=1732218168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vr7zna5CY0mtOPbR1MI4f56Ig1ycRAEcLIEKVOcAXDU=;
        b=AAEiaWHHaZx9607rMlxytn5hfBevxntMUGuqy+Hv0OhxOIuPhGL51R8MMUclpADXlA
         DGz2xpiPQhq6hGwtAr4dW/44e9xLzSXU15g2Ow1tZOhUbG57utDDqLIVL5AMQ8f+doji
         RFUihymkciDcVxZianBmvQZx+VBrNV3gkWuex/yLmYorOlmcDHif/7rgzkcdV4fo6xmi
         cGf9FEDnIdKFzzY7iQ5qIdzsw5aAvgexihN8snctaF5NbwMqEdVBREJfMQCq02zxoEXJ
         m48q25pBr8k6GGXAIwsdo2jvAyXcapTyVswMyTWWlXJF21/08rWBI/YXbb99CvnOebxH
         ZuPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPu8NeyKrn21WbANBIjWHeY9l4F7cY8Yx9x4HSfAGcdzxwgUmGSnu5xMRD/gEaC1En4Pnz6BQZ390pib4a4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQXwRbBfB2vukOG/62B8PW2pur2pH4mVJIr1hvdnFL4fqefg9y
	vG/yUe12J/wEl2NpTGInROxnYlKOoNMNraPxQQA1dAntBk7s4fQoDPZv793pUPaEVSY1IgsYvGe
	YDeUY2L/Bg+yqFyQrtwPEQ8OmNHu2aFeWGbbu+g==
X-Google-Smtp-Source: AGHT+IE7IAszo2Ofcnb5CJApfslfrhebe6+KotkqD26HLMaoSZwcrxBcDHRhGqne+dneeGlSCF9wiByuzGKGCgAJvsM=
X-Received: by 2002:a05:6870:829e:b0:260:eb3a:1be with SMTP id
 586e51a60fabf-295602604f4mr22426537fac.34.1731613367891; Thu, 14 Nov 2024
 11:42:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241105114819.14051-1-guilhermev2huehue@gmail.com>
In-Reply-To: <20241105114819.14051-1-guilhermev2huehue@gmail.com>
From: Daniel Sedlak <daniel@sedlak.dev>
Date: Thu, 14 Nov 2024 20:42:37 +0100
Message-ID: <CAMFZ4eRZd0DDUZ_4+kEsaSGonDjv5HGrAc+0YbQyBuD5ZGXJPA@mail.gmail.com>
Subject: Re: [PATCH] rust-next: make from_errno use try_from_errno
To: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>, rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Guilherme,
I believe you need to send a new patch as a `v2` instead of pushing
changes to this patch.
Also in your commit message, I believe you should only write `rust:`
instead of `rust-next:`
see other patches in the mailing list.

On 11/5/24 12:48 PM, Guilherme Augusto Martins da Silva wrote:

Modified the from_errno function to use try_from_errno to reduce code
duplication while still maintaning all existing behavior and error
handling and also reduces unsafe code.

Co-developed-by: Daniel Sedlak <daniel@sedlak.dev>
Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
Signed-off-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.=
com>
Suggested-by:  Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1125
---
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 7cd3bbab52f2..077f95cbb6ae 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -101,19 +101,17 @@ impl Error {
     /// It is a bug to pass an out-of-range `errno`. `EINVAL` would
     /// be returned in such a case.
     pub fn from_errno(errno: core::ffi::c_int) -> Error {
-        if errno < -(bindings::MAX_ERRNO as i32) || errno >=3D 0 {
-            // TODO: Make it a `WARN_ONCE` once available.
-            crate::pr_warn!(
-                "attempted to create `Error` with out of range `errno`: {}=
",
-                errno
-            );
-            return code::EINVAL;
+        match Error::try_from_errno(errno) {
+            Some(error) =3D> error,
+            None =3D> {
+                // TODO: Make it a `WARN_ONCE` once available.
+                crate::pr_warn!(
+                    "attempted to create `Error` with out of range
`errno`: {}",
+                    errno
+                );
+                code::EINVAL
+            }
         }

This is highly opinionated so do what satisfy you, but I believe the
`if let =E2=80=A6 else =E2=80=A6` pattern is better,
because of the indentation and less lines changed, see my previous
patch: https://lore.kernel.org/rust-for-linux/20241104185135.18974-1-daniel=
@sedlak.dev/.

-
-        // INVARIANT: The check above ensures the type invariant
-        // will hold.
-        // SAFETY: `errno` is checked above to be in a valid range.
-        unsafe { Error::from_errno_unchecked(errno) }
     }
