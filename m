Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F0B2F1FFA
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 00:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769818859; cv=none; b=LD+jwlUzzFT2IKzi5ack5IimSMO8zqSd9mIugB9DLHiEMc1/8MtUxOSnaZVz0RH8QwXXzbZAA18cq4Z7vzs0vLEd3GV6pdAuSHQE0G6g96veJyvM/rRBKE0UpFHrIUvVazCH40DVoHCudb5FAKh+Mk0j/i1RDbj/5KMWW1nwieo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769818859; c=relaxed/simple;
	bh=zX0eDJRO+oU/bF//okRc9YhTFyjxZrSBK9wYVv61K2A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=JIhkEaY0s0hcL66CQZZMbNc5or7rCmjTOR9qrdg+A+gD6zwNzk5wM6P2nRtUSZ6BirqI42BqxEQBmdsiD31HKd1f/e9UMar8173gVr0we+iCGIo+KfYwbWlb77wq7CBzPJHtL28aGyYA4kZhouAZYDnCtvjgUzYC84NShpLym2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2ssAfrO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2ssAfrO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC98C4CEF7;
	Sat, 31 Jan 2026 00:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769818859;
	bh=zX0eDJRO+oU/bF//okRc9YhTFyjxZrSBK9wYVv61K2A=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=f2ssAfrOZHgDR6sg2FWzY+ho+uGHbeO3TD091xzCj9KaIGZ62GfYuRsvzMQyusKF4
	 IA1JAO0fSG9fbGQkrx+hPgV+1LMPChUJeeXUFFuG5Y78AzmFSzdsGoLqJpD1qcaIf9
	 X00peshcaJMmI9LwfqYK8ndsyv2kYsh7XjWeYGocJ1KYi2ieV/IcVSUFlbhVCbT0su
	 zdE7JhPmpK7OnSzFAA11RICJRUIy8turwhZJvqTnS/10xrD8159slO6EnM/FTKuHqg
	 f7R3sD/7x5HUiTlBPKrvLOjGg7GqoXHJycm23a9EQA4eul7o14T3awCJ7lNDPhNMcL
	 UxoqEjtf+oxag==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 01:20:55 +0100
Message-Id: <DG2CFA6SMAMO.GR68NA4YLW76@kernel.org>
Subject: Re: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
Cc: "Gary Guo" <gary@garyguo.net>, "Timur Tabi" <ttabi@nvidia.com>,
 "mmaurer@google.com" <mmaurer@google.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
 <20260129022837.4133832-8-ttabi@nvidia.com>
 <95b913a1d344f603d17abc7f6d78da166068bc91.camel@nvidia.com>
 <DG2BY691US2F.36NWWJ18OPTBP@garyguo.net>
 <DG2C7G44QD5C.BY4U4HG7XBJM@kernel.org>
 <ab90ca9a-a721-41a5-9b28-2af73fda3212@nvidia.com>
In-Reply-To: <ab90ca9a-a721-41a5-9b28-2af73fda3212@nvidia.com>

On Sat Jan 31, 2026 at 1:16 AM CET, John Hubbard wrote:
> On 1/30/26 4:10 PM, Danilo Krummrich wrote:
>> On Sat Jan 31, 2026 at 12:58 AM CET, Gary Guo wrote:
>>> On Fri Jan 30, 2026 at 11:36 PM GMT, Timur Tabi wrote:
>>>> I think there might be a problem with this code that I don't know how =
to resolve.
> ...
>> There is no need for CONFIG_NOVA_CORE_DEBUGFS in the first place. The on=
ly
>> Kconfig we need is for retaining the GSP log buffers after driver unbind=
.
>
> Interesting. And in fact...I think we can live without that feature,
> especially if it complicates things here. If someone is debugging,
> and they need logs, they can usually (always?) find a way to leave
> the driver bound long enough to get them, or so I believe after
> some experience doing this. Yes?

I guess you could put a long enough sleep or just leak the debugfs director=
y.
Not sure how much it hurts developer ergonimics going for multiple iteratio=
ns
though.
