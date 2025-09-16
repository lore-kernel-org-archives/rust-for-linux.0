Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BF32FFFB9
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 17:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758042833; cv=none; b=BeHcgZ47UfikL20weyDX+X8y/GGN5FsiGyvwGEZ5faWSiEs4+QBv0FZLiTl9lNh/iMQF6ztjxxSoLzr0CfqiiyqSDbdzkQO5q27D6j6gZwekQWn+IM7C/smdI2A3xFUPPCyoTst7K2u9aAFe/XugACnJYF9WbInJRY5A+4LcYh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758042833; c=relaxed/simple;
	bh=PRtXFrqG9+2j9ZTtdc5hIyND05mJaNPrt3wyHxjpkv8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mqcULhD2VUkLhcXAlYjRdled7YcBStEFoyKeujK6pYeWx7dB2xzsEKRKJzOvaXiWuVsrag834+o1RGcxKvj5r84+p/kHhRYs+wCkJvixptMnXWGvD6Vb/x3dluOfPm1qOlpAl+ciMNg8VqZITjO+RrUbRd6MqgYVsZ+vaoeUO8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpQUG3PX; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpQUG3PX"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-30ccec928f6so2384994fac.3
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 10:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758042830; x=1758647630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pN7irB1Co6sighopGJF7gG4VawVJzGo06VZPpbBUeRY=;
        b=FpQUG3PXPjEXvrHDaFuvcTAFgdW+Y1DOWtfTdbrud3T0QODLpg6tdNvGvXKrB4om+j
         s8DVZ2QRDN6YXLFILNc7fNqYDpeafwynWGg6NJNyzlLVbyvoW4BJ87aXFPm2wM9UJhWM
         V30NjJWHctTw7Obn5air6y0OviL2FbM3/TzvkVc4nruzNZkPG+akDIV/xvIIk50gS0H3
         t4OEUdIvDUk3H67tQ/nx8S1co94AA6WPDk+RMvQ02BGJLLdhoJ1A+WxYRC3tVfEMldaE
         C9FtntJcEPeWi16CQo2WlEad7szmWrKn2XgKM3F0E02+2giIqE3tZZITa2POyZjm3zs/
         5QVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758042830; x=1758647630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pN7irB1Co6sighopGJF7gG4VawVJzGo06VZPpbBUeRY=;
        b=l45mplw77U0L1cpiX5K9HvWSbkXEGuKPhrU6karqCMhuL/91e7JqHscuhL1Yr2nvaG
         4rW8JqaeewkiIJKF4tvhjQo+574UglGQQDFJssijGnjdWQkkRv6H7vZSG4JGArV6YOCL
         QXl5d9VNtc5rF9QGyvlE+VD/iHMM/zWe0jymOC58r4NjmZumP7tlAi82Vmypu/c0Mb2D
         uMW3G9NFrGwZcMzvvuZRiq3tnOpxk0p7u4IKjTR6mQqBU6qIDkrkWA0+RKCYvjD3PtyM
         gM5Oa42vsnrx70JZEoAiYFBi0u7rwYDLCe/GZWrmjjNcVHwUbSodJmxr2NhosZC5A0sM
         vd6g==
X-Forwarded-Encrypted: i=1; AJvYcCUxT+R85VxPbJRtdE7r0pQjNtyGrWFWuGZniH6A7aAieSTD5S5hdk+gP3w9gsXfE/TS6SWEVr/g2GbBBgiFXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwurR4ztK6FhfmIXsAEtTl7S3Najrprc6NukpPcy4DXbOYwWoH/
	Fe+VeGKj1ZPTIUQ9J52RpbnVVzRn/RHkZs8gjac+5SR9Zti7Wz0JCGZoRyE5uNnkQXtgv4gw6rd
	DPft3P06VP33fE4kDV0tu69TKdbu1Bodc4GjRKtpACSJZ2MYPeg==
X-Gm-Gg: ASbGncuzGKi93lOuk5sQ+jbFNnHo3NLtW2DGMnP4So0RJNmDM4RN94hRO6IobHDEVfJ
	x6ni3f4kw0ScLE94y3YyntrDFIRMOdMYcIpZ3ZO/8a12q4rkkgMxhZOeYxkM+twMCTHAPwj9od1
	DSd401C4ktDcWwGFYRYYGkBSIbEBrt1YTw/ua3YUJyn7I83ljnvUF2wocWk3quwUTpb7MeFsaf1
	Uj2xiJuPA==
X-Google-Smtp-Source: AGHT+IHNL7E5MM6ST9Dssd3Uk7kmhRzuACb68kP+b/73NM8zJeNTTvvuZKgwQdXeXhctOHI9VLsSjRnoiBVObEk2GdY=
X-Received: by 2002:a05:6870:7907:b0:333:30f3:cb50 with SMTP id
 586e51a60fabf-33330f3ce2dmr2784096fac.8.1758042830538; Tue, 16 Sep 2025
 10:13:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tong <djfkvcing117@gmail.com>
Date: Wed, 17 Sep 2025 01:13:38 +0800
X-Gm-Features: AS18NWCd1eg059A7FpVxTIKZFnQrM5d9AywpW_y-j4Zh7xfE8Gq4rjF-eJySaME
Message-ID: <CAMfjjQ1Gtjg4iG8L6Xdm1HP6FmoVgDHC6QhtMEGbA6_y-_6SXA@mail.gmail.com>
Subject: [PATCH] rust/fs: use intra-doc link for `EBADF` in `BadFdError` docs
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Cc: onur-ozkan <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From af7f05e99ed67f57c83e51ca3a1b3010e3e87762 Mon Sep 17 00:00:00 2001
From: tong <djfkvcing117@gmail.com>
Date: Wed, 17 Sep 2025 00:25:44 +0800
Subject: [PATCH] rust/fs: use intra-doc link for `EBADF` in `BadFdError` do=
cs
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

In rust/kernel/fs/file.rs, replace plain-text `EBADF` in the doc
comment for BadFdError with an intra-doc link [`EBADF`].

This improves the generated documentation (so the `EBADF` constant is
linked), and helps tools such as rust-analyzer to resolve such
references from the docs.

Suggested-by: Onur =C3=96zkan <work@onurozkan.dev>
Link: https://github.com/Rust-for-Linux/linux/issues/1186
Signed-off-by: tong <djfkvcing117@gmail.com>
---
 rust/kernel/fs/file.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 67a3654f0fd3..f3153f4c8560 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -448,9 +448,9 @@ fn drop(&mut self) {
     }
 }

-/// Represents the `EBADF` error code.
+/// Represents the [`EBADF`] error code.
 ///
-/// Used for methods that can only fail with `EBADF`.
+/// Used for methods that can only fail with [`EBADF`].
 #[derive(Copy, Clone, Eq, PartialEq)]
 pub struct BadFdError;

--=20
2.34.1
