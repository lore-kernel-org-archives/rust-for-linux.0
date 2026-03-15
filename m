Received: from forward501d.mail.yandex.net (forward501d.mail.yandex.net [178.154.239.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BD821255A;
	Sun, 15 Mar 2026 10:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773572010; cv=none; b=uw2dMiJdobjx81IPzHdXIGRbnC4ltPnzK+xAluUOm0RbLHf/lJWSfB8vlZCahKJ49+JobpefZhP4r/VKwJiu61XGmDUIlLFr+tSQbEBqZUqM2gfgOPHDdh1x1RXkZkMga3AAQ85b8lF0bJkJuIpzo8DFstxXBbTZLV3PNlvBzqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773572010; c=relaxed/simple;
	bh=Bjph5KOm121EByuwym7OhZQDb32TqsQPmtB4r1CK4mg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U4Qpbwqcqbgw4puTkZroyOwI7q3p4jKxzXr+gyxaicFVB3j0PkLkfD05gccrQN++GMf3xs5IotZAYw/RQFimWUXFlYXlF2isumGVpgk0aS176B0eSzS0BAup/WNXK7tNL66+dw1eVHgNMKm0CX5ZRj4MGpWkKZdaVJlQwCiOcdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=W9N8PsmD; arc=none smtp.client-ip=178.154.239.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="W9N8PsmD"
Received: from mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:4f41:0:640:844:0])
	by forward501d.mail.yandex.net (Yandex) with ESMTPS id 7064D812F3;
	Sun, 15 Mar 2026 13:45:40 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id bjHSv2oGbKo0-23nDlzbm;
	Sun, 15 Mar 2026 13:45:39 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1773571539;
	bh=BzIQJkuXNTg4A3Sph4RDGQo7Wa8mypmiZGuURHSwuTY=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=W9N8PsmDxsemjKcsQ1QDWYkCd4AwLJKBVvgVoX4w//7TUOr1hE5vb6m4KyDXwW4Ww
	 rnsXX/L7ck7i/VDhKVb7S+SE7m3k1wDuvFlwx8yR8tAkKwBKbTHY8V2g5kA8Mdd2uZ
	 DM2Lsv/5teD1bDhiU1q/7F8T10RZBq+EfoKnVNYo=
Authentication-Results: mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Sun, 15 Mar 2026 13:45:35 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Deborah
 Brouwer <deborah.brouwer@collabora.com>
Subject: Re: [PATCH v1 RESEND 2/4] rust: add Work::disable_sync
Message-ID: <20260315134535.32b3ae48@nimda>
In-Reply-To: <CAH5fLghXAYsa6NJY0pt6cq4qYiB1ZDAatyGM1GCj+xcpYy9-cw@mail.gmail.com>
References: <20260313091646.16938-1-work@onurozkan.dev>
	<20260313091646.16938-3-work@onurozkan.dev>
	<CAH5fLghXAYsa6NJY0pt6cq4qYiB1ZDAatyGM1GCj+xcpYy9-cw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Mar 2026 13:00:13 +0100
Alice Ryhl <aliceryhl@google.com> wrote:

> On Fri, Mar 13, 2026 at 10:17=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.=
dev>
> wrote:
> >
> > Add Work::disable_sync() as a safe wrapper for disable_work_sync().
> >
> > Drivers can use this during teardown to stop new queueing and wait
> > for queued or running work to finish before dropping related
> > resources.
> >
> > Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > ---
> >  rust/kernel/workqueue.rs | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> > index 706e833e9702..6acc7b5ba31c 100644
> > --- a/rust/kernel/workqueue.rs
> > +++ b/rust/kernel/workqueue.rs
> > @@ -530,6 +530,21 @@ pub unsafe fn raw_get(ptr: *const Self) ->
> > *mut bindings::work_struct { // the compiler does not complain that
> > the `work` field is unused. unsafe {
> > Opaque::cast_into(core::ptr::addr_of!((*ptr).work)) } }
> > +
> > +    /// Disables this work item and waits for queued/running
> > executions to finish.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Must be called from a sleepable context if the work was
> > last queued on a non-BH
> > +    /// workqueue.
>=20
> We generally do not make functions unsafe just because they might
> sleep.
>=20
> Alice

I will convert that into a "# Note" in the next version.

Regards,
Onur
