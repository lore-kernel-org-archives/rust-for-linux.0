Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0D1376BD3;
	Wed,  1 Apr 2026 15:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775058263; cv=none; b=VbKh8Bhx489Po+djm6WCn1bupnDhYIKRyELYLPyC2NWLj+1AnZKk970INHPykgFA13XJ02Hw/i3Mp28RJcNOeWPl2ZiSeJ7Ht7MxGHBprTvRgUvAUXFdF2H3FVf/0jUzRNt3bcgA3H5pf0BD61B9+WZXEEthxzHfVv8cYc29XF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775058263; c=relaxed/simple;
	bh=ZRDfHt+Ok+eRdwZHF1aFyAbSlAu2IdH5At0jrTj5QAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ht9mIHmIYM2zfPUV3D32kdYLXpkuhnJEeggDYgvSggAxua5dp7JwnVPQmwts2WK/hEESdSHQ1/5hRY3OnDoOL7A2ih4zhhbM0ubh0HzfQwYc9iPYiJcSGXXmdrt5Rzy7IvsiAJMm9q5csnJRMxUj1BRVb/tQpVYEB6z3OX1g1hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mo/fACUX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mo/fACUX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DCDC4CEF7;
	Wed,  1 Apr 2026 15:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775058262;
	bh=ZRDfHt+Ok+eRdwZHF1aFyAbSlAu2IdH5At0jrTj5QAE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mo/fACUXQKKCXDhElfBvQNsilYluxvtR2tifOwSA7ZyDKpSZuKPrqb8LUX5IY5z1u
	 PPZZIind/7kYlY0Dc3eL3tU3mUO11aPNxczfTv6Ikxh5XHKr57VqQolpce8sQENCcA
	 bHbh/7kCzpkVCW6DDsL7gbjnjkSPq9wZauzVc+5UbpW579wxOi+Y5F7/AgOJ7doNT8
	 XEpXik9qbaHZnqLi8EsTmqeu/DnoDR1FQ3p8a98HE75zHhDLMgfExQaVqdBUWaq0Wz
	 dxEyN8lJN3mu0nJkqTCkEYNNurK7LbplCSs+fTN0a5Ij9Ka3G6++Y0P4/yzDt7QARV
	 a2llbRXYLHZSA==
Message-ID: <96e7ec53-9b98-4203-a011-77241c95ac88@kernel.org>
Date: Wed, 1 Apr 2026 17:44:18 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpu: nova-core: bitfield: fix broken Default
 implementation
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>, Lyude Paul
 <lyude@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260401-fix-bitfield-v2-1-2fa68c98114a@nvidia.com>
 <DHHJ82YDW7FP.2ZFKZUQUZZ2H7@nvidia.com>
 <DHHXFZ05SBVH.2MK50Q9PMTVDZ@garyguo.net>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DHHXFZ05SBVH.2MK50Q9PMTVDZ@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/1/26 5:35 PM, Gary Guo wrote:
> This could go via drm-rust-fixes?

It seems there's nothing actually broken due to that, so no need to take it
through -fixes. But we can pick it up before drm-rust-next opens for new
features as I will send another -next PR for the unsoundness fix anyways.
