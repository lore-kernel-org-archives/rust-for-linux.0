Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC380399350
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781687825; cv=none; b=SHKEu9zn29RjTLMZG3vn7iIv/Pq+ebJ2hjDcvDb6wYgABCbNWYsnB8VJgm+98oq20VbbGTRxOyOIc6vnTuoxdI37YX6yy+a2m5Rt0ZspKPRZp2yDfBCDVmOAkOORLngsdmKyQGTzAv1HuXPUqm/tpR68qInMGwRNJp+8TsLGCYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781687825; c=relaxed/simple;
	bh=F2jo1dtekwbrXFYGZs+ziKvaY8l3hxgeWF5WTc2qeBk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KhBCVLCnGQZtaMAZZbeMK42DwAS6i50w3eVZ/1wMIualBgL+odwv+rb7rcsxzys0mNzuvBaCONVsZ05Yz+Ls0aS1LDJgkTA3Hmv7g67T6FBjCPuxqc3g7+wRZAw70ZQgPOv+JSvZ+35apqYPd8bSaCNHq9aUQr/zdcVTWZO8Hkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIVa7KV7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIVa7KV7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBE71F000E9;
	Wed, 17 Jun 2026 09:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781687824;
	bh=F2jo1dtekwbrXFYGZs+ziKvaY8l3hxgeWF5WTc2qeBk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=GIVa7KV7Z9RIenNeMi+ZZHpLFFKW0OO6VAb+zZs4jSEQJzglrHJZ7Y7pa8WUoztxU
	 YQOZNuf/nzWY5jSrHaFA+f3lc63Fucr4UYWQrkWJvSptya5d1FZByiY2mAL66RlsWp
	 fEi4MiTOLMynJnczw+YNgTVY9TazbvnuX/raX9UBjhHKzXUDXOoVo86bIWROdOQs1S
	 KSRyBIkqyiENywGdBGMeE/bLqem3+aajyHV6LF/OV2rUbd+WMxPAe7zPP/zblzPfhx
	 cKe8HI98gtwJ8eQzVb6YipTsDHIGofBEWvOxri8zGkmin4U//0ivE+W6B0C20xfUDU
	 fFsgY/Mzt+1qQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>, boqun@kernel.org,
 fujita.tomonori@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org
Cc: rust-for-linux@vger.kernel.org, Onur =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>
Subject: Re: [PATCH v2] rust: time: warn and assert out-of-range input in
 fsleep() and udelay()
In-Reply-To: <CABFDxMH8icJ2HAw0iTotg0ipYSGDX8ffiTv3e4SmXu1vQ798jg@mail.gmail.com>
References: <20260522172558.137415-1-ekffu200098@gmail.com>
 <EVf6DmYjRgc9Z8zBlhnr91GpRuf3N5tmTkn4IhjmvHkC-hsSR_A4DrkMA6ow09wNFGPk4Av7N6mSYu-DgiHwfQ==@protonmail.internalid>
 <CABFDxMH8icJ2HAw0iTotg0ipYSGDX8ffiTv3e4SmXu1vQ798jg@mail.gmail.com>
Date: Wed, 17 Jun 2026 11:16:56 +0200
Message-ID: <874ij1h6gn.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Sang-Heon Jeon" <ekffu200098@gmail.com> writes:

> Hello,
>
> On Sat, May 23, 2026 at 2:26=E2=80=AFAM Sang-Heon Jeon <ekffu200098@gmail=
com> wrote:
>>
>> fsleep() documents out-of-range input as a bug but does not check
>> it, unlike udelay(). Add `debug_assert!` calls to catch it in
>> debug builds.
>>
>> Also add `pr_warn_once!` calls in both fsleep() and udelay() so
>> the clamped path is observable at runtime.
>
> We're now in a new merge window.
> Gentle ping. Any feedback is welcome :)

It's on my list, I'll take another look as soon as possible.

Best regards,
Andreas Hindborg



