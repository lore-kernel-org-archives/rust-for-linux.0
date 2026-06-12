Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4832E34D3B5;
	Fri, 12 Jun 2026 20:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781297720; cv=none; b=qz8hAYqIbJXLczBQ5oECUQCX8qAkurmepChhdMr0koI1m7iCwWIeS2h7odaXFDwWwo+Nyu/84gSKUTyl7QgrOBpyzM2RTTLGGWW7naZnLAv50HVAsXB40dfDlC/9DmCn85e60RhFCbliGVoYu069dhfU/dQosRDYcpnyoIXPB9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781297720; c=relaxed/simple;
	bh=QXfla3nhakZLj9pJJh9vpYCxoPZViI7ITOsfhaLrvec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H39ZEi/DIPQmcob7Nl1n3j7sWxRnEU6c7B/p8/zZCiwIgC817jhqTc/pcM+wjIbkGwhQzdtpslo/U+z8/6Ptz5k9nEpGqPIqk5n01jejYrgF/7bNINlCmshqVyrJx+63lw3HIxa6ZIOjhBjrQwXaUU6IZgGECsGPO0MsmkWg7gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdyP5SMB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdyP5SMB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C881F000E9;
	Fri, 12 Jun 2026 20:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781297718;
	bh=iCD70DUh8GsBEQIl7jFunndrZwyktErUOz2kaJjSLO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AdyP5SMBxoQmwUxAYAsCtfbTuHIeupqTy6Bw/dKFOOnVjjm3GP9mH52RW1R1Q/oAW
	 L0C2I6UUMQNSpwujny51K2FRCC6i0+Aj1S2QMjU6Z56UkxvEisR2XENqzn86Rh1Wtq
	 xYEVx+KjcXCn6UN3YYo81s5Bdo4ygY1+Qn3FeiwMWOozEMqVDQ4iHoV70/dpthpTTl
	 O/EpAmkGvd9ZC0eBkKnuX96rMtwK5jAp/5+hRHwQJ/zBQEgTfNcAWuPcXYsR22AdNH
	 hXQt9ECqX8g8PcQM4e4Cw9yDaUyEbD31uLjN6BEzTbKiC5t0Rl0Eph4FX4c0s6iiZV
	 3AZF7+TbKX7KQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	samitolvanen@google.com,
	laura.nao@collabora.com,
	boris.brezillon@collabora.com
Subject: Re: [PATCH] rust: drm: gpuvm: update DriverGpuVm for DeviceContext
Date: Fri, 12 Jun 2026 22:55:05 +0200
Message-ID: <20260612205504.836026-2-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610-gpuvm_device_context_v1-v1-1-01a890b17448@collabora.com>
References: <20260610-gpuvm_device_context_v1-v1-1-01a890b17448@collabora.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Jun 2026 17:01:26 -0700, Deborah Brouwer wrote:=0D
> [PATCH] rust: drm: gpuvm: update DriverGpuVm for DeviceContext=0D
=0D
Applied, thanks!=0D
=0D
  Branch: drm-rust-next=0D
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git=0D
=0D
[1/1] rust: drm: gpuvm: update DriverGpuVm for DeviceContext=0D
      commit: 20003c1a1fd8=0D
