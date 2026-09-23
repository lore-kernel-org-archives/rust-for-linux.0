Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E4A376BC1
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 08:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151919; cv=none; b=RwpG/VnbzSmyTPVBEe6vKxujY19KeLwigk5tXTKRB6o+jCMVV0wtsXg9ct2igWa7XwSzR+NnmZwwB7feljDncBTujKZJ0eNsDDJ57FeF0pA3kTTTRnsUREjFO/Vp0GoccgBjRlQaGNyzPipHVr8pVOOwcEKWa9apGrcMekuRBFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151919; c=relaxed/simple;
	bh=Uxvk52WKcMyK1u0bykB2LOLF6WM0T+d9H6iGxWdWNVQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=INiwRuipP0ge/t9YSWQooVGtJC+yul9JfXgvpLZRMo1tKEI+DxinF6zUhOcSs8fq1qvsp8DhYMmYAz0iOijr0BGOZcn8zILfpBKALm1J6yR0/TKlPq/mEpCLc8wuHLE73VTYck95ScUNW4IjXTHzIQ9u6U9jpU7xaS12oFhG1XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8fV0otd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8fV0otd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EEE1F000FF;
	Wed, 23 Sep 2026 08:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790151918;
	bh=eYuj1OwNtMSbeX90KrZrAuabgzBozIoXL1Qb6fFSPak=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=G8fV0otdUjdTjL7Qbieq+iMl8iRw9PA8yUKLpWaVBKQx/LGV135uacX8KEcU8ecKC
	 C1vm8W4ekNQ0KVsRdXvQ24qy10txHrHLiB+YWBWTcYJS5Jd/WhjBja5IPEou6bQITZ
	 XRZqMCWsqMqACZZMWL5/ctylHiY2uXUV5RmSWGrmUBl0cKDpIx8gNqX5C5Ts0hGr2n
	 yL8JWg7qMdY/d+ciKDKS4szJzjoQ85vmizQWlvPJstz9U5bfdUbgrm3C1cOkV9nX16
	 YbSQ7/9xFlMqbcpfFv/gnUkE/7P9hOV2yIVHqTqTLbj4zUycnZaMkP92pzeKA80nf9
	 r3EMOIocsx+8w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, boqun@kernel.org,
 fujita.tomonori@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: time: add debug assertions for out-of-range input
 in fsleep()
In-Reply-To: <CABFDxME98=KTERw17UYEs-5yKJvibXd-RZQ5rUOt7QgE4zk3vw@mail.gmail.com>
References: <qBPUAToMpl5CvVd22lUrJOgsVSuqVYKsjEHpbs1UK-VTO-vN8UFOa35fFMsYOHoBuUp9HcP65ljAxmLQMcGS9w==@protonmail.internalid>
 <20260508173827.1123011-1-ekffu200098@gmail.com>
 <87a4u96m4c.fsf@t14s.mail-host-address-is-not-set>
 <DIE4WB0VE43Z.2ALSYOD50N5X7@garyguo.net>
 <87pl346466.fsf@t14s.mail-host-address-is-not-set>
 <DIE8AGXTZXBL.2RY8JCWNOD2HG@garyguo.net>
 <87mry85vh7.fsf@t14s.mail-host-address-is-not-set>
 <CABFDxME98=KTERw17UYEs-5yKJvibXd-RZQ5rUOt7QgE4zk3vw@mail.gmail.com>
Date: Wed, 23 Sep 2026 10:25:09 +0200
Message-ID: <87o6do2x3u.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sang-Heon Jeon <ekffu200098@gmail.com> writes:

> On Sun, May 10, 2026 at 2:44=E2=80=AFAM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> "Gary Guo" <gary@garyguo.net> writes:
>>
>> > On Sat May 9, 2026 at 3:36 PM BST, Andreas Hindborg wrote:
>> >> "Gary Guo" <gary@garyguo.net> writes:
>> >>
>> >>> On Sat May 9, 2026 at 9:08 AM BST, Andreas Hindborg wrote:
>> >>>> "Sang-Heon Jeon" <ekffu200098@gmail.com> writes:
>> >>>>
>> >>>>> fsleep() documents out-of-range input as a bug but does not check
>> >>>>> it, unlike udelay(). Add `debug_assert!` calls to catch it in
>> >>>>> debug builds.
>> >>>>>
>> >>>>> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
>> >>>>> ---
>> >>>>> Hello,
>> >>>>>
>> >>>>> I found this small inconsistency while reading the code. The same
>> >>>>> check was applied to udelay() [1] but does not seem to have been
>> >>>>> extended to fsleep(). Please let me know if I have misunderstood
>> >>>>> anything.
>> >>>>>
>> >>>>> [1] https://lore.kernel.org/all/20251103112958.2961517-2-fujita.to=
monori@gmail.com
>> >>>>>
>> >>>>> Best Regards,
>> >>>>> Sang-Heon Jeon
>> >>>>
>> >>>> Looks good to me. Could you add the warn_once and remove the todo as
>> >>>> well? And add the warn_once to udelay as well, so both functions ha=
ve
>> >>>> same shape.
>> >>>
>> >>> If `warn_once` is added then the debug assert would be unnecessary.
>> >>
>> >> It is different mechanisms in different situations, right?
>> >> `pr_warn_once` prints a warning once (and a stack trace depending on
>> >> kernel configuration?). It would be enabled in production environment=
s,
>> >> and it allows the thread to continue executing after triggering.
>> >
>> > The existing comment and your message says `warn_once`, not `pr_warn_o=
nce`.
>>
>> I actually mixed these up, thanks for pointing that out. We do not have
>> `warn_once!` yet.
>>
>> >
>> >>
>> >> `debug_assert` panics when debug assertions are enabled, otherwise is
>> >> compiled out.
>> >>
>> >> I don't think one makes the other unnecessary.
>> >
>> > I don't think there should be two checks of the same thing. Even if we=
 want
>> > different behaviour depending on if debug assertions are enabled or no=
t, it
>> > should be a single macro that switches behaviour based on that config.
>>
>> Apparently this was discussed in start of April [1] (I somehow missed
>> it), and as far as I can tell, consensus is that we do not use
>> `WARN_ONCE`. Instead we use `debug_assert` with `pr_warn_once`. That
>> sounds reasonable to me.
>
> Above explanation is reasonable to me. So I'll add `pr_warn_once`  to
> fsleep() and udelay() both.
>
>> This can be a combined macro or open coded, either way is fine with me.
>
> I don't have a strong preference about this either. Maybe we can
> handle it in a separate patch.
>
>> I think we should add the `debug_assert` as suggested by this patch, add
>> the `pr_warn_once` in the not taken branch, and remove the TODO about
>> `WARN_ONCE`. We can bike-shed a combined macro on the side.
>>
>> Sounds reasonable @Gary?
>
> Any other opinions are welcome including Gary.

Still waiting for a new version of this patch. Let me know if I missed
it somehow.


Best regards,
Andreas Hindborg



