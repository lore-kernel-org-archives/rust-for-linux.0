Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02554145B0B;
	Fri, 26 Apr 2024 12:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714134070; cv=none; b=CD9PxpjuyLh4ul4+oVifINMbWwHNXHi5yWOFYYgmCGMeyRuShaPzWezyl/Xesu0nHrYumSQoINOGRZ7UA1hCWxOA/BOlvd2C8STnnJexjlMBgH2iu5b69D7/K24kVUuueH5fH7HImY0hIrtyc3Gcw6bZG2+oGcXgXLC+1ngIe6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714134070; c=relaxed/simple;
	bh=VFUk/8mezBkp2jG4lxOgugvzQyyyqYxEDgBoU4W+9R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGqRuRj3H2jcPPMpMYUfAl7tqhFo47V2AWe9XKNwxFZAMq+q612KNmk+GTft3B8B7v/oYh227YaLdrDInvTrAGmRPFbJMhP0D2Dzf61X/2NDErFzqlRTIY5iyLQ4Q7FKwnw3Uxy05ibvO+gHP75X869ZOIGEBha5D3rb2M3QGKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEqylk0u; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEqylk0u"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2a2d248a2e1so2334588a91.0;
        Fri, 26 Apr 2024 05:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714134068; x=1714738868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFUk/8mezBkp2jG4lxOgugvzQyyyqYxEDgBoU4W+9R0=;
        b=DEqylk0uEUvtFSNqHjqyT4X9HgIoKx6/BAEipxEwiR69CL9ZBiO58G6NeHGG4OzgFC
         aHLCumcD5JEXzO0qNFBiAXmjtpcb4m9WlNJjiPthUPFYpzjLVE5WCC9Z8rzBeydSlnOQ
         rfyO+ktnMFs7OmrfoxG39Cm8pxbJsfJjGlNeTn0ZIY74OPAFxGr25cGb8YvS+nWsjjCD
         A2+ru4bEqLdPcu53q/HL5wCmsvnzZLXkJNWh2mfju1SYWw17nRfxajLdSvEU+id59B3O
         8g9fPvj3vDMeDu4udfEneA2eulaGkaJcLxKsHYmlZ8h3mRTfu1FWE2RjMF+uWdL8C3x1
         Z+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714134068; x=1714738868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFUk/8mezBkp2jG4lxOgugvzQyyyqYxEDgBoU4W+9R0=;
        b=bUwwjvaiSMYvxZsN0J5zFyFS5LaLm2n0Q71QmVsK2MZxyZV+GEfdhWOSrh6h5coWsl
         Pf2y7tePDM2+QAcarpDn14kFZtDpRtr4BYYjHpHg7fBv7DTbCwFebR8e7OjUep1Pv1Vk
         H76yKRW2mn3ybucBDFeLfaTrCTmhYUV56YLv43R+YbRGE+krRRc/dG97P3zzdn5wieW6
         3kHswQl13kaUBzkIpw5fagXgZO7Veiq/2WRjHESZf/+aLgEEywzdvYlwgHrYftQkq1p3
         FLXeyikWio+AN0o3D6m1P5mH3Jcf0pgwdTMnNEA0fAWXrF07FooI3YR4iK/sur8uCUcN
         J88A==
X-Forwarded-Encrypted: i=1; AJvYcCW5Sy0vAfqHjNemh1se3hZgZG1wRmB1XZTG662IjgXl3aFDNV4Lnph/ncM63mC/dnoxbwAAbuLueBEu2jrKu2tVq8h2a6OII2w/uzr43FVFwiyOz8NC0rPAsLdoONDWaRu9e7/HupF5t6Q=
X-Gm-Message-State: AOJu0Yz0CU4AzBOmJCJdt1/HFPPK1Ypv2HVIPweR7b0baB9hnRWhhVQp
	/2gZvlMyidKvWzV9MX0klNotELnX8eCAn+H71WftsaSYb+ug6slUFtE9tepUgoGUfGWipwA6xny
	XH7IFKoabcyhOSF14gye7IC9UhVw=
X-Google-Smtp-Source: AGHT+IHQ0i2Z+JiSphGpy0VElFmysG0D6y1RO6zJ2spHmtLaNeadT9T7sGBsWfuOBTgfYf9daaHlhTS+KLOAtOcApTc=
X-Received: by 2002:a17:90b:28cb:b0:2a5:575:c58d with SMTP id
 qj11-20020a17090b28cb00b002a50575c58dmr8343368pjb.16.1714134068133; Fri, 26
 Apr 2024 05:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1714113680.git.siyanteng@loongson.cn> <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
 <9cae4c4a-55a6-4c6c-9780-866f796a52c0@loongson.cn>
In-Reply-To: <9cae4c4a-55a6-4c6c-9780-866f796a52c0@loongson.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 26 Apr 2024 14:20:02 +0200
Message-ID: <CANiq72=b=G3GPVWQ2XV1MT-wdT0KL4jZVQfD55Mcz_st-G7r=Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to 6.9-rc4
To: Yanteng Si <siyanteng@loongson.cn>
Cc: ojeda@kernel.org, corbet@lwn.net, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 12:35=E2=80=AFPM Yanteng Si <siyanteng@loongson.cn>=
 wrote:
>
> I'm thinking that I'm two commits ahead of the doc tree, it doesn't seem
> to fit
>
> merge into the doc tree in this window, and there might be conflicts on
>
> linux-next if I splite the patch out more.

Hmm... I am not sure I follow -- conflicts with what? These patches
only change the translations and they all get applied by the doc tree,
right?

Cheers,
Miguel
