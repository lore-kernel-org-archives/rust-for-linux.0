Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0786928DC4;
	Thu, 19 Feb 2026 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771508071; cv=none; b=K9sew9+UcL94JmcZB7VPzGW/6jB3NssdWbejaqHUv+jVTET1Pj6M7JYf2+h6UZxRky4sY1C+Pm+/OepkVa/6nJML82TPJGwDXI1NrflHigJwQaOQAlYA9ca3Grlv+Gc8clGJP3S4MKIATvngo1iOnC7V40fFVowll5NuuVWgb8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771508071; c=relaxed/simple;
	bh=aJZ/mr17wG4oKP3QODH5iw2pOXw9BBUp6LZiFWfnuj8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PjKv2d3EVvRr9kUkql/97ZwdhyZ2g/aRWJBxUbwlq7Ir+Jay7xWbzcv775eRsPqj2jDwL8nDxDEpJ0LUTFE/SM7ZA0uldDowwojjn6Wyx1Il8zDKQhGOG0HdQ3UPV4VZtbt4PskrYoO+4qOmvDGIR6Gx/Z71rB9D5b6XZBhOowY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+s6gsSH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+s6gsSH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6B9C4CEF7;
	Thu, 19 Feb 2026 13:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771508070;
	bh=aJZ/mr17wG4oKP3QODH5iw2pOXw9BBUp6LZiFWfnuj8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Q+s6gsSHY2C0e3EYltVLRDYhU0EZRf5uHG0VebcsWLWtkVRT0h5bJ/v5SAcK0D8W2
	 kCCCQ9LM8an9vpEORlLmopnD71ceOrL6b+X9BBKuL5Kt0AeLPCIFh7jomnqvSWK6TB
	 weoh/JqPPi79Xj0WpisMRD4lcSpI7xsycunE+i80lAdFf13qoKkgyWbq+lIAMqQr1M
	 NrOrKSekIHFvr/1XAmJZWjsqAYDb2X92XDYyyxDkE6FrF2q24+DKi3GDBEKvzvKdoz
	 +L4ZAjXbWR9SN5vDO/IfUdyZjmUABkbsvmdK/X3bexoz59bv4ewjbRQp0DwOQITfQ/
	 UjU4LH87nqgKA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, =?utf-8?Q?B?=
 =?utf-8?Q?j=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust: atomic: add fetch_sub
In-Reply-To: <CANiq72=JXKLwSDtS2TPr4zy=nEjKOPTKcG+Yg0U4u+GU07WwdA@mail.gmail.com>
References: <20260219-atomic-sub-v2-0-8bd99cadf26d@kernel.org>
 <20260219-atomic-sub-v2-1-8bd99cadf26d@kernel.org>
 <_8hfvoQyg_zOgqSUZ6ofUCsVStq_yF1EHRg9bO_Z_Wu1sB1bukaaHug4cMPx4wQRofuGHbJ3wy87_tASCfxjYA==@protonmail.internalid>
 <CANiq72=JXKLwSDtS2TPr4zy=nEjKOPTKcG+Yg0U4u+GU07WwdA@mail.gmail.com>
Date: Thu, 19 Feb 2026 14:34:21 +0100
Message-ID: <87qzqgamci.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Thu, Feb 19, 2026 at 1:20=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> +        fn fetch_sub[acquire, release, relaxed](a: &AtomicRepr<Self>, v=
: Self::Delta) -> Self {
>> +            // SAFETY: `a.as_ptr()` is valid and properly aligned.
>> +            unsafe { bindings::#call(v, a.as_ptr().cast()) }
>> +        }
>
> [ I see `fetch_add` does the same, so it is fine here in this patch
> for consistency, but I thought I would leave a note here anyway... ]
>
> The safety comment, as written, could be read as just saying something
> it is true without justifying it. Something like:
>
>     `a.as_ptr()` guarantees the returned pointer is valid and properly al=
igned.

I'll respin and fix this, for `fetch_add` as well. I can take the
spurious newline you mentioned on same occasion.


Best regards,
Andreas Hindborg


