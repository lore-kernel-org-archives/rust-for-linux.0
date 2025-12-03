Received: from forward500d.mail.yandex.net (forward500d.mail.yandex.net [178.154.239.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1C5350A03;
	Wed,  3 Dec 2025 16:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764778546; cv=none; b=AdkTW6KaS1TjL0svEOSeWRaDCrulTT63A73m88xoD+lqAOi6E3mz/eF3KiNoFovK74KTd1cjE8M/yDU1DZ+BU6RIdbNAyqD+JUNsxTBvq1Qtt3I5taezckYBhysXfHOiX65i5Ad1Krc6+T8rjmbr38/p/eqKsaCPkhft0xBgo5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764778546; c=relaxed/simple;
	bh=6g+XzwHSMH9Ej45ttBopQSiP0y0XCtht+B3vP22VNfk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r/FFpgjEHY7P9advTlP+rmcmZHK+O5faK91HKVjPa+nUMac2mHkEv14tYMoLHZUKKn2YUDAQVkzRzKlK+2WTGbmJeAOouFj+ezdbjeRWzfgcqPyIIg1lbXXBtr6aeuPsqd9+rOU3HY5OzC6hkRhhX1Y7uMqrIYCa/3gXzFoCsjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=fYMH8nvq; arc=none smtp.client-ip=178.154.239.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="fYMH8nvq"
Received: from mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:ea2:0:640:ef77:0])
	by forward500d.mail.yandex.net (Yandex) with ESMTPS id 492D881698;
	Wed, 03 Dec 2025 19:06:22 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id F6niJX0L5Sw0-nmNvaeXu;
	Wed, 03 Dec 2025 19:06:21 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1764777981;
	bh=xbA6Z1sfoedPHXTbrROMd8vYuIq06KwXYzPwlPQ60t0=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=fYMH8nvqCKOa1DQZwl80sZu5BFZT/3Mrk2398QkAqTLRucLBTYx44yKPgPT2ozdsm
	 bitdFh+JHz738f2qDR4e2YIkLhMhTMGD1XruKUpetuNYvY53YFPvIMDQ+6Hzg7satS
	 U3obJuOLExmBRHwaKJwTT9ob+lkeinHPjuLEhP2U=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Wed, 3 Dec 2025 19:06:13 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, lossin@kernel.org, lyude@redhat.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, a.hindborg@kernel.org, tmgross@umich.edu,
 dakr@kernel.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 longman@redhat.com, felipe_life@live.com, daniel@sedlak.dev,
 daniel.almeida@collabora.com, thomas.hellstrom@linux.intel.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 4/6] rust: implement Class for ww_class support
Message-ID: <20251203190613.2771f9a8@nimda>
In-Reply-To: <aTA21F_fXA-xS34P@google.com>
References: <20251201102855.4413-1-work@onurozkan.dev>
	<20251201102855.4413-5-work@onurozkan.dev>
	<aTA21F_fXA-xS34P@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Dec 2025 13:10:44 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Mon, Dec 01, 2025 at 01:28:53PM +0300, Onur =C3=96zkan wrote:
> > Adds the Class type, the first step in supporting
> > ww_mutex in Rust. Class represents ww_class, used
> > for deadlock avoidance for supporting both wait-die
> > and wound-wait semantics.
> >=20
> > Also adds the define_class macro for safely declaring
> > static instances.
>=20
> > +impl Class {
> > +    /// Creates an unpinned [`Class`].
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Caller must guarantee that the returned value is not moved
> > after creation.
>=20
> The value is moved when you return it. Perhaps you meant that it must
> be pinned before first use?
>=20

Yes, that was my point.

> > +                            // TODO: Replace with
> > `bindings::lock_class_key::default()` once
> > +                            // stabilized for `const`.
> > +                            //
> > +                            // SAFETY: This is always
> > zero-initialized when defined with
> > +                            // `DEFINE_WD_CLASS` globally on C
> > side.
> > +                            //
> > +                            // For reference, see
> > __WW_CLASS_INITIALIZER() in
> > +                            // "include/linux/ww_mutex.h".
> > +                            acquire_key: core::mem::zeroed(),
> > +                            mutex_key: core::mem::zeroed(),
>=20
> For global lock class keys, this is fine, but this constructor seems
> to be for the non-global case. In that case, lockdep_register_key()
> must be called.
>=20
> Is a ww_class ever created as a non-global? I don't really think so.
> If not, then let's not support it.
>=20
> Alice

No, it's always used as global on the C side. Good point, will make the
change in the next version.

-Onur
