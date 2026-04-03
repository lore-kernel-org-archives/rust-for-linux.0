Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA3D1A294
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 10:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211617; cv=pass; b=nrIbQzbboc9nlViY+Vm2PfUWSEgRUk6n0aTAmZbrwUI3Vj6ChrhVHy1CBsH6k7Xe7dR75vnzHrWQ46Y474mzgx1B1IBj0lpZ0e9Gy9zAdk3iDZktIaWwSAyGtO3mJo3U8ImIr0+c6WgTYCam+zkTNy3kZhHf9/RCWj/AtZeblII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211617; c=relaxed/simple;
	bh=6uxr50lzNrUy02WpUKFckLw5k2tUVUFZ3uYKdaby4Gk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dRjYOjJGjq5HT5sJLjHvkJsKa9aBqZf8FFuaPH48+jJhBt3Lp5wUGK2bpKqflPqFaebEUvs7nLPIO9Kbfu2iOBH/WWzU/agL0Pg++FQ6oVm2rb2Pkjp2U+DLcLvxuwjJsP+053cOgG9bG6Obx2TI7kktJikOcG6fzlAVAZCxD8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXJuvPvk; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXJuvPvk"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38cbfb1322aso1772521fa.3
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 03:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775211615; cv=none;
        d=google.com; s=arc-20240605;
        b=HreTGcYlu0fD9Wq7v2Hg8R7sM2F3NWnZND2YLBhF6vNLvZdtv36mx01WaRUspoEhEL
         llnQZH+ostz/EDkgTgwdd/f/+N9UKSMqpiJrxlQh5PyDLQEMMdK7vSkIT+vuv2DSbd69
         jj/qfG6n1YuG+0VAQrlmoWgRyfmIhZR1x4sLpFGMwvcD5vgOKv667DICDjhJENyEBd5U
         k8PeyUroCeggQCc5/ubsBhgrh3wZHgl03Kzp8tLlBrfs1oZnEqy2rEi4dvIkR/PPU4uo
         6lGuc8fxgNv82Q+s4xustZ2YaYD+0NvJGOBooAv3hm/TV5ZQhHhHMawe0Zv2hoDTMoM0
         IwTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6uxr50lzNrUy02WpUKFckLw5k2tUVUFZ3uYKdaby4Gk=;
        fh=b7jqk1K93yvqMdgSkzcM12xDuY1rUkubYYREpYyXjuY=;
        b=ULg0ESkGukPa/A956kl5GgUZcQRbkbqYBdolwbBBBzXmzOOtI1pdl6HVGqtrjGmgrM
         tmmlxubDBYfs8c6y+ycltDUzPs94PByWItdD2rwltnsRvXuAg8/9yxbNsK7rh/mWkvRq
         Bdqzq0MMGD3EuR/0XI/FSfaUGVNLnQX29QWRrSK8nsTC3xX6NY72Ta4NtjD9N9RrAV1j
         4PzhGfUZ/0Pfs2br/WMeqBTSp0Ny2eKW8CBfti0qAhIHj3jggz163SdXzCVAfEqRC84X
         9+bijDnNc10CmW0HRpRO2tf0t5wSoscDekvVJnkKLRYMZHjjI76asIWEGW9AsuYX7dKg
         oYIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775211615; x=1775816415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uxr50lzNrUy02WpUKFckLw5k2tUVUFZ3uYKdaby4Gk=;
        b=kXJuvPvkYbQ8Sq+gzVYYrME7h52cgRLbAxMl6XLBIitkqF9D+gGqpvD4GeLVrlu0cI
         VsiFNtyF3NhhvnZLhNmJXHTqOhbt3Ihx9aqWmrGwQsK8BOIVmi45YvMFjW5GL2mFxrFx
         LLv/jaUABFUR25hZ+sKhv4g8a7kr8PZJq82jQjUXf1d+Li3YT5W0ykngVqh/BWBm5WkL
         Y7e+820otitfGyLwMZ397lNI5hTXcwbKYm3bcSl7ZgrnJu6NNV+29sSGoI0XgKhDTgYS
         sdn9/eg7l5TvQYtV2pLWzQYs0b19CbEZ+m2kHMEzEACeUiNZlkBxYfayoJX/fm6llg84
         wDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775211615; x=1775816415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6uxr50lzNrUy02WpUKFckLw5k2tUVUFZ3uYKdaby4Gk=;
        b=Tk2qWs30gt+G5AkJDgxd95HbD0p1lmTJRYlKVIBn4AVqdk/MEI4L6XWDBhcm9947fE
         ZPwqEnK4pOX4v+FColHSMLHlVf5usrDDqrzAypx/VvLXJgjW4fw5Nti+YQ/xdvpy+BSz
         pFCZdWKsyHVcATHJBBi8Op93Uck9kv6e59gO1GS1XHLtiyIZCqgEsqB6G6oRUZ55Lg52
         E01djPughXOlIajdKU3WG5KAwek0Jc1AJXvg0jn3P+853vUww9quOXbJ12ZWEFDnNh7D
         b0Ji2fxUl6ta32wBlPn7eACIVGux/tHpOgIg3U1d7QIZZw7rdQyrOSKw9NLK/J+AkBWJ
         Jbqg==
X-Forwarded-Encrypted: i=1; AJvYcCULqvD6IGYpwJh6dxmAtB9Wdl5XXQMDZwXyb61eGr+I9H9UGMJGQJbyD13VOiReAswds54Xs5G53wHRgCh1qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGZRfxfMraAJJ6e+fAoyex/DFOm+8oUP9UCQSesAScAXeWL6kR
	UXmjq7avo9Fq5jQL4bRD8OI6QxGPeNh+EUr3l0NM4EKPdf1Y71dil9ApYzpsT2iD+Q1Ki921g6y
	wWRp88IlOKSzbFgiZnkywk5r5KMXwu6Q=
X-Gm-Gg: AeBDieu7XsFDyeioLwbW0mFwjJ06TJcPVKowA5TPaUzzDsVQIneXcNeSocua6IfvYts
	D4J/h7jnYjEVwlfK1jr4jhl29H8FdxRDX/W9+s6cQLlli4HgoycAFj0wV5iLp0sopq8M8XemFjT
	rq4xyi9dLJGxhc6l4dDuUE5V+jBC3/4rHJ19JXyI3u1ZfiS5aJb/OAeh0Pm1Ld/APl9dIrokHBI
	XFnSiXF4mclRa70ywlA+8MOu/SqnJ1QAhcZPp/TkOTYudpL+reoMgC6YoiAy6QK5REkpv8/m4nJ
	HEJzrKTM5Qju2X+tr61FoDQL/4giIRakvODvg/jS89MqGDk6x4YoHraceWGCPB8EnnxTno2rFm3
	+eIjgVGapmgFIPu2vPy6cV43R/KVlG03M/Q==
X-Received: by 2002:a05:6512:689:b0:5a1:30ec:427c with SMTP id
 2adb3069b0e04-5a33758f654mr429274e87.6.1775211614577; Fri, 03 Apr 2026
 03:20:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331190053.482607-1-ojeda@kernel.org> <d47bcff5-ae97-4a27-8348-efef67ed3d98@app.fastmail.com>
In-Reply-To: <d47bcff5-ae97-4a27-8348-efef67ed3d98@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 12:19:56 +0200
X-Gm-Features: AQROBzDpnQ318ituSaZKPFVAKDCpHFAe85mKUJ0mJsPsR1hEGjv_SNjArBSCgIk
Message-ID: <CANiq72nFZT0ZZS1R82qVjPg4A=FEU675-3yx+tv3XVA=twnUWQ@mail.gmail.com>
Subject: Re: arm `rustdoc` Rust 1.85.0-only build error
To: =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <debian@fabian.gruenbichler.email>
Cc: Miguel Ojeda <ojeda@kernel.org>, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 10:12=E2=80=AFAM Fabian Gr=C3=BCnbichler
<debian@fabian.gruenbichler.email> wrote:
>
> I will check how the full diff for 1.85.1 looks like compared to just pic=
king
> the rustdoc fix referenced above, and then file a stable update request. =
AFAIU
> either option works for you?

Thanks for the reply and the details! Yeah, the timing was unfortunate :)

Either works for us, in the sense that it is not a critical issue
(i.e. it is just for generating the docs and just for arm32).

Having said that, having the actual .1 release there is nicer in that
we could consider raising the minimum version to that one (or perhaps
at least print a warning if using .0).

It also means we may get more focused testing and one less version
around (e.g. currently I found this because I test our minimum, but
generally I test the latest point versions).

Cheers,
Miguel
