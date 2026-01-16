Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F3E3112BA;
	Fri, 16 Jan 2026 16:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768581454; cv=none; b=dOHVPQeXIzDt8gq18snUodDEEvMI/3P9pX28V9uqLHrKEK1csaUWvF8ZrYSzEUMEo4rWyjHPkY3HPlVuqFtOMM6Hk1gOQlohCBbz46EIh942FRw/A8hz9bpSpHaOZ0PnjAjxok4Ya6l8HirD7FE4BeH/MAN5TNchXO5E9RSpEUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768581454; c=relaxed/simple;
	bh=t0blLsoD8TiN+QoqO6qUpMu8hWLgQM9uIBZ1oDwMnq8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=rDElN2hFFHhft1yLlG8Y5kPw3FoyrkFNTcJyV5T0OSrW1fnYqMWHS5eNuxX2OhyV23sql9eGsdhZLp7nW0E2Ln2QYi3LP5+sONFCCcAXJP3XQWQ/VjLJ179BBIjWz0k9brKNo4epiR4NQPsVv9tW7qYUMi14LXIaCainFLo6Xvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqXh1/IC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqXh1/IC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A85C16AAE;
	Fri, 16 Jan 2026 16:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768581454;
	bh=t0blLsoD8TiN+QoqO6qUpMu8hWLgQM9uIBZ1oDwMnq8=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=cqXh1/IC6oRkUG4OkbPSLN1VGDj8b1AP9mQRU6v9GDufZSBzAVDwnufikFu9h0RvP
	 DlFrU2A2rj1e+6z1mHVcIE6SBSzvdeKFHGU6OMX7burwK4vBnrnvNfUDkPb+e5nDdi
	 wf5LdomUsmmyNg1nsxYjxzy5u00o4q1EMiwFB5mcvONonTx4b8FgUJk83q20OhVdc/
	 +2Ql13EwvP7aK1HJom6RzzsV7ERKzVSQFXqgioffM43hStCAswG34EkIhH7rYQ0u2K
	 BhPnsJ9bcKnyhDnv+KSu94oYYvcnrVRf4dmV63pRTToFK/iOHe3wwEXnDKdoGafk1o
	 PHN7h+SqTE5rw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 17:37:29 +0100
Message-Id: <DFQ5STPL7L5L.2HEHEF8VDFFP9@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Alban Kurti"
 <kurti@invicto.ai>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 09/15] rust: pin-init: rewrite the initializer macros
 using `syn`
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260114181934.1782470-1-lossin@kernel.org>
 <20260114181934.1782470-10-lossin@kernel.org>
 <CAJ-ks9=kvTBHLzepFUqtYn_FOroP3CU0QhyNwBRyH_tHF4p50A@mail.gmail.com>
 <DFPIYDMDHC6V.3CT62XJBRQJOD@kernel.org>
 <CAJ-ks9m-nsn5KTAvSJfu=1kOiKmoadC1X0=zp0GphkX8ZCF53w@mail.gmail.com>
 <DFPWOMZOX6CI.27JJBKSO6IONE@kernel.org>
 <CAJ-ks9mcwoSfRwBhvZTDkQk=Rt+YPWtfK_6rDqnkSb2mi7Ok-g@mail.gmail.com>
In-Reply-To: <CAJ-ks9mcwoSfRwBhvZTDkQk=Rt+YPWtfK_6rDqnkSb2mi7Ok-g@mail.gmail.com>

On Fri Jan 16, 2026 at 4:39 PM CET, Tamir Duberstein wrote:
> On Fri, Jan 16, 2026 at 4:28=E2=80=AFAM Benno Lossin <lossin@kernel.org> =
wrote:
>>
>> On Fri Jan 16, 2026 at 1:19 AM CET, Tamir Duberstein wrote:
>> > On Thu, Jan 15, 2026 at 5:43=E2=80=AFPM Benno Lossin <lossin@kernel.or=
g> wrote:
>> >>
>> >> On Thu Jan 15, 2026 at 10:45 PM CET, Tamir Duberstein wrote:
>> >> > On Wed, Jan 14, 2026 at 1:20=E2=80=AFPM Benno Lossin <lossin@kernel=
.org> wrote:
>> >> >>
>> >> >> Rewrite the initializer macros `[pin_]init!` using `syn`. No funct=
ional
>> >> >> changes intended aside from improved error messages on syntactic a=
nd
>> >> >> semantical errors. For example if one forgets to use `<-` with an
>> >> >> initializer (and instead uses `:`):
>> >> >>
>> >> >> <snip>
>> >> >>
>> >> >> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
>> >> >> Signed-off-by: Benno Lossin <lossin@kernel.org>
>> >> >> ---
>> >> >>
>> >> >> <snip>
>> >> >>
>> >> >> -#[cfg(kernel)]
>> >> >> -pub use ::macros::paste;
>> >> >> -#[cfg(not(kernel))]
>> >> >> -pub use ::paste::paste;
>> >> >
>> >> > Now that `cfg(kernel)` is gone, can we also remove it from `rust/Ma=
kefile`
>> >> > and `scripts/generate_rust_analyzer.py`? That is already done for
>> >> > pin-init in patch 3 of this series:
>> >> > https://lore.kernel.org/all/20260114181934.1782470-4-lossin@kernel.=
org/.
>> >>
>> >> I'm still using `cfg(kernel)` in `src/lib.rs` for linking to the std
>> >> Box and Arc types.
>> >
>> > Are you sure? I'm not seeing it. It looks like the crate is no_std
>> > unless the std feature is activated and no features are activated in
>> > the kernel.
>>
>> Yes:
>>
>>     $ rg 'cfg.*kernel'
>>
>>     src/lib.rs
>>     260:#![cfg_attr(not(kernel), doc =3D "[`Arc<T>`]: alloc::alloc::sync=
::Arc")]
>>     261:#![cfg_attr(not(kernel), doc =3D "[`Box<T>`]: alloc::alloc::boxe=
d::Box")]
>>     921:#[cfg_attr(not(kernel), doc =3D "[`Arc<T>`]: alloc::alloc::sync:=
:Arc")]
>>     922:#[cfg_attr(not(kernel), doc =3D "[`Box<T>`]: alloc::alloc::boxed=
::Box")]
>>     1020:#[cfg_attr(not(kernel), doc =3D "[`Arc<T>`]: alloc::alloc::sync=
::Arc")]
>>     1021:#[cfg_attr(not(kernel), doc =3D "[`Box<T>`]: alloc::alloc::boxe=
d::Box")]
>>
>> >> Also I don't want to have to reintroduce all that infrastructure when=
 I
>> >> inevitably have to add new kernel workarounds.
>> >
>> > Then why remove it for pin-init?
>>
>> I don't understand, what is removed where? In patch 3 the `--cfg kernel`
>> is kept in all locations.
>
> You're right, I must've misread. It's fine to keep & sorry for the noise.

Don't worry, I appreciate you taking a look :)

Cheers,
Benno
