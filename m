Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A768388369
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 19:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760070; cv=pass; b=gNp6+jhkjSdFKQIIaZdrvb4xuAx88vtJeyMxuQFQzLMHlHPnodnkF55mUOvML7g7hG9LYillLaypDUpnhEtRYAtotOuxtUDAKfE+acp+NF0jpxzpLIewN9p+Pi6iCblRXtv3RxenuMeUUi3ySd9u9NsgisIRr0QZ3M8U2Kjwmuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760070; c=relaxed/simple;
	bh=Vn0pg41Ip/7hPwtecElePnY3XYE30363BA8w/pBNKkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KbItQzpubX60xxMD5CxIFLJQ+vGhh4vgSzPgkQpQdDKIWXFvj9SZ0o6Iv0v+db6eOVOz0ZUquGFi5PkjxPEmMpxpIQw2Riy8HzqFLmSE13QxIbg65ZJ7ckzmNUUshl0m6gunn/c/qi+nWhh824l0wXX8V1CD3F8E3a9RiQMOc7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEQ/fM1P; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEQ/fM1P"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30c5fcfc947so302991eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 12:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782760068; cv=none;
        d=google.com; s=arc-20260327;
        b=f54w7ftzaP+v8jBqU9g+Vv/QyF1p1EJpODShYM3nQju5/uewvG2na/0wzaoA9FIdO+
         pgRhdzVTimm1R4OZ/XwlRYn3tMqDA8UmmUShL8T3IvBeLoY0jHy6uXEOb98Qf9uDNyWi
         Y6Z5PxkRdBzJSzKhz5v1HtB3scEgMet8a1Oz0y0wmu08w9jupSvFLcAOsj08qT8NOnqB
         cxaUypeAy4XDikirily7SqFUFAQSj6X1UADYCDIF+NYaEZVUlBwdYzGj58Aa2bip2A4d
         lyd8jDw6Jbx3CQvMrOWGP+XJzXzY8eBPuSF5hASrwyUEHgmDacRfKHmGP7t6ZlQJVEIz
         Lflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tHSIGtbVhVftBU1P0PUwzTUvU0nuyEEXJ1gCHih1CyQ=;
        fh=D7MYgheFA1opS7S7/pwpq5Mi0Xw2yv+QBzbop7K6J9M=;
        b=mNuYzsERgK31OrSXe+Kpzxl3D7iY+sEINtUyQ4n2fjjbnRovFtj6L0xIOhZ4EKB8Id
         AixbRVsKC8y6IdDP8YQCOmHJrlubFRcA0vti+WumfawMvrmBUkWkvF7jsD2VdpkfeRHT
         mBtGJVocR2VTtHfA9fsQfCviK2EH47rVh9i6/D7uJMgIUqPoidsyLZoHFD8LOGj9tq63
         3nb21JLC61RJ4EFi8sPwsZIG2q0zV+ufXKnOrNYvGnD+RfrpUWTEYVqGxr9wj2doyKmS
         MTu3tPNn4rl38Q2a/ahiM2CcoNXPXZkAD7qyGYr9QVU0fI+vxGwesaA0l5ly0cYyNeRZ
         R2TA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782760068; x=1783364868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tHSIGtbVhVftBU1P0PUwzTUvU0nuyEEXJ1gCHih1CyQ=;
        b=hEQ/fM1PuV+ANnVHHBtLr2i2Qh/Jhi81vuj/aslHhVot+mkfmzrbSYC6KDYXQV9whF
         HYZd+TfJCS/ItOaoY/D7q2Fkqp9PWnxmjwT9Vni110NpoF/1zLMhVAr60hF4+QBeIAPe
         yy4Y10coI+n6w98SUzTusTiOIyQZHfgijb18YsFXwLmTP8lNPpZyd73Hl2eJoDnk0Mow
         OyHvVoUmwdGnJH6HTKYCfwbJOp58Nkyj3zjfyJna7JrjYxZOL6Yc7D6NXqnmddcbyPgs
         9T2rxjZuF8YalxrT4ueTfFQrQiVb2p/EwalgKX9hs0eckTaueVidXL124g0l8bzXvQrn
         4iAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782760068; x=1783364868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHSIGtbVhVftBU1P0PUwzTUvU0nuyEEXJ1gCHih1CyQ=;
        b=WDHKsGeoTxizjHbrpH+yYrlLv7fH9/P8BEv3kYZSv182aNJkikAnIjoPs3pZ1a44pi
         l9jrxAEwuxciFCrM3Si4A+C7MCJwtjynXmeuajUYMKGWUtCyqh8GMI/kTnPc+78oPidr
         AljRhmAAEXeroWlX60reQLItJh9VyYvJGzZ9zyOY4n7ixea3Qef3VSALEuesFW2SrmP6
         4FGt8UVfDCOaBAvHsi3RDX1n2j5GvEJiUOR0B/Y7LAAj0I0FmFIx7Gmz0nyZy7r2sja8
         YRLqG5AAtPlUFlkDWAfeT3kIEEoep8RFrzQi0Urwx8dns8lvSICG38MbKDjWvQMb1g/L
         roMg==
X-Forwarded-Encrypted: i=1; AHgh+Rre+VKnj9DWcbys/TrO864EcGEmdawiaoKSAqKXv5kvGlhFinApvDmzuq89K20eAZyyKiUdZmrQ5S6K9UR0vA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywesa1HkQqyj4h2CSE4Jjagv0AcnH+eKirBjfYPM9B2F+Xq/vyK
	61pK4nx9fKM+houXKOZnnAnj21+XnhDL36VmcjgckaSJk7mV2n5xQIj+qljuGSJ1haT1UM9gMzb
	bnCZGZViMs9InbUKS0IlnH+ce9o+Y33U=
X-Gm-Gg: AfdE7cmKaNj7cYM4whQ/2Wzti8YocgNeeIXH+8JRle6xFmtH5mnfJAwPgcZrdNCQXU1
	kyJRO8oIqdvhVTLppqKRPyjaKA9qyKnf6+eUrc2UtLHgXrt7whnQuiLlaT9lu4L+VogKugmCs6Q
	HEuli05GHSM8MtvDh8StySQjvr0NDi5wxaRZYwFe6lhD+49QW2YU2yyIeY7T6UKU4bgsiwrgrzc
	6+IAUgwqWRuhyt++WgXmM1qZ+qnNrS7MiJu2sWXjpa7sAocZYtKjy54T/VO+3T3agwk/uvQAWQ4
	J4CduHzrp6/9GR5n6SbCW3SomvC36YFpEy5ENjFvZPq9/EXYrhGRe3XjDgCh5zWSSe9EbZqqquq
	zisEhuf91bunEsaN3RhZ92Mo=
X-Received: by 2002:a05:7300:fd11:b0:304:f860:3ae3 with SMTP id
 5a478bee46e88-30ee11982a3mr233258eec.1.1782760067448; Mon, 29 Jun 2026
 12:07:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-backport-cfg_select-v1-0-388d5d31d9d4@nikableh.moe>
 <CANiq72kG8k3mk+Xjr6q7aKg212QUNtZk5w4rxV=UGR5UXKE_ng@mail.gmail.com> <0eb77f4b7199e9af01d61e0c1ac03c99@purelymail.com>
In-Reply-To: <0eb77f4b7199e9af01d61e0c1ac03c99@purelymail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jun 2026 21:07:34 +0200
X-Gm-Features: AVVi8CdkymgZKdU1srNb6pWvis0Oy0nhiasvmXiP9Euz5OiXsHZXZZwi28ERi7w
Message-ID: <CANiq72nVwM_OF4yz1rB4Q-atDgZ9Oywbuhu830jfQe7npt0FeQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kernel: add cfg_select! and use it for
 config-based selection
To: Nika Krasnova <nika@nikableh.moe>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Yury Norov <yury.norov@gmail.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 5:34=E2=80=AFPM Nika Krasnova <nika@nikableh.moe> w=
rote:
>
>   - 1.94.1: core::cfg_select present behind #![feature(cfg_select)], with
>     the final builtin behavior (single-brace expression position works).

The tracking issue says the latest change was in Rust 1.91.0. Did it
not work there? Were there changes after that?

> Does that work for you, or would you rather take the gate and drop
> expression-operand support?

Hmm... The end goal would to use `core::cfg_select`, so in general it
is a good idea to use the "real one" as soon as possible. In addition,
we can always wait for any case that doesn't work in the fallback (as
long as the behavior is the same for the cases that do work).

Therefore, we could limit ourselves to what would work today with the
fallback. If I understand you correctly, you are saying that even with
the conversion here, we wouldn't even need the expression case, no?

What is annoying about that is that there is definitely a risk of
someone using one of the cases that don't work on the fallback but
never actually testing on the minimum version -- even if we don't have
those today, someone may add it. And while it is "just" a compile
error that we would likely catch early in linux-next (like similar
things we need to handle), it is still painful.

So, yeah, I appreciate the advantage of having just a single compile
path, and if we can make it so that people cannot fall into cases that
would require extra cleanups/migration later on when we move to
`core`'s (even if `core` supports those), then that should be good,
i.e. if we want to go with this one in all versions, then we should
make sure we only allow that subset that cleanly maps to the future.

Now, to be honest, the easiest is to just wait a year and then start
using `core`'s directly... i.e. it is not like we are in a rush to
start using it anyway...

Cheers,
Miguel
