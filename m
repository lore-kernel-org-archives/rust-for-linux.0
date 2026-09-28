Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81095481658
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589470; cv=none; b=IepRS7oeQZIt7AGLs0772+7ZkLl4QYCPsb03jfDV+KDbeKJIHkaaI8l+E+f5Ht7pOwlR5TAvWgqjGpMvA2ZCDxchJK3qR/TbeCKajis+lnmY/Gcfs3gJdw6PnaRQDT9/dYoXHLtbubFySgy57tXE8Su1y+kVpxD9FqH1Migb6hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589470; c=relaxed/simple;
	bh=1QBnIbf+jNE8TlKzKlf8bIJjfHD2KMxATClcyBhRnek=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=t702zM7T8eq6k3r4+8iKmz+z151rCeWYfdAfZUfG4J56IX0r8z6aBjPmvgxmQZD5ONToe83WcUUQ6qBBUBcgXWpY80q2QRrydhRbMqs/lASOWOvsTmZrlhlJbcZUfQwK8v+UQ4CO6h8qiFXZX1e8nrl9P6JMmHqPZBis1iDsvh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9o87CmA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9o87CmA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FF31F000FF;
	Mon, 28 Sep 2026 09:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790589469;
	bh=1QBnIbf+jNE8TlKzKlf8bIJjfHD2KMxATClcyBhRnek=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=B9o87CmAm3G0Y00Zn1JDMEcuRY7Dk87FWsvIwrJlnp2adAbZZbaoaEzSi9eegDub/
	 i34a5vsahpTjTWLjyagm+ObBqDPjIplEuJ4DELiwuJf6uiYj6993qVHKPcFiueEo4Z
	 +GFIbp9v2TznI5P2SlfiitZP+825z0sO4k75DPuCZju4v42RHX1edAynDshlvQ2fn0
	 SQELmlMOiZMyfFKYz3UrHKZOgak12Kw9AMUhUVgqpBHUQeKeb8VYrF9wZY7FO4yw35
	 2I2chEdxVEMqLykcpRDy74k9irF7AUWjTgTgUwndFlMFk+omqIKOmgEkglkxdCe1uv
	 tusLvZDgZnkKQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, David Gow
 <david@davidgow.net>
Cc: FUJITA Tomonori <tomo@flapping.org>, gary@garyguo.net, ojeda@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com, Yury Norov
 <yury.norov@gmail.com>
Subject: Re: [PATCH v4 2/2] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
In-Reply-To: <CANiq72mUWhzwZhDpDTj7awy=WN4vcSKF+PKbbAA1YTMX-sW2Ew@mail.gmail.com>
References: <N-9g7-JCEv-O-X7-hryv99BRSZvftBvpmaAmWdwRp9b9Gi64FWr6GAtnUToRHlX86lCBJgEKPQine1a1NsJcUg==@protonmail.internalid>
 <20260924232530.446588-3-tomo@flapping.org>
 <87zex52224.fsf@t14s.mail-host-address-is-not-set>
 <20260925.183924.808421603238938986.tomo@flapping.org>
 <CANiq72=iYeD0AZCRb6X_1BMR1OBxGrzy6j45ZAq5C41+giG5dA@mail.gmail.com>
 <87qzidu37b.fsf@t14s.mail-host-address-is-not-set>
 <mwZ5QOAAH713Vixdc6XoIRKsoUakuFaXJx9rQOIu2cZw9ahYfrCrrNkRLnwjFzE_EL8Cuu2xkfNEGu5-0Z92Zw==@protonmail.internalid>
 <CANiq72mUWhzwZhDpDTj7awy=WN4vcSKF+PKbbAA1YTMX-sW2Ew@mail.gmail.com>
Date: Mon, 28 Sep 2026 11:57:37 +0200
Message-ID: <87ecedu29a.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Mon, Sep 28, 2026 at 11:37=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
>>
>> I would prefer to just enable the tests as soon as kunit is enabled if
>> that is OK.
>
> Let me Cc David (and Yury) to see what he thinks -- the kernel
> probably wants to have at least a Kconfig for each test rather than
> having a default set that gets always enabled as soon as KUnit test, I
> think the question is mostly about how "wide" to make those Kconfigs.

I'm used to having all the rust tests enabled when I hack on rust stuff.
I would rather not have to go flick a ton of switches to enable all the
stuff.

I think that most users that enable rust+kunit will be fine with
enabling all rust kunit tests. I understand that there may be
environments like embedded platforms where this is not feasible. Could
we invert the situation so that we have one toggle to enable all our
tests but make it possible to opt out of this behavior?

RUST=3Dy
KUNIT=3Dy
RUST_ALL_KUNIT_TESTS=3Dy

That would be great.

Best regards,
Andreas Hindborg


