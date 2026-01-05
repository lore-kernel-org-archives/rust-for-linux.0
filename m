Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02654255F3F
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622006; cv=pass; b=sn0XGPFglXLMWTPzgK7yt2Pj2Pua/kzEvRMk5qh67PfRDQH8F9GxSCObiQbJlSCRpofWHCDhLouhn6Wgo+ZQN7uQEYchUPxhcIIKjeApnEwY/1/IC85CFNEI9YmTMWzyOFT2di6y3AJdSdBLqd7Q78WCahWhQEVtUATWStEA2Gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622006; c=relaxed/simple;
	bh=7KaBkRbB+9Ob+8DKRNc4bQSuNYF0+4FWmdqwAS2TKCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/b74jAbPdCwcJp0GjiGqX2+b24F83VwW8ogBkMP72rLstYGNp9O4FPNy2Z1OJG/pzS139KjGt7TMHwYG/JEEaV5GgLMvAOmf1y45gURxQIahFkpc/kWT3kTz063D2oqveZPgz8GPE159KKKneyaF58Byofv6yBFAEizFsq9P5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHfOSbkK; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHfOSbkK"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c2a00109fd8so337628a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 06:06:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767622004; cv=none;
        d=google.com; s=arc-20240605;
        b=alwCPDCx2+s1cXmwIqUUuvC74pI4qyGgUCQHwxD3pozuh6gIMYPLJGeuPG41keSUS6
         o1cG4yTRyG/U5Dwyo/YqgySmBGOZyAZ2KCejYre6ecJkSzDem9J5u9zzzu2gln/pHHJQ
         JBLb7OGwTOnnVhLZ+GBbnQ6jB0jcIK1+j3ofxddYckLC4eyUoRtAnrGZex3+ltzW65vK
         9CD2H+gVT4t2d6Q0jplEv6AgZIviD+HqyJ6ps7X3j36OVeXSGNo76wQXA08Rf+TZsAm5
         4dpKRNhqztezYUdRZnPcUbagrdXJvw5Pd8ajpK893mvmifIsbnhrXZV3JkT+JKpDKiPo
         w7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7KaBkRbB+9Ob+8DKRNc4bQSuNYF0+4FWmdqwAS2TKCI=;
        fh=8mE4xOs57n59oOVE4aAJ74g6CdFa2BJsNqTczGIt6m8=;
        b=WI+ctS+bdwClgBQZckgTUUvSCDY7zQ4xwni4jOiHQZLvYuYUyPJLE5cuGVQDQjYZ1M
         ewYHZ/XECVZRSoZ1Wfm91b21P09beWHDQq+NbPlgSlTqEFHfQHbLWY63LF4Y1jynAE8Q
         kLIZ9k9pRmKHGzW269qyO1TY7XGLNT8ixtBb29uA/ytc1tCMQn4DXFjZjJDX7XDVxKtR
         pRBl79gpdk1FxYpBO3WhlWGaL8WYizVoBJROgKCBcv6z70v8KioKT7O8TGc8tDlzn9V4
         Wz2GWfA1y3ZodZCmcPX7MbZmyUu5ZTTyh6XbnhATRZPvHY850T8eeDbmK6leVzNIa95E
         X5Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767622004; x=1768226804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KaBkRbB+9Ob+8DKRNc4bQSuNYF0+4FWmdqwAS2TKCI=;
        b=DHfOSbkKsYPZCroGHevivfAHMXVdPthUeEoIzWuFihNR2Jb1WwEsmmJ50JdZ5l5qbJ
         Skz9o8VOkWaJnJZwJis1PhL8az5MD8lsTqbkjWvzsaiPuVQPZGJjnyec4vFzFYXrf+MR
         MGMX6/1Y1B7qknPf4HGWkOdJbMzCnEHyL2pSElhC7+VY2cq1we0V7ucKifU9zM+sXEuo
         T2BhRraErgCt6VlORi0XA179Ua5ln3IrLw5SoM6c7loD5hH2ptz6Aj8NrnKvzHYmX/Bp
         lBCSblZt0z9jyMAxIQn8U+TtSXtQCeiLZ0yGDdYdnhNb8xm/pyNNmrRlwDr6P2PQC371
         d4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767622004; x=1768226804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7KaBkRbB+9Ob+8DKRNc4bQSuNYF0+4FWmdqwAS2TKCI=;
        b=ZT+BedQwTpLmjA5gwkfx5wOdde9dhIe+FA8KGC10pQQ9lT1EdSqB/Ow8dgDsqHhnuc
         9cNSOPIpGFwzUFFY8Vp9ryZr+OIkKwR/Ad5VtIm+GWVVAL5NjVzJY4mm//E8GESpEDpJ
         cTA8Igoq6G820nLQuKqjEkrrARL6XNPvESxMsRyF1KPRrYVL08XDZZH63OeqiX9Av6Th
         Usq92GNAMTu3rS3JNkE7+TVrKWFWF/zoR789gv+B3YSUb7nSvYi5/3mvdgLZyMf5isps
         1UrTxF3pEA5lGkxa2LzuIovZerk2K2u1etqTOSvBRKiZ7hFlUVMi9ID00NaS79xhRXDA
         Wfyg==
X-Forwarded-Encrypted: i=1; AJvYcCVNYY3ypBaZQ87mTjJjzZKiroqvlbA1WKawkKb2YFoGma+STbNklqbsZ0fkZSYKoAy/J8+XQOQOHnmNXxXdvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtfnI2tiEFDf4vN9r+8D8Pq88iXZhrO6k5suFl/hMz5g+eSXp3
	LiOypUTw5r9SE8ipTbtW6Pp0RhbwQcuZGSj+89s9IQd7weurZyRqrIhdTdSpUxJy5V9KZvMDACZ
	UR/GAtQhFH+PZfM3PJn3WwjD3qpg6/+w=
X-Gm-Gg: AY/fxX6ks7yHQbBQ2IXAp6XOKLsggoZzumJagtaoZFOwcYNrzZiLVn4CV5YHCENSSn6
	enJECcMxd5YhecDkTbH6BKlDQfyxmdJUNhW9PTgGHZHf7rKiQWiCOHR/OtO634DCD5Q1H0vruLo
	LYdRpAXXUwJ+ewIEEfzrzKm0Xd334pOTM28FEMr/CKrRdWWoF+ayEyowLaivkOlLwxrN9dZtkFo
	Hv1ea+HkpLCQulZYvk8hW6bV5h4hl3eSvu4hD5FW/Iv/r8QJ1EJyF7sALfjYUth93TKd63LmWzf
	ZcDRUAJ29PFhyJRK0Ow+/p+o30cxKmb5NifBfW8IcwIvXLvb/Dxyoos7sOU8P+MpqstK9miRPXp
	L5tyjgMDq6fYGavk4gf2R/WM=
X-Google-Smtp-Source: AGHT+IFUvrJoDi16ui851FAilZ5wsmt42GSfxjuEWZTdQ+GPhzoFTwPmlj2uWiVjP/wapfnK7F2VKzf1l51cZmWXaIE=
X-Received: by 2002:a05:7300:881a:b0:2a4:3593:5fc6 with SMTP id
 5a478bee46e88-2b05ea06747mr23491238eec.0.1767622004028; Mon, 05 Jan 2026
 06:06:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
 <cef76fc1105481d219953c8552eb5eb07dac707a.1764062688.git.y.j3ms.n@gmail.com>
 <CAJ-ks9nWbu53Fhmz0Wcb4jHxwr3D-sc=BqW=gHLjw34dAxRKYQ@mail.gmail.com> <CA+tqQ4L1j=oy87e0DC-m9YA9wJ6fR+PKtVBcnWH9iitNsVqG0A@mail.gmail.com>
In-Reply-To: <CA+tqQ4L1j=oy87e0DC-m9YA9wJ6fR+PKtVBcnWH9iitNsVqG0A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 5 Jan 2026 15:06:31 +0100
X-Gm-Features: AQt7F2qZn_UcRGyW2g6jnaDAAvaYDNCPl7ROZheUlDa3aG055E6QByc98LAVHgY
Message-ID: <CANiq72kezzBVKUyqGwSuJ5ct86a1ZoGJdh7xt3=3TG4+B+Vq4Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: quote: make rust-analyzer treat `core` and
 `std` as dependencies
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 1:12=E2=80=AFPM Jesung Yang <y.j3ms.n@gmail.com> wro=
te:
>
> IIUC, to remove `std`, we need to patch our vendored `syn` as well to
> not depend on `std`, right? I think it is indeed a desired change.
>
> If you don't mind, I'm happy to patch the vendored `syn` along with
> this series if the team agrees. Alternatively, if you'd prefer to send
> the patch yourself, please let me know.

What are the advantages/disadvantages of doing so? Performance in rust-anal=
yzer?

In general, I would prefer to avoid patching vendored dependencies,
but if there is an advantage, then I think it is fine to have small
changes as long as upstream has merged their PR (i.e. so that we at
least know there is a good chance we will eventually get the same
change when we upgrade the dependency).

Thanks!

Cheers,
Miguel
