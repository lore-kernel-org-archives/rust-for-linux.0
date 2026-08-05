Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E66E3F9294
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 10:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926253; cv=none; b=soxmPWTcEro03KwLLetdITdgfhTJFSd5AD5YDhXxf6mWvVGW+TQZH4x5SvWowmMQoCOUOmClz/hZAzfKClsmrncl4R8mrE8dqmreOdc3T6eJ4UJjgyX6OK7+2NXMPQf8zytwqzHZGHZKmgpJ843JPtu4293o2MGp8b0el/OuIu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926253; c=relaxed/simple;
	bh=bMCBZZZTMGabUFGhKkbsRCYDwNPs1DxI5M8shDG8nNM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SqJ+P++OYbWVsKuDOVRmdix6OQOJ9DGaRXTUGKw1BF2g1of070G7aAFcT2X02UfQEax6sYu9jZb+zyzpGlPxdDoInyxaNzwHZ9pq8t1VEDnSK+TCA6F7xZgfl4NRVHHnywAgKLG1C2KNkKuSs8FtqWvPCVk4rAA2ok4qo0Z5hog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2ETZO9X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2ETZO9X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4021F000E9;
	Wed,  5 Aug 2026 10:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785926252;
	bh=bMCBZZZTMGabUFGhKkbsRCYDwNPs1DxI5M8shDG8nNM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=a2ETZO9XbV4Vpo1XhMJJPvWU72f+KFHGcmqyOVlhLkQ/d2DPAE+j7WQEGFJVjcGg8
	 J6Ueqt9PzJZe2Jv1wh6Ed2bdwWWXyG6Umo4Xzun5bfDkXZgBFOLqGNe23MrcbDpwyn
	 jWRwmSmRhqiIoedFpOVHKrsuaFONl57H8X2NTnHjwWKphOvHB1+Qh4nr57adPOCyEw
	 e5+K9l56Mp+6SaNNDkU32IRbuRgcZ+pPevhtIk2ELbzdUbyokv2+3pFWio90e+qX4z
	 S/C8ad6bVpv2Y6iOytI5yfYvDXJ2W/eTiDMNipQHux6Nx/0bQndIK0hoBoWhv2t+4n
	 BaUjcEq6cR8tQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, miguel.ojeda.sandonis@gmail.com
Cc: tomo@flapping.org, tomo@aliasing.net, ojeda@kernel.org,
 gary@garyguo.net, dirk.behme@de.bosch.com, aliceryhl@google.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun@kernel.org,
 dakr@kernel.org, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v3] rust: hrtimer: Restrict expires() to safe contexts
In-Reply-To: <20260716.124640.903442293670054204.tomo@flapping.org>
References: <20260715.202254.38223441240127219.tomo@flapping.org>
 <87a4rsgyqy.fsf@kernel.org>
 <CANiq72=XvdJhGcbfTF3yv_S9Ls7GbFL_fnwpoAUXmwFc6ND9Bg@mail.gmail.com>
 <20260716.124640.903442293670054204.tomo@flapping.org>
Date: Wed, 05 Aug 2026 12:37:19 +0200
Message-ID: <87mrv097kw.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

FUJITA Tomonori <tomo@flapping.org> writes:

> On Wed, 15 Jul 2026 17:09:21 +0200
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
>
>> On Wed, Jul 15, 2026 at 3:37=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
>>>
>>> Either way is fine for me, but Gary seems to gravitate towards the
>>> current solution, so maybe keep that? We can add a "// NOTE:" on the
>>> struct definition saying that soundness depends on all fields being OK
>>> with this caveat.
>>=20
>> If something actually breaks, then apart from the note, what about
>> `repr(transparent)` to enforce it?
>
> Yeah, it would help. It doesn't guarantee the field stays behind
> Opaque but I don't think anyone would swap Opaque<bindings::hrtimer>
> for a bare bindings::hrtimer.

Nothing is broken by this patch. The discussion pertains to preventing
unsoundness in the future if a field is added to `HrTimer` by refactor
or something.

Making `HrTimer` transparent prevents multiple fields, which is what we
want. Adding a field to `HrTimer` that is not `Opaque` would make
acquiring `&HrTimer` from `NonNull<HrTimer>` unsound, because we can
have `&mut HrTimer` existing at the same time.

I would suggest a new version with the transparent attribute added.


Best regards,
Andreas Hindborg


