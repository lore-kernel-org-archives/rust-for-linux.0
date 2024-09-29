Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCFE1DDD1
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 04:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727584645; cv=none; b=BM6ZdMktYcqTBYprTLYvpEPdpNdu16y/++3Kebh/3gJ1zTyh5Eb7XgSI/GNMdQujfmfXyUFtlq6uUOkU09aXzYMxGwBGAOb3CfW0whXJztjxN1i5jkLLiYDwI7mWL8ZA8aQWhFcdNSzD0gBQy7GkZSfF2x86mBdT/iM4oflJ3WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727584645; c=relaxed/simple;
	bh=YFwu01Y7TeiQz29fQ6MSlA65RT/0TJfLp1urzhN2k0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gaKy57BWkXQ7uqRB6ZzV0FXyxPsn2bgo3IxjKljQ1qqe0hCsGYSNoqHeTVO851QQTU8C2KNWjzyUoVnfk5yoJopVT7U5RV796k/gtpymrJbF3cq6D+G9vKTPmg0oUvcN+7fBMk4ISx1eUqhD1+wJ5SaQA02Uui0q2kYJ3zz4p2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=IoajdJvE; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="IoajdJvE"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e22cb0b19aso28623287b3.1
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Sep 2024 21:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727584641; x=1728189441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V42qN1WQV/laReG496kmeSiiLIY8lCzO5J1gHdR31kI=;
        b=IoajdJvEQs5McfOkgvW7gs4u6sjwguiotNo652PJs5C339Yqb3sSW3iv1RgWk+IDAi
         aHyiswKt3uqf9uiZOrP+6MxG/pkJhZ5SM4DyC0CWUfanZBOl7kyFg4+bTXBTCpn2iGJc
         /OcR1BkvHVBHjAD3g8VICuwvC1rRWqulbgm3H0ihCa4QUwDQNvSKPp8u93jckhQLes3N
         0zQH6kVZq3ynrAZijenbtLvkyslYeoJ119n2cOkRGolnaEQSHYQG9GWjle0fIH6DFnhZ
         zZTXXz0M3afQv1r7Jp8iR8y1F7aBg5XTzExGArEkPuLCR2s/5CYCNQ4zJNlGf5aeOgUP
         OdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727584641; x=1728189441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V42qN1WQV/laReG496kmeSiiLIY8lCzO5J1gHdR31kI=;
        b=Lv+b5CJU8bS/WJy1SG4IzK39V1sB6ZS58+4V+f+hF0K9XhzLYRS7GO4a9glMyRcv1t
         UUxZuRvXipm0waBTkf9U2473w6VxDDLz9qG1G8DziIWTYgq/l9uMihBetgSSsoBgODh+
         OPs1DSsBjbzylvLFEgnNfx2EJlIATGkaidBEiYdEctGQGk8T7OUTUK8AD/Trb1m8zsOu
         tZEeSTmK4iSQR1GLMXPqTUINRcZ5pm2Hc51nInT7tW/R9ArpOYvXKrKo9WN9s20TUUxG
         YiNdqjHyP6uCEQO29DTujduwq5RKeR2Xezw3SZP0BCVBHluyLy7HB6/AffzlFduFTxC7
         SOXA==
X-Forwarded-Encrypted: i=1; AJvYcCXB7sZVOu1pj+pF+kOgh0KrvcD/GiJXX7WI58ff5/16PRHJeXN2fkh0NmgKoYEeeNQ2GwkfR0pJrPjYnqZa8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZPCIw3UfD18dY+72nFmFVqYRAGRmIkqQB009EqcpXIM6jrLF3
	YupPEfG+BP1pnNiL7bJgQ8WyLqZBP9lYSxx4uFDBf0h7sCqX1NPqQdwKejbUbjpRsfcdrVMSrQM
	xN/lmyAqDyiftWm/rib5LhdvEmcQbwFnvpKiKyQ==
X-Google-Smtp-Source: AGHT+IFflyx4smOHfMTuag0OKxVqo73QHCgDXjWZ8we+nIfLuHLH3n1yJuvkzYi/Z0pOSaiUUVzhsTTfIRORRjN+gBE=
X-Received: by 2002:a05:690c:700d:b0:6dd:d06a:b840 with SMTP id
 00721157ae682-6e247621811mr70577967b3.39.1727584641683; Sat, 28 Sep 2024
 21:37:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-8-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-8-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 00:37:10 -0400
Message-ID: <CALNs47s9GFAp-6p6sYizOLbsAwUJS2EFxGtPDbvvegqHRPV-zQ@mail.gmail.com>
Subject: Re: [PATCH 07/19] rust: enable `clippy::ignored_unit_patterns` lint
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 4:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> In Rust 1.73.0, Clippy introduced the `ignored_unit_patterns` lint [1]:
>
> > Matching with `()` explicitly instead of `_` outlines the fact that
> > the pattern contains no data. Also it would detect a type change
> > that `_` would ignore.
>
> There is only a single case that requires a change:
>
>     error: matching over `()` is more explicit
>        --> rust/kernel/types.rs:176:45
>         |
>     176 |         ScopeGuard::new_with_data((), move |_| cleanup())
>         |                                             ^ help: use `()` in=
stead of `_`: `()`
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#ignored_unit_patterns
>         =3D note: requested on the command line with `-D clippy::ignored-=
unit-patterns`
>
> Thus clean it up and enable the lint -- no functional change intended.
>
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#/ignored_=
unit_patterns [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
