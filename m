Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF767471254
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 21:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902463; cv=pass; b=CyjGReXiAkQ1PrpJ63UPLWafyyTZ8us996xgAYL3zn08Ka9sDxKjUAo0fLQ5LVggPsuK0xBBJKDb20zuh76zhXQkwzjyeR6si5srwoSkE64Ee4YBqLyHz9Q4Rogh/7t7sUCtOx3Y/MzVwEz1O5Av/nv0tKBDn3Fq8gEsB6CdEx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902463; c=relaxed/simple;
	bh=UwTlE6O+arphbaF2nVtTqmf7C/u3HA0Dq9U1XFRrceA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qDj2ybnxEqk4tRLBxOA1DYlu9D9Wp4O64UWIzCc9Z5yirYfCtbJPXn5Ah+83EOVb2t4WyqNp72FZpEikeSD84XHYnQdzWnB9RY5n5S7MX2BKx6R0/ElJHRGJaN5mGbFjbLA/WqrKdSOqaQUnJnlg0n8siPA+R2VZ2AttiYlEMcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com; spf=none smtp.mailfrom=darkrefraction.com; dkim=pass (2048-bit key) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.b=iFzVP5Dn; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.b="iFzVP5Dn"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c664b8c3f3so4354577e0c.0
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 14:21:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788902460; cv=none;
        d=google.com; s=arc-20260327;
        b=lwVSWQnSYweDOwn9s0CksD4mt53i84DN/YJO6uVefe+8bHB+QYPX1/EXlT70ZHJz43
         Sbk78waMbb0W+aqEOaJwAApdi58t4ubCMXSzRCB/Aaa1/AFMIy6CaqxbXCBya5I1LCU6
         oRjrvP4oPY79qlFfH8YKAVmDDkQlXa8eAeCgRI0uZIlpkfWzlNmx1XLwh8NKaGZRJWc3
         oQZDGrhz1WKzruItwwk6UYUfbGbqJjPOH3WdHy+1kTuzfaCMacWZFRErqYttJdPZAs6K
         4l6uQxKKt2m9OhOzTf0UR3O1mJjyi1hSGN66ifW6x0J7srQQPNwaepdSSA3Bteew4qz6
         ezRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VvyjDZ06O/CEu+yLay8HNE7ZoTCVU0Mg4mkvXP43glw=;
        fh=gEX+Eea0ijnXtdaDhWNjyKw39JiJaC0CrjnF6aTdkxU=;
        b=L/Rxe4UycQT7W35NVIQ+snkluhowGajr2JvjUMyFvEtHE6a9Pw18tDe6in1VyA05hI
         3MuB/hbueR/gAnhbrhg8LG59q81ZCvMKauWxq5OYidXZF2q7j9gRSnxmDEiDdMRnQkum
         0FLECQHTvl632VD3WyXtDdbuYvQUhJETBF7pe8t017Rg9UjctKiwX+i28l1siO7OXDeP
         rZCiajzhkTqkaDkyHweKKMeRHPQt/Msla1hYPDcIcJHUW/SFNHHWXZWvGs15JFIGB/Bg
         QUZB/+1A2Yxj2tYI4PEkPOBa68aq3JFoRBRLneVVvQGVlAZaZWg8OnqbKvGj3WLKMHlc
         iO0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20251104.gappssmtp.com; s=20251104; t=1788902460; x=1789507260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VvyjDZ06O/CEu+yLay8HNE7ZoTCVU0Mg4mkvXP43glw=;
        b=iFzVP5Dnb9PScf0W7wrGNRfHjKShRjrBhr96qV4AAjVMNPgXP1r81Mr+GGxqmIM9ZH
         2GIqicz9hC+UvTMBrYgIiY5Bv4hs7Jym4vt25K46h3cvyRf1RXCBa8IOeyUZSt+hDPOr
         BtrIOb+L9ZLP47toWxrzwsdvIk3x+jb85ytWEuYHVrQlbPTCMZ45mg0cdZ2J2n0aDove
         uIkyWvH9JbkiRKCSH0/rk+Bn5GqI7ALCXWK/EQF0REcym+N9MhB19OpEA1XfbbdstOhP
         DYnj7R1KADTo5188qAGFnl027YUgP9fu0q4TNyCkYhcOHaezzahgeWAtrpJIy4r9VG80
         W0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788902460; x=1789507260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VvyjDZ06O/CEu+yLay8HNE7ZoTCVU0Mg4mkvXP43glw=;
        b=o2jHE1GvKf+4zeaMwd9HnofRMsNfyt9V8u7b/9agLFBIoiLz5gQ9DVf56FhjqEJeLH
         dg+QusLUfcNwcwaOyMvrqkxPSmrNq73CsXWxmhptpxeTv8oLm3ynOPxudOVFLtiZdD7Q
         5XvdksRBavj/K8eUSGWG4wdT7iE3Wz7JPaYtg3dXrPEDaNscTFL8CWP08MPNiH2SP5Ps
         CzHYBR3GCLJW6bi6oRqh5RmwQU1QxQmuW5yDpHOinp8XjdI9z36OyAYHQ7WRvekZtyQW
         U48EKCD+ySvc28cuwZcmXnIFbnKbnJw4EADtTRCL2ntsXyfndkaBTdKxka57ImNq05Bd
         iCmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqf9rRdcZ3b5Be5qixeN9j/Bf6/X1v1acPavFq5P3+fVnPYT4g2dI8+dw5tWaAcfGX7++7PKKJc8SwdsS9mw==@vger.kernel.org
X-Gm-Message-State: AFuF++nrcFKTh579IBdxOnbmqvKxx0zBsqut93ViY4ewCn6r1iB7NCj5
	/KnfdllwPWd39f7jSE2HzwG283Be+AjpCE3d7pSLDtmHeKpXPJ+ejXZDnUn2tHaVuUrBBlV1Pmz
	MYY6X+sQJE6z2ZEOmsYGJt57E352MZg2ObjfkCyAGTA==
X-Gm-Gg: AYBFou0/VDfgJF7UpSwPg86Hex+kbIlnknomo0E/P6vlIAKnw2zpNwfnDgokDpD/EUj
	yNUz+OoeVCtzTySBGWUgR0Amm9wC5weSxbJbRpEUeb+OCZy09zitBVF/3n9dgQ8XV+L5pUKgITL
	p/YFiPsXCphP4nLva4wKMHn0CI413nByR8AOezMgB812pd8gkg2wTj+x1gVZygbQ8mNQQUaleNK
	JHV2om6YoaZpIX3YO3YcdQSjtmO+TzChYvEXBqp/78znfleaywKzpZT15iF12xAngte8gzGYSMZ
	QPkuh/A2izJQSgha5SNJ5EhAGXk3xf72pouZyphyaZg+
X-Received: by 2002:a05:6122:e189:b0:5bb:eebe:7ffd with SMTP id
 71dfb90a1353d-5c7ed846723mr18349037e0c.8.1788902456679; Tue, 08 Sep 2026
 14:20:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828033531.1117754-1-apopple@nvidia.com> <20260828033531.1117754-6-apopple@nvidia.com>
 <DL3WXUPD5JKE.2GZ1CNJH539ID@kernel.org> <DL453EFS03T6.2VGI5TJEQ52QO@kernel.org>
 <apdvTgAp5eGezO5t@nvdebian.thelocal> <DL4QCAZXM8EU.2K8MLAM00VNTX@kernel.org>
 <apioGUDamrCur_oR@nvdebian.thelocal> <DL5MA26KZEF9.3KHKQXZ4JD2G6@kernel.org>
 <CAAgWFh2iPJzQ5PJfFpPBTdgZ=GFjy7Eoz5C0e1WwFMuOuyJSTQ@mail.gmail.com> <DLA3DUADGEQX.1Z2G7Z4TYFK1@kernel.org>
In-Reply-To: <DLA3DUADGEQX.1Z2G7Z4TYFK1@kernel.org>
From: M Henning <mhenning@darkrefraction.com>
Date: Tue, 8 Sep 2026 17:20:30 -0400
X-Gm-Features: AcwNN1WUDXxoNO6V6IWGTSyf4m-_qnTdLZpGwBIrUYQYwOu9jMMSrLkSn7q6ieM
Message-ID: <CAAgWFh3FoAJND1wS6Wu_taUWPYGXpawEtKUiAwR3HpjcqXyWGA@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, nova-gpu <nova-gpu@lists.linux.dev>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 12:57=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue Sep 8, 2026 at 4:48 PM CEST, M Henning wrote:
> > On Thu, Sep 3, 2026 at 6:42=E2=80=AFAM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> >> Because userspace otherwise has to figure out the architecture itself =
based on
> >> the chipid, while the kernel already did derive this information.
> >>
> >> There's many ways userspace could do this, and I don't want to incenti=
vise any
> >> of them.
> >>
> >> For instance, you previously showed how userspace derives the SM value=
 from the
> >> chipid with sm_for_chipset() in mesa with its own lookup table.
> >>
> >> Then in NAK (src/nouveau/compiler/nak/ir.rs), there's this code.
> >>
> >>         fn is_turing(&self) -> bool {
> >>             self.sm() >=3D 73 && self.sm() < 80
> >>         }
> >>
> >>         fn is_ampere(&self) -> bool {
> >>             self.sm() >=3D 80 && self.sm() < 89
> >>         }
> >>
> >>         fn is_ada(&self) -> bool {
> >>             self.sm() =3D=3D 89
> >>         }
> >>
> >>         #[allow(dead_code)]
> >>         fn is_hopper(&self) -> bool {
> >>             self.sm() >=3D 90 && self.sm() < 100
> >>         }
> >>
> >>         fn is_blackwell_a(&self) -> bool {
> >>             self.sm() >=3D 100 && self.sm() < 110
> >>         }
> >>
> >>         fn is_blackwell_b(&self) -> bool {
> >>             self.sm() >=3D 120 && self.sm() < 130
> >>         }
> >>
> >>         fn is_blackwell(&self) -> bool {
> >>             self.is_blackwell_a() || self.is_blackwell_b()
> >>         }
> >>
> >> That's two unnecessary indirections for something the kernel already h=
as
> >> available.
> >
> > Userspace mostly uses sm id and engine id for feature checks, and I'd
> > like to keep it that way.
>
> Please note that I did not ask to change any of that in the context of
> chipset/architecture enums.
>
> What I said is that I don't want to incentivise userspace to derive the
> architecture of a chip on its own, given that the kernel already does thi=
s. (If
> it is never needed, that's fine too, then we don't need to export it. :)
>
> Of course, architecture and engine class id can't be used interchangeably=
. The
> engine class id is more fine grained. For instance, the engine class id i=
s
> different for GA100 compared to all other Ampere chips.
>
> At a quick glance the code above looked to me as if it doesn't care about=
 the
> engine class id, because the granularity is architecture granularity and =
not
> engine class id granularity. But at a second glance, I think you are actu=
ally
> deriving the engine class id and it just happens that the code does not n=
eed to
> consider e.g. AMPERE_A vs. AMPERE_B, which is why you don't have an
> is_ampere_{a,b}() accessor I suppose.
>
> That said, nova can easily export the engine class id information instead=
 of the
> architecture; the kernel will likely need the engine class id anyway. (Al=
though
> it depends a bit on the GSP-RM API, I think technically it could get away
> without the driver passing it in.)

I guess my point is that the entire compiler uses SMs everywhere. It
largely only knows what sm you're running. The is_blackwell()
functions are helper functions and are not typical of most checks in
the compiler. I don't consider this "two unnecessary indirections" and
I think the code you quoted is fine.
