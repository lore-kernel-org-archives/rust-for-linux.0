Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC2819EEC2
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767359277; cv=none; b=szxdXyvgMmBMSON9VBCWYydy/8PUnuig1XcOP+gC7r2CpAqsMmqISYd29olH31e9+vBI4z80nKieFKaSxViLEn66AcIo2u+ynvN0w5WLbhitFhU1U2+dwzPXdVxvlLm8Gb7KwZtv+GR/jYUiPt95VBmMWax1DFfqVrYDmhjXuoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767359277; c=relaxed/simple;
	bh=FfHFSFuZRbCnGN0bPJxj8gldPoKS2YkU7GbteKymchw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UpJSlnI+W/j4oTEyvY+FmltV7qrZJ7zULR/RMD3cv7PRC+9COdHdXiakhCuJy55h6Uh5nVSvcUk+8WOXdDlndwUJ+2L9KkbsEkE+IzRDa7Z24A+BCQm7IrEfIaMkWvV7jX5SSbV8nHO/18qs9AAWwGA4PFrh0l+NTXwuEK+fFO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dt/1YWgQ; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dt/1YWgQ"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-3e80c483a13so8092031fac.2
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 05:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767359275; x=1767964075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfHFSFuZRbCnGN0bPJxj8gldPoKS2YkU7GbteKymchw=;
        b=Dt/1YWgQ/K66ClHl4X+P8u2sB1uBaAkjNglNUPxLhWi7ZuifC9NgL/7e5NgEPT+dNb
         6iEjXY5TjRlny0jxBke3yQaRSNMFfLDBpONJALbCBFCHh2CnmtW5eMJ9AP+0zp9OAik4
         EWzf+lRIdSxh+VwIwPBwRO51P6PiVqDdf/vkFkj5VxGCwJ7W2t9Cp4pSG/VjizizD+WI
         3xczVgApMkCWfYjLOxghVzOhziY7P5fKmdzf4UmOFRaoZFZwXocI+THd7R6kGyjhh7JR
         U1YUh3OQdKu64OSDIbNT/AFDLoaaVcqincGBzifnsNQtwjsuEpd/9C6EXUbkGFeSxCH5
         TXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767359275; x=1767964075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FfHFSFuZRbCnGN0bPJxj8gldPoKS2YkU7GbteKymchw=;
        b=WMb5bf5/JULu0Hnlr4pEy9fax1v6bn9oFAXPqMM8n4SAbLwHwwm7oeoRd3VqCpd6p/
         ZwHpzAnYMze7DTpuzo5ziEkQfH0oQQhAyQ5RpdD7OOrbH4CsgLLPfQ8pQEa59Kw7L865
         BC4To3vtnOegSh37oGO4w0A8hy9wmt8/G8B3jq7/q0h8vvRcb2svfkHJ+h+/lxKncIN2
         WfSjnOOg7hPRHZrwbhzPOnXpyUXS9iQU2LgTo3RR0jIoUfR/ujsIGa3foTi3oI1vZym9
         yyg9ItAszfgTk36bRXy+ie4rRpuMd5exkQBe7a0pc7JaVW3GfTRw3OBmW0bGEfl0lTBN
         0vVg==
X-Forwarded-Encrypted: i=1; AJvYcCWYsqJLD5fSN7hvv7C+Pmd+PHEqWsF9Wohmq3W+b3JLjsNoE0HK70eYmSp14N8WHokJk9sMMRVA0qc5cxOuPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMSfoIzJhLsB51YnflAPEMFTh99KHg5Qr/d5wpQd1QdvQaP6/w
	amilhfhMEOJ2XQv4IHY59qBORlzJvDCA49PJlyDJC/QJlk2xoERXE3y7Em6JnWveMBcAn7awnwo
	MFQmuEsxmOBVWMCmHMB8nP1Nxu3EOmHE=
X-Gm-Gg: AY/fxX7EpKUWPed2fc0EbjV1NaBu4Z8EWHWvcaKVtqc25jsXH2V32f7wSa0x9ObrVlg
	IhcduIkBo9fINU5zYwu/9ClbILWRzc19aAQEC6ZMyogBpjW05cw/aqb151HcVTubG1hIJYJM9Ws
	jPNBhZYimVOE97ZaaCe/tDAPZrDjc8UEbTSFGIPJd3laRCGIeBR8vW9G/D3elqXwGEydHbsqMqe
	OsfouY9sPLto2+iE3wpqjMDdBLuJmCnYzQNJqByJ1+rsjXY3Np4oo0dgwTL2UjYeJOLfiQ=
X-Google-Smtp-Source: AGHT+IGZ17vfe/KPKq6zbDO4n+nT7eWJhqEGPITZlBxLCaAnRLFG3tESgK6Pv6jvGiELYKZ9JxUcRUChHTzwkn87Kaw=
X-Received: by 2002:a05:6820:6089:b0:659:9a49:8e4e with SMTP id
 006d021491bc7-65d0e9baee3mr11582971eaf.30.1767359275069; Fri, 02 Jan 2026
 05:07:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260101-rust-project-reduce-size-v1-1-4cd66e9e02d9@gmail.com>
 <20260101220903.0c099099.gary@garyguo.net> <CA+tqQ4JF_ZO63U4GiSb6+Ym=m=81kN81xr8Q2q3qypYfYQinxw@mail.gmail.com>
 <20260102103643.352fd5c7.gary@garyguo.net> <CANiq72nvkA-SS0_tUNX_Dv5ABXiA9aHf2NqNZMtxMOJgBEVuRw@mail.gmail.com>
In-Reply-To: <CANiq72nvkA-SS0_tUNX_Dv5ABXiA9aHf2NqNZMtxMOJgBEVuRw@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Fri, 2 Jan 2026 22:07:44 +0900
X-Gm-Features: AQt7F2q85zxBGozsf-XID9cG_kyFaPsdThKUOHivvzcS1KJSWlvIm0qi-Gbkphc
Message-ID: <CA+tqQ4+SVQfDmtg5nE0E-staohkHaiZ9en7YK7tJ=S=AkF6=fQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: reduce the output file size
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, 
	Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 2, 2026 at 7:56=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
[...]
>
> Perhaps we should support several versions, just like for the rest of
> the toolchain, i.e. query the version in the Python script and act
> based on that.

I could give that a try if you feel the benefits of supporting multiple
versions justify the added maintenance burden.

Best regards,
Jesung
