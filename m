Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40E82FDC38;
	Sat, 28 Feb 2026 14:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772289786; cv=none; b=UYwKZnbxavg+J1sPgJGS0hNyC3z2fV0qinZzdahaQwbashzNMMPGEXvscjLCaMiONPjNv2KzUJ5h72cuZZFFC2QzfL6NxCGbFROAvBDzolpOi2dWJKLDGzyyqF5pSN3Sybpo1OPI1RvDEBMMfsdujqzB2IBB4hOztDbH/R1WGG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772289786; c=relaxed/simple;
	bh=YDu33MgSuQ3+dUdGb7ajhRoa309iIbnNMkMqEFlwwd4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Par0bFZShsZTzz+2CsPCOTc6I0H/cjGeRJ72hLAXBOZkA/SMQmI+F44sIeKASuZ0Wo9Ldda4APl952/AKjp69D/WHv/eh9wUVYO0+6kcEptat5SwrEJSteUQQhr04ECxym5s8EMdFr/n6nEIqI6WLHWfIj/rvS8CxADGIiaHY0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jov9lGAF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jov9lGAF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECF0C19421;
	Sat, 28 Feb 2026 14:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772289786;
	bh=YDu33MgSuQ3+dUdGb7ajhRoa309iIbnNMkMqEFlwwd4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Jov9lGAFEV7lehV9lfV6tSdvnRrYz6g7mF+xLjd1vQcjY7Fxlcg3FlI8pm5Md+pdq
	 DssPMFDMbGyWDyIzz3KOwmpvZv98yQVyO9ijDRDtI0UpVRuPgmgbssDPa7OEnUqahL
	 /T6vn2mX+J65XJ33h64ENtBMXa8naA4dlCI0IEhK0BbuhiqxP5M71r1JbXAqr4TFvf
	 fZczWMIfBr6lUYVY1SgvcW/jT1kS2CjuaHFgkz4TuURL5E0xgHvkgRF7iSoMELPFCU
	 YUcutOhvzW3YQKHoHR4oF9W7G5MJg/8YRoga57yDV3V9Qiz8n+Db3YUs4ZlFZLeruA
	 1zDtMr5PfFObA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 15:43:02 +0100
Message-Id: <DGQOAM62LGC8.2S5KJZBQU9OR8@kernel.org>
Subject: Re: [PATCH v3 2/2] rust: workqueue: add creation of workqueues
Cc: "Tejun Heo" <tj@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Benno Lossin" <lossin@kernel.org>, "Tamir
 Duberstein" <tamird@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
 <20260227-create-workqueue-v3-2-87de133f7849@google.com>
 <DGPUOSG5I4GM.1N5AWMP5ZFY4M@kernel.org> <aaHq9VpaVN4_hchW@google.com>
 <DGPZMZKAQ2TC.RA0BF64C639M@kernel.org> <aaLmzp0mMPpE45yQ@google.com>
In-Reply-To: <aaLmzp0mMPpE45yQ@google.com>

On Sat Feb 28, 2026 at 1:59 PM CET, Alice Ryhl wrote:
> On Fri, Feb 27, 2026 at 08:23:44PM +0100, Danilo Krummrich wrote:
>> On Fri Feb 27, 2026 at 8:05 PM CET, Alice Ryhl wrote:
>> > On Fri, Feb 27, 2026 at 04:30:59PM +0100, Danilo Krummrich wrote:
>> >> On Fri Feb 27, 2026 at 3:53 PM CET, Alice Ryhl wrote:
>> >> > +    #[inline]
>> >> > +    pub fn max_active(mut self, max_active: u32) -> Builder {
>> >> > +        self.max_active =3D i32::try_from(max_active).unwrap_or(i3=
2::MAX);
>> >>=20
>> >> The workqueue code prints a warning for max_active >  WQ_MAX_ACTIVE. =
Maybe use
>> >> debug_assert()?
>> >
>> > What's wrong with just making use of the C-side warning?
>>=20
>> IIRC, we have the same pattern in other Rust code that we use debug_asse=
rt()
>> when a value got clamped, e.g. in udelay().
>
> In udelay(), the clamping happens on the Rust side, so it makes sense
> that Rust is the one to warn about it.
>
> Here, the clamping happens in C code. To warn about it, I'd have to
> duplicate the existing C-side check to clamp in Rust.

That's fair, although I also think that it is not unreasonable. Given that =
this
uses the builder pattern, I think it would be nice to ensure that nothing
"invalid" can be built in the first place.

Maybe we can use a bounded integer?

>> >> It's also a bit unfortunate that alloc_ordered_workqueue() becomes
>> >> .max_active(1).
>> >>=20
>> >> At the same time having a separate ordered() method competes with max=
_active().
>> >>=20
>> >> Mybe a type state, i.e. Builder<Ordered> that doesn't have max_active=
()?
>> >
>> > Sorry I'm a bit confused by this. Why does an ordered() compete with
>> > max_active()?
>>=20
>> Because you could get an inconsistent state with __WQ_ORDERED and
>> max_active > 1.
>>=20
>> It also conflicts with sysfs() I think [1].
>>=20
>> [1] https://elixir.bootlin.com/linux/v6.19.3/source/kernel/workqueue.c#L=
7417
>
> And I guess the further argument is that we have a use-case for ordered
> workqueues?

In the context of

	GPU drivers often need to create their own workqueues for various
	reasons. Add the ability to do so.

I think we do.

Depending on the final implementation details and the driver it may be need=
ed by
the job queue.

They are also pretty common outside the scheduler use-case in GPU drivers. =
I
think panthor has one as well, so you might also need one in Tyr. In nova-c=
ore I
expect this to be used in MM code.

But even without that, I think it would be reasonble to consider ordered qu=
eues
for this abstraction, since alloc_ordered_workqueue() and
create_singlethread_workqueue() seem to have more users than the non-ordere=
d
constructors (without checking whether alloc_workqueue() is also used direc=
tly
to create ordered queues).
