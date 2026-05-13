Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285C739A063
	for <rust-for-linux@vger.kernel.org>; Wed, 13 May 2026 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668177; cv=pass; b=PwtyiKgjk3b8oCiR0X8nHAEE+MOEui8qDWtRify2MYUDpeC1p6HLdxm4potGIBqa6Oa6IW3sS5IRbX9+tbhlZsoFSzy5uoSS2EdqjrF/RsHHbeI8FVg+/d5WWbWoceyMiBjCwVPLtdQ7pAiAFCobDKZxKI2XjMJ8toh5Nnz8C30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668177; c=relaxed/simple;
	bh=D2TFnJmKvvtQlbeDc8mrtDEMlzuK3isyxrxCu0xrBKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+8B4HScR2qaU0ZdpiU6UWy9Gte9oq/7PCXw+V9o62Mo0S2LsAAmetLwBiCZyiRIcaDClSVlbluq1AMaC5wHLSjpmjUiaXNywnVNvk+b30B5nwOEFMaG3M/sjJuz/swNBoZ49IcUrUWxhTP8+UK5rTHcGG0Qdb3CTS/NyFVrsk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDHIIwhL; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDHIIwhL"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2f6e6a0a215so507628eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 13 May 2026 03:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778668175; cv=none;
        d=google.com; s=arc-20240605;
        b=JIX+W5N/UbHO/RclX3gD2ZwuHFE1a9T0Z/GC44JQpu4lskiy1YGyD/UGi6tSAr2Y4k
         8cu9DN3w5nQOn36u/a0ReXSzZ6v/iu7yBPYbsuH2NfoLxv4YaoQkUk7TuMjM5IPt/aG0
         n9xGFa9GezyBWEGyEPkY1VyYZcpclqTf7vto/1lBvOinJRbwa/ffS6PtAp4Y6ZldWEvO
         ZSEcy6Ddid53LBYiEJiGov51p7DftZRvqe6FZ9PQ3JC09T/M9lY9ZezFVBNVVhNHzNOy
         BwhQo/H52sZkGnTE+sh8IdH3Vnk0bJAaY3TgG7r67Fz+J96YHZDdmduXBcslB+u6nx4+
         +Iyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pfRguAexMO15Y7WK5/7K6aHCr8ttDBgEp8v4v0BLc8g=;
        fh=BwDgj988HWteqb5EOONniJCIlGm//xeWovMV7OL0yEQ=;
        b=hwqLs2cYy/41r0T1RhTsxmRHHVRyH3EasEQ2gxYbiT/lq1+/by/g1Co6Cuo9TGimja
         8Tlg2+cXkHs2QnT9ZZXA0/5S4H8Cb+NxUpJMkFmykgEKdeayZGmh9jS8B3Pc6+yAXquY
         /KszNo5BG+KMXn4sFCg9gf+DiF49Mnc0yM++XS8DgqyFOYNCVdLMCd4RjuiyjSb915XZ
         boNftuC3os0Y4N3qohkLnV18WSaXCbP0O9cWs/lPK8619+TiP+7IvR1vEjbldkcL4UCz
         UJTGnYEMXzYBdNW4X27nRj0W7rzd3sqB4qRj6Wnw1T8cIOx6aoQ6Lgua9ouJN02d2cC5
         zl2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778668175; x=1779272975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfRguAexMO15Y7WK5/7K6aHCr8ttDBgEp8v4v0BLc8g=;
        b=UDHIIwhLsnRsbSmF+G4ioL3rYwyLMp54rS9TcDTIgQxlz1zNaotrsM3Mt7DfjSWUnh
         kocTTZGITCIauO4DSp+tllNb/RIUpnHV272gXUwwcjLle3KXOOy2jF7rcJQSGSjyg/mN
         h3hzHEGK5XXivRNPbYMyIM5d/Ly47IGK3P3Zmc2T1Wnf5q6oce2VxyBvc+Ezo8w6KeV4
         +GwIF81Qy/q/VltYwepqHFYdXKPBcCIrgpHfmS4oQ9DkWjErV+5990aRTbvvTGqeVojt
         UkrSVXICCKB921QGnx2DVWHR0rqhfYqYKivjVhZTJ5UJLFZ5LeOgyi0M5Zsoh8ONFheC
         iZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778668175; x=1779272975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pfRguAexMO15Y7WK5/7K6aHCr8ttDBgEp8v4v0BLc8g=;
        b=EVBsw07Y8XWBuB74Zsq6Rmjqi+/OOvLzTMyxU7oL/EF/m9yAl5Igmnj7gQ3RJh+cZq
         Q1Ug8vQuCD+R4Y69YN1lW2o00ozxV1uP/rILaZR3yrWXYbyTcgZuapJo9TSoFIhG50OW
         0h7aW5ZUzdfTDyfAORd+y/lE6S1MFGaqSt5Z3BALIU5Fl+O32jWCcbeYS4MzQ4vN6Dwc
         7dju2ZkqxVua84Ix7r06oQRg/DP2xv1m7D1QnhdUStkduJ5Hf8lu7qtCeTEqIcEbVImJ
         BNEhjwFWKa6NDy7NYVbflC1LUl8a3iGNRAYdvU4SygZl5OX16zC8zxxvQK0vjnSJOUf9
         BzHw==
X-Gm-Message-State: AOJu0YwMq78vXtbjKCG4q+F0CH+TLMdb6rwkltQzv4Ebxn55ojghfNl6
	rc9Bt57OSv0iy+ZWkq5oevXLcz22fuLp2iRmR8RtFsSELoBIK2Ek/0fhOOa8Xh/9O3wjW/j3/3E
	Vmvoe8p1ig7lNnflAby48ugdp2HbZ7cc=
X-Gm-Gg: Acq92OHMoGMqPkn+CZrwBWpvfdudiMbXdK9WoUy+b5qb13ssNWIdwLa+KctDGTKDrB2
	x+CmrTW2ybamaN1QTpfRPai0e7faWvkouj/8Czf9irHxTvXteFGBqEUpSvXmZTOvsySS8Uq/mFA
	NvyEgie8hAwkS56ZpTkgFZX7rjLFblD4zrBK5YtKmvMJV/hSqRijCYYRG0TBsvcq7pANjtQY3AJ
	UmyGnLCltsqt7e8x97x8hFneiFYeZwK9V1kJf3SwpGivKD/o/fUNK9KvmyS/MLeFNwJHGQrQYbF
	gHYGh1BrHUoXxABTKaklSVmVVPTd+81c43TN2kB4NJXIOg29FDYw7JNGeFt9BWfZz34PKXhMirb
	B8tX0h8MxwF5p3x0pnMmE6lQ=
X-Received: by 2002:a05:7300:1351:b0:2ea:de28:f389 with SMTP id
 5a478bee46e88-3011a16acbbmr740963eec.8.1778668175217; Wed, 13 May 2026
 03:29:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513092017.265269-1-work@onurozkan.dev>
In-Reply-To: <20260513092017.265269-1-work@onurozkan.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 May 2026 12:29:22 +0200
X-Gm-Features: AVHnY4JRfZeS5M4PkB0i1HHGCnrslk-pdRETB9bqF9W78tWIU-eAfHuzIz68pYk
Message-ID: <CANiq72ni8VwqEnBNWFivsHR-P-wmfjMBVfh4XTDBTAURB8zo=w@mail.gmail.com>
Subject: Re: [PATCH] docs: update rust-analyzer command
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, alexs@kernel.org, 
	si.yanteng@linux.dev, dzm91@hust.edu.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 11:20=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.de=
v> wrote:
>
> diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quic=
k-start.rst
> index a6ec3fa94d33..df5b54b51deb 100644
> --- a/Documentation/rust/quick-start.rst
> +++ b/Documentation/rust/quick-start.rst
> @@ -314,7 +314,7 @@ definition, and other features.
>  ``rust-analyzer`` needs a configuration file, ``rust-project.json``, whi=
ch
>  can be generated by the ``rust-analyzer`` Make target::
>
> -       make LLVM=3D1 rust-analyzer
> +       make LLVM=3D1 prepare rust-analyzer

Perhaps we should add a brief sentence after this code block
explaining why the `prepare` is there, e.g. adapted from the commit
message:

    For the best experience, it is recommended to make ``prepare``
    together with the ``rust-analyzer`` target so that all generated
    files (e.g. proc macros) are available.

Cc'ing Tamir and Jesung.

Cheers,
Miguel
