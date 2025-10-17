Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ABD21B9F5
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 13:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706387; cv=none; b=qBeE24lc+bUWnZ0K0jlKesdR6PTQcJO6VILyhFl1dLxRPk3XUqatdaOuhhsoovllv3m6cNWKswLZdGuFgui+SY7iU9ytemtRi3ZHSeUialVjPeiE7aVOf7QlS6JJwFxztRvI0CJbPYcDXQiQPQprTulaVvzM8GQMCUCUJ8Dez38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706387; c=relaxed/simple;
	bh=mWKAIcrMZVv1wc3CtzrZKiBn8JYPxLviInXEx8ShWoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=knW/IcoGPb3+sCyaVSPy75bX4rtTVf78zUe2J0Bnr5+G2iw61NI9Dhirct984MKs1IxUTZV8OAZCNDqC3X5c57BwoGNiicdqSIItp9OQzqg2NFMFSvAAazIWNrZajQxnfN2jw4AWAYowkp1AcWwNGHxjUVXjX7aKFcQ4by415TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfC3onij; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfC3onij"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-3c9859913d0so692317fac.0
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 06:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706385; x=1761311185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GepDfW9E0nUagdgkcApQSbzos+mlrZqdCRnH825BS7s=;
        b=LfC3onijhmia9bDrgFEDUMNoUqm4GeU1x109mLJ5hDbU/vafwOGN5SGiDzYwu7LPOi
         rGDqcdTZSmjltySNDNDp8LuiVAHqwPRCQTs6TtLQRnLMVtadVj3Z+x+Gjsa2RBW2/ybN
         WZrEIlWWeV7FqD3J1zi+8ztDJVUfyiUcwpG2ETiPMjeonLo11hL3+5ZhRmaU/LnbAKci
         U+ue2+LUMqsRydYpCMxGnZWa9dg+y6dCFnTHOF9HNWMqcnWmdXbhNDYLRHItrjNRm7dZ
         PztLgRbGZPgHcwZparRgc4qAlehCIZvuZWgSGq0mwdx4j/SUxtwICV5Oxi84H3l0C2gI
         +WxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706385; x=1761311185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GepDfW9E0nUagdgkcApQSbzos+mlrZqdCRnH825BS7s=;
        b=pklEPxqoQtHpeGT8MCBCf4acmGCDnYH8SDQI7hI7pFwslemrRPaSNrrDneZIPrF8F+
         SMax3iJwsWFdw1qaWc9/pUCXXSv2/KvMqIlcxjv7VbGjAYT3Dry8muCQQ7rdKIX3ygst
         Ka5VwGWsisll52VXAoDd3tCQ3/yjjpxezwCvRSgAcKW04XgU4cKdR3byzxS2qOeRlJHq
         U9x9cp83M+ZHFD5mhrzubvC1GrIGlIxxw/3D4j/grROIGd/nIkcsezJpm0RwbWnYVsZf
         vqh+NzFxHA2OF5Bup+bwdhMogy0MuDaQp9FEp/O9Peh4gXbGeQNCAp7Mj4gvhXaJe6fR
         1ywA==
X-Forwarded-Encrypted: i=1; AJvYcCUzzDEd/pdnrhohIReP+BpRw5CiOpYpumnWPhHhtyL5MWjPlOFJV5I/S4suJFfD4SErIpTfnaMAgmNdy7rZXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHSprVBO6p4QwbhBgaDRT9bd6PwigvOMnTqso2UO+GYXMazOX
	VZyzB0OBn1lRqbIbibCkXS8aENzhTUE+rSday9KudezCQIwAu94hO2fE2UAwuvXadBXvKAfzwpR
	0/6N2Ow9ER+ZbZNMENudMtS5W5GlkMUo=
X-Gm-Gg: ASbGncsqM5f3Lcp020kQTHXXZEVGKCw7VoMB4o26g10EV3W8MPDNkj466QIPkRxxFpb
	uEUkx3cD2H0RiDRHeu2MvFIb4o9VO1Q8xmO2g72mJzaE1LJY1Kde8uXuONqWqUIfoBjtrsdTN4r
	P2aO58F7FRS75vJEa1yizOdfpDFSjmsB6rUoOcduO+z3jGmymbLmlw+33n8HeWznFqqc7HBscba
	gArOlBVCBfA8ytbhY8zvKF283u6lzso3s09apEZe+ZDoPqvSJvgZwejE496dQByMm/mLGA=
X-Google-Smtp-Source: AGHT+IG+lXlLFDl3T0YzSok7m2AbHR6xmpCoLDHgVg8GL/Fi0AuigLh2vODu4DJgLx6XCplrx613O2JGiUegL6nmmjc=
X-Received: by 2002:a05:6871:80e:b0:344:34e3:5140 with SMTP id
 586e51a60fabf-3c98d179d64mr1418450fac.45.1760706385045; Fri, 17 Oct 2025
 06:06:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016211740.653599-1-lossin@kernel.org> <CANiq72k8KmpFyKAFZ293GDUWx5=HJtksR02hTU8-H9PX7xsT+g@mail.gmail.com>
 <DDK2SA1D77HM.38KOTOTF8FJXI@kernel.org> <CANiq72=Qh9sJLKwACr_McnbGdu8JfzqDuv1AgCjSdwKtt-9Gdw@mail.gmail.com>
In-Reply-To: <CANiq72=Qh9sJLKwACr_McnbGdu8JfzqDuv1AgCjSdwKtt-9Gdw@mail.gmail.com>
From: Guillaume Gomez <guillaume1.gomez@gmail.com>
Date: Fri, 17 Oct 2025 15:06:13 +0200
X-Gm-Features: AS18NWCeDsB-JZadx55OaJQ8kOop29eKTZv6rb0-8XIQRp_yPbVPdOnyL_WRHqk
Message-ID: <CAAOQCfQzhxDzaJOb3GyVPgcVD0npso4bJ8zuy_63ZSr-rnQ0nA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: pin-init: fix broken rust doc link
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Alban Kurti <kurti@invicto.ai>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Indeed, although, please open an issue on rust repository so the team
can discuss how this feature would look like.

Le ven. 17 oct. 2025 =C3=A0 14:59, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> a =C3=A9crit :
>
> On Thu, Oct 16, 2025 at 11:47=E2=80=AFPM Benno Lossin <lossin@kernel.org>=
 wrote:
> >
> > Thanks a lot for the added context! I will add it when applying. The
> > `__pinned_drop!` macro will be gone with the syn patches this cycle, so
> > in this case, we don't care what the resolution will be.
>
> In the end, it wasn't intentional, so Guillaume created this PR:
>
>     https://github.com/rust-lang/rust/pull/147809
>
> Thus 1.92 may end up without this change in behavior.
>
> Guillaume and I also discussed the possibility of checking these
> things nevertheless (i.e. without needing a second pass) as well as
> the related topic of having a runtime solution for toggling
> private/hidden items (and thus getting them checked too). We could
> perhaps try a custom thing in rust.docs.kernel.org to see how it looks
> and if people like it.
>
> Cheers,
> Miguel
