Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCA51EB1AF
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 08:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747644606; cv=none; b=TXbtIbwr/VAo8Bpk9loYJJE7ZZKtLEUOxkuttGdU+W4G5Vv7tszvjaDkY1AltwtI2pU0OwX7u6KhQnyTzJiVgCLjDw/sw5YOpXxydgc8W4gwhHWAxYrqu+wOl23kzm46naTT8UcWG4sYxv1KqpuEmcAuqe3PcJitxK14nHDV9YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747644606; c=relaxed/simple;
	bh=rUsQE9F7eEeqHfz2jMGJZ6+1DHvUBRLXaur6L+aM/vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtdAX2BvEmkqRkNurnXs3kJR+0Fr2E0p8InvGBhtZXJuTW1xOKchrVFs22ZU+VEh1jGbIZIsVpoIDrwOtw4EpPEEBd6qPSq1S1wv818C21mAx0hH+OQ+9yarFHse1sRmKSVQhDwYs2HeyY5gdWkx5MeXZL8+V8CZC60ySnnWjKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHs5fP9K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHs5fP9K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4406BC4CEE4;
	Mon, 19 May 2025 08:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747644606;
	bh=rUsQE9F7eEeqHfz2jMGJZ6+1DHvUBRLXaur6L+aM/vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WHs5fP9KL/YZMfGfUhV0A5kUcO/XOAVL6YlkuzdvzudV+0IuJRA+QPJWQ2qkkuN1s
	 xB8uF2dJSA5keEvm+Gfejcv/lhs3LjwFNBbOK3cPGuQOU5h1DoyP6/+z28hpDsQxAv
	 gBOrR9/2a77cRDeddt+/d7oarEiMWTMMRTM65rgc2k6iEmD8C2rhnHwfLkcFs7h9cV
	 qGna39HLrlMKdDxblDEyletTv24KeKd3RLFvCtfEsLo0PhaeKDcX86abWBme77K1Xg
	 GCz3HtOiTv+jSpz0gcVO77u90/01QBYHAdLfAMVf9JCuFLPvP5Jw1hbwCmzAVDW1jL
	 A+iw9ul+nKAqQ==
Date: Mon, 19 May 2025 10:50:01 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Marcelo Moreira <marcelomoreira1905@gmail.com>, benno.lossin@proton.me,
	ojeda@kernel.org, rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
Message-ID: <aCrwuQP46RFHxYB5@pollux>
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
 <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org>
 <aChczAWsPdmdeen3@pollux>
 <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org>

On Sat, May 17, 2025 at 09:09:02PM +0200, Benno Lossin wrote:
> On Sat May 17, 2025 at 11:54 AM CEST, Danilo Krummrich wrote:
> > On Fri, May 09, 2025 at 12:10:08PM +0200, Benno Lossin wrote:
> >> On Sat May 3, 2025 at 4:53 PM CEST, Marcelo Moreira wrote:
> >> >  /// # Invariants
> >> >  ///
> >> > -/// - The wrapped object `data` is valid if and only if `is_available` is `true`.
> >> > -/// - Access to `data` must occur only while holding the RCU read-side lock (e.g., via
> >> > -///   [`Revocable::try_access`] or [`Revocable::try_access_with_guard`]).
> >> > -/// - Once `is_available` is set to `false`, further access to `data` is disallowed,
> >> > -///   and the object is dropped either after an RCU grace period (in [`revoke`]),
> >> > -///   or immediately (in [`revoke_nosync`]).
> >> > +/// - `data` is valid if and only if `is_available` is true.
> >> > +/// - Access to `data` requires holding the RCU read-side lock.
> >> 
> >> I'm not sure what the correct wording here should be. The current
> >> wording makes the `revoke_internal` function illegal, as it doesn't hold
> >> the read-side lock, but still accesses `data`.
> >> 
> >> Maybe @Danilo can help here, but as I understand it, the value in `data`
> >> is valid for as long as the rcu read-side lock is held *and* if
> >> `is_available` was true at some point while holding the lock.
> >
> > IMHO, the RCU read lock is *not* a requirement, it's (for some methods) the
> > justification for how it is ensured that the `is_available` atomic cannot be
> > altered during the usage of `data`. So, it shouldn't be part of the type
> > invariants.
> 
> But the `is_available` atomic *can* be altered during the usage of
> `data`. And in that case it isn't clear to me how you still allow usage
> without relying on rcu.

The only real rule is that the data is only valid as long as `is_available` is
true.

Some functions - the safe ones, i.e. try_access(), try_access_with_guard(),
revoke() - ensure this by using RCU.

Some other functions though - the unsafe ones, i.e. access() and revoke_nosync()
- leave it to the caller to ensure this, because sometimes the caller (such as
Devres) can give this gurarantee through other circumstances.

So, the internal lock (RCU or any other kind of lock) isn't really part of the
type invariant, it's just one tool to uphold the type invariant. Another such
tool used by Revocable is `unsafe`, where we just require the caller to uphold
this invariant.

> > For instance, we also have the Revocalbe::access() [1], which is an unsafe
> > direct accessor for `data`. It has the following safety requirement:
> >
> > 	 "The caller must ensure this [`Revocable`] instance hasn't been revoked
> > 	 and won't be revoked as long as the returned `&T` lives."
> >
> > Which is equal to the caller must ensure that `is_available` is true, and won't
> > be altered to false as long as the returned reference lives.
> 
> Sure. We could add that it remains valid while `is_available` is true,
> but when it changes, the data is still valid until the end of the rcu
> grace period?

Well, yes. But that would be true for every other lock as well. Let's say we'd
protect is_available with a mutex, the data would still be guaranteed to be
valid until the mutex is released. But for the reasons given above I don't think
the "protection method" is part of the invariant, so we should just say:
"remains valid at least as long as `is_available` is true".

> > One valid way for the caller would be to wrap it into an RCU read side critical
> > section and check `is_available`. However, depending on the context, there are
> > also other justifications, e.g. [2].
> 
> For the justification in [2], you need a type invariant.

Do you mean that we should document the invariant that Devres does not revoke
things until the device it has been created with is unbound?

If so, I didn't think of documenting that, since it is the whole purpose of
Devres, but I agree, formally it should be documented.

> > [1] https://gitlab.freedesktop.org/drm/nova/-/blob/nova-next/rust/kernel/revocable.rs?ref_type=heads#L148
> > [2] https://gitlab.freedesktop.org/drm/nova/-/blob/nova-next/rust/kernel/devres.rs?ref_type=heads#L221
> >
> >> > +/// - Once is_available is set to false, further access to data is disallowed,
> >> > +///   and the object is dropped either after an RCU grace period (in [revoke]),
> >> > +///   or immediately (in [revoke_nosync]).
> >
> > Same here, RCU isn't a relevant factor for the type invariant IMHO. It's just
> > how part of the implementation guarantees to up-hold the invariant.
