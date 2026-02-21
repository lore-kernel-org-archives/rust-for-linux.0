Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B74279DC8
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 11:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771672619; cv=none; b=J8tMd3ZB95aGotzSUZa045ISS9E+g9A1s9gkQRoItnQMKejE1ouqy45lHVC9aZBMd9+TcQRu7Qt9jgfRfZgDdUnAGF4yx6CQIBaA0eEdbv4bByZcjPso7qZJFv2Wvn3dAQ/GUJ5dOkVQttxOmUrXQ42s3IZ2yIGWFgx78YZIkFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771672619; c=relaxed/simple;
	bh=Uf6BubPiMgbdg2LE4QMlMQ64NJaakBO9NFXvSY80YBA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jybMLji2ibMh3smB/eM7lFrxFdAB1YcK4K4QFS1WzVxnI4dD4QcsxBw0Enx/Pl5CZzK9ExaffhSFp0nWJ/KrsVGcQrgX4/s+CikzGhg0E1J5k5DbSRdqsi6qNdsPzk51cTPYdsXVDvxTye+POgS/jguAHbcpf/iUJ7bYfsMCWJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zVFsHi29; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zVFsHi29"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-483a2db68caso21987915e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 03:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771672616; x=1772277416; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TPEdD6W9mbV8SmJ8ZUWtD/nrbbQE48InvPdgQtXLnW8=;
        b=zVFsHi29MEf2axwOyMVREXAg3x6Q4nqLAelM/E1qFoR1ho5fpMmPxiKFcXBmWS+p54
         hffdX/DmuFydHY1CJixbnFySRztQ3hmq1aP+4XzeY1MzN1/LoPh4Kpy4wrEzMNfavHba
         jtRA2d06h2aNCr7nL82WN+5D40a5AprmTOvdqRecTGT7Wb+p4og6FZpUTHXYW1w8+2n9
         vTPUd9hxECxEX0j+qSL4BzeM7yhNzOuucZBTOSxSDLluNz9yde8eqLoypARM4ZglCuJP
         +wqVFpGYOAIk69AvjlVQfmj9vqVXTnerdufsvGsaemJ38AO2Ao6xVvp7k+s9GJNJYZrn
         NALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771672616; x=1772277416;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPEdD6W9mbV8SmJ8ZUWtD/nrbbQE48InvPdgQtXLnW8=;
        b=j7TEotIsXznWwT+52yU1p3n0wyvyXF15PxEmPGMS6Af5LWNAGkhD6Ow/DeoQ/Xk15i
         rHAmWlgeqBCWudTJXMhfBBbJFeUr3mUQd87efN2IdbOCbcXuFpB8mzZ7N1aaOdNTVqhu
         OlKroOJq4tbbSfvFoiChSWVgUSYBbxzYOx4sQV4AFx9uu43jkS0ocCst3tHpb7ujAHtD
         GxS2sFZ41yddqyiQyqam2oGCgRMzOvEahFNp/yxqDlRAxbuiTNuTl1z1Os3b+SAddrih
         ZLadwEvP1+ln8FbC/hBtP7/W7QjFaAYwLDusMdmZoTxchdb2pyNvzJh5yQWLuU3FjNvX
         tKhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVOvY9t3y3dPIe+FBJlU++wsVZ1t8agKGZkAi9C2N1WTUCzLe+TNY+obKmNWoR4VQ6vzkS9FO8A3fJvP9UlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGfRkPm0MDBw/PMkBWrGDn835NfgWg83tvZ7fAosoC5VpXwpAs
	78QFUlCalGJ0aV7rT/pMKmkf0FcIIMHTScsz140gA30rabPIwV2CGGiBF6GUinGH3iRFcMKS6II
	xW+xosgD4TMTHPFVXtw==
X-Received: from wmby13.prod.google.com ([2002:a05:600c:c04d:b0:483:7c8d:ed1d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b02:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-483a95aa31dmr41813525e9.1.1771672615882;
 Sat, 21 Feb 2026 03:16:55 -0800 (PST)
Date: Sat, 21 Feb 2026 11:16:55 +0000
In-Reply-To: <20260212111113.68778819@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-8-deborah.brouwer@collabora.com> <20260212111113.68778819@fedora>
Message-ID: <aZmUJxyZM3taMvAC@google.com>
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
	beata.michalska@arm.com, lyude@redhat.com
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 12, 2026 at 11:11:13AM +0100, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 17:37:08 -0800
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > Introduce a generic slot manager to dynamically allocate limited hardware
> > slots to software "seats". It can be used for both address space (AS) and
> > command stream group (CSG) slots.
> > 
> > The slot manager initially assigns seats to its free slots. It then
> > continues to reuse the same slot for a seat, as long as another seat
> > did not start to use the slot in the interim.
> > 
> > When contention arises because all of the slots are allocated, the slot
> > manager will lazily evict and reuse slots that have become idle (if any).
> > 
> > The seat state is protected using the LockedBy pattern with the same lock
> > that guards the SlotManager. This ensures the seat state stays consistent
> > across slot operations.
> > 
> > Hardware specific behaviour can be customized using the slot manager's
> > `SlotOperations` trait.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>


> > +type LockedSeat<T, const MAX_SLOTS: usize> = LockedBy<Seat, SlotManager<T, MAX_SLOTS>>;
> > +
> > +impl<T: SlotOperations, const MAX_SLOTS: usize> Unpin for SlotManager<T, MAX_SLOTS> {}
> 
> Do we really need to explicitly flag this type Unpin? I thought this
> was the default if the struct is not pinned (and it's not AFAICT).

It may be cleaner to add `#[pin_data]` to the struct and rely on the
Unpin impl it generates.

In general, the default Unpin implementation is to inherit from the
fields. When you add #[pin_data], it's changed to only inherit from
fields marked #[pin]. By adding #[pin_data] but not marking any fields
#[pin], it will be Unpin unless any of the zero fields marked #[pin] are
Unpin, i.e. it will always be Unpin.

> > +        // FIXME: Annoying manual copy. The original idea was to not add Copy+Clone to SeatInfo,
> > +        // so that only slot.rs can change the seat state, but there might be better solutions
> > +        // to prevent that.
> 
> Okay, I guess we want some inputs from Daniel and/or Alice on that one.

You could consider only implementing Clone. That way, copies do not
happen unless you do so explicitly. Or add a private method on the type
that has the same function as Clone if you do not wish to expose it.

Alice
