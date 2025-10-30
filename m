Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4216E3595B;
	Thu, 30 Oct 2025 11:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822615; cv=none; b=I3JBLtayur0O5dR4x5u/gnN1p1DeukslrKvAqg23li/JmYBRyT24b/VrG2L7HcfiN52zpu+I0B/Phi3gRCXAl4vnElFrx1Y4f4SqjNHsQj/8vX8hc5TrkcT57sbuEvFnUxNI0F7Y2IBDQmNc+kMYgRjMElNQzvpDBfKQSWaJ00c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822615; c=relaxed/simple;
	bh=7DPscIK43top2NRqx/uD0GvM9s9v/q9ETJ+c/B9fvTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F2Z69OZkjrAYA8wQsDUd+yIWJh70pvS8LjiVdM2jzxcegrA0H7gvHHML5LSn47C+5zjhTJQZjkMpPmg+fxJzI3VDDBQUWiyG0K7gmFxAQblti8BQAmLBk2FNjJ0JdGa4k5Wyg/eHUXuOPrEnCmEsyZHN6wi9HAMSn9TqCSVVGT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDhkPcWz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDhkPcWz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5897C4CEF1;
	Thu, 30 Oct 2025 11:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761822615;
	bh=7DPscIK43top2NRqx/uD0GvM9s9v/q9ETJ+c/B9fvTM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oDhkPcWzjUldtLgPpKfCaR+QVOlXQv3WVtoDkVJO2A1q0AQbE56AQlMMCEdY0jqlE
	 fdoUoRupLV2jYgawaTZg8Nui50VMnb096AsyWBseFgJW5Y5XTX/tA51UVvg7C40WAq
	 Ub9A76tZUTAzfJnAKRnrlDdvhYO67MjFQnb2QgHxGE209h/SHAQ+I/oJIK/wNAwgYT
	 x1IGarw7/UVwt+CIXocPYlkBKh+zcX0+wbyuVFsJhpMSRjd91iMiyHDTGXdxd5riXc
	 unn8YBvZMkPaktmwHktO4J0hr3DoK0HEzuGj9WxRTkPUaIQlrRvzQeQ3mdxj/P4hDG
	 RPMXR5fHuLcDw==
Message-ID: <88199802-293e-4c09-9078-79a5bdd2fc7c@kernel.org>
Date: Thu, 30 Oct 2025 12:10:09 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] nova-core: remove HWCFG1 and need_riscv
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20251025014050.585153-1-jhubbard@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251025014050.585153-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/25/25 3:40 AM, John Hubbard wrote:
> John Hubbard (2):
>   nova-core: remove an unnecessary register read: HWCFG1
>   nova-core: remove unnecessary need_riscv, bar parameters

Acked-by: Danilo Krummrich <dakr@kernel.org>
