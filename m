Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [83.166.143.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8B1757EA
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 17:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766944524; cv=none; b=Ip3yP2vYa3cYImiB1YSWaxrCqvsQRYxAXfp7loTh4AqUKT5CQeGS5vLgy+ZXRSp53eMTACeiMFFAGiw8Bmda3cny07gjg6OXKIBukbUwBJ+QnSU8/WO1FGOqRAu4/0iD4AVqisbo5hFcxftCMFAcd2iBeSzjS6i84eIho+RmbKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766944524; c=relaxed/simple;
	bh=pGUmbC0h0mHJ59VnlKkS+L6LRqfOneoHIlhI8SeVWWQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=YWJ4Jn/yTZSwP5PC/UVnMAiWIvLd6rXVv+Yj8Mn/1RD9GDOYAvfNL9m6PB4Nfsjzado9//1R1o1IS7LQCoo02EUDe1P9jDHF9i2TbjSviRi1Nf76CgntUpleCv71mykYlBpNhzCFrhZF8UM6PJPQSyxbw5i+z/XfiYIySUCFLn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me; spf=pass smtp.mailfrom=ik.me; dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b=lEt2ztti; arc=none smtp.client-ip=83.166.143.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ik.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b="lEt2ztti"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dfRbR40kczVP0;
	Sun, 28 Dec 2025 18:45:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
	t=1766943955; bh=r42BM5PvPixDLRp4sXlUhKr0FhxwTxRFCpYTPDnxwMs=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=lEt2zttijovlUw1jkQ7vKR1YtKWCTklNXnT8ee4d61fnfV+N/zFfmkaxUHJ/8b/I7
	 FyTrFOAvO9RlYQdWPQdq5o8qkPuLHqF9LF37iT0xGKiqe1IQ3A6fY7KS+C1HBU+J8W
	 0nKC/XipY64kilQrxve+k3KVQ/CKvOFnBzIkrARo=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dfRbQ5TK7z1Bms;
	Sun, 28 Dec 2025 18:45:54 +0100 (CET)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 28 Dec 2025 18:45:54 +0100
Message-Id: <DFA1CUMND2ME.1D3PAJW641QHM@ik.me>
Subject: Re: [PATCH v4 00/11] gpu: nova-core: add Turing support
From: "Ewan Chorynski" <ewan.chorynski@ik.me>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20251218032955.979623-1-ttabi@nvidia.com>
In-Reply-To: <20251218032955.979623-1-ttabi@nvidia.com>
Feedback-ID: :52330b22a40e583:ham:e74197f626dda86
X-Infomaniak-Routing: alpha

Hello

On Thu Dec 18, 2025 at 4:29 AM CET, Timur Tabi wrote:
> This patch set adds basic support for pre-booting GSP-RM
> on Turing.
>
> There is also partial support for GA100, but it's currently not
> fully implemented.  GA100 is considered experimental in Nouveau,
> and so it hasn't been tested with NovaCore either.
>
> That latest linux-firmware.git is required because it contains the
> Generic Bootloader image that has not yet been propogated to
> distros.

I was curious to see Nova probe on my laptop equipped with a TU117M
GeForce GTX 1650 Mobile. I compiled with your patchset applied on drm-next
and downloaded the latest linux-firmware.git.

However, NovaCore fails to probe my device with the following logs :

[    3.497672] NovaCore 0000:01:00.0: FbLayout {
                   fb: 0x0..0x100000000,
                   vga_workspace: 0xfff00000..0x100000000,
                   frts: 0xffe00000..0xfff00000,
                   boot: 0xffdff000..0xffe00000,
                   elf: 0xfe2c0000..0xffdf4ea0,
                   wpr2_heap: 0xf7900000..0xfe200000,
                   wpr2: 0xf7800000..0xfff00000,
                   heap: 0xf7700000..0xf7800000,
                   vf_partition_count: 0x0,
               }
[    3.623000] NovaCore 0000:01:00.0: GSP MBOX0: 0xffffe000, MBOX1: 0x0
[    3.623026] NovaCore 0000:01:00.0: Using SEC2 to load and run the booter=
_load firmware...
[    3.626236] NovaCore 0000:01:00.0: SEC2 MBOX0: 0x31, MBOX10x0
[    3.626265] NovaCore 0000:01:00.0: Booter-load failed with error 0x31

Is this expected to happen ? Here is the full device description from
lspci :

01:00.0 VGA compatible controller: NVIDIA Corporation TU117M [GeForce GTX 1=
650 Mobile / Max-Q] (rev a1)
