Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D292718DF65
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Mar 2025 08:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741335775; cv=none; b=XP7uaNFURTAKbLXNKVEiDPxzthrYJJznFFoaSzR6FzopVrxoVC97L+vg+WlFitBNykK+GlwAtF/67ivdlLSEJ/FOGHK6rlw7VwI8JvnPkQi/M3PAs0XHEhKvPxOHDXSTA6a0U412DSvzG6lqDm22fijRkofODRyRuqN96UZuuZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741335775; c=relaxed/simple;
	bh=b7YL5yffCbBduPLDtVygzJBE/ZQsoAmboOTImBjLtgQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Nlh8KJ+k5XUAFMeK0Rc5cTBE2mBo7JWlJX24DNeFJ/NA+US736MXLRI271GZD3kGluFsrCPopkKxkwepO4Irq3I+zpI3Fqkll71bOfDYdxwZKHjpB6bfTQAqlKTv5gJYNZJA/EjopdjU9ROjxge+DUmi08+Qi4hEavtu8eMDZYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uMpRFHG9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uMpRFHG9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF235C4CED1;
	Fri,  7 Mar 2025 08:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741335775;
	bh=b7YL5yffCbBduPLDtVygzJBE/ZQsoAmboOTImBjLtgQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uMpRFHG91Pws2mqLHktCENJL0gMZQ9aA5zTgrvluVwOIvSqOGytv5v91V++eJhNVs
	 UdAtuU0flRe3+4zW0FdC0OIqYWYwMCXHz4Z2U6LgIMZ7NDtq2Od18UZOfvjYPdmb/6
	 H9f3HG8+3NKFO1oQo1HPzu0Tm2hrEYTeT1cDgm4xiK/xvY8ZlFt3pKfBlYWBJ9YmIj
	 DQf7+1qboHnzXV9jCx3a65Qv2z+HH03RP9aGXwgKp0+bcs24m1z5h3ydViG9loEpdF
	 MeNVvy2VnYjnY7+lWeshkqsQFXPHntif3Oqt1JrdyoPWf1rHwpyo6szv2QUoRC2eEj
	 /jEqd3h4OYEyg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Boqun Feng" <boqun.feng@gmail.com>,  "Dirk Behme"
 <dirk.behme@de.bosch.com>,  <rust-for-linux@vger.kernel.org>,
  <ojeda@kernel.org>,  <daniel.almeida@collabora.com>,  "Gary Guo"
 <gary@garyguo.net>,  "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH v3 2/2] rust: types: `Opaque` doc: Add some destructor
 description
In-Reply-To: <Z8lviMzPiMzjQIE3@google.com> (Alice Ryhl's message of "Thu, 06
	Mar 2025 09:48:56 +0000")
References: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
	<hVvs4-cEyMjFMKMMqergIA4OCAIJUIfXQGi2a_uisGZaLJHUWiNtGPNASjjeprDQrtNtasMOfTrRIiYwXE2zgg==@protonmail.internalid>
	<20250305053438.1532397-2-dirk.behme@de.bosch.com>
	<871pvbhqap.fsf@kernel.org>
	<eGDvv6uA00fjuGAgV8uknZos4J9VcrxQ7lk9brRpmdGEGIHYZlxk-ZRsGxXsr-SCZE6IVEuPKs5ko9gukJwo7Q==@protonmail.internalid>
	<Z8hwGGn9huDjyDWN@tardis> <87v7sn759g.fsf@kernel.org>
	<n0Uj2Z9c_20rMgNGkpHAbJ2IQS5ueeREBy6NHdwpCp8vg9V5JrRPJbP3xBFssuyDTcN1JUulMK3cwwDu0U0fkQ==@protonmail.internalid>
	<Z8icwtIpZ3PO9YcZ@boqun-archlinux> <87zfhz5gq2.fsf@kernel.org>
	<qqUZq9zoVyrNCibroh1KeNl3DjT08HYa0Qd5UGBQyN-uYa_Q2y7hLLmoMlQA9KaEkfB8YF1lTywfA1Y4KaeKuA==@protonmail.internalid>
	<Z8lviMzPiMzjQIE3@google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 07 Mar 2025 09:22:46 +0100
Message-ID: <87ldth5jxl.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Wed, Mar 05, 2025 at 10:07:33PM +0100, Andreas Hindborg wrote:
>> Without `Opaque` it is illegal to have aliased `&mut T`. With `Opaque`,
>> it is legal to have aliased `&mut Opaque<T>`. Or at least that is my
>> understanding.
>
> There's a really important wrinckle here. Having multiple aliasing &mut
> Opaque<T> does not trigger immediate UB, but that doesn't mean that such
> mutable references are safe to hand out to end-users of the API. The end
> user could call `swap` on the mutable references, and which would be
> really bad if it uses intrusive linked lists.
>
> I.e., you could only safely hand out Pin<&mut Opaque<T>> to the end-user
> of the API.
>
> But of course you still need the guarantee. Pin is just a library type,
> and if having a &mut T is immediate UB, then so is having a Pin<&mut T>.

Right, this is a really important caveat. Thanks.



Best regards,
Andreas Hindborg



