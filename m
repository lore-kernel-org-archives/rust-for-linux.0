Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462AC2DCF6C
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 12:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776428482; cv=pass; b=vEEuXFr68Q4wzXf1XZQPUOBSUolgpXplyVYz3gZURCChUL4GzHZEiaceH3694p8SZVgiOGrlnDc/Bxf6y8hwk4QL742pVDnbSlUoTAVVfWr/j0IEIzPXq3ExER3BmFljhvTDOXhZIFqM9W1Am4Nrw4oMk/Brrwjgj7Mxm4y8TwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776428482; c=relaxed/simple;
	bh=rl+p+AaNveQQn7NLxvMrIdc/G5AP3TAJtJkZcc0GLPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f8AxDof4E4kaCZTdoBEwVWRjmtVDthhVIgnpHTcJC1evW1XbyhLC/3eL/be2ZihVIx3c8pHChuvaReZ9t5OGyMF8OMPiaOI9aLt80eSI6ehU7p75NW2fZDDSlHR6oClW63XF29SG8i5Vd8pkT2SCrmkjyhpBV3X+U1TSgxDB91w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJowXqsl; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJowXqsl"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2d958ce9921so60926eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 05:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776428480; cv=none;
        d=google.com; s=arc-20240605;
        b=kaq0TzmTBdQSoH0we/qtEvSobzGWDDCw1Xh5AppaR4750eDgzQawkdfbxPmH0V1Llh
         eMbp6HZV9RLKQ6TIQTV356vZkx2OQ0xCqzYLABsMz4sny7keoKr3L31R5NOO3CCGpvje
         hrzpyCz/hbgakT5I9PeK4tsaxGSDIaz9Ay3Ypyh1sQTzumD6jfF4smx34gdiqmEogpbb
         gBoHUCOuHhITjQOUnvv/mPqKL/EJTR1FaaKqFEFCFaXBNPBixyyXhrJMbBKrXkobH9lE
         b/Q6TntN/UqIe3o65yNq/G+x9LlV4KjQRktzPn6LMGWYDyBJBV3an0jON/tCtHSy9Zao
         qiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rl+p+AaNveQQn7NLxvMrIdc/G5AP3TAJtJkZcc0GLPE=;
        fh=XA6g6rUA2xCw0MeQGtC2JhvoT3DAHySJUhlIF2htSI8=;
        b=ONnaxPNyih3MlVqnw3SR8ie9DnV/WW5RgtdJMifPp8u1mDuEpcuY/hd2DTQKPkF3SK
         ak+AyLJG/UQu/DjmeD9pE/8KvLadDOsttX6K/pzro+I9uHVCW/USDD9/Ufg6OU5nbOUi
         CExblqQowXkcc38WFzEGdYCVYXWB9xh3qSE1iQBvCKuzp2RgBv1UUGf+J9b6AxZSLkfu
         gCdcrtD0Q6frT62Xda9+4fO0SHcl+cDmmReJtdDwkVAEO+MOpXg1pKFjvxnO4Ybe2gpr
         59W85axelxprcgduXuhYLrKUgg0PCz/QCHJ48zWDOZk+/zBGHxtEzBwRmQc3+/53E2s1
         bc+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776428480; x=1777033280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl+p+AaNveQQn7NLxvMrIdc/G5AP3TAJtJkZcc0GLPE=;
        b=DJowXqslyfSjeM7EBkkd4ed1SuqYnap7zo00UlggB/4VIlnMgdurM7R59ikuypqcvm
         NpsTDeNaWxK0lxhMQyeteHngzWnfPIfQe3fdmC1M17Oo+g8+QNybukn2bJBzl/Z5VPSr
         UqFT3kkMrI0RYz3gdpKOrYVwZGDhxWIkDKYYimJPW7riXvUvLeZHe8aO0h9E5cyHyJvq
         KcpzfXSenPFrsDlrXF92aToKj+aDkaVF3nxVra86hCkGE2ZdNoWIVtpxEEpJ3weE3z2E
         WK7HWAh2MQEhiHb9KeTk/TV8RlicsZsVMhQVY/fW8sCHdKMvYj6pKuRlYMgqGteZYvf1
         zREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776428480; x=1777033280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rl+p+AaNveQQn7NLxvMrIdc/G5AP3TAJtJkZcc0GLPE=;
        b=mZKWASly0Ghyu1WGQuB+xG86xIuNsFMTN0eJTIMi/f6rPj3vOAcSkh+lZ4Eu3WKVdk
         i9cvrGWk96+Lm/7kBtLd+ZYvwNNr4CEiUtZvimmrLYx+/cs69r3IM8V4h7rqmt+rz5vq
         mnPrzMF4Jbrobb4Kl85rmyUqQRMKR7ZxQQ84r4EvwLFSb5oHuYDpBhPJtUxgdu9H5F8U
         ENU4lkAT4A7NQt9LlVw322mjmyEs5/3DBMSe3bvfPg8ulEu3rTKGR8PnReZl14KbepEj
         UaESl9c+tNbNB+GTTBBWCrRzLxMkuDhBxW5Pr2zI31d39/yd7oFhggflA5mZ4p49xAdr
         Q5UQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ocbAzLhvNkP9R/33dkCAMhmABWs6m7wFdc6Z1y4xqUIHHyxr5X/EBPfrwAZ34Ciybg4gPJQkD5uGN3Kcwgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2wLex9084Q0C+oDiVEo4GJxOoM+Z64chUYOKgnrtSoop0lahg
	KdkhuO1auQ2rsOlEgzcyyJtzHdXXT1XMZDip92GyVW7mb7urEdUw2t0GMx6OJBfovBNbP+4u4UO
	jv0mZUxQN6FvrLsTY1EnaCniF07jNQv4=
X-Gm-Gg: AeBDietJoBLY0fxJYCkQkfe+QSzDjsXKO81PgAsR8ul59gGz0ycxwENOTXaBtHzK4Vs
	GtXYM1LhTjLuvuMMA6Es5LNJo0j4/BKudWpuU9YSXhIYElL8y23Se84+S7JRE7OuW3fxhKfazvg
	ki6paZBEZarpVDdvibnrUTXBje9IXuML+TAxsYBv6UgmdBAOlDW9qOFzfeyOSROb0VJJCgRlvsF
	OfPEjXONMo+BlArUNNfep6S/3jRq/pzLFlgi+qZFX0XevSyp4xzZapalhOIbh2QA/4duCNCHpZ6
	HDwA1FXsF8p8nzzaOEMMfajN0fUDagf2OADNodcS1+lXuo72F5hUgyjfZUbSpuPMB4UFlI5VRzI
	8CGXxEXVqAOaBnaH5e3Do80iRteq0GX7Kww==
X-Received: by 2002:a05:7300:d70b:b0:2d4:62f0:b2e1 with SMTP id
 5a478bee46e88-2e452bb2b57mr527795eec.0.1776428480348; Fri, 17 Apr 2026
 05:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409-bitfield-v2-0-23ac400071cb@nvidia.com>
 <798e83e6-eb7b-4502-85e7-5a0f6d9c6281@nvidia.com> <DHUXFAD38G5Y.6X6QNTANYNGH@kernel.org>
 <CANiq72k0FXcekxs=E+xLe3=wyu+KHr4yM0wLj1VgtgTUb_K4MQ@mail.gmail.com> <DHVEWDBHYKQF.XBXZ704CMXCF@kernel.org>
In-Reply-To: <DHVEWDBHYKQF.XBXZ704CMXCF@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 Apr 2026 14:21:08 +0200
X-Gm-Features: AQROBzBxmAoyKatwLVEj-ovr7OXihWaqmDt3TqAdX7jALMUhbTGV97pdxOBe1oM
Message-ID: <CANiq72mNP4J_czVo25d1yRdWxBNFKaT9OPOC7k5EDzZ9YmdEww@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] rust: add `bitfield!` macro
To: Danilo Krummrich <dakr@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 2:00=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> This all builds on the assumption that we don't have a process in place t=
hat
> covers this.

It builds on what happens today. From what I saw, Mark merges
`drm-rust-next`, which is why I mentioned it, i.e. to help prevent
something unexpected around `linux-next`.

If the branches going into `linux-next` change, then great!

Cheers,
Miguel
