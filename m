Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF96731B82B
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 04:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767587524; cv=none; b=mT0dUNQe4TJ446UdoF6IhGiDfMFNZ8HV8XbVGTbYA3RxVWSI2DxxafGXmWOlvwQ2ChTClEzva1egfnm39WA7NvlCt7H6vFcP7EsXXQaadB40guG7tLi9NmsoFBTplE/zSEdVepgfGHoFZEpqMTY8cJOnOCz75t1goL3OymevAC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767587524; c=relaxed/simple;
	bh=e4mNUTVMd3pbP2gaHBEUKskV1yFr7MQyVaNr9q7Kg0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G560jfoGl+b34MF5/HDshEEXtGxkHqQIjR4tqPlhw6uZGJlvo0LuWSLU1JVx9k5jdjGg4Zybt2yVlxlhO8oals67uqx5NGqFqZ0T3IQUw1DAt5wnPaAza5+3l1cF0w1vVoiVuG14M1Z5m2rbG7tqFzIfU2PPsUwh4pGvl9uPMi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNVa2boE; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNVa2boE"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-65749fe614bso3687221eaf.1
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 20:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767587508; x=1768192308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saUVAgEsyurYO5XeH99MQT53kwNGQ/V15cZ9Ga2UQbo=;
        b=XNVa2boEaVyUfuLdYZQSQoFnchNF8CXd9Hj64k7vvgQUFghYKAz8viM0i1Leq3/1wT
         mW3Xq9KmhI5JKBqx5+RI+iy/7tcuauIgImJvyzxNUfNPg8hKctEcQ4JIsavLE8Btqd8q
         oLSGZjzoZNjP1Pud9PgSHTMukEFRFiqODVMKJ869XR9wpPqhnhwF7aMcbGRssOKZQpfj
         fcJKZU4dsCFQ1lYrDlwtaonJdUC1QQcz31ZBj2J7Bxfoq9uRSjrXeUwHjqSDXLtWgwQK
         LGFOyEekChQAc7sRPdGHgJXVH/hUTtE7SyftSDPwkaMSGJJh70z9UQURtnO56imk2WTG
         BcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767587509; x=1768192309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=saUVAgEsyurYO5XeH99MQT53kwNGQ/V15cZ9Ga2UQbo=;
        b=BXf0ZJTd78srbHDdqcfstFQSibNh51lOlxsQE3Mq24UPrVgRWGUItxM3F7Pyefe0DQ
         TtxOtTtksbOVukCacj/3VtzPZHd086A76fsc29J3lIiOwhurmxoq2LhDoR49hgZgVXjF
         KTnFhl6BPfv10XeMnnhHpyJ4Jff6XdEVEkKrWuL3/wVnuCU2kHDFciAgGROeUPbYYa4j
         3wmuwWlDWwYXeP75yO1fTcaxgmWj1AYNWsShgRCDq/mwnVay2iHfZaCYrwhwngl6Kp86
         jrRVmHZT7fQkNoolBI5GW7D7dGul//hyT0H8TxEBBYjqnAZlW3WouWjHlSNx9CiUF87h
         WoUg==
X-Forwarded-Encrypted: i=1; AJvYcCXCueFE0S/KHKb+tRoxjfLokxa1+0S/qwgfeLdL9FUwbpxFcIlttULtKTqbPSbioEH0syPViqmTBskIePZVVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf1Wwo2V0ICkGyT5Pb+BnAA+x1xB8eEGFAqYNFFBndVzOnbckA
	Z+6RFnWAVDU/GqXVfYB4EbtlSlYUwAfDhY4cc7OJgXpKEJ+B864NKulOsO/2bVHQrpyIkxKSlMA
	VWZat41vbmw/VTKULlwTqMwkfpe8P3Rw=
X-Gm-Gg: AY/fxX5rGr2WwFwvMJ4HKLR4KrC1wK+yaNnrOrY+gHAaFdkot7K0mOkMotZdzby/VwS
	maiXoE8H+HRjnTOO+7kim9mex+nKB8dKo/nA/DJI9Lra15RioBb6uaLNFM4HEc5p5a0CSGrRKjk
	9vxcK80OUm44v82igxnjbWJXU1Ic8YVWs947TLg/UJplZSHels5f8vqo/PzXDw5Ls7z82cBqKyf
	RQPer0Q65y9ULVYnonifyuLlhuBMyREpauzVilXp3TKb+DAxkQVYoyroqPCBFba0o8Zpnk=
X-Google-Smtp-Source: AGHT+IEBOFNjMVIcp+sMlVXjYpjBEZMMFX7+jPvUPM5+krXxGK7by8/Odk0UZPWbo60zUg8SgiWi2xJdtgeEwAt0Zqo=
X-Received: by 2002:a4a:b789:0:b0:659:9a49:8e58 with SMTP id
 006d021491bc7-65d0eaa85cfmr13980797eaf.40.1767587508671; Sun, 04 Jan 2026
 20:31:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124151837.2184382-1-ojeda@kernel.org> <20251124151837.2184382-20-ojeda@kernel.org>
 <CAJ-ks9kSFp8CpyNr8zSKh6mniuXiYNrZCc8FC-8Z81GdbnaRog@mail.gmail.com>
In-Reply-To: <CAJ-ks9kSFp8CpyNr8zSKh6mniuXiYNrZCc8FC-8Z81GdbnaRog@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Mon, 5 Jan 2026 13:31:37 +0900
X-Gm-Features: AQt7F2qrKlVRmg6Qt0U99y98HY5qajxFqWZs4J8w3JjjhlpBLoCv1Y_qfJM799o
Message-ID: <CA+tqQ4Kiypr8hZ8d9zRgjkoTDaXcszEm6U3k_OoJL=mhGd_kgw@mail.gmail.com>
Subject: Re: [PATCH v2 19/20] rust: syn: enable support in kbuild
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 8:17=E2=80=AFAM Tamir Duberstein <tamird@gmail.com> =
wrote:
> On Mon, Nov 24, 2025 at 10:25=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> =
wrote:
[...]
> > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_=
analyzer.py
> > index 4faf153ed2ee..5b6f7b8d6918 100755
> > --- a/scripts/generate_rust_analyzer.py
> > +++ b/scripts/generate_rust_analyzer.py
> > @@ -100,6 +100,13 @@ def generate_crates(srctree, objtree, sysroot_src,=
 external_src, cfgs, core_edit
> >          cfg=3Dcrates_cfgs["quote"],
> >      )
> >
> > +    append_crate(
> > +        "syn",
> > +        srctree / "rust" / "syn" / "lib.rs",
> > +        ["proc_macro", "proc_macro2", "quote"],
> > +        cfg=3Dcrates_cfgs["syn"],
> > +    )
>
> I think we need to add "std" here -- without it, navigating to methods
> on e.g. Vec items defined in syn doesn't work (it does work with "std"
> added).

This was handled in [1], but hasn't landed yet, probably due to lack of
Reviewed-by or Tested-by tags. If anyone has a moment to take a look
and provide some tags, it would be appreciated!

[1] https://lore.kernel.org/rust-for-linux/6dbdf6e1c1639ae381ca9ab7041f8472=
8ffa2267.1764062688.git.y.j3ms.n@gmail.com/

Best regards,
Jesung
