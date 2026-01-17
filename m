Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ED527FD45
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 22:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768687219; cv=none; b=aLYWhXu0cg3i5L/eViAn6qMiXYC2dN+FsOHJHCTDWgcC6Nklm/xoTT0h239vIbAqr/livDVGt3KSrALgjpVzG/e+X3/wJMasiBTHnQSOejLznTryA3BqbPaxWL4dh0ckLjHgMVe+t+g398pXigUrgQdd/12Qn8Rdk0RxJkSVykA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768687219; c=relaxed/simple;
	bh=zKdx7wffWw4P0xNqUBF0Sah1TphPqKlqGJeB7Pv9z1s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=rS7qu/9Ylblr7aqAegnXNbev1Z9v5Mfc18FTapazs49mFSZIqE7MUbQEZwQtJ46OFQUGk78iRob6idfIhwXpBZ5Knaxs3Fea0ojTX8PjKxa6fWYq+T8ft2cUc4zAQqtBFxGlL4H9FdU9epRefRzi9IlnqWowuzwXBPAIGp2wAyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOIfb8gb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOIfb8gb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232ADC4CEF7;
	Sat, 17 Jan 2026 22:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768687218;
	bh=zKdx7wffWw4P0xNqUBF0Sah1TphPqKlqGJeB7Pv9z1s=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=KOIfb8gbUP3juNpqvh2IQ4Z2VzsTYXe8zCzn/+g/Yt1pPKJUGpRIauThylo6k8HlG
	 sk8L4ndssq/EU24tDprcnZmg4NvCK0Rmg0ldbz38zaFnWo0B9VrrqG060DqUXhDUf+
	 3U3NF0GCnJ+tjc+nSOgXqPfzdj0vMpyKnWweXa2ayqBdd/su0xeisq386KDCXQ+qN3
	 5a2huI9RA5r98cbT15s2lPRVaLrZwKSCdFjY8DJkV0RYmK/kRBrcQDWV2SKF04KRZL
	 XY7h21n5SBULJBDtaB5K5rAWV6FYv//nFV83dA3DMc0I4MvCrffvIjYo9Ey1dnE371
	 eqlZ72WaZG6Dw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 23:00:15 +0100
Message-Id: <DFR7AHOX0T8G.2NB9VOS3IZRZE@kernel.org>
Subject: Re: [PATCH v5 7/8] gpu: nova-core: create debugfs root in module
 init
Cc: "gary@garyguo.net" <gary@garyguo.net>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "mmaurer@google.com"
 <mmaurer@google.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-8-ttabi@nvidia.com>
 <DFQV57XCLMB6.1A0IW206EXE3H@kernel.org>
 <656bfffe43ab220b387fb56bb6eeb829ff0bd1ef.camel@nvidia.com>
 <DFR6RWROWBYA.1Q9JKH8UDSXOX@kernel.org>
 <c5d5d3fe71f6cd8725b47435f5c75394cdc9d9fd.camel@nvidia.com>
In-Reply-To: <c5d5d3fe71f6cd8725b47435f5c75394cdc9d9fd.camel@nvidia.com>

On Sat Jan 17, 2026 at 10:52 PM CET, Timur Tabi wrote:
> On Sat, 2026-01-17 at 22:35 +0100, Danilo Krummrich wrote:
>> > You don't want the debugfs entries created by default?=C2=A0 That's ho=
w it is in Nouveau.
>>=20
>> I think it's OK to always have the entries on keeping them beyond device=
 unbind
>> has to be behind a Kconfig option.
>>=20
>> I thought you want this behind a Kconfig in general, otherwise what is
>> debugfs::Dir::empty() for?
>
> Oh, I see what you're saying.  Dir::empty() is for when CONFIGFS_DEBUG_FS=
 is disabled.  So
> obviously, I should not default DEBUGFS_ROOT to Some(dir) if CONFIGFS_DEB=
UG_FS is disabled.

This case is already handled, look at how debugfs::Dir::create() [1] is
implemented. I.e. it is fully transparent and you don't have to care about =
this
case.

debugfs::Dir::empty() would be useful if you have an additional case where =
you
want to have a debugfs file tree conditionally though, which is why I assum=
ed
you wanted an additional Kconfig for nova-core.

[1] https://rust.docs.kernel.org/src/kernel/debugfs.rs.html#53
