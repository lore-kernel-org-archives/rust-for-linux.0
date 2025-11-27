Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860EA322DC1;
	Thu, 27 Nov 2025 09:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764234332; cv=none; b=PwrO61+Il3IO0hiN2YDHeopgUdkaUQzvaqzs8uuNUnz8HnMdalEO4KGWcxRYkR9tNn0aWMvGbo6ged5TP03A0cSDV5cm85OAf0Ktf1A+5Sgwmu84G4PFodNkS6aLB5PQCs41pU/vn7W+Sj0heQ1aQQCKRSnTpeDo5utvHr9Id3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764234332; c=relaxed/simple;
	bh=QtglcwKM7w0LhzbPKsxjZGRZHcdXCK1iuxWk9+GoRxk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mcAvcTHPEWBL4SYGrhRZwTGXYl7c1B85MJmEJCG7c1pbf8TUPbtHxG+Ynaf4186/r4Q93Q7cIoatMcFqnp4QxgiLQgvCxffYHHhIggXRVKY3AIW5A9dWxy07NeSsRiewAff4CAxvPjTxLkWGKFoFjeh69R+5RbfxrhPfe13uPEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=cxs3pqQl; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="cxs3pqQl"
Received: from mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:143b:0:640:90e9:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id 230D4825F3;
	Thu, 27 Nov 2025 11:57:43 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id bvZ3RE8LPeA0-ExrpC17I;
	Thu, 27 Nov 2025 11:57:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1764233862;
	bh=QtglcwKM7w0LhzbPKsxjZGRZHcdXCK1iuxWk9+GoRxk=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=cxs3pqQlbF3u4brDIgCGasuUv6P4g2qyZWmMJKUeNXDuMuKWrbS9+ZbN3AKL/yC/q
	 n2rCf7+rRGYf/WsXRc1jYKEUGSljcdPajyR51oNvlsN2t3be+cPiYhCBra6ChbxSpt
	 09yZgFnxc/WrpxKi1zWIc0/9dCsLyV9Nq9tD65uU=
Authentication-Results: mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Thu, 27 Nov 2025 11:57:35 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, lossin@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 longman@redhat.com, felipe_life@live.com, daniel@sedlak.dev,
 bjorn3_gh@protonmail.com, daniel.almeida@collabora.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/6] rust: implement `Class` for ww_class support
Message-ID: <20251127115735.52946137@nimda.home>
In-Reply-To: <eb0a838221064b02cd4f341e9201cc2cf31be8e2.camel@redhat.com>
References: <20251101161056.22408-1-work@onurozkan.dev>
	<20251101161056.22408-3-work@onurozkan.dev>
	<eb0a838221064b02cd4f341e9201cc2cf31be8e2.camel@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Nov 2025 14:15:00 -0500
Lyude Paul <lyude@redhat.com> wrote:

> This should be is_wait_die.into() like you did in the code below.

Can't call into() in const function.

> With that:
>=20
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>=20
> On Sat, 2025-11-01 at 19:10 +0300, Onur =C3=96zkan wrote:
> > +impl Class {
> > +=C2=A0=C2=A0=C2=A0 /// Creates an unpinned [`Class`].
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// # Safety
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// Caller must guarantee that the returned value i=
s not moved
> > after creation.
> > +=C2=A0=C2=A0=C2=A0 pub const unsafe fn unpinned_new(name: &'static CSt=
r,
> > is_wait_die: bool) -> Self {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Class {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inn=
er: Opaque::new(bindings::ww_class {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 stamp: bindings::atomic_long_t { counter: 0 },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 acquire_name: name.as_char_ptr(),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mutex_name: name.as_char_ptr(),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 is_wait_die: is_wait_die as u32,
>=20

-Onur
