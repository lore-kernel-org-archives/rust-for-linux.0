Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663C42BF3E2;
	Tue, 10 Mar 2026 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773140534; cv=none; b=IorAJvBBvC+mnkOzBsxYNaF+Mj8e/xTnq3YlDTlqYpUM92/YipIXl/2HVE/MHtLTzN3NlBbNxHxz3xXpKVgQit7QCb3YJ4IyvacFQjJaSHP5FF05ifwbJkQTwsBXA2jetmpyBiGLiq8NtjYMDC7h1GxRk98g8H+djxx0IlXltn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773140534; c=relaxed/simple;
	bh=dHWlZJmR6/6WkpRMJABXI0hAch+SQenJXJrexpHItY4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=NHtMUJoCUcjlkxU8c7dDj0PhIFMQHfPDOQvUUX5fMREdrsR/8Fpt3VD//jtQXoF/gE4Nlv3sqhsjZawfBIYvlAtn+eCb0lbMklsQlXZep6xxRQwlIxNXlB0DA/ApkI3k2653wz/GYxyZK6x16u374CxBFaz+5lfaN+vkC47CruI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkLecvUF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkLecvUF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD46C19423;
	Tue, 10 Mar 2026 11:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773140534;
	bh=dHWlZJmR6/6WkpRMJABXI0hAch+SQenJXJrexpHItY4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=nkLecvUF3FTw2CNEygB1r+ArDl5q2EFV/f7A2Tnyxy5F97Swgz7BjLHdBZ4xgs4Pd
	 +MR162o+7KW65dCcF3+It4au4K956ZSYO+dqHOozHa3OpaD9NUNQeVSt2w0QY/JWLR
	 dR9CYt4jEnUnhAJutGIMrZ/5LX2ziIajZzUcWqFPZ/nuY4M/hjNquMiCzoHJrBRr1A
	 qL1q0zvhPNfp2VxifwU4QXf3d3sfvCeJAwigQiStD2fLE8JxwTslrA0bAaHvhUrMHB
	 fJzjfmHQg7g7bE6bwOkAisjslPKn7lBlydMYTlslAgGAFMuLdUv/u3V1FgOA30tINw
	 ATn9HOIlBkB7g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 12:02:10 +0100
Message-Id: <DGZ1UYLTMFQW.1ZBAMJN70OOQI@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: gsp: fix UB in DmaGspMem pointer
 accessors
Cc: "Gary Guo" <gary@garyguo.net>, <acourbot@nvidia.com>,
 <aliceryhl@google.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260309225408.27714-1-dakr@kernel.org>
 <DGYQCXD2VH23.3D54NHJH6I0VA@garyguo.net>
 <DGYSTBMF931L.3OV1I4IWUW4ON@nvidia.com>
In-Reply-To: <DGYSTBMF931L.3OV1I4IWUW4ON@nvidia.com>

On Tue Mar 10, 2026 at 4:56 AM CET, Eliot Courtney wrote:
> On Tue Mar 10, 2026 at 11:01 AM JST, Gary Guo wrote:
>>> +    pub(in crate::gsp) fn advance_cpu_write_ptr(qs: &CoherentAllocatio=
n<GspMem>, count: u32) {
>>> +        let wptr =3D cpu_write_ptr(qs).wrapping_add(count) & MSGQ_NUM_=
PAGES;
>>
>> Not really related to your change, but this `&` probably require a comme=
nt, as
>> it has different behaviour compared to `%` given the `MSGQ_NUM_PAGES` is=
 not
>> power of two. I suppose this is actually intended so there's a way to
>> distinguish between empty and full ring buffer?
>
> This is actually incorrect and I have fixed it here[1]. I think it
> should be merged in drm-rust-next now.

Probably should have been going through -fixes. Anyways, I will fix it up i=
n
this patch too.

> [1]: https://lore.kernel.org/all/20260129-nova-core-cmdq1-v3-0-2ede85493a=
27@nvidia.com/
