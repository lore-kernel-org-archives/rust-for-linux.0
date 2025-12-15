Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C266A291C3F;
	Mon, 15 Dec 2025 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765790169; cv=none; b=jUNgS/C5QvtG55NeAGJsFSyVxAIvMQfrLOXvZyo08Zyo4o2OdYuIWQXP0BORa/RKk/8BLS6roDt4GkRnqt/GBfmQImIfsof+Vh12VDUcUgayXVhDucPfwo0HlEu1qybpX4s/XiBz67iWb3X6tm8MfK5pE0J0AcnpPRdPcYPhd7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765790169; c=relaxed/simple;
	bh=vNkB/HA8hX6K5AnbCeDiVHb5JnK8UkNmAYFGN7kCTN0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jwst+K2wm7AqDRhtBz+BozgrgP/TkQiKSRqeCrwFhPe3/jZL03V+stuP1SWI+N8D3twiQO8xrCtV06faLtAcjq+wGlNCy07oGOMGVjL9C5IvjeoFl7KiYU1ntIhXrnMnkhcstXklSxCa2ulUXBzCve6RK23XhHtKxE8rbY5UHFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=gQKv5f6/; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="gQKv5f6/"
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net [IPv6:2a02:6b8:c1c:405:0:640:8814:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id 07D2481818;
	Mon, 15 Dec 2025 12:10:10 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 3APbApHLrmI0-z3ZKRY2N;
	Mon, 15 Dec 2025 12:10:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1765789808;
	bh=vNkB/HA8hX6K5AnbCeDiVHb5JnK8UkNmAYFGN7kCTN0=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=gQKv5f6/bUm/MW4eYzRVDXxdRTUm90NX07LAy/1zw2lJFKMhm/ZX5JX7Axr6rhKT4
	 tm6Y7qC2VbfNSpzsbjhZIpAeIwRONM2khCVInOEJLr14xyQ7gyplkqvXnDTItFsoc+
	 zjDc7dMi3E0OSTVhA7dcEs8ZDJVpo16ifC1B/4ww=
Authentication-Results: mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Mon, 15 Dec 2025 12:10:01 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, lossin@kernel.org, lyude@redhat.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, a.hindborg@kernel.org, tmgross@umich.edu,
 dakr@kernel.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 longman@redhat.com, felipe_life@live.com, daniel@sedlak.dev,
 thomas.hellstrom@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/6] rust: ww_mutex: add Mutex, AcquireCtx and
 MutexGuard
Message-ID: <20251215121001.5a0cc42c@nimda>
In-Reply-To: <aTFPRv2ahM_KA3AB@google.com>
References: <20251201102855.4413-1-work@onurozkan.dev>
	<20251201102855.4413-6-work@onurozkan.dev>
	<aTA6f8gK60h6qaHs@google.com>
	<86E0C8EE-393D-4C6A-9C28-BB036A1FFAD6@collabora.com>
	<aTFPRv2ahM_KA3AB@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 4 Dec 2025 09:07:18 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Wed, Dec 03, 2025 at 02:23:14PM -0300, Daniel Almeida wrote:
> >=20
> >=20
> > > On 3 Dec 2025, at 10:26, Alice Ryhl <aliceryhl@google.com> wrote:
> > >=20
> > > On Mon, Dec 01, 2025 at 01:28:54PM +0300, Onur =C3=96zkan wrote:
> > >> Yeah :(. We could get rid of them easily by keeping the class
> > >> that was passed to the constructor functions but that becomes a
> > >> problem for the from_raw implementations.
> > >>=20
> > >> I think the best solution would be to expose ww_class type from
> > >> ww_acquire_ctx and ww_mutex unconditionally (right now it
> > >> depends on DEBUG_WW_MUTEXES). That way we can just access the
> > >> class and verify that the mutex and acquire_ctx classes match.
> > >>=20
> > >> What do you think? I can submit a patch for the C-side
> > >> implementation. It should be straightforward and shouldn't have
> > >> any runtime impact.
> > >=20
> > > I think there is a better solution. We can create a different
> > > type for every single class, like how
> > > rust/kernel/sync/lock/global.rs creates a different type for
> > > every single mutex. Then, you know that the classes are the same
> > > since the class is part of the type.
> >=20
> > I don=E2=80=99t think this would work with the from_raw() functions. Wh=
at
> > class would you assign then? I think this is precisely what sparked
> > the current solution.
>=20
> There can be a way to create a type for a C-defined class, and
> from_raw() can require that you don't use the same Rust type for
> different C classes.
>=20

Do you think this is a better alternative? IMO it doesn't seem worth
it for what it's doing. Current approach adds less complexity and is
easier to maintain. It's not just helping from_raw functions, the class
validation is being much simpler without having to deal with storing
class references or creating new types.

I am holding off the next version because we don't have a clear
consensus on this.

- Onur

> Alice

