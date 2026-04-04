Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703D7CA6B;
	Sat,  4 Apr 2026 00:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775261161; cv=none; b=Iw1+op/iUo8/sqYYWCbn/l9BaJKd8EeVUxtF2BnVCmUHJ+Q003NUnwbd4b+Pzyczz1qasyWd0R0CN66ReRfcBDpxO3020kVK9yhRgnbVuPpP3WIbGtiagog+Xm2PPBF7weuY40h3TMUqZyIh0VUlhjVJMa6GoY2DUegDmOO5yqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775261161; c=relaxed/simple;
	bh=jTInPCwhRuOQdrg+QrOCWa4rIxYaBSc3pV2W1y4XObw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=H+TUkaED52zVWdqkO5VgBFR9csYs4B3WJiw2G+d/08nUusUyOfzQuC1wuz+6uOSFjrGBh3ghIZ1EfPNuiXPnh4tD0SmqxlS9vYrAxWdvSddODJ5XYuIlr0G+W0dFPpv8nGtAsrMDgWCjI9LxvaqORWVDYvRI2AuLbvpchc4RyQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NS7u+XgK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NS7u+XgK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803BBC4CEF7;
	Sat,  4 Apr 2026 00:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775261161;
	bh=jTInPCwhRuOQdrg+QrOCWa4rIxYaBSc3pV2W1y4XObw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=NS7u+XgKzbokQFQQWNw2O4AYIw60GyCMrEBtObJarUINcAlRMTnITO1dpjrbeTkz7
	 5S/MwUlTEyjd6iMw5A/TVVnqF7riOJuE20DBl3n3R26PlwRpbHcWMk/SUt7PireBw5
	 iheGMudtfGlrdaEOk2pfE5tvUbfiSc64pmC6zTbfEY+B+8qQBxHuY8vBEDhp42OIVZ
	 Jqleo4V8J/7wct6pF6HATJO3UJ4E4SphlmZkp7Y7DHiCRrr9Vm3MkxKhGpoBVHSwCF
	 Wk7YV5SyCdegjqh5eKxUrl+Hfk3UfMsSiS55xYbVWFyaZ3sEL5fzsGoKk7gaPXtJC3
	 zWK2h1LLqogew==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 02:05:56 +0200
Message-Id: <DHJXK4PAD7V0.3UYK35FDHRNIK@kernel.org>
Subject: Re: [PATCH v4 2/2] gpu: nova-core: gsp: fix undefined behavior in
 command queue code
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo"
 <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260401-cmdq-ub-fix-v4-0-a9a9cf982485@nvidia.com>
 <20260401-cmdq-ub-fix-v4-2-a9a9cf982485@nvidia.com>
 <11466450-aeb3-48d3-a86f-934346fd4172@nvidia.com>
In-Reply-To: <11466450-aeb3-48d3-a86f-934346fd4172@nvidia.com>

On Sat Apr 4, 2026 at 1:47 AM CEST, John Hubbard wrote:
> On 4/1/26 7:29 AM, Alexandre Courbot wrote:
>> `driver_read_area` and `driver_write_area` are internal methods that
>> return slices containing the area of the command queue buffer that the
>> driver has exclusive read or write access, respectively.
>>=20
>> While their returned value is correct and safe to use, internally they
>> temporarily create a reference to the whole command-buffer slice,
>> including GSP-owned regions. These regions can change without notice,
>> and thus creating a slice to them, even if never accessed, is undefined
>> behavior.
>>=20
>> Fix this by rewriting these methods to use pointer projections in order
>> to create slices to valid regions only. It should eventually be replaced
>> by `IoView` and `IoSlice` once they land.
>>=20
>> Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue binding=
s and handling")
>> Reported-by: Danilo Krummrich <dakr@kernel.org>
>> Closes: https://lore.kernel.org/all/DH47AVPEKN06.3BERUSJIB4M1R@kernel.or=
g/
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gsp/cmdq.rs | 114 ++++++++++++++++++++++---------=
-------
>>  1 file changed, 65 insertions(+), 49 deletions(-)
>
> This is causing a build_assert failure in the latest drm-rust-next, with
> rustc 1.85.0, and also with 1.78.0.
>
> rustc 1.93.0 does not show the problem.

Odd, it did pass all the testing at my end. Anyways, it only proves once ag=
ain
that this is pretty fragile.

> I suggest that we revert this commit: we're very late in the cycle and
> it appears to be relying on fragile compiler behavior (my best guess so
> far--I don't yet understand the root cause).

As an exception, as it made more sense in this case, I dropped it from the
queue.

Thanks,
Danilo
