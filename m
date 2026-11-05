Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793918274;
	b=GXex4AFst6GgMgeGm4gfQ5xEzqgG3k2lQfjusbrYMJDFIzaVTTQi0TWupR0DJXxSZ7mj
	 T33Oxu05UHgKslj5sOM1GVEm8ZRLuX9VBDJ8QFkK08IoXD52ydnXLwfETsEW64eFFpNi/
	 OBXlOm64Ua5tpp/qxMe5hARZFvTg9gappOdz0WecYUDT5/K0bB7GLsCapK0PiGCLZgVVd
	 feAxlhtbpzEFdXPHJMvXJbTi+uTwubwQDsRdq7a21gYKCEgsS3duol7DSyIVOjM/82UJJ
	 5MLQvfxBshGb/cXYFYXFf3FNUpDIvtiQkTlAd/VGpB6ZSCeHLyjVOkCYUR9xjel81vQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mBrXFKwhti0it+UCB6DEQ73OqL5QC614KYotSTfrY7s=;
	b=k3pwgQiJ6fiZP/ProhTsIjkDkk2NxgkS0FyUrIc9TpHBvG1ZDFRxD5XspxytXo5XHIUC
	 /jYkrHlhyZYXd8Xox+rgWUwKGE7RoI/4ITV+BjqGDrgGKE0fV4COozIO/1L1pN6fk0+uE
	 P1w2UOqNgkVkoGj/Cp2iTRqc7wxe5KohXw34nXOjYTeU7hfJLAPnqfdIieP5yFreDigic
	 i8aglKc4K+IkYOU9nSQKDWbM0btAJuXjWi1iQv6Gs00yaNVFTWzcG6b/PF7/0EAWqYAsd
	 4Jrl+bPVTbVvWmkZUxrxG87nIA1jgknSJ/wtd1whudQlWxmIQKudpH3FYT/y0MvOCvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=opHuLUG2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551F3606A328
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Nov 2026 22:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 551F3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=opHuLUG2
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso27994f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 14:37:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793918273; cv=none;
        d=google.com; s=arc-20260327;
        b=NviQP9cIQZ884ihlyq4D73MIjtE4XOmEuhcdZKtkd9POcgaZdKy0w6ysMdL+ynbmo1
         4Hv4arx3LXwWsf13u7+y6ZeDn9skMBpUmmDUdDE/tOaXibi1jDaVr75zy8AdkDgwBkQ8
         p7y4vATxYEdfWyLunH4Zs4qkrgaaJ/Aa1c/w0W+nVdrSIZ1wYWOvLkck4qR2K1pDWejI
         2ULueRwEcflkgW4LbgUtFQM2rUzQM/WI5fAKA9SyR8GoR1p9I2MqB+vg4Ni0Lu+F3wCD
         5cPns5JS78jsGla0aVX4z2C2diaMxuwpUcpgexB7mAzB6ft0OUMCCn5xjS8szEEFsq3b
         PG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mBrXFKwhti0it+UCB6DEQ73OqL5QC614KYotSTfrY7s=;
        fh=ui/yLz2a/1YmciLXYpBT7K8YMySSLlLpgT83gf94G+A=;
        b=sAMX06QB1bkG1DZZeylRkBZ25mevxQZ+I6uB8coEyO/+Jlqh4KLb8ym5/+jWCKjT5F
         uNJlYW8rPdTYZmPh2Pv3MeRJFxze9BuuVLeyWPCyZjr6CsxBQLkGUkYI1/WpL4UuRNDL
         SgB7CfPzv5PP1NY1NDj+oJdy8IPEqS6AZSBbzmoLJZxqO0XpKuintduUQL4bGmwy7dYM
         /sHpeKhEWiLUDS9LRk8C4/hvVplOYzpBOFiDNMTVIjpYEByq8RONnMDLPIftSkSY1NwK
         8jPIvGwQONsERuNLsKD5WWjfRN/itHzj/IeNEY9JsNIghvfJb2kpQdvMRiAXwwlX3o7w
         xCgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793918273; x=1794523073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mBrXFKwhti0it+UCB6DEQ73OqL5QC614KYotSTfrY7s=;
        b=opHuLUG2Ypj1WDXfEVKbren+oLeZ7tTP2atdz9P8ZLVMn5bWP98aqZ2tqSEJI3N2DB
         nuBkm5KX/67E4qBhrw6fnCpA5G1RGMwR0qeTPW7RyVab9S2tsa/I1UBK5nMljn1rMAiz
         XOt13rzEPcGx5qnVaycMfqu98U5KOuu6ltfT6v/2zVzVjuLqtZsfv5An2j9NqccasfY3
         +RTHJYMgNiNMaoUv6HCBIECQuBQzbBkdoRoOoTSc7zjezrVMPd+ax0NUn9lZeT4uE2YL
         6v9CJoYMMnbZH5MEDHwYgIcfLYNHONdgxYICT3NUUtSOaGe1cht0K8hkNmy5Hza0PbOz
         YKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793918273; x=1794523073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBrXFKwhti0it+UCB6DEQ73OqL5QC614KYotSTfrY7s=;
        b=rgSA6zsrt8ww+73w8/XnJ1FMa1x4I1+jwz3Bq2eR2jnKPZs9CtgYS1t5yRkvgkGBV8
         HtBKtyamjgW7kWQ8ADSsZbRZZGWKjHMxLWLu+WgOF+j6GKHLSCt5yQwdGQvqmz6BWQf1
         cfQLajKA/QqksfPgc9RUe4TbJ0MhI60BV8SOzqruBZVp1n/+OPFy03cM3FbLVLs+B0mh
         J/WpY/4rcMwmBDlQxwxdwYuYVh3WHYkB5YhcY9edThepSx7OLOT5j065Pu3g5wdP+mpG
         Xxh8VdEa3nHS8tawBD/WN3Kq6emAR79XTcqf4zM6zDlVnxhbVKMfmCyCNCpFaYj5xym2
         3u/Q==
X-Forwarded-Encrypted: i=1; AKwUvBw1bp8d0t8mkH4ynoJvMF++7scX6rWuZ6QdjG+0OtCA1x4BfnuFkAf2YOwxMDokesFYv+OE8h2Inxl1CiQLtA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/XYLMhPJxqAGzataI/OjRdtHzP6enuWpjWnyh3fdEmPuHD/xjQ
	0ClEBxYhNyLbvuBhRv5Q3MfM3DpcKwn7rTk/7WET+A6xM58S/22j9kz2fhv3jHC9H33c0vjA7R+
	3vOFzWa/1/FYqNygM0lHWThR2tPjkOmfdjpRwtaSX
X-Gm-Gg: AYBFou3hV4AH3Ffq+YFC8OY8hkFNiewkxMkLM9naot/dfoPnylGAxW3SzSeBgv7ZYAd
	PSJ7vO2b+DSfeZ30966R4WVG+XZEsMsUIpCNjO4ZCT3T2OMVlHabxEymgtMgHYxUK9qIKcSVIEs
	gWxQFMRttL+52V0ko0PJsaXgH0hc2ItjYfae65f+BkgiJARS4yG8i/4zFG2ymQaQXA5Y+V4xAKa
	5XIw35PustcDH30xIVN+n40yZD/3tLBOv9ue/LNTLp4a3BhD36O7xM/dUZ/GQp+dIt1cyI6um3q
	KtxM0x9mUBehzBn+eCoJ3Csl//XRLktOuZPlJLv97AjynS7ZMsF1DGTchTXFABzC2yPcE3i9OWI
	EHe7pD///9B8cBsV0AMvNXuqoU4/ejMklMlMg5/n7+mY+Vhd1xCTkPVuKlUsUrmo++Zu1LEh2K8
	grQe/m96aJUlkgWw51pkAI1L13QYn24DIpUg7xSKkuhDgxwi78B5OkkOAkXRFwuHKlFMeZLNWzr
	howVTqQB5W6w2fWxioCnhCg4HKQBhR33v55
X-Received: by 2002:a05:6000:25ea:b0:48d:f39b:83de with SMTP id
 ffacd0b85a97d-492732dc7edmr1852328f8f.3.1793918272221; Thu, 05 Nov 2026
 14:37:52 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com> <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 Nov 2026 14:37:41 -0800
X-Gm-Features: AclHuK8wUx6mjaq5nmDzGyrOyknjILFX8cjQ_WCJLMf8UUGbwiTYmUffT-QGEo8
Message-ID: <CAKwvOdkRAB7QUApoYyKU456GF3bY67PKqQRfbtmW1gcFbpAFGQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Doug Anderson <dianders@chromium.org>
Cc: Rong Xu <xur@google.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Yi Kong <yikong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > 2.  The recommended usage model for kernel AutoFDO (as documented) is
> > to use the same source. While it might help in an iterative build
> > model, I don't see a strong reason to use it if there is no source
> > drift.
>
> Hmmm. I guess in the purist sense we'd want the AudoFDO profile to be
> for the exact source. ...but from my experience, that's not what
> happens in reality. If nothing else, developers locally working on the

Right. Rong's recommendation makes sense from a google3 perspective
(who I suspect is continuously regenerating profile data), but isn't
feasible for Android or ChromeOS (who are not).

> kernel still want to keep the AutoFDO optimizations so they're testing
> as close to what's in the field as possible. However, the act of
> working on the kernel will touch _some_ of the source. Keeping AFDO
> working as much as possible seems nice to me. Of course, I'm by no
> means an AutoFDO expert and mostly just got dragged into this issue,
> so happy to defer to the experts. ;-)
>
> -Doug



--=20
Thanks,
~Nick Desaulniers
