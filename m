Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A87332614;
	Fri,  2 Oct 2026 08:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930014; cv=none; b=ZtxTttUZsrX/g0FmAMcGxnBaSKKUpmf5Z5PveDeq4SvIDThlqjJxjKRvZhSBsC8dzPIm7iqIVPEJiN0FbpBu5zXvWKA5haK+NwvLK6P8jNUEwECaShlW0XiF0nFRHbQBLE3RbRbYDxwnSVIaeZ88nS7uTgxyRL15T4bAQa0KxOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930014; c=relaxed/simple;
	bh=8bSgUAjvoed3ifVSKKLblPTqIymJ250z0XlQYQ0aH/c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rc+85hNn0RySVmY5lE5PEpj12BjRXlu1OawgIalE/MG7jqfP/DyGLRfZaluia4GrYPCwYrOQmMzjRw3oPxKhHWLHqxZziL42uRoLILjj1Z4xvpm4B8V9Ba6AgxWTtqCfJto8Yx9NTFfrN3gqKEZVmz5K5dosUXysN86qMRMSAO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+oDwnsO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+oDwnsO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5DC81F000FF;
	Fri,  2 Oct 2026 08:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790930012;
	bh=8bSgUAjvoed3ifVSKKLblPTqIymJ250z0XlQYQ0aH/c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=l+oDwnsOJSaXLb2kcqw4yoJ5pZELYjckTpkqO/eWtTrWHdeRZRSRWsscvd/Mg68ME
	 0hChhL6aqnp3Ddi0P06WpI9Avr5x8woEr8qdouC/K2XpXnnLmoGqcd2GyZYfViliSM
	 9YkJftKj0nOimx89vbttpWeaN8Rvg+EkdVyn3F5skLqsSWBCY6YfKhpxTITYsyVZKS
	 psx2w9oDmg4y74g06+QWeKif/XZ1SmRSynzOiYizZX/Kf58xRUpaiGcAhQvoNg8F6T
	 VWHAnCjcs9ROS/xOGJaWz5JIsBUDw1/4/qhkVicz132pQuwza6YTheD9qGREgqSBgo
	 wCl0UPAvZY6UA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Yury Norov
 <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Burak
 Emir <burak.emir@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner
 <tglx@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>, Lorenzo Stoakes
 <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Uladzislau
 Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus`
 C function
In-Reply-To: <CANiq72nXsGHbSQ1LfbG1zYaMaZv3X=u0+XzT6vHh=9vxLE8QTg@mail.gmail.com>
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org>
 <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
 <87cxtvb2qm.fsf@t14s.mail-host-address-is-not-set>
 <CANiq72kZh4a39hcy0g9sqEmzx3m+dcPRW=omOB2r5DhpRq3BXw@mail.gmail.com>
 <87a4ozas7q.fsf@t14s.mail-host-address-is-not-set>
 <CANiq72ki4Pc6y8og2ROLRSeRTZBbnpY41v5EC+qJaTiZWVhwAw@mail.gmail.com>
 <TlsfpzyqG6QHcTMb-dOQPUP6uXU2G9urfH8AK0nzNO3j5rY0QWjn2ni9zhJ41CpVeppXhpH2E_yJ3LgUTibqbA==@protonmail.internalid>
 <CANiq72nXsGHbSQ1LfbG1zYaMaZv3X=u0+XzT6vHh=9vxLE8QTg@mail.gmail.com>
Date: Fri, 02 Oct 2026 10:33:19 +0200
Message-ID: <87qzi8a4ds.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Wed, Sep 30, 2026 at 1:38=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>>
>> I can do it.
>
> Actually, `cpumask.c` may be better -- that is where C defines it and
> that helper has the right `#include`.

I don't think we need to split the helper C files by the headers they
are defined in. We can include multiple headers in a C file that
logically lumps things together. If you are worried about finding things
becoming difficult because they are not in the file one expect, I do not
share the concern. I usually just grep in the directory through my
editor.

But I also don't care. If you want to put it in another file, I will not
object at all.

> Which in turn makes me wonder if we should also put the Rust one in
> `cpumask.rs` instead, rather than `cpu.rs`.

I don't think we need that kind of granularity at the moment. If things
become messy, we can just refactor.

> However, we do already have `nr_cpu_ids()` in `cpu.rs`, though, which
> is however in `cpumask.h` in C.

It's fine.

Best regards,
Andreas Hindborg



