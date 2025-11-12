Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B823D3043B8
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 10:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943089; cv=none; b=sODw2Dk5da+GAII3SN6xU3QsuMR359DD3cRIX1JPq5xYde9q6dtZ/icVH6/us1Jq43J0na4Zq92iFAjxuCSc5qbYpBykTOQfuIjfcV0HqsiOsW07rfkgd+8si3ynLVNtx7rWe+v2Z6siSK0Sz72Ka5iZuxth93YfpLUijdaGXuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943089; c=relaxed/simple;
	bh=QV16gLuhA6QXk0TLawQZc0iHWhNFDaMJpFOCm3aRQps=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k2zNNtPT+MUxw7Tl+Ak+THXS8XVPUYZTBu8xDEtx4aLT0q6Opm3rLWBJJc0ilEkIT+qhL9SLQDfoVi4lb1t9lLXaplGdbmn4wKoUr0tK3ppiqnqy6cV8NkxUuD4Glzh6YlNEekmEebPSu8WOVcx+gL9E5TA/+n8pEuGrkYAm+0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V923ZWF1; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V923ZWF1"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6417677bf55so574921a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 02:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762943086; x=1763547886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QV16gLuhA6QXk0TLawQZc0iHWhNFDaMJpFOCm3aRQps=;
        b=V923ZWF14LJOtIKqBD14V6GFHbL/fEsOkBkVmUGlLOSjtppIkaH1u9MgF7Fvo8lbjs
         aX5k+1NYgzmxRJF1hiesJAg3OXqsFcIVLYqTQb827pUy4SYP1pPJEfPWQDO5FNBkONJh
         S7fjg7pnOwfJoMznbVDUD2rQJHC00NDMjL4i1MHSAFGF5Zheq7FdV59nzj98sJzJWCKI
         +MgZiIN+r5Vhx5MJE5qz9Xrcy6UPxVjRMceJ8PB05vyivSaDL4J3rdslQpWR62TPRxGC
         5FDD0mShIAsEIx0uRVuTZqpj4EVSs9a/yyrjj092BhYmZOCBfi5CCl+DFQE2MDKbInFE
         3AOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943086; x=1763547886;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QV16gLuhA6QXk0TLawQZc0iHWhNFDaMJpFOCm3aRQps=;
        b=Df3WScqbQWLq0ctW01NgbDS/vHN4SV1Y6Fsd3BSWI9xkDeQpk4bZH4krmU9PtQDkBG
         ff44F+9sdpOMXetZrWoC6Z0UgF0MeynJNSV5peWZhGt5i0kXS2SGjsdRPRr+kgsaEgQL
         YsE+7nm9o5gg4jL5F6WrC8dSYWuFypUZDu92n08sA+qX+Tptoi9ya6Wr6sYK9bpCY8wx
         jxJFiUSQUCS1SodXLfJQeHK2Eh/bCPorAX5m9T/MWJsexHA1I6WE/pKOYt/AisCNTnr6
         b5COwQxi7mNSTk9Nk8Oo3qQLKMsZO6baO/r09pEWDU0Gx2n7/+lEK3YKH8dzIU95prLg
         2yEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPDncQjrJ8HuHi89RRSdk0PSbodOtXoCgbk2ZZJtc+RdMURKnga1m7ZO3QI5D/rYHhpgVZ23KGMORYTmF1NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH+g7Mgfk8qNre1bZN29dYEEbDX9A5vL1bfuyNa3UVLQJubp6L
	2JEZc3pM/cAM4e1o4jH3kQPP+0tGLpyS+oXOp0q3Z3nUQadug9BtCkk5ycdkea2jeqP2UUm9yJU
	KZ30sH81LWKW5inEiKQ==
X-Google-Smtp-Source: AGHT+IF1pxUgNK4s9SnZynMy7vzcNMtbfcJwnUyBona8xZEdQaGlDIF17TEFkA8h6w502BmTVUazVQKjBBbbcF4=
X-Received: from edh10.prod.google.com ([2002:a05:6402:504a:b0:641:2f00:1985])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:440a:b0:634:11d7:f70c with SMTP id 4fb4d7f45d1cf-64319f08cc8mr2418980a12.2.1762943086210;
 Wed, 12 Nov 2025 02:24:46 -0800 (PST)
Date: Wed, 12 Nov 2025 10:24:45 +0000
In-Reply-To: <CANiq72maV_j1uV=2nPGbTgRabnk8cpc7TNN_FQ+ou52OpZ=k6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251112-resource-phys-typedefs-v2-0-538307384f82@google.com> <CANiq72maV_j1uV=2nPGbTgRabnk8cpc7TNN_FQ+ou52OpZ=k6Q@mail.gmail.com>
Message-ID: <aRRgbZ67cuW4ZoBN@google.com>
Subject: Re: [PATCH v2 0/4] Rust: Fix typedefs for resource_size_t and phys_addr_t
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 11:12:32AM +0100, Miguel Ojeda wrote:
> On Wed, Nov 12, 2025 at 10:49=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > This changes ResourceSize to use the resource_size_t typedef (currently
> > ResourceSize is defined as phys_addr_t), and moves ResourceSize to
> > kernel::io and defines PhysAddr next to it. Any usage of ResourceSize o=
r
> > bindings::phys_addr_t that references a physical address is updated to
> > use the new PhysAddr typedef.
>=20
> Should we have these as actual types instead of aliases? i.e. same
> discussion as for `Offset`.
>=20
> If there is a change of these getting mixed up, then I think we should
> just pay that price (not necessarily now, of course).

Maybe later. Right now I think it's more trouble than it's worth.

> > I included some cc stable annotations because I think it is useful to
> > backport this to v6.18. This is to make backporting drivers to the 6.18
> > LTS easier as we will not have to worry about changing imports when
> > backporting.
>=20
> For context, will those drivers be backported upstream too?

I could imagine cases where a normal fix gets backported upstream and
benefits from this, but I mainly thought it was useful for backports
that happen downstream.

> i.e. we have sometimes backported bits to simplify further backporting
> elsewhere, which is fine and up to the stable team of course, but I am
> not sure if using Option 1 (i.e. the Cc tag) may be a bit confusing in
> the log, i.e. Option 2 or 3 offer a better chance to give a reason.

Using a different option makes sense to me.

Alice
