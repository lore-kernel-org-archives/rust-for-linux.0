Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C732246BCD
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Jul 2026 20:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320308; cv=none; b=PDcYyONQBF2rfweeHU7R9Adi7EXfpN2Xb/tE6ROgcSXSmoO2BXq8FVC2It9mO49cl2O11B4dRSxIEKxD032B9AJWBGrZ69k/axliPfXQLX9dgeGUEsaM5NKF3WeTFXfwwkESNQz3Bgv6ZPHevLUOhbnhTk8y7wNDILhAAN2vctY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320308; c=relaxed/simple;
	bh=aA8vlh3zQBayklxxvmQ525+ETISHVewCsnx10b4eY9w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E7w77E2jgpDYB/AGAkLfwdDJpM2UQKfQRCZtYpyERrnuqbwknzX99blBFGs4PTynfUP79egOPr8aj8qmIqvj95uJh0LcWvio4erkRFTs2oh2ne4rQa5aK0q3JVjKnyV+AmE4qZNmpHFK7GB/L8RBniH56tYQebJRWX9g1RgnZxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJXHemT5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJXHemT5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983FC1F000E9;
	Fri, 17 Jul 2026 20:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784320307;
	bh=aA8vlh3zQBayklxxvmQ525+ETISHVewCsnx10b4eY9w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mJXHemT5Evwxmci7ZUChjSqYzcdTc+PrRRZn2fBJvHbH649OpvlwK/LPMLth96/7H
	 fhlkksvWM1gBIPecafgM0Psp62o8KeOAr2XIH3Gn0iEB+UY3g3KS1++8gkb8gZ9xLj
	 m1OrLjwVLpvKh4Oy7V4yxQIRbooeWdyn3e438vrh0aEfR/9vmgqGrQtaYzYaO1tqKH
	 8+yHyEDk8cmLdkvPxrnezx6KUkwgI5ffdSCHrC8Vqhp4j6OA/p4gFmEu9IJDujsqdx
	 NI616Sr602RjwdGBf/nONz2AQJI0XZjBsh/ISnSs5NIP2rMDZAGfdgeWjqDd2urAtS
	 vEe9TfA2zuBGQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Alice Ryhl
 <aliceryhl@google.com>
Cc: FUJITA Tomonori <tomo@flapping.org>, gary@garyguo.net, ojeda@kernel.org,
 acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() to round correctly
 for negative Delta
In-Reply-To: <CANiq72n-MUqf2MBrUTqOD4jbDTZ26kYULzX6YbQLawJ+201jQA@mail.gmail.com>
References: <CANiq72m+mx-z6idfdTLh+mcW76nxRr_eA-a6vgjFY6a1GE_ygA@mail.gmail.com>
 <20260714.194916.571807180513332641.tomo@flapping.org>
 <DJY8NM7TIHZK.15213B4MWETHU@garyguo.net>
 <20260714.211751.124079232269470730.tomo@flapping.org>
 <CANiq72mokH0-CnObPnFJWsSaofOmiAqtBuvGxPvXSruPT-Xn3g@mail.gmail.com>
 <alYyNtrxK5qz7nxA@google.com>
 <zhnTGQvrvwQNiTmNO2p-HZmjeh2tpgIhyWsowfD7V1Do4N4Fyf9TfDY62R3_0a8M7Nr3gjCn6l6hLtVUt93e5g==@protonmail.internalid>
 <CANiq72n-MUqf2MBrUTqOD4jbDTZ26kYULzX6YbQLawJ+201jQA@mail.gmail.com>
Date: Fri, 17 Jul 2026 22:31:35 +0200
Message-ID: <874ihxgxy0.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Tue, Jul 14, 2026 at 2:57=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
>>
>> I mean if the goal is just to explain that values that are too large
>> saturate, then the example could look like this?
>
> Yeah, that is what I meant by the 2) group, i.e. I think saturation
> should be shown one way or another.
>
> But the boundary case in particular is separate, and a previous patch
> showcased the actual boundary (i.e. both N and N + 1). If the docs
> mention it (as they do now), then I am OK with the boundary case being
> in the example too, even if we may not have a `pub const`, or in
> `#[test]`.
>
> Either way, what I really want is to have the basic examples landed
> and the fix... we can discuss the boundary (docs, examples, `#[test]`s
> and `pub const`s) separately. :)
>

We can land the fix first and the examples and tests later.

I agree with the suggestions made in this thread about examples and
cases. Let's have the example like Alice suggest and then test boundary
inputs in `#[test]` kunit tests. Define the magic numbers as named
constants local to the test scope, not as part of the exported API.

Best regards,
Andreas Hindborg


