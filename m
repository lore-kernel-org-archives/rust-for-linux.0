Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F18346E6A
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 16:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761065276; cv=none; b=RcIcOts4vVZ2bnOspuEx/hSuBtB4RTLlOtLWXYThAxiAddaHAQoERytlCztETC1xryZa5XY81+crS14PGU/4CcbEJ+wWWUb0Mdrc+g1kturj0aFs/rrcGP5WRj4S6L0k4aerp3Tu5UA6BsDuLDkrEQJptIUruxc6ytTj1NxcySc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761065276; c=relaxed/simple;
	bh=28qNQ7rQ0dZK2hZ0bRbYpkKxEWOFNpR8yAeDonqWFt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XhMXTjCmHE8TLMMpl5YMBL1zjzePEFia+ZPNrk+fMxI74XG7CY9rSBMBSAk7LgNJpuOxqpfTUjGduxqtU1PisMVpWv4xIiA8IlyMdxN3x2ZZ5F8m9T2a7eqpQsN406JgKrpjhVK9ICgGHX3+8ZyRs+4dN9ZFEqrFPA8o8kMyC50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3RF94Vp; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3RF94Vp"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2699ef1b4e3so9947935ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761065275; x=1761670075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1ntUXOmnFmu9OCpv+5ZoMXNluJmcwruKsf9+rVDB5c=;
        b=l3RF94VprvV6KITv6p+3Js5R4E5hsBVCrEeIEIq9uezdVSa5MnPxbfjYZovA5M7+St
         WZrlfzcLfakojt0grFSLMDUdPWLrwW1cpE/GBOwx3eEmtwmUFU9IViyB8Out+3TFVbj7
         1IyXXNgva09CT+3SNL+cxPvL3fV2dZsMfvcIkMHMVHX90hJVRAPk61i4Q5mpNkxVQwwT
         NgVRCt8SSgUNmRSDqyCrXS/5yylyA+hmHO8yrMNryvTxGuDYCfAKhbknrZSc7IohgP1Z
         KbVsdcPXiCOASCZBdXHjAMZuOag583xtsGjU6HoLJzT0WQs1/BOatJW4UmpOmv/rfwCV
         SO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761065275; x=1761670075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1ntUXOmnFmu9OCpv+5ZoMXNluJmcwruKsf9+rVDB5c=;
        b=louudhLgYI7q4TtjQNUiK7izR9wgXkqOz1Y/4pidsJtomnHf1pCd0ChCBq7KlP3ltV
         3hu78WE6uWTTRF/JG75TLv1MYnm+C9D+QsRhZbVs5L4x+wzHbTa7V0L9orrpS+4Pt49l
         yut5N7u2FcMBEYU+U8IHKq1zkhWRengh6jCKhr9qCCtVpentK8pLbb2HDADvejaAYNDU
         O3+S0isKBjag96OpYULCAUZ+G2azwDirK04VDCCyGy1Du9S7ZhSiXElbhZ/xazMzoBCw
         A8CFyb0gAuAtcnf3Na0ttE+PiKx+jeHhzew6xzbab4xphdEJk0MMl5/475X/pSTAow5/
         ZNVA==
X-Forwarded-Encrypted: i=1; AJvYcCVNj0lMI5U0zQUnqWe+/PPArfPOTzOsmKHZYeLGjfHdCyybsxk3r8MjgjKUpQ8SYnoBs5YiFnX1VhhPDbSmIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+x173kvX17WDGub4wgJjZmg8hdPeXQfNYoGihHUzUWx/IyqkZ
	MBqZ6Hxf8Px5weDRvng4yUqydnYzeuniwHRpASxzMV64yAQkHuQ03+HPy6fH1iM/L3wP+9OH0/o
	Pg13bHeFVuzlAC7pQmnlilpS6mnsmkOs=
X-Gm-Gg: ASbGnctks0fHAQVVXrEqh1wVfxo5rYL5ewt0sj2XIQ0OO4vslCIApb7XippsknaMvVv
	7s5fwpSUscJwJlfGoo3kBldddNlu5/bs3BSLlsYGPE1ZvaKmW+h28NPU6kEY9lEox10d61yGWTd
	A9LOqWSSKGzDgKXj+ij1ZVJHph7OgXIovPiNKvkzphMEp8/70zmNJ2e3d5Gg9vniW2mbY+nfm0O
	QqtCAdUDdctNZYrKmU6lgAMwHLfJXXfldL8tT2ZU/xPlNlR6XmjNVmQHW6Kp0gW3zAr/SGDinYC
	QSs0uVcyj4jE5UQe8GQANjxkYbVMoAbIuZsgOoRdfXhSe4aHu4Zn6ENo0nZmA9sNulQfO7zo9MI
	MLpLVFLCI74Q98w==
X-Google-Smtp-Source: AGHT+IE6+zr2kq6R0XUbG0FThRLhPuL0rneOx9WE7IygbOP6VOZmHKd2PRk5rs9w/gQWQpmwElugiOYl8XVdOqXeB9E=
X-Received: by 2002:a17:903:19e6:b0:27a:186f:53ec with SMTP id
 d9443c01a7336-290cc2023d8mr130241865ad.9.1761065274551; Tue, 21 Oct 2025
 09:47:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020222722.240473-1-dakr@kernel.org> <20251020222722.240473-2-dakr@kernel.org>
 <CANiq72m_LSbyTOg2b0mvDz4+uN+77gpL8T_yiOqi1vKm+G4FzA@mail.gmail.com>
 <DDO3T1NMVRJR.3OPF5GW5UQAGH@kernel.org> <CANiq72k-_=nhJAfzSV3rX7Tgz5KcmTdqwU9+j4M9V3rPYRmg+A@mail.gmail.com>
 <DDO521751WXE.11AAYWCL2CMP0@kernel.org>
In-Reply-To: <DDO521751WXE.11AAYWCL2CMP0@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Oct 2025 18:47:41 +0200
X-Gm-Features: AS18NWD6A3w6PR4fvS3IEgI9kkvx3dHP14ZgUtZuoQwDL0enZmy2MlsAuUPXLUw
Message-ID: <CANiq72=N+--1bhg+nSTDhvx3mFDcvppXo9Jxa__OPQRiSgEo2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] rust: fs: add file::Offset type alias
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, mmaurer@google.com, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 6:25=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> We need arithmetic operations (e.g. checked_add()) and type conversions (=
e.g.
> from/into usize). That'd be quite some code to write that just forwards t=
o the
> inner primitive.

If it is just e.g. add/sub and a few from/into, then it sounds ideal
(i.e. I am worried if it wants to be used as essentially a primitive,
in which case I agree it would need to be automated to some degree).

> So, I think as by now a new type makes sense if there is some reasonable
> additional semantics to capture.

To me, part of that is restricting what can be done with the type to
prevent mistakes.

i.e. a type alias is essentially the wild west, and this kind of
type/concept is common enough that it sounds a good idea to pay the
price to provide a proper type for it.

> Maybe the action to take from this is to add this to the list of (good fi=
rst)
> issues (not sure this is actually a _good first_ issue though :).

So I don't want to delay real work, and as long as we do it early
enough that we don't have many users, that sounds like a good idea to
me -- done:

    https://github.com/Rust-for-Linux/linux/issues/1198

Also took the chance to ask for a couple examples/tests.

I hope that helps.

Cheers,
Miguel
