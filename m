Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E08500963;
	Sun, 11 Jan 2026 17:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768151199; cv=none; b=qW8ZRHZGhFCoXtnoYAttdnv42mzu1D/LUJFAMT0eXTac7WyGvDJdlaDdgcegbOI6fvm0SZA5VJ1RLytmogIqDjmS2otrypx3Y3G2V9Cr5KCmi1Le30U8OCJg1YaXIkI42HMMHpp7MWsNeiWSFIVhvvdblGII4eQ/nBE7u+d6hK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768151199; c=relaxed/simple;
	bh=/NMtZisAP9xrOC8AIvPH0lhzDe1OgxI6w+qhe2D9s9M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OMxRyfZoq7v1/5M3mgGPD+mj2eQZXTh8gswUGRvE2QbSTLb1y7R0ox8DVvvRVQKLh03CsVMpf7Jo4DQkSinbOFFbw9s3rOaiHoAqTTo8qwPDdWdd41rOhiOF4A04tNk4j1ti8LCS7r2reP1qwUufQi95/EOY4R95tZlze1mqIsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXtqTD3Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXtqTD3Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63795C4CEF7;
	Sun, 11 Jan 2026 17:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768151199;
	bh=/NMtZisAP9xrOC8AIvPH0lhzDe1OgxI6w+qhe2D9s9M=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=NXtqTD3Y5Q6kSI1qnrUOjgz5EV+XDqN9b21VF2fkExkeJiu2/JrmFdsjMkcfnka6U
	 cIlDvByA0HQQXUKwjgvYZyxaCvQ+ll6ydZJds+pJLQwf6fTBhlyEQq0nXsvD1oJrck
	 8ls123Vqxb6UtnX2Y+Upztzuz+B4ue69DutXOI1KjLkmRhtRuEkM+xbk6Q8XvcMnsm
	 Vt/7vkk2fcH4/lDjdS1uqrYZisyreqMaPA8UNPKoE1zROmPTf8Gqb0GzrnVbSIolw0
	 SoPiIBZrLxU3ksMaKuGggA7BnqMeSe7iB61IRVwAFdEQuMLGMdHC4Y4NOsGWUSY9zr
	 /XS2q5K3j+VEQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Jan 2026 18:06:34 +0100
Message-Id: <DFLXAD7L0MYF.39C9FW4KL917D@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Alban Kurti" <kurti@invicto.ai>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>
Subject: Re: [PATCH] rust: pin-init: add references to previously
 initialized fields
From: "Benno Lossin" <lossin@kernel.org>
To: "Janne Grunau" <j@jannau.net>
X-Mailer: aerc 0.21.0
References: <20250905140047.3325945-1-lossin@kernel.org>
 <20251203220516.GA592465@robin.jannau.net>
 <DEQZLZ9AVCZE.380X3OF521Y5L@kernel.org>
 <20251206170214.GE1097212@robin.jannau.net>
In-Reply-To: <20251206170214.GE1097212@robin.jannau.net>

On Sat Dec 6, 2025 at 6:02 PM CET, Janne Grunau wrote:
> On Sat, Dec 06, 2025 at 09:23:08AM +0100, Benno Lossin wrote:
>> On Wed Dec 3, 2025 at 11:05 PM CET, Janne Grunau wrote:
>> > On Fri, Sep 05, 2025 at 04:00:46PM +0200, Benno Lossin wrote:
>> >> After initializing a field in an initializer macro, create a variable
>> >> holding a reference that points at that field. The type is either
>> >> `Pin<&mut T>` or `&mut T` depending on the field's structural pinning
>> >> kind.
>> >
>> > just as a heads up: creating references broke part of the agx firmware
>> > init structs which uses a `#[repr(C, packed)]` struct as field in
>> > another struct. This fails with
>> >
>> > | error[E0793]: reference to packed field is unaligned
>> > |    --> ../drivers/gpu/drm/asahi/initdata.rs:722:28
>> > |     |
>> > | 722 |                       sub <- try_init!(raw::GlobalsSub::ver {
>> > |     |  ____________________________^
>> > | 723 | |                         unk_54: cfg.global_unk_54,
>> > | 724 | |                         unk_56: 40,
>> > | 725 | |                         unk_58: 0xffff,
>> > | ...   |
>> > | 731 | |                         ..Zeroable::init_zeroed()
>> > | 732 | |                     }),
>> > |     | |______________________^
>> > |     |
>> > |     =3D note: packed structs are only aligned by one byte, and many =
modern architectures penalize unaligned field accesses
>> > |     =3D note: creating a misaligned reference is undefined behavior =
(even if that reference is never dereferenced)
>> > |     =3D help: copy the field contents to a local variable, or replac=
e the reference with a raw pointer and use `read_unaligned`/`write_unaligne=
d` (loads and stores via `*p` must be properly aligned even when using raw =
pointers)
>> > |     =3D note: this error originates in the macro `$crate::__init_int=
ernal` which comes from the expansion of the macro `try_init` (in Nightly b=
uilds, run with -Z macro-backtrace for more info)
>> >
>> > This was easy enough to work around, I don't see how this embedding of=
 a
>> > `#[repr(C, packed)]` struct was necessary or at least helpful. The cod=
e
>> > is not expected to be included in the upstream driver so it no worth
>> > spending effort on this.
>> >
>> > I don't think it's likely that anyone else will run into this but I
>> > thought I mention it at least.
>> >
>> > The asahi driver also ran into the discussed variable shadowing issue =
(a
>> > variable was used to initialize a field of the same name and was later
>> > used to initialize another field). This was trivially fixed by renamin=
g
>> > the variable.
>>=20
>> Thanks for the report, I expected the latter kind of error, but was not
>> aware of the packed struct issue. If anyone needs a proper workaround
>> from pin-init, let me know.
>
> I spoke too soon. The packed struct issue is also present in the capture
> driver for Macbook microphones (aop_audio). Working around this issue
> there is less obvious and more effort. I think it might be enough to use
> unaligned u32 / u64 types already present in asahi [1].
>
> I'm not sure how prevalent packed structs are outside of Apple's
> firmware interfaces. I was surprised running into the same issue in a
> second driver but I shouldn't have been. There are plans for another
> driver where this isssue will be present.
>
> A workaround on pin-init side would be appreciated. Due to the nature of
> these packed structs I do not see a need to have access to previously
> initialized fields. An optional way to supress the references would be
> good enough for the cases I'm aware off.

FYI, I am merging a workaround this cycle, see [1]. Gary had a good idea
for a future patch series which I am tracking in [2].

Cheers,
Benno

[1]: https://lore.kernel.org/all/20260111122554.2662175-14-lossin@kernel.or=
g
[2]: https://github.com/Rust-for-Linux/pin-init/issues/98
