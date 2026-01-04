Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch [83.166.143.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732CB1BCA1C
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767522121; cv=none; b=cSYXeN0qHGqf3GcKvUCuOALS+Meey3yawTxgTBGXvwp3Tc0QuZkDe9W37ELGw45IpXVz/DtvsWAorVGX3U1t1L5arfWRn6X9a+9qldd1vHxpZCDU93bFbKbDzBF90Nb1jEuFELhtSvoL8HyrKRxxejjWYHV3Ie9VEG9odjMOT4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767522121; c=relaxed/simple;
	bh=osK162ps0LJB/B9ShmgA37iaeFSkuMLPzcX3Quc4Yrw=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=UfKv7Bl410BP+XwD6C6DL0585X9WIoHtisj0e9Mh/rPi+dYq3iSd6PkzHY8j4WwD0JSd8CO/Yl8Joz8/FZzEPZoK14WKSFb58f5MY9Kx5XY5KSCTS1JKLIOAklbeTka075+Uwpxb8v18A9ojIn2lkboDgSjE8xmpCfMDzOGjX4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me; spf=pass smtp.mailfrom=ik.me; dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b=4iuCzjTQ; arc=none smtp.client-ip=83.166.143.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ik.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b="4iuCzjTQ"
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dkYPl0j04zqc4;
	Sun,  4 Jan 2026 11:21:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
	t=1767522106; bh=E3pWE0rXz5wnnhUWZBYF0n1WK9DqOL4J+vu67+IxT+w=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=4iuCzjTQw9OcpBOlkFWXj/C2H3pmBVxzn16uD36c/0ViNmng+yVHU7/+NIgY+TY+7
	 9ZJbHyRWOdgeaaX62K0BMO4DHpVSSPqaMnFDXrQD3SOgH8hDgDRx6W1434yLMYbwGb
	 il4su4J/ZCOg944XBdUZmnu1hnV8IJLYPLIXENcU=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4dkYPk0vYPzTNq;
	Sun,  4 Jan 2026 11:21:46 +0100 (CET)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 04 Jan 2026 11:21:45 +0100
Message-Id: <DFFQALP7EVRX.TFWUBO31C9IH@ik.me>
Subject: Re: [PATCH v4 00/11] gpu: nova-core: add Turing support
From: "Ewan Chorynski" <ewan.chorynski@ik.me>
To: "Timur Tabi" <ttabi@nvidia.com>, "ewan.chorynski@ik.me"
 <ewan.chorynski@ik.me>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: aerc 0.21.0
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <DFA1CUMND2ME.1D3PAJW641QHM@ik.me>
 <802504957624510a92a4b028a2d5c4d41f1ee6e1.camel@nvidia.com>
In-Reply-To: <802504957624510a92a4b028a2d5c4d41f1ee6e1.camel@nvidia.com>
Feedback-ID: :52330b22a40e583:ham:e74197f626dda86
X-Infomaniak-Routing: alpha

On Tue Dec 30, 2025 at 10:42 PM CET, Timur Tabi wrote:
> On Sun, 2025-12-28 at 18:45 +0100, Ewan Chorynski wrote:
>>=20
>> [=C2=A0=C2=A0=C2=A0 3.623000] NovaCore 0000:01:00.0: GSP MBOX0: 0xffffe0=
00, MBOX1: 0x0
>> [=C2=A0=C2=A0=C2=A0 3.623026] NovaCore 0000:01:00.0: Using SEC2 to load =
and run the booter_load firmware...
>> [=C2=A0=C2=A0=C2=A0 3.626236] NovaCore 0000:01:00.0: SEC2 MBOX0: 0x31, M=
BOX10x0
>> [=C2=A0=C2=A0=C2=A0 3.626265] NovaCore 0000:01:00.0: Booter-load failed =
with error 0x31
>>=20
>> Is this expected to happen ? Here is the full device description from
>> lspci :
>>=20
>> 01:00.0 VGA compatible controller: NVIDIA Corporation TU117M [GeForce GT=
X 1650 Mobile / Max-Q]
>> (rev a1)
>
> This should work on your GPU with my patches.  Error 0x31 is a generic fa=
ilure error code that
> indicates that booter_load failed to initialize, and that could be for an=
y number of reasons.=20
> Unfortunately, the only way I've been able to debug such issues is to rep=
roduce them in-house with a
> custom build of booter_load.
>
> I suggest that for now, you hold off until these commits are merged, alon=
g with my debugfs patches,
> and then I can try to find a similar GPU internally that exhibits the fai=
lure and see if there's
> something else missing.  Turing is the most complicated of all GSP-capabl=
e GPUs to boot, partly
> because the firmware does a terrible job of reporting errors.
>
> I'm assuming that Nouveau boots just fine with the same firmware images? =
 If you turn on debug
> logging in Nouveau, it should say that it's booting with 570.144.  You ca=
n force it by deleting all
> the *535.113.01* images in /lib/firmware/nvidia/

Nouveau is not probing either with 570.114.

[    5.619048] nouveau 0000:01:00.0: gsp: firmware "nvidia/tu117/gsp/gsp-57=
0.144.bin" loaded - 28542040 byte(s)
[    5.619431] nouveau 0000:01:00.0: gsp: firmware "nvidia/tu117/gsp/bootlo=
ader-570.144.bin" loaded - 4196 byte(s)
[    5.619944] nouveau 0000:01:00.0: gsp: firmware "nvidia/tu117/gsp/booter=
_load-570.144.bin" loaded - 59272 byte(s)
[    5.620351] nouveau 0000:01:00.0: gsp: firmware "nvidia/tu117/gsp/booter=
_unload-570.144.bin" loaded - 39304 byte(s)
[    5.620356] nouveau 0000:01:00.0: gsp: RM version: 570.144
...
[    5.860631] nouveau 0000:01:00.0: sec2(gsp):booter-load: booting
[    5.860943] nouveau 0000:01:00.0: sec2(gsp): mbox 00000031 00000000
[    5.860961] nouveau 0000:01:00.0: sec2(gsp):booter-load: boot failed: -5
[    5.860982] nouveau 0000:01:00.0: gsp: released sec2 falcon

This suggests that the firmware itself is part of the issue. I can send
the full boot logs from nouveau in debug if needed.

I also tried the fix given by John at [1] but got the same error so it
may be a different issue.

[1]: https://lore.kernel.org/rust-for-linux/4beba5c3-a117-4cb7-8fed-2f1c133=
dfec2@nvidia.com
