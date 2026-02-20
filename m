Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A387C26056A
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771601168; cv=pass; b=FkDngAaDgWa1WKO3GUe0DyNWJMBWVoFJdPZF6VGlKvG/KB2aBfFFBshC0+fstKuiAWceNrPt7InZ+wh5TLaZxJVeTa84LhNE9RLbS3eHDpmJ2+51YNuiQ/zbR+xB3iO6+QFDq43NLMHhRsC+Us8nr9XMy46qoX3uFpMvv+l82iA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771601168; c=relaxed/simple;
	bh=Vihr6I2DtgF4DToKDDe7A7Z81oxh2iATEjzA8uF3QpU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=FwAxjMA9u6FHY+i8IZPzb2a/TD+Peq7m6TDslw9n3oENH3ch7RYeZOWzPSuTho9zkeED3/8wU8CqoLeR4G30W4Mz4fhbibtWa8Gh3yPONUftX4Qvk0Bic1WmJUZB1YPBxBYEV5/PbQLWM9QzGyOOqJXc6/QeCDRCfVYONZCjzQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=DTDEv1Ec; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="DTDEv1Ec"
ARC-Seal: i=1; a=rsa-sha256; t=1771601160; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gruBr0a1CgF0aNEwBg8xaERZ3J+UvT2lILruIGD3ZraHO9LoP4J7mPpAjZKtnrHGEjDp0HhZGxV8NNjxLCu8NwaPFh6HM5HC7GFhMp1Jnka6C2b19tCIkyVEEEuR9WBObQS+SYptcvJKttCr7E4g1Ny7QTR6AfIurfRO6nYdo5E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771601160; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=znzzeceeUQqCmKR8RB/TELJEuA4gFruXjGydO8WO/+g=; 
	b=VIKddxrcuFvuBVXhTDLkLOo2nFharCa4fNHSjSRyj2eiLI7bxUVtSauGK6nxaJQQs5AoYJz1kIBslP68Rr3bQlHDpo1LKxtOT141beP7us2uZBZQJgh6bna2oojAFhW51jIwj6lVw9Sc0orwx1KUIVtbq1+y36XvWoEw57oAYPw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771601160;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=znzzeceeUQqCmKR8RB/TELJEuA4gFruXjGydO8WO/+g=;
	b=DTDEv1EcBoimwh3EadM9Ef7MuI2cx/4+czGurGEQ/utLs3qkS0SH2xsrTrGNqr7y
	Vyjij/2Re63mBMgcaOxqPHfw3mehRWgBo3KIMhweDUIhUREghmPjnYy5jdg5HkgS5lU
	5BkoxlNK4Y7WzcqCrelwUiQ07AQ7MQTB/yEIboos=
Received: by mx.zohomail.com with SMTPS id 1771601158815941.7198006495784;
	Fri, 20 Feb 2026 07:25:58 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260212111113.68778819@fedora>
Date: Fri, 20 Feb 2026 12:25:43 -0300
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 aliceryhl@google.com,
 beata.michalska@arm.com,
 lyude@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <1B40312F-694C-4154-ABF7-F96CE5576C0E@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-8-deborah.brouwer@collabora.com>
 <20260212111113.68778819@fedora>
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 12 Feb 2026, at 07:11, Boris Brezillon =
<boris.brezillon@collabora.com> wrote:
>=20
>=20
>> +type LockedSeat<T, const MAX_SLOTS: usize> =3D LockedBy<Seat, =
SlotManager<T, MAX_SLOTS>>;
>> +
>> +impl<T: SlotOperations, const MAX_SLOTS: usize> Unpin for =
SlotManager<T, MAX_SLOTS> {}
>=20
> Do we really need to explicitly flag this type Unpin? I thought this
> was the default if the struct is not pinned (and it's not AFAICT).

We don=E2=80=99t.

Note that =E2=80=9CUnpin=E2=80=9D and =E2=80=9Cnot pinned=E2=80=9D are =
distinct concepts. Unpin
means, in more informal terms,  =E2=80=9Cthis type does not care if it =
is
moved=E2=80=9D, but it does not preclude you from putting it into Pin<T> =
or
kernel::sync::Arc<T>. If by =E2=80=9Cnot pinned=E2=80=9D you mean no =
#[pin_data] or
#[pin], then also note that deriving this macro is distinct from "being
pinned".

The relevant rule here is that a type is Unpin if all its fields are =
Unpin.
This is the case for all non-generic types in SlotManager, so it is =
Unpin as
long as the generic types T and T::SlotData are also Unpin.


>> +
>> +    // Checks and updates the seat state based on the slot it points =
to
>> +    // (if any). Returns a Seat with a value matching the slot =
state.
>> +    fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) =
-> Seat {
>> +        let new_seat =3D match locked_seat.access(self) {
>> +            Seat::Active(seat_info) =3D> {
>> +                let old_slot_idx =3D seat_info.slot as usize;
>> +                let slot =3D &self.slots[old_slot_idx];
>> +
>> +                if kernel::warn_on!(
>> +                    !matches!(slot, Slot::Active(slot_info) if =
slot_info.seqno =3D=3D seat_info.seqno)
>> +                ) {
>> +                    Seat::NoSeat
>> +                } else {
>> +                    Seat::Active(SeatInfo {
>> +                        slot: seat_info.slot,
>> +                        seqno: seat_info.seqno,
>> +                    })
>> +                }
>> +            }
>> +
>> +            Seat::Idle(seat_info) =3D> {
>> +                let old_slot_idx =3D seat_info.slot as usize;
>> +                let slot =3D &self.slots[old_slot_idx];
>> +
>> +                if !matches!(slot, Slot::Idle(slot_info) if =
slot_info.seqno =3D=3D seat_info.seqno) {
>> +                    Seat::NoSeat
>> +                } else {
>> +                    Seat::Idle(SeatInfo {
>> +                        slot: seat_info.slot,
>> +                        seqno: seat_info.seqno,
>> +                    })
>> +                }
>> +            }
>> +
>> +            _ =3D> Seat::NoSeat,
>> +        };
>> +
>> +        // FIXME: Annoying manual copy. The original idea was to not =
add Copy+Clone to SeatInfo,
>> +        // so that only slot.rs can change the seat state, but there =
might be better solutions
>> +        // to prevent that.
>=20
> Okay, I guess we want some inputs from Daniel and/or Alice on that =
one.

Hm, I'd say we shouldn't implement Clone to avoid any possibility of =
holding on
to stale state by duplicating it.

Why do we need to return Seat from this function? Can't we simply write
locked_seat in place and not return anything?

>=20
>> +        match &new_seat {
>> +            Seat::Active(seat_info) =3D> {
>> +                *locked_seat.access_mut(self) =3D =
Seat::Active(SeatInfo {
>> +                    slot: seat_info.slot,
>> +                    seqno: seat_info.seqno,
>> +                })
>> +            }
>> +            Seat::Idle(seat_info) =3D> {
>> +                *locked_seat.access_mut(self) =3D =
Seat::Idle(SeatInfo {
>> +                    slot: seat_info.slot,
>> +                    seqno: seat_info.seqno,
>> +                })
>> +            }
>> +            _ =3D> *locked_seat.access_mut(self) =3D Seat::NoSeat,
>> +        }
>> +
>> +        new_seat
>> +    }
>> +

