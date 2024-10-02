Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442531CFEB7
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Oct 2024 12:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727872691; cv=none; b=Z43WnTgDsW0Ga/Nt4R5NWoxRMqoz/KoIwxamBGCyIRoSR6Lio9msbh4NzeEmBtViXXk7JbA6xB6cLqGeW/H9/S5mB1kTHQlAk9uLST0qjvVZdWxAO5xcoFYPrFj5yE+/Z7JV8XXQbmeoqb++Kk/eiqa5RvqtAt1kXHRr6WCjPdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727872691; c=relaxed/simple;
	bh=Pn3CYClBVb6o/pVhWHd25JnL1eOmV1/V8byX2TfEZhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFir1rpzxK2WcFOMUOcztib2BQ94Tm483xGaBfG/BuIv+kmOS77h67ExkBKvqUDZa0M+JGXQS3iSwaD2JJXBsXr0lsaDLuSfyy9zFnpmzG9F6YswV9u08XbnKo1zMg222nNVdoPwDNYm9HQl2LF16xLtO+oepooV0u4G9HSH9fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GETJ04J0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GETJ04J0"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37cd3419937so3462258f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Oct 2024 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727872688; x=1728477488; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pn3CYClBVb6o/pVhWHd25JnL1eOmV1/V8byX2TfEZhc=;
        b=GETJ04J0B8f+DFCVSsbdafzWZ4lhE4QQjauNnnr4iGkC8cTTcwr3gasz4kHR09Ep2k
         kBbDt3kBambgdyK/9h9LU20oGUPzXpRyXeGhWBWqj7gydh5vYiCUb3cZ7qERofVrjPWN
         MC5+hRSlLkeRliokjYWwyRcWEKZsR8rF7WgkWISGlAo3pQgiYB4any48npFHjB8iNIwi
         S/lhrARfXGxlBr3HitPEFJn/Yftk/UT4y5/UERAVV0a19F5+OAiU8IyK9h/jZ4R8iWQK
         22uP589icZFQrgV9cMjj17R+wEFaDSyGnzzhLrfYudL/rsvuCkt+7LprUPtH8cqmDWZo
         SU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727872688; x=1728477488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pn3CYClBVb6o/pVhWHd25JnL1eOmV1/V8byX2TfEZhc=;
        b=VYM+qnbjcdyv/bZ6x7eN8AIKBz+xQwtWEr4HI7wBbEaVC8XW9Lu7x2ryo9fHckEb2T
         ClPrQi3DogTyOpTQml67FYlRTQAKB25ENYwqVM3QClDE4e/NwhQCmoYfVr8Ns8H9DSCB
         i4y9IZeuJ2tTG9UxqNzN7q1zVH/QQGugMeAO9qDcw0H/MXofqHbi1qarNIvDejYloWaP
         ezpasguRZHr5bTUVt4qqX625k572zidIXc/fO/dZQBRqU0b7yLDQdzwSJwr8h+WuHiIi
         QYq7IWKh7flP9UFOhM0U8/5AXs9/NYEBu8LMr6GtkCovydjqklX+7s3QlYYDvyDKQx4p
         ekzg==
X-Forwarded-Encrypted: i=1; AJvYcCWkqWiZktpmy+dL2GRmuRx0ZpascB5iN+4U7ynZUkIiJuZjwMf09E6AYvzdbFueM26NLLtmVDN76M9DBNgTUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG1vb2yBbCVtUPDsgF6WmOh0BzZDs9quHarAugwkbda2aGZhZQ
	hZp/8kHgHJ+E7XWJdiBzqKw9vUCGGZGUMrRErMtjecoVj8Ng7CwPKgoUGKoSmbNDFIVe9HCz/OS
	t1Ko3xgCnNtGPokJtP6NS9mVuR2qIuyhUmxs5
X-Google-Smtp-Source: AGHT+IF+H2hRAM6EUPGr2ATFkhEUAoNpz/F+VzyQ3OYvngiPSdQ/zAPeiQgR+DhCsjBfZsD7w6WAeLJHH7yH6F057xM=
X-Received: by 2002:a05:6000:2cb:b0:374:fa0a:773c with SMTP id
 ffacd0b85a97d-37cfba0a409mr1911108f8f.47.1727872688302; Wed, 02 Oct 2024
 05:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001112512.4861-1-fujita.tomonori@gmail.com>
 <20241001112512.4861-2-fujita.tomonori@gmail.com> <b47f8509-97c6-4513-8d22-fb4e43735213@lunn.ch>
 <20241002.113401.1308475311422708175.fujita.tomonori@gmail.com> <e048a4cc-b4e9-4780-83b2-a39ede65f978@lunn.ch>
In-Reply-To: <e048a4cc-b4e9-4780-83b2-a39ede65f978@lunn.ch>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 2 Oct 2024 14:37:55 +0200
Message-ID: <CAH5fLgiB_3v6rVEWCNVVma=vPFAse-WvvCzHKrjHKTDBwjPz2Q@mail.gmail.com>
Subject: Re: [PATCH net-next v1 1/2] rust: add delay abstraction
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, hkallweit1@gmail.com, tmgross@umich.edu, 
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 2:19=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > I would also document the units for the parameter. Is it picoseconds
> > > or centuries?
> >
> > Rust's Duration is created from seconds and nanoseconds.
>
> How well know is that? And is there a rust-for-linux wide preference
> to use Duration for time? Are we going to get into a situation that
> some abstractions use Duration, others seconds, some milliseconds,
> etc, just like C code?
>
> Anyway, i would still document the parameter is a Duration, since it
> is different to how C fsleep() works.

I'm not necessarily convinced we want to use the Rust Duration type.
Similar questions came up when I added the Ktime type. The Rust
Duration type is rather large.

Alice
