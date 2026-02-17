Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1163036C5B2;
	Tue, 17 Feb 2026 14:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771339451; cv=none; b=YPguKFqeiiuOxbZ1SdLZeAOK2YWoBjabrJStZEiJrKH4+czzTvWRUS7TaaTlanbuZ7m3bEUCW9vAfDedTB7LquWjAjOpGRpnQ6NFkhC435lYOfACA8nZLZF5WSt91eIpqHimhnuz2oc2g2QOihS9DyFURa4BL+DINDdFN82rgrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771339451; c=relaxed/simple;
	bh=2oWspgWTfE+doh9thO9zPOHhPUiiYxuk5CyDdkfhIGU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=LlvoVJopFw7t59v8+sBJK4/IUQ/B8HIDxqCuznf/iTj85DJLFeOAAVTZFlvEPCzjBmcOmu5C5wtddRmRsduwlEhb6+ARYv5QTRHZ9vbal89gTHMLfkWU7r1FBn4vcpuE9eVpQQlLa8BM42XmJRQPYVdj1hzJ8YG8pu70zcqoB04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vFMNHvzr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vFMNHvzr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECCB1C19423;
	Tue, 17 Feb 2026 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771339450;
	bh=2oWspgWTfE+doh9thO9zPOHhPUiiYxuk5CyDdkfhIGU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=vFMNHvzrm2jgRRVOmO3s1u9p9VVJsONAB0DSWBycXzQAqCzP9QZzGoSKf5wzBQmVP
	 GskIxynLrc+vHumnPJhQem4AWqfBUiK0vkC8QRxC/hQmb5EthJ/+lhSLBMbkaAoJaq
	 mWkhl6heqF0IBTsysAkViSTXZQERtDBAQBkh59YQ8ofeS5QNseVuLbTTbGtk5exGeW
	 sw4lj6whYmiw6ZVouyOInxEk6t/DUJdjPv9zPKBJkzKtaQZFmizY8peK0z7JTemoOx
	 8J/PJz99G5zgdHYG2NP1qjUO/yaqa+fsKkJUb+7rlIpliMd00kVL8toyjs2U4c+pgT
	 HxZqwTigvmVCg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 15:44:06 +0100
Message-Id: <DGHBFFSLQH1F.162H7FOVAS22B@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Cc: <phasta@kernel.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Alice Ryhl" <aliceryhl@google.com>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Gary Guo"
 <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Philipp Stanner" <phasta@mailbox.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210133617.0a4be958@fedora>
 <aYsvc3Q8h-Gg27-g@google.com> <20260210142631.6f8a3411@fedora>
 <aYs3VVH_UXMFa5oC@google.com>
 <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
 <aYtJznZcCEYBffil@google.com>
 <d9e00d8c-93c0-45f8-95f2-3235fb781e7a@amd.com>
 <3d90656315ab0b52f4725ca7c2cd10859d1e4f69.camel@mailbox.org>
 <CAH5fLgjNS1e420UX7muyEPWX3dZ-JsA_uy3=PM7QLA2NuoKJmw@mail.gmail.com>
 <50ee6f3f-82d3-4eb6-ae3f-9f032f3caf1d@amd.com>
 <3fa96185ef99f56947360355dc55739d66043f28.camel@mailbox.org>
In-Reply-To: <3fa96185ef99f56947360355dc55739d66043f28.camel@mailbox.org>

On Tue Feb 17, 2026 at 3:28 PM CET, Philipp Stanner wrote:
> OK, maybe I'm lost, but what delayed_work?
>
> The jobqueue's delayed work item gets either created on JQ::new() or in
> jq.submit_job(). Why would anyone =E2=80=93 that is: any driver =E2=80=93=
 implement a
> delayed work in its timeout callback?
>
> That doesn't make sense.
>
> JQ notifies the driver from its delayed_work through
> timeout_callback(), and in that callback the driver closes the
> associated firmware ring.
>
> And it drops the JQ. So it is gone. A new JQ will get a new timeout
> work item.
>
> That's basically all the driver must ever do. Maybe some logging and
> stuff.
>
> With firmware scheduling it should really be that simple.
>
> And signalling / notifying userspace gets done by jobqueue.
>
> Right?

Well, the timeout path is part of the fence signaling critical section unti=
l all
fences have been signaled.

But, if I, for instance, just kick off another work from the timeout handle=
r and
subsequently signal all fences by dropping the JQ, this other work must not=
 play
after DMA fence signaling rules anymore and is free to do whatever (maybe e=
ven
take a device coredump without needing GFP_NOWAIT).

Xe does this with xe_devcoredump_deferred_snap_work for instance.

>> You also potentially want device core dumps. Those usually use GFP_NOWAI=
T so
>> that they can't cycle back and wait for some fence. The down side is tha=
t
>> they can trivially fail under even light memory pressure.
>
> Simply logging into dmesg should do the trick, shouldn't it?

You can't "log" a device coredump into dmesg. :)
