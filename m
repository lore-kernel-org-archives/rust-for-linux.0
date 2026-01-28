Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FC318FC86;
	Wed, 28 Jan 2026 10:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769597224; cv=none; b=B9tFX7H0KcsZW4QqTNe6lodbt2cBL7wfVdT8Qnmyv51Pcx2uFjUfTNQBMJaXYGWx7GlfDPg45815ia4+57/Oj8q1JOJSpamuhV/8TyuDmfZ126ly9DHD06vPDsmwJJqqRzau36urTx3RNvLV7i8wunpsB6ehC5LI0bHg3pAuglU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769597224; c=relaxed/simple;
	bh=xKmKGHblPsSZenvqrZey8InJuq6tz0WVn85z4/keYKU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=FCLVpShmOTsA30Y+CjwSJ47eBvtRLgxLV/esDZ2Lwg47dZk6J77EMwulAA/LGC09q8vY4ajpZQjcMWxdlhk4fxnxU0v4bTEZFSJVJLoLT8hfaDTPFpH6V7LiDPtCDm/rZsCJ+5hbFvjFlDy9ElsOPLZA4t/fI3Y2hl+Wd9ZErK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u86qh55p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u86qh55p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2990C4AF09;
	Wed, 28 Jan 2026 10:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769597224;
	bh=xKmKGHblPsSZenvqrZey8InJuq6tz0WVn85z4/keYKU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=u86qh55pZvVbKWRIoIpanUlPoJfy10TkSP4JTWfZCrSGe+dmfZFd1ZyDBDSycARvb
	 4b4hd+IJLC+jiK0NFDM2B/P80jirpXwKuS358BRWxyrfQx0JBzDzFdOX1boeIDdhg7
	 5eZ0NB0p99mzHigmu9Pgum/eidSNbRpTslQHnwJSBeBCcMPLG+WkgQPBNVd1Yq1DL/
	 QcRZAV3IuKxcbJHc4/LJppHIvUNS2g1G1N5eqRjRi0bUfvjnkwpt9f8IjacXMBk287
	 imvtYpVwXX9UT6SNHwSh2MoaO5fV9WED5g+7E3/ctPEAIkIDylvru7poUlVAfJnvOf
	 yGpRvNmy3yUJA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 11:46:59 +0100
Message-Id: <DG05UZS433N1.378WELIDPRZVE@kernel.org>
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: clarify comments about
 invariants and pointer roles
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Gary Guo" <gary@garyguo.net>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
 <20260123-nova-core-cmdq1-v2-2-e797ec1b714c@nvidia.com>
 <DFYPX3TNI3Y2.38MQUIWHHR9Z1@garyguo.net>
 <DFZXYMSS9OOI.5NUPB8GCHRKD@nvidia.com>
 <DG02OBNM1OPY.2W9JKV0IF8VPK@nvidia.com>
In-Reply-To: <DG02OBNM1OPY.2W9JKV0IF8VPK@nvidia.com>

On Wed Jan 28, 2026 at 9:17 AM CET, Alexandre Courbot wrote:
> On Wed Jan 28, 2026 at 1:35 PM JST, Eliot Courtney wrote:
>> On Tue Jan 27, 2026 at 3:04 AM JST, Gary Guo wrote:
>>> I wonder if this can be `is within 0..MSGQ_NUM_PAGES`. What do others t=
hink?
>>
>> I think this is very reasonable, since this is part of the rust
>> range syntax so it should be understandable. I also considered the
>> mathematical syntax `[0, MSGQ_NUM_PAGES)`, but not sure if this would
>> be conventional - it does seem that this notation is used in a bunch
>> of places though. Will apply your suggestion in the next version unless
>> there is a definitive convention for this.
>
> Since this is Rust code, the Rust syntax to express ranges (within ``
> quotes) makes sense IMHO.

While I really like the mathematical syntax, I think using the Rust syntax =
is
superior, as it requires zero mental cycles to translate it to what is like=
ly to
be found in the code as well.

(There also have been some considerations of using tools to validate safety
comments or invariants to some extend eventually.)
