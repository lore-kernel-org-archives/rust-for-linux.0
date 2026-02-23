Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30072BE7DD;
	Mon, 23 Feb 2026 15:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771860542; cv=none; b=tEcAesFbuuhVadBPUeMApPj8voDR4y5vSqX3/zm1hOzucOuLkO25znDOYbdMNgj0E6yzCtu+ODhnSABlPDaLsI4L6lMtRv2+A+DGkEVMiWyK8aHFduEgRyqLZ/T4oVQaQOD1XI+vRanRd6xoYcUY4IrQoVgEsE6Upd1XGuvUNys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771860542; c=relaxed/simple;
	bh=U4hvsaDEX4UlKPG5xCY07ZhFmpXslqLT0Z5mdzPIQrw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K/fWfZ7wUJnkTq1EsjBUo6y7kURvR1TRQpq2wtVMFkjAnmxqv7ybRJC98z/ukZFc+T7sS4NOdgQkujQrTxVz+5JlDDyu2GzLy5huMx5W7DWwTq/ET+Y+vpT/CEaaWwuZCY8ymSk/Hu2Z1GjGLJr691eyakBV8PCqaTTI4COvxUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLkhDEW7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLkhDEW7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E14C19423;
	Mon, 23 Feb 2026 15:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771860541;
	bh=U4hvsaDEX4UlKPG5xCY07ZhFmpXslqLT0Z5mdzPIQrw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BLkhDEW7Xj5e4dZy0S3GIuHEper5IpQ/pqv1wcQUv5TaXWEvappZCbAq3To6hOQOa
	 y8HKnz7cUXZCZNhULpYdihQqO4xl92U4Ky+RhLp/Nme9qXcskackrFqOmefP9DKvtp
	 K3+c+QyRi2onf7S/iR6f3JxhWvOe1R7K8+EDoZ6qYJuIAnHQB5393hDwbJfE3yekw5
	 WxzUut/WkoOqYi1Pn7dxltZWNxU+HJVS0xhyNz/XX7UGkEyiYpXMOWsAc7WJ8jOsr3
	 N/VgOsiLvSBM7z2r107tNU2bYPyoNy6fSCThTC2mFC8nZDWiLgshrrSYZf4HyHURCl
	 hEHsgEh1OGaoA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Almeida
 <daniel.almeida@collabora.com>
Subject: Re: [PATCH v3] hrtimer: add usage examples to documentation
In-Reply-To: <87pl5v32z9.fsf@t14s.mail-host-address-is-not-set>
References: <20260220-hrtimer-examples-v6-19-rc1-v3-1-ddfc19a90741@kernel.org>
 <CANiq72mHuOU-KCsX5oOH=D_9caN9C-bdKSBL5aq3QciqXz=KNQ@mail.gmail.com>
 <87pl5v32z9.fsf@t14s.mail-host-address-is-not-set>
Date: Mon, 23 Feb 2026 16:28:47 +0100
Message-ID: <87ldgj32ds.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Andreas Hindborg <a.hindborg@kernel.org> writes:

> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:
>
>> On Fri, Feb 20, 2026 at 9:12=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
>>>
>>> +//!     prelude::*,
>>
>> The prelude should already be there in examples.
>>
>>> +//!     sync::{
>>> +//!         atomic::{ordering, Atomic},
>>> +//!         completion::Completion,
>>> +//!         Arc,
>>> +//!     },
>>> +//!     time::{
>>> +//!         hrtimer::{
>>> +//!             RelativeMode, HrTimer, HrTimerCallback, HrTimerPointer,
>>> +//!             HrTimerRestart, HrTimerCallbackContext
>>> +//!         },
>>> +//!         Delta, Monotonic,
>>> +//!     },
>>> +//! };
>>
>> This uses a mixture of the vertical style and the horizontal one -- I
>> guess you did it to save on lines, but it looks strange now that we
>> have a style for imports.
>
> It uses random line breaks to make check_patch.pl not yell at me. I
> guess I could copy them somewhere else, do the formatting and copy them
> back. Not really a workflow I care for though.

So, after copying these use statements elsewhere to format them, I was
rereading your message and I see that what you actually write is that
maybe we should be using the vertical style for imports in examples.

The examples would be nothing but a wall of use statements. Do we
really want that? I know it is the style we picked for the kernel in
general, but I don't think it should necessarily apply to the examples.


Best regards,
Andreas Hindborg


