Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ADA1D5151
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 00:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769819724; cv=none; b=Jhu5d+7YmmrYkEB83YlzPmC+mdtJMtAu4HN+7Ugm3cfgE3js7RwvibTjNLiAboZY0c4kQP9QPg6xqdSvZ8XO+mhm03/bMh8rHwrm7JRKijCvxh9iWP8PrMObS667Q48AHYAk0UAEd2ikb68AXVZCn8YQa5x4Kf03pc+ICzzM3Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769819724; c=relaxed/simple;
	bh=ES6e4LTzBdsTWSEb8j3Wo6hkQDH7RWYISCYXV9N3FEw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=BEgoPOTIYMmpccT6G8cvylXxWftbwUqYaeFjjOfjViQYf/4lG4gTYEs6sAgwxNg5LLodK25D7Vcsu+N+Ib0cOyHAW0QUEchPErFWi0vVJXoCKDf6K3//12ws5EUItkgKA2GPz2c71zKEZ7RZCopbIXymDrfdPId6gyf60UzUrgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4vfWilD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4vfWilD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B94C4CEF7;
	Sat, 31 Jan 2026 00:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769819724;
	bh=ES6e4LTzBdsTWSEb8j3Wo6hkQDH7RWYISCYXV9N3FEw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=o4vfWilD1UCEmxk+WI4MZbEX5f57zLaweMhIZJeViASdAvxnPX6JT2HPKP1l1Fpcv
	 6ppCMNIukNp87wiTpkVSbh4bvmDQZleqGTUdWKgkecl2BHZJJoFffmp4F9WlUMC7eN
	 CADuXivE+FzB6SU/aQDUEfO5Qw70S6tZfi1xIha+1QaW6g2A06x/rX69ipDm9PDKrK
	 05zktisKuj40JgzWQlF+a0kxRtnE+744duv4YqBheSLYVDW2iGsRpcM9rwjJfUEGka
	 5tyFcIhpXyPyUVBzqQTE0PcsomEiCxVlll/tUGJOd8SQbXAi1I1V09mVEnHKe6JJA5
	 au27SyGrUCu+A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 01:35:20 +0100
Message-Id: <DG2CQBAM6SG8.1116LCW3IIT3N@kernel.org>
Subject: Re: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
Cc: "gary@garyguo.net" <gary@garyguo.net>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "mmaurer@google.com"
 <mmaurer@google.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
 <20260129022837.4133832-8-ttabi@nvidia.com>
 <95b913a1d344f603d17abc7f6d78da166068bc91.camel@nvidia.com>
 <DG2BY691US2F.36NWWJ18OPTBP@garyguo.net>
 <DG2C7G44QD5C.BY4U4HG7XBJM@kernel.org>
 <f723d517b943b9f4c10764daee9ff711e15b6834.camel@nvidia.com>
In-Reply-To: <f723d517b943b9f4c10764daee9ff711e15b6834.camel@nvidia.com>

On Sat Jan 31, 2026 at 1:26 AM CET, Timur Tabi wrote:
> On Sat, 2026-01-31 at 01:10 +0100, Danilo Krummrich wrote:
>> > One idea is to create types that look exactly like `Dir` but always ZS=
T and
>> > no-op regardless whether CONFIG_DEBUG_FS is enabled... But that feel a=
 bit..
>> > weird. Matthew, what do you think?
>>=20
>> There is no need for CONFIG_NOVA_CORE_DEBUGFS in the first place. The on=
ly
>> Kconfig we need is for retaining the GSP log buffers after driver unbind=
.
>
> Danilo, I'm confused.  You told me to add this Kconfig:
>
> https://lore.kernel.org/rust-for-linux/DFR6RWROWBYA.1Q9JKH8UDSXOX@kernel.=
org/

Maybe a misunderstanding due to my type? I.e.

"I think it's OK to always have the entries on keeping them beyond device u=
nbind
has to be behind a Kconfig option."

vs.

"I think it's OK to always have the entries, only keeping them beyond devic=
e unbind
has to be behind a Kconfig option."
