Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698558;
	b=Ppi9PzePlMFdxSc9cPMoxo9qtOqR6eE5bpKkgc/vFnMer+P4eEXvmF5j3MGcSsweYLQ+
	 WmTNKls90QkDhAK379zkFzDm5W7RuBUUNasR26031D4mxaq8G0AWhRaVm7yO6UMkdEAYZ
	 QA8plAnlZenY+iBYHHBYcnrj4A+uMz6PgZ+SlDTBxQ4cImjjrARw+kkBuBVglF8fDxdub
	 Wxk2Lk+75ArPTOdDjSlOp4a2kHBKZghowRjwMe2LSUZZPdd+ioWDryUyOIIvYmAzG4tJF
	 2ZNEzNRBoCfwpksUsikYfyevG0qPEl3Cy/TimaWrZnrb8Tboh28C8ZBLWd55oBUUooA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698558;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=aUMV5ZRa8v4aOXUFqdsZtdk8NjIisN//Dq6gb0EQEJs=;
	b=SKrh06CjMYxvUQ94yzvPMd9VFaQp3bF/gsftj2nfO1F3zcVwnzgaQ/jn/qezBW8hPzgg
	 HqtOPWtttyAboWsT0djxxDa/0wV2cNck7S0zJuoB/211mUfomOVQEd8ecJ29u7wPvrywy
	 qkPk1jZ45lR6mqK6ESM9r1wTiT48lobHpBGJGnN0AoYA14EuBlUS+SQnJzDnKJuJIuGZ0
	 dyzySMdgoNeaxJae5pIySzqakrCXx8U28eVuQEEGXrrWiEVGzPtWNeSrlyj+wPgNz7Xuy
	 whQP2+gmFEx/tDh+Tu1zKdnmsvlyFbC+IbfzYj9oe54jyYh2Lt7p2m5uB0X81ehKYCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VGJ7D/eB";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B8E606A324
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 09:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VGJ7D/eB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3EE81F000C1;
	Tue,  3 Nov 2026 09:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793698558;
	bh=aUMV5ZRa8v4aOXUFqdsZtdk8NjIisN//Dq6gb0EQEJs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=VGJ7D/eBn/Jkkd4tKnh3mhzQqo9YDUjsjEtYuZzzwi+krdBOrqDa4Gpp7HqUbXmxQ
	 Wzjog/nywvejNWy2C14Ou1O7sfp97iIUyHIhQQZ670BOIaIGVKwLJ5GH6mpBJX20cN
	 MDLWNxhaO6oPYRoPz0hDC8a7DQAUTVtsLxhh17VY+HIcwG6WZD6ypyz7td9mribExk
	 TNpkFw1yNTDpwHbFbxt7yE8p6LJIviOgPNz1fTqCH/m6AifdWuD2GYrY4QSY2MXztX
	 gPBFaueC86mDRBPxshaCsXZmqEeUX3l0Qfj+tphTRYlBONup2SWTkYR7JWd6oBEJy6
	 exlGdGK77RWmA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, FUJITA Tomonori
 <tomo@flapping.org>
Cc: ojeda@kernel.org, boqun@kernel.org, acourbot@nvidia.com,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 gary@garyguo.net, jstultz@google.com, lossin@kernel.org, lyude@redhat.com,
 mike@fireburn.co.uk, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v1 0/2] rust: time: seconds based Instant
In-Reply-To: <CANiq72ka+YS+O31zm7sm7-at1TyPky+7W_5cNMLvqTK3=mHEgw@mail.gmail.com>
References: <8yvpSoQ7ihtTj508nQU_nAlk2eMmGH5zK6H5pow6z5cTYGO3yL_DvqwbFMwqzhtbL-52eMYXpT5Cyg0g7fUN7w==@protonmail.internalid>
 <20261031003334.4161188-1-tomo@flapping.org>
 <87h5hzmfui.fsf@t14s.mail-host-address-is-not-set>
 <20261103.083342.865260022622203055.tomo@flapping.org>
 <CANiq72ka+YS+O31zm7sm7-at1TyPky+7W_5cNMLvqTK3=mHEgw@mail.gmail.com>
Date: Tue, 03 Nov 2026 10:30:28 +0100
Message-ID: <878q3amfd7.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Tue, Nov 3, 2026 at 12:33=E2=80=AFAM FUJITA Tomonori <tomo@flapping.or=
g> wrote:
>>
>> Mike's drm/vino series will use Instant<C, Sec>, and that series is
>> based on drm-rust-next. There are other time patches on the list, so
>> it might be simpler to take these two patches through rust-next or
>> timekeeping-next, and provide a tag that drm-rust-next can also merge.
>> Andreas, Miguel, would that work for you?
>
> Up to Andreas and what his plans are for timekeeping-next this cycle,
> but whatever is easiest I would say -- thanks!

Yes, these will go through the rust timekeeping tree. I plan to apply
them around rc2, does that work?

Best regards,
Andreas Hindborg


