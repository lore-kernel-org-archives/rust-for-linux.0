Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932CE175A84
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 10:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446233; cv=none; b=KpWfC4wyQmuOxqzHr9WQGeT2VOlJm0qIoQ6v0sZrgPNZXXkLEnif57eekCkF+z9YK4nbGZCJslci4uS843evR+BNEKnGOZ4vEMw2bzuqJX6S2Yhq60UHu+hVVDdWEwi3jUj8v8DevxlNuCorcchKuvVT0jIpmc1sOs0Zkr/gbSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446233; c=relaxed/simple;
	bh=DykPuhSTp7UV7wBs+lLCqWdpe0feAfPyWKQx7K2cZpU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ty7CkB8kkOGlpvZsdM9V299DbmCK/qaaFyCEH5ObyNftNxRMOpV7jXFObidhGF/xgqH67SvV/W7ghr05kDD7PnYfq41lhiVMU4JzCxooyScbz1TQJchGyfLMvsZyQxdOzR6dkfrTtWwQkVP7vAAWJY3pwDqc5lTS7NXYbnT9wsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Zcdj8Abd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Zcdj8Abd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772446223;
	bh=DykPuhSTp7UV7wBs+lLCqWdpe0feAfPyWKQx7K2cZpU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zcdj8AbdsRtsdwk6z4eKDGOROjoc3xI8oHzconJD5wd36geyoEfBVaqez/N4UdKU6
	 qPraQtLqNgJotIWJVq+X5+bu17s7Kh4ZYhxEX3YSCtLn/dGY1Na1CkX/cij49d2CLT
	 nnij47LFVXHdtgiVu16ODbESi2hPCkBzKCWFlzSOsk0II60RWa7Y3Qx6oh+4WDvUlj
	 CEhm0DeAXlJ4WPldFLYhmVTbnQu5M5ZXUp8fgbUEeyi15OUTUepF/Imy6CoWGV292X
	 G/yhBwlNIENaAJOn7KiN0RBfE9roWinYlL4mL6p+sULVhc1TEfPGjjcXHHLNCRmsDC
	 bLXKA+r9YFK7A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8D87517E03E5;
	Mon,  2 Mar 2026 11:10:23 +0100 (CET)
Date: Mon, 2 Mar 2026 11:10:18 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 aliceryhl@google.com, beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
Message-ID: <20260302111018.33d1d413@fedora>
In-Reply-To: <aaI2w5vIxB_kc98o@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
	<20260212013713.304343-8-deborah.brouwer@collabora.com>
	<20260212111113.68778819@fedora>
	<1B40312F-694C-4154-ABF7-F96CE5576C0E@collabora.com>
	<20260220172154.4fe93c6d@fedora>
	<A60BBD53-B7D3-4E85-A72E-8B914B82C977@collabora.com>
	<20260222185743.02dabb26@fedora>
	<AF169886-65F7-4B7A-BAFE-D2C75ADAE678@collabora.com>
	<aaI2w5vIxB_kc98o@um790>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 27 Feb 2026 16:28:51 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> > >  =20
> > >>=20
> > >> access vs access_mut() does not matter here: since the owner is &mut=
 self
> > >> anyways we know we have exclusive access to the LockedSeat throughou=
t the whole
> > >> function. =20
> > >=20
> > > I agree, but LockedBy is picky, and last I tried I couldn't make it
> > > work without the annoying update+return-copy-of-seat dance you see
> > > here. Maybe I missed something obvious and it does indeed work with
> > > your suggested changes, dunno. =20
> >=20
> > Rewriting things so they pass the borrow checker is common in Rust. Som=
etimes
> > it can be done rather easily; other times the design is just broken and=
 needs
> > to be reworked. Luckily this one fell in the first category.
> >=20
> > This benefits from the fact that no one can race us between reading thi=
s tuple
> >=20
> > (slot_idx, seqno, is_active)=20
> >=20
> > ..and using it. That=E2=80=99s because we=E2=80=99re taking &mut self a=
s a proxy in LockedBy, so
> > we=E2=80=99re sure we have exclusive access in this scope.

Yep, I know that, but I seem to remember it wasn't working when I was doing

        match locked_seat.access(self) {
            Seat::Active(seat_info) | Seat::Idle(seat_info) =3D> {
                // With lazy eviction, if seqno matches, the hardware state=
 is still
                // valid for both Active and Idle slots, so just update our=
 records
                self.record_active_slot(seat_info.slot as usize, locked_sea=
t, slot_data)
            }
            _ =3D> self.allocate_slot(locked_seat, slot_data),
        }

in ::activate(), which is why I made check_seat() return a Seat and
did the match against this returned seat. Oh well, I must have
misunderstood the problem reported by the compiler.

> >=20
> > If you don=E2=80=99t have any complaints about the code I sent (i.e.: c=
onvoluted, wrong
> > logic, etc), I suggest switching to it. =20
>=20
> I=E2=80=99ve tested the short check_seat() function and can confirm that =
it correctly
> compares Seat and Slot seqno as well as emits the kernel warning when we =
have a
> mismatch on an active Seat. So I=E2=80=99ll the simplified check_seat() f=
unction in v2
> unless there are any more issues to address.

If things still compile/work as expected, no objection on my end.
