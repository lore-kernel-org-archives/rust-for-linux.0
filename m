Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C879125D202
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755593149; cv=none; b=kHNERspTJn2dOc09ibEMA/a5JiorZKpCIfwhlrtqENTpWa80dOJ9M4RevLy2GpVheqs46wja0l6xqu1zMtreJ7vqkzVaz+XXvDjUiSoT8RnapEIO5ywePjd2eLdTSKULoQL9txw9f1qTUcJUrwoXZPoz//slr6sc7r6XO+uYkcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755593149; c=relaxed/simple;
	bh=QCQ4VLkSYWBqqnAcjBhTIVS85lKDu260mnaEea+LbfQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KEfN4RT/mfpnHMlKh56Cla7RYyXnMyNJpmA5cpYobTSMnEGa5AAuOVlv6v/ZjOepiKo8KYEBqFMx0jSLrwouMYg5OemcERa9raN5mkUhRmrky8r1/ITzXIbyE2LNOABRZFPXgnyxoDg34DR0KCgMECpLh0aW+bOqQKikTokWICU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=p0XoHSCj; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="p0XoHSCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1755593144; x=1755852344;
	bh=Lqk/Lq78mdoheCSk5SMpLjr23GDoE0vleFgdSoHUaXk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=p0XoHSCjEUv3NE3LVuk+SNrvT7r70oXMqqcfe9Z5XAzNvPel2i6G7qxyldQKdZSVi
	 YibwPoeHhcji9n5toGFwEbhZIYNAV53n1Hcz7H+gA2ktGXFi2nbNlfV+qXUbiKQnqH
	 YuTvxgi3Vl4oLXsSorChLPZfHFE3o7BczLgFdOxA0o7qMdrkaGfrGY4xZnOE96sI6u
	 XoU3jgxbb5fM6MsEeAdCvz/JDNkVhYZE/MQOEbqAYsS7NF6mp2ofmT/j93DaT6P//W
	 xkgGl/Yr0NwZOKSS7Jp1GuNDl6/8i+eKxbeeQvIeU39BLL3WsF41n1jQ6EBY8PodyO
	 dJFLe2S3xfNQQ==
Date: Tue, 19 Aug 2025 08:45:38 +0000
To: Benno Lossin <lossin@kernel.org>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina+kernel@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/4] rust: types: Add Ownable/Owned types
Message-ID: <aKQ5rHqxOBEI2n4w@mango>
In-Reply-To: <DC69F17AFLB2.1KZ8JJUIH2CSP@kernel.org>
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me> <2OkNj7ab-vTaPaqMj_KRpIjaKTWgOW-F9Cn-CxnR12E6Dwg4lnjr6fx1vkjnoTx0boUeReeIVDbSyVFBWlYx7g==@protonmail.internalid> <20250618-unique-ref-v11-1-49eadcdc0aa6@pm.me> <87o6scdchf.fsf@t14s.mail-host-address-is-not-set> <aKMkvHAfDozzDjkB@mango> <DC5WOFIKX7VQ.30UNUNE37LOO5@kernel.org> <aKQT92ViZSL841rT@mango> <DC69F17AFLB2.1KZ8JJUIH2CSP@kernel.org>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 8ad0d1d446a53bbd25e128fc86bc75f98cc760fb
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250819 1026, Benno Lossin wrote:
> On Tue Aug 19, 2025 at 8:04 AM CEST, Oliver Mangold wrote:
> > On 250819 0027, Benno Lossin wrote:
> >> On Mon Aug 18, 2025 at 3:04 PM CEST, Oliver Mangold wrote:
> >> > On 250818 1446, Andreas Hindborg wrote:
> >> >> "Oliver Mangold" <oliver.mangold@pm.me> writes:
> >> >> > +impl<T: OwnableMut> DerefMut for Owned<T> {
> >> >> > +    fn deref_mut(&mut self) -> &mut Self::Target {
> >> >> > +        // SAFETY: The type invariants guarantee that the object=
 is valid, and that we can safely
> >> >> > +        // return a mutable reference to it.
> >> >> > +        unsafe { self.ptr.as_mut() }
> >> >> > +    }
> >> >> > +}
> >> >>
> >> >> I think someone mentioned this before, but handing out mutable
> >> >> references can be a problem if `T: !Unpin`. For instance, we don't =
want
> >> >> to hand out `&mut Page` in case of `Owned<Page>`.
> >> >>
> >> >
> >> > That was the reason, why `OwnableMut` was introduced in the first pl=
ace.
> >> > It's clear, I guess, that as-is it cannot be implemented on many cla=
sses.
> >>
> >> Yeah the safety requirements ensure that you can't implement it on
> >> `!Unpin` types.
> >>
> >> But I'm not sure it's useful then? As you said there aren't many types
> >> that will implement the type then, so how about we change the meaning
> >> and make it give out a pinned mutable reference instead?
> >
> > Making `deref_mut()` give out a pinned type won't work. The return type=
s of
> > deref() are required to match.
>=20
> I meant the changes that Andreas suggested.
>=20
> >> > Good question, I have been thinking about it, too. But it might
> >> > be, that it isn't needed at all. As I understand, usually Rust wrapp=
ers
> >> > are around non-movable C structs. Do we actually have a useful appli=
cation
> >> > for OwnableMut?
> >>
> >> Also, do we even need two different traits? Which types would only
> >> implement `Ownable` but not `OwnableMut`?
> >
> > I'm not 100% sure, but on a quick glance it looks indeed be safe to
> > substitute `OwnableMut` by `Unpin`.
>=20
> We just have to change the safety requirements of `OwnableMut`.

You mean of `Ownable`, when `OwnableMut` is removed? Yes. A good question
in that context is, what it actually means to have an `&mut Opaque<T>`
where `T` is `Unpin`. If that implies being allowed to obtain an `&mut T`,
it would we easy, I guess.

> > If we add `get_pin_mut(&mut self) -> Pin<&mut T>` as Andreas suggested,
> > it would be possible to obtain an `&mut T` anyway, then, if T is `Unpin=
`.
>=20
> Well the `DerefMut` impl still is convenient in the `Unpin` case.

I agree. What I meant is, it could not introduce an extra safety
requirement having it, if that indirect method can be used anyway.

But what I am wondering is, if we actually want to start using `Pin`
at all. Isn't `Opaque` currently used about everywhere pinning is needed?

Best,

Oliver

