Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F68044162A;
	Thu, 23 Jul 2026 13:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813158; cv=none; b=eK1MF0g52SNwaWAAeXaVJd/TD0k905tZ2P8iyNEDSZ0rs9OWULtIxiUsnTLO4YEdZoaSqHROQwsjm5VmHbEoBmr5XVpVIZOTFvf+kc0sIx7LADCEE7LzHsKbhrGr30lE/EghvkcatrPO/ZH1ZzpnlZO4mvOoeb/FXIHNpWjO9So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813158; c=relaxed/simple;
	bh=2MKsxG/33lgNjFWudXaM+bEUm4TNt1yD02kVLV/h4i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksOUmRN2RyeCatFR+2sAS9AFhluNa9yRfLgrvZIuoW5Cw0NKlvrOcKdnrzTJi1NbLIs3oBpmxgTDN6wpb2SFTnmaSfcr0k2UIGynWp5whUfxr7vLNysKlfombmTDumMdWWSmNH1G+I5igvMf4RHqCCUnKdK7ipudDvB2vkFbMO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqBskkn2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqBskkn2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E0FF1F000E9;
	Thu, 23 Jul 2026 13:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784813155;
	bh=FMDVx9Yp9psbYP3ubz408Mk+Aq8i1QCuyG86whSEvpE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VqBskkn28z3Q9b42AcCZT9urJ40UjkXpsm1L5S6fA8s84/dZE08nsggawMWg9Bz+g
	 o6bkL4Neq46yaErn0B2PzvtfjW3CxR5nyphM06MCmZZcZAy0dCtkCFLadwhL3KEnWd
	 53vsG/k1ACKCt9whyEBDTJO4a7RDHC0B8gLs1Bf03kha+tol9N6UNXEQesu65/aOvQ
	 hX8c9icmy7K8BkHOe95spPULgj3xFTg/73IuCdD9LeemBfdmb3/md8OXbjwIhWMYu7
	 6NKp3dWXbarmkOxUVYErGrci/IXNvYtXPr3AknmOpmOHtllNP79TC+WHQLS1LMtqsL
	 eW4R323BtSOJg==
Message-ID: <a0f20c9c-bb12-48e7-bca8-fc208309bf1f@kernel.org>
Date: Thu, 23 Jul 2026 15:25:51 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] rust: treewide: replace `__pinned_init` with `__init`
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260722-merge-init-v1-0-d4594de76538@garyguo.net>
 <20260722-merge-init-v1-3-d4594de76538@garyguo.net>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260722-merge-init-v1-3-d4594de76538@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/22/26 8:50 PM, Gary Guo wrote:
>  rust/kernel/alloc/kbox.rs      |  6 +++---
>  rust/kernel/drm/device.rs      |  2 +-
>  rust/kernel/drm/gpuvm/va.rs    |  2 +-
>  rust/kernel/drm/gpuvm/vm_bo.rs |  2 +-

Acked-by: Danilo Krummrich <dakr@kernel.org>
