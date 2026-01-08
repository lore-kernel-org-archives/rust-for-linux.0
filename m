Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5A23033D5
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767869213; cv=none; b=RU3YgGP7HRm9zzZ/Lw4Xg8STyWIZnSvq04o7paiEgDLwM9Xid3Wr/z6FvcXYYilGQN740mbxKZs5Ajjco9yOknpp0dX7sxaIzqLasmzOEoL7m/WVrMxlbEwdfPQqd0Xlgn3RkK6ptjIxO+rndhoAbRdsBvNM253P4C11UlsycGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767869213; c=relaxed/simple;
	bh=dgAz1yMTDN95yz+ldxIe8dB14WROdbNf/tvb16eqrm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KdbSsdCPN3Fzla4Y0gbnOdQipOK0gphGdpM2o9l77NospdohXUYXszc6/E75z9ZlrYZw54xCSLZeez7TLpfQNrk+PXb2+PkV69G9UKL6v8IgF/Us6aBIAJcD+XqNJsfRQbiSNYWJKfEN02r/GJe6dmAjpu0njXmGAJ13R3KO+Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSQNmmrw; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSQNmmrw"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-121a15dacd1so226610c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 02:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869203; x=1768474003; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4t5lY7Wkb25mNCuaK8XeIOenDCs6DYnTYWByLpMYyc=;
        b=gSQNmmrwRmgC0C5Xj04O7MdJfMVtt5u29+tgWAoY/3mPdu+3cO1zGhw+1H4EgGXHIz
         Zs68nP3Xzfb9KvS5t8x2LQ5erhOYYbZVFtvinV3P6ivHT7tkQ7fTBWGT4El346JNYZWG
         kaDaGv06VvK9RoGopNan8r2hOmV5ep8CWAp1+XhFNFMtINM9bs1QJGs1n5gjRlVyFvYh
         at8sgv6/w/69o2ZMROdCOloSOEMsKol330SKx9+L3zl07YtrDZTAZ9p9tEKLTRGflprT
         RruEb1963/r8CEXt8r8zUJd9daAwMJ47Su+JH1pwre53gQGMgbRkOI51DqH5uZfMuHL4
         zCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869203; x=1768474003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v4t5lY7Wkb25mNCuaK8XeIOenDCs6DYnTYWByLpMYyc=;
        b=NWcSVyFfyGptuKUxf0GeNt51vh99ZI6boEIQNLibixsOxZ2V5pRStXJkr6w3p324UT
         fRxcdS3dRjjUe1HKa3Svco+DghHTtP9QxICMAKpyXDC2Ex+Q3HLkuQ+YubZ/YmXWJiYw
         Z+RjM35vfgL7cXHl04qUOVl9vWpKF4xyrpsvneqxOhIvq5XmVdOIaWyGAQ2gS9psxs4v
         T9YkDJDcAmXpmUxacfH5DeaXGbXZf1oG+P+M5uK5I4l10Cw97crIA/C+2YsD+1UIn8SK
         Bjiz+IMxL96YQ+qcekQO0366L3WLAqlHJia7FKGl5O0rC8l2byUV81CXqK4198K4S6RO
         GnAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6b4lzMJ6r6g87hUNAWGqUEInHA9k9gv4qlrteM1wDn4M+Xuwq3Xkd2RKEWwxpLXGOTjU1ASDPLM1BXzTMEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy32ZWeIY2vYAo8V552OFNH4cVHIGeKGiAt49yV5FBzjIsUfI4B
	jv/dM4eJ/XknW8WlPaJ0JnFZ3g4VR5kzzrVD4pFsK/fVvPZRjFhmQXykXsb63YnrYCRsqcyM8zJ
	9/3yU1dmjCcP2EG4tWjeZYECYMbqA/3I=
X-Gm-Gg: AY/fxX6FqpImz/3VOdgkMCM2dax0rFYxaX0VIGeqeE2A0xFSJq/8aI6uVoicoH/x5IX
	CuJMyZI7DyFx64VI9DBLJCJ2+SVKsD0eVTsaOw8swT/HS6WAMZoo77+b+VaYF/NbKc0xtxK4Bno
	jvRqbIFFLJYIfYPLZrgfFJG2+TW/BK8dAKFNwnQoV8opzw1rh1Tp1FIPqVGschetE1LuZJ9E+Gg
	cJANVJBPLqIp1CQ2qceJCopvpmKcQc0Tysp2r+m1rJb7mTzy80kqdfdza4p8jp7V/inS4r/49VZ
	0LwQVok9H850RLcv+ep6+7TXhk1RhSH3nnCr1xdg9DF33AZ7504GfPZRHotpnJTZHC/cAZV5Fdr
	QOvmj9kSk6sCA
X-Google-Smtp-Source: AGHT+IGBr9KFneQKidtrS9x+p4Qt6guEXY3K44IOqImgh/mTBdzZhcGn/m3PGw0F0n3qjVnMGehtyuK0GINv3nehWEg=
X-Received: by 2002:a05:7301:2990:b0:2ae:5abf:ecff with SMTP id
 5a478bee46e88-2b17d31bf67mr1821529eec.7.1767869203252; Thu, 08 Jan 2026
 02:46:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108085545.333676-1-pengfuyuan@kylinos.cn>
In-Reply-To: <20260108085545.333676-1-pengfuyuan@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jan 2026 11:46:30 +0100
X-Gm-Features: AQt7F2q40dtkLUZ0-ZB9bAJbZthwGJp3W9HxwPszUiAZQaREKiQ8fep8STvs26k
Message-ID: <CANiq72=Vd=Rwi6Mr2vgEZHz+iZ=-cYHxEXvsgJnpA2uqd2tUtg@mail.gmail.com>
Subject: Re: [PATCH] rust: device: add platdata accessors
To: pengfuyuan <pengfuyuan@kylinos.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 9:56=E2=80=AFAM pengfuyuan <pengfuyuan@kylinos.cn> w=
rote:
>
> +    /// # Type Safety
> +    ///
> +    /// This function does not perform runtime type checking. The caller=
 must ensure that the
> +    /// platform data structure actually matches the type `T` for the sp=
ecific platform device.
> +    /// Incorrect type usage will result in undefined behavior.

I didn't check the code, but I noticed this header -- why "Type Safety"?

The standard header we use for this is "Safety", i.e. we don't specify
"kinds of safety" (as soon as you break one "kind" you could in
principle break everything, so it is either unsafe or not).

Also, we generally try to be concise in these, e.g. the
precondition/paragraph could perhaps be reworded like:

    /// The type `T` must match the type of ...

It is always the case that there is UB if the preconditions of a
"Safety" section are not upheld, so there is no need to remark that
either.

> +        // - The caller must ensure that the platform data structure mat=
ches type `T`.

I would expect this wording in a "Safety" section, not in a `//
SAFETY:` comment.

i.e. the safety precondition is there, but in this comment you need to
justify why the caller has ensured it, not that they "must" do it.
Does that make sense?

Instead, you can say e.g. "The caller ensures" or similar (we use
several ways of saying it, which eventually we could normalize). You
may even see sometimes an explicit "// SAFETY: By the safety
precondition, ...", but for this kind "The caller promises" or similar
is already understood like that.

Thanks!

Cheers,
Miguel
