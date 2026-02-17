Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE192C11DB;
	Tue, 17 Feb 2026 19:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356380; cv=pass; b=TCrh56UNbZ5ROOgJKkZ9ka3hki7xJ5OCYRK5zDGPvTQk794gH+3oM2h7xH7k3BgVk99LWkdDZu6EhV87N13tK6QrW+EAHEfKVRHPTzAb1HOzxnCT5t7xOG0yfWL1khCY8Hzvo3RINrjTpX9+XkmlFyFluz9oYp3j4izccXbigy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356380; c=relaxed/simple;
	bh=1fd3WrbAKqAMiHTDY7qGyU4F4mkkONTiwJuplEIdiqU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=OEZr9s9rO8g1Or7+zhKvt7gVeh1lXonfoQ2duA+mcgIeFdXgzxXQxg9WW8eo67h/0Z8yCCz2k23RxwI2c2F8PgXH8M6mcNjdHHcvY1E/PPEdLa6K9sguJjmxS5KpL/GMRhv9vkwi0b10XRzJrdVWDzVGNd8mdhFhEktThBQuAFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=cAf3f6Jx; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="cAf3f6Jx"
ARC-Seal: i=1; a=rsa-sha256; t=1771356364; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QB6fEzFdT+H3j2QUYegYxw6as4THgYFcXdhTI5ltazrUxv8x2DnUmWW6t2Az5YDY55Uxsihu1TqIPl1D8G/BmG67uIED7NGRD95KdD9nf9GK2BRwtVgeZlJXrQdDuJk+VkUAQNj5hQ2QvEqwYzXlkUOsTmo7D0zyA4RYFLWoxkI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771356364; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rVb5Wti7+SRViRNGdi5q2WIzTk8XIl1/qUZe33FdJi4=; 
	b=Gvhj4OM84MLrXwROegkbJ6vMAdRIx8bCDGlBi+IE4oG+DheuO1cbmgLO5D8GdAVdTvbH/ZrhhoyUTk2VBN9j//36VBp8kobPzQJQHejrHuIOp0n7w1PRGnxTQQbp/ftv0TcwnBAcUNfGAOQJw1H0yE9J248F/OoK9PMWpHj28yk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771356364;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=rVb5Wti7+SRViRNGdi5q2WIzTk8XIl1/qUZe33FdJi4=;
	b=cAf3f6JxyfKzRqdRCLS8IEved43tL1gDPah5zR62YQ5velp3zW4/4YbYpl0mU+Xe
	BFw0xozxUTvcXtRCXCMjCQdKGYHCIuoeyrMlglyVsOs9CRP0oiYDP1oAj6GM6rF/Bgc
	yspj2S10GmgazDuBlv+xIzSQiF8VN4UnnqWuhyKM=
Received: by mx.zohomail.com with SMTPS id 1771356361492792.9127012484181;
	Tue, 17 Feb 2026 11:26:01 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: add a ring buffer implementation
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <87342zchjb.fsf@kernel.org>
Date: Tue, 17 Feb 2026 16:25:43 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C2E24EE0-9E18-461C-B387-4C29E3C1238C@collabora.com>
References: <20260215-ringbuffer-v1-1-9b359758a1b6@kernel.org>
 <8tULWyvUTjVb3E_HFZeW2maApI87eYLZungGtJ6k9CVT9J-C-TzIqx5ShmHA5vS30yqZRq7TmaBd0AIg5V7u6Q==@protonmail.internalid>
 <aZMMyJofDKualqXw@google.com>
 <873430es2p.fsf@t14s.mail-host-address-is-not-set>
 <C82DE0A6-17FC-4FD9-A272-257B59129A7E@collabora.com>
 <DGGFZX5JLZ22.3E1C8OVLNUDD6@kernel.org>
 <3D7C5FE8-CA15-418B-B2F7-D0EA4C37E1F0@collabora.com>
 <DGGGPFU9E9VD.8TT3HZUWS100@kernel.org>
 <U-BIeJ2bi8_e-eMwrNeo2r12w5jDIlGja9E3QSTg2bgL7JYAp1lJtO6sPCvTGQsL1PCfkEkMHfR5eLVG3JPJaw==@protonmail.internalid>
 <71F89D79-DBE1-4617-B58A-8552D0F2B3A2@collabora.com>
 <87pl63d6xx.fsf@t14s.mail-host-address-is-not-set>
 <L27n6JvhX0qd0nYoc7OSvJJHPPjYRdUHiXcqL4l9FKkG52HCMa-qnOS33uUJtDu_Iayel2UgLad7yc5cWsOGHQ==@protonmail.internalid>
 <DGHB1VEL6XTH.2W3803V58FUSH@kernel.org> <87342zchjb.fsf@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 17 Feb 2026, at 16:10, Andreas Hindborg <a.hindborg@kernel.org> =
wrote:
>=20
> "Danilo Krummrich" <dakr@kernel.org> writes:
>=20
>> On Tue Feb 17, 2026 at 11:02 AM CET, Andreas Hindborg wrote:
>>> We can change the code down the road, no problem. It's not set in =
stone
>>> just because we merge it without generic alloc support.
>>=20
>> Just to avoid any ambiguity, we should merge it with generic =
allocator support,
>> but aiming for arbitrary I/O backend support would be a bit too much.
>=20
> Right.
>=20
>>=20
>>> Perhaps one could imagine a simple API like in this patch being =
provided
>>> by a configurable implementation behind the scenes.
>>=20
>> Yeah, in the future we could implement the system memory specific one =
with a
>> type alias on top of the I/O backend agnostic one. But it remains to =
see if this
>> will actually work out properly or if it's even worth in terms of
>> maintainability etc.
>>=20
>> (E.g. one of the limitations that I've mentioned already is that I/O =
backends do
>> not support growing and shrinking of the backing memory. And I'm not =
yet sure if
>> they ever should.)
>=20
> This particular ringbuffer* implementation does not support changing =
the
> capacity after initialization, so I don't see that being an issue. For
> applications that need to scale the size of the ring dynamically, we
> could have another type. Or a generic parameter, if that makes sense.

Maybe at the risk of sounding a bit silly with the oversimplification =
here, but
isn=E2=80=99t this a mere problem of offering specific impls for =
backends where you
can reallocate? i.e.:

impl<T> RingBuffer<T, SomeActualBackend> {
  fn force_push() { ... } // realloc if needed; only implemented for =
backends where this is possible
}

>=20
> Best regards,
> Andreas Hindborg
>=20
>=20
> * VecDeque? This kind of structure has always been a ring to me.


