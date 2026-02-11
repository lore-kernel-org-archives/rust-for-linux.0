Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3507E259C80;
	Wed, 11 Feb 2026 11:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770807635; cv=none; b=t+k/wBOzHIm3wPI1A828MMlZfMdY2zZoWk3H9Ec5RQmVvYsc458upzjwzyB1GU1FL3kjvlLt01PwNSuwep30UGnEsx7SGCTa4z09ma9TwCxHU0LGAgJRGkiNpBTAYrOAWsmW+Cu6mVwZaWOSV+sHN+0XWe4SaLCNVSMNiXmhims=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770807635; c=relaxed/simple;
	bh=RiqFFN9Tr/evnRpNR/pIaWzHOD53Xki7Iw8z1m2Fs24=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=XZwCMRkLfaLPT7fM7f06EKPjX/ezK+V48XFG9sbIYYX/ql3C8B38ZgIeSH/BVL4RWl2pJ6w/35mEkQimaTKHhmcTKq0yp3jrA6iPCpKNg0NtJYgEFJbAda1hjtJOKDSxp0F5K8kM7vlPiV+E4lyYy7YO7G02/iM1pydTSkkStbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eB51r3si; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eB51r3si"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3785C4CEF7;
	Wed, 11 Feb 2026 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770807635;
	bh=RiqFFN9Tr/evnRpNR/pIaWzHOD53Xki7Iw8z1m2Fs24=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=eB51r3sioEZUO7pAEypGJodRsEl9vJSz63bQBDGLvzLfZtBzbm+bzKuBkBgseHyaX
	 5UhCEVLynZhEfSp3/QnPRXl1+FEWNHxyZ9C/vCMq49EDG9pgsfRkd1fdjtkgJzFYXM
	 Urfgk/vs95z4Xh1C+E0tK5UcBi+1J1BhpW1K/NZc8A33Kff7eW2FGH+qB+EZc/b0gC
	 dL6HFfuWvOvyf2vWwvmZPhvVifarh31i7yx2zUjJEszR4s+7SibsyduZLSoLIxTlJ0
	 bsN90H1Dz++C+8RSVSXL+PQmpR6c7OCi4F06JMHrPh0IjhX3d63vJFm0gxlIodCPZq
	 Jmv1/AfiveyZA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 12:00:30 +0100
Message-Id: <DGC2WYUT80B4.3D4QKYP8FVVQJ@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Philipp Stanner" <phasta@mailbox.org>,
 <phasta@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Gary Guo" <gary@garyguo.net>, "Benno Lossin"
 <lossin@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
References: <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
 <4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
 <aYsZHhX2IVO2kOSm@google.com> <DGC1KP1DT6YV.3LQWZXMA22L5A@kernel.org>
 <20260211112049.089b2656@fedora>
In-Reply-To: <20260211112049.089b2656@fedora>

On Wed Feb 11, 2026 at 11:20 AM CET, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 10:57:27 +0100
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>
>> (Cc: Xe maintainers)
>>=20
>> On Tue Feb 10, 2026 at 12:40 PM CET, Alice Ryhl wrote:
>> > On Tue, Feb 10, 2026 at 11:46:44AM +0100, Christian K=C3=B6nig wrote: =
=20
>> >> On 2/10/26 11:36, Danilo Krummrich wrote: =20
>> >> > On Tue Feb 10, 2026 at 11:15 AM CET, Alice Ryhl wrote: =20
>> >> >> One way you can see this is by looking at what we require of the
>> >> >> workqueue. For all this to work, it's pretty important that we nev=
er
>> >> >> schedule anything on the workqueue that's not signalling safe, sin=
ce
>> >> >> otherwise you could have a deadlock where the workqueue is execute=
s some
>> >> >> random job calling kmalloc(GFP_KERNEL) and then blocks on our fenc=
e,
>> >> >> meaning that the VM_BIND job never gets scheduled since the workqu=
eue
>> >> >> is never freed up. Deadlock. =20
>> >> >=20
>> >> > Yes, I also pointed this out multiple times in the past in the cont=
ext of C GPU
>> >> > scheduler discussions. It really depends on the workqueue and how i=
t is used.
>> >> >=20
>> >> > In the C GPU scheduler the driver can pass its own workqueue to the=
 scheduler,
>> >> > which means that the driver has to ensure that at least one out of =
the
>> >> > wq->max_active works is free for the scheduler to make progress on =
the
>> >> > scheduler's run and free job work.
>> >> >=20
>> >> > Or in other words, there must be no more than wq->max_active - 1 wo=
rks that
>> >> > execute code violating the DMA fence signalling rules. =20
>> >
>> > Ouch, is that really the best way to do that? Why not two workqueues? =
=20
>>=20
>> Most drivers making use of this re-use the same workqueue for multiple G=
PU
>> scheduler instances in firmware scheduling mode (i.e. 1:1 relationship b=
etween
>> scheduler and entity). This is equivalent to the JobQ use-case.
>>=20
>> Note that we will have one JobQ instance per userspace queue, so sharing=
 the
>> workqueue between JobQ instances can make sense.
>
> Definitely, but I think that's orthogonal to allowing this common
> workqueue to be used for work items that don't comply with the
> dma-fence signalling rules, isn't it?

Yes and no. If we allow passing around shared WQs without a corresponding t=
ype
abstraction we open the door for drivers to abuse it the schedule their own
work.

I.e. sharing a workqueue between JobQs is fine, but we have to ensure they =
can't
be used for anything else.

>> Besides that, IIRC Xe was re-using the workqueue for something else, but=
 that
>> doesn't seem to be the case anymore. I can only find [1], which more see=
ms like
>> some custom GPU scheduler extention [2] to me...
>
> Yep, I think it can be the problematic case. It doesn't mean we can't
> schedule work items that don't signal fences, but I think it'd be
> simpler if we were forcing those to follow the same rules (no blocking
> alloc, no locks taken that are also taken in other paths were blocking
> allocs happen, etc) regardless of this wq->max_active value.
>
>>=20
>> [1] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/xe/x=
e_gpu_scheduler.c#L40
>> [2] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/xe/x=
e_gpu_scheduler_types.h#L28

