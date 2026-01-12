Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B76280335;
	Mon, 12 Jan 2026 13:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224836; cv=none; b=UscxI8st08WG0ls/6+Jv84/kV/pFkiMPTYJEAA+Llm1Lu4mdy/oex1sCSJOBUj+VFj3ek/8gg4/bPMR64iFmruUt4P3uSwC8/bfupceoUPzRooSFvqRPFidFTp9jxBLbpMZXQIIL60XrY+/obfVVgLC+iBZCYwtAVyBihzUMfkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224836; c=relaxed/simple;
	bh=hqbpLXwODEgF9JoNL1u0dr3BNsXBfOK8Aw/YSrycNrA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Bpf0NVDwlE2xHz3TXwir4p6d1a3DBenLnOJHZO/gonKmnnqtNqwZaAB8mKO7iu3XpwRz1WHkFv/0tmL6mvruTt6LlQ13Z5NjCTv/CYY8R1bm6fXfXsZ1oKhfp2OPne3kxYatdrXby5KVRXnACVzArNZmVoz7dVm1PrNMKfpXh1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCI/5MDw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCI/5MDw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327C6C19422;
	Mon, 12 Jan 2026 13:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768224836;
	bh=hqbpLXwODEgF9JoNL1u0dr3BNsXBfOK8Aw/YSrycNrA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=OCI/5MDwRMfbvWnpBctMCgohVrOoDtwK5xkR/tHgmcloHSyUJ8Gb+6ZrVoDt3y0oy
	 RYq500rhc7pNNzBD/kuBGd1yM1YAMe/koNnaMUERyvVAku5gfOsgYmWP7Sifw0dUMd
	 2gw9I10NxIlvb5Wb6fXV/Q4gyQN/ID+RVQlf2RUo5xhQR4DQRAfD5ilVVoTRr0oS/v
	 N09BYRjSWmI4ly4ePZfSYn+SxhtjwibvfLm26PUaVasOqCi6X50GfLIdv1AZxW04Am
	 ODfDzwG+ab/s31le52eS19/GhOhr87Tg5k2tcSAbmlamFlQk3g66vl0jaFtKgNUAKI
	 uEHbs0vObuzOw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 14:33:50 +0100
Message-Id: <DFMNE0WSW2QR.UWZGFHOWIAL@kernel.org>
Subject: Re: [PATCH 0/2] gpu: nova-core: gpu_name cleanup, PMU debug output
 cleanup
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260108005811.86014-1-jhubbard@nvidia.com>
In-Reply-To: <20260108005811.86014-1-jhubbard@nvidia.com>

On Thu Jan 8, 2026 at 1:58 AM CET, John Hubbard wrote:
> John Hubbard (2):
>   gpu: nova-core: preserve error information in gpu_name()
>   gpu: nova-core: don't print raw PMU table entries

Applied to drm-rust-next, thanks!
