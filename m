Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0577C388390;
	Tue, 24 Mar 2026 14:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774363534; cv=none; b=OBntmUtfGwb59ED+ArMX315kzfqEyU4pq9skPLH7dgif1riRrFnGOeVbZ0fAixina7FETglQvllvv7i2VkI+VybBSO0HPK+SRukFsvlag3ugej0lDZnzqg1Bkv4UOLup2rWYfOwHWDK65y9DtIf+AVtKfL51aZGpvuTZSvMBpEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774363534; c=relaxed/simple;
	bh=uzmG4qKnl9xfs465wjDkiQEG+XgLbUrZelI4PwG/AWk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=H3AHigG3a6yodNvfSyBPuX4QB9XDg/4QfZbl1ksdWip1U6nF/bpsnpN+djxtCkGLWzw9+Q+9N/gIoq0JQz77+gTWv6QLtx9Glou1UZCVWFgfZ1DwO8CqHlPfWZ77rDI0+MMYs7/J8+1QZD8NkcDxqZbHhYqoVEQCtOtqDs78elg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsV9k8ae; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsV9k8ae"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4373CC2BC87;
	Tue, 24 Mar 2026 14:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774363533;
	bh=uzmG4qKnl9xfs465wjDkiQEG+XgLbUrZelI4PwG/AWk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=PsV9k8ae3a9bnrcjbN6HddkjuGfikN7b39ITMB36/LiiVdskVSkRNHBV/0rPWI5Rw
	 Usul9NLbSek2FoOGSmx7y9J4E+WWntNtXZgdjPhHBy6UTTH084Z1PwAEZqwTO2U3Mr
	 gttILdOYlX223jkvDsB/KkzL20HCNKvEHHUId9qTlaFjy+WFkqd+Epu8k1Ow9Cr2j0
	 /FGBj6TX4kEnIEk1UdGp8EDYgLcmEh3yCDyx2wPWCsIv6md8vrb6TP30wlTHul1gTN
	 EZ52SZtTBZm0VQOqQS/8Nzy1ywRcyEz69H/CzDsiCKhemlN8dEdPgy6H/n4o/5tb06
	 2cK9MK8kKJdiw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 15:45:29 +0100
Message-Id: <DHB3DKHRDIZS.WXMYD9ISB0QU@kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: gsp: fix undefined behavior in
 command queue code
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Alistair Popple" <apopple@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260323-cmdq-ub-fix-v2-1-77d1213c3f7f@nvidia.com>
 <DHAB9Z571FPB.25927BK1RGNGL@garyguo.net>
 <DHB3CGY1Z5HF.1KSJV8SP8YD8A@nvidia.com>
In-Reply-To: <DHB3CGY1Z5HF.1KSJV8SP8YD8A@nvidia.com>

On Tue Mar 24, 2026 at 3:44 PM CET, Alexandre Courbot wrote:
> Should we apply or drop this patch meanwhile? I/O projections are still
> undergoing review, but I'm fine with dropping it if Danilo thinks we can
> live a bit longer with that UB. It's not like the driver is actively
> doing anything useful yet anyway.

We should pick this up regardless, I/O projections won't we usable for drm-=
rust
this cycle.

Thanks,
Danilo
