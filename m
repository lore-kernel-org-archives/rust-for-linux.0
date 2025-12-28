Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B31280338
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 20:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766952794; cv=pass; b=HVaACLeQX/S9fhYIZFqv0jnUlIf/a2EM8TNSz3YIJ0chVhWB/EJ44/Bxv1YML8lFhADrWI1x5r9h+keICSzubHjUlOVlkTh+uZqI9MWjjMkBzHD1IPtRdGhdox8oSb0SRWI6JbmVGONVH5H6wRqcClW3O06GToMl3JChAHanz8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766952794; c=relaxed/simple;
	bh=VkYEmaUdiGfsjigiNd4TAsFTIUvKrayI3rkaOebsb14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHlmrCGEq0HBHq/4FBwzB9nTeU3Vi5p+aNAe6jsJ+nLPuisaJDOocrHyQffTdd61e75onRElk5PoqsJ4kha5HE4til1Ax0DUWMddvcvf12HMeeHwMHrhHNEKXJg/krXOneRksc3E8oYJXqdW0JDII5/LwS81rbiNV071N6ESTSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ItRsaSy4; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ItRsaSy4"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64b72793544so71879a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 12:13:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1766952789; cv=none;
        d=google.com; s=arc-20240605;
        b=dJKyE9OOb2cyJ78xcgG1O1KhuOUcJix9O+MIF1XiEvus/9PeurLfKfZQsCFDxjGDxM
         YJLB9ubbfh4qO71Bc3/vh5xr+nli/iNd3vxmO/lkbmctIpyyfDoAd1UZlYcRSuS85GTB
         Q/+zuZeD/Fn1twVP717y8Iswj7ny3TpGIsK18ldniVQEILcQcy5rO+TogQpATvF/9ZQb
         xG1bef49yK3betbEb9fuTQmMwS4J19pigVqztKFrsgwkdbtvY4ZJtZVyV1ITLo74VrFE
         iqcz0kS0MDgorexpSqccnrcRI9iTi6WGqMwzWFu1fxOVlzDeOX3xRzKkFhXetxiQpN9I
         Op3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iZf9jbNZjllfnnNaVh43zXfQOk7cof5ppJcmGiZGc3w=;
        fh=q0An3aoUtfvC6KJsFUd8919nyORU8trAOQMp7A6dzKU=;
        b=RHjo+qrvhpOZTPZa4+bwua8/G9Qcl4MMPQlM9+3w0DY/CssWvRmLPRBEt8pkbrSB/n
         oqg8bEVlZVVd0jtDB20rTgPOz1uCBfMqHgWpjeTXvUtlY2R8M/gGmSNWQpAY6doTeUsU
         daVjgHDzNt4XyCBUhXkc0BjE3gXyhe30jCG/RGxmHXNDA12EmYxHYfLXWe5u9m3VVUX7
         g4yYUAKmmUcpGtXcFdp51cOqb0dKjzwTzee5nm9KGb82hhoxSZcyWRn5QSg4xGNrx6xk
         MaJPJxDUSAJ5CxPQTIggyCYt7gHC6kMz783zgEhz6jcpNfCISOGMKsmle4RqV50lbGLG
         i2iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766952789; x=1767557589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZf9jbNZjllfnnNaVh43zXfQOk7cof5ppJcmGiZGc3w=;
        b=ItRsaSy4Z/m7+09Ct22bOuyWUfxh3sjooS4OgHO4zUxGKlksgkHL+LOsEdNUOKXV1+
         3JxHn5ARR4alrdLiWPGhnY2PP3Tnqaoi8y6SCyDel/EzSmkPOZD1o5iVPBglI/aKGlsC
         08uGZmruaJQDhTDq5WKdBaTN6/UizOIkfBffzGzdAgZ0IcUEy9fmV9pTg9s0SQ/zCReD
         1mAvvWXfiV3/1kIP7UdK9I0h94AAnStFfHMGNQNxg8nLzM5qTSn07UcScifJzSf+CUgq
         DUMDfi/b69zhHH5kjcjZq6nc1d//L55DRqBW09MrP57P0T69UY7gX7LiKZBEIaU5Gcih
         ZoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766952789; x=1767557589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iZf9jbNZjllfnnNaVh43zXfQOk7cof5ppJcmGiZGc3w=;
        b=hTRWMOjXfXBpqNIn5qjr5qYvtU0o9hyfvP1YNOdb3T15/paW7973BdwYPGEEkdBJAa
         qo+Nnkd9AwEowAaTLDMqCV2ghgSkn8Ar/+/7d564J0RKvK3acYpLfriNL9Jdz3+26sVq
         Fpf5sSjYynusmvv2A+5zFYUjXYTT3U6VSG/DEJszLFYayMxE3SbO/SzESryFPKHUQDdE
         3HWZKs/Kb4X475dTBmHJUtWXCWqNgeJXEsiD0uW/pgWu6pOohMineRw83Bf/hs6jSZv0
         TJDzimfbkG+rF8sGeD2zcpecsNi57aG0lD3mqN6pw5kEmdf1IR8OlIeECdTe/yc/7LJy
         cHmw==
X-Forwarded-Encrypted: i=1; AJvYcCVFHbB/9ylIp44EtO5a1s3aqKMqbj2qfrf71Wzl6tw1TKwLwvBQT1YlLUZHVLntGrRgf3ZUHp6tEhJ7vUewwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhgtNAs57+IIpUWRILRKnScKlRsKt15PGb0ZeaTAF5EcFtxenP
	URXjIQTUX81hzbuXjoLszN+t05Ct4wNZ1gAO0uLUkSoq3B/1YONeJqieauhmBsq3dtImQLwPoCb
	C5h/vXYZrK7B7IroyeDwdDNTZlcE7rVyORCZ/QIYo
X-Gm-Gg: AY/fxX4vJmM2raama2KhPTSqHGSdwRI7POy8ZpklWSYJhNYvJV2JEH4gG6MDW5Tcm1i
	DGwOYJQmMVtAMgYnGO7R2PEkzT96cChBXnzh2yTQsf9QQBHRHCgCDvhprCU5e3JdkT0HbSERH6w
	TY+o++XBp5HPSyoGUuGPP5huc2hRKql2AHIz7TAkwjnbrbQgdmlj0A6H11KSamTyf7UUXbNAaIu
	bB6mJZiiVFmyb5s2LhUTcb+soBS+o6P7lYi1jYUXFX6F+LHrXbAwo+x2yKym4aE2XJdu5St1tbU
	t7XPcycp6wJk2vDQp1q+zyU8oJQ=
X-Google-Smtp-Source: AGHT+IH4/n1JS3LguSKdBi87LdibD+/sUVymxyQCL0D0nBqsPfd++JiAmVxxH7fPWDbLcPKi4SpTXV5YqRpvrZ7fo0M=
X-Received: by 2002:aa7:d797:0:b0:643:bfa:62ca with SMTP id
 4fb4d7f45d1cf-64ddb92ab9cmr72664a12.8.1766952789237; Sun, 28 Dec 2025
 12:13:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226-soc-bindings-v4-0-2c2fac08f820@google.com>
 <20251226-soc-bindings-v4-2-2c2fac08f820@google.com> <DFA1WXRTC62E.3825Z5WT388SJ@kernel.org>
In-Reply-To: <DFA1WXRTC62E.3825Z5WT388SJ@kernel.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Sun, 28 Dec 2025 12:12:54 -0800
X-Gm-Features: AQt7F2r4071NMaJ83rx1_xl93isa0Sc1RDeqCFXu1toWFoGesqUsLfyxGQtjIgI
Message-ID: <CAGSQo01XS+T4JcO0ADYxhfAi62Dx_+GH_+mnBtQV_ZZ4ry_Www@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] docs: ABI: sysfs-devices-soc: Fix swapped sample values
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 28, 2025 at 10:12=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Fri Dec 26, 2025 at 9:17 PM CET, Matthew Maurer wrote:
> > The sample values for `family` and `machine` were swapped relative to
> > what the driver actually does, and doesn't match the field description.
> >
> > Reviewed-by: Lee Jones <lee@kernel.org>
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
>
> Fixes: da5a70f3519f ("Documentation: add information for new sysfs soc bu=
s functionality")
>
> > ---
> >  Documentation/ABI/testing/sysfs-devices-soc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-devices-soc b/Documentatio=
n/ABI/testing/sysfs-devices-soc
> > index 5269808ec35f8e2b18516556f886c77f5fac9401..cb6776a4afe02a76fe27ac6=
fc236babdc7865287 100644
> > --- a/Documentation/ABI/testing/sysfs-devices-soc
> > +++ b/Documentation/ABI/testing/sysfs-devices-soc
> > @@ -17,14 +17,14 @@ Date:             January 2012
> >  contact:     Lee Jones <lee@kernel.org>
> >  Description:
> >               Read-only attribute common to all SoCs. Contains the SoC =
machine
> > -             name (e.g. Ux500).
> > +             name (e.g. DB8500).
> >
> >  What:                /sys/devices/socX/family
> >  Date:                January 2012
> >  contact:     Lee Jones <lee@kernel.org>
> >  Description:
> >               Read-only attribute common to all SoCs. Contains SoC fami=
ly name
> > -             (e.g. DB8500).
> > +             (e.g. ux500).
>
> Is the change from "Ux500" to "ux500" intended?

Yes, the sample SoC being described in the documentation uses
"ux500"[1] for the family value.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/drivers/soc/ux500/ux500-soc-id.c#n133

>
> (If not, no need to resend, I can fix it up on apply.)
