Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5403586329;
	Mon, 23 Feb 2026 15:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771859764; cv=none; b=MGWHIkHlOlnbWZco4RTAHtgVioxif/AeWsUD37wqwN5SKiDZcmqoo9tZj1jgj0IcHtUsambKt3r6PVtQb3A1XtVSAc+kRksvMzzJacc2Ziho/goOSVIFL/dGoNnQPR8zJ8fEz8Z/6Hxhb+D0+C5Ljko4eqU35w4k2+i5Gv4no0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771859764; c=relaxed/simple;
	bh=+3ERFZbkkPwpDlYNyYHoaADvE/fr8h0VtJ17kNfXe+0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WFHZCpOENhzulHyATlmiWnw3SB57RSBCgZWYhNBJLQqyAm2GNMzPRBmeIAk7Vy9Wd8QjSNhzFylca0uE1h+4kibGvjmaUs8l1MOYMk7+skgO2ahAOfzlETCB3p3oPKM2d7ULGkw8Fz1huhdGqvJWg1GM5jFHLBPIX+if9e2L1M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkZcVaWn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkZcVaWn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4884C116C6;
	Mon, 23 Feb 2026 15:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771859763;
	bh=+3ERFZbkkPwpDlYNyYHoaADvE/fr8h0VtJ17kNfXe+0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XkZcVaWntNsoQOQ2NSpeeFw1K7UP+PjVeeIPCvPU63Lqm6yMp3RRHKY4bDASxT5XU
	 hvj6PeCD3EfuHnkX4bYVJYySlFn4PGe+h4Auge7e7o6YqhleUklp0mgEtPLrPYH2BJ
	 YN5U8h37LJlPZuHkHCtnbEwoerRwooDMQZv+cPgvUGbMLiRher3dnSycAEPN3c1Mre
	 xI/wLwXjXcsYoz9Ump1BGDDcI02iNFqErD7r13LG7zr0qGRrFkosXX2EFW07IF8U5x
	 XjmTLZmsu0p080Ije9OjunPVKTuCVb1oqcOXZsiY2bQPDU6A7kiwC2ACcGXu+chH9n
	 OMQTiHC0ATI+g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Almeida
 <daniel.almeida@collabora.com>
Subject: Re: [PATCH v3] hrtimer: add usage examples to documentation
In-Reply-To: <CANiq72mHuOU-KCsX5oOH=D_9caN9C-bdKSBL5aq3QciqXz=KNQ@mail.gmail.com>
References: <20260220-hrtimer-examples-v6-19-rc1-v3-1-ddfc19a90741@kernel.org>
 <CANiq72mHuOU-KCsX5oOH=D_9caN9C-bdKSBL5aq3QciqXz=KNQ@mail.gmail.com>
Date: Mon, 23 Feb 2026 16:15:54 +0100
Message-ID: <87pl5v32z9.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Fri, Feb 20, 2026 at 9:12=E2=80=AFAM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> +//!     prelude::*,
>
> The prelude should already be there in examples.
>
>> +//!     sync::{
>> +//!         atomic::{ordering, Atomic},
>> +//!         completion::Completion,
>> +//!         Arc,
>> +//!     },
>> +//!     time::{
>> +//!         hrtimer::{
>> +//!             RelativeMode, HrTimer, HrTimerCallback, HrTimerPointer,
>> +//!             HrTimerRestart, HrTimerCallbackContext
>> +//!         },
>> +//!         Delta, Monotonic,
>> +//!     },
>> +//! };
>
> This uses a mixture of the vertical style and the horizontal one -- I
> guess you did it to save on lines, but it looks strange now that we
> have a style for imports.

It uses random line breaks to make check_patch.pl not yell at me. I
guess I could copy them somewhere else, do the formatting and copy them
back. Not really a workflow I care for though.

> I guess you thought about it, but I wonder if the examples could be
> merged to some degree to make them more readable...

I don't think they would read better by combining them.

Best regards,
Andreas Hindborg



