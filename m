Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9EC53B61A
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 12:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871272; cv=none; b=sfjJBvQOty4W00exXfZe+bzdEUFqaxADqVEuh6JaAOlAK8rVboH0cxiq8MbneQgFGsnadBIJ4ncRnyz7PsZk1tzLtMRiDVfQ66fpzUwRteVYgth9fdpjpFE4lJdNKgcsm/YsxWejymWpIeQuDydRe2NWz7ORM6OKK1ahYmlYyJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871272; c=relaxed/simple;
	bh=prCvHlvJvSIR9BLMDEnMAXnq+G66WF0U6aOJWejLXrw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HpNGi091bGIOBqyh08UMK5nZKf8LjA8BnrCrfiK+gjdRI0GMMbk7nWttVy679vyyIe7T4dgHUz6cQGmPFfvWplkOzAtArfl63n0uy1nfYdCDmIdKIhamjrtjaBj3LpQjvK/9qhZ9enZDLBndw10S5l1cTaQ6x9mGwrm/Xegena8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526491F00A3A;
	Tue,  8 Sep 2026 12:41:07 +0000 (UTC)
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, miguel.ojeda.sandonis@gmail.com
Cc: ojeda@kernel.org, jstultz@google.com, acourbot@nvidia.com,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, gary@garyguo.net, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v1] rust: time: rename ClockSource trait to ClockId
In-Reply-To: <20260908.202645.851502304088874666.tomo@flapping.org>
References: <87ecgc96gy.fsf@t14s.mail-host-address-is-not-set>
 <20260810.223116.480833962545427592.tomo@flapping.org>
 <CANiq72mj2vTKN7QjqyDgKq4w8cwPWcrYsx3Nc2Hk6kceYDbLkw@mail.gmail.com>
 <vFd2FeB6HthX6o6SSYFKgFwD_VimFVjHfmbOR6SA9S-itWoyg5HffTQD-SwLg1SIl5CevJ1pqibv-c0nLlKtyQ==@protonmail.internalid>
 <20260908.202645.851502304088874666.tomo@flapping.org>
Date: Tue, 08 Sep 2026 14:41:00 +0200
Message-ID: <87jyovx6eb.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"FUJITA Tomonori" <tomo@flapping.org> writes:

> On Mon, 10 Aug 2026 15:32:44 +0200
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
>
>> On Mon, Aug 10, 2026 at 3:31=E2=80=AFPM FUJITA Tomonori <tomo@flapping.o=
rg> wrote:
>>>
>>> Thanks!
>>>
>>> Miguel, Andreas, can we merge this via rust-next?
>>
>> If Andreas is OK with it, we can try, yeah -- he was mentioning to me
>> earlier today about a few others.
>
> Andreas, can we get it into the next merge window via rust-next?

Yes, I plan to stage it for the next merge window. It goes to
(rust-)timekeeping-next and linux-next picks it up from there. From
there it goes to rust-next via PR when we get to ~rc5.

Would be nice with more review tags though.

Best regards,
Andreas Hindborg


