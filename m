Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD5B4C150A;
	Fri, 25 Sep 2026 15:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351411; cv=none; b=DMDdWJsiQNmMuuq6rodYT9N9sHmDDamhGlYyN4U8zGT5NM67Vg9CeOtyTrpXS0CN/w3NmemSjlosnmLxI+x/u2bFmdkXdhncBJOM7d5NiY8N8E3GvjBTM53d/eumka8/7DPg42T4jM0YEiIH5tCgZF1/3yiaDjidYR8HAA92eck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351411; c=relaxed/simple;
	bh=rLydLkoX2buj8K7vNFnDF0+lONdi8sW15E9C0o2QLsY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=cF22/h4cWcccJl/py6v/e8FBy10Gz1b56+tD+yZLEkJ1djXpSZ9E2crk0ME94YSE54Ck5+ckYAFgxvAqILIked0p1XGZg5zWSgZ8k91Trgzfo004UbY7i3s87Hpbu7rrNzeDQAK9+W7FJHdRriOVX8UEomMexxEXrtmlbg7NigQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nsUUFKyp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nsUUFKyp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECA61F00893;
	Fri, 25 Sep 2026 15:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790351410;
	bh=rLydLkoX2buj8K7vNFnDF0+lONdi8sW15E9C0o2QLsY=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=nsUUFKyp0SwC7LLYJO118a3NMMnZb2Z+IKDrpC4p0kDCspgxzI3F+15oHPRnXM/jN
	 N9UKKzJHZ826boWgKsq1Yl7xNC9bqI/IjErTlxs0xWcTux2JhJ+vuZMcOnSXEnz1f0
	 2V0NxAuP4T7iSaxQB+J4SVgh5u4ORmdRwfjBG0WMtU1yIfsrnPTzYlphdLK+QbeN+Y
	 O43FAZWbsZ4bKZtF6u/mN56dxiJL556nH/VLRlctH5UEuOv3wGEK97b70fvZkPnAla
	 +tnCasWrYHbtpVfz/R07+oiAh4hl8XvX4Kmmzn7a0eSEnNfWmhnGTF+O3GJl4KlZIi
	 EijrSBJBTxqLg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Sep 2026 17:50:04 +0200
Message-Id: <DLOILT0V4HCX.31L2PE7YIAKY3@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: DmaFence: Add better warning through Device
 reference
Cc: <phasta@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Alice Ryhl"
 <aliceryhl@google.com>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Philipp Stanner" <phasta@mailbox.org>
References: <20260925081958.3048112-2-phasta@kernel.org>
 <DLOBPY6OBEOG.2Y4I4LRA276WU@garyguo.net>
 <DLOECU7X3MTR.31Z6N1I0WB0MJ@kernel.org>
 <f0248d1529378ab8be957009a93a0a73ee74bafb.camel@mailbox.org>
In-Reply-To: <f0248d1529378ab8be957009a93a0a73ee74bafb.camel@mailbox.org>

On Fri Sep 25, 2026 at 3:08 PM CEST, Philipp Stanner wrote:
> The driver can avoid dropping half-forgotten stuff by calling
> jobqueue.complete_all_jobs(ECANCELED) immediately before dropping,
> which allows us for having the warning without false-positives.

This would just move it up a layer from inventing a new type around DriverF=
ence
to invent a new type around Jobqueue which does that instead.

But the Jobqueue won't have any procedural teardown, it has to teardown stu=
ff in
drop() anyway, which includes dropping jobs already.

What I'm saying is that there's not much value in DriverFence::drop() havin=
g
this warning in the first place, which then either the driver or the jobque=
ue
has to work around on teardown.
