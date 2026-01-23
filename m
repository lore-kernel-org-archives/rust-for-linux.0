Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD92126BF1
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 21:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769205188; cv=pass; b=Oy06rI5+CyAO2TwtlYkbCH2qpgrdxJ+r/LAtXNf04HnwDCwpoiKrPqVPoivyvJuGpG3aTTNKZe9WqXffl9X5AtgQ+mH/z53sgCFO67mhdDj5gzYEO/oB9sFD4O+NAM4EqAplC04BCYe6AAKFXgAUzaK1KJkzIxDV01bxjCBEHGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769205188; c=relaxed/simple;
	bh=9Ep/4rplD22XA1Jd43Nq1k5DwogUL9sjJeYzQUx57Yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jkf7k5hVaSl+gNmG6hySfDAcDyZnapl/xB9ORmQYZMwc6EXsQy57osUWKE+HHXSLhzt8rl/qDAeU/JrHSZusp2UiSuNvmga3UbFgAwrQstiFqa/BkZpbszQtGZhf/e7hj8251D2+9wlJxtME4dGgygmAGLVj7GQTW/CZXh/wqRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5L1cavT; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5L1cavT"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ae5283dae8so154265eec.2
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 13:53:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769205186; cv=none;
        d=google.com; s=arc-20240605;
        b=gwbAhff0p6G/0jpD4CuolrRroXj9naTxOEpMgD8PLz7HdreF/6wb0N1ajr/KdHPYXt
         DIS1T2GCpG4dRI4nUomUY9Y0e9GlbLwF8TgwJUIU48NR5eFKFPCVg0P+CVmPv8T7VovK
         FQrRzC4WzAUEMe1SDBK9hxIzleSh4KghUB7/5n82cA5vOYjFS2dhM0LAbfmtaDM2kMmP
         kk92dlLolHNlqyAhRGnI0syVyaY+roKPkA7udOcTFSaw4x+Jj0TQTVsKM+wkj9jetvt+
         wGrJb8fVkR+pPCkux8nsS9UfMV29ALF/A9JMOypoCIt9ic3+uPe+BIRhnEdt0tqd5gB/
         qL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Ep/4rplD22XA1Jd43Nq1k5DwogUL9sjJeYzQUx57Yw=;
        fh=lgy6APjA2TuMUfVBC45P9XYS/BtDehruARVMecWrqNo=;
        b=JmSzVo7frR5UoCi5QOgMc2Uo578tyTrg7itGy84wVxrH6mY/uenKnwCmzytUMxAdT0
         j2WdT6kl8rE1/Djg/T535qEchYWGDnHik0YIi0bCasaSMhueUhEaMHv5zQBg1aMkQQ6B
         qAJKX/ES1AILNvaxKofu4i4V2lqbpDxb+WkmhpfMON2x5H0M5kc2uVWnS2M/sMYM2ClP
         Ho6d4aDBfRPOKRYuNUJZKeivZdssxS/BlBmHegOP2usoJff+wfus4EjNC+0WsNGoQDNN
         axGXyWJq1nv3PXi6aoYeTfC5IbphuEVHFDr1ev83C5b67OTGNzU/S/cp5fKoNWy/Tx9v
         h2ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769205186; x=1769809986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ep/4rplD22XA1Jd43Nq1k5DwogUL9sjJeYzQUx57Yw=;
        b=U5L1cavTCcRIBF2OrPzLLzg0XCfDJBF3rMh8EsrEwj6sRslOd6X3kMBXRyFL2CP15m
         AIT7ely/RK67NnrCMfA8Jymv5GqUZh0Dskz9mqM2r0z2NzdMn0wvv6xEroxAH/91BecN
         1w9Unt3/lLOP/mha0/XMQKkWqKNAO9lV9+24GUAmcNTtHYv1vMJOo5y7KKvKo+46LBi8
         XyEFF3DR4kQbIEdPWKET3f7GNWUJMu2f0aJIa3irGryXZX8es14GpROs0/+WRKVnNckg
         RDMIOm3LeQvd1+qi1FiuRgaew9d5dm5hJqJTUpK86EopQOtGoHNHvUVzqIgj4zWFpn5b
         Ct9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769205186; x=1769809986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Ep/4rplD22XA1Jd43Nq1k5DwogUL9sjJeYzQUx57Yw=;
        b=K85TWVonYo55GcVSajKAjqtRLp+MLianVMo3Wgm/iGBgX0Rse+TZbhvsUTNtbnnFvb
         WxyUajyl2hKgyznYSp+Ha+a1To8Mm0fzTNogRTR3l3Rs9xJXtbWgsc22jGza5OrqEsPe
         V3KNPJxb5tL6W6Hb/hUSG2MhsQ9anA/t+jVLVHHBvMJGvvaKd7T/mcXasErgtddFuZTq
         4DkKDeyFP0TC80EAD9zwHTcMWB5l4relTppjGr19LOXVDd8y/kWXEvurujwd1C9n+Mmp
         GYmhda/JQymR/2yvw9IqZyoXNKMYi9O15EbvlIYj4jZHpXwzwbEjaMPNh137s0S4icpb
         RShg==
X-Forwarded-Encrypted: i=1; AJvYcCX2uapvryi5jYjQzGid0PALK49xGy1HmjLGz3zXiIkmUPJQMrRj355k3Y1t9PCJk+ye6o6qZd1fHHGnP12rug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOIwj76mI9zW8XxO32FnsC1KFa8UX5WsSYq7Z5AIU6NAdD+9Qi
	JLhSs2sihTrBhEEVSReHk4ptr/xPParUwHYuU7sV21iGeaElxHh+EcF+kBxeDCgKPyKdFakQoOC
	dD27uVCCbZUm7fRQcPVF4/XUxoQCJ/Jc=
X-Gm-Gg: AZuq6aIuyln6LSeObtpYZK6dFaJeY0moGNh8SDzVNusT5ZWiOli8InyugSYRxPUVCB2
	suuJX2w0zhruA1XWJULX+FfTVCNWa74/DBlHzuTPdSt+1K8TyuUBzfpkPLdbsSdOiek7XAjzsvj
	aa+Sb28W+QdkpBu4TU2hDi0ebFdnInapjjBt6D4uVF1I+qcmNwOIls28FEqTVlp9ypjML8AmJOQ
	71LL8NwaCfaLtrk/qIhuRC5L14XqcCFoUN3nBQIdzn9NNhKRkOuDo451TkZ6RsclYPL8h+X6cIp
	X7BZ20E1mQ9vmEi6VtirVxFoKsqy03EhUD+7rEFJRQw0c89GjMmg81T90HTg0LDej2jYAhnrQu2
	C0spN/yLK0st3
X-Received: by 2002:a05:7300:4308:b0:2b7:1cbe:fd31 with SMTP id
 5a478bee46e88-2b74e894200mr282379eec.5.1769205185862; Fri, 23 Jan 2026
 13:53:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123175235.209092-1-deborah.brouwer@collabora.com>
In-Reply-To: <20260123175235.209092-1-deborah.brouwer@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 22:52:51 +0100
X-Gm-Features: AZwV_QhaLoszLXa1nYZT8QHcVsl1_mwB9UJTtvTw9Qim_nysZJKLydf37qNT6UI
Message-ID: <CANiq72m86aqCr3F+QdzzB-tPsgaUF0YWfV6NAyLqfq8AzKw90g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/tyr: suppress unread field warnings
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, aliceryhl@google.com, 
	boris.brezillon@collabora.com, broonie@kernel.org, dakr@kernel.org, 
	gary@garyguo.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 6:52=E2=80=AFPM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> Currently the rust compiler warns that certain fields in the TyrDriver ar=
e
> 'never read'. The fields are needed, but they are not read directly, they
> are only written into an 'impl PinInit' that is returned by probe.
>
> When warnings are compiled as errors, these warnings prevent Tyr from
> building.
>
> Suppress the warnings by adding underscores to the problematic variables.
> This allows Tyr to build again.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

In the future, please add the error message to the commit (it helps
for matching it later).

Thanks!

Cheers,
Miguel
