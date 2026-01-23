Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E87A1A262D
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 13:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769174127; cv=pass; b=QFfeDuASdL0ukJ/JJlq3iHtp4RmWIxrLt2VtzrytfL4uEqKRVXeR5X1vYxqLN/cHP7ncbYiYzOIpTn/Xwvyp1liIvB9GIR4FseR0RqBovBiQHX34RDcFqg7Z98bc2EKh5DrRf3+WxhlPX7E8tXiFLgFKhDlV1EWxdhELfZpMmbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769174127; c=relaxed/simple;
	bh=UrvBPNubb4qrqSeZa7bNtICJMXtxAm5PjAyxikd42CI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=db4krJ309d4yDXBQGLBlrVYWvk7+slY+HWHwx3F+Snlko2rbgqjaTnBdCoyQoXINYxDz2/YgoZ1cu39DJ8otEq0W2LbnlLrUUNX7hhjwI8LL6BmltJJyMnNV62KHtNHPj87B2i4S/1/fmS9At/mjZh9UXwTYPQsTTK8eEvL6Bfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwN4yFZT; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwN4yFZT"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5635f3eff8aso507512e0c.1
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 05:15:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769174125; cv=none;
        d=google.com; s=arc-20240605;
        b=D28/p11f7YIwsWH5Hc5/2TF22WwsjEYy+YucfZiZvKhx8yVw+y0n7Du3p0nZGDDf4o
         7e8eEzH6B8KHcVCfXn8W+jFxxqclG29lxfWRExhG40qdpF5TlQK8Bnk0PrVNCXW8sgYN
         f0/ZPmXzRjCohg1/A1sSubzweEGaLSExPGgydmKOys0+IIJDzR+dmoacur+BenknOXBG
         obriHcdF0v283ONI5P1674m64WKlL48Hui4DOZxdpuDn2MFBpeQrZsnDRXgccCDMNBjU
         CtfvPZZVzAAk4gq1elPwS/YWbHm/N0IeqJ33DZ4HMC5dutvOxDwDmGp4bP9Z1cbGzNRf
         7KVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uGeg/QhSMqJRXb1XiJN3IAY6ZMo9L/9nv2OB4c5T0Uo=;
        fh=56epFrIs/+Tlkf6HCdHIJuuEpfJZyT/mo3X+fKp6jho=;
        b=BsvC+rWYhJUQ/6WgyGUhCTek1ZbkyrrCoCv730EOx4KEB+CclK4of2ay3EJPzfY4Co
         c+nmAqrRLp2uhll+y4stUGCPMzb5wwOiRzRaxiJMCAhNw06DoYbrSxgSB2NtpMbdKQR2
         uSoUHH8wq7l/Cj/xsa1m/PTxtP7b8JHF2NZN56p3EgmP66NgA1A0TJE983G5ahAI/lRL
         JBquwdY6V8z/crrpPF7czZ16lr2QhF9cTHbJ5fDqbEJfIk7yywT0d49WvOr0g2OOkdHQ
         Eicf4tG9Fqdz5i5nVHExIx2bkZOPzxWRe0d1FFnt6cuWmJd9qZE26k8gftvkD9AUClkO
         zkqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769174125; x=1769778925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGeg/QhSMqJRXb1XiJN3IAY6ZMo9L/9nv2OB4c5T0Uo=;
        b=MwN4yFZTXv+8Gz/zrbQqy5LWnoctjfoTlnbF9vQazR+Il3ECMyATQgR+i2PhFYID/F
         gi8V+Oexr56L4L90SgeNYN/hFr9cjs7Z6uzbhg8ple+EJAA986a2igSqk6tYM8y4RbRQ
         zFgUmytvyttHuK54dgeY9vfg8l7F0t0s6wM1DTX+PxEkH9SsDwMC3adY9tbdRv9OysM1
         7tbk8rhLQdIuI05tcW6Lv2AuA7GzDiRRxIsLK8Gg01NN0W+UwWTzEAWWZqSvBICwzhO5
         HNuAkqOKkHJfVStzgqcSYwiHvX7SnYHysEDw9Psx0ymf2ZsmJvR1fnlrWKKowHkS4tdR
         Nyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769174125; x=1769778925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uGeg/QhSMqJRXb1XiJN3IAY6ZMo9L/9nv2OB4c5T0Uo=;
        b=LEuUHEVMGCi/FuzOr9CLTsIHH+jjhFLKhI6VV5ufNw56dmOdiSpGN+JAX3NlxSB/zf
         zuCGNJMygNIwtR7O+YrsuJcoDPk3Yv8X+ql+oYuqMS9EdOpGo6/W5G9zofKYFcozeVr+
         cDQb1QQs3Rh1wJvJw0parP8YXH76XsRcs29ornoESh1nKDAPfc2//7bTGG2iVeZExRXF
         zugrHYl+zbzByl9YvedjSz8cWQHodeqh3jpiKdIPMLbaK5h0QPB11I/d06idqVyJaG3Z
         I+dqpiOGFAyIgt+QNKwU7yaJhBvTTXVDQH2fTIHbVn/jYUu7/CrMy2LBgceMPbmVINMU
         6MIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIdC0GwTRGvOYJjC+qaZbSab/4d4teBTGSkkHV2TnMhYaeswnU/uF3ZJuJEFYNKSF7D9M5rjap6c+8tE8org==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYN3F5ZiiIHteCrf5TbkoodD/B7Fh/vp8NRvWGhWEyqXijZZ1h
	jKtaYPZcMi1BS6/P+SpzVXKZgeY20egtypy7jP9OX5iGebMcDO6EgaWXaFKDoE+2WX8aThTVQ3G
	RjuxOiXbsvZZS5lgR7xp2d1XF8Y5ra+Q=
X-Gm-Gg: AZuq6aJq1S3Xb48CdCdUrJ5pu6EjVPtHTDT31S9ILKK1HYI5Tj2t0v7qBGx29l3+1/l
	r9TDgU51PV4mJ+FxQzRHfuNKXLYb8puQ3f2yXIY2Qs/4Mhya1GbtVj7z6yUtr/8tLsiX2WxySPv
	9CI++7NLUTFsJRbY1MAcoYccl0K6tqJ/c6AqafNSu/AQAQrRsmlmy4qQsIt2rQjkJzOYZSogSqI
	IPPC9vxHY+I4oMR3BYlKymGmCjq+P+Tqeon4bNw1HAUtH9Inat9Fu2fHEr3V7bgJf/LZDXzXo2S
	3jcd4e3lFf1Xg+zMWy25bfjjNE0=
X-Received: by 2002:a05:6102:32c5:b0:5f5:2ab7:cef4 with SMTP id
 ada2fe7eead31-5f54bb05f6emr897724137.12.1769174124537; Fri, 23 Jan 2026
 05:15:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-fix-pin-init-crate-dependecies-v1-1-1c6cfe9aa352@gmail.com>
 <DFVYSCDHP5UA.2RX1AU34POA3M@gmail.com>
In-Reply-To: <DFVYSCDHP5UA.2RX1AU34POA3M@gmail.com>
From: =?UTF-8?B?7ZWY7Iq57KKF?= <engineer.jjhama@gmail.com>
Date: Fri, 23 Jan 2026 22:15:13 +0900
X-Gm-Features: AZwV_Qi2jw3BZ_92Vqv7AXJbCNLnwsnlacQQFU8h4oobErCb3-dQnsyJtBwF5xY
Message-ID: <CAGAB667SkERm=Lghacqp3FGVZAbZq5Ojv4POe5Lho2b1C5h45Q@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: better pin-init macro resolvea
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 1=EC=9B=94 23=EC=9D=BC (=EA=B8=88) PM 9:23, Jesung Yang <y.j3=
ms.n@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi SeungJong,
>
> I think I could give you some background on where things stand :)
>
> On Fri Jan 23, 2026 at 7:02 PM KST, SeungJong Ha wrote:
> [...]
> >  scripts/generate_rust_analyzer.py | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_=
analyzer.py
> > index 147d0cc94068..0c6c0444917f 100755
> > --- a/scripts/generate_rust_analyzer.py
> > +++ b/scripts/generate_rust_analyzer.py
> > @@ -123,10 +123,18 @@ def generate_crates(srctree, objtree, sysroot_src=
, external_src, cfgs, core_edit
> >      append_crate(
> >          "pin_init_internal",
> >          srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
> > -        [],
> > +        ["std", "proc_macro"],
>
> As Miguel pointed out, this fix has already landed on the `rust-fixes`
> branch as commit "scripts: generate_rust_analyzer: Add pin_init_internal
> deps" [1].

Thank you, Jesung!
I successfully rebased the next version onto `rust-fixes`.
And I also found the other line to use "go to definition" feature on
#[pin_data] struct. I will introduce it in the next version.

>
> >          cfg=3D["kernel"],
> >          is_proc_macro=3DTrue,
> >      )
> > +    # pin_init_internal uses #[path =3D "../../../macros/quote.rs"] to=
 include quote.rs
> > +    crates[-1]["source"] =3D {
> > +        "include_dirs": [
> > +            str(srctree / "rust" / "pin-init" / "internal" / "src"),
> > +            str(srctree / "rust" / "macros"),
> > +        ],
> > +        "exclude_dirs": [],
> > +    }
>
> AFAIK, the `#[path =3D "../../../macros/quote.rs"]` part was removed
> recently by this series [2], which is set to land in this cycle.

Oh, It would be better to check this point after the series lands.

>
> So I would recommend checking if the problem is still present even after
> rebasing on `rust-fixes` with the new pin-init update applied (or simply
> checking the `linux-next` tree as I think it has already picked up the
> relevant changes).

After rebasing, it also seems that just editing a single line looks enough.
I will bring it soon.

>
> Thanks!
>
> [1] https://github.com/Rust-for-Linux/linux/commit/74e15ac34b098934895fd2=
7655d098971d2b43d9
> [2] https://lore.kernel.org/rust-for-linux/20260116105514.3794384-4-lossi=
n@kernel.org/
>
> Best regards,
> Jesung
