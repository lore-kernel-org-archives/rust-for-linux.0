Received: from smtpout9.mo537.mail-out.ovh.net (smtpout9.mo537.mail-out.ovh.net [51.210.91.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9BB495501
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 15:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.210.91.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817894; cv=none; b=E+00ES8d4QsjbH0so4K4XLlZg9TSYPbgOiHzvLvbNvJyt02PGB2bQR+oGLIhzJik7GiHY0Y1VrpWG68npxVN/tliyAQxrg/pgiPXcdegcXQEwGdm+FAew1Y1do1wYZ9zmX41Gp7tugLUQKMiMyQmisoS/+dZVGmLQK+TjM1tQrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817894; c=relaxed/simple;
	bh=CPlAnu68KgJG1/Q2pJmORv/Jmj62gE29CTA1Bt1CF5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BOZyLDUPQIpPTO/r6TZh8qKylMwVq+rcUE34YSDNtYptk5nGDa5XdA/xJIa5hjuLXnJM+q7CYzVtWUGh1RfvUEth3IOxkVv0+xYQhNe3HnWapcAvovACR0jhB69FklSYiynxwP6qhZznLM5021ftFEJYOWZH7byo2o7zfV/+RNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=npnm.eu; spf=pass smtp.mailfrom=npnm.eu; dkim=pass (2048-bit key) header.d=npnm.eu header.i=@npnm.eu header.b=TWi9J4DX; arc=none smtp.client-ip=51.210.91.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=npnm.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=npnm.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=npnm.eu header.i=@npnm.eu header.b="TWi9J4DX"
Received: from director5.derp.mail-out.ovh.net (director5.derp.mail-out.ovh.net [79.137.60.225])
	by mo537.mail-out.ovh.net (Postfix) with ESMTPS id 4j3LXG1kPzz49M4;
	Mon, 12 Oct 2026 15:11:26 +0000 (UTC)
Received: from director5.derp.mail-out.ovh.net (director5.derp.mail-out.ovh.net. [127.0.0.1])
        by director5.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <lina+kernel@asahilina.net>; Mon, 12 Oct 2026 15:11:26 +0000 (UTC)
Received: from mta3.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.0.128])
	by director5.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4j3LXG12Dkz6MbC;
	Mon, 12 Oct 2026 15:11:26 +0000 (UTC)
Received: from npnm.eu (unknown [10.1.6.8])
	(Authenticated sender: laniel_francis@npnm.eu)
	by mta3.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id BC8B4941F72;
	Mon, 12 Oct 2026 15:11:22 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-108S002f470ca45-326a-4bf6-824e-d9953fc7b011,
                    49321548602EDEEB7E8F78B99E4F89B1D2AE6B16) smtp.auth=laniel_francis@npnm.eu
X-OVh-ClientIp:149.102.245.162
From: Francis Laniel <laniel_francis@npnm.eu>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>,
 Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>,
 Thorsten Blum <blum@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/2] rust: add NonEmptySlice
Date: Mon, 12 Oct 2026 18:11:21 +0300
Message-ID: <5110602.GXAFRqVoOG@pmachine>
In-Reply-To: <DM2XOVH1P1FU.2FHNOM9U66YPS@nvidia.com>
References:
 <20261011191540.56199-1-laniel_francis@npnm.eu>
 <20261011191540.56199-2-laniel_francis@npnm.eu>
 <DM2XOVH1P1FU.2FHNOM9U66YPS@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
x-ovh-tracer-id: 17914756370403829206
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTF9kbe/x9crAR3MRR44rUkHfU3Bx+kvnEMzS9rjmZeKPQB8xgg7VpgcNb+ANv9U3cKTiPEVovxH+4ne/Ui2OEGGC3+qls/Pe8//+u40UvbQiOI/hqgwfxDyZ5fHlTbi1m5iqBdy5UzlxS+th7hx8gGqO4w0KcrQod8hXG3ZALy8TMazUUUV8Wx/CKgSGh4m6y+kIhvYpb+0eFfZ/zrbiGM7L/zYuOxwyyaiHcI2lFG3TzL6iVYrgdNhjMzvx5nOXGPOGy651DvLcNh34v2lRS88nEvpHPaPbdQcu++2tKf6qXOjX8BIl6ZT8Rne/ztlSJS3HIRrJ7JNZll9zk3W1vKbOX5P5ItmUuX9E4eEmXFhC5XVIvQbdtnOym+4XJohsmleH0mrWgZqBx/SPLRdmBase/1+xjmWSal0B3+PJvMP9C3okWDxAdKe0boCr5j3ln5WPXyeXz3D0I2ZmzbPLVIyMBvLeFl3iYup7BYKPZC+7owisl0vZWvN4ha8trOqlhhZyBDmgn6mPu3cQrvHjq5ACQjrVz5hq2hFg0qRH3RaHgsGm3PBXsUXgpOyaAyA5veAZhAjTMfqJI+nXK6YVKbFU3/4t3uNhWhZDpGoKp+fRprFyzqwXjkXlxqrQw82u7gYZhHwOdhFMxu1JFvwAQPZ/u36Rfoz2/hR+PPixhqhhA
DKIM-Signature: a=rsa-sha256; bh=h55Ndr1nS/cHrREZaSiFP4v+8EE4HBb66jFaa8FVUSc=;
 c=relaxed/relaxed; d=npnm.eu; h=From; s=ovhmo-selector-1; t=1791817886;
 v=1;
 b=TWi9J4DXlYm2xRXAn1P5wj2pLPpScmAaPGIYUqtTboLEEoVnpB9MRVX8pTftUtBXUN5IKzMc
 BG1bqSPteh+ui+EQuDFo0OspTG8JIVAv+sYoKxKvmUj2B1X+WYCIf202fXO76R8kuPH739khQ7g
 dntnLVjqWwxuBp57hNTSYn7xrpZd0yHtU0uoVbNppm1Cmn+6IZouIEAx4iHDujCYqLVFSNduDVE
 qoXYtsmj1+Hzqx9CGqtFqqc5HozmzMUF/viU2HfxAqmEBFTA8BQXUQlL3Hs8BzkVR0JTkP9a9D4
 STLU0x+pmuj7avym5T3DZSLl97Ky3+TM/0wCY+c/LsSKQ==

Hi,

Le lundi 12 octobre 2026, 17:36:41 heure d=E2=80=99=C3=A9t=C3=A9 d=E2=80=99=
Europe de l=E2=80=99Est Alexandre Courbot a =C3=A9crit :
> Looks like we are converging towards the series sent by Lorenzo, but
> wanted to share a couple a quick comments nonetheless:

Thanks for the feedback!

> On Mon Oct 12, 2026 at 4:15 AM JST, Francis Laniel wrote:
> > Add NonEmptySlice<T>, a [T] wrapper that is guaranteed to contain at
> > least one element.
> > This lets methods such as last_mut() return a plain reference instead
> > of an Option, so callers that have already checked for emptiness no
> > longer need unwrap() or unwrap_unchecked().
> >
> > Suggested-by: Gary Guo <gary@garyguo.net>
> > Signed-off-by: Francis Laniel <laniel_francis@npnm.eu>
> > ---
> >  rust/kernel/lib.rs   |  1 +
> >  rust/kernel/slice.rs | 76 ++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 77 insertions(+)
> >  create mode 100644 rust/kernel/slice.rs
> >
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index 7225abc64084..8cc01aceb3b2 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -130,6 +130,7 @@
> >  #[cfg(CONFIG_RUST_SERIAL_DEV_BUS_ABSTRACTIONS)]
> >  pub mod serdev;
> >  pub mod sizes;
> > +pub mod slice;
> >  #[cfg(CONFIG_SOC_BUS)]
> >  pub mod soc;
> >  #[doc(hidden)]
> > diff --git a/rust/kernel/slice.rs b/rust/kernel/slice.rs
> > new file mode 100644
> > index 000000000000..7e467cb952c3
> > --- /dev/null
> > +++ b/rust/kernel/slice.rs
> > @@ -0,0 +1,76 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Slice abstractions to ease development.
> > +
> > +use core::ops::{Deref, DerefMut};
> > +
> > +/// A slice that is guaranteed to contain at least one element.
> > +///
> > +/// # Invariants
> > +///
> > +/// `self.0` is not empty.
> > +#[repr(transparent)]
> > +pub struct NonEmptySlice<T>([T]);
> > +
> > +impl<T> NonEmptySlice<T> {
> > +    /// Returns `None` if `s` is empty.
>=20
> This is not a standard doccomment. Doccomments first start by stating
> what the function does before explaining the return value.
>=20
> > +    pub fn new(s: &mut [T]) -> Option<&Self> {
>=20
> It looks strange to take a `&mut` and return a `&Self`. There should be
> no reason to take a mutable reference here, and you can use
> `ptr::from_ref` to create the reference.

Indeed, this sounds weird! I will keep it consistant for future contributio=
ns.

> > +        if s.is_empty() {
> > +            return None;
> > +        }
> > +        // SAFETY: `Self` is `repr(transparent)` over `[T]`, so the ca=
st keeps the slice length.
> > +        // INVARIANT: `s` is not empty, checked above.
> > +        Some(unsafe { &*(core::ptr::from_mut(s) as *const Self) })
> > +    }
> > +
> > +    /// Returns `None` if `s` is empty.
> > +    pub fn new_mut(s: &mut [T]) -> Option<&mut Self> {
> > +        if s.is_empty() {
> > +            return None;
> > +        }
> > +        // SAFETY: `Self` is `repr(transparent)` over `[T]`, so the ca=
st keeps the slice length.
> > +        // INVARIANT: `s` is not empty, checked above.
> > +        Some(unsafe { &mut *(core::ptr::from_mut(s) as *mut Self) })
> > +    }
> > +
> > +    /// Returns a reference to the first element.
> > +    pub fn first(&mut self) -> &T {
>=20
> Same here, `first` and `last` should take a non-mutable reference as
> their standard library counterparts do. They do not allow to mutate the
> slice.
>=20

Best regards,


