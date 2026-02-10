Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E937230F95A;
	Tue, 10 Feb 2026 10:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770719784; cv=none; b=Od8nB/7QkfNeI/ZmqpTC0uK5374GRR85KxzwOWA+wYtMlmKlWyNWUZsGXDm2qOg2f5qEB4FA6QeIxhgAYE/nYbGVzPfHxDfytN7xCpKes9AWOQVsOcg3ImZc3eBxc1PSYTFPdp/+h58wYxNv38UFWvRbqkxrl5pH6dLCm0bNoQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770719784; c=relaxed/simple;
	bh=SfmA4ZiVN6LIhoVXum4PX+xUpxUjguH2l1RyRHiivl8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=GAg+XHDWZzy+RsP+FvqbNQ7QvzYZiF0DoAHcjjJztXj6KmdCQNlI6cWOdYWFgEOPIpzhK4CmBmoCBX/xfQX8luvii4QN3o8jTPTE/9mpdBkcXFcj24NI55n2YKRMEQD+10PNbMmyhCOrZ/AC+mPEtUw4CW8l0vYksl5aFW4/T3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tP59ZqOH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tP59ZqOH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11500C116C6;
	Tue, 10 Feb 2026 10:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770719783;
	bh=SfmA4ZiVN6LIhoVXum4PX+xUpxUjguH2l1RyRHiivl8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=tP59ZqOH0iLnItxQDS3kUMfVmS4uTupibp3LKjgV9QlaF5acqrAT5gX6hfmoQxooP
	 ccaiPZJb+YWf03KF/0h6KlW1zEydiq1UcFTEWWA+43Ba/+eqKeVEpCdfU2+dNZZEd7
	 /VFzKi6h10xbOctuwyUqMiCX42KcRTz64HmPSuujZOdVKkMgekTt6qTZ82ul/I2tO1
	 95s9CYeoBdBxnF35coMRiXJa8rFQhnYS1Ids5g7zN/nPC1ZJa3a+iYabyy82n3P//g
	 38GKx357NL2RVEfw4JVqD6/yAkDTKd7MeJ63pr4vQPjmoT3BaNVx5F9WrI+NItLSuk
	 9HXJLsPjCkVDQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 11:36:19 +0100
Message-Id: <DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Cc: "Boris Brezillon" <boris.brezillon@collabora.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Philipp
 Stanner" <phasta@mailbox.org>, <phasta@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Gary Guo"
 <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org> <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com>
In-Reply-To: <aYsFKOVrsMQeAHoi@google.com>

On Tue Feb 10, 2026 at 11:15 AM CET, Alice Ryhl wrote:
> One way you can see this is by looking at what we require of the
> workqueue. For all this to work, it's pretty important that we never
> schedule anything on the workqueue that's not signalling safe, since
> otherwise you could have a deadlock where the workqueue is executes some
> random job calling kmalloc(GFP_KERNEL) and then blocks on our fence,
> meaning that the VM_BIND job never gets scheduled since the workqueue
> is never freed up. Deadlock.

Yes, I also pointed this out multiple times in the past in the context of C=
 GPU
scheduler discussions. It really depends on the workqueue and how it is use=
d.

In the C GPU scheduler the driver can pass its own workqueue to the schedul=
er,
which means that the driver has to ensure that at least one out of the
wq->max_active works is free for the scheduler to make progress on the
scheduler's run and free job work.

Or in other words, there must be no more than wq->max_active - 1 works that
execute code violating the DMA fence signalling rules.

This is also why the JobQ needs its own workqueue and relying on the system=
 WQ
is unsound.

In case of an ordered workqueue, it is always a potential deadlock to sched=
ule
work that does non-atomic allocations or takes a lock that is used elsewher=
e for
non-atomic allocations of course.
