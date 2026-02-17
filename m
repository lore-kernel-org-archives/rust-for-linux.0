Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235B531B131;
	Tue, 17 Feb 2026 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771322531; cv=none; b=fMfu88+7KPDkYiohoGPdPnaTofZD0Cw72YwAU3fib18Q4HoTGATaewvPAqPaif9ax6o6ApDEcYoX1oblP7AvJZxMg6Gt9GFwfueVphKdkKvD4nUbFn7A/sUjDsqm6P1Fj3khecxSKQHId+AZu8tplaxxbaeINGDTvADRjUTEvWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771322531; c=relaxed/simple;
	bh=mfUgB7pxi9VZn9fgVVm2ojiA7IKBP8YzJaDdxro4DoU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TCZhr1PJf+n63uAMF6DnAs46PD03zAxd/+hxuPs4G/udmgsuB8XK7DA7rDpDU8OrQQofktU5Qp6dZUJNparLn3smR1+mTXfpmzrfEp7ch5DgkPKG5DcVrJ9a0FIrnj2RNCrfVM/hARhe/gS81thK9vhWlBzrDS9cN84l3Vlosuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q04pNKET; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q04pNKET"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FABFC4CEF7;
	Tue, 17 Feb 2026 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771322530;
	bh=mfUgB7pxi9VZn9fgVVm2ojiA7IKBP8YzJaDdxro4DoU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Q04pNKETo9uZ47mCT+9ojD9IMY+KEEYCpNtK5jNvzDaKjxndOXjgriKd+iUk45N24
	 UUHWRn63x3kmI5AdpbfR5bOBuDffhZtFKXNlNQs5nVFP8uNMh98gShiCZE48fM7thY
	 uehjSVq/e2fI2UnzarRJ6QInZQTLeS6NKHwnJ8G/yOL4eDb/V+OrxVD8NWSkDHdwVY
	 BrftClnmIH1Bh9ObZYdL1QEcGHuPGVFVd8eSTaFqIu2NJshDGt5aa86yMXKEx+npl2
	 WhxEgjXB/Q3dI15yn597mPD2uUpnZoh4oCriuks5rhiIyWY90Fw6U6KR5rMOvSnAVH
	 NHgWISQUXccSg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich
 <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add a ring buffer implementation
In-Reply-To: <71F89D79-DBE1-4617-B58A-8552D0F2B3A2@collabora.com>
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
Date: Tue, 17 Feb 2026 11:02:02 +0100
Message-ID: <87pl63d6xx.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Daniel Almeida" <daniel.almeida@collabora.com> writes:

>> On 16 Feb 2026, at 11:39, Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> On Mon Feb 16, 2026 at 3:21 PM CET, Daniel Almeida wrote:
>>>
>>>
>>>> On 16 Feb 2026, at 11:06, Danilo Krummrich <dakr@kernel.org> wrote:
>>>>
>>>> On Mon Feb 16, 2026 at 2:45 PM CET, Daniel Almeida wrote:
>>>>> With the allocation being handled by a separate component, I don=E2=
=80=99t think
>>>>> this is right. I think a better location is rust/kernel/io
>>>>
>>>> I'm not sure it is reasonable to ask people who just want a ringbuffer=
 in system
>>>> memory to take the indirection over an I/O ringbuffer implementation w=
ith
>>>> generic I/O backends choosing the system memory I/O backend.
>>>>
>>>> The proposed code is simple, without comments and tests, less than 100=
 lines of
>>>> code. The I/O infrastructure to make this happen is still WIP. So, I t=
hink it's
>>>> fine to land it as VecDeque for now.
>>>
>>>
>>> Well, this is a 100 line patch, but nothing was said of how much else w=
as going
>>> to be added on top in the future. In order to avoiding iterating on wha=
t I
>>> consider the wrong approach, I suggested that we start out in the right
>>> direction from the start, something that Andreas himself apparently agr=
eed to.
>>
>> I haven't seen any commitment to implement this in terms of generic I/O =
backends
>> from Andreas.
>>
>>>> Once we have the I/O backend infrastructure, a system memory I/O backe=
nd that
>>>> can deal with separate allocators *and* a ring buffer implementation t=
hat sits
>>>> on top of it, we can still revisit if it makes sense to take advantage=
 of
>>>> synergies.
>>>>
>>>> But for now this seems a bit premature in terms of delaying Andreas' w=
ork.
>>>
>>> IIUC, and feel free to correct me on this, the I/O backends are already=
 in the
>>> works. What is missing is a trivial system memory backend, and similarl=
y a
>>> ringbuffer implementation, which is the subject of this patch. I don't =
see this
>>> as a lot of work or an unreasonable ask.
>>
>> I think you are highly underestimating the consequences of this design.
>
> Might very well be the case, yeah.
>
>>
>> First of all, we're missing IoView (the generalization of IoSlice), whic=
h also
>> supports projection. Gary is working on this, but it is completely uncle=
ar when
>> it will land.
>>
>> Second, the system memory backend would have to be implemented and needs=
 to be
>> generic over arbitrary allocators. Also note that I/O backends do *not*
>> implement growing and shrinking of the backing memory, which would be an=
other
>> limitation for a derived VecDeque type to swallow. Alternatively, it is =
yet
>> another thing we have to implement.
>>
>> Then we have to implement the I/O ringbuffer type, which, due to being g=
eneric
>> over I/O backends, also has to consider the device lifecycle requirement=
s for
>> the corresponding I/O backend, which is additional complexity as well.
>>
>> So, don't get me wrong, it is a good idea and exactly in the sense of my=
 vision
>> of how powerful I want the I/O infrastructure to be, but for now, I thin=
k it is
>> unreasonable to ask Andreas to wait for all this.
>>
>> - Danilo
>
> Fine, let=E2=80=99s stick to VecDeque then. From what I am reading above,=
 there
> doesn=E2=80=99t seem to be any naks for a more general ring buffer type d=
ue to the
> current patch; it=E2=80=99s just not a good time yet. In which case, ther=
e=E2=80=99s no
> complaints from me.

We can change the code down the road, no problem. It's not set in stone
just because we merge it without generic alloc support.

Perhaps one could imagine a simple API like in this patch being provided
by a configurable implementation behind the scenes.


Best regards,
Andreas Hindborg


