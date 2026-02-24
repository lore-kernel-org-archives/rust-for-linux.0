Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F933A0B1C;
	Tue, 24 Feb 2026 14:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771944479; cv=none; b=K1Gy3tHTMkLIt/H1y9iuxK/aF4cJ8NHoDvzLaXZSly47M1mgQILrk/mxCJfpkgzrebOBszOTN9MzZ51KbXMYyCib6ZHUePnDIjJOcC0rfogC9tErffacmHc12Zhc4jFVOfyBj7uNSsedycrXUyuKUknFBxqr8o/C/Nuc5SzOV+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771944479; c=relaxed/simple;
	bh=VISfPsroj9CqNNLmyknkEDkN8jYvZkbvfaoN8GJsuxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=piFu3QWDlpHU/sw2GajyUa5vo0K4G61j3CWRqcy9Z6RsOKw5lrhFD/xhsugglchmGuqHpl32DcxJOZxapPoceSR6H7krM3zebJW/rDW9pnkRnh47nDmsfACY0iM2ZunTmGqOiUhbWbjw6VQz3xd39C2NuBN2Un4R/RIBl0DZGKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0dt8YRY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0dt8YRY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE78AC116D0;
	Tue, 24 Feb 2026 14:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771944479;
	bh=VISfPsroj9CqNNLmyknkEDkN8jYvZkbvfaoN8GJsuxU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M0dt8YRYHPrbnyx3uhNU19gYdoqIoN/XiGW9H++Fve4PwXRaVW1kicA+bbsQgO1Yn
	 BipsDgTygHnHxeakOINj61sk590zY2UuVzR2SN6pKqUBPEejasvWa7A2twGhQvgfz8
	 wqcvMYM0id8wlUkog7xotIYANaFXJ5EwSKXczuEkyOdjgMokKdQmAKdC4r59OiwjND
	 LEGWxGa7CQ7aH5iyZUvzaIzIS1x0NhM4UJyRR/suZL7qqz4TgPJvPOoKGYJ4ryYcer
	 G4oiaF0G3LjdaguBSh0jluKNojlGfp/umEFk7Ju2LbzXnIyz8oqk/JKLcS5wvUW23B
	 oEVfcTipjQLnQ==
Message-ID: <c4bc5e1a-0ed3-4737-97c8-6775f4fdd6ab@kernel.org>
Date: Tue, 24 Feb 2026 15:47:53 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/38] gpu: nova-core: fix aux device registration for
 multi-GPU systems
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-2-jhubbard@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260221020952.412352-2-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/21/26 3:09 AM, John Hubbard wrote:
> The auxiliary device registration was using a hardcoded ID of 0, which
> caused probe() to fail on multi-GPU systems with:
> 
>    sysfs: cannot create duplicate filename '/bus/auxiliary/devices/NovaCore.nova-drm.0'
> 
> Fix this by using an atomic counter to generate unique IDs for each
> GPU's aux device registration. The TODO item to eventually use XArray
> for recycling aux device IDs is retained, but for now, this works very
> nicely.
> 
> This has the side effect of making debugfs[1] work on multi-GPU systems.
> 
> [1] https://lore.kernel.org/20260203224757.871729-1-ttabi@nvidia.com
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Applied to drm-rust-next, thanks!

    [ Use LKMM atomics; inline and slightly reword TODO comment. - Danilo ]
