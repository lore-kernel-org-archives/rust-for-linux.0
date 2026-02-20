Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452582BF00A
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 16:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771606557; cv=pass; b=RmDw4B84J8asqebx0/5IzZ1bFtInjxwrAw9Jay7fbMsyfEv8uErqHAkzBSDTDZYjrvQuWzy7+eGy5Z+rgsmt1y2NTF5sHXwzWBpbHVYfYQCf+M/3slHQZZy2ypBwMGa8+JUZ2LfAt08PN+jcFXy5LRdIwBFVaG+KJ1N9jB5F0xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771606557; c=relaxed/simple;
	bh=Cad3+FcdK03BDN/O4NBPZSgsttXrfgY+w8AjrYGZgIY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=c57/bmnZqZvYyK2IXVvfRacwX1XkhgRQNtO97aqY/EMbjtd1gsQnQgkfAIenbKlmhd5DyEcb7p98HCTwLvxynHrPcUtS178wsOZG/BFUzuu0kX/7GrtM3RCMrD57m9b1W1CU2aLfBQve5Qj34ijEQ1J5EXXZ8m+7wlqllyUFzLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=La7IoEmB; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="La7IoEmB"
ARC-Seal: i=1; a=rsa-sha256; t=1771606550; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RkElRHV6+N+sL037lZFtEOETnUNpsYhAEDtfgnnfPt13EGs9r6MPhII0MDCm2rpVOhOQLDPs6AbtIPgq0hxrNWqIZDr8d0vecw3gRVKgUZY1vkxnfYzxK/uFJG/WS+ba5ncclywqrOG7kcjJoKJq5lwGwCrDvvK9se3a9ihQ5rw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771606550; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VYxqkWcjuqdxCG+SAhBxvpF6VF7AXF7FJCajPTiSXM8=; 
	b=MCgf14KGngG9dMoEb7+wMOsVc8i1+gMlXpu06z8xCtlHs9cJbki667h+47taemRgNjFhOiyX/HTNT3CpSGI2LQUv2KbsOnyBOnXWh+WEgR7s3N5GfR/XCCo9CZwBBgPXIhBx9gZ09SAGYXY6DK3jBjACFv3dZhvk8FhVJA+DYaA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771606550;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=VYxqkWcjuqdxCG+SAhBxvpF6VF7AXF7FJCajPTiSXM8=;
	b=La7IoEmBSQmM14pMFTHwVohSwUos8ksrEnSzkQOD447Trqk37W0o995V92F415bK
	4unyshJ2/ojsXwbhvP32/q6shSJ+/Bj6TzYq4k6wpbhFjMwQtrgLBa4YdPeAB6i1XbY
	fQtnMHI9XVNu0QIe9WexOGzm/241hVb5d6khF3js=
Received: by mx.zohomail.com with SMTPS id 177160654712998.35195126384303;
	Fri, 20 Feb 2026 08:55:47 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260220172154.4fe93c6d@fedora>
Date: Fri, 20 Feb 2026 13:55:31 -0300
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 aliceryhl@google.com,
 beata.michalska@arm.com,
 lyude@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <A60BBD53-B7D3-4E85-A72E-8B914B82C977@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-8-deborah.brouwer@collabora.com>
 <20260212111113.68778819@fedora>
 <1B40312F-694C-4154-ABF7-F96CE5576C0E@collabora.com>
 <20260220172154.4fe93c6d@fedora>
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 20 Feb 2026, at 13:21, Boris Brezillon =
<boris.brezillon@collabora.com> wrote:
>=20
> On Fri, 20 Feb 2026 12:25:43 -0300
> Daniel Almeida <daniel.almeida@collabora.com> wrote:
>=20
>>>> +
>>>> +    // Checks and updates the seat state based on the slot it =
points to
>>>> +    // (if any). Returns a Seat with a value matching the slot =
state.
>>>> +    fn check_seat(&mut self, locked_seat: &LockedSeat<T, =
MAX_SLOTS>) -> Seat {
>>>> +        let new_seat =3D match locked_seat.access(self) {
>>>> +            Seat::Active(seat_info) =3D> {
>>>> +                let old_slot_idx =3D seat_info.slot as usize;
>>>> +                let slot =3D &self.slots[old_slot_idx];
>>>> +
>>>> +                if kernel::warn_on!(
>>>> +                    !matches!(slot, Slot::Active(slot_info) if =
slot_info.seqno =3D=3D seat_info.seqno)
>>>> +                ) {
>>>> +                    Seat::NoSeat
>>>> +                } else {
>>>> +                    Seat::Active(SeatInfo {
>>>> +                        slot: seat_info.slot,
>>>> +                        seqno: seat_info.seqno,
>>>> +                    })
>>>> +                }
>>>> +            }
>>>> +
>>>> +            Seat::Idle(seat_info) =3D> {
>>>> +                let old_slot_idx =3D seat_info.slot as usize;
>>>> +                let slot =3D &self.slots[old_slot_idx];
>>>> +
>>>> +                if !matches!(slot, Slot::Idle(slot_info) if =
slot_info.seqno =3D=3D seat_info.seqno) {
>>>> +                    Seat::NoSeat
>>>> +                } else {
>>>> +                    Seat::Idle(SeatInfo {
>>>> +                        slot: seat_info.slot,
>>>> +                        seqno: seat_info.seqno,
>>>> +                    })
>>>> +                }
>>>> +            }
>>>> +
>>>> +            _ =3D> Seat::NoSeat,
>>>> +        };
>>>> +
>>>> +        // FIXME: Annoying manual copy. The original idea was to =
not add Copy+Clone to SeatInfo,
>>>> +        // so that only slot.rs can change the seat state, but =
there might be better solutions
>>>> +        // to prevent that. =20
>>>=20
>>> Okay, I guess we want some inputs from Daniel and/or Alice on that =
one. =20
>>=20
>> Hm, I'd say we shouldn't implement Clone to avoid any possibility of =
holding on
>> to stale state by duplicating it.
>=20
> Okay, so basically what we have now.
>=20
>>=20
>> Why do we need to return Seat from this function? Can't we simply =
write
>> locked_seat in place and not return anything?
>=20
> We do both actually. IIRC, the reason is that LockedBy borrows &self =
if
> we want to read the locked_seat, which prevents us from calling =
methods
> taking a &mut ref from a `match(locked_seat.access())`.


I am referring to this change:

--- a/drivers/gpu/drm/tyr/slot.rs
+++ b/drivers/gpu/drm/tyr/slot.rs
@@ -242,8 +242,8 @@ fn evict_slot(&mut self, slot_idx: usize, =
locked_seat: &LockedSeat<T, MAX_SLOTS>
     }
=20
     // Checks and updates the seat state based on the slot it points to
-    fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> =
Seat {
+    fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) {
         let new_seat =3D match locked_seat.access(self) {
             Seat::Active(seat_info) =3D> {
                 let old_slot_idx =3D seat_info.slot as usize;
@@ -278,26 +278,7 @@ fn check_seat(&mut self, locked_seat: =
&LockedSeat<T, MAX_SLOTS>) -> Seat {
             _ =3D> Seat::NoSeat,
         };
=20
-        // FIXME: Annoying manual copy. The original idea was to not =
add Copy+Clone to SeatInfo,
-        // so that only slot.rs can change the seat state, but there =
might be better solutions
-        // to prevent that.
-        match &new_seat {
-            Seat::Active(seat_info) =3D> {
-                *locked_seat.access_mut(self) =3D Seat::Active(SeatInfo =
{
-                    slot: seat_info.slot,
-                    seqno: seat_info.seqno,
-                })
-            }
-            Seat::Idle(seat_info) =3D> {
-                *locked_seat.access_mut(self) =3D Seat::Idle(SeatInfo {
-                    slot: seat_info.slot,
-                    seqno: seat_info.seqno,
-                })
-            }
-            _ =3D> *locked_seat.access_mut(self) =3D Seat::NoSeat,
-        }
-
-        new_seat
+        *locked_seat.access_mut(self) =3D new_seat;
     }

Or even shorter:

    fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) {
        let (slot_idx, seqno, is_active) =3D match =
locked_seat.access(self) {
            Seat::Active(info) =3D> (info.slot as usize, info.seqno, =
true),
            Seat::Idle(info) =3D> (info.slot as usize, info.seqno, =
false),
            _ =3D> return,
        };

        let valid =3D if is_active {
            !kernel::warn_on!(!matches!(&self.slots[slot_idx], =
Slot::Active(s) if s.seqno =3D=3D seqno))
        } else {
            matches!(&self.slots[slot_idx], Slot::Idle(s) if s.seqno =3D=3D=
 seqno)
        };

        if !valid {
            *locked_seat.access_mut(self) =3D Seat::NoSeat;
        }
    }

access vs access_mut() does not matter here: since the owner is &mut =
self
anyways we know we have exclusive access to the LockedSeat throughout =
the whole
function.

