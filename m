Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47624570C2
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 12:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933845; cv=none; b=XenEMv+Ky8M0LWw2zCTIxw0hHT7BjYsewU0lERYWUI7tvkgc/HWhspzS+4BWa15EeuvfAtdoPzzEBhnNn7Rqang0PbZyaLM4TnjFSe6J+Eoz5ske9ZM+B3kNqt0sJ7xRAyb8pmP9iC73Mm00j1j5F9kVfRda6y6nFY1pvne8akE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933845; c=relaxed/simple;
	bh=iRAUITz8jzjD6ATZl8638qS0zF9HwZk15Iuyd1CL/rA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RzSweDFw9q2fTI1jjDqeCZ9lXuTtg7fbJALPYvZ/3Zgp5amYDPYIbTkGKcxw2fTizi6Q7Mv+UKlgetXz1ozNgh2bRA+skiMveIa0U/T+1MT4U6tmyVmur4VaOhAyNyX+9CmYnWDsLOUm1EwkiVbb/NXyhIxOUucOkVunuFm1cDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OrXY/r7z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OrXY/r7z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F641F00A3A;
	Wed,  5 Aug 2026 12:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785933844;
	bh=iRAUITz8jzjD6ATZl8638qS0zF9HwZk15Iuyd1CL/rA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=OrXY/r7zQHDQlGsxUvxKqFNG+JxWjxPWym5BGyTU5ASjP+R1ElvjM8+0HsQ7yhT9v
	 C0qxi8q2pmPu9mHvjKnmRnMuqjuwt7USfpCSYjZ6tIK1k/MzVNWDrKZ0M8/E1lfYEO
	 srotnRWhFahbDsFaSxMNaO+dpPyRc/pkgj0F6XnRYE+2Je9I3gh3hEaPr7fspmdpAy
	 4GGgyojpCwTpi4oklIRzKmtuwuyRDMV1W1e7u4LMypjkzkO74N/YWKRvEmJXQGOXNU
	 2/UwYVglsPAGTwu+jkhp15gbBpUeup4qxAXZJvF8MdjW4XAS//DsfMlTrj6lhtupgm
	 5IbtETXUwi40A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>, Boqun Feng <boqun@kernel.org>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker
 <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, Thomas Gleixner
 <tglx@kernel.org>, John Stultz <jstultz@google.com>, Stephen Boyd
 <sboyd@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>, rust-for-linux@vger.kernel.org,
 Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH v3] rust: time: warn and assert out-of-range input in
 fsleep() and udelay()
In-Reply-To: <87jyq497bs.fsf@t14s.mail-host-address-is-not-set>
References: <20260621105909.4055210-1-ekffu200098@gmail.com>
 <87jyq497bs.fsf@t14s.mail-host-address-is-not-set>
Date: Wed, 05 Aug 2026 14:43:25 +0200
Message-ID: <8733ws91qq.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Andreas Hindborg <a.hindborg@kernel.org> writes:

> Sang-Heon Jeon <ekffu200098@gmail.com> writes:
>
>> fsleep() documents out-of-range input as a bug but does not check
>> it, unlike udelay(). Add `debug_assert!` calls to catch it in
>> debug builds.
>>
>> Also add `pr_warn_once!` calls in both fsleep() and udelay() so
>> the clamped path is observable at runtime.
>>
>> Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>
>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
>
> Just FYI, I plan to queue this after the next merge window (for v6.4).

v7.4 of course.

Best regards,
Andreas Hindborg



