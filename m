Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6FF28A72F;
	Wed, 11 Feb 2026 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770803852; cv=none; b=PHLE8dNCv9pBbmffhOpcQfXjPavf9y2A0JgyRQ+06mlMUkAzUATw9HCdAHkQIPd86UgR0KYiQc9f/1Cqk+GS3NuWPr3zpvoo9dEucgXIUranA22fSXdH10fKmkNX3PACmlIJH1gHbJ4eyQZcRP2QBe4Hl9NXbwtkM+3LB7sur0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770803852; c=relaxed/simple;
	bh=UBgpfxg902aoW870xOV+hwMSmO6DTVJ0XdLPOKLXDEE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=twvLkQs9Ig3Xj00OwH+5Enn7Zni9/2obdgeuJSr4bP2LkcYT+nZ9TFAZPfeLqELOcdvZPpmV545uzuGkuxvO8wfta4h51/+KX9RSH8dplvX1h6YWR7nOIBMVj5Ttp7X9dsqeFsmwEI17wSFBwPGFAD4GNjwhGBeB3P3djgH9Zng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKSVyD/j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKSVyD/j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2DFC4CEF7;
	Wed, 11 Feb 2026 09:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770803852;
	bh=UBgpfxg902aoW870xOV+hwMSmO6DTVJ0XdLPOKLXDEE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=XKSVyD/jlYxSyAQQzxg1VhCxqYxs5R8DWrjW6PuzuHgwsyIL5jkhYBWeslmI2ADd/
	 W1H7v3WlAWtJkzuDW/rkx0gDmgDrs/60iNj2RT+NxSJgFdyfALPuIfNmQp/vqvHg3O
	 UWlnIrGYGT8pF3dstbMEl7KUtUxNAPVeWGMTvlJbHkph3bRZdisiib50vmNWrbCBRO
	 tg7JvovCdnXUx9VFpEJnUPOKHZ6kGhP0A8vQhGFItgHyjECu5hCJ2S6erOwpzhwPFU
	 ywvoPweKt4AigCHFJoit0Um08k9aVjd8yEBQYxBL4sIMBEsTghGr0AKJzDwPeRihBA
	 OzeluWTW09t+Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 10:57:27 +0100
Message-Id: <DGC1KP1DT6YV.3LQWZXMA22L5A@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Cc: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, "Philipp Stanner"
 <phasta@mailbox.org>, <phasta@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Gary Guo"
 <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <lucas.demarchi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
 <4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
 <aYsZHhX2IVO2kOSm@google.com>
In-Reply-To: <aYsZHhX2IVO2kOSm@google.com>

(Cc: Xe maintainers)

On Tue Feb 10, 2026 at 12:40 PM CET, Alice Ryhl wrote:
> On Tue, Feb 10, 2026 at 11:46:44AM +0100, Christian K=C3=B6nig wrote:
>> On 2/10/26 11:36, Danilo Krummrich wrote:
>> > On Tue Feb 10, 2026 at 11:15 AM CET, Alice Ryhl wrote:
>> >> One way you can see this is by looking at what we require of the
>> >> workqueue. For all this to work, it's pretty important that we never
>> >> schedule anything on the workqueue that's not signalling safe, since
>> >> otherwise you could have a deadlock where the workqueue is executes s=
ome
>> >> random job calling kmalloc(GFP_KERNEL) and then blocks on our fence,
>> >> meaning that the VM_BIND job never gets scheduled since the workqueue
>> >> is never freed up. Deadlock.
>> >=20
>> > Yes, I also pointed this out multiple times in the past in the context=
 of C GPU
>> > scheduler discussions. It really depends on the workqueue and how it i=
s used.
>> >=20
>> > In the C GPU scheduler the driver can pass its own workqueue to the sc=
heduler,
>> > which means that the driver has to ensure that at least one out of the
>> > wq->max_active works is free for the scheduler to make progress on the
>> > scheduler's run and free job work.
>> >=20
>> > Or in other words, there must be no more than wq->max_active - 1 works=
 that
>> > execute code violating the DMA fence signalling rules.
>
> Ouch, is that really the best way to do that? Why not two workqueues?

Most drivers making use of this re-use the same workqueue for multiple GPU
scheduler instances in firmware scheduling mode (i.e. 1:1 relationship betw=
een
scheduler and entity). This is equivalent to the JobQ use-case.

Note that we will have one JobQ instance per userspace queue, so sharing th=
e
workqueue between JobQ instances can make sense.

Besides that, IIRC Xe was re-using the workqueue for something else, but th=
at
doesn't seem to be the case anymore. I can only find [1], which more seems =
like
some custom GPU scheduler extention [2] to me...

[1] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/xe/xe_g=
pu_scheduler.c#L40
[2] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/xe/xe_g=
pu_scheduler_types.h#L28
