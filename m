Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C5422538F;
	Wed, 25 Mar 2026 13:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774445900; cv=none; b=A5OO2LDDO8hGn+QM5ShUlUvUescLGJ2TG/FJ9uhFuMdIaARX8LiNDic4qOzrkX1CZjtCJqutl8f4XKiefVGlyc+EdxmmJJ3bnq9Gl5e7b0p0DiOApVeG/mzWnU8h9ILzTvuESErmEh/IaOZKWGzhMSERgjG1aczv4uDTIkkijZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774445900; c=relaxed/simple;
	bh=5SscZ0wFhci9j07uwdSVCHlmCxKE0pa5r4g2pCkPJP8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=W/XlReHRONrl0+6KjpbyJQhIcVB5Hg4lVqqw2VuhBJKJFpqSUBypRJ0j3xRH/9tUmoTsGergcL3Tm+bgkTFpA72MdHZbQB+4mz5UC1S6u4Y1XVCaBxgt6tvRdQCN7gxcXCZEbqGLXTfAD3ZBPCjbeHFsP2WSJa8WIOI00rEBLCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/wl4jCV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/wl4jCV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B714DC2BCB6;
	Wed, 25 Mar 2026 13:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774445899;
	bh=5SscZ0wFhci9j07uwdSVCHlmCxKE0pa5r4g2pCkPJP8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=A/wl4jCVXiGHyHkT4UsOlVA88IAsdqGdHP/ieqUs1+UpLji4FzWePUtOK6wxrnCno
	 ZsVWUdlNEqFSvhU/5ik9nUjC9VYX2Jie2gYKMXQEblb4dGhufxMnMJnT1VvLrVkCMr
	 AYxXE1QwSLw1HHrIvAX6CeEnFTq5tvk0Lzm71MHtXVJyTCfNwSaLbNDnzXEeEnqET0
	 qwTR0B9Zu43c/DHpfJo82J4hJ+1Pm6/aTlQ7JLzfbPImDvfP+sTtHEqM+ufgZaWQEE
	 oLdN5q/nQPYv+u0yC7e8jHov8fG1nX3CRVqag6dQzDRCwBadAO4cVModr2p6A14l3u
	 N//d6WFr3QJ0w==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 14:38:14 +0100
Message-Id: <DHBWKM7YMGFP.2BDTKGCGRGTUA@kernel.org>
Subject: Re: [PATCH v8 05/31] gpu: nova-core: set DMA mask width based on
 GPU architecture
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-6-jhubbard@nvidia.com>
 <DHBTVQ5C8GWH.22YI7TVB7RWN2@kernel.org>
 <DHBU6553UHPI.1KNLKA6TPN79A@nvidia.com>
In-Reply-To: <DHBU6553UHPI.1KNLKA6TPN79A@nvidia.com>

On Wed Mar 25, 2026 at 12:45 PM CET, Alexandre Courbot wrote:
> On Wed Mar 25, 2026 at 8:31 PM JST, Danilo Krummrich wrote:
>> On Wed Mar 25, 2026 at 4:52 AM CET, John Hubbard wrote:
>>> Move Spec creation into probe() so the architecture is known before
>>> setting the DMA mask, and pass Spec into Gpu::new().
>>
>> Hm...this is not what we discussed in [1]. You implemented the change in=
 v5 and
>> v6 and v7 reverted it. Why?
>>
>> [1] https://lore.kernel.org/all/DGC28K8J39E2.1X173NHT9ZJDI@kernel.org/
>
> That was on my feedback [1].
>
> `Gpu::new` carries no guarantee in itself that no DMA ops have been
> performed so far; whereas in `probe` this is much clearer.

That's not what has to be justified. Having DMA allocations before setting =
the
mask is not a violation of the safety contract; it is about concurrent
allocations.

That said, all DMA allocations are on the Gpu object, so there can't be
concurrent DMA allocations while we are still in the constructor of the Gpu
object.

Unless...one would try to create a second Gpu object from probe() (which
obviously makes zero sense). nova-core already relies on Gpu to be unique p=
er
device, as attempting to create a second Gpu object causes UB and actual me=
mory
corruption when there is no IOMMU. :)

[ 123.966391] pci 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=
=3D0x000e address=3D0xf7fef000 flags=3D0x0000]

So, I think technically Gpu::new() already has the safety requirement that =
it
must not be constructed more than once per device.

I wonder if we want probe() to give out a ProbeToken<'a>, so a driver type =
can
consume it by value to guarantee uniqueness of an object without unsafe.
