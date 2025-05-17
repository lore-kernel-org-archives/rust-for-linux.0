Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827742C9A
	for <rust-for-linux@vger.kernel.org>; Sat, 17 May 2025 19:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747508947; cv=none; b=sWUFhwkahtRByQek2QW9N92nzfiDoyMJv+om9MInpF2h8E6ig8KMgICp3v1aHdAsZpt2rhv2f8pNrctYkF26urQ4r+h5cB+5G8drszmEgLsYdgLnoKTGRXiy9RyKZoWn/z8V/gDNqJqycLiocVYv4zw1Ho9mirQcSmo2VAB1FW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747508947; c=relaxed/simple;
	bh=giiFTAvo8R16w0FvI+CNVg05Te46rFwSFFDtIKhpE4s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=b0jcQeMW0YrNCtbCGH1EZDKfvJdxn2UQQIoMCMpHx2Tc/sA8hyGE/qVbRztmIIDP6PVI4u7jYizL7+uALwFLun9nQchF2GgGcslUQjD4+zKrPlmiQ79ff6cObOd048UeujMsbFe3USwP3krK4KYmpa0elFU3A1NGKQ3/MrNhnFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IR9/XvQk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IR9/XvQk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9C1C4CEE3;
	Sat, 17 May 2025 19:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747508946;
	bh=giiFTAvo8R16w0FvI+CNVg05Te46rFwSFFDtIKhpE4s=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=IR9/XvQkAzRrIlO/y4riEzzX89Lh0GNhb0InwxsPH+8vrn4k+fRGbD86BAhx/6DpN
	 V8j++Vtc3ZXDFkZESkRowCPxFJuBpJE40Kw3O07/yD4blnSSDhYUP1C4+4YcV59FaX
	 sfXoWpCb8FEcffbHFIMPt4GElrA2CrrfonApKqzfQWLkX4LUABxaKjixL1SxLexXJg
	 CwikRMvueYBOZ95FBvpq49K5LSKVPLs3LOfaJM+2zZg+5UENJZA8COfRFCzoZIsmJr
	 De7hYjKj6WdMCcajEpCFDCyGrOlT6bx3psU3k1c50aQjvPDPIGsheqUAkZjasyt4cO
	 tOfZjJAH8ve5w==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 May 2025 21:09:02 +0200
Message-Id: <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org>
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Marcelo Moreira" <marcelomoreira1905@gmail.com>,
 <benno.lossin@proton.me>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
X-Mailer: aerc 0.20.1
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
 <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org> <aChczAWsPdmdeen3@pollux>
In-Reply-To: <aChczAWsPdmdeen3@pollux>

On Sat May 17, 2025 at 11:54 AM CEST, Danilo Krummrich wrote:
> On Fri, May 09, 2025 at 12:10:08PM +0200, Benno Lossin wrote:
>> On Sat May 3, 2025 at 4:53 PM CEST, Marcelo Moreira wrote:
>> >  /// # Invariants
>> >  ///
>> > -/// - The wrapped object `data` is valid if and only if `is_available=
` is `true`.
>> > -/// - Access to `data` must occur only while holding the RCU read-sid=
e lock (e.g., via
>> > -///   [`Revocable::try_access`] or [`Revocable::try_access_with_guard=
`]).
>> > -/// - Once `is_available` is set to `false`, further access to `data`=
 is disallowed,
>> > -///   and the object is dropped either after an RCU grace period (in =
[`revoke`]),
>> > -///   or immediately (in [`revoke_nosync`]).
>> > +/// - `data` is valid if and only if `is_available` is true.
>> > +/// - Access to `data` requires holding the RCU read-side lock.
>>=20
>> I'm not sure what the correct wording here should be. The current
>> wording makes the `revoke_internal` function illegal, as it doesn't hold
>> the read-side lock, but still accesses `data`.
>>=20
>> Maybe @Danilo can help here, but as I understand it, the value in `data`
>> is valid for as long as the rcu read-side lock is held *and* if
>> `is_available` was true at some point while holding the lock.
>
> IMHO, the RCU read lock is *not* a requirement, it's (for some methods) t=
he
> justification for how it is ensured that the `is_available` atomic cannot=
 be
> altered during the usage of `data`. So, it shouldn't be part of the type
> invariants.

But the `is_available` atomic *can* be altered during the usage of
`data`. And in that case it isn't clear to me how you still allow usage
without relying on rcu.

> For instance, we also have the Revocalbe::access() [1], which is an unsaf=
e
> direct accessor for `data`. It has the following safety requirement:
>
> 	 "The caller must ensure this [`Revocable`] instance hasn't been revoked
> 	 and won't be revoked as long as the returned `&T` lives."
>
> Which is equal to the caller must ensure that `is_available` is true, and=
 won't
> be altered to false as long as the returned reference lives.

Sure. We could add that it remains valid while `is_available` is true,
but when it changes, the data is still valid until the end of the rcu
grace period?

> One valid way for the caller would be to wrap it into an RCU read side cr=
itical
> section and check `is_available`. However, depending on the context, ther=
e are
> also other justifications, e.g. [2].

For the justification in [2], you need a type invariant.

---
Cheers,
Benno

> [1] https://gitlab.freedesktop.org/drm/nova/-/blob/nova-next/rust/kernel/=
revocable.rs?ref_type=3Dheads#L148
> [2] https://gitlab.freedesktop.org/drm/nova/-/blob/nova-next/rust/kernel/=
devres.rs?ref_type=3Dheads#L221
>
>> > +/// - Once is_available is set to false, further access to data is di=
sallowed,
>> > +///   and the object is dropped either after an RCU grace period (in =
[revoke]),
>> > +///   or immediately (in [revoke_nosync]).
>
> Same here, RCU isn't a relevant factor for the type invariant IMHO. It's =
just
> how part of the implementation guarantees to up-hold the invariant.

