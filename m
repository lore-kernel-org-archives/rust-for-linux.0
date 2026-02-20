Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670202EDD7D
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 16:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771604526; cv=none; b=ab4+t7qKeR5gi2ozrUHlDwk0sMJIudHLStgdTyPzPP6dhYLPh00Tv0BwGbTP/gT4HTIx7h4HRM2cj7h1RvKiuTkn1F1GRoZT7MF+0DQEIH6YQq3DCdYTMnWhxJW/qgkENb3j0RcIuhUpGwTBcsmhC8NRW2e+oUxLBcscY+emcZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771604526; c=relaxed/simple;
	bh=/iTkbOlo95o8ULuOB9RjJvT03w3SCR+vlTsMK0p3xbs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pmYc1Kqla5vIE1paBlx++eE0D+zMqpLpVUJ3I6WW/ub6m5Ps7xvxBvPBQ9vA/Uv8zwXs0w6XhUUlcLKswk2av+44R1ZTpX+7N0tLpyBWWWaEdR76G0ob+7i829/Pgkl/hhRyNDDs1YTLZ+6H0WDNrudhn6x7jGXTzeTCceO9KV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Sk2CUaN2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Sk2CUaN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771604518;
	bh=/iTkbOlo95o8ULuOB9RjJvT03w3SCR+vlTsMK0p3xbs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Sk2CUaN2DuPxu2s2xoWWJ46P4XJucj1sdmH8QBnC5EGEjVt4Ejr/NajyDdomvjuGK
	 fj2ZQx0p61zi1ItPV4ErlX3fN+Qzj1fzxEpaTTcV3vhWxQhfmaxourSIJEONnmBw2Z
	 WXJgP+vyuGm5eZ3S93kBpjXDFhgibYmQhOMMxWwHIIV2NyK5E3i8+zKohUp1ZoWl4h
	 vkC2zMJcxi4aqj5DjY+8xUaeJp+QRs96q3ixVQz+xsuME25stDryezF6+eFL0TLOXE
	 6WMikYio6l3qBccKBUTO7FtmsOGEQ8Ia8mBGJnQ2DiJshu65x17l5fs8OvGgv4tqeP
	 UegObxNgC02fA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0908817E0E6A;
	Fri, 20 Feb 2026 17:21:57 +0100 (CET)
Date: Fri, 20 Feb 2026 17:21:54 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 aliceryhl@google.com, beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
Message-ID: <20260220172154.4fe93c6d@fedora>
In-Reply-To: <1B40312F-694C-4154-ABF7-F96CE5576C0E@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
	<20260212013713.304343-8-deborah.brouwer@collabora.com>
	<20260212111113.68778819@fedora>
	<1B40312F-694C-4154-ABF7-F96CE5576C0E@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Feb 2026 12:25:43 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> >> +
> >> +    // Checks and updates the seat state based on the slot it points to
> >> +    // (if any). Returns a Seat with a value matching the slot state.
> >> +    fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Seat {
> >> +        let new_seat = match locked_seat.access(self) {
> >> +            Seat::Active(seat_info) => {
> >> +                let old_slot_idx = seat_info.slot as usize;
> >> +                let slot = &self.slots[old_slot_idx];
> >> +
> >> +                if kernel::warn_on!(
> >> +                    !matches!(slot, Slot::Active(slot_info) if slot_info.seqno == seat_info.seqno)
> >> +                ) {
> >> +                    Seat::NoSeat
> >> +                } else {
> >> +                    Seat::Active(SeatInfo {
> >> +                        slot: seat_info.slot,
> >> +                        seqno: seat_info.seqno,
> >> +                    })
> >> +                }
> >> +            }
> >> +
> >> +            Seat::Idle(seat_info) => {
> >> +                let old_slot_idx = seat_info.slot as usize;
> >> +                let slot = &self.slots[old_slot_idx];
> >> +
> >> +                if !matches!(slot, Slot::Idle(slot_info) if slot_info.seqno == seat_info.seqno) {
> >> +                    Seat::NoSeat
> >> +                } else {
> >> +                    Seat::Idle(SeatInfo {
> >> +                        slot: seat_info.slot,
> >> +                        seqno: seat_info.seqno,
> >> +                    })
> >> +                }
> >> +            }
> >> +
> >> +            _ => Seat::NoSeat,
> >> +        };
> >> +
> >> +        // FIXME: Annoying manual copy. The original idea was to not add Copy+Clone to SeatInfo,
> >> +        // so that only slot.rs can change the seat state, but there might be better solutions
> >> +        // to prevent that.  
> > 
> > Okay, I guess we want some inputs from Daniel and/or Alice on that one.  
> 
> Hm, I'd say we shouldn't implement Clone to avoid any possibility of holding on
> to stale state by duplicating it.

Okay, so basically what we have now.

> 
> Why do we need to return Seat from this function? Can't we simply write
> locked_seat in place and not return anything?

We do both actually. IIRC, the reason is that LockedBy borrows &self if
we want to read the locked_seat, which prevents us from calling methods
taking a &mut ref from a `match(locked_seat.access())`.

> 
> >   
> >> +        match &new_seat {
> >> +            Seat::Active(seat_info) => {
> >> +                *locked_seat.access_mut(self) = Seat::Active(SeatInfo {
> >> +                    slot: seat_info.slot,
> >> +                    seqno: seat_info.seqno,
> >> +                })
> >> +            }
> >> +            Seat::Idle(seat_info) => {
> >> +                *locked_seat.access_mut(self) = Seat::Idle(SeatInfo {
> >> +                    slot: seat_info.slot,
> >> +                    seqno: seat_info.seqno,
> >> +                })
> >> +            }
> >> +            _ => *locked_seat.access_mut(self) = Seat::NoSeat,
> >> +        }
> >> +
> >> +        new_seat
> >> +    }
> >> +  
> 

