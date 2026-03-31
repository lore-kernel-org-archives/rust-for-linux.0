Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F54C3090C2;
	Tue, 31 Mar 2026 13:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774964193; cv=none; b=P3AX84LqL3p2PtdVCqqJmrjzKyB2rWB8UlcCmVLdamK4jCyetOTNgnbgL0pTHmEmcgvh0GCs51AL7+lDUNE3WrHTgB5poIwfbX0uVoYfbI1tQ4U0QG1+Bf6QPLgLvMvojf1l2jY+k98swgcSdYNS6HQyU84ews58w+bGKRmxVec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774964193; c=relaxed/simple;
	bh=WKjhZEkOWd+HfB3a5V37QImO1M2O3x4mbu4VMHRoLEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=piWf9H/Nt0bpOqMQ0T2b/GKKQhilB/+ycHZnnTiSQvQqpAJLnn2evz86EItpfibeiNZ8cxLXwKZL8n/IQ/KdhxSQSyRnxo2cCEy2ljxUaeGmAoKOlE4bMGoFzWNpWLCiI/MJtyiCm3JgvPKYgU5ehdJE7I5PfXK4VnOmVmBj8C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvFqTxS7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvFqTxS7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9347FC2BCB2;
	Tue, 31 Mar 2026 13:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774964192;
	bh=WKjhZEkOWd+HfB3a5V37QImO1M2O3x4mbu4VMHRoLEM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DvFqTxS73uQndFQgg9uWPmagl2RBoWcgB7li1FUrQbwQRnpbi1w+ut65PSmMjgA0k
	 EP396r5ukiQkEGM8O9/kwMqcBKGQkeP1rvi3LqhleePZb7Jz7X0FkbZUnXqWs4B0eG
	 +tjqVHAGcRUgqqIcKcZ8WOEQIOCnOppElVeZ/phRqVQVs5CY1iKYT0jYk9E5B31l0M
	 v6baC9YZhOpr92HPkdTcI73Z6X2X1zuSyXGf28vJMkik0jRQG+R/bMIS7hA6wIlBfI
	 icCRdrbYsaw5gwFwrYeoH2WcMNtUYYSU6aIBNmBXHWZj97fD1GbAFxYzBJQuItOEDp
	 Igrjmbhrg1KqA==
Message-ID: <adae6d13-e70b-4377-a9fd-4bfc985e3d89@kernel.org>
Date: Tue, 31 Mar 2026 15:36:28 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: bitfield: fix broken Default
 implementation
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl
 <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260331-fix-bitfield-v1-1-ebe1a72b4fae@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260331-fix-bitfield-v1-1-ebe1a72b4fae@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/31/26 9:56 AM, Eliot Courtney wrote:
> The current implementation does not actually set the default values for
> the fields in the bitfield. Set it and add a test.
> 
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Thanks for the fix!

Please add a Fixes: tag and separate the fix from the newly introduced Kunit test.

Maybe it is not worth adding the Kunit test in here as generic bitfields are
being worked on, but I don't mind.

- Danilo
