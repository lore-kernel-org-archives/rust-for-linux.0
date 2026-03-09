Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFF0355F26;
	Mon,  9 Mar 2026 21:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093476; cv=none; b=dPI1n7OfZSn2pENO2mVQraOYEr12tk8v2RZKNvPoxoDi5JtQgu3xoP24lksFjJWkl/dcZzmZ3XBJrcf6BigRF3n8x4dtgJPt8Gf3LK16r4hylNOFIUU0/BHAQNokf1q4UyUTw1lW461vqPOiuS6J4bc4eKtdNAUhAauY/Jr1DeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093476; c=relaxed/simple;
	bh=v1uYu1OAljm4McknvKwKex9mM9bxbsWylkAY9vyVrsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QgHT14LGdbV8UxEW02TdhqYPVKOvMfU0s0NOXZRiUMsM1JOEoyZnZsgIZsEEuwXZYX3M+vlYRIBbeWkiJCXNczWu9Ia/+W62URNRexwJ2Zn2vikuG+pbzvan55mzx7n4StW7LoYo/JYO9L/TfDKwNjofX/Mv45ZLTr3mPmebPOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fX23DxRI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fX23DxRI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F488C4CEF7;
	Mon,  9 Mar 2026 21:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773093475;
	bh=v1uYu1OAljm4McknvKwKex9mM9bxbsWylkAY9vyVrsg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fX23DxRI3fJxKCsB3VjjORkAgsfYq/38Lc+5bPAoZaPpu/X+dep10z1tFgZFn1QC4
	 kqSg50XVNVpIr+c6gzKZXXwAi8j2YvB+u9/Xj9hCxcxqc9oppqQKbAnyWHBLapUaDK
	 1xFZWBl/FcgEJUl5+cyIJbxxV6KsbfrZBuEhLZcSi+x62TXDWrxMdeOVqpxXGZKKYZ
	 FzvEe9/vbxL+YmxwTL9agVS+/HIiuBRcbZrjQQC4/s0hCs0csN7zAeV8j7UGLAzOrQ
	 q7qOuPIguR34COHVvij8ZWVu/lgLVLoanbaa7e9mh5jD+zioOLq6U1QAEhOgOmJJA+
	 1J3wCbwP9yqFw==
Message-ID: <093ca23e-7081-42db-a202-0a42c51741a3@kernel.org>
Date: Mon, 9 Mar 2026 22:57:52 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] gpu: nova-core: generalize `flush_into_kvec` to
 `flush_into_vec`
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Alexandre Courbot
 <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
 <20260227-rmcontrol-v1-6-86648e4869f9@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260227-rmcontrol-v1-6-86648e4869f9@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/27/2026 1:32 PM, Eliot Courtney wrote:
> Add general `flush_into_vec` function. Add `flush_into_kvvec`
> convenience wrapper alongside the existing `flush_into_kvec` function.
> This is generally useful but immediately used for e.g. holding RM
> control payloads, which can be large (~>=20 KiB).

Why not just always use KVVec? It also seems that the KVec variant is not used?

If there's no reason for having both, I'd also just call this into_vec().
