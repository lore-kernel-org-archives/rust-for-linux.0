Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B342DF134
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 12:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769256267; cv=none; b=qAGiZhOeRWCvRU3Q9JSHidtwGgyfWd1K7cAZ4jO7/+X84v/6bfieXJ+SyjDdkoK2k7I64+JwAcFdFJdjT48+F6cFFNEyH65a9ndnLgvBNcqnlvwuE6Hj+y8PqYoV+tLFXhyl2aSJcZKHn/t0umKU2X/UoSE7EOZpD19+KmixXIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769256267; c=relaxed/simple;
	bh=dSyajvewZkIQwPvjRTlQJGapQOGk/fl6Nw4OPbFBIFI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=NKcQ+79zCQVhBQVl8Cj/mSLPXC3lJE8sNU6cDbaGcwYrKP532D+OhGw5A1LyEf+O56cmU8adPCR8gJA1bnF6LOR+epIBnYs7cWRpVVekd2GqCtoWe75vcpHu8SN7efmjsgnZspF7DuMAoZ76Ghd2bIf6f7NDk9iy/U2/+BCA+SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZcGQXZE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZcGQXZE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295FEC16AAE;
	Sat, 24 Jan 2026 12:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769256266;
	bh=dSyajvewZkIQwPvjRTlQJGapQOGk/fl6Nw4OPbFBIFI=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=NZcGQXZELaJEby8HOyiBqfDOnLq+SB0Xc4VRc9cufFLvdE33gSXCXcIGShK34uu18
	 7i2FNxdhyAAbQTuJfvZOM8OqzH9pvWSbeJWeK6nWtfWeOj0JdFfAxgJF5MmberM3x8
	 JLu+CEYH4srWAbE9liw8GvwximuRFpWNA2r5Za1ErOcg3e+Qin6u0lKbaSKGcmiDaF
	 bdbsZ8OI9LsNitHHEdjbGO1YwlE+oVu4C55BaVIFcBz5tR6Hj9BQWtAg3V4H3fODaF
	 E+mPFmGTARwwrkpgal+3pwjXF9/jkZlCgTUQbPal2Szzw3mW8zCaLgcETX+zgbl6tc
	 hlfdiE/dVt0hA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 13:04:23 +0100
Message-Id: <DFWT02TDUDHX.2JXA0SCWANCP0@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Timur Tabi"
 <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v8 09/13] gpu: nova-core: add Falcon HAL method
 load_method()
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "gary@garyguo.net"
 <gary@garyguo.net>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
References: <20260122222848.2555890-1-ttabi@nvidia.com>
 <20260122222848.2555890-10-ttabi@nvidia.com>
 <DFWGPVUB7Q7O.XCM4MOK1SK2T@nvidia.com>
 <8dd8d8047615cadc73e0a888d5172ab15cc372a1.camel@nvidia.com>
 <CANiq72mXr1A6sdB2mo848wcmHk-obVO91NAEDpbakEmoh5Gv-g@mail.gmail.com>
In-Reply-To: <CANiq72mXr1A6sdB2mo848wcmHk-obVO91NAEDpbakEmoh5Gv-g@mail.gmail.com>

On Sat Jan 24, 2026 at 12:56 PM CET, Miguel Ojeda wrote:
> There are developers and CIs using different versions, so eventually
> it will be caught by someone (likely the maintainer), but it can save
> time to do it early.

For patches that target the drm-rust tree, we have committer guidelines wit=
h a
submit-checklist [1] (that eventually points to both, the generic kernel on=
e and
the Rust one linked by Miguel).

However, it also lists the most important steps that should be taken before
submitting a patch series.

[1] https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-=
drm-rust.html#submit-checklist
