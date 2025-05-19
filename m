Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E5D268FF9
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648533; cv=none; b=HNWBBS8xMA5N8K9J8rCoihrq7NgyzCP+nPGtIfM3JA0WSDQfH3q5DGSOOg/2XxjIGNE7/K7jOd5eNG7AvbO3UwKyxopnQC6mFrdFkidZap31EjH705P0hKpk31oQ/lcsLxC0xPa3hdoXQT1XduDlpg2H2PV1POvDGavdz/ro3Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648533; c=relaxed/simple;
	bh=rQQpqrNME2H8Qblc0tGvNdkMM+NKVXiTwvLVR2CoW9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7Cal0yrVPWId4Ev2UvMMH9t2IoJ5a40tuHAOvDPXJzontOab1dnVEmZklP3jxHT6qb05d3j0EchvKvlwqpqhG0zatc0flv9DdRj4gOXWO1BazrC9Q3wWG3BSSyGHQDE4BUDpZP/djIeZdbEkqDEJ6oZYtTNXIZEyL6K6KJLsf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDN0EWgm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDN0EWgm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EBA6C4CEE4;
	Mon, 19 May 2025 09:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747648533;
	bh=rQQpqrNME2H8Qblc0tGvNdkMM+NKVXiTwvLVR2CoW9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DDN0EWgmeMxeU7huzapccsUgTfIERaYFytDdKh0Erg3zqbqDWD4yfxxB5UKEj6/Qj
	 mrQt4aw5LmTa2x+PqUlMEzqa0zOw1JqXWixOOhwgukonnp8wOUht3Fy9RuRtySJGfY
	 VPwiTu9QQ8ePUbutsDCKbjFWlf62kQzW0B4PJbjkR/E3HXhFyL4+X2v9ivQZJrn+Io
	 p9803IEbxzaFBJqIOf2vANo6ZbxV4eGoDsqcAffhWZ+Ti1MEBlUNUc10oX+9lIZmo+
	 R5Opc19BlrvhPvR/0GrHiDGxD1UU/wXLYHjPGWxvNu177AzgfthD7JVxS6gf8OrZTE
	 FyYNVtsvl0ICA==
Date: Mon, 19 May 2025 11:55:28 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Marcelo Moreira <marcelomoreira1905@gmail.com>, benno.lossin@proton.me,
	ojeda@kernel.org, rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
Message-ID: <aCsAEJtkCKKhspnF@pollux>
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
 <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org>
 <aChczAWsPdmdeen3@pollux>
 <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org>
 <aCrwuQP46RFHxYB5@pollux>
 <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org>

On Mon, May 19, 2025 at 11:18:42AM +0200, Benno Lossin wrote:
> On Mon May 19, 2025 at 10:50 AM CEST, Danilo Krummrich wrote:
> > On Sat, May 17, 2025 at 09:09:02PM +0200, Benno Lossin wrote:
> >> On Sat May 17, 2025 at 11:54 AM CEST, Danilo Krummrich wrote:
> >> > On Fri, May 09, 2025 at 12:10:08PM +0200, Benno Lossin wrote:
> >> >> On Sat May 3, 2025 at 4:53 PM CEST, Marcelo Moreira wrote:
> >> >> >  /// # Invariants
> >> >> >  ///
> >> >> > -/// - The wrapped object `data` is valid if and only if `is_available` is `true`.
> >> >> > -/// - Access to `data` must occur only while holding the RCU read-side lock (e.g., via
> >> >> > -///   [`Revocable::try_access`] or [`Revocable::try_access_with_guard`]).
> >> >> > -/// - Once `is_available` is set to `false`, further access to `data` is disallowed,
> >> >> > -///   and the object is dropped either after an RCU grace period (in [`revoke`]),
> >> >> > -///   or immediately (in [`revoke_nosync`]).
> >> >> > +/// - `data` is valid if and only if `is_available` is true.
> >> >> > +/// - Access to `data` requires holding the RCU read-side lock.
> >> >> 
> >> >> I'm not sure what the correct wording here should be. The current
> >> >> wording makes the `revoke_internal` function illegal, as it doesn't hold
> >> >> the read-side lock, but still accesses `data`.
> >> >> 
> >> >> Maybe @Danilo can help here, but as I understand it, the value in `data`
> >> >> is valid for as long as the rcu read-side lock is held *and* if
> >> >> `is_available` was true at some point while holding the lock.
> >> >
> >> > IMHO, the RCU read lock is *not* a requirement, it's (for some methods) the
> >> > justification for how it is ensured that the `is_available` atomic cannot be
> >> > altered during the usage of `data`. So, it shouldn't be part of the type
> >> > invariants.
> >> 
> >> But the `is_available` atomic *can* be altered during the usage of
> >> `data`. And in that case it isn't clear to me how you still allow usage
> >> without relying on rcu.
> >
> > The only real rule is that the data is only valid as long as `is_available` is
> > true.
> >
> > Some functions - the safe ones, i.e. try_access(), try_access_with_guard(),
> > revoke() - ensure this by using RCU.
> >
> > Some other functions though - the unsafe ones, i.e. access() and revoke_nosync()
> > - leave it to the caller to ensure this, because sometimes the caller (such as
> > Devres) can give this gurarantee through other circumstances.
> >
> > So, the internal lock (RCU or any other kind of lock) isn't really part of the
> > type invariant, it's just one tool to uphold the type invariant. Another such
> > tool used by Revocable is `unsafe`, where we just require the caller to uphold
> > this invariant.
> 
> I get what you're trying to say, but the statement above about `data`
> being valid while `is_available` is `true` is not correct.

Why not? Please show me a case where `is_available` is false, but I can still
technically access data (without violating a safety requirement).

> When using
> RCU, you rely on the other functions like `revoke` to wait for the RCU
> grace period to end. At the moment nothing prevents them from not doing
> so, which means some safety documentation is wrong.

So, you're saying the problem is that with only the invariant above, revoke()
could be implemented without synchronize_rcu()?

If so, why does not need to be covered by a type invariant? The implementation
uses a lock to uphold its type invariant, if it doesn't it simply is a bug, no?

> Currently `RevocableGuard` also mentions RCU in its type invariants, is
> that correct?

Yes, we either access the data through the Guard (which is an RCU guard, but
could also be any other lock guard) or with unsafe accessors directly.

> >> > For instance, we also have the Revocalbe::access() [1], which is an unsafe
> >> > direct accessor for `data`. It has the following safety requirement:
> >> >
> >> > 	 "The caller must ensure this [`Revocable`] instance hasn't been revoked
> >> > 	 and won't be revoked as long as the returned `&T` lives."
> >> >
> >> > Which is equal to the caller must ensure that `is_available` is true, and won't
> >> > be altered to false as long as the returned reference lives.
> >> 
> >> Sure. We could add that it remains valid while `is_available` is true,
> >> but when it changes, the data is still valid until the end of the rcu
> >> grace period?
> >
> > Well, yes. But that would be true for every other lock as well. Let's say we'd
> > protect is_available with a mutex, the data would still be guaranteed to be
> > valid until the mutex is released. But for the reasons given above I don't think
> > the "protection method" is part of the invariant, so we should just say:
> > "remains valid at least as long as `is_available` is true".
> 
> No, in the mutex case, the `revoke` function could be implemented like
> this:
>     
>     struct Revocable<T> {
>         data: Mutex<Option<T>>,
>     }
> 
>     fn revoke(&self) {
>         self.mutex.lock().take();
>     }
> 
> Now, anyone accessing first has to check if the value still exists and
> while eg `try_access` is holding a `MutexGuard`, the data won't ever be
> revoked.
> 
> Now this is not a feasible implementation due to its performance &
> access pattern, but we could use the same design if we were to use a
> standard read-write lock (which would probably still be worse than RCU).
> 
> But since `try_access` is using `RCU` under the hood, anyone revoking
> **needs** to wait for the grace period to end after setting
> `is_available` to false. That's just how life is and so we need to
> document that in a type invariant (otherwise how is `try_access` going
> to know that what it does is correct?). So if you want `try_access` to
> be safe, the functions that don't respect the grace period need to
> mention RCU or somehow prevent users from accessing `try_access`.
> `revoke_nosync` at the moment does this with the safety requirement
> "Callers need to ensure that there are no more concurrent users of the
> revocable object." which is pretty vague to me.
> 
> I'd probably be able to help more with the safety comments if you can
> give me the different use-cases of this function, at the moment nothing
> calls that function.

While we were talking past each other a bit with this, I guess I get your point
now, i.e. with a Mutex for instance, revoke() couldn't get it wrong, since
there is no way to "bypass" the mutex, but with RCU, there is a away to bypass
the lock by just not calling synchronize_rcu().

So, you want a type invariant that guarantees the call to synchronize_rcu() to
justify the try_access() variants, correct?

However, this invariant does not need to be fulfilled for access() and
revoke_nosync(), because it would circumvent their purpose, i.e. cases where an
abstraction can prove that there can't be a concurrent user of the data or a
concurrent user revoking the data respectively.

An example of revoke_nosync() is the original Devres implementation [1].
However, this was re-worked with [2] to use a different logic that doesn't need
revoke_nosync() anymore.

Actually, "doesn't need revoke_nosync()" isn't exactly true. We would still
benefit from revoke_nosync(), but the implementation in [2] triggers the devres
C callback from drop() and the devres C callback calls revoke().

If we'd had a way to know that the devres C callback has been triggered due
drop(), we could use revoke_nosync() in this case as an optimization.

[1] commit 76c01ded724b ("rust: add devres abstraction")
[2] commit 8ff656643d30 ("rust: devres: remove action in `Devres::drop`")
