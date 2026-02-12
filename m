Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639612BF019
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 08:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770886390; cv=pass; b=Oiu8ib/3XP648xORmFa1QqkLkJwzuLScKjaPjF1lBIf+/sjo/WaPkccHb4dyIGGDzXKNhc2Ce3gSZlnM+qQpiPctSee09ds/eRsOK/XvJtiZGeHupJOJ1UJKvdknTehwI7FokHDnXUbc7FY3Fv+YXu9x4fx3aIi9i6CgoUJ38/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770886390; c=relaxed/simple;
	bh=TjJc1hC/5UC/8qaSpl2SUPNI7E36+gR+pLp/bXphh9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OW1zknb8xlwNoXfsIWK6yHgepEQo8zL6fJL2MDUjrH9Rh72BOHp3N2BgSoy6fvwHEfRG4d9xWdydD8TprpZPY1qSaaKSTUkxKXwAOJizOa1cDrxq/rVdPij5AK34Bbnwf2NbaYZ7TYb//B3PIrQgGRhtXQD6R6omtdfuXYO6xrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tz2xb1Fu; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tz2xb1Fu"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43638a33157so2375159f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 00:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770886388; cv=none;
        d=google.com; s=arc-20240605;
        b=Kn3uuP64RghEGPFknt6PRW5WW76t1CWLPtZXKv/crR43UlyIrjaMH8/mG7KooAm6/l
         KIDjcSlDK69lJrXfNxcSEC1bgC5bH4ZNRHl+5SbT+WS6a2jzGMH3MeE0fJP2832aWXFs
         agC9TQd1/3StNb3c1rpSfLZL9RlYekMuKNgrHzicrwYlEjlyTDZPHIM64z0nwRY2TVZY
         aaPBoM9k2V7pdkmRBy4pIDaqx/WyCH9yFsFaiSNXTRIdV2c4zbRrOfb/1nplokcKXlfe
         Dqb8UZphOrUlIW1Nc/FKogXD7ZliTTMzptXH4UsfPD98LStE0oG09DwbAZ+Xpb0MReIb
         +TkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TjJc1hC/5UC/8qaSpl2SUPNI7E36+gR+pLp/bXphh9g=;
        fh=gag8oBv0MyUtCZLcVSORv8kkBJeQ3jrcVbIC/AvqGHA=;
        b=EprX4zv2zIJZGIP6637Fc6TPWasYO4NgfoR5rUHEYO5V8dxQUTwH06ItfWT5KiuOjS
         qxb6+4fBMz47eMDYRWdmMHehio2H4aI+QS1XBkllr8GVna1HQJzHtzds+Fg6TtVEgsmi
         0C7I89QcihjHWlPxSa/AAhRt/lIQfJ5Slddgt/a+C6aU2IHCGqzHQ9x9pnLp51HEvY6y
         00epX8HYrBF2O5SaL8P+iBHWrXpxWKVu/vJ0VuGvJHT45T06tSwu2elpAy+ranBH0Vjc
         GJHOf800Tz6+kh3UvDXmji/7AbU2o/4aU7d/dkFS8eRe0owT8zKrYSpjO+I9fTIQNe7v
         7Fxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770886388; x=1771491188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjJc1hC/5UC/8qaSpl2SUPNI7E36+gR+pLp/bXphh9g=;
        b=tz2xb1FukJ8IwqH5vPBDKiArb7vDXeWccfAGLURwfoqDOK3rhUSIHhZysV0Bqo4WJ7
         4q1EaiM93bfDUz/KhRl4TYbzZhylynP1AKRTFz5zcFQH2UB0cCk+QThhTPCGRnYtvprR
         BLFKZ3uSuxppePrfyabtf+2kW3sWDrZqdZsYpE2npLLk0No4n2TDAoImjo46JcgOxBhF
         dTiUyEfsRSlg7VobqKrU/4Ehr0W/SGyRP/UKcJhSTBjRtz3iwQ8+ROklCqq2+QGCAcee
         ji+cqiODORgmk6JkeP43alph8IyjYHZBXNwpK+rv67uO3DKA1MhX/4OhKueHAf7iwcfZ
         0ZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770886388; x=1771491188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TjJc1hC/5UC/8qaSpl2SUPNI7E36+gR+pLp/bXphh9g=;
        b=ZGVS6gRNZBV7Jo1aHQv9M1kHoMMfnJqJhUrhSLfLbu9Kvv8OyoZqbnCnuMOgad2WTD
         cdECAE1Ef6Im7Vs5xL6YyXowbdSeZf6z+VVjE07lx+8vMescqTH9UW+69bqoWdujlV6X
         N7e4rLJkh+2Faa39W6ya8HHQ33dCYVKXoG1Dil7SGO/75RAtmnK1ZemK/4Sp0rwKH7hX
         o4ejMUvRTuprD5JXbXX2+hFOvsZFZsS8+nodHv7DgBNrUmV9CrVhlCtN1c0fCJ2B2Du2
         crZM76SE1rw+FASXhfYmGjhX9+qIFlytqPtx9kybf0AcDAZlrt7rBT9B2ak2TSpaUCA1
         hn3g==
X-Forwarded-Encrypted: i=1; AJvYcCXWVE16+7N0d9WWEimGO4o0RIq20GIagg2fjpvxEgQ7/1hg+x5v9/l74kvOsPVEZGRBUCydaT1TktD3IgsHxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzucfsPywSQ3CuC+v9J9e/zGVFQH4EnERsRynyi0ls2IzwTFIOJ
	QzHHPFtfAGU4s/6plHu259K6ncWcA0OCcGBHqioVZC1niZkVablXjAsLhTlCCb42rjijE7FnGF4
	8PmJSrxvBceBvy2O1v6zeEnsF2wH2bUp83FOhnRbZ
X-Gm-Gg: AZuq6aJccbyia8cEFJ8yvP0LZcVKw2uwUUvRm8OzNVN1lPC5aXLMrhDFEH5Xi9+ocJM
	pNsuLQtl4eAmrgdfZBxYwNoOULlrr/64SkYb/xIhrO8NA7siFakt7jSFf0sSQHQ0NksiuRb7wya
	7tZhg1FWVkT8f/uVwO6d6CI+Y38qkqTcdhXgvS45c+67CIR3SF9x3cmmaOzDDR3jFZSP6lqFMiE
	hM/naVkiLiG7rX/fhP7xh0SemXaZ45oTQLwNFLYthL/wlyGE3Lmk0XzXIeizdTUFeXnpeZz47KS
	Rlc/vKLjU9g1zyOAN1xdfyP1MftOibI6j9eHkQ==
X-Received: by 2002:a05:600c:a0c:b0:477:6374:6347 with SMTP id
 5b1f17b1804b1-4836715615bmr17466765e9.22.1770886387455; Thu, 12 Feb 2026
 00:53:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org> <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com> <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com> <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora> <20260211-flawless-feathered-boar-0b87ad@houat>
 <DGCAAE4YEDLO.299F5M641E90B@kernel.org> <20260212-obedient-faithful-koel-d8aaf6@houat>
In-Reply-To: <20260212-obedient-faithful-koel-d8aaf6@houat>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Feb 2026 09:52:55 +0100
X-Gm-Features: AZwV_QhgJnsuH1kZOi2k-I_YfnetcmGyr_LHt3UuVnGbxnKyOqJh-xBICfTM86Q
Message-ID: <CAH5fLggWdQ04fVjmcNcNYvUTx1zTqU10usFbypPV+fe3OpwbkA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Maxime Ripard <mripard@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 8:59=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> It works *today*.

The code we have today is both safe and unsound. That is a bug, and it
*must* be fixed.

> And the "oh but driver is using the API" is kind of ironic in the
> context of the Rust bindings which have globally been in that situation
> for years. You can't argue it both ways.

I don't really know what is meant by this. This API is for real Rust
drivers that have already started landing upstream. Sometimes we merge
APIs *before* their user lands, but not without a user. We generally
are quite consistent that Rust APIs must have a real Rust driver that
uses it. It's the usual no-dead-code rule in the kernel.

> Either way, I'm not sure what the point of that submission was if you
> will just dismiss diverging opinions, including attempts to compromise.

It is true that we are unwilling to compromise on the requirement that
APIs must be sound. It really does not matter how convenient the API
is when it's this easy to get it wrong and decrement the refcount when
you did not increment it. I'm sorry, but that's the way it is.

In your latest email, the suggestion came up to make the API unsafe.
That's more acceptable, but see my other email from half an hour ago.

Alice
