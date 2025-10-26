Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC512E8B8B
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761489006; cv=none; b=UXTb9lrzdOQ2pZ2ZmTaXMuBwSWcIOFx2B/LeXx9plYYpCfJzl/rZxDR2L8qZAIfM6NPx/JNQntG/LFDZOUprgEw85p25TGUuNBnuSWEaAEbYGTJQCtc8FlQnEFvpaTzz8UUz2y6vwdYiwwaTbIVU/42lRDq2j8TVzu/OcfEyxXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761489006; c=relaxed/simple;
	bh=ZMBASMVtnBa1PP4cxjX6NifaX9MKgfOlfcgiWr85ZqA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=crMbBwKFjF6z3IG0pUWlXy35rP8TSGu1GoZS1/RptwlVAK8sO2O7RLZFqKM96jmjLYRSIr5pjX+NGpP4TpgzhRlTK1y7rahd06hnf4Y/xiX2w3S1cVTCgme0ZhH/RDzMVErLXlu6W0wPxK/GwaYVdfXFwzdEMOIIg5A61ddVcaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ge46rBGU; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ge46rBGU"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-78356c816fdso38023017b3.3
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 07:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761489004; x=1762093804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMBASMVtnBa1PP4cxjX6NifaX9MKgfOlfcgiWr85ZqA=;
        b=Ge46rBGU368OWN2kmYi0CdXtoGzJ62U+I38pRGjNODlU66NQK780PkZ4gwdeA/twBX
         Dspqzb0NCQQDPTrdvz5ww5LtswnNVgYUQYZi+jSKZZ11oeds3bxFhI5MjITiAeF+IAGl
         eo38n0V8fwfG4XbrKq7fav+y64FBNtSPFZIvb1VuVqtsj981yPHeJuwokHWAfaYLweJB
         yeA8aD/qLL9oQDgPr9wtef8KQIf0y8b/huqQiBe40KUMs/sz7W0wWNv+Q4NV79TwfXq2
         AjaqwyRBxgDXiOzEqvWP7Xac8EF/jbMzsOH31x8cCZQ2iMcPUjE5heMMUBcSYKEy7axV
         1jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761489004; x=1762093804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMBASMVtnBa1PP4cxjX6NifaX9MKgfOlfcgiWr85ZqA=;
        b=Q3BaZq64+bBrhJWOVq8wGYwr40jfUnN4f1e3SEbangDexarRGD6i/aOAcYG8rjbM64
         /03jg3euwiLuEXmVqyi8PK0d6X4cDFH9ZWcwCtQjSjID5aRIJQLxHtMxE4ggkZSfOGYB
         DlwXkGVGEr3jSst5hpkKdnvvlDbbB7mkTuOOGb9h5y9BzkjP88GD9GnXheik48y5XxFG
         +kEqArXR8Wteu/bqrYhAPjxbgpo5oNWjEP1JGsa+sM1Wu/Bo0GfS39S4VsCxA9dm0FHJ
         +gx9XBGIB34EFh28ZUOi1sf5UlFKYK1JzBm5ICoXC3DlwK7Zj/X3prarq6ivkYlepab2
         5c9w==
X-Gm-Message-State: AOJu0Yzn2h4MhiiVsqcdfAQoLL4PSIKnOOPJ+mlWRBXwhGGi3+mYCF+X
	fikj1UADhQfUdC+n3mBTKfEOrqC+HpxXcfXKKYqhd+7/U1pjgwxOo5+AwBIVaAYmOtNtXUINkus
	TMEcAx93r4ZLVksFe3kWmEJ6ZrzLLFphlfmBr
X-Gm-Gg: ASbGnctP8+tH9YMCpdjPLunK5khCcGzS033agvSh4FyQK/t/WzX70y+URwLPSfB2OmN
	Iyh6tTfJ9sL6n3y1lJ3b4pYu9haW/ybZi3hoFGyvyZEkAo9tv9+qosD06CmN7J3puwnLOInEhKa
	Sfll3oYPi4PCft2k6OTEkm8v+30B1yhVmy3XVqixRCchqQCvJpUPRbxPl6i62GIJy8sae2a/hGo
	c1v8jm5S2kX89CxAH0mNfRlceKpI1sE8ugS/u6uziSSd5MJURDx8VOGxABKfUanAHC680+Xw/Xi
	TYIwwOrG16U+yJn+Ejhq/U/8EEaHy68/oLc=
X-Google-Smtp-Source: AGHT+IFplHhxxhepVtWBvu6tNgqK95auQg5sHnU1QHolP/4r4XhVH2q9CWaTT0gnl3dFh8Qxvm/3lmn9BOtV9jwBKEk=
X-Received: by 2002:a05:690e:4287:10b0:636:1bb3:2d2d with SMTP id
 956f58d0204a3-63e16115b38mr22224007d50.22.1761489004073; Sun, 26 Oct 2025
 07:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alex Gaynor <alex.gaynor@gmail.com>
Date: Sun, 26 Oct 2025 10:29:52 -0400
X-Gm-Features: AWmQ_blrLx6Rk-HNpIneEOmsfH242FhjzwfZJDKkuP91hm5_-oofSVpP1XgVjFE
Message-ID: <CAFRnB2U1uvg1vyZe1kDi7L3P4kTFowfOo6Hfo9WJED4qve4ZZw@mail.gmail.com>
Subject: [PATCH] MAINTAINERS: Remove Alex Gaynor as Rust maintainer
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've long since stopped having the time to contribute code or reviews, this
acknowledges that.

Geoffrey Thomas and I created the "linux-kernel-module-rust" project at PyC=
on
in 2018, as an experiment to see if we could make it possible to write kern=
el
modules in Rust. The Rust for Linux effort has far exceeded anything we cou=
ld
have expected at the time.

I want to thank all the Rust for Linux contributors, past and present, who =
have
helped make this a reality -- and in particularly Miguel, who really
transformed this project from an interesting demo to something that could
really land in mainline.

Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3da2c26a796b..355fee6a382b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22498,7 +22498,6 @@ F: tools/verification/

 RUST
 M: Miguel Ojeda <ojeda@kernel.org>
-M: Alex Gaynor <alex.gaynor@gmail.com>
 R: Boqun Feng <boqun.feng@gmail.com>
 R: Gary Guo <gary@garyguo.net>
 R: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
--=20
2.34.1
