Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDC7395DBE
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 17:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774373509; cv=none; b=bVpOF8Q6aaeSrODkdnd5rvgHdAx6A33vd7D52Q4L2KtyBo76Zx3yfAo8SyTkW6qG3BX9p28/kU0RKEOL2SrWSlIeuWhsNIaqTc39f83P0FMImInaN4/OZ7yaSQGToMbII/llcCzTOEvsflY5GizipRlZkoJ7yOGtnVSEbW+V9FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774373509; c=relaxed/simple;
	bh=ihjorTWBm+kJapN1+7d1UWus07r4dI5md9Ppt6Y2Oac=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=BlHwGVBdRZcwatWzDkID170DJIMWhaKi3k2VsSwNrj0GcdvDjEL17CpwgVvfZkvejZZv6Vud/nCrD/rOkqvrkiczlqcnU2KwLGYoxjdPxRVkKp3jVLaFf2VafaSXBevT4l0ZYDo3/CAiarVoB/pJ3/kVXc3IMzLzySkIfR+7PJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvxZDYe3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvxZDYe3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D909DC19424;
	Tue, 24 Mar 2026 17:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774373508;
	bh=ihjorTWBm+kJapN1+7d1UWus07r4dI5md9Ppt6Y2Oac=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=XvxZDYe3TJjGPtlpRZn7iNHTgNNHTUoDeIsBKnLE2+C/EIYxphlNrnsFFUg0+IATD
	 NChq7jiLi6wEe8fladTmKnWE+UXAz2w94l4m0N4//DBkIAxLTJBBRJRtRCPlTqg378
	 4nJlvl4z9byWu9tT9nLeHjZXpHtUS3f63jboQPdB8bTD00Dw9JhGr0WSNcteGhJpkW
	 HxLiqvCvLR4Mlv5XoH/sE3fJoNMJMUnbnTO+13w+ZTA2jvK8u+/96ZvDsEgHc/bmWb
	 nMqj5t3yLot1KTxkBWZoYmQjzd+CBlBOnG5lmg5HwYqDZJaZpxX+h7DMCoFkR8eUWn
	 ddw5b6CmY/dvA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 18:31:42 +0100
Message-Id: <DHB6WU5SYXU7.2QMPFZG1KDOT8@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 01/12] drm/tyr: Use register! macro for GPU_CONTROL
Cc: "Deborah Brouwer" <deborah.brouwer@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Steven Price" <steven.price@arm.com>, "Dirk
 Behme" <dirk.behme@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
References: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com> <20260323-b4-tyr-use-register-macro-v3-v3-1-a87daf9e4701@collabora.com> <DHAZ380DRB8A.19SI1OUABRWTP@kernel.org> <20260324130653.74f9c2ab@fedora>
In-Reply-To: <20260324130653.74f9c2ab@fedora>

On Tue Mar 24, 2026 at 1:06 PM CET, Boris Brezillon wrote:
> It's defined in ascending bit order in the datasheets we have, so if
> we're ever going to auto-generate those from the xml, we'd likely have
> the same definitions Deborah came up with, unless the script re-orders
> things in descending bit order.

Huh, that is very uncommon; is it actually

	15:0
	31:16

or is it

	0:15
	16:31

in your datasheets?
