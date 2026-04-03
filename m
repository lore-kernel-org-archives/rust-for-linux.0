Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE8C28F948;
	Fri,  3 Apr 2026 17:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775237869; cv=none; b=oIxHm7o3z6ILsinxSxV8HufH7jrpDl2vM7QaHiY99jAJnEkys9EyxIOjBXs1BD6TIVtN1bYwDaqEGh685+v4uHH72RYepg5xM517hhaIyYjcdB5lV8hm1EqKtDNRFhOrEjX8kck0aKU+vM91B2pgJ0WrX9oUnu6ky2PjQ6Zz9w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775237869; c=relaxed/simple;
	bh=hqgZLgNN566Iogwng6grpVYRQlbqde4gHOvWVMmK9uU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=iSG7NCWK9IQDwkfrZp7LxGQsG6QuUkUJ0YjCvf6azOcBO1ZYvteq8QgBTf5SMy9vXmSq+l+NYVPElIIXoDCxqo1Mb49CLhoA9hAxGHgqqmIcoPlyTF0b4GQLToZxN9ffFoWDtsXoKdK0ILtJSfjvTUPcbnArbC3GHoC2I8k4MRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4voS5gv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4voS5gv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47465C19421;
	Fri,  3 Apr 2026 17:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775237868;
	bh=hqgZLgNN566Iogwng6grpVYRQlbqde4gHOvWVMmK9uU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=X4voS5gv74LvlZngDC2/3LQi0an29Uk/eJeTI/O8Ak5OkoHl6s/yR/FIjRXc80Rfu
	 RnU5k1kP4GPZ1AxuHVJj5ZS/MSq/7PiXFp6sgRpIIqlbZc08T1kY1TH0TFE8uBzfHv
	 bFd423FPibwAkLmvP0V/ORyDCaUNlKAsXmnLVFE/4deqfjlgqqlyT8rqMKKHbhtqdg
	 jFFIRPqtnzab8bjRzd2tuogCFlYv7ESctuUZykSqGzQ1mdDkLCxEHRrYt0+3D3gaMv
	 QTTZuNoqDxCh996Tm0fZsSsBQshbQhggX02Ig3j/3B0pd4bWIYUyh4t8kDoSe6jlBb
	 v0im2O2wiPkog==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 19:37:44 +0200
Message-Id: <DHJPAWGXIHTX.32B7QTC5N0KNA@kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: bitfield: fix broken Default
 implementation
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Daniel Almeida" <daniel.almeida@collabora.com>, "Lyude
 Paul" <lyude@redhat.com>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260401-fix-bitfield-v2-1-2fa68c98114a@nvidia.com>
In-Reply-To: <20260401-fix-bitfield-v2-1-2fa68c98114a@nvidia.com>

On Wed Apr 1, 2026 at 3:42 AM CEST, Eliot Courtney wrote:
> The current implementation does not actually set the default values for
> the fields in the bitfield.
>
> Fixes: 3fa145bef533 ("gpu: nova-core: register: generate correct `Default=
` implementation")
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Applied to drm-rust-next, thanks!
