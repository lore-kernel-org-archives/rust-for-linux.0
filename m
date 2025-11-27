Received: from forward501a.mail.yandex.net (forward501a.mail.yandex.net [178.154.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE995307AC6;
	Thu, 27 Nov 2025 10:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764239017; cv=none; b=kX94wjV7LH1QYN8lutNfY8tSw9oH5RaRQ1gt7R3zoQFIrNu5CwIeQ6gkZj1CAw2ELDZ0Ac/lRkHyx8U0GdYH75f4pF0k1IW8azY6DvzA8AQs8RNUG9CNmfPpX2FKzh12UEClsD1eZspqRhkRbvSclvrnWeuth/72k/pAvtgR044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764239017; c=relaxed/simple;
	bh=A/yEuM5jmf3fNkBM9ZFZ39nTLuL4AMIZ6iRZslYP48I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nDjIBqoLZwLAp0Y4703thizi2d3pXhXQanhCcecxpAVR7jGzgHfeAplOJ4YFI8h6KEhUdoKmfcaS3wu9DWGEY9dFp8YX0XaDTgKw2dJO4UEBoB6AvxzTqDkNFljTjoPXHxyhUzVBPaFvL8NLcQPad8ea+NJHDmGypeztNd8g/ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=Xy+vJzxV; arc=none smtp.client-ip=178.154.239.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="Xy+vJzxV"
Received: from mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net [IPv6:2a02:6b8:c2d:6c0a:0:640:c879:0])
	by forward501a.mail.yandex.net (Yandex) with ESMTPS id D31BB80BF9;
	Thu, 27 Nov 2025 13:16:13 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 8GbQwB9LtW20-Ol2W41kW;
	Thu, 27 Nov 2025 13:16:12 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1764238573;
	bh=A/yEuM5jmf3fNkBM9ZFZ39nTLuL4AMIZ6iRZslYP48I=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=Xy+vJzxVOdMpOJjo0D6abVhcnWWJU2MOFDJQi29xjJUuu2NVNVwmdGdo2OjaXU82x
	 u4m8S29gyyfWBWLelz+h0tgMmddI6Um7rt6uH5FjjTnHEOm/dyJJjW0N7qhTvrwKor
	 9nMNU5Bbma4lF6SGLVpApUgS6RwTz1aid/RrOy58=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Thu, 27 Nov 2025 13:16:06 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, lossin@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 longman@redhat.com, felipe_life@live.com, daniel@sedlak.dev,
 bjorn3_gh@protonmail.com, daniel.almeida@collabora.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/6] rust: ww_mutex: implement LockSet
Message-ID: <20251127131606.58d86291@nimda.home>
In-Reply-To: <6372d3fa58962bcad9de902ae9184200d2edcb9b.camel@redhat.com>
References: <20251101161056.22408-1-work@onurozkan.dev>
	<20251101161056.22408-6-work@onurozkan.dev>
	<92563347110cc9fd6195ae5cb9d304fc6d480571.camel@redhat.com>
	<20251124184928.30b8bbaf@nimda>
	<6372d3fa58962bcad9de902ae9184200d2edcb9b.camel@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Nov 2025 16:35:21 -0500
Lyude Paul <lyude@redhat.com> wrote:

> On Mon, 2025-11-24 at 18:49 +0300, Onur =C3=96zkan wrote:
> > >=20
> > > I wonder if there's some way we can get rid of the safety contract
> > > here and verify this at compile time, it would be a shame if every
> > > single lock invocation needed to be unsafe.
> > >=20
> >=20
> > Yeah :(. We could get rid of them easily by keeping the class that
> > was passed to the constructor functions but that becomes a problem
> > for the from_raw implementations.
> >=20
> > I think the best solution would be to expose ww_class type from
> > ww_acquire_ctx and ww_mutex unconditionally (right now it depends on
> > DEBUG_WW_MUTEXES). That way we can just access the class and verify
> > that the mutex and acquire_ctx classes match.
> >=20
> > What do you think? I can submit a patch for the C-side
> > implementation. It should be straightforward and shouldn't have any
> > runtime impact.
>=20
> I would be fine with this, and think this is definitely the right way
> to go
>=20

It would be great to reach a consensus on this (whether we should send a
patch to the C side or instead pass the Class to the from_raw functions
without modifying the C code).

-Onur=20

> >=20
> > > > +=C2=A0=C2=A0=C2=A0 ///
> > > > +=C2=A0=C2=A0=C2=A0 ///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Ok(())
> > > > +=C2=A0=C2=A0=C2=A0 ///=C2=A0=C2=A0=C2=A0=C2=A0 },
> > > > +=C2=A0=C2=A0=C2=A0 ///=C2=A0=C2=A0=C2=A0=C2=A0 // `on_all_locks_ta=
ken` closure
> > > > +=C2=A0=C2=A0=C2=A0 ///=C2=A0=C2=A0=C2=A0=C2=A0 |lock_set| {
> > > > +=C2=A0=C2=A0=C2=A0 ///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 // Safely mutate both values while holding the
> > > > locks.
> > > > +=C2=A0=C2=A0=C2=A0 ///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 lock_set.with_locked(&mutex1, |v| *v +=3D 1)?;
> > > > +=C2=A0=C2=A0=C2=A0 ///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 lock_set.with_locked(&mutex2, |v| *v +=3D 1)?;
> > > > +=C2=A0=C2=A0=C2=A0 ///
> > > > +=C2=A0=C2=A0=C2=A0 ///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Ok(())
> > > > +=C2=A0=C2=A0=C2=A0 ///=C2=A0=C2=A0=C2=A0=C2=A0 },
> > >=20
> > > I'm still pretty confident we don't need or want both closures and
> > > can combine them into a single closure. And I am still pretty sure
> > > the only thing that needs to be tracked here is which lock we
> > > failed to acquire in the event of a deadlock.
> > >=20
> > > Let me see if I can do a better job of explaining why. Or, if I'm
> > > actually wrong about this - maybe this will help you correct me
> > > and see where I've misunderstood something :).
> > >=20
> > > First, let's pretend we've made a couple of changes here:
> > >=20
> > > =C2=A0 * We remove `taken: KVec<RawGuard>` and replace it with
> > > `failed: *mut Mutex<=E2=80=A6>`
> > > =C2=A0 * lock_set.lock():
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - Now returns a `Guard` that executes `ww_mu=
tex_unlock` in
> > > its destructor
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - If `ww_mutex_lock` fails due to -EDEADLK, =
this function
> > > stores a pointer to the respective mutex in `lock_set.failed`.
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - Before acquiring a lock, we now check:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + if lock_set.failed =3D=
=3D lock
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Return=
 a Guard for lock without calling
> > > ww_mutex_lock()
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * lock_s=
et.failed =3D null_mut();
> > > =C2=A0 * We remove `on_all_locks_taken()`, and rename
> > > `locking_algorithm` to `ww_cb`.
> > > =C2=A0 * If `ww_cb()` returns Err(EDEADLK):
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - if !lock_set.failed.is_null()
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + ww_mutex_lock(lock_set.f=
ailed) // Don't store a guard
> > > =C2=A0 * If `ww_cb()` returns Ok(=E2=80=A6):
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - if !lock_set.failed.is_null()
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // This could only happen if we =
hit -EDEADLK but then
> > > `ww_cb` did not // re-acquire `lock_set.failed` on the next
> > > attempt
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + ww_mutex_unlock(lock_set=
.failed)
> > >=20
> > > With all of those changes, we can rewrite `ww_cb` to look like
> > > this:
> > >=20
> > > > lock_set| {
> > > // SAFETY: Both `lock_set` and `mutex1` uses the same class.
> > > let g1 =3D unsafe { lock_set.lock(&mutex1)? };
> > >=20
> > > // SAFETY: Both `lock_set` and `mutex2` uses the same class.
> > > let g2 =3D unsafe { lock_set.lock(&mutex2)? };
> > >=20
> > > *g1 +=3D 1;
> > > *g2 +=3D 2;
> > >=20
> > > Ok(())
> > > }
> > >=20
> > > If we hit -EDEADLK when trying to acquire g2, this is more or less
> > > what would happen:
> > >=20
> > > =C2=A0 * let res =3D ww_cb():
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - let g1 =3D =E2=80=A6; // (we acquire g1 su=
ccessfully)
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - let g2 =3D =E2=80=A6; // (enter .lock())
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + res =3D ww_mutex_lock(mu=
tex2);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + if (res) =3D=3D EDEADLK
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * lock_s=
et.failed =3D mutex2;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + return Err(EDEADLK);
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - return Err(-EDEADLK);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Exiting ww_cb(), so rust will=
 drop all variables in this
> > > scope:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + ww_mutex_unlock(mutex1) =
// g1's Drop
> > >=20
> > > =C2=A0 * // (res =3D=3D Err(EDEADLK))
> > > =C2=A0=C2=A0=C2=A0 // All locks have been released at this point
> > >=20
> > > =C2=A0 * if !lock_set.failed.is_null()
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - ww_mutex_lock(lock_set.failed) // Don't cr=
eate a guard
> > > =C2=A0=C2=A0=C2=A0 // We've now re-acquired the lock we dead-locked on
> > >=20
> > > =C2=A0 * let res =3D ww_cb():
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - let g1 =3D =E2=80=A6; // (we acquire g1 su=
ccessfully)
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - let g2 =3D =E2=80=A6; // (enter .lock())
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + if lock_set.failed =3D=
=3D lock
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * lock_s=
et.failed =3D null_mut();
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * return=
 Guard(=E2=80=A6); // but don't call ww_mutex_lock(),
> > > it's already locked
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - // We acquired g2 successfully!
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - *g1 +=3D 1;
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - *g2 +=3D 2;
> > >=20
> > > =C2=A0 * etc=E2=80=A6
> > >=20
> > > The only challenge with this is that users need to write their
> > > ww_cb() implementations to be idempotent (so that calling it
> > > multiple times isn't unexpected). But that's already what we do
> > > on the C side, and is kind of what I expected we would want to do
> > > in rust anyhow.
> > >=20
> > > Does this make sense, or was there something I made a mistake with
> > > here?
> >=20
> > Thanks a lot for analyzing and providing an alternative on this!
> >=20
> > However, collapsing everything into a single callback would require
> > the caller to self-police various disciplines like "don't touch gN
> > until gN+1 succeeded", which is exactly the foot-gun we are trying
> > avoid with 2 closures.
> >=20
> > Separating acquire and use logics not just simpler API to implement
> > (and provide), but also more effective compare to your example
> > here. With single closure we basically move API responsibility to
> > the users (e.g., do not run this part of the code in the loop, do
> > not access to any data behind any guard if all the locks aren't
> > taken yet, etc.), which is not a good thing to do, especially from
> > the high-level API.
>=20
> !!!!!
> OK - now I finally understand what I was missing, it totally slipped
> my mind that we would have this requirement. One thing I'm not sure
> this takes into account though: what about a situation where you
> can't actually know you need to acquire gN+1 until you've acquired gN
> and looked at it? This is at least a fairly common pattern with KMS,
> I'm not sure if it comes up with other parts of the kernel using ww
> mutexes.
>=20

