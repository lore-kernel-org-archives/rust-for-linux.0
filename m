Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953E235C19F
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817637; cv=pass; b=t+1hsuHfEiLsi+s7MSdh4uIGpN2xOX4rG2OBYHg6SRjfpBMuq43LHD/bJCiKbeyOfVX3qSCRHH19eXPvZ2XkJB9iKMfVka5gOiG0oOl04Vn3Ntf6fUWga2ZGFl9hy/f2EfkpAOQSnQcYOhjGD185htlJOsyiOkx/nIauxia7rbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817637; c=relaxed/simple;
	bh=sh6AuXNWLVwmG61iYneIjKjb+J4l0ilpP/PVacbgnJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R8q+njq1EzwG+dE5g8HSYan+Ep+o60CpB7r+Xmssr2BE4rCwVSt7QjUNYoASsyLM77BEsIEx/FVIhDOOS5jGgLqf1i3AsQJ4byUMp5BVMov5Fwdmi+j7pObh9mhnqf4BsaHITAG/Q1DtPZvl7uM4uBwQ4WMZsR89u3WpG31U0Bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCTZHJMY; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCTZHJMY"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ee34d7e55aso1301719eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 10:47:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779817636; cv=none;
        d=google.com; s=arc-20240605;
        b=Hym59waLLWM/3b5qguuU6jtZu+qyFk4me9eDHjgs6om9kRdCr3PRoWIQQyv0aRsAaP
         gJIanoaEJkU0uH/isJL9FZOGK8jEd+hX+YFdU52L9VbRncA0uizXrWwgcwyu62sPMtAz
         TTJ4RA86OUk/hJJn5LSy8PD05HE1vKoJFLlCxqAb6Hx9UkaVwWdy53WDmJy4IBkF6qsb
         4zqva7pZKiXSImOec8rmx96s0k/wUgB6b3cDJZdOg+xojSnLXMg1ME4Z8e3nup+w/eks
         JS00BDXambHIbG/W9+csfJu8OiaUmcBncKrxf5G6RQfRW09a9GKBNS91cIDIrD0skns0
         IVJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sh6AuXNWLVwmG61iYneIjKjb+J4l0ilpP/PVacbgnJE=;
        fh=4bNGmsg5OGBILEyWNtgmbNjAF8ti8ee9LbPEI7Q6SiY=;
        b=bJ3M7U0uaHH/obyk8Qto1Y0jbtlIcKaGeYbzvZS4J4n+HAsloZhz6MLGnZ3/WS9ohl
         TfRlocjICbmQXVXeRYPKc8RdLF/9meodBer4umO4d3kZ03ujWDI/ZCmv1DdQLAqPzbmK
         +e3qxUhp+RyGfBQzDadFK7WUHFI9dr/Eco+luKrxMdyIWnnbfFIKdO5x/SV53M5Zw/UU
         B0Ecaf/S1WyVjBS2RFrvAoLnFawUaYadZQvQNHWLt9IiT+N+AR3ycjYcQ8EzdOIiznuP
         iU/bC0jvjTpjEwB32ef5l2dYy4Ku+mkuB5xswfkHwbOUEEyQNm3gFibGQPEcEQiqAq0e
         kQpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779817636; x=1780422436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sh6AuXNWLVwmG61iYneIjKjb+J4l0ilpP/PVacbgnJE=;
        b=SCTZHJMYsO/ckE7f+LXRcVEfQ3l5LoVCNjLMoiqhtCq4SK0/caFvCC+A5P5ZBdK57y
         4igL/rN5dvWh+4UfHjHWHa0c8SOembNcnPZANLcAWPX6RfaWHp+mZD3kK7/htbClJ5Li
         x4VDf33+IoqkvUKde/HqmC5AG4v50b7aAsgTMMg6hhtax1PMZ4lqBheqNPY0L+d5z4Sn
         7aY52qPEw/oqdapSyJYmWdnfgAy952MmEmgzlfAxudpykfu48l1/DBKt8vtviU70bHqe
         AmmyijSQabDbaP9dLTxsl7DaJa5F/h4E+hO1eNFu+DCwy3IAB1BEzcJgapL1Q7Z5ARwA
         ivOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779817636; x=1780422436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sh6AuXNWLVwmG61iYneIjKjb+J4l0ilpP/PVacbgnJE=;
        b=quEXWnX1LeEZBiT/JfuZbuLgWJHwyqXiMBuxRlsGDvrJ+h0BbYAY6OS4TlxWZgSlcq
         osH+JvZeYd/LAOm7PigwvbqwJU8y1fyyDSR72vZ3NU4qX+YzHrRHlA1cICTeygbUIK9G
         XqrxL6toUkWIhjIMN9pAAehhmspltR2/kpN5b9C597tma8PQtfJe/K3pi0mp8ueXHwHX
         aHhhMjYz1GfAnOuhVujSvJv0BdKKAfSPOTPeit7GbTlnVKjfr84oNSIKoD96OPGstvcn
         2uRdaq562pr6yw9GaTD1sOYXQ0ItmcbvoQc5jMaN8Eo8c2sz0dS5YwTnLKhMeU2dF2Ez
         oCOg==
X-Forwarded-Encrypted: i=1; AFNElJ8dyUCQopFR8KoRWOVYx5NMOUQTArVqXKBOWPdDYs5snCUh3xP9Pe0XFkp9kQIa0dHa3SlwmQfi1AIkri/DTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym9BPX0uvWddjpRIOfLcrefkbaOUXAlAZM2aTv0vu+r6ZQRT4U
	BClV1pRLzwQZHsgsw2QxTtW6vdkoiGqAsr5cyq6JnTvlWVKkeDcmzUC+rrjZ1YAnHn8gnFy8KiG
	HyIvy67DngK382RVDMrXYKPr+HEcYgfk=
X-Gm-Gg: Acq92OG5CS11rLwv0qsEHKVL6e5yk8DmGG9lmwrct4kGKz3bgu4P1Wy8fsVor98W0QT
	i3QIrmaNX3b8kV1VFWCaktG9pbrjovzKYBjFBBscyFVNZLOkvktiUvV+vOQjzssC0Tpwkpaam5z
	LHkWiQ8TeJeL9t4qMh8Ppcht02I/FBZjkMBgCS8nqFW953667i+exZ5t2y4EJpapaDcWQZmneEc
	5LLtFj0CEbhiEiTzuyURsSOvVwPgxm7UXrrs67oaus2q6wF870T8jqTCyqK1/CU/I/YTsGbyB07
	UXSPgUmXLnk9G2ssHu2uxcaOAuZJK5zQFg6PojO53NaWIu6mT4sWnx5jxA4TOZKpL1w4T5oXfGP
	pNYUvP8SX6Fuuv8L5Hp7TgmvN9McZsZWTMw==
X-Received: by 2002:a05:7300:ac8a:b0:2e5:faa9:ca76 with SMTP id
 5a478bee46e88-3044914903amr4026664eec.7.1779817635590; Tue, 26 May 2026
 10:47:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
 <20260522-binder-strict-provenance-v1-2-3d6e9406e864@kernel.org>
 <ahWTBbLpYEDlPTr2@google.com> <CAJ-ks9kdwuO=wmjmfhHMOOSG6cuEs7hnVVActxP5DSHTRFfX7A@mail.gmail.com>
 <CAH5fLggtyjE8utcGfESCGKPTyqpdbPsKCvpJX6x1yBKUYywW5A@mail.gmail.com>
 <CAJ-ks9=8GSw4sZxy_Vm8VW5j8n02yxr6eDSX3TA7VrnBo5pCDg@mail.gmail.com>
 <CAH5fLgibt_BQmOtkfEfo1=48zUeoWBJ-=u5gzw_a3X6Q7=aUSA@mail.gmail.com> <CAJ-ks9=Mzqff50B3EtJdeDNAULO_tOkdYWW+OsCNXtfasqpdoA@mail.gmail.com>
In-Reply-To: <CAJ-ks9=Mzqff50B3EtJdeDNAULO_tOkdYWW+OsCNXtfasqpdoA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 19:47:02 +0200
X-Gm-Features: AVHnY4K3tQ-DF9sS7B7Bpggvp_vDd-qa22WLOsWy4L3k9cEGucDDdsYwXF0nudY
Message-ID: <CANiq72mvV7Q27CG5Zf4bB3mQPSvTRquTKw5P4N4fjrYKddYF+Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] rust: binder: transmute transaction data
To: Tamir Duberstein <tamird@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 6:31=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Thanks for explaining. There is already a clippy lint for this, which
> I'm looking into enabling.

Would it make sense to add a custom, narrower function to perform such
casts? i.e. to still avoid `as` and to make it greppable.

Cheers,
Miguel
