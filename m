Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C222DC76A
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Mar 2026 21:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773091010; cv=none; b=o1beMtNHvNR8ZtEHda1SP0HfZCTEG/aoJT/XIokQVTVuGOCZUAqFCXMg0WPbuS6mQCybO8b2iVZ9GCdIOTxVmUUfetcO7empr+eSgeMcaDi90VFAsJoS1J54NQ6tynbT7oGwivT+yfGVzdW1qWnNavC9nNJpZonf6qXmF89xHt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773091010; c=relaxed/simple;
	bh=BVbyqVJIaM9xjQ1nS8IQ1kQME9t/EvrLMl129XoNgy4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eOyaGNah2JTldIhQ7PzoCQFSoroqkw3x03fNR4o2PjIk+2yh49fCJON37jbMXb2nM1/FvxAN2ZOlA+UkMQeGpjb7N37FIjlG3N4EvWcYhGLSGT20DLw/Ynohxke4J91o57GmpyeoX79vZsBWq0NRZ2Vg/4JC0nIzA9OvCpErXTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me; spf=pass smtp.mailfrom=ik.me; dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b=ZPyjEyv4; arc=none smtp.client-ip=84.16.66.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ik.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b="ZPyjEyv4"
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fV8vx0X8lzPMG;
	Mon,  9 Mar 2026 22:16:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
	t=1773091004; bh=53430ld6TuOhPe06CqOr6FSTQYKWdBF9o2ZOnQ454dI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ZPyjEyv4HE7KJmDTEVH+QqE3n8wAIA0Ro1jil9TZoNSQZxyMbyrYW/e7LzScv7RQr
	 o5Uz6DDlBd02ieGQHeMdQBvTwkp238+0ASvpUwt/NT6nmRXeel/9YcIXmpYr746jRm
	 gP1ZUv8Cqa9MVPxtVLG2KWxA9oRRDZsOS8PwcCD4=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fV8vv4BwqzBGL;
	Mon,  9 Mar 2026 22:16:43 +0100 (CET)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 22:16:43 +0100
Message-Id: <DGYKAXUZE263.3VQZGY7KJ5FEY@ik.me>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>
Subject: Re: [PATCH v11 00/12] gpu: nova-core: add Turing support
From: "Ewan Chorynski" <ewan.chorynski@ik.me>
To: "Timur Tabi" <ttabi@nvidia.com>, "ewan.chorynski@ik.me"
 <ewan.chorynski@ik.me>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "airlied@gmail.com" <airlied@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "simona@ffwll.ch" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
 <DGYIFHP99CQ3.2XWVRPO9O1E1D@ik.me>
 <282984b6-a0e1-4e3a-bb57-db817b7e9249@nvidia.com>
 <864ab8a502db872468d7b01e0adfff386d2187cc.camel@nvidia.com>
 <fa3c5390-aea2-45c2-89ef-05a64070a44b@nvidia.com>
 <DGYJY8VKR9EK.1XPGZ34UPJ0B2@ik.me>
 <5390ee90b722b29e686d948bc855da1eb62a4f6b.camel@nvidia.com>
In-Reply-To: <5390ee90b722b29e686d948bc855da1eb62a4f6b.camel@nvidia.com>
Feedback-ID: :52330b22a40e583:ham:e74197f626dda86
X-Infomaniak-Routing: alpha

On Mon Mar 9, 2026 at 10:05 PM CET, Timur Tabi wrote:
> On Mon, 2026-03-09 at 22:00 +0100, Ewan Chorynski wrote:
>> On Mon Mar 9, 2026 at 9:29 PM CET, John Hubbard wrote:
>> > On 3/9/26 1:18 PM, Timur Tabi wrote:
>> > > On Mon, 2026-03-09 at 13:04 -0700, John Hubbard wrote:
>> > > >=20
>> > > > I have that exact card available, so I'll give this a quick test a=
nd see
>> > > > what's missing or wrong, now that Alex has pushed the entire Turin=
g support
>> > > > set up to drm-rust-next.
>> > >=20
>> > > The TU117 is technically a mobile chip, and its VBIOS is different.=
=C2=A0 My initial version of the
>> > > Turing patches would "ignore" the problematic VBIOS sections, so per=
haps this changed.
>> > >=20
>> >=20
>> > No repro on the latest drm-rust-next branch:
>>=20
>> I guess I may have an issue with my linux-firmware. I have no stable
>> right now so I can't download the latest one but I'll try
>> soon. On which commit on linux-firmware are you ?
>
> There's only one version of linux-firmware that works with Nova, and you =
didn't have it, it wouldn't
> boot at all.
>
> Although, now that I think about it, I'm assuming that on Turing, if gen_=
bootloader is absent,
> NovaCore will not even try to boot.  That file was added recently and is =
missing in most distros
> today.
>
> /lib/firmware/nvidia/tu102/gsp/gen_bootloader-570.144.bin  (or its zstd c=
ompressed version)
>
> If you have this file, then you have everything you need to boot NovaCore=
 on Turing.

I had this file installed but I think I broke something when I updated.
I tried to redo my installation from the tarball I had and now it is
probing, so the issue was indeed on my side with my firmware.

Thanks for trying the repro and sorry for the false alarm.

Have a good day
Ewan

