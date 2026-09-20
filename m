Received: from mail-pj2-f30.google.com (mail-pj2-f30.google.com [74.125.227.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69D73A6F06
	for <rust-for-linux@vger.kernel.org>; Sun, 20 Sep 2026 20:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.158
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789935149; cv=pass; b=jHZZkv32Zy3feHgO0u8jRa/ZWFaBh370l5bJk1n87zzVvSN1yFYqb5+fao3lNK6524pWzg8KOHfrk8ioG5LOeElcs47UJEWD87O12LpbHvnssL8wZNbIfU73Quh/xBdyuSQaMYQ9eCatVNHEGdr1bjN0LVdt7Umk14MIAgsD5Jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789935149; c=relaxed/simple;
	bh=YH6ovs2GM4Gb+M+haBtrUODmJrKE4n7H8J0N3oX2GV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZM5wz+/lcT0q+ObkxPbKagiNMrGM50FI8IOI8XXa+tHX9tfNWTkCAilX4T96czQw9gdGFcpEwaWkClyv3rHlia8IUMxWPlpd9/+ZD4Gsq12Hut/TLqrxVej3ePGrZV0J0uXJiXoxBfst2K1pXBUn0JXLF+u9xwmmxcekI3e0Lm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEKmGRJh; arc=pass smtp.client-ip=74.125.227.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEKmGRJh"
Received: by mail-pj2-f30.google.com with SMTP id d9443c01a7336-2d6ff2f2c4eso4817145ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Sep 2026 13:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789935147; cv=none;
        d=google.com; s=arc-20260327;
        b=aRo6n+OjtAd8eV18qLWf6S5eoFQOVYVp15ea4uuXjNqYrdIkvQnW9HQO7zfoEetw8f
         reX7dpN4vVjTc+dwoYmgjgacUQQ/2FoXq3lJGpaEZrnjcaEXyPAX4j0+znHPps25AE+X
         4qWpjPTB/LXYv6gAQrhWdt6OQcf5Nf7V4zNOAftSi3OZchYIZ4nTE7kQaZvHVsXBJxnH
         LYvrPiM0czE9CwQKwQoeENvK5JKKpiAN3PcK1RHhKbhS9FbKX/7v2Nn+apvErmkcAzat
         ApkXG8erlGP+xC0A36RkGJhEEWUeR3qh8ypvlAEMjhCump7DlGhmZBFYx+ou5Is9uKQ6
         x/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YH6ovs2GM4Gb+M+haBtrUODmJrKE4n7H8J0N3oX2GV4=;
        fh=iiCkCjvPZxNz9CCh8wfVDHe+sFi1gfcFyIQWGfUdNcg=;
        b=qIu2kXn1buAUuFK/zaX3AjNstDiTzkZgyy455VX1Ri5KKHo+IVClDRc12CG56wU0W6
         lswecC4pUmV7UoF7jhIGGuwvqDVOQ+TSWbSC9jIe/1wWG/Qjm9ZlKP/QQ9NxZfFqEusn
         Uh9LwTvLUhTk3wZR9cHoYICvIPYDJphK1Jde3iWxGEoOi/NIxX0LWg6CQjk6xr4h/by0
         eZpZCHHCVVGanqGRBm3TpSufoaxV3/xRyhBDfaeNo5XTeERyz3dSuZMgugAzWULGUH73
         jA2oByLDRp3EtII0+Smo+2uldbbNEf9IahZgmVnQTUXo/xoJhwhzWMWWmtuzOGMHiH0t
         n08Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789935147; x=1790539947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YH6ovs2GM4Gb+M+haBtrUODmJrKE4n7H8J0N3oX2GV4=;
        b=dEKmGRJhpt8Kv7FcU/2WPSj/PYkCDPkb6se0YbSKhBGPFm0eDkFnuTw83o5iVlPANv
         M+w59htbc+L0XjkGfuLn88lJyHJaL5P3fRHmIRKVSGqABcBe1AJpO4PvJXQsL0xLdjaE
         vxgpxiul4Cot43RFGyXrd8v26qMUWAbsJpw3CJ3lA83WNKknmpX0FeEO43/ZNbLxTeYN
         TygG805kETOQjxg5A/OSwNx2w3lnPvqTuWphWiUavHOrvcmy1g/DBeIrQBc22GDbZNq7
         1J42O60fPvFGo3YY+KeoOdJOBjxWzyhKn74tK2NQu898G/ot9StZY14EM0I71R2KoCrh
         +o1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789935147; x=1790539947;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YH6ovs2GM4Gb+M+haBtrUODmJrKE4n7H8J0N3oX2GV4=;
        b=06Js34z4cWxOPpxQm6cdkdnlAgfZksDR0DnMQALs7VQlGAH52ubTgzqJ5K8bJK7ofp
         bNbp5IX81hN2DdgJOJXjHhwb2KtRXbEsH5yr4XS4z2m+kWclefALUfYdhLe55Atamx13
         dBzhEzGEQ/3axstz4ARAI+Uc8wiY+LDgmdSsrkS61IdpI7E03EGMip4b306sNk7DIlPv
         OTJ/SWVnOOaLLpzjzvKnlt3aw/8BvMXHdeoSMLL5suxkcc00iMOp4Ej2nEpDJo1Q8XGC
         rLWMQZ6I5FJAh+/3tPjjBQq3vcMF7CkLT1/piLQQEZgDfo607TEcaRvi0zxVWpQWpypa
         eM5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzlzCJF82AALUEFnDkmf0j3FlpezdThQP0IopMs6XSU19RSk2jcF/EiOoUpRDhGu49gwjZ8IfLi+58kMT/C3g==@vger.kernel.org
X-Gm-Message-State: AFuF++k+nl6apCLrywl22Emu69h87O42OaXRWI83IppkIVIxKt1Hz5pd
	p2XzwSx0YdDQj5zFexYakGbKEJgCgiDeJNFqURiXc0bUBYwS++jdCk5FJ6LEw0VlGqRfaCr7ut7
	lYIvqBWzFwYAhqi82k9aijY+hRZ5MD9A=
X-Gm-Gg: AYBFou3ONJ4wVVB3xWbk07efZ9InsgkGb5s356L8MxdrgyvoJOAlBJSogvR5DI9LkXi
	XgjcD3Yt9AxrsnMWkHQmKtPUZRfMjY7pe6TvmRWhuHgoJ01Ift67n3ghj+sgeZkAmQt8lA/wudu
	cg6haV7O6FTWOlnZVwzKQU3KxeLSGYDI+tEIdtCajZg0j+ElMGa79FmwxHmApKW6SFMV+faIm3K
	UpfzUfZEwBKCo7GzwEjSMgFYYX/vPqbAOyXrwRO9afhGM5Zyxj4Eppo/hfTZAywJM8sCs8GaHR/
	uFyO/0ZyBWbLd+B4GIiaX5FpR1fVpiofn2tYwYTYN6MJoYePSa4KvdaJpANhPh0Qrjp6Qkhg76g
	5vcZBu3LjQClH0FamcAIxXZds+Iozf8Ly8t3OZ5s8x1vykabSSOGvaP9lZtutz1YLJEiTw/TJ3a
	DJJ7BFmUbQYV3IFFopL40VVv2LbwBr4ulwBDWSzAAdk1faAN5Sp28=
X-Received: by 2002:a17:90b:4c4e:b0:396:d27b:86a4 with SMTP id
 98e67ed59e1d1-39e594253c0mr16168801a91.2.1789935146983; Sun, 20 Sep 2026
 13:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789426258.git.pgovind2@uci.edu> <e65203759411aeca4805e3f619f3dd20839dba35.1789426258.git.pgovind2@uci.edu>
In-Reply-To: <e65203759411aeca4805e3f619f3dd20839dba35.1789426258.git.pgovind2@uci.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 20 Sep 2026 21:12:10 +0100
X-Gm-Features: AcwNN1VexTLA3BPLQdHuWi6jhCGpYq-Doon1BCGU3aUkkVr4dsmuI9o_2OcQux8
Message-ID: <CANiq72mkoPyo=H8p=QspKOQXEKPPsWyG46UFETX4reK9eVBkhQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] rust: module_param: Fix potentially incorrect access
 of `SetOnce<T>`
To: Priya Bala Govindasamy <pgovind2@uci.edu>
Cc: mcgrof@kernel.org, petr.pavlu@suse.com, da.gomez@kernel.org, 
	samitolvanen@google.com, ojeda@kernel.org, atomlin@atomlin.com, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	ardalan@uci.edu, zhiyunq@cs.ucr.edu, dzueck@uci.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 7:43=E2=80=AFPM Priya Bala Govindasamy <pgovind2@uc=
i.edu> wrote:
>
> Fixes: 0b08fc292842 ("rust: introduce module_param module")

Before it is forgotten:

Cc: stable@vger.kernel.org

Without taking a proper look reproducing etc., it is indeed true that
Rust's default representation may reorder fields (even without the
flags).

Thanks!

Cheers,
Miguel
