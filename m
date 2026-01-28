Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB76B279DC3;
	Wed, 28 Jan 2026 18:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769624409; cv=none; b=giSf1aiAi67Jc1NcOBBP6lR6EvjJOtaCj+DPUHod+WL5j5l8/g0GTiSGam8cWSNR2fLcKXu/7WGgR19bzf+EaWJWMcJkhb/cJcKLIHeBrq0thTzASW0pTE7+C7X4HxGtCka9Z0atQI4YuItt8Q9PkV0gQuVsNGFXr74bxDRtBUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769624409; c=relaxed/simple;
	bh=k5wpj5uirkWErgEXdmqklwTpmpC6vF5iXRDZPd310Kw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nbB3Xzfhc/9MFLj82v6Lbkd0z0Yuf5kG8xwV6fqA2tV7jiasRGfpi06FOlJEg6QajJ6cP1VVPQm+xjydWWUf6tKodTNgPK9/QwvijsNO4xwQX9w4QZ0T6grFLogKhvc0FBeBGa5xwnP6I+goC75iCk+uHEF2hZ2U7i3an1Gyrrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bMBQJgsY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMBQJgsY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7C8C4CEF1;
	Wed, 28 Jan 2026 18:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769624409;
	bh=k5wpj5uirkWErgEXdmqklwTpmpC6vF5iXRDZPd310Kw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bMBQJgsYjeuljSVPPgFpFwru519SnZSuWXrlYEnQFTobYefVU1ZhnyqkhsmDOtVhZ
	 ChOrN6jnAHdbhvlxqil9CVfq67QAzsakWXrLVOSKBzdGXcPyYzoLv0pMXFkYD95VAE
	 UBSJGvmDkQGN5zPVuAPA/xgMzenOgxnvlYUPfU4lXhZY8x+Sb13e+TE51daZhZOBqg
	 IVzTOc+CQ8Lw/CeEbBJEWUacgFzuIpHho1v4xra+2jrZwx1WyAyHz2SG8Yo/i5dQe0
	 fX1t50pShySUHvfcnoB2zgSlhqcyRPxNiJXyC+5PML/bzeLfyuf6r6JXYLiXrkIOIH
	 DdNgR7QTty54g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6?=
 =?utf-8?Q?rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add `CacheAligned` for easy cache line alignment
 of values
In-Reply-To: <CANiq72=LyWx+5FbZ8H2FzoXNF9TaYAf06qA-Fo83pCxP_e-94Q@mail.gmail.com>
References: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
 <DG0AIMJXPP65.1PTB9I0KQS4LI@nvidia.com>
 <DG0AU8J5K0SA.2SJVFWGAI98RZ@garyguo.net>
 <AtcU3LSnxu31Kj-BeTYqyJ9MjNPgI8onSGwYpOAuEXkJmubCulCSr9PEYYWqX9PBQWF9bFU4ULbcKn0Jd9-o-w==@protonmail.internalid>
 <CANiq72=LyWx+5FbZ8H2FzoXNF9TaYAf06qA-Fo83pCxP_e-94Q@mail.gmail.com>
Date: Wed, 28 Jan 2026 19:19:56 +0100
Message-ID: <87ikclsipf.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Wed, Jan 28, 2026 at 3:41=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>>
>> Unfortunately `repr(align())` does not accept expression or macro invoca=
tions.
>> It's still possible with code-generation, but it'll be more tricky.
>>
>> On all archs that we do support today, I think the value is always 64. H=
owever
>> it'd worth putting a FIXME or TODO (or assertion, maybe?) in case new ar=
chs gets
>> addded where this isn't true.
>
> The docs need to also avoid mentioning 64 themselves; otherwise,
> someone may use this and rely on it being 64, i.e. not just cache
> aligned, but actually 64.
>
> If Andreas really wants a fixed 64 one, then perhaps we want several
> types like `Aligned64` etc.

I was considering all the options that are mentioned here, and I decided
to go with least effort and hear you all out. I agree that `Aligned64`
is better than `CacheAligned` when the alignment is fixed and the type
is available on all architectures.

How about we gate the module on architectures that use 64 byte cache
line? Then we can add a proc macro to generate later if we need to, or
we can gate in another module implementation.

Regarding generating the code, how would a proc macro for this work? Do
we have environment variable access in proc macros?


Best regards,
Andreas Hindborg



