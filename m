Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386C326C39D
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 09:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747646327; cv=none; b=hkpyYBiy3rj0505neQjPSJBTtpFMq5voYQVFJT/zhUwfIB78lgB22AiFAewc3DcGb0Kwazk1NOEpLrmKOf+9fN6BeXcZv9e481K/Yto2AVLYugalgvv7NUO0gzyQDA5cTYlfsnEswOFMeyenjkcPCFfvesvBbXqJVfCxBY1C9kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747646327; c=relaxed/simple;
	bh=YE/C305nDmz7ID2OtPz2dHncqjLBNKXDDUmTi73Mab8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bAZOy4JeL38akbCyhQCq1iM+Z1wkwhADH20yF85318o1BHS/qo+DfQ1Wp/Vie5AH3TYx7nswDwQaQ4kIADOmumSYTQeY7lO7kJEIFnGlc5ue5Meqte+N+Bal6kxnWHNJombI19QRNA1E+UFytlGAOs3068XTfbhfNu6MJYGGmQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zicmt7g+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zicmt7g+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03EC8C4CEE4;
	Mon, 19 May 2025 09:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747646325;
	bh=YE/C305nDmz7ID2OtPz2dHncqjLBNKXDDUmTi73Mab8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Zicmt7g+idBhI+k3CpY97fPV1oUlEELl+Ebx+SmfDcJ4AgZ+Zs62eycbVultPdOow
	 elnD5gcgs5/f9RDLo+oQySTtBLhwYetKfsR9+WAAujY/NIm6pdf7E5n/kwHuQqGKZu
	 9d6brOAS2JIKSD2F3zREznOd4daqZpZCa+7VoeV5qvRnPi3ehpcgX00QJnX+JICbXq
	 oIK9c5mcCXNUxYxsEx1ESgEbhBH8TG/ToQfG+NOyQtLF5toDGp6/oUUdeKatJBOQ7s
	 yukWIPj+6hDJ/GrsqJdvXdFlwnngV1B746MMLpf3X6HDyeKzfbXELYKZgeryasJSZL
	 S0g0Lo3VHsSdg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 11:18:42 +0200
Message-Id: <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org>
Cc: "Marcelo Moreira" <marcelomoreira1905@gmail.com>,
 <benno.lossin@proton.me>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
 <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org> <aChczAWsPdmdeen3@pollux>
 <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org> <aCrwuQP46RFHxYB5@pollux>
In-Reply-To: <aCrwuQP46RFHxYB5@pollux>

On Mon May 19, 2025 at 10:50 AM CEST, Danilo Krummrich wrote:
> On Sat, May 17, 2025 at 09:09:02PM +0200, Benno Lossin wrote:
>> On Sat May 17, 2025 at 11:54 AM CEST, Danilo Krummrich wrote:
>> > On Fri, May 09, 2025 at 12:10:08PM +0200, Benno Lossin wrote:
>> >> On Sat May 3, 2025 at 4:53 PM CEST, Marcelo Moreira wrote:
>> >> >  /// # Invariants
>> >> >  ///
>> >> > -/// - The wrapped object `data` is valid if and only if `is_availa=
ble` is `true`.
>> >> > -/// - Access to `data` must occur only while holding the RCU read-=
side lock (e.g., via
>> >> > -///   [`Revocable::try_access`] or [`Revocable::try_access_with_gu=
ard`]).
>> >> > -/// - Once `is_available` is set to `false`, further access to `da=
ta` is disallowed,
>> >> > -///   and the object is dropped either after an RCU grace period (=
in [`revoke`]),
>> >> > -///   or immediately (in [`revoke_nosync`]).
>> >> > +/// - `data` is valid if and only if `is_available` is true.
>> >> > +/// - Access to `data` requires holding the RCU read-side lock.
>> >>=20
>> >> I'm not sure what the correct wording here should be. The current
>> >> wording makes the `revoke_internal` function illegal, as it doesn't h=
old
>> >> the read-side lock, but still accesses `data`.
>> >>=20
>> >> Maybe @Danilo can help here, but as I understand it, the value in `da=
ta`
>> >> is valid for as long as the rcu read-side lock is held *and* if
>> >> `is_available` was true at some point while holding the lock.
>> >
>> > IMHO, the RCU read lock is *not* a requirement, it's (for some methods=
) the
>> > justification for how it is ensured that the `is_available` atomic can=
not be
>> > altered during the usage of `data`. So, it shouldn't be part of the ty=
pe
>> > invariants.
>>=20
>> But the `is_available` atomic *can* be altered during the usage of
>> `data`. And in that case it isn't clear to me how you still allow usage
>> without relying on rcu.
>
> The only real rule is that the data is only valid as long as `is_availabl=
e` is
> true.
>
> Some functions - the safe ones, i.e. try_access(), try_access_with_guard(=
),
> revoke() - ensure this by using RCU.
>
> Some other functions though - the unsafe ones, i.e. access() and revoke_n=
osync()
> - leave it to the caller to ensure this, because sometimes the caller (su=
ch as
> Devres) can give this gurarantee through other circumstances.
>
> So, the internal lock (RCU or any other kind of lock) isn't really part o=
f the
> type invariant, it's just one tool to uphold the type invariant. Another =
such
> tool used by Revocable is `unsafe`, where we just require the caller to u=
phold
> this invariant.

I get what you're trying to say, but the statement above about `data`
being valid while `is_available` is `true` is not correct. When using
RCU, you rely on the other functions like `revoke` to wait for the RCU
grace period to end. At the moment nothing prevents them from not doing
so, which means some safety documentation is wrong.

Currently `RevocableGuard` also mentions RCU in its type invariants, is
that correct?

>> > For instance, we also have the Revocalbe::access() [1], which is an un=
safe
>> > direct accessor for `data`. It has the following safety requirement:
>> >
>> > 	 "The caller must ensure this [`Revocable`] instance hasn't been revo=
ked
>> > 	 and won't be revoked as long as the returned `&T` lives."
>> >
>> > Which is equal to the caller must ensure that `is_available` is true, =
and won't
>> > be altered to false as long as the returned reference lives.
>>=20
>> Sure. We could add that it remains valid while `is_available` is true,
>> but when it changes, the data is still valid until the end of the rcu
>> grace period?
>
> Well, yes. But that would be true for every other lock as well. Let's say=
 we'd
> protect is_available with a mutex, the data would still be guaranteed to =
be
> valid until the mutex is released. But for the reasons given above I don'=
t think
> the "protection method" is part of the invariant, so we should just say:
> "remains valid at least as long as `is_available` is true".

No, in the mutex case, the `revoke` function could be implemented like
this:
   =20
    struct Revocable<T> {
        data: Mutex<Option<T>>,
    }

    fn revoke(&self) {
        self.mutex.lock().take();
    }

Now, anyone accessing first has to check if the value still exists and
while eg `try_access` is holding a `MutexGuard`, the data won't ever be
revoked.

Now this is not a feasible implementation due to its performance &
access pattern, but we could use the same design if we were to use a
standard read-write lock (which would probably still be worse than RCU).

But since `try_access` is using `RCU` under the hood, anyone revoking
**needs** to wait for the grace period to end after setting
`is_available` to false. That's just how life is and so we need to
document that in a type invariant (otherwise how is `try_access` going
to know that what it does is correct?). So if you want `try_access` to
be safe, the functions that don't respect the grace period need to
mention RCU or somehow prevent users from accessing `try_access`.
`revoke_nosync` at the moment does this with the safety requirement
"Callers need to ensure that there are no more concurrent users of the
revocable object." which is pretty vague to me.

I'd probably be able to help more with the safety comments if you can
give me the different use-cases of this function, at the moment nothing
calls that function.

>> > One valid way for the caller would be to wrap it into an RCU read side=
 critical
>> > section and check `is_available`. However, depending on the context, t=
here are
>> > also other justifications, e.g. [2].
>>=20
>> For the justification in [2], you need a type invariant.
>
> Do you mean that we should document the invariant that Devres does not re=
voke
> things until the device it has been created with is unbound?
>
> If so, I didn't think of documenting that, since it is the whole purpose =
of
> Devres, but I agree, formally it should be documented.

Yes, it should be a type invariant. The more obvious the safety docs are
the better.

---
Cheers,
Benno


>> > [1] https://gitlab.freedesktop.org/drm/nova/-/blob/nova-next/rust/kern=
el/revocable.rs?ref_type=3Dheads#L148
>> > [2] https://gitlab.freedesktop.org/drm/nova/-/blob/nova-next/rust/kern=
el/devres.rs?ref_type=3Dheads#L221
>> >
>> >> > +/// - Once is_available is set to false, further access to data is=
 disallowed,
>> >> > +///   and the object is dropped either after an RCU grace period (=
in [revoke]),
>> >> > +///   or immediately (in [revoke_nosync]).
>> >
>> > Same here, RCU isn't a relevant factor for the type invariant IMHO. It=
's just
>> > how part of the implementation guarantees to up-hold the invariant.

