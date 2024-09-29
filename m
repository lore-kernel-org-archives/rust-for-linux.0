Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61B62868B
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 22:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727648129; cv=none; b=aPLlwte28w3TUY2uydKEQPQVgjaLnf0LU+MUOmbSr0zyv5wakuyE7Sy5vxTyxUUiJ7rsBpKB2TpC85+NGM2tQjXCtkVjuE46inl5NHY1ZYCC/qIfBahofpzpqu/0C/fB9ozaA/ZfnUj/6HUFaHJmstWTqBgXt7mnoHIUpy0xCLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727648129; c=relaxed/simple;
	bh=0eFr9Bk5xiWCz8BgzMTr8R6G4u7fPxSTQA924sYJQ3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BU26kY/1XgY5as4n6qFljPhbk0Oav4EKyGB/NiXj4iJvIIVpGBpgsiRCQnZ2mmqieOhdzpgG+uVxyowvgOP92M2MjUFSboTM6HrybHCRxebpk8+Kt9EzIux5Ogk9QucxcrhB6ivF4zDbnSZyfCFuIEvnk6QnaDGf9ZJqHrPrz8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=QwTmHPm0; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="QwTmHPm0"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e129c01b04so29602047b3.1
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 15:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727648125; x=1728252925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrDiLAAMBLULdnd9JA4k6M4CX7P84ubsQWj96kmGwtA=;
        b=QwTmHPm0jVo6pp0zIpw77t+Ks8LL6QUVmnqKQrjxO+HLhd04jl+88KZUqGEsu2/Udv
         kcoE6pHDDOSX2Y2+RD459hT7VWHgv55lAiMiN/l8zK/thOVtJBCXwkqD7Pc1Ags4Rd5E
         E7381WKIMz43F8wMHe1v9OXqCJ3C2KK7Fle47Yj/jikt2Em7eO25oj/ZZEbCFSDWg7Ke
         C6xS3/CwFMCrJxpm+qPXg8/SXEe/3nDJfDl3qB0smnLO2qBp7zYqlLTXuMbQd5JYwMcx
         M4elvFITfBcCCsdgiHBVyNE7S2lm5Pi7Uwg5jyZTkWti8scYVE2a+Fa247tVoq4/ZScR
         1gGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727648125; x=1728252925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrDiLAAMBLULdnd9JA4k6M4CX7P84ubsQWj96kmGwtA=;
        b=f6wiF7nghzvqmNRfhU1EmiWPAsR+WhxhaistvJ8YrhR5RIoPJIm24AQcnmgsbIc5N+
         6Tfhb/ykS/SRttQDStFpCMylp1tIQHMEO0gaqL7EWku+oUrsNLYjg/cqdrYKcSnCYsCR
         hdGls9g7Ivbwohq37je12fvjmYqsXeHxdhrrfOSMf9SqrQRa41KmDcoBIvbKIY+f/EFK
         gZkhE+rKcYTYwqs+Vi8DqfPW68DaiPi9jlqwiowyhGTYv04zBlDiBnN6aUqy1cXkEyS7
         BPaM8N7Y4YwdKMDLxp1JyNiqnruijR+NpfvuGK25/53tghBDqj94ZQrHL4FZSW7PdpGE
         ioUA==
X-Forwarded-Encrypted: i=1; AJvYcCUDgMmSU9M/91GELl13zNIVRnxVdT+vY4BeUlwHEu5bgl7wjDyiwCamgEYDm1Pl2/pFUGprKw9bfNnd3oyFug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlm15gHBk9yM4cDfMqH656Vo4dYzp0OzkAOfMuNf9sVIQgx2fz
	eqf0aEFCPaRr3dKszg8bTUuXSBhyFoanqO2Wpc1psESA4+rGtEPo2WwdlVRwTjxUhJY4XcTgIMJ
	8M5TAilpO7UMn3VVrgoIs5eIAIYhLOFg2yL/uSw==
X-Google-Smtp-Source: AGHT+IFU+upOkL1h5/rmQ3rjwqb1zvlkH0/0EkyJvLl4+CPbB389BnqR/RccU4a6zbMBvHq9yezHm2LKnS7F8Es7voE=
X-Received: by 2002:a05:690c:2b88:b0:6e2:2c72:3aaf with SMTP id
 00721157ae682-6e2475b980dmr54851107b3.31.1727648124778; Sun, 29 Sep 2024
 15:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dbb63b5698aa507bbe3dec54b4458a3f151899d3.1727606659.git.hridesh699@gmail.com>
 <bf6544faba2b53ce901b2e031f3d944babcc7018.1727606659.git.hridesh699@gmail.com>
In-Reply-To: <bf6544faba2b53ce901b2e031f3d944babcc7018.1727606659.git.hridesh699@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 18:15:14 -0400
Message-ID: <CALNs47vT=g2D7A_cDq_8F2xJRJTK-7KtQY4brFYfkopyCSjLTw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2 RESEND] checkpatch: warn on empty rust doc comments
To: Hridesh MG <hridesh699@gmail.com>, Patrick Miller <paddymills@proton.me>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 29, 2024 at 7:16=E2=80=AFAM Hridesh MG <hridesh699@gmail.com> w=
rote:

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 39032224d504..c75bc3927bf6 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3884,6 +3884,13 @@ sub process {
>                         }
>                 }
>
> +# check for consecutive empty /// lines in .rs files
> +               if ($realfile =3D~ /\.rs$/ &&
> +                   $rawline =3D~ /^\+\s*\/\/\/$/ && $prevrawline =3D~ /^=
\+\s*\/\/\/$/) {
> +                       WARN("RUST_DOC_EMPTY",
> +                            "avoid using consecutive empty rustdoc comme=
nts\n" . $herecurr);
> +               }
> +

We got a request to add a rust-specific block in another patchset [1].
It would probably be good to coordinate here and have a patch adding
an empty block, to be used by both of these changes.

[1]: https://lore.kernel.org/rust-for-linux/a9112679-b251-4b98-b55e-e8aabf8=
2ad46@proton.me/
