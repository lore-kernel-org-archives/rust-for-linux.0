Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0B43EBF31
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 12:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771677910; cv=pass; b=X/EGSc9YhUzYkB5+S/zrrFxF2Obbt/8HOw3Xy9RbWz1OxusCqBuZBk62CMHXsO7EwNS2eHIf/UFj+rM2wLh9qflgR1vlmTtt1g0V89NDIwbx0ImK6it62Jb8/KhnBbW0PAKojifFXVaiSpYYCUiTl1iJgnGnNPcjq7Nr/qsAfZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771677910; c=relaxed/simple;
	bh=IOvI83B/cIT8bYm0dRB4m1gMSE9CxfsnS5WRWQEwAYg=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=G4a7gtPAK6mnjmcdXVKmZW6W1ujcDC11kM57mv+CqMmgO4Qn3+8Ouqqokwf6rCQcVCOgddbJd/Hgyh+kjGXKOOvTNr72nwKzAk2FIGFAfaxADyeoSdEM+IXPwEykkGHANuZoaWAd0nx+a4gD8LMbJFzfV2J4XKJ/2pWQar/WBzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=MZonnIEQ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="MZonnIEQ"
ARC-Seal: i=1; a=rsa-sha256; t=1771677901; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TWCeSHaXdySiDmuEfkC9Nrq/aGKv07Io2tkF6PEotPZMBJ1Ph6dA/xgkAZCNQgXJXWVc9KFxBNtQ7mNm8lioUzZQ3Q+NegirvpVjeM+fAbP8TkEUrsw70cFffBZz7z39k+VCUk80USOViZ6fS+qaaQukV2AcO9BcwXByoE7H+BU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771677901; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SgXlv7TllpBaP/d9E1ESGvy7DB77p/4obwqFzCoHZVU=; 
	b=kbRWPulYQnp1HWHCw9awO7r+F7fAz/ipNKJeLcK2+lQz3nDzvkP/03TcMt6Qhgk0Y33ju156DTeoQ39J+wbhpT5WInoi5WbTvXT/RINVHTy0RF7l1AfEGqc7VEva9ZDSFGHLs2DtczydvYCe0gCkPJ5kQdWu0UmyHRwyXiEU5/I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771677901;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:References:Cc:Cc:In-Reply-To:To:To:Reply-To;
	bh=SgXlv7TllpBaP/d9E1ESGvy7DB77p/4obwqFzCoHZVU=;
	b=MZonnIEQifgCPInkwSGPInoI5m5T3mxwfkrmsGh32w2KWgpeEopO049xeT5vuvtq
	oS/c1nnFKGzDNhj4yq8MA34gUNBBJJMz5YbdBHanvFIbSBJPHCPNAUxhqTW9ong4BZq
	BrX5ujlXMkkpsyJHws089d5Ev+n7foktFp0BjQI8=
Received: by mx.zohomail.com with SMTPS id 1771677899641129.55273493234313;
	Sat, 21 Feb 2026 04:44:59 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Daniel Almeida <daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
Date: Sat, 21 Feb 2026 09:44:45 -0300
Message-Id: <4A56F56B-7366-451E-9B65-09B2EE16075E@collabora.com>
References: <aZmUJxyZM3taMvAC@google.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 beata.michalska@arm.com, lyude@redhat.com
In-Reply-To: <aZmUJxyZM3taMvAC@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: iPhone Mail (23D127)
X-ZohoMailClient: External



> On 21 Feb 2026, at 08:17, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> =EF=BB=BFOn Thu, Feb 12, 2026 at 11:11:13AM +0100, Boris Brezillon wrote:
>>> On Wed, 11 Feb 2026 17:37:08 -0800
>>> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
>>>=20
>>> From: Boris Brezillon <boris.brezillon@collabora.com>
>>>=20
>>> Introduce a generic slot manager to dynamically allocate limited hardwar=
e
>>> slots to software "seats". It can be used for both address space (AS) an=
d
>>> command stream group (CSG) slots.
>>>=20
>>> The slot manager initially assigns seats to its free slots. It then
>>> continues to reuse the same slot for a seat, as long as another seat
>>> did not start to use the slot in the interim.
>>>=20
>>> When contention arises because all of the slots are allocated, the slot
>>> manager will lazily evict and reuse slots that have become idle (if any)=
.
>>>=20
>>> The seat state is protected using the LockedBy pattern with the same loc=
k
>>> that guards the SlotManager. This ensures the seat state stays consisten=
t
>>> across slot operations.
>>>=20
>>> Hardware specific behaviour can be customized using the slot manager's
>>> `SlotOperations` trait.
>>>=20
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
>>> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
>=20
>=20
>>> +type LockedSeat<T, const MAX_SLOTS: usize> =3D LockedBy<Seat, SlotManag=
er<T, MAX_SLOTS>>;
>>> +
>>> +impl<T: SlotOperations, const MAX_SLOTS: usize> Unpin for SlotManager<T=
, MAX_SLOTS> {}
>>=20
>> Do we really need to explicitly flag this type Unpin? I thought this
>> was the default if the struct is not pinned (and it's not AFAICT).
>=20
> It may be cleaner to add `#[pin_data]` to the struct and rely on the
> Unpin impl it generates.
>=20
> In general, the default Unpin implementation is to inherit from the
> fields. When you add #[pin_data], it's changed to only inherit from
> fields marked #[pin]. By adding #[pin_data] but not marking any fields
> #[pin], it will be Unpin unless any of the zero fields marked #[pin] are
> Unpin, i.e. it will always be Unpin.

Why do we need this if all fields are Unpin?

>=20
>>> +        // FIXME: Annoying manual copy. The original idea was to not ad=
d Copy+Clone to SeatInfo,
>>> +        // so that only slot.rs can change the seat state, but there mi=
ght be better solutions
>>> +        // to prevent that.
>>=20
>> Okay, I guess we want some inputs from Daniel and/or Alice on that one.
>=20
> You could consider only implementing Clone. That way, copies do not
> happen unless you do so explicitly. Or add a private method on the type
> that has the same function as Clone if you do not wish to expose it.
>=20
> Alice


Please check my solution where clone is not needed.

=E2=80=94 Daniel=

