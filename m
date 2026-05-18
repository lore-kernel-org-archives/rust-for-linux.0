Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3FA31F9B0
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779098785; cv=none; b=S1WqJhxw7eteD8PNG7fK4E+UmXvy3M7QMMy0W7T0Bh2w23fvM5GSxjo4oFylpWmBY6yCpuu1qfiBIssrSR8NwAVEkJcRVOlL9CbPUzV2JcFltC7KurlBQ1W5k38vaqGaSUWJ/hyC2hu3GuOwwcgNATH2N9ftQlcS/wdZSPpvrrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779098785; c=relaxed/simple;
	bh=KEg6Hi3hlNlYZ8PLaUPxZCx0yAZdeP8lxPT8W/F/GRs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=ZKXHKlSVcpsYnFqFvMIuHCtiYYnuvZUv/NKNGqBAMEFRp9uoouy2bQTym2l+HFcku+z3kLS2s+nYbmr1SuFNlGQnha4kmoMK0QyJNqiJHjxO8pCPygGYgrUOkDwHiZa4nZX5wqjUBVSaTRwcvnS7oBh1FTWD/N6AfBmE8cmlTog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yv4fNDnz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yv4fNDnz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4467BC2BCB7;
	Mon, 18 May 2026 10:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779098784;
	bh=KEg6Hi3hlNlYZ8PLaUPxZCx0yAZdeP8lxPT8W/F/GRs=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=Yv4fNDnzvQTTsMICDyydMPzGN6duSaXxxOe9DkC2Wyzrtki2wSExsdPqR/ndREnlF
	 mPhb9+tNab2n1abKKuTd6JAyc43QGmEijX+gjdFw6iqDKm/K4UvgJ5vAO9G1eYbMXd
	 xLe6DWvYHREE9mQfifaDbqxW/Yp2bVI7DnDiBi/f/CIdNQ+4EHohNYm06j28QGJM4v
	 8TstbTnp43c+I61UNJE5Z1t3eCzjkpHIt2d3E9mVGCUXwTWBDt7e0K80dVpT+SpYXx
	 ieYLVPGe6MnRjDXvjg0EkMzWee9YGjtqk9VqSBY54uaWr7Fdq2E8KxC4RF1kNwZHTP
	 c73lR91L8tqPg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 12:06:19 +0200
Message-Id: <DILPVSCS20SE.2ZL1IK6KQH2CM@kernel.org>
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
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 08/13] rust: drm/gem: add GEM object query helpers for
 debugfs
References: <20260326-b4-tyr-debugfs-v1-0-074badd18716@linux.dev>
 <20260326-b4-tyr-debugfs-v1-8-074badd18716@linux.dev>
 <DIHXMUSMRHYB.39N8PCC9D86KM@kernel.org>
 <9839e1fc-faa2-4e98-9f46-b6449bf0f35a@linux.dev>
In-Reply-To: <9839e1fc-faa2-4e98-9f46-b6449bf0f35a@linux.dev>

On Mon May 18, 2026 at 9:39 AM CEST, Alvin Sun wrote:
> A generic Debug impl for GemObject? Other drivers like Nova might need=20
> different
> output in a different style.

Why is any of Tyr or Nova special here?

There's already a lot of common debugfs code in DRM [1] (which is per DRM
device), including some GEM info.

If that is not enough, why can't we extend it / add another entry?

> How about a dedicated debugfs data structure for GEM Object instead? Say,=
 a
> get_debugfs_info() method that handles synchronization internally and avo=
ids
> exposing unnecessary interfaces?

It would need to be guarded with a debugfs config, otherwise we'd still exp=
ose
information a driver should never touch directly, which can easily become a=
 bit
messy.

But again, why do we expect any of those drivers to be special? I think thi=
s can
just be common code.

[1] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/gpu/drm/drm_debu=
gfs.c
