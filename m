Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009A73FBEA9
	for <rust-for-linux@vger.kernel.org>; Thu,  7 May 2026 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164417; cv=pass; b=I67qJ8nmk3d7UjlROSk7HrTjiVLY80Q5hs4y8TfTyi6PFK9B838jN5ssRyBudFxDDaD+0+/HYFwVm5hrVxHEAQLp5hSC8ID9JCUsJzNGnprnBb5xEtW2dSzT7N8iXbxukaCtRrLFLq4xdaUWkAVcRvwRLcqYrOFXSLK6rk6aEHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164417; c=relaxed/simple;
	bh=Hcpbt7+Mjauh4UZjONL/+CFpbxeJbS4nhSU9SybpoO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYFjt4z3j9pTirQiZV7wul/FOzmKATi/hUZ9N11fPmyX2ax23osvp9hvYqlYYlAStT7QNJhkog6EX0y3Ay/v4h7CPE9AT/RPQzcsTwibClwwNNUIOPZ4dprsFB3Cndu9ZDJeHUlQFKIf0XsbUfoTaPcnr84+Rm5BA/BlUHUdosk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3XIg/L+; arc=pass smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3XIg/L+"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6841e6a5e51so483490eaf.3
        for <rust-for-linux@vger.kernel.org>; Thu, 07 May 2026 07:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778164415; cv=none;
        d=google.com; s=arc-20240605;
        b=CryOwcopxyFPi/tiplRdH52ZfQprTeDkuc7x6/be0mGSVUc/wDEjq0j3E410ZHlLB6
         f/9IiM9xga6ldYlPW4Rjbip76jzldaBmkgGaWtWA8VQWYZai2bM/2Km2fjKrn4QiYqkv
         g+4eX4UOtraR+vyoD+zdDSQ/uqX2mTgEnCic6cMQRr24Je8xUT23NftyqzydIr5YufJ1
         JnwrENdVJswegoDrh3GTMBr6chefxmf/Z25K63RN0Zvg+tWfGvQD24ZbXwdUB6n7kHPt
         TYdSGFcPIpXd7HN5rMnZWhnfkzilvablKRGiZrE63Yk0avyUahuT9XxYvdUGBNVGcxgZ
         JyzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KmRd7Yf4GvPUgOels1mU/Q1tGl7Nc6KgvPjuVduGuZ4=;
        fh=UIG9V7VgEJA75T2bmF79duSAkxFPGXclfLHolEunWxA=;
        b=YG2OugX5NcHSVBTDnO2MZKVad+Xn+5rE1XyXengS0Ty8+aHefjTzAhwYL2HDrkXcif
         FUVP+Ta6GDOy2sETbkf3SYczuzOfdsksctLB53vqme9OI8kLvrl7JSk/Wy4anVsz9Onq
         2zncBaDk450ksdiAbn68rtDc5mM7qQLSKUQ20RI8LD6BRnfwUc4/z+cchgkCYd+DZNqX
         CxN8JRyj7/FwP7ZRPVXWf2pt+b5oOmw/JH6+Lp5drVq+CmM4pyhI2wxLEbrLgjflk0OC
         TbZJihTa5dOPlVXu91nMSZvO2EsDZ7cmhXQ2Ygb9H5Ly447x3qpRVzMv4KHdlvY0qc0M
         +GZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778164415; x=1778769215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmRd7Yf4GvPUgOels1mU/Q1tGl7Nc6KgvPjuVduGuZ4=;
        b=W3XIg/L+sSY6aL2X+HVe76QcUiPDOwq80UxW7YcKeCuzeKSDSJL805+FJnIX1rN6lR
         NqKmOp3kuyQct6Irx1CGBIFnsKJJlzezyZJjHp3A8LGyR6p/ZNQQF5KoqWLfb0XOhAWm
         26CwdSEJzSb7eIlpSJ8uO4FXK27M1JHWwLvJSg42EzEqgL9glbrRvRfM2KDC3B6PwcZH
         f/qnuSb+pUJb2A71XKVVIaLjYQdnuH73E2PwvjpsGJ8KhYUd64Ql1YcHNVSgMpB2G7cL
         MyZMfqOgN9EyuiUW4fL5WIIz8W6tdw7SKfb30e+upTMeZX4ejIzzjBuin1CVuZHJZ76D
         YEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778164415; x=1778769215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KmRd7Yf4GvPUgOels1mU/Q1tGl7Nc6KgvPjuVduGuZ4=;
        b=N9TIKUD8n2yJ8HXpKgQbMYRweqF9bEDlfq1fCACPIeZkOtkqwPXwVhGbPcQr/e8onj
         PyJ3+lI5U7RE5aIaBlIRfGnTxtB9Fmb8+JXm2huILR3adEdi3noJfhXVyrjj/uSLbnKE
         1/RlVeBV9jAgLi6EfGR8Yd5JfLwA7zJ9BjhuTmvG0oiI6d4P3leA/qm6Ym5XGIO3Ojqe
         nuOv7jms1dwMhK3SSZqgfAd7/UmYdXGrLuA32dwfIKgBKyr/tiACAXwfQqdmMig2Ly9H
         +qhlvMLj1v5vAwPDdFTlcPKp0iwLAKvNgc4nAT7IH3nxcIFVz+FiTcWEcWJ5dH8WsVF0
         mkkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8I72yiNmaXpzyS2QRxSgpFt7SsXEz9pc/b6ycExeZzve1ECt+yNaww48sJtsf6BLSJc99imMjB8gtx4DgvGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6XGtpKIfW8IARb4IhTarHTtbAxfOfFrnjxpPIUVhrP7TzVNab
	9+XHEVA093gkwKSJv1o75+fPjg4HnX7hSphJ/wnPf0Jq/mqOrrLcONVfd2aOyIlJL8J4ytnzws3
	901ybDnuFIBGnUsAI4b003Oflevp1iQo=
X-Gm-Gg: AeBDiest3fQCAWFSZsulOSXxzw4zlJWAKogapIA6yUxbqmceftZM75gn4ZHrE8hN1Db
	M/VajxrsOdHT8b8bBQ59nhihn9X+F6VegtO4iJdfKTSPOMNBH01GZiNoC1q7HrDHyZ+KRgHdq2F
	AdpDaZXaHFGMUWqliE9nX+qzevuupT79heYq90APvXsnzlvcc22vYKCShFHQyDiTsT6LOCR1XV2
	aVlbVOS2c8QZGDq4iEzqUxcmk74Yaic0sq8U5ooECu7ilurShVD4MSMYIDVOvJHXJNejEnAmKy6
	kxN6DqeGpE7tEA0euA==
X-Received: by 2002:a05:6820:f030:b0:696:29bd:80ba with SMTP id
 006d021491bc7-69998d1e4f8mr4648191eaf.31.1778164414848; Thu, 07 May 2026
 07:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504-ra-fix-primitive-v6-0-74cfc1e862d0@gmail.com>
 <20260504-ra-fix-primitive-v6-1-74cfc1e862d0@gmail.com> <177793208554.80529.7376377202991122733.b4-review@b4>
 <CA+tqQ4+McKwrZ7rHFs70Jh+CG1eMBciB18Nnt32ebFGzH90kaw@mail.gmail.com> <CAJ-ks9n4v-=Ou=AVX0c5qCbXY-ApyvLrpNTb0UPErsk=B0FuPw@mail.gmail.com>
In-Reply-To: <CAJ-ks9n4v-=Ou=AVX0c5qCbXY-ApyvLrpNTb0UPErsk=B0FuPw@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Thu, 7 May 2026 23:33:22 +0900
X-Gm-Features: AVHnY4IOFiXOq9RBnsml8PNq3gYzbao4WFWk5ch3BH3MgFsBVtIIwg4rz_OiHLI
Message-ID: <CA+tqQ4JAayf0R+=He=n4UGAsebu-FK8d7Dr17k3+3Myzkatf8w@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] scripts: generate_rust_analyzer.py: add versioning infrastructure
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 11:16=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
> On Thu, May 7, 2026 at 8:57=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> w=
rote:
> > On Tue, May 5, 2026 at 7:01=E2=80=AFAM Tamir Duberstein <tamird@kernel.=
org> wrote:
> > >
> > > I think we talked about this being a bit more defensive with (at leas=
t)
> > > set -eu. How's this?
> > >
> > >   #!/usr/bin/env bash
> > >
> > >   set -euo pipefail
> > >
> > >   RUST_VERSION=3D$1
> > >
> > >   grep_args=3D()
> > >   while IFS=3D read -r subject; do
> > >     grep_args+=3D(--grep "$subject")
> > >   done < <(git -C rust log \
> > >       --fixed-strings \
> > >       --format=3D'%s' \
> > >       --grep 'Merge pull request #' \
> > >       --merges \
> > >       --no-follow \
> > >       -n 10 \
> > >       "$RUST_VERSION" \
> > >       -- src/tools/rust-analyzer
> > >   )
> > >
> > >   tag_predates=3D$(
> > >     git -C rust-analyzer log \
> > >       --fixed-strings \
> > >       --format=3D'%(describe:tags,abbrev=3D0)' \
> > >       --merges \
> > >       -n 1 \
> > >       "${grep_args[@]}"
> > >   )
> > >
> > >   link_prefix=3D"https://github.com/rust-lang/rust-analyzer/releases/=
tag"
> > >   echo "$link_prefix/$tag_predates"
> > >
> > > Note I added `--merges` in the first `git log`, inlined `LOOKAHEAD` (=
and
> > > reduced it to 10, now that it's only merge commits), and replaced pip=
ing
> > > into grep with `--grep`. The second and third `git log` commands are
> > > combined.
> >
> > I don't see the `--no-follow` option in the man page, so I'd go for
> > `-c log.follow=3Dfalse`.
>
> https://lore.kernel.org/git/20260507-document-log-no-follow-v1-1-46ce0249=
0eba@gmail.com/

Awesome!

> > Should we also use that for the second `git log`?
> > Otherwise, merge commits might be lost, right?
>
> The man page says:
>
>   --follow
>       Continue listing the history of a file beyond renames (works
> only for a single file).
>
> So the second `git log` is not affected because it doesn't pass paths.
> I suppose it doesn't hurt, but can be misleading.

I see. Everything makes sense; thanks for the heads up.

Best regards,
Jesung
