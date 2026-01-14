Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CCD2BE629
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 11:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768389476; cv=none; b=ASite8HLviA6ag8iiCh4XQQ19owKLG5rNbDWG0Kq7OefwG8xxwSndITkt6nY/WvJ/Lwm5+ZY1pVjJEp9ncklB+ZPs8+VbjsBR/3l8um4RlYx36D2i6JYKD/xQNgkhpwCapUNcllqMk/riqGT/li/csoAZH6Z7gNo/pkHx9XVkJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768389476; c=relaxed/simple;
	bh=VBlpZhj/LWoZA1q8Bmj+GGOWyxlXRKjMjJARHdb6ULc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=s8As8Di0Idlgim//QERlqUJvUxbqM6JlH9JKUDsF33NK/czFUysp1KUw0Qz3WdSB6fiE2yUU7tVs7kLbRHjc7sVG9r/cYWzz6gMrTDUvN2Va5/b9hfgNTaBkrzjlUtnGmxecHB196ssCPKRASXtpzAvl+shMqIqs87Oc/IbsW5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjZavTHi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjZavTHi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B198C4CEF7;
	Wed, 14 Jan 2026 11:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768389476;
	bh=VBlpZhj/LWoZA1q8Bmj+GGOWyxlXRKjMjJARHdb6ULc=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=mjZavTHiAAR74GbiRJqzGs8PdvqPNC4LcFbEla7pigFlDJGs1YMSR2EDZhPpSEBB/
	 Q3+dMqmeHVOhd9jg19LQcejKEUDkOCDpn3IabgJsz8HJZN2HNU+NeheLKaG8A8NoSr
	 boV1PM3ur9gKgyoeLEClwIo466ySMVclLL/mOqfElG9AQbMgY3rpG2KMUT3Y0rG/Yr
	 nFnDvNr2X8Cx6zpzZ1iOCtz9SKXX1yKfyht2FbPzU2xYdTekjf4OrMAkxPQG+WdbRX
	 Uft8XqDFtBoTVmLLmSo8XzTb8U8FuUDwACUWvNdWJLP1BoOvd/EqkAypIpuWLlL9iR
	 7loObO3VrNyEg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 12:17:52 +0100
Message-Id: <DFO9R0JYCKZW.1P47POES0Z1A@kernel.org>
Cc: "gary@garyguo.net" <gary@garyguo.net>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "mmaurer@google.com"
 <mmaurer@google.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 0/9] gpu: nova-core: expose the logging buffers via
 debugfs
References: <20260113225408.671252-1-ttabi@nvidia.com>
 <DFNUAZQOJVCP.1XU9MQT44EEYP@kernel.org>
 <7951d14aa8c2aa0b55834cdaf6ddee3d30302421.camel@nvidia.com>
 <DFNV4H6O06OJ.1KU1PGYYQ1PBU@kernel.org>
 <2bae7712bfb3883fbf8d40fd9b54b922129dbb81.camel@nvidia.com>
In-Reply-To: <2bae7712bfb3883fbf8d40fd9b54b922129dbb81.camel@nvidia.com>

On Wed Jan 14, 2026 at 12:59 AM CET, Timur Tabi wrote:
> On Wed, 2026-01-14 at 00:50 +0100, Danilo Krummrich wrote:
>> Maybe Gary has an alternative idea for a temporary workaround since he's=
 working
>> on the proper solution to safely access module fields.
>>=20
>> But again, I think a simple global with a FIXME comment should be fine.
>
> That's what I had in my initial version.
>
> I wish you had said something when Joel suggested it:
> https://lore.freedesktop.org/nouveau/246c1ad4bb1ca7ef34f331fba33989bbae86=
18f8.camel@nvidia.com/T/#m69a23a3db642c8cbb22efe0e24647811e8ae3f12

This was when I came back from being five weeks out, left with > 10k unread
mails. This was known and I even offered a separate communication channel t=
o
reach out should something come up that requires my attention.

However, only two days later I did catch your subsequent series, replied [1=
] and
mentioned everything I mentioned in this thread as well.

> I spent a lot of time over the past few weeks implementing lookup support=
, and now you're saying it
> was for nothing.

I understand that this is frustrating, but I wouldn't say it was for nothin=
g.

You previously mentioned that you are relatively new to Rust; glancing at t=
he
code I can imaginge that you learned a lot from working on this, which I th=
ink
is pretty valuable as well.

Also, we can pick up this code at any time should someone find a valid use-=
case
for this feature.

- Danilo

[1] https://lore.kernel.org/all/DF18RFX3IHVP.3GYNJIYAFFJU6@kernel.org/
