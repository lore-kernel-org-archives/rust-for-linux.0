Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FAE747F
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757433529; cv=none; b=IMq6d1s6/sOfOCd4KapmPk82GYygC7RkVagnzl3WAMlDNrGoxnpU6h4upWmAD1MUozZlZif+6ew8NQNbQH0P1vutAinyT4N1t3f+auhiW2ztlHEt/xQJrs/K4wJAbBINCNrg4ZiVKg9FEjo6r+lwoWjVHKk6mkzfrUIrFtcWHQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757433529; c=relaxed/simple;
	bh=Ywa5e3QKAxppPj0ZJQB1lJk35L2VQYUtB1VycDBddEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSWkkDCcREYXBG1VDCxLa4jIRn3ZLc9vG8ZwEueMaK1QqPsZdOY1u8ufNDh1TPPtwqsdtBAFyZXjW/I1vwzIYccIIZUYURCvWKcD5/l/dbvCNthRj+BqXlWONhZwG4Yx6rLZh+Z8v3e5tnB/13iBsUFY3oIbpmEtYLNzRIUkjzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHFhHq4p; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHFhHq4p"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24af8aa2606so10829595ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 08:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757433527; x=1758038327; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ywa5e3QKAxppPj0ZJQB1lJk35L2VQYUtB1VycDBddEY=;
        b=NHFhHq4p/1PTcgIFCUZ9h4eyjGodkEdBiyhdPyFt7MYTkmjX2wxxCGAYerFzbbzn3g
         3w/q65HltO7eQ+4xlBzKwzD6IxPPVpT8WsXvTttSRD6KlovEZi7LWUp0o2cKu+dSCUi5
         WOi5nZd7QdAqbwp8PpNErZ5Y3+udzdILSMYUoB1ynYnIF12IVGMvUj932OCm0O23ynEz
         Q2HMpBquphrCpDhpxqJhZUYpBY8MHEGVNcl5WjMgvTcBDHMo/XV9ubfezQss2KZL26+F
         /sm8HqOf1scciWS12hUc5c0sk5fPozeLUdvpmiq908MF4VV577XWZ9xN/RvnH1JzA7+E
         Mqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757433527; x=1758038327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ywa5e3QKAxppPj0ZJQB1lJk35L2VQYUtB1VycDBddEY=;
        b=Jgt3vc/64zXwNY+iVNgrSF35eSnEIP+Z0uQlPJWjZF1Pa5Bi0/bYqL+E6O6kKGfw36
         herBi8qTYhZ2a4TIkLcw6UivaOeBD7gAzYWK0WS5ZyjxLyLMLMTo9aPyORN3jeAd76uX
         jhScicYX+uZ2Onf/ZEO/p6QIy0OBXAtmIxFVBguu/9P04lTitjbLHDG5ieHo+N+6FjeY
         JBk5rQTWV0wX2kfi0eO1WGBKYCR7sPWUSypSnb+eOcW+dTuhEBVq4H5CQ40EBNQJMMrB
         wutr9PLP/g1zv6DSgCn89C0OLuynyvcnYvBYKOSkYg09PfGbySikhJI3bIpX1192Iz6y
         TfGg==
X-Forwarded-Encrypted: i=1; AJvYcCVBZXH4y5rUCnwbpQoPD1hX94aS24e3CnYqwMptBMfkCM955M4eAcWsw7Zd2r2zneSevzt6oJU0aWm8e4j7/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaulYVN89Upjjk0azbQSDYDzgSuQHonfSwd8NRA2WtXxy/LaPA
	PUUkV+KpqdDkvxrp3gNJKIrwDFL5ZXC0vPFP4cZfNz6Ga5JgGzR7gfY0dCmNYcGi1wsrQMzaD8R
	Qhahlo9Z/5ELvu0z2UwqNI1i7HKV8BSQ=
X-Gm-Gg: ASbGnct5Of11G2fB8OFRu9D7R5p186jlDa2ujsXJYitOWGNOpWiQpv9w+HZkIldnwng
	QE5hF+au/Q70muDFd/U/zKFpodg32ZSLdvKZPS8tVocjEuEui5Sl6FoEh4MC21WU/nisx8yVuif
	v2Ip56lKUVmoAX9i1SCZYhpMyh5eeL1++SIa6EAsbs6BguaJGZmeAK8FqRSlQzyxcVQgwgzMu5H
	HLqpj+1NZyp7jlc8RzVKDYgJWmYaIgp9ZFFYCZjZ0LZv76mE2C07SjdzH7cs1rGw+Nz4qSy2zHW
	vn7O+VY0AdD7TYIoQgwsG2UyOcrrvW9N6MJu
X-Google-Smtp-Source: AGHT+IFEfAbF+X/nrPdCmpZeK+s5ayjkd2PeOK4cHoU2eNsecudp4YXtf+CtcP9mBEE2IlTu2Vx0QQj5HxBgRGrXEq8=
X-Received: by 2002:a17:902:ce83:b0:24c:b881:201 with SMTP id
 d9443c01a7336-251757ba959mr89842825ad.9.1757433526859; Tue, 09 Sep 2025
 08:58:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-regulator-remove-dynamic-v2-0-e575ae2cde6a@collabora.com>
 <20250908-regulator-remove-dynamic-v2-2-e575ae2cde6a@collabora.com>
 <aL_PwXck1HsLp5wH@tardis-2.local> <AA8FC1A7-EE88-44FA-A0A9-A3EA5529B10D@collabora.com>
 <aMBJ805QjQcPdRol@tardis-2.local>
In-Reply-To: <aMBJ805QjQcPdRol@tardis-2.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 17:58:34 +0200
X-Gm-Features: AS18NWAJd--xLy4mvtktQI3bs4M9a5-KsXscoI4pdd3jCzX71L3QYG-T6-naM9o
Message-ID: <CANiq72m18qUTjqjKKYgPfeEUh=vN+Jzz=ACFDcgA-JDLL_N5SA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: regulator: add devm_enable and devm_enable_optional
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 5:38=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> wr=
ote:
>
> Well, then the question is why we want to compiler regulator.rs if
> CONFIG_REGULATOR=3Dn? Shouldn't we do:
>
> #[cfg(CONFIG_REGULATOR)]
> pub mod regulator
>
> in rust/kernel/lib.rs?

It depends on what the C API does -- if the C API is supposed to
"always work" (even if it is no-op or if it returns errors) even when
disabled (so that callers are easier), then we likely need to
replicate that on our side.

We had a similar discussion for DebugFS.

Cheers,
Miguel
