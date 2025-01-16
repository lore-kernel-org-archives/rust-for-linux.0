Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120801E98FE;
	Thu, 16 Jan 2025 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737034019; cv=none; b=eYTI2uadaYX+ONvZcTe40lqoAPdRLQoEgbgRkc/27qNNDKsLtuUGd7/tMiDKZ6hkVTOEbJ2dPWoTOyiNRpTRkGK3flZs5Z6BCXYmU+g415FKjBO9tPodwBNlkAIKH+K7MQYP111Jozo1fjJ1vK4dfeMFGognlkvNuUssd5WrN6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737034019; c=relaxed/simple;
	bh=Xxxj0+GoBS92ieKRQ376+axUJsNw6cZSa1zdcb3C+BA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EizO283zcuCif8MHisjgiPb3o+963hCFaU0xNHA77DxuibLyFK44mJQs5yaEjXoilGUGkk7qIbx/zbWM96HIsYIcJiICUGdKKWOo+xfJ1YRiGSnxh9di20D03tTent2mthXC0g91+Mn0GWBc7i8ixJtcDskN0mJjnR/L48zQeYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeYFSema; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeYFSema"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F0EC4CED6;
	Thu, 16 Jan 2025 13:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737034018;
	bh=Xxxj0+GoBS92ieKRQ376+axUJsNw6cZSa1zdcb3C+BA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aeYFSema3VyfB2LSnA0qUhKuGrT/82UYYRmYWuw4gh0qp2HLhgDh5Iz3y76VXgNgO
	 0h31bjSJwKWnM//qeWTBCZlBitkzoqlTV3HfQklVxsQKhlNQsYoyh8dTNaEGo0f2kO
	 epiUGyP42s/PztNys4smpJYesXn+ifpCvKq2Lvm6dPxvveuu3nDBJ3LniUAb9166/5
	 Js8rCXKN7E0nqkko2VW43CmycKMGtRBYvXj653KcsdIqKIxyBP6YXP/wIj1kK2bhWb
	 0VZPXT7ru5cUNsvp6mXbtC2arbHpBneXkUmWuIpxeB9m1ikhA0tpc74AD/GruIr7jE
	 8R/2NcT7KxD2w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Anna-Maria Behnsen"
 <anna-maria@linutronix.de>,  "Frederic Weisbecker" <frederic@kernel.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,  "Danilo Krummrich"
 <dakr@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Lyude Paul" <lyude@redhat.com>,  "Guangbo Cui" <2407018371@qq.com>,
  "Dirk Behme" <dirk.behme@gmail.com>,  "Daniel Almeida"
 <daniel.almeida@collabora.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 05/14] rust: hrtimer: allow timer restart from timer
 handler
In-Reply-To: <CAJ-ks9=3y9EOjyDfAj6Rx9YUg-vGvm=SrPi2XGOa9Okt5hh6ug@mail.gmail.com>
 (Tamir
	Duberstein's message of "Wed, 15 Jan 2025 19:21:02 -0500")
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
	<20250110-hrtimer-v3-v6-12-rc2-v6-5-f71d50f16482@kernel.org>
	<Qz3-uMYVmDmNuj3wUnPV5wK3iFA5J7TfKSByEYeFChySo0SY1m6hAIvqhxzFUD1Qu1QBmtm5DZffaJ4qKG4Bcg==@protonmail.internalid>
	<CAJ-ks9=0HRjwqqrLZ2QjyjYw6frK=zu5_ZG5Jmb=fCRXefBmLQ@mail.gmail.com>
	<87y0zccog2.fsf@kernel.org>
	<AnOmXngdYkt27nm651NPEtHpPbulJabYOTc2Dx3vPJZb6xzTQvkB_Z8ePhVqyV3T0sIrdfB1QhB-Hs5oLr682g==@protonmail.internalid>
	<CAJ-ks9=3y9EOjyDfAj6Rx9YUg-vGvm=SrPi2XGOa9Okt5hh6ug@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 16 Jan 2025 14:26:42 +0100
Message-ID: <87sepidh4d.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Tamir Duberstein" <tamird@gmail.com> writes:

> On Wed, Jan 15, 2025 at 6:21=E2=80=AFAM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> "Tamir Duberstein" <tamird@gmail.com> writes:
>>
>> > On Fri, Jan 10, 2025 at 3:17=E2=80=AFPM Andreas Hindborg <a.hindborg@k=
ernel.org> wrote:
>> >>
>> >> This patch allows timer handlers to report that they want a timer to =
be
>> >> restarted after the timer handler has finished executing.
>> >>
>> >> Also update the `hrtimer` documentation to showcase the new feature.
>> >>
>> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> >> ---
>> >>  rust/kernel/time/hrtimer.rs     | 37 +++++++++++++++++++++++++++++++=
+++++-
>> >>  rust/kernel/time/hrtimer/arc.rs |  4 +---
>> >>  2 files changed, 37 insertions(+), 4 deletions(-)
>> >>
>> >> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>> >> index d0842c7c4c6ddffeef9a79cbf9727819060e4333..50e8c23578b5cf7196893=
ac88d9547fc027f1f04 100644
>> >> --- a/rust/kernel/time/hrtimer.rs
>> >> +++ b/rust/kernel/time/hrtimer.rs
>> >> @@ -167,7 +167,7 @@ pub trait HrTimerCallback {
>> >>      type CallbackTargetParameter<'a>;
>> >>
>> >>      /// Called by the timer logic when the timer fires.
>> >> -    fn run(this: Self::CallbackTargetParameter<'_>)
>> >> +    fn run(this: Self::CallbackTargetParameter<'_>) -> HrTimerRestart
>> >>      where
>> >>          Self: Sized;
>> >>  }
>> >> @@ -262,6 +262,41 @@ unsafe fn start(self_ptr: *const Self, expires: =
Ktime) {
>> >>      }
>> >>  }
>> >>
>> >> +/// Restart policy for timers.
>> >> +pub enum HrTimerRestart {
>> >> +    /// Timer should not be restarted.
>> >> +    NoRestart,
>> >> +    /// Timer should be restarted.
>> >> +    Restart,
>> >> +}
>> >> +
>> >> +impl From<u32> for HrTimerRestart {
>> >> +    fn from(value: u32) -> Self {
>> >> +        match value {
>> >> +            0 =3D> Self::NoRestart,
>> >> +            _ =3D> Self::Restart,
>> >> +        }
>> >> +    }
>> >> +}
>> >> +
>> >> +impl From<i32> for HrTimerRestart {
>> >> +    fn from(value: i32) -> Self {
>> >> +        match value {
>> >> +            0 =3D> Self::NoRestart,
>> >> +            _ =3D> Self::Restart,
>> >> +        }
>> >> +    }
>> >> +}
>> >
>> > These are for converting from bindings to our enum, right? Why do we
>> > need both signed and unsigned,
>>
>> Depending on kernel (target arch) configuration, the enum type will be
>> either signed or unsigned on C side.
>>
>> I guess I could try to figure out what kernel configs effect the change
>> and then do conditional compilation on Rust side, but it seems overkill.
>
> The bindings seem to contain a type alias:
>
> pub const hrtimer_restart_HRTIMER_NORESTART: hrtimer_restart =3D 0;
> pub const hrtimer_restart_HRTIMER_RESTART: hrtimer_restart =3D 1;
> pub type hrtimer_restart =3D ffi::c_uint;
>
> Perhaps you could impl `From<bindings:: hrtimer_restart>` instead?

Yes - good idea!


Best regards,
Andreas Hindborg



