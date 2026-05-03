Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7243CAE6A
	for <rust-for-linux@vger.kernel.org>; Sun,  3 May 2026 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777814565; cv=none; b=FnjLBdsPNPBHtCRxEcqvVy52/OxbOHTPIeSZMozFbHVFPAI6GyISS3A+vkfxbpzYpIQISPm0RD2fbnc+2LlTeHdwZg0Dx6OH6iVHJL3NzhV+PQhLpaK1LQs4uLwMfNp6PrGY/VoDvSYC58eoUIvS4PHABuqimMF+QE7NwASacns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777814565; c=relaxed/simple;
	bh=1+YmkWXikCNjacA4yHMYboQrJ6IVLM8NanmjYnat9Zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djWWIi4hTcZ/6NMpgQ1Aunxn9fIyMj5ZBgRXRnqNznH9QdpmPuBrMGPnqe0yquQCqNVBvBeLC7CoSupgY372/ZvBfBznTWtFb+rbjq57sPl6Bpa+fKYONUZaZLvZVCbq5aJ4k89kis1x60v/xakkjNSpn1+BksX4BDUF4X+ZuiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRSXn92a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRSXn92a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3CAC2BCB4
	for <rust-for-linux@vger.kernel.org>; Sun,  3 May 2026 13:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777814564;
	bh=1+YmkWXikCNjacA4yHMYboQrJ6IVLM8NanmjYnat9Zo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lRSXn92a3+/eLKu9RONKZLkDDfashwo5BFHILs5bfQajMRIt1OWiI7hNLEMlgtk43
	 cfOIhOuaio0cyHq7n/kIe7MvaraxHC8jcx+B2XMnC7g2wFN7lxcvRmoSGTxlbr4+SR
	 gIETF5TJpZnn3H7h9oLQ6Ca6r7TE5ZMdoth5wS1mpdQbIQdVsdMcQ8teRwEz7SFX0J
	 ha6xh9Z0F2LOv2xMi0yjD0s4n3o0UArYH/urpVTiDnbFJhltyZUyjZJa1EDUosFkuR
	 OCk+Emihj4lQTxY3mFkLBEId2l9ZKWJPs3ziopev0WHCUW9G0xGX0VMUC97YQ8+f8/
	 OqaqrTm6D0LMw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-393800f638bso7961181fa.1
        for <rust-for-linux@vger.kernel.org>; Sun, 03 May 2026 06:22:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ZK4n3XDzZIJciV/1qyhyYdEh6G3FfAbzYK0YTV/C++IMChsfOkf21dJskKz2kOmgOIac2AGRNM6VEN+NjSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjtVfoL6HuXFyPK85FpY2Fn8Ykm5+qv4XBN0EZ9teX+nH12GQC
	rUXKKqeoPkjoB+zmOSClxJiY8bh0/BKPxWk1LGZ/UZpVV9vTcPmDMICk8PGGuez1M7C1pThyWgk
	NnDWUcAQ9Uyu8r5QirIZ9w7XflGTq9yA=
X-Received: by 2002:a2e:be09:0:b0:38a:4c95:8cdc with SMTP id
 38308e7fff4ca-393785f40f2mr19331041fa.29.1777814563324; Sun, 03 May 2026
 06:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-ra-fix-primitive-v5-0-6364d2258e14@gmail.com>
 <20260430-ra-fix-primitive-v5-1-6364d2258e14@gmail.com> <CAJ-ks9kwpz_NzH7=xMhMvKNHCYhAsG=sR2pTAKuyZVhTb8Pnow@mail.gmail.com>
 <CA+tqQ4L3yeuFS+METfUUn3Wj2ihk-b5yr8iG=G_fzRGXv+TcyQ@mail.gmail.com>
In-Reply-To: <CA+tqQ4L3yeuFS+METfUUn3Wj2ihk-b5yr8iG=G_fzRGXv+TcyQ@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 3 May 2026 09:22:07 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9=QqUCCyvmqT07rO1hpG9f1cfP1nFoNRUo8yXY1_7f7jA@mail.gmail.com>
X-Gm-Features: AVHnY4KibcdAGATsONA2iCn2_mjd4femkRyPEjTftoJiFZ9OQ6uIU1qR7C4A3bQ
Message-ID: <CAJ-ks9=QqUCCyvmqT07rO1hpG9f1cfP1nFoNRUo8yXY1_7f7jA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] scripts: generate_rust_analyzer.py: add versioning infrastructure
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 2, 2026 at 3:40=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> wro=
te:
>
> On Thu, Apr 30, 2026 at 11:14=E2=80=AFPM Tamir Duberstein <tamird@kernel.=
org> wrote:
> > On Thu, Apr 30, 2026 at 8:15=E2=80=AFAM Jesung Yang via B4 Relay
> > <devnull+y.j3ms.n.gmail.com@kernel.org> wrote:
> > >
> > > +def map_ra_version_baseline(ra_version_output: str) -> RaVersionInfo=
:
> > > +    baselines =3D reversed(RaVersionInfo)
> > > +
> > > +    version_match =3D re.search(r"\d+\.\d+\.\d+", ra_version_output)
> > > +    if version_match:
> > > +        version_string =3D version_match.group()
> > > +        found_version =3D tuple(map(int, version_string.split(".")))
> > > +
> > > +        # `rust-analyzer --version` shows a different version string=
 depending on how the binary
> > > +        # is built: it may print either the Rust version or the rust=
-analyzer version itself.
> > > +        # To distinguish between them, we leverage rust-analyzer's v=
ersioning convention.
> > > +        #
> > > +        # See:
> > > +        # - https://github.com/rust-lang/rust-analyzer/blob/fad5c3d2=
d642/xtask/src/dist.rs#L19-L21
> > > +        is_ra_version =3D version_string.startswith(("0.3", "0.4", "=
0.5"))
> > > +        if is_ra_version:
> > > +            for info in baselines:
> > > +                if found_version >=3D info.ra_version:
> > > +                    return info
> > > +        else:
> > > +            for info in baselines:
> > > +                if found_version >=3D info.rust_version:
> > > +                    return info
> > > +
> > > +    date_match =3D re.search(r"\d{4}-\d{2}-\d{2}", ra_version_output=
)
> > > +    if date_match:
> > > +        found_date =3D datetime.strptime(date_match.group(), "%Y-%m-=
%d")
> >
> > datetime.strptime throws ValueError on invalid input; perhaps we can
> > catch that instead of using a regex match.
>
> I think we still need to use regex to extract the date substring, right?
> Since `ra_version_output` is the uncleaned CLI output, `date.strptime`
> would always fail if passed the whole string.

Ah yes, good point.
