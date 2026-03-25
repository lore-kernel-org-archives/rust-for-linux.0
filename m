Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E7E1F4168
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 00:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774399357; cv=none; b=CnZKgQh+Wi9Cexw81O140HQS3Y+NLvBcArMi0CMMrck5lZNzp5E2bBgkjRWBI0LQ+vvW/dDNfZ+2MDgHlmTDGi+a+1p2GL/tWStyTgbSGDohge+JW5InjiChQKXpJwiNiJ4bRQDUrnp8kz4362RVXEBGtLU+ClPKZbl5Ry9yVqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774399357; c=relaxed/simple;
	bh=8ZGCxnoCyL1ybNM9lcrTCKBrZEVaZA5QgbRh66mfvTA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=iLF0KvJkMFp0qEO4Wlec3VUnBdGGyd0+IEmQS619IOozPx3D3e9efU3t+CNllmZVHMWdqac6jalFiLEngHXm7b1n+uEaQ6euHpIfYCsJT9NSuxFRv9ADZzTI3RNrRFo4m+KurFnILCzJDsv03I5bs8xIvAmiLbXezp/U2cpfn7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8xLHq0q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8xLHq0q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A53C19424;
	Wed, 25 Mar 2026 00:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774399357;
	bh=8ZGCxnoCyL1ybNM9lcrTCKBrZEVaZA5QgbRh66mfvTA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=K8xLHq0qE3QHOrXg/iKl/vcuq57tPbh713yoIi1PZWgzI7+YAikfKYmCyf7IlKKiB
	 EilLgS/OVsrKu60N5sruRGLD139MnDdDkklwNqEzNxsZEo376eXpCZKtboTO8XdpO9
	 CsC7kjBu5HyZIvDXN64ZJLnb+wjQSSBvGRGrSywkftENQCtIiqJtWl+vY8Zx76lKxj
	 hlAPF3Xwa805NX61i69k1t8rnkM+e2aXnrBBHMxLb0hj4SATJswVtZ+qTL/joMhjak
	 f65Fs33A5/aFkiOtOzZ+ACjFrYZwnbRjb8IQrlRYJYJd3nh0tCLMT2zOYtC5EsUY42
	 ureLDvT80RIew==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 01:42:33 +0100
Message-Id: <DHBG2PPAL2ED.3R4OC4W6XS54P@kernel.org>
Subject: Re: [PATCH v11 0/6] gpu: nova-core: expose the logging buffers via
 debugfs
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Gary Guo" <gary@garyguo.net>, <mmaurer@google.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260319212658.2541610-1-ttabi@nvidia.com>
In-Reply-To: <20260319212658.2541610-1-ttabi@nvidia.com>

On Thu Mar 19, 2026 at 10:26 PM CET, Timur Tabi wrote:

Applied to drm-rust-next, thanks!

> Timur Tabi (6):
>   rust: device: add device name method
>   rust: uaccess: add write_dma() for copying from DMA buffers to
>     userspace

    [ Rebase onto Coherent<T> changes; remove unnecessary turbofish from
      cast(). - Danilo ]

>   rust: dma: implement BinaryWriter for CoherentAllocation<u8>

    [ Rebase onto Coherent<T> changes. - Danilo ]

>   gpu: nova-core: Replace module_pci_driver! with explicit module init
>   gpu: nova-core: create debugfs root in module init
>   gpu: nova-core: create GSP-RM logging buffers debugfs entries

    [ Rebase onto Coherent<T> changes. - Danilo ]

There's a small follow-up series in [1].

[1] https://lore.kernel.org/driver-core/20260325003921.3420-1-dakr@kernel.o=
rg/
