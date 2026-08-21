Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A3637A847
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787327916; cv=none; b=YISrW9bA6I6v3npAcUArmFX2HXa2yLW64LFDDEDyQtrBFY99zMPfMO5yJR/Vi7csCqm8hF6QmOFsBpAmBmE+2+qcER7O3wf0xJr6oXfe4UEMCyM6GbnYj6Pd/ImS5pjNYS7edg8KEJiebGnxds/Nf3E2Bv4oUPC9EVDWmCmMZe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787327916; c=relaxed/simple;
	bh=qUvF3jtGw1DhFu7hS23mhcu4WGqHueQGoLiaRXlNc5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L8D+Uc9e2m6rBvZjHPO7GCplqhomRkjVOrcPy4NGb0y0B7q6movHTZsR5UGOG8Sh+w8PiMtUaY/0TdNxIanFsfzkojuyNYYBtF4AegMpx8EO2mTEqBWadNNUMkyKTCgvMxxFkt4GQVPIyIrZ/IxJzttW0z9Co0rgHmsn9BLvFsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=C4Q8L/fV; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="C4Q8L/fV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1787327899; x=1787587099;
	bh=qUvF3jtGw1DhFu7hS23mhcu4WGqHueQGoLiaRXlNc5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=C4Q8L/fV2A8frMZgcx99nrlViToxie8KJuUd9AhbQLmaN0/pXU4dT5sA+lAqWPZMf
	 JTZBVJNukN5jaDh1e6gFapCq6+63zstnDKVSlVYKkY+NyVZ+k6VwFTH7/GGUrPnfbh
	 NtdSfdkWEMBCAIXQMQw/UYrg4fz8rjIKTar2IYSV6YLSxv/uC1vKKOI9u+ii4XWKzQ
	 iUJEMVc1+j1ZxcjMHbTCKANmFopOIhI0hdJsK23merda6vfvUYSiz+s7fW3WMYX2ze
	 Rp0A9XM2JJieWoaJzJxy1Jva3QuqNQ1tNpGh6s3vaA2dEBUNlZwcyth/imiTZAPjiA
	 3OLkW/+Qf50Yg==
X-Pm-Submission-Id: 4hRQ2H4Wnyz2ScXb
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dakr@kernel.org,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v6 2/3] drm/tyr: add GPU reset infrastructure
Date: Fri, 21 Aug 2026 18:58:12 +0300
Message-ID: <20260821155814.980146-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <653D47F5-0AF3-44B5-9896-F0AA81F67B61@collabora.com>
References: <20260819-tyr-reset-impl-v6-0-7b4e1e041fe5@onurozkan.dev> <20260819-tyr-reset-impl-v6-2-7b4e1e041fe5@onurozkan.dev> <653D47F5-0AF3-44B5-9896-F0AA81F67B61@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Aug 2026 12:31:03 -0300=0D
Daniel Almeida <daniel.almeida@collabora.com> wrote:=0D
=0D
> Hi Onur,=0D
> =0D
> > On 19 Aug 2026, at 15:45, Onur =C3=96zkan <work@onurozkan.dev> wrote:=0D
> > =0D
> > Add support for scheduling GPU resets on a dedicated workqueue. Track=0D
> > the reset state to avoid queueing another reset while one is already=0D
> > pending or in progress.=0D
> > =0D
> > Use an SRCU based gate with mutex-protected reader admission to block=0D
> > hardware accesses while reset work runs and wait for current users=0D
> > before resetting.=0D
> > =0D
> > Stop new reset requests during teardown and drain any queued or running=
=0D
> > reset work before releasing the device resources.=0D
> > =0D
> > This is the initial reset infrastructure only. It is not wired to a res=
et=0D
> > source yet as those will follow in separate work.=0D
> > =0D
> > Link: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/28=0D
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> =0D
> I=E2=80=99d use dev_info instead, I don=E2=80=99t think a reset belongs i=
n dev_dbg.=0D
=0D
It was dev_dbg initially, Danillo said otherwise and I changed it. I have n=
o=0D
strong feeling on both.=0D
=0D
Does it deserve a new version to switch back into dev_dbg again? I think we=
 can=0D
easily switch that when pulling this series.=0D
=0D
> =0D
> Otherwise, this looks good to go from my POV.=0D
> =0D
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>=0D
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=0D
=0D
Thanks for testing and reviewing it.=0D
=0D
Best,=0D
Onur=0D
