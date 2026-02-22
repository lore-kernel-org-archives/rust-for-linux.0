Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2841118787A
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Feb 2026 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771783071; cv=none; b=h5ZdolugNcWqJAvGnolfw/r47Uj138a9gaiwQnLH82xBTXzM7awQHPgNAP/MTtbl5anE3Oghzu1rAClr+BShK63j6d35ygL4EETXT9G04kjUU9+t4bjWG3Qdd5ITHYR12UM/sqGqPT57Cf9PV9T2kjQmd83Yj/WGyAHRO8RpNzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771783071; c=relaxed/simple;
	bh=EZp5B71IN+Tf33Ftt+oBwMGTW8URNBihcjRf7NU/td8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pwvCYZsjQk1NY9lUFmJjtyBFA6158h7VdRTmbcIttzuRWdlbSMKvWXtDETwz3h8/8RfwAaEHdVOcyNrpSVIFA5OAMDlQ2TeGUbLEiwgu48fPD7s2r/wkCR4EEB9uh40RX0m2Mq/ncdn3pt4OCPCVYnC8cF77GFFs+DWRd4EYmm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NNbCML8Q; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NNbCML8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771783068;
	bh=EZp5B71IN+Tf33Ftt+oBwMGTW8URNBihcjRf7NU/td8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NNbCML8QCJmYv/iVEuYEW8e9ZsQyHuBz60AcCPYAhaGIbUPqf1E0zO9QWCGaj0hUw
	 kWpVFnRNPvbJX1+SeOQGcT38TzF6ma5ENLtT5MIi2yat8Xnm8sO169X32UXPYp5Btm
	 ACjOBaT+aA+qc+xLyYYVVBJPHd3u9HAfvzKwaoztH3PcZth96A1fPaeosFW92Jwheb
	 OdtnN4cmg0QEjHgfiwpGxH4yTExWM31ZNNL7SzW49YYbhFbizbyUNREwWCAfO4gHEs
	 +umeoIfotV2j3B7Eoq9ZSkDdwQre1Axyo0AOy9jKy3kozJ07HxVJL1NgigSpJ6ueCz
	 u1rfpYG85l9fQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DD2E817E0E67;
	Sun, 22 Feb 2026 18:57:47 +0100 (CET)
Date: Sun, 22 Feb 2026 18:57:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 aliceryhl@google.com, beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
Message-ID: <20260222185743.02dabb26@fedora>
In-Reply-To: <A60BBD53-B7D3-4E85-A72E-8B914B82C977@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
	<20260212013713.304343-8-deborah.brouwer@collabora.com>
	<20260212111113.68778819@fedora>
	<1B40312F-694C-4154-ABF7-F96CE5576C0E@collabora.com>
	<20260220172154.4fe93c6d@fedora>
	<A60BBD53-B7D3-4E85-A72E-8B914B82C977@collabora.com>
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

On Fri, 20 Feb 2026 13:55:31 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> > On 20 Feb 2026, at 13:21, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > 
> > On Fri, 20 Feb 2026 12:25:43 -0300
> > Daniel Almeida <daniel.almeida@collabora.com> wrote:
> >   
> >>>> +
> >>>> +    // Checks and updates the seat state based on the slot it points to
> >>>> +    // (if any). Returns a Seat with a value matching the slot state.
> >>>> +    fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Seat {
> >>>> +        let new_seat = match locked_seat.access(self) {
> >>>> +            Seat::Active(seat_info) => {
> >>>> +                let old_slot_idx = seat_info.slot as usize;
> >>>> +                let slot = &self.slots[old_slot_idx];
> >>>> +
> >>>> +                if kernel::warn_on!(
> >>>> +                    !matches!(slot, Slot::Active(slot_info) if slot_info.seqno == seat_info.seqno)
> >>>> +                ) {
> >>>> +                    Seat::NoSeat
> >>>> +                } else {
> >>>> +                    Seat::Active(SeatInfo {
> >>>> +                        slot: seat_info.slot,
> >>>> +                        seqno: seat_info.seqno,
> >>>> +                    })
> >>>> +                }
> >>>> +            }
> >>>> +
> >>>> +            Seat::Idle(seat_info) => {
> >>>> +                let old_slot_idx = seat_info.slot as usize;
> >>>> +                let slot = &self.slots[old_slot_idx];
> >>>> +
> >>>> +                if !matches!(slot, Slot::Idle(slot_info) if slot_info.seqno == seat_info.seqno) {
> >>>> +                    Seat::NoSeat
> >>>> +                } else {
> >>>> +                    Seat::Idle(SeatInfo {
> >>>> +                        slot: seat_info.slot,
> >>>> +                        seqno: seat_info.seqno,
> >>>> +                    })
> >>>> +                }
> >>>> +            }
> >>>> +
> >>>> +            _ => Seat::NoSeat,
> >>>> +        };
> >>>> +
> >>>> +        // FIXME: Annoying manual copy. The original idea was to not add Copy+Clone to SeatInfo,
> >>>> +        // so that only slot.rs can change the seat state, but there might be better solutions
> >>>> +        // to prevent that.    
> >>> 
> >>> Okay, I guess we want some inputs from Daniel and/or Alice on that one.    
> >> 
> >> Hm, I'd say we shouldn't implement Clone to avoid any possibility of holding on
> >> to stale state by duplicating it.  
> > 
> > Okay, so basically what we have now.
> >   
> >> 
> >> Why do we need to return Seat from this function? Can't we simply write
> >> locked_seat in place and not return anything?  
> > 
> > We do both actually. IIRC, the reason is that LockedBy borrows &self if
> > we want to read the locked_seat, which prevents us from calling methods
> > taking a &mut ref from a `match(locked_seat.access())`.  
> 
> 
> I am referring to this change:
> 
> --- a/drivers/gpu/drm/tyr/slot.rs
> +++ b/drivers/gpu/drm/tyr/slot.rs
> @@ -242,8 +242,8 @@ fn evict_slot(&mut self, slot_idx: usize, locked_seat: &LockedSeat<T, MAX_SLOTS>
>      }
>  
>      // Checks and updates the seat state based on the slot it points to
> -    fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Seat {
> +    fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) {
>          let new_seat = match locked_seat.access(self) {
>              Seat::Active(seat_info) => {
>                  let old_slot_idx = seat_info.slot as usize;
> @@ -278,26 +278,7 @@ fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Seat {
>              _ => Seat::NoSeat,
>          };
>  
> -        // FIXME: Annoying manual copy. The original idea was to not add Copy+Clone to SeatInfo,
> -        // so that only slot.rs can change the seat state, but there might be better solutions
> -        // to prevent that.
> -        match &new_seat {
> -            Seat::Active(seat_info) => {
> -                *locked_seat.access_mut(self) = Seat::Active(SeatInfo {
> -                    slot: seat_info.slot,
> -                    seqno: seat_info.seqno,
> -                })
> -            }
> -            Seat::Idle(seat_info) => {
> -                *locked_seat.access_mut(self) = Seat::Idle(SeatInfo {
> -                    slot: seat_info.slot,
> -                    seqno: seat_info.seqno,
> -                })
> -            }
> -            _ => *locked_seat.access_mut(self) = Seat::NoSeat,
> -        }
> -
> -        new_seat
> +        *locked_seat.access_mut(self) = new_seat;

That one requires Copy support, or am I missing something?

>      }
> 
> Or even shorter:
> 
>     fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) {
>         let (slot_idx, seqno, is_active) = match locked_seat.access(self) {
>             Seat::Active(info) => (info.slot as usize, info.seqno, true),
>             Seat::Idle(info) => (info.slot as usize, info.seqno, false),
>             _ => return,
>         };
> 
>         let valid = if is_active {
>             !kernel::warn_on!(!matches!(&self.slots[slot_idx], Slot::Active(s) if s.seqno == seqno))
>         } else {
>             matches!(&self.slots[slot_idx], Slot::Idle(s) if s.seqno == seqno)
>         };
> 
>         if !valid {
>             *locked_seat.access_mut(self) = Seat::NoSeat;
>         }
>     }

Did you try that? Last I tried, I was hitting a wall because the caller
of check_seat() does a match on the updated seat, and inside this
match, it calls functions that need a &mut self, and the borrow checker
rightfully points the invalid &self then &mut self borrow pattern.

> 
> access vs access_mut() does not matter here: since the owner is &mut self
> anyways we know we have exclusive access to the LockedSeat throughout the whole
> function.

I agree, but LockedBy is picky, and last I tried I couldn't make it
work without the annoying update+return-copy-of-seat dance you see
here. Maybe I missed something obvious and it does indeed work with
your suggested changes, dunno.
