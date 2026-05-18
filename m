Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD9721D3F5
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779098987; cv=none; b=Mvt36urA7HHw2fsaTzJaJ0ujS6+woYuWovL+Glxh0hE9nkjwKzi/iI3bsI9fmn/M7qgh5s9YDWfmEs57sKGZpF6V/I3cQmc4E70JpLX2tq4PCDFPnOa834Xc+LLFHCEwoVsi2B4nbY4AcSEumFLt2TC3QxyLVssCkOPqtUNZDqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779098987; c=relaxed/simple;
	bh=shQp/tVJMsNoDiJP76yqXZ2VF/81FyuiPhegcrIEk/g=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=p0vowLAuXBxaGiYcerT7GSHIdibu4GUp0HFkMLM27tjRhuRmnKfHg/Hp39cDkB/wTEElNOtUKpz2bjIf1y9NtZTxTcMNler3fap7mh4Vv5qEz7XDH6GvprOalnZstUaFSx2JmktWl+9UUBH59K3f3vKcVRLEUapzUbbu5tL1jMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NHDF4F8W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NHDF4F8W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17ECC2BCB7;
	Mon, 18 May 2026 10:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779098987;
	bh=shQp/tVJMsNoDiJP76yqXZ2VF/81FyuiPhegcrIEk/g=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=NHDF4F8W/MhWIyiaCQe/mW/O5mnYG6vH2O+bHlW1tDvJV9m2Eu9qIZMMa7aOdmm+i
	 IHZ7d3Sxt2e+rXguB+3ly01EZsq1/PHkjLrsKiTwRbEYZQy8WFoSUv42q8CFBcOQKt
	 g+4aHwqWwK1x8+XPYJN2BZHIpk8NkCp9x1jU9wRsGpTajFDOyTFF14v2ob9P1OkpSK
	 e5UfFSSEi+vWwG8RtBs+SODtFoe6S9wl7Empp3P792te4MTPDA/iZeb3V8p9hd8ZCj
	 eq+YzTCZzEpfXgxleXJvNvqcqvvA3vuYlz0WEgHtMBQJLpjoaeQcXHVE68Pl5IBaqx
	 EQIj2z8aiAE4A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 12:09:42 +0200
Message-Id: <DILPYDI01YFS.2NPFG6ZG085PP@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 11/13] drm/tyr: add debugfs infrastructure
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
To: "Alvin Sun" <alvin.sun@linux.dev>
References: <20260326-b4-tyr-debugfs-v1-0-074badd18716@linux.dev>
 <20260326-b4-tyr-debugfs-v1-11-074badd18716@linux.dev>
In-Reply-To: <20260326-b4-tyr-debugfs-v1-11-074badd18716@linux.dev>

On Thu Mar 26, 2026 at 7:53 AM CET, Alvin Sun wrote:
> +#[pin_data]
> +struct TyrModule {
> +    _debugfs_root: HazPtrRevokeHandle<'static, kernel::debugfs::Dir>,
> +    #[pin]
> +    _driver: Registration<platform::Adapter<TyrPlatformDriverData>>,
> +}
> +
> +impl InPlaceModule for TyrModule {
> +    fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, e=
rror::Error> {
> +        let dir =3D kernel::debugfs::Dir::new(kernel::c_str!("tyr"));

Why does Tyr need its own debugfs directory to expose DRM data structures? =
DRM
already has a common debugfs directory per DRM device in /sys/kernel/debug/=
dri/,
which you should attach to instead if you want to expose driver specific fi=
les.
