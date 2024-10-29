Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C3D2010E0
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 12:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730203308; cv=none; b=N5ybr5flO+JBKeKJimOscjks7eRH7M8cLIU+ESXSQ4fNmbOtTS/GSE53u7hp3Yhb2s1rAS7ijxaILbTL+x7Fe0WUYi7ay3e/AhbfybCYeHjvVv2NoHjTeftuJFVz6exfaaREOMCWTJWQ4KkYh3CIoqIAummN69LOISdaeT0r7K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730203308; c=relaxed/simple;
	bh=pzSe23T4BFAm7RE1nttbjM7NAQQMMKin5x7Ah8ZvYzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGlniorJjRzeJa8r/NlQPG67QjpyC/xHfJwZ/zI9j+TQuSYGymT7L5cQPxkG7jRj8pPFpw/CVAHGgSH2J4s2LvEY5rKr0nTft3EvVvuG0y1fftsXQ0r+2xglxpiWiQky18JQOr2gFs74GJ9lW/6B28+l+ydoHhFXaw8qSQbM+Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hb++mE/J; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hb++mE/J"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e3c0d1ccc6so866868a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 05:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730203305; x=1730808105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dftz4E4x+xIqhluu3h3pSZjU8R63FLj5WBzslavwRWU=;
        b=Hb++mE/JD3zTmdMRT5Sp2qhUT1QbjEkZkVLNRhsRUuWa5uf/1QGREltRp5HpwOrRf9
         WYf0M/Vea+mDmV8zN5elEhfyiO2ilIP41ZyluSJQJQ/VVaPhG5s3qo3C3WGQPErLRUHG
         EMou0d/wfRSWdlCsE1k8TsJR0yZs1OhSFoAZCCm7IoMGe9+0Fj2nkrZCHcX6oNfp36Wm
         2Wr6muaAyAmh3gXr5JUEYPu8tJl8ebioEof4r8N+imnTHnkZBfY2RhpEGHaySAHHNaLu
         JnRo7qPSHR2oGm4d75pwVtdiJuQefQba5XuCAw3cfii9cz09VgzW/QLzroZKJJDBdwBu
         8gkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730203305; x=1730808105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dftz4E4x+xIqhluu3h3pSZjU8R63FLj5WBzslavwRWU=;
        b=X38WSct6WWRpbpvB5qDrRrgJMWJmxQkKQSmUQImsZ082CbwRHTT2ws90F2/3mvIMSG
         is5qstdq+iwmftaZBRClTjkwIcyTqF+fJI3e4f5WJDDxbaSITFcCHV4SME149oT7NJhj
         +zVfA7lR15QA1tIkSUR9AplJX4f/WfNHLQgUv6uQfwXzJsN1O4//sORRQinVyRrC+DYm
         maMv8x7VrhexZ5Oo4DDFEnil1LYesJe/Lu3G/+EoTjzahag5L+3BRs4jMcxYuT9ELRjP
         lGNAErAxOYO0wFjvp/CsmhUsjH8y10dBmkPhYwaHGolgEtBeXo0eHAU+65QOxkFwPpcX
         Sn0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV75IQjH4AwchF2vvditV+7RQrfQxC4IDhzdjNvj8M4ITQGpXxPbrArlI5Ldj7Aq2ZSlyqjx75fVUvQi9f8LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJXysI5ODMyfYmRP10H0W2MdC1mV1L5jTOAILRwKilF5ksA4BM
	e3ZDyzKgZsWAXPCbsFf/TuznDe8sBEXwiDe0k3Ihtj8cTWXAKVxQvq+FdMK5kkeK95WFcZ62Act
	6WR4DDXAHr/EbmAfxNDoaSbKcYtA=
X-Google-Smtp-Source: AGHT+IEGK8xlsovsUKDSb6oQFs7YJYYAs59sM3MiUv66PGiuH0Ip+Hb88yAounjJ/tzWjwCbmBxWddyeI9kbtWpu0DY=
X-Received: by 2002:a17:90b:3594:b0:2e2:9026:8bee with SMTP id
 98e67ed59e1d1-2e8f12e2bcamr5990212a91.9.1730203305457; Tue, 29 Oct 2024
 05:01:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_F71CE9D125A8C6191D8CF95B3A4F3BB2F506@qq.com>
In-Reply-To: <tencent_F71CE9D125A8C6191D8CF95B3A4F3BB2F506@qq.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Oct 2024 13:01:33 +0100
Message-ID: <CANiq72nRLTCe+Q3J-b=u0Ho950+wEqreCLomnT-AyEryBmZoig@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Implement Display for Box
To: JCKeep <2407018371@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 2:01=E2=80=AFAM JCKeep <2407018371@qq.com> wrote:
>
> Signed-off-by: Guangbo Cui <2407018371@qq.com>

Thanks for changing the SoB -- note that there is no From: tag so it
comes from the header, and that one is different, so checkpatch.pl
warns about it:

    WARNING: From:/Signed-off-by: email name mismatch: 'From: JCKeep
<2407018371@qq.com>' !=3D 'Signed-off-by: Guangbo Cui
<2407018371@qq.com>'

Did you use `git send-email` to send it?

Cheers,
Miguel
