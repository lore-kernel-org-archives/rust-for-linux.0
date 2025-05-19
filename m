Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7222749C4
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 11:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653036; cv=none; b=joGV9TGRU2kPxLPniA16mk9i5bmniKxWSaMiHH0mzEX1YrOq81XMJPs4WLSgbRdH0a1Rk6lP91n8+Jw7NTG+KLV6C51wFrQJqg4V4kW9LLcXHsIj29YVyi88w3WkUdVWLCNBSUO+L/ZbxLnKoOQfeQEWQuvWmsK3jebV0H6z0IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653036; c=relaxed/simple;
	bh=f6MDDTBj2O+7Vj+9fhsQRjFq+H7LntSJDTAFSANrup8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=cbxO434P5RT1sDbCx6oo1Ud2UWFapQpNCEzGRG8KzXrm2DzZ8S6bjy0fXxFTa05JLZPhvSjk7BVmlgXAaIGxJ4GvbqLpphLO6xJZQ40+427MW0RgK5e4S0gZJK1972RDN1KJFkbe0DJ7dysg3DjTbEHuyLTVYLORFB0+z2IrzAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zh/IjoM+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zh/IjoM+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DDCC4CEE4;
	Mon, 19 May 2025 11:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747653035;
	bh=f6MDDTBj2O+7Vj+9fhsQRjFq+H7LntSJDTAFSANrup8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zh/IjoM+lxmnImbRUjjrtg4ATF112x8m6luTgdwb5ADBX5B9IZKzWFKsuK+NTiE5B
	 A1MdKG+2Exqi3RR+57+PtycDznX+jwpPUGKQKCbj1lxYi1jVtgVhNUhEwXwY2IUXxj
	 p2U4kTB6bhfd77jVIHrdNvwtfcx7iGQezIqLwgbsgExLq5XWbnUFPALwvjO9jWe3aP
	 u72x1rQwUwbbCw3KuVEAM3MbWEnKdqFeVQEbNS5PrmlsGHi+Bp4h2Gpho++FreUyrp
	 kgOl4HVx3hfCZ7FBdvV/ukzSxNH+NBeEk3iNTrkcoS7WEyj9U9n2lK3+h0K8tH03D+
	 DUgttsD2uRIew==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 13:10:32 +0200
Message-Id: <DA03ANJMDOU2.1ZQWA6MIENVKD@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Marcelo Moreira" <marcelomoreira1905@gmail.com>,
 <benno.lossin@proton.me>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
X-Mailer: aerc 0.20.1
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
 <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org> <aChczAWsPdmdeen3@pollux>
 <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org> <aCrwuQP46RFHxYB5@pollux>
 <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org> <aCsAEJtkCKKhspnF@pollux>
In-Reply-To: <aCsAEJtkCKKhspnF@pollux>

On Mon May 19, 2025 at 11:55 AM CEST, Danilo Krummrich wrote:
> On Mon, May 19, 2025 at 11:18:42AM +0200, Benno Lossin wrote:
>> On Mon May 19, 2025 at 10:50 AM CEST, Danilo Krummrich wrote:
>> > On Sat, May 17, 2025 at 09:09:02PM +0200, Benno Lossin wrote:
>> >> On Sat May 17, 2025 at 11:54 AM CEST, Danilo Krummrich wrote:
>> >> > On Fri, May 09, 2025 at 12:10:08PM +0200, Benno Lossin wrote:
>> >> >> On Sat May 3, 2025 at 4:53 PM CEST, Marcelo Moreira wrote:
>> >> >> >  /// # Invariants
>> >> >> >  ///
>> >> >> > -/// - The wrapped object `data` is valid if and only if `is_ava=
ilable` is `true`.
>> >> >> > -/// - Access to `data` must occur only while holding the RCU re=
ad-side lock (e.g., via
>> >> >> > -///   [`Revocable::try_access`] or [`Revocable::try_access_with=
_guard`]).
>> >> >> > -/// - Once `is_available` is set to `false`, further access to =
`data` is disallowed,
>> >> >> > -///   and the object is dropped either after an RCU grace perio=
d (in [`revoke`]),
>> >> >> > -///   or immediately (in [`revoke_nosync`]).
>> >> >> > +/// - `data` is valid if and only if `is_available` is true.
>> >> >> > +/// - Access to `data` requires holding the RCU read-side lock.
>> >> >>=20
>> >> >> I'm not sure what the correct wording here should be. The current
>> >> >> wording makes the `revoke_internal` function illegal, as it doesn'=
t hold
>> >> >> the read-side lock, but still accesses `data`.
>> >> >>=20
>> >> >> Maybe @Danilo can help here, but as I understand it, the value in =
`data`
>> >> >> is valid for as long as the rcu read-side lock is held *and* if
>> >> >> `is_available` was true at some point while holding the lock.
>> >> >
>> >> > IMHO, the RCU read lock is *not* a requirement, it's (for some meth=
ods) the
>> >> > justification for how it is ensured that the `is_available` atomic =
cannot be
>> >> > altered during the usage of `data`. So, it shouldn't be part of the=
 type
>> >> > invariants.
>> >>=20
>> >> But the `is_available` atomic *can* be altered during the usage of
>> >> `data`. And in that case it isn't clear to me how you still allow usa=
ge
>> >> without relying on rcu.
>> >
>> > The only real rule is that the data is only valid as long as `is_avail=
able` is
>> > true.
>> >
>> > Some functions - the safe ones, i.e. try_access(), try_access_with_gua=
rd(),
>> > revoke() - ensure this by using RCU.
>> >
>> > Some other functions though - the unsafe ones, i.e. access() and revok=
e_nosync()
>> > - leave it to the caller to ensure this, because sometimes the caller =
(such as
>> > Devres) can give this gurarantee through other circumstances.
>> >
>> > So, the internal lock (RCU or any other kind of lock) isn't really par=
t of the
>> > type invariant, it's just one tool to uphold the type invariant. Anoth=
er such
>> > tool used by Revocable is `unsafe`, where we just require the caller t=
o uphold
>> > this invariant.
>>=20
>> I get what you're trying to say, but the statement above about `data`
>> being valid while `is_available` is `true` is not correct.
>
> Why not? Please show me a case where `is_available` is false, but I can s=
till
> technically access data (without violating a safety requirement).

    let r: Arc<Revocable<i32>> =3D ...;
    let guard =3D r.try_access().unwrap(); // nobody else is holding a refe=
rence, so this can't fail

    let r2 =3D r.clone();

    // I know we don't have threads, but I don't want to have to look up
    // how to use the workqueue or something else...
    thread::spawn(move || {
        r2.revoke();
    });

    for _ in 0..10_000_000 {
        // do some non-sleeping work that takes a while
    }

    // now the thread above has executed `self.is_available.swap(false, Ord=
ering::Relaxed)`
    // in `revoke_internal` and is waiting for the `synchronize_rcu` call t=
o return.
    // but we can still access `guard`:

    pr_info!("{}", &*guard);

>> When using
>> RCU, you rely on the other functions like `revoke` to wait for the RCU
>> grace period to end. At the moment nothing prevents them from not doing
>> so, which means some safety documentation is wrong.
>
> So, you're saying the problem is that with only the invariant above, revo=
ke()
> could be implemented without synchronize_rcu()?

Indeed.

> If so, why does not need to be covered by a type invariant? The implement=
ation
> uses a lock to uphold its type invariant, if it doesn't it simply is a bu=
g, no?

I don't follow this sentence. `try_access` is relying on RCU and thus
anyone else accessing the value concurrently needs to respect that.

>> Currently `RevocableGuard` also mentions RCU in its type invariants, is
>> that correct?
>
> Yes, we either access the data through the Guard (which is an RCU guard, =
but
> could also be any other lock guard) or with unsafe accessors directly.
>
>> >> > For instance, we also have the Revocalbe::access() [1], which is an=
 unsafe
>> >> > direct accessor for `data`. It has the following safety requirement=
:
>> >> >
>> >> > 	 "The caller must ensure this [`Revocable`] instance hasn't been r=
evoked
>> >> > 	 and won't be revoked as long as the returned `&T` lives."
>> >> >
>> >> > Which is equal to the caller must ensure that `is_available` is tru=
e, and won't
>> >> > be altered to false as long as the returned reference lives.
>> >>=20
>> >> Sure. We could add that it remains valid while `is_available` is true=
,
>> >> but when it changes, the data is still valid until the end of the rcu
>> >> grace period?
>> >
>> > Well, yes. But that would be true for every other lock as well. Let's =
say we'd
>> > protect is_available with a mutex, the data would still be guaranteed =
to be
>> > valid until the mutex is released. But for the reasons given above I d=
on't think
>> > the "protection method" is part of the invariant, so we should just sa=
y:
>> > "remains valid at least as long as `is_available` is true".
>>=20
>> No, in the mutex case, the `revoke` function could be implemented like
>> this:
>>    =20
>>     struct Revocable<T> {
>>         data: Mutex<Option<T>>,
>>     }
>>=20
>>     fn revoke(&self) {
>>         self.mutex.lock().take();
>>     }
>>=20
>> Now, anyone accessing first has to check if the value still exists and
>> while eg `try_access` is holding a `MutexGuard`, the data won't ever be
>> revoked.
>>=20
>> Now this is not a feasible implementation due to its performance &
>> access pattern, but we could use the same design if we were to use a
>> standard read-write lock (which would probably still be worse than RCU).
>>=20
>> But since `try_access` is using `RCU` under the hood, anyone revoking
>> **needs** to wait for the grace period to end after setting
>> `is_available` to false. That's just how life is and so we need to
>> document that in a type invariant (otherwise how is `try_access` going
>> to know that what it does is correct?). So if you want `try_access` to
>> be safe, the functions that don't respect the grace period need to
>> mention RCU or somehow prevent users from accessing `try_access`.
>> `revoke_nosync` at the moment does this with the safety requirement
>> "Callers need to ensure that there are no more concurrent users of the
>> revocable object." which is pretty vague to me.
>>=20
>> I'd probably be able to help more with the safety comments if you can
>> give me the different use-cases of this function, at the moment nothing
>> calls that function.
>
> While we were talking past each other a bit with this,

Yeah I thought that as well. But I feel like we're getting closer to
mutual understanding :)

> I guess I get your point
> now, i.e. with a Mutex for instance, revoke() couldn't get it wrong, sinc=
e
> there is no way to "bypass" the mutex, but with RCU, there is a away to b=
ypass
> the lock by just not calling synchronize_rcu().

Exactly.

This difficulty makes a lot of sense, since we don't have a proper RCU
primitive yet (which has several reasons, one of them being that RCU
just has so many different applications). I guess `Revocable` is one
such use-case for RCU (but also should support circumventing it when
otherwise deemed correct).

> So, you want a type invariant that guarantees the call to synchronize_rcu=
() to
> justify the try_access() variants, correct?

I want a type invariant that allows `try_access` to give a valid pointer
to a valid `T` to the guard. (By the way, why doesn't the guard store a
`&T` instead of a raw pointer?)

> However, this invariant does not need to be fulfilled for access() and

Where is `access()` defined?

> revoke_nosync(), because it would circumvent their purpose, i.e. cases wh=
ere an
> abstraction can prove that there can't be a concurrent user of the data o=
r a
> concurrent user revoking the data respectively.

Yes. How about something like "`data` is valid while `is_available` is
true. It also is valid if the RCU read-side lock is being held and it
was taken while `is_available` was true."?

That should also cover the "nobody else is accessing this" case.

> An example of revoke_nosync() is the original Devres implementation [1].
> However, this was re-worked with [2] to use a different logic that doesn'=
t need
> revoke_nosync() anymore.
>
> Actually, "doesn't need revoke_nosync()" isn't exactly true. We would sti=
ll
> benefit from revoke_nosync(), but the implementation in [2] triggers the =
devres
> C callback from drop() and the devres C callback calls revoke().
>
> If we'd had a way to know that the devres C callback has been triggered d=
ue
> drop(), we could use revoke_nosync() in this case as an optimization.

Yeah that sounds like a plausible option. Given that, I think the
following kind of function could be useful on `Revocable`: a safe
`revoke_` function that takes `&mut self` and thus doesn't need to use
RCU (since we have a unique mutable reference, only we have access).

Do you have any other uses of `revoke_nosync` that do not have
(potential) access to `&mut Revocable`?

---
Cheers,
Benno

>
> [1] commit 76c01ded724b ("rust: add devres abstraction")
> [2] commit 8ff656643d30 ("rust: devres: remove action in `Devres::drop`")

