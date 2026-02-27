Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FDE42EEC5;
	Fri, 27 Feb 2026 15:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772204568; cv=none; b=brDxM4TFArGuuAa2SRqiZ4WKX7fKN0RIOSHqy/dxIkJUapXOPQNkXz7lgUn/0i5HpINtky5TvbwQm2HISWOFGZfwFTQTrddiT59grKXtIC8isKh0qUD+5s/9bzFTDTtpnHvYEiig/hQyombLcc8DufpxrYedlWW2EmziS78UUhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772204568; c=relaxed/simple;
	bh=kvMIQisaRJLNsW478B2KqAFIUA4FKqcNWzhuc3b3c1A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kdDVfm4/Hdr9d+V7Ns3c8Vlw/5ssi0PPdfVcEfJCMD39JMyUik9ITtO7jUw+ImrFPLOSZtFh6DN7e5LVvmXChn1YKCcXcvxNjj257w2jrzKDZ2lj95tfDs3VXwroLNfynou1BwELAcVIDzv/i0UIZQu6k/0Fw6fRw5CW55xvgZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F53Zai2i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F53Zai2i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E08C19423;
	Fri, 27 Feb 2026 15:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772204568;
	bh=kvMIQisaRJLNsW478B2KqAFIUA4FKqcNWzhuc3b3c1A=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=F53Zai2iVUeixXUxvGBOmbYj+Tht9HbK2wVJXgXbpotUzUnDdKDekST2timxJ3oNW
	 6RAUBG84jOfjgj7kSTdhWMYEsBWeCRg3WbAD6EriKFp4u8ZzDK/O7IZYumNFRbYawo
	 K16YpRDfsLhDlRvmUFy8Y8xlm1NI5DN7BKFGJkmt8voqMM1XqJE5Hr69GkAxIDH84n
	 mbjX6iq32uWPsLudliMWi8bSS8YRSD3Ha/NrVypBQmRlNWdoiSPvFF8mS9hLj9MbQC
	 6cEALXuBAPgKAt5CUFKYHrxnFSZ7OJJLyDq8AAQl1wsriRs/HrYDTJwCT3/vSkKJps
	 wrysB/7xEU7iA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 16:02:43 +0100
Message-Id: <DGPU3530XZA3.3SY27R9VIC9Y9@kernel.org>
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
 <DFLXAD7L0MYF.39C9FW4KL917D@kernel.org>
In-Reply-To: <DFLXAD7L0MYF.39C9FW4KL917D@kernel.org>

On Sun Jan 11, 2026 at 6:06 PM CET, Benno Lossin wrote:
> On Sat Dec 6, 2025 at 6:02 PM CET, Janne Grunau wrote:
>> On Sat, Dec 06, 2025 at 09:23:08AM +0100, Benno Lossin wrote:
>>> On Wed Dec 3, 2025 at 11:05 PM CET, Janne Grunau wrote:
>>> > On Fri, Sep 05, 2025 at 04:00:46PM +0200, Benno Lossin wrote:
>>> >> After initializing a field in an initializer macro, create a variabl=
e
>>> >> holding a reference that points at that field. The type is either
>>> >> `Pin<&mut T>` or `&mut T` depending on the field's structural pinnin=
g
>>> >> kind.
>>> >
>>> > just as a heads up: creating references broke part of the agx firmwar=
e
>>> > init structs which uses a `#[repr(C, packed)]` struct as field in
>>> > another struct. This fails with
>>> >
>>> > | error[E0793]: reference to packed field is unaligned
>>> > |    --> ../drivers/gpu/drm/asahi/initdata.rs:722:28
>>> > |     |
>>> > | 722 |                       sub <- try_init!(raw::GlobalsSub::ver {
>>> > |     |  ____________________________^
>>> > | 723 | |                         unk_54: cfg.global_unk_54,
>>> > | 724 | |                         unk_56: 40,
>>> > | 725 | |                         unk_58: 0xffff,
>>> > | ...   |
>>> > | 731 | |                         ..Zeroable::init_zeroed()
>>> > | 732 | |                     }),
>>> > |     | |______________________^
>>> > |     |
>>> > |     =3D note: packed structs are only aligned by one byte, and many=
 modern architectures penalize unaligned field accesses
>>> > |     =3D note: creating a misaligned reference is undefined behavior=
 (even if that reference is never dereferenced)
>>> > |     =3D help: copy the field contents to a local variable, or repla=
ce the reference with a raw pointer and use `read_unaligned`/`write_unalign=
ed` (loads and stores via `*p` must be properly aligned even when using raw=
 pointers)
>>> > |     =3D note: this error originates in the macro `$crate::__init_in=
ternal` which comes from the expansion of the macro `try_init` (in Nightly =
builds, run with -Z macro-backtrace for more info)
>>> >
>>> > This was easy enough to work around, I don't see how this embedding o=
f a
>>> > `#[repr(C, packed)]` struct was necessary or at least helpful. The co=
de
>>> > is not expected to be included in the upstream driver so it no worth
>>> > spending effort on this.
>>> >
>>> > I don't think it's likely that anyone else will run into this but I
>>> > thought I mention it at least.
>>> >
>>> > The asahi driver also ran into the discussed variable shadowing issue=
 (a
>>> > variable was used to initialize a field of the same name and was late=
r
>>> > used to initialize another field). This was trivially fixed by renami=
ng
>>> > the variable.
>>>=20
>>> Thanks for the report, I expected the latter kind of error, but was not
>>> aware of the packed struct issue. If anyone needs a proper workaround
>>> from pin-init, let me know.
>>
>> I spoke too soon. The packed struct issue is also present in the capture
>> driver for Macbook microphones (aop_audio). Working around this issue
>> there is less obvious and more effort. I think it might be enough to use
>> unaligned u32 / u64 types already present in asahi [1].
>>
>> I'm not sure how prevalent packed structs are outside of Apple's
>> firmware interfaces. I was surprised running into the same issue in a
>> second driver but I shouldn't have been. There are plans for another
>> driver where this isssue will be present.
>>
>> A workaround on pin-init side would be appreciated. Due to the nature of
>> these packed structs I do not see a need to have access to previously
>> initialized fields. An optional way to supress the references would be
>> good enough for the cases I'm aware off.
>
> FYI, I am merging a workaround this cycle, see [1]. Gary had a good idea
> for a future patch series which I am tracking in [2].

Update on this situation, we have a problem: packed struct and the
current version of pin-init are unsound, so I'll sadly have to remove
the current workaround attribute. That is because the `[Pin]Init` trait
requires an aligned pointer as the input. Fixing this requires
introducing a new hierarchy for the Init trait that supports misaligned
writes.

If you really require this feature, then we can work something out.
Would you mind giving me a pointer to the code that you're currently
using or that you would like to support?

Cheers,
Benno
