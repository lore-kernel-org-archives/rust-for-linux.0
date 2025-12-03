Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA7A229B36
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764771796; cv=none; b=CERXCrvj8gsU1Q/ZqQ2iiBYS605X3m1YKh0Fl+vJnD1jfdIdFxKitYND1jpsELiI05nS1c/OMUVA/6GVN3IxZf39OQM1er8LeoE02MY0n2LGjkyxHts0KGSb9uOa1KN0zjw9UMYyWdz2tHSyOyjTOr25i1e5I5FU2n5yRfombcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764771796; c=relaxed/simple;
	bh=Vkj4UZa2zzs8G2UOUz8v4uFub5Mc1QaoSaRenqJpYjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cIwRzh7T9g8tjLHvY+1LAl8IsLopKsQKqJ2ui6hzb+IcGN4B+tbhnwuWa3KdD8PMR6tTEF9oCn4kvr4j7wxkXZYVw1/nTJIWStH0ADvqlnrY2DYfh6qjhhDFnj+4YD77q1mw1bp2cuWfKPVYvQUQeENkrbITZ93IEt75Z0cOSyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/asrNwR; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/asrNwR"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-be9ab2335beso110319a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 06:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764771795; x=1765376595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vkj4UZa2zzs8G2UOUz8v4uFub5Mc1QaoSaRenqJpYjs=;
        b=a/asrNwRW8xtqucWsyVXwE892NADfXMpvryOE5wS9MES/cikkPx/EwfCJqpPPwVjJq
         WybyjdNkBgTVTKOdMbrh8QNaeZK+w1yz/9HcPCUgm6WZXCXF+MHxbUZ+Ln8P7Wrc9w63
         3Mptt0vA6Uv+dvTC+rldhBZoR3FHEo2/m8nVsYM3/omO8atPgqYwb0oZy7W0S1TZGfI7
         u3GXv2xNdl6RMqbMi0HUxu6avbfnqzdUSeTf3Y02AaW5BjdV9GHFr6Lq811SXnQ1Z7fa
         /VEZ5Du/4VkIccWHvrKDy5s3mEyx53scxzGATdO1I41/GuNjKWldbEUAyq9pcNhjVlQZ
         UAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764771795; x=1765376595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vkj4UZa2zzs8G2UOUz8v4uFub5Mc1QaoSaRenqJpYjs=;
        b=I9GwYLVa3PAJh/PA6Q/TnJ1tlAJT++NGCeVg7BgJaiO+RrnzP3JSnnMNJ2MxcMJh+U
         1lJFkg9mK9nctffnVwUwTBrbGew26v0oF46pLcUYieXPALOZrABaRQ2jv3ltD6133ZHt
         Q2lU0xkNYQdlbdFrlGymoz85n0/OokKVBqz/Cz1olflpOaYRXGlMU6pLJ5OevojonJsl
         07P06kgerJsBLmpeGnIfhgu1KpxufFLIGIPwwJ3ReVlxt9sNXhTOd9M85Lch4vXOxpMH
         kIUe3X2DqG/67LsbcI1ebJsWMjGMPrCz/BFHoFNTP2pfGJmL1trMVaAnaYwtmMXz3E3y
         GaTg==
X-Forwarded-Encrypted: i=1; AJvYcCW+DvhP9ziwcMAvX680GcswvANV0DzjlJkCfD2pqy96Ojdcd8HbUaPw1SqxP59WShFcW64/51UUpEJxHhjK3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMRedYUvG7VT7cIEFeIBvmO2ll3HNCCHTDdOv98xvlch8sj2QL
	EsEn93dqtOiIZi/KCbCbp3TJ0ZlsZypL60QLjsOu/wOET4IU1vzAhk8Gzz8GNJTsAGZ5ajwzcSa
	lnJ+CfUSUNbNgn9EIjG8VG1Z3ttaanHc=
X-Gm-Gg: ASbGnctLEsPImkmvPpcxBgxR8RYapvLODzuCCYx0/CHOGHzI9wnHOQJhjaFnrPNar54
	QWAyN0r8nVcuNXStGFZ5eDoKaaD/vfu98EUoRNoNou3lBuWx4p3SVHNi9w/cbYLlXWK51vcB+Us
	wUdgYvNNUqdIYnsNOAI5OPxeFrakwc6nBum18uZwl5cKfdcllQEZzEO1GjvrYg8MwV+O9XmsnGJ
	/YiBK9/NGuT14LcetoaHlp7dSe07PugyFkBbyjD20S6G3mPMbJRDavtpd/v3aWJrC1FJtlZAtcc
	viFcx9Mddf2SO9ZEV8AdbQh/3uCXYMoNJCBnxLxQKaGpvGE+72iEj7lWnZp35QBjyCm9nqNGNbO
	6g+tOM0hyKeU5dg==
X-Google-Smtp-Source: AGHT+IG+OmV5koBPTAU6zbKyvDPdrggEI6GhVp8UWasx18z1p/R1MSZUGFXprtnEFz1pE6EF29RCPtS89T6MuSSUbRc=
X-Received: by 2002:a05:7301:550d:b0:2a4:3592:8624 with SMTP id
 5a478bee46e88-2ab97c76015mr726000eec.2.1764771794633; Wed, 03 Dec 2025
 06:23:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202032541.78497-1-yu.whisper.personal@gmail.com> <DEOKZ255N1YJ.1U9OX5KDWQGY2@nvidia.com>
In-Reply-To: <DEOKZ255N1YJ.1U9OX5KDWQGY2@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 3 Dec 2025 15:23:02 +0100
X-Gm-Features: AWmQ_blO-EB1KvXTK3KzcsaabMZ4xxfza_iCNQKgwtTd5vzNcQ4yuiYS4fkHXqc
Message-ID: <CANiq72mq5TCa4NqpxOMq3-e55N8Z4757Zx_=uzVge2QfqXOprA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: num: bounded: mark __new as unsafe
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Hsiu Che Yu <yu.whisper.personal@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 1:29=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Wasn't it Alice who said that `__new` should be unsafe?

The issue was about making it unsafe -- I added the "Otherwise" branch
to make it a bit more "open", i.e. sometimes I try to make those "good
first issues" in a way that it is not completely automated, e.g. here
so that the new contributor has to think what it means for a function
to be unsafe or not, rather than just converting it. Given Hsiu's
reply in v1, it seems it worked! :)

Cheers,
Miguel
