Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB54933ADB6
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 13:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769435822; cv=pass; b=EwJ7hRyMhLROH+6GnN0CloH71ToboO4wgI3BlKoI/XckUwk/b2y0CVoLhh3J4lOcmaEL5wQ7TplgjCb5ElElc1CYYFrW5PafGKusHBFdEY7hLIp7/8585158baFQRrxU90r2Ie3Y8xaRt7BpmSGpNR/1I9unaDvtWG0S2IotTh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769435822; c=relaxed/simple;
	bh=Hs4gQAIXGRP4A5GoneDpZm1Eqqa7AFk8rXfZDECZc4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1kr68aGguFKjl9xglhHgnEv/2kIri8ovuH0JGGIHmyMqJDTDGG9S8iEdsPFYuNacxsuaIij8PnIYKfKkzp/Wes3+/Hc+ip6uLliis2DYD/ateEwHacw6/Pnpog/lEf8yGeMupKAsJ3UaWsFw0AJQPDnSnNgnyvu6oRBW6PLj70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oz8GYbrE; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oz8GYbrE"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b6a868ad45so485469eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 05:57:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769435820; cv=none;
        d=google.com; s=arc-20240605;
        b=LJRSPFMcJHW7VICP5s2UZKM3lTtF0j+zaeG2qSGy3cGyS3AoKGthPKBMDkkjJSzjxp
         oiBeUpjZwSazraOjqrJdcQ4Nk0r3uCZT9AfPgb8znJIQvQ46ZKSwkQe8h2JXPVrDT3tA
         wnG44lcW6GI60FVZAWHpxA+6n5TJEPti9vMYaOGtx1pIxN7BQ2vkjHOmFbAmjCY/2og1
         WbEb3oBWnikdjz90ysJ0gbLvyJjX7GHcqmdleq5K8gjN8XaR9Chu5GU6NNYcy92ElXPH
         vCzrMmL+DSFN3n6XJPUE3QXxG/S9SBQFC7hkqJ3tJYt4lunRXxgQ9B7Y/ZQ1rp9vTfeH
         cSVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hs4gQAIXGRP4A5GoneDpZm1Eqqa7AFk8rXfZDECZc4U=;
        fh=NciTsaMcuMENFevXeGlaJFOCKmlSexAIJxVLI73f5Rw=;
        b=csx2g15FwOClkqWtIyGiBsG2kP2YWsMqokiAFBVpY3ZGGRsu6bhtee5JpcPajU3LYg
         zbo4Ilg8rhm8Cf1TfVAFQ3M6IaT2vUWAkS+jD5ia7TWSYUnJ9SI/IZ+rriKscTVaag2d
         8a2IcwMZiDc01Clz30aAEgTeMrpNIJzUmQ5u4jQaZOXln8qUAEd0OV75vHi0EQwT5cDu
         yyEOkORfA9dOokaTBrS7k3LWGbcuLOd0EKhhHwGK8fHdqfwryNFqMyJTsggF3fMosFuk
         sR3Fi6FkOqATXqU591CN5j+nLFrEbZfdK1BdiWWIJUFcQcpL40sKyZ0LpmXqyAg29c1O
         K7Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769435820; x=1770040620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hs4gQAIXGRP4A5GoneDpZm1Eqqa7AFk8rXfZDECZc4U=;
        b=Oz8GYbrEN8v34SQroVBtDc6+SCyvF8nQn/WAnmjwn8uInEeOLNFLJKV5+wyqZWC7Oy
         mlgYXok9j8pQNTnfdyuAJfn0Z0sd1vK9ETMFR+MM9YWNj2wMY42yy8nNTKwwG4PptxEM
         qMjFy9Q69OM58OJ731oZ2ZNrldfkfAJk6C9WA+0YaczUBcH2JDicJ/rT03J0bQXlpe5A
         NbvWh09eZMQwOcJ3txlxK8CiCsAEFQoSlh189PEDVi0S9+5Zr25zMUeczAD1PwOkx7gv
         jG5GFAigHhqw1NpO/mk8vETd+bKlE8lcUQpizXhlCx+y6xGG7Fs4rSZhnd2uUsMh7aKA
         NL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769435820; x=1770040620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hs4gQAIXGRP4A5GoneDpZm1Eqqa7AFk8rXfZDECZc4U=;
        b=R7eoLnCWXx6tHjVPO3lnanH50HZLaMV3xSr+qOx3LTchPKk4hrZpjBAqujN5R9H/mo
         SjnTopsu9pXt8pP6J/096FoWmXu+E+FaQovAB0OkJu0suxltdUqj753iJNZX/U642toM
         1VFet8qoZ89lrFTBWlEQRn97aJZvFX61Myr/dRZjoJxj/RkS4ZU81rdCeCfUK6kwemcd
         MVipTCJt43C5zmylTuBnsMMfxnySZRmkK7mKc/quGWx8+Y7Ci2gwBMQMMU+VMUm9baRN
         K75H8+7LohSbLCYb+rm77TQBz1KdfuxwoQZKI6F1BKDQVmRc3QM41BkjnIqZwKZacu+G
         f5jg==
X-Forwarded-Encrypted: i=1; AJvYcCVMoR4ObvKG+/oiSgRrMM42/YPDPy1BUXmR8pqks7s5pMl2Vj3hU3obYtiZyCAWcG2fMANIrKNoM7UfcNlo1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+rr86NILbmuls5KjC7wXQJNAOraeDwoG9DdTOGl/Tc0STkIkJ
	wiNHuvfRyN6CPJ4CefoVWXWlkB9DFflDpPVPNC86BVyAiqa8TV6UqxIAiSFz44AGu6X6xbrnMlx
	BfyhMeS70JR1+d6/GNyJY8PKtBWGDx5Q=
X-Gm-Gg: AZuq6aLIDsNRWqdKgij1oaz1sL0UDsWEcfWgaDIJzJzY8ogb3winay/YSWcPkbMXEzJ
	5FtVRBiaIt95eu1ddEKPiqWjNDfUyCq9ej+Ze5rJbqx8mtJtQsiztcCUQ9WotCsTe9Arcjq0oF0
	QiMTzFastYhzrRoaJeou9ASS5PQlDie1EIqkzh5g95FKrqAFIH3bpsWRoY0UCK/O05BO73RZmHy
	CwQftqgO7cfqwLdVW4TGMh56rJ5PS1KvWNP2CPSKtXZJgQk8CV0UO83P30dpF440wSr40DSo4Uq
	FEmi0FeqPKpvqS5VWT9249d8C6de5I0cdSMrGvnuYFFDW9HJvOSYXm7Eu8/JwODUOkWWRbsJCNP
	IYlpRnbsiy27X
X-Received: by 2002:a05:7300:3c24:b0:2b6:f2d5:2923 with SMTP id
 5a478bee46e88-2b764516000mr1069157eec.7.1769435819760; Mon, 26 Jan 2026
 05:56:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-register-v3-0-2328a59d7312@nvidia.com>
In-Reply-To: <20260126-register-v3-0-2328a59d7312@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 14:56:47 +0100
X-Gm-Features: AZwV_QjTsswQAkmWPUzWUKmJ6ny_3zq74L034FBYBizeXOxAoA-Be9tZu_tDqkY
Message-ID: <CANiq72=AsoyN=+K8Tg3+zrK95ET0SyKaLFjzukxbMR1AbSk9vA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] rust: add `register!` macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 2:29=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> This patchset is based on `driver-core-next`.

I think in the end you wanted to pick this through driver-core in this
cycle, right?

I have sent Acked-by's for that, I hope it helps.

> Note that it also need `rust-fixes` to avoid an `unused_unsafe` warning.

That sounds fine, i.e. -next has it and Linus will have it before the
merge window (unless you want to get rid of the warnings in your own
branch).

Thanks!

Cheers,
Miguel
