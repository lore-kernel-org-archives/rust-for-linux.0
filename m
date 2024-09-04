Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2314B1E0B80
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Sep 2024 18:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725473017; cv=none; b=D4nU4qjOt3Ib/y1MTeYbQL+SSJB3pbeuRVXmXkyZvdFQXmkXygEHBPezaCumEMj4GXWejNKYX9EoAiwUOYe9haEJSLFx8sOqqv0HgekjefiE/zgwMUYh0CPqvjkouQWcl9X1F3oRWNuhGrOezypgt7dCsu6EWvVU+grY8ABMDOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725473017; c=relaxed/simple;
	bh=sGxD221mI90raKKqY69Jrvx+alI7qWayFZJCwsVmXTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzrdYF6X2/jdFnsdqwZgRh4s2X1l2NExesFiwbO5ng4B1ybeQsO8pJyCHueN8pLb/keNCDel5fAMjgpalCpO48mk8e0DDmEPAGPSCGwfp5y1/t+kcgtnlwpVRAYpytlgt9NupGAk+SO12CpWjXXxQImQWJMr1KXmr28njFqUk8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zZJr+KII; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zZJr+KII"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6c35334dfb1so6149166d6.0
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Sep 2024 11:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725473015; x=1726077815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGxD221mI90raKKqY69Jrvx+alI7qWayFZJCwsVmXTs=;
        b=zZJr+KIIdds4AGOAQG9erCj3mZ4EdoG/F8ypsQtehbw5Icqc/8SJaeq9E1cy7A/9Ly
         iOs/kQBrr+hDqSY7hOtozhF9rV2EFSROOuUAP0eMc1a4Yb0cQlOBYjUlD49IuW4Y9Gi+
         GCGp9ljS26lQDuUUZzsh81qwkFrnd5B0CrxWl76LVQB3iKsh2cNrMQo3fe372s25/9iu
         FtEBO39E42A2CPAl1Xq8zlb/SKOMGacXEoJUWExLO56wQVBd3Nywl3/lNla9FYa8BO+v
         ruOole/vlaF1IjRCRfxn3M56iF1NK0Z82nmgyyiVPwHyWu15jq1u7i6Y8TfbQP2jGUt8
         wtvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725473015; x=1726077815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGxD221mI90raKKqY69Jrvx+alI7qWayFZJCwsVmXTs=;
        b=giH7Wu/u0EsedlYgFKJxVla2rXwgkEemGStqvyCkyYNzy6RhGcFwYBYJkiBRi4ICH0
         TFRtp6ANUqJzG0Ar+UmwPiI7E+YXAce3b2cMkY9DgSJGkTUuNUb3tNwMdzX2zddcCKbD
         EyFMNTuaawn9sMTzLL8HkgJOpPdpj3tt0KPXFid37mJx9i864rjs8idDxwzlbKgmuOZG
         QLHJxZOTo0T3Gp7v+Jc1O6z31qQ0+960w/QCQk3zKXMiV8e9OCwcGjltHWKAtwL8qUFK
         +zmGxslZwfRJl3z9f/dBw6x0v9+lPLf0fmKU3TPa4gBMKtwfARFDP9d7lgKErznxKHTx
         QFvA==
X-Forwarded-Encrypted: i=1; AJvYcCW526ozxncBP4xrWaXzFutOiJ2Qw8adHje1K9g4tIzWP1T9lWDRIRyYajjkCqrD/sONC43YiqxL7NSQot37/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdxmlH0cT7PxkTwZTddD3qMX2gFWvTogGboCChijK/0/FYa5HV
	JOozxQQKVH/soQNcxO/SRnE42XJm3vLHC04ApJA/530rkT2TdTsRawKf7W0+RSdlHYC3yMR50rZ
	YYZ7ZxmqYI0FW6yDg7zUablIrQaaXXJtY4dXc
X-Google-Smtp-Source: AGHT+IHBmJTTHN2Wmj2krBKYeUJNhB5p9uqzsqxdO8mlK2mkQ3IDyZ4DJz70MF5sZsUtDnLHJNbztr+CG+65CRyvY3w=
X-Received: by 2002:a05:6214:320a:b0:6c3:6f34:eba6 with SMTP id
 6a1803df08f44-6c36f35002cmr72924326d6.42.1725473014610; Wed, 04 Sep 2024
 11:03:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904144229.18592-1-ojeda@kernel.org> <CAH5fLgizixTZ8nytkSzSLA67+f=zWZZKt8xTJ2BQg5K0ivAAmQ@mail.gmail.com>
In-Reply-To: <CAH5fLgizixTZ8nytkSzSLA67+f=zWZZKt8xTJ2BQg5K0ivAAmQ@mail.gmail.com>
From: Matt Gilbride <mattgilbride@google.com>
Date: Wed, 4 Sep 2024 14:02:58 -0400
Message-ID: <CABVGRke2nj83ohcBg_Q4RCKHuVVXP86jiL=moZ8x3fBEuKv0uQ@mail.gmail.com>
Subject: Re: [PATCH] rust: avoid `box_uninit_write` feature
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 4:43=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Like commit 0903b9e2a46c ("rust: alloc: eschew
> `Box<MaybeUninit<T>>::write`"), but for the new `rbtree` and `alloc` code=
.
>
> That is, `feature(new_uninit)` [1] got partially stabilized [2]
> for Rust 1.82.0 (expected to be released on 2024-10-17), but it
> did not include `Box<MaybeUninit<T>>::write`, which got split into
> `feature(box_uninit_write)` [3].
>
> To avoid relying on a new unstable feature, rewrite the `write` +
> `assume_init` pair manually.
>
> Link: https://github.com/rust-lang/rust/issues/63291 [1]
> Link: https://github.com/rust-lang/rust/pull/129401 [2]
> Link: https://github.com/rust-lang/rust/issues/129397 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Matt Gilbride <mattgilbride@google.com>
