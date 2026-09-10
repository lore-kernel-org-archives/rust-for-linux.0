Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E67C2FD69E
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032048; cv=pass; b=Ac9hrXkWfser4hxVNyJNqaAJBNhjEivGOMXRHUgywl7hQKnfHwnZ5C9dP8JoJbFU2BkwLEkNzxn0REa6JKTeR8gcz6PJo1EIUgJNyU7BBY6xLo3u3zpStX1YA4ffebiUhV7ulX5EjB65ommx+4DoL01SCoKWH/hILOrZgNhGEDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032048; c=relaxed/simple;
	bh=q9QnqxjEGinaY46ZA+bvIPaDBRCIbRll7J7JjAJBLgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0r11yg0upMUlHBCo9OBucJrFzTFxG2EMqYkEtHGt/D/5FJ3gMfea4nqF0w47bnn3LGS6FTqygM8hsSIdT3IhBbifnM8XXj3DzuPTKcqU2lhN/J4h91Omph5yhZUx94k8koTt7RzdOgEvpaq1Ay+JDlmYwouZM2ThvcMVaA8cjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X697xfbu; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X697xfbu"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1335909a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 02:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789032044; cv=none;
        d=google.com; s=arc-20260327;
        b=TjhesXjH8T0hitcu95TUgRTzIevzaiUOKQtaEpROqnJ+aLSfd76zY+tPTquNbONhKS
         WmLtmPgDwqd8/zGF6TAKApGfyIeiKcX6KzdtpQxZSO8f5AniFDiXOEBJrEJtlLm8yiAP
         zIjM4c9aluezhRT86SUPsgEmHf+OzFk/OUJ1hnF6jFiawBXk5DpSHmUUFYmD2EYYnhQW
         ORS04HEQKoDgOKIan8fLjiz0/sTT0sqtHcFWjPaYMt+rh3/UBa3V+jiaLR4D50hE3chp
         nP2ob5UYgQfpzZXsx7qu1qbKh+xl1452oa2uk/KJF+1js0zgl7fXd1Bdy18ndWCUG6wb
         X9rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=awtkCpsXf4lT1xmyJs5vPTjW7l1vNDpzRPqYANXx31Q=;
        fh=YbwfGfo4/K5/XW2QAMd+9Emq3QCc4DltzzPfjrraGck=;
        b=F8Wr2qv0rNqMhi2S7oDhlf+bTTU26lvysrLxgm4Q7vCHvJjq6jK9JD8ICLqUDE3KYQ
         WR879GIwKT7jRBVUYRM9osfV/hXYIvYBF+cRvJ4fztYk+q24jgaW4QHD8MnW1TAsEQww
         vnDCSwu7i/FR2tc8L40+uBThueeSSY8CkC9wpPBLlQtge01766XJvm4wMsntM9ZH+Qg9
         mN9OydjjGuhN77+cC8Dc1mnCorHPa/ABBSRR4vwn7e+6j+DKqdCBDLeZWqVJc8XS2q7I
         HFJcKfNTF9ez0HlFWijI8X1P0cz3rAUnaIyxPRRUBwoMt09y3ci49E8exfJ8LUMh5bVG
         6Auw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789032044; x=1789636844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=awtkCpsXf4lT1xmyJs5vPTjW7l1vNDpzRPqYANXx31Q=;
        b=X697xfbuinHdPubIlH7q3jDpXaJEUJirjzzfGWRpmfmyQ4k5U6v1xup8BYUPjMOMyr
         PiBydApwl4ZaAwNzi/JiLLFS5vyyuw/b+QlIzuwZ1CxPmjComsXwDX7RFa5/F/IGS8s+
         vcFbHBqurOluUEtEKeF8ZJNNjE/b6tEbBbKkJqDenGfB8sMPGdJk6tagvi2n2SNMqvSP
         bSzbaQHL4ubU0zmYYXOt9cZ40Fln1brBCOq0Zx5QUMHa5XT0QjrQg27UPRX5xgIzTJQ4
         QiFxCZNSGyUQG+hD9hmUxHegaOcgr/Oxld9WeYWk8yrYz7g6P1IqtyH7ZW4K0kdlpaGS
         lsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789032044; x=1789636844;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awtkCpsXf4lT1xmyJs5vPTjW7l1vNDpzRPqYANXx31Q=;
        b=MsVU2HfRxkStfX4w3O5lp3kgOJ3GCe8OHkaS5+tHDfn3sAfRu5eQz5bgJN1QuKHriQ
         FOLpoSz50Sg4pjMh5750gpimjW0r3DBxuojQ8WzON5Y+sx6athWW7V0Zs8Dlx4RW9DMs
         ZSio+wcQfnJzvIcWtG+zbAgd5pF4N3UNrwZsPTgYNTKT6TlsYDff8jE2IaukcOoP4VMD
         Rqsw6GAft9irC9jjnGtwtbONIj0uOOw8FFny3w20LKAhJIEc8/pd3qqGzp7kxstq49Xl
         BZnByzVwOwnDkcanLfM78vIx/BGkTfMqKDLjLhy1CZOYBl/k/4CYELZo4H2FCd7CoRwq
         7v5g==
X-Forwarded-Encrypted: i=1; AKwUvBxnQHK7Z3PflyF4wZj8qT9z6X6dhipjRK9LosxvzKoLESIPMWTYo/7DnRitR1EnXHpJjpjahtEZMueHAKvf7Q==@vger.kernel.org
X-Gm-Message-State: AFuF++m5gLJ3RwHflnZDhiXWhC4lzgzPYDR1b28uQ9wbaqDvT52mPXEi
	crJKkHWAoG/0oU4RDLkfHrXxlcK4VPcVXRuQXXFxflcpuFNYUqlkTYD45Cid4YioPuaHfPT+2YX
	jfq4xeVbn3h1mHqiM3DXZWVomXQpjUv16cpcqr92/
X-Gm-Gg: AYBFou2RIwduwYhG5QfVfv/SaXL+HTEu1BxVieIuQ4Dh3inEolkS3PAu0nyfxXo8Hqa
	qEs24ZJIqvKS3W2kmksInl2QKk3hmOLS1LyBNUl6jRrW1CYHU0e6eJ3ZRXyn9ovIsIOI4rGmiDg
	/98UY9iwQBP6KQPZglsmRci35avYNKbdgVFrQDcx5DLPzGxHRpMk7zVkrLwNVxq9pxrb6Otcp4y
	cYQ1dmT9BT0QDcZHeML6AxoOhdr64SpvuqJNmDLAtGz/RpyMXJH7I7w/ILi1Wm6VKlEu3yt3rKw
	VT16MYitNh2B1B45Ty06Fy4tctIOMvk6dvbh+FazhukIYaJ29M4rrtbLVF5rKkr/7//z4Y4nKoM
	DvejmHpzUSVJmmIJoEZs/vFo18vzxArc=
X-Received: by 2002:a17:90b:3e46:b0:393:194d:5366 with SMTP id
 98e67ed59e1d1-39d70a5931bmr11078638a91.10.1789032043898; Thu, 10 Sep 2026
 02:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909060623.888777-1-apopple@nvidia.com> <DLAUS65AAH2A.39ZT3OE05AR1K@garyguo.net>
 <aqIQNhGdRTsv4v52@nvdebian.thelocal>
In-Reply-To: <aqIQNhGdRTsv4v52@nvdebian.thelocal>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Sep 2026 11:20:25 +0200
X-Gm-Features: AcwNN1Xrg8LTCYt4BUMrSZIngtm4gfbznqjlhLN8NRZP8tjCEjTIGBcoCeV1bXw
Message-ID: <CAH5fLgiuQ_rQv-Nj8SuJOeiuNGpjZq35K7bcT9jv9hXXc1nv9A@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: export symbols from the `uapi` crate
To: Alistair Popple <apopple@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Asahi Lina <lina+kernel@asahilina.net>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 4:22=E2=80=AFAM Alistair Popple <apopple@nvidia.com=
> wrote:
>
> On 2026-09-10 at 00:25 +1000, Gary Guo <gary@garyguo.net> wrote...
> > On Wed Sep 9, 2026 at 7:06 AM BST, Alistair Popple wrote:
> > > Symbols from the `bindings` crate and the C helpers are exported so
> > > that loadable modules can link against code the compiler chose not to
> > > instantiate in the module itself. The `uapi` crate has the same probl=
em
> > > but nothing from it is exported.
> > >
> > > In practice this goes unnoticed because the only functions in `uapi`
> > > are the trivial `Default` implementations generated by `bindgen`,
> > > which rustc inlines across crates. With CONFIG_RUST_DEBUG_ASSERTIONS=
=3Dy
> > > however, the `Default` implementation for structs can grow past the
> > > automatic cross-crate inlining threshold. The module then references =
the
> > > copy in `uapi.o`, which is not exported, and the build fails:
> > >
> > >   ERROR: modpost: drivers/gpu/nova-drm.ko: symbol '_RNvXsH_Csk9v2ZIpW=
bWt_4uapiNtB5_17drm_nova_info_gpuNtNtCsfr3MPOfBGpN_4core7default7Default7de=
fault' undefined!
> >
> > Hmm, uapi' ideally should just be type exports and produce no code.
> >
> > Default implementation should carry `#[inline]` annotation so they're
> > only codegenned in actual user crate. Rust's `#[derive(Default)]` would=
 always
> > add that. Can you check if that's bindgen-produced manual Default impl =
that
> > somehow misses the attribute?
>
> Right, bindgen-produced Default impl do not have that attribute. For exam=
ple
> here is the bindgen generated implementation I see:
>
> impl Default for drm_nova_info_gpu {
>     fn default() -> Self {
>         let mut s =3D ::core::mem::MaybeUninit::<Self>::uninit();
>         unsafe {
>             ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
>             s.assume_init()
>         }
>     }
> }
>
> Manually adding #[inline] fixes the problem of course. I guess we could a=
dd some
> sed Makefile hackery to manually add it. For example something like the b=
elow,
> not sure if that would be preferred?

I think we should just export those symbols so it works on older
bindgen, and then try to fix bindgen to emit #[inline] so that people
with a new bindgen version do not get the symbols.

Alice
