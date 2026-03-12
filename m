Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FF838C426
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 10:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773310286; cv=pass; b=TiKMS4bUWiRdAnDT8Nwel9ZZ0k5EkEwicrBD6rkq23oYcSsdLWfmBmAtIgHa7U1tWCRB1Hbag2h0zw4DCj3u2KpJSD9UEusK8WpksrTUgl0etkvr97nfXKI3l1gEFVvBYfLNWSHUVC1Zf1lqbnpvWtr/GpqmGQLoq4IoIDk896o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773310286; c=relaxed/simple;
	bh=Mc/+xlhWSrMWxZPR/mZoNLQozfhnGWHbHj5GbR3ElR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9TqbMvU2KsSvUdxD22KLX6LrLhEsbDHSExazuy1izXg3FqxpInwAGNycJaHZxZneqhg9X95RZSyg7zHUqWnRF6v+kgFtAra5oi11BG8d8uicuKt5xRGwRq2cIDjV6mMT8PvH7wwtwDyzTHDsa9D1h651Mc8316lJLegnIzNBSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YpgPzQnI; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YpgPzQnI"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-128bae6a35aso48303c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 03:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773310283; cv=none;
        d=google.com; s=arc-20240605;
        b=IRpjHbew1h6DBzOBG5QE7XQdOxiRFTOqF2WP1njn3CcbXsHAZnhSsQ6R6fJYjBMTNm
         YPGddgwYs95lcWKZNMKa5aAtY85rO5kYgnkwG51EYhDEOVRztaR6yFjDM7at7LXHOGZ+
         T5N5eX/EHL+Z6rfAYmilUSxZ1h/6bFVRfNu/tGTlME/iVxXzqwy95WXlLn4bPmtOO/m3
         2cusOZy3yZ4MEUXP+W/J1Egg/pJOjMf88jDvmGQFr+UnCSBgzE/sLHaGRL7gqagb+i8G
         phWYVs4gqFKX24Tn0OimhFKaxq/TGDdbT1huppRg0aPJ3eom3cVmBZ2f1/x/qOHtJV+z
         Su3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fQVN37mj5BDuODYW7wNFwBAsFMC+pSE0i8au/Fh/sd4=;
        fh=BY1AOheQawAcZtrhB7s98oO6Y5jZsrYZ+Zyd4UO7uLg=;
        b=aPBoF2QlNlqVHLLPHRPgIbJ6JuWSTs8aw+5mAirl+OOWYIghwCuuq03563RBQCBB0q
         /Jf7jksvEc4ntlCDAtg/rm7bQPdrZSWzMFJ2265dqhLPq7lHvdwIAnBBXjb0dKCcpbLr
         gfLOmuXXKJpLDrFaU+hS+ESCQjmMmj2d3Q8OYAN+f0f/rbQUaYQsEEt7KRSXWXBkeM1u
         h5P+qbr6M0khR3Te8ejxpPWjVoFvta/WVCmuFA7pY2r/bANnja3P8mfHEWm+Cpcx2F3R
         WmZaiANV70C5IX5hcuaWwr52ZfPdd8w2KvidaQPxE+J4uZAHN3xjJnE9nv1tepagzQUw
         2h1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773310283; x=1773915083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQVN37mj5BDuODYW7wNFwBAsFMC+pSE0i8au/Fh/sd4=;
        b=YpgPzQnI8D2VNQa06v5YtRpMLkyI2YvqJwbhl5i3c9seg9t/3nwOs5MlIKn35yaLra
         MI4VGAkDJRWyQjYAQpL/DaGJPuONt8Rq9awhzd7QT8h3dv3gFcxB4ClAtUCfmZEAZHLv
         wV2isFX6jsA0ZFtrJUHKhm1EDHpn3WyYO0RSkav1JkECZ7oKIR+UPpKtPfZE5xtFM5Gj
         15ikctXCUvQfERp5YGOgLk8O5igU1kgFoMYYuryo/tgCEUnzzS8DgB+igYigWDE7tf9m
         /mruSf2T6NVNN5WjxS1hr4BtAb7GZWK9+GV5nDy2QNKvW2pKj8dam1u+Szw4gE6ES0Bl
         3K4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773310283; x=1773915083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fQVN37mj5BDuODYW7wNFwBAsFMC+pSE0i8au/Fh/sd4=;
        b=XuJ9oWtsR7XE/GjprQm+V+y+setDFWflOraM7b6tNldi5vOFR1MbUhm9qJga0EAuR8
         RIa3HuxgcKeOjXLg2Q8Fmufn14B4jkVt49b6s8DEibeglY40icqZfngemA42eigiS/CK
         GMbn2gIeecCPdMt1R1sbNafiYr4z+3uEEdMPC4CtREIwmNxPwdNHstOPyDRF2XMixITh
         OCQhfLWlqDPM+CqxeObAjXjgsKyuEDX2jmJkpGG6328OV70hRAIoqXcpVi2cB+aWKq2I
         IvrGmL88bl6EYA59d7EEROhNPpw159nkefoirnDL37IbN1EqAFxJQuKZxS4jP8wr9pn0
         J+dg==
X-Forwarded-Encrypted: i=1; AJvYcCUjgLFY1uGxy1ta950SKC8rCSMoaarw9oV29AQrYy4teN6SIa/8v+9KMbht+dBk9qUgpM12aIKBu5Znd5f7ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPZXFn/0zIEXkmzvLsgg6gUI5fP2DoxLxHqbd+XDEpZFbIWl++
	NTANEGEMP8KFwq85nzAPzqmcjm5y6kSVvLJ1BpPf4Emxdpu9BU71fLaA8iuQ+hBr9ZGy/BNT9vF
	nTUgRpIPIIr7+Nsh/xC8qpNCV/3w8Pac=
X-Gm-Gg: ATEYQzwTOesNVii753X90tKABgDpRn/sDukk+qG2KWACcYpuniud6edlmljFKIEItSa
	Mg/d62FGiEwmsFuBHcBkJ9lG3wjyQfXjprIBaMwUc9TiKguMxfkGwDhPsXZSPTrqVIZ2scF1Ar0
	KB9/EotGtaUKzyolPFb0Qx6mMwH9TDFkeSOt36E1Y8V4aliiTQI0gkJP5K/3ZZ/YyKfLZ+r0mpQ
	QvvKnBkf+evIVtC1gDUzwwp9t4mIcQD6vJONKTaKboioq09Y/nKmBuTX4GpAPFkNCz303vyKzMP
	rzvGOXeEsG/ypnzYiF/rdKXHulXsPLXKy/7D/LswnzYY7CDP2FioVsfgE1COL9fieeSCTXFhNcb
	VCKOAG2rpj1B6hoRNXgwNEBY=
X-Received: by 2002:a05:7301:2b06:b0:2be:2b8a:9523 with SMTP id
 5a478bee46e88-2be997c4881mr356282eec.0.1773310282920; Thu, 12 Mar 2026
 03:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312041934.362840-1-jhubbard@nvidia.com>
In-Reply-To: <20260312041934.362840-1-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 11:11:09 +0100
X-Gm-Features: AaiRm530Drykix5udnlN6hnmVUBGcezKgBW7N-48lvn2C3EA_qpUUiT7jnnQ-nQ
Message-ID: <CANiq72nasPmPS0y7qzHUUM3MoCHAZc5+ybU=VtsKW+0sNsJdmA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] rust: cpufreq: suppress clippy::double_parens in
 Policy doctest
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 5:19=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> The kernel fmt! proc macro wraps each format argument as &(arg).
> Passing a tuple like (a, b) produces &((a, b)) after expansion,
> which Clippy flags as double_parens. This is a false positive,
> fixed in Clippy 1.92 (rust-lang/rust-clippy#15939), but the
> minimum toolchain (1.78) still triggers it.
>
> Add a local #[allow] with a reason attribute on the affected
> doctest function so it can be removed once the minimum toolchain
> moves past 1.92.

Applied to `rust-fixes` -- thanks everyone!

    [ We may end up deciding to support per-version Clippy lints, in which
      case we will need [3].

      In the future, if [4] gets fixed, we may be able to use
      `Delimiter::None` as Gary suggested in [5].

      Link: https://lore.kernel.org/rust-for-linux/20260307170929.153892-1-=
ojeda@kernel.org/
[3]
      Link: https://github.com/rust-lang/rust/issues/67062 [4]
      Link: https://lore.kernel.org/rust-for-linux/DGUA5GY2DGYN.3PG0FKLG7GF=
N1@garyguo.net/
[5]

        - Miguel ]

    [ Reworded to replace GitHub-like short link with full URLs in Link tag=
s.
      Reworded reason string to match the style of a couple others we have
      elsewhere. - Miguel ]

The lint doesn't trigger in stable from what I can see -- it seems to
appear with the merge of our tag that contained the `syn` rewrite
merged in 7.0, so I didn't add:

  Cc: stable@vger.kernel.org # Needed in 6.18.y and later

but we could if needed (e.g. if we happen to backport the `syn` rewrite).

Cheers,
Miguel
