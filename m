Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203441FDE18
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 10:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740479818; cv=none; b=NBrcdL98XVuYdsvghduwPZmf0p1P5c+iEMryotMkD2oQDVxf1xrKriDvSVa2E8SkFzvUORW95PcIVekaJzl4i8bhmVDauurfJRa1W/i627O0s04AwwY9oIsb9QbJVWoB+PpMiVv5jJ8RJN2+vdf3AFCLhocva3bLmz910WtFOdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740479818; c=relaxed/simple;
	bh=Ekfy5t2+AnwD9Ib8TYPstbTl6XFvkAmIEDzshxQlttY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GpEJzEFyRYUQIuqujXjsOJgFY8gCa1j/HuKzM3KwyY7pjxOGVVzU6WLWSYhzSNDUubn9HfpIkZx11mEFQGidyoXIxvqchqsY0vKhQHm6zC+DENxw8E3gp7PIV1htuYTpg6AIrbytc1oCZL73pPreAIu8oW/Wxkpia9QDjlk0BM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8Jl5ZvZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8Jl5ZvZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3ACFC4CEDD;
	Tue, 25 Feb 2025 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740479817;
	bh=Ekfy5t2+AnwD9Ib8TYPstbTl6XFvkAmIEDzshxQlttY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=A8Jl5ZvZJIpACXE4eNVO8xgwJVMx9DwYOsoUCuv+IsnLbMWiJAh8WhU15L6bYuI9R
	 PDDgm3BawGeGVwCSXkT75yqGbTEEM4C34JaLlkGOwDd7ALlgdRrA2Wo+AJGdlX8Y0W
	 ewySyxXKTHKsJselYzMLRJ6I256AAs9Ibex1saq+HiqLgu2dA9IteUHEOUpvK6hSt0
	 UFMPjVAEjoVpWosY/5eOO2VFg/YgcZNvBWVDta0NLcci60MMu+nySKcSFsA0AGhovY
	 B+QsUKXYX9siEaC1QB1F431boRWT1nCtN0+0xMEQPLqNMs83/7R3APKnXYty/hJNoG
	 7diZHNUMWNjdg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Cc: "Dirk Behme" <dirk.behme@de.bosch.com>,
  <rust-for-linux@vger.kernel.org>,  <ojeda@kernel.org>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  "Alice Ryhl"
 <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH v2 2/2] rust: types: `Opaque` doc: Add some destructor
 description
In-Reply-To: <CE22ECC5-135D-473D-AD79-A07510432A4A@collabora.com> (Daniel
	Almeida's message of "Tue, 25 Feb 2025 07:07:53 -0300")
References: <20250219055516.359454-1-dirk.behme@de.bosch.com>
	<qR15TFA5w7m-em7Om-XpDqJvZbPA4T-_wgdtpb2lzfqhHWXVz6MT3cIurrB2_JbUbNqqlffrtGTN8cSUrtTL1A==@protonmail.internalid>
	<20250219055516.359454-2-dirk.behme@de.bosch.com>
	<87seoae4u5.fsf@kernel.org>
	<sIRpnzf3y8_6biksXe5aWklTZ83XbfdBrVhcleCmFxXzkYVbLyHRFPRGUdzN-RyQud7qXRwhZaKLhcIFWIrr8A==@protonmail.internalid>
	<CE22ECC5-135D-473D-AD79-A07510432A4A@collabora.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 25 Feb 2025 11:36:47 +0100
Message-ID: <87eczmwbsw.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Daniel Almeida" <daniel.almeida@collabora.com> writes:

> Hi Andreas,
>
>> On 19 Feb 2025, at 05:06, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>> "Dirk Behme" <dirk.behme@de.bosch.com> writes:
>>
>>> In the discussion [1] some `Opaque` documentation updates have
>>> been proposed. In that discussion it was clarified that `Opaque`
>>> is intended to be used for (partial) uninitialized or changing C
>>> structs. And which consequences this has for using raw pointers
>>> or the destruction. Improve the `Opaque` documentation by adding
>>> these conclusions from that discussion.
>>>
>>> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
>>> Link: https://lore.kernel.org/rust-for-linux/F8AB1160-F8CF-412F-8B88-4C=
79D65B53A1@collabora.com/ [1]
>>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>>> ---
>>> Changes in v2:
>>> * Split patch into two (Miguel)
>>> * Improve commit message and subject (Miguel)
>>>
>>> rust/kernel/types.rs | 14 ++++++++++----
>>> 1 file changed, 10 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>>> index 8ed802444c594..08ff4949d2a61 100644
>>> --- a/rust/kernel/types.rs
>>> +++ b/rust/kernel/types.rs
>>> @@ -274,14 +274,20 @@ fn drop(&mut self) {
>>> /// [`Opaque<T>`] is meant to be used with FFI objects that are never i=
nterpreted by Rust code.
>>> ///
>>> /// It is used to wrap structs from the C side, like for example `Opaqu=
e<bindings::mutex>`.
>>> -/// It gets rid of all the usual assumptions that Rust has for a value=
 of type `T`:
>>> -///
>>> -/// * The value is allowed to be uninitialized (for example have inval=
id bit patterns: `3` for a
>>> -///   [`bool`]).
>>> +/// This is useful for C structs that are not fully initialized (yet) =
or might change their
>>> +/// content from C side at runtime. [`Opaque<T>`] gets rid of all the =
usual assumptions that
>>> +/// Rust has for a value of type `T`:
>>> +///
>>> +/// * The value is allowed to be uninitialized or invalid (for example=
 have invalid bit patterns:
>>> +///   `3` for a [`bool`]).
>>> +/// * By dereferencing a raw pointer to the value you are unsafely ass=
erting that the value is
>>> +///   valid *right now*.
>>> /// * The value is allowed to be mutated, when a `&Opaque<T>` exists on=
 the Rust side.
>>> /// * No uniqueness for mutable references: it is fine to have multiple=
 `&mut Opaque<T>` point to
>>> ///   the same value.
>>> /// * The value is not allowed to be shared with other threads (i.e. it=
 is `!Sync`).
>>> +/// * The destructor of [`Opaque<T>`] does *not* run the destructor of=
 `T`, as `T` may
>>> +///   be uninitialized, as described above.
>>
>> Thanks for clarifying the docs. What you write is correct, but I would
>> prefer a more terse and formal language, at least for the first
>> paragraph. Perhaps you can include the following in some form:
>>
>>> Opaque opts out of the following rust language invariants for the
>>> contained `T`:
>>>
>>> - Initialization invariant - the contained value is allowed to be
>>>  uninitialized and contain invalid bit patterns.
>>> - Immutability invariant - `Opaque` allows interior mutability.
>>> - Uniqueness invariant - `Opaque` allows aliasing of shared references.
>>>
>>> Further, `Opaque` is `!Unpin`.
>>
>> And then after that paragraph, you could elaborate with examples and so =
forth?
>>
>> Best regards,
>> Andreas Hindborg
>
> IMHO, your =E2=80=9Cterseness=E2=80=9D suggestion goes against the very i=
ntent of this patch.
>
> It takes something extremely clear, and places it behind some technical t=
erms.
>
> In as much as I agree with making things formal and professional, our fir=
st priority should
> be making sure that the docs for this type are clear as day, so that peop=
le do not misuse it
> to introduce bugs.
>
> Note that this discussion sprung up because it=E2=80=99s hard to understa=
nd what exactly this type
> does and when exactly it should be used. The code is conceptually simple,=
 but things like

Just to clarify, I do not suggest to yank the addition that this patch
provides. I think it is a valuable addition.

We need to strike a balance, which is why I suggested having the short,
to the point, more formal wording first - and then elaborate with the
more wordy, talkative, explanatory paragraph.

People who are very familiar with the rust language and/or relevant
invariants will immediately have the info they need after the first
"terse" paragraph.

People who need a bit more guidance can get that by reading further into
the docs.

>
>
>>> +/// * The destructor of [`Opaque<T>`] does *not* run the destructor of=
 `T`, as `T` may
>>> +///   be uninitialized, as described above.
>
> are 100% a pitfall that should be warned against in bold letters and plai=
n terms.
>

True. I would add it to the last line of my suggestion:

  Further, `Opaque` is `!Unpin` and will not run the drop method of the
  contained `T` when dropped.



Best regards,
Andreas Hindborg


