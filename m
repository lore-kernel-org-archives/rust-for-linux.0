Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415DF149C6F;
	Wed, 18 Mar 2026 00:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773793327; cv=none; b=mDjpCNLH5u4cS7DZRatL8lrW5UFLjeIe/miWc5ccmrq5F1RI+kf1GNvSMwYfS4bvn8makdO9ypsV3OQa4BEMAmdr/UDz7c1UotLeI4K1Jmwf9fmmeAhsqIxYjaM/JA9fTx3FbssvdkLQ0/FXHYqb+TopaHZ5zqAc8bPaCTOZJ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773793327; c=relaxed/simple;
	bh=DmKD/WT69UrymcP6Vl+w5SAy8M9ZJO0iImpY2Aee/3A=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=uerLIp4+QxltdEFdif57h2d1E8aVn98f+PZqGIQH++SUHyk/gClPBWTWYylz/ARV4Rg3yr3hr8AfgcF7zU3/itPSs7YYA6Psm9Jc8UBf20/kRM1JLSwRbWKXSw43W2cSrcOnR0bYYVtLk7kv56pP3JNO+oZLzzUuexZXSMnhO78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cs0MtpuG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cs0MtpuG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE97C4CEF7;
	Wed, 18 Mar 2026 00:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773793326;
	bh=DmKD/WT69UrymcP6Vl+w5SAy8M9ZJO0iImpY2Aee/3A=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=cs0MtpuGjjvvTXGVAvD6Efe01KMC3nm4Q4Qh2FvqPwGa2+FSRInueum8Ouywu9sUY
	 P0dk6nsf4m07Vp1gMf08SEACiN2Z80jWAP5GpyzBr5bNKtkIJMuYJ42bmUyPPEiNYB
	 FeXjTs2fw8BlCMaE7j9ZDe4SPV+65NYmddtGmBRSAuOwJC22ue2iM0RWvvRGqV9Z7K
	 ys/Mr39+g7NCkbOROR+UT+TeplWILQZpXBtmaPqW15urTDJYk8NSNlyYGBxmUcuA/e
	 cQVoDZNlNEj0vAR/iwmb1nAfbaHUzgTvbmXEv0OhZ6/Zt8SDXFzwRxXpbU9EoRdXwp
	 M13RxpCgv1Icg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 01:21:59 +0100
Message-Id: <DH5H95R3ZKJK.3SMHG8B4JP051@kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7 18/31] gpu: nova-core: add MCTP/NVDM protocol types
 for firmware communication
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-19-jhubbard@nvidia.com>
 <b6d58cbe-a375-40f4-ae70-a3d7344160e5@nvidia.com>
In-Reply-To: <b6d58cbe-a375-40f4-ae70-a3d7344160e5@nvidia.com>

On Wed Mar 18, 2026 at 1:01 AM CET, John Hubbard wrote:
> On 3/17/26 3:53 PM, John Hubbard wrote:
> ...
>> +bitfield! {
>> +    pub(crate) struct MctpHeader(u32), "MCTP transport header for NVIDI=
A firmware messages." {
>> +        31:31 som as bool, "Start-of-message bit.";
>> +        30:30 eom as bool, "End-of-message bit.";
>> +        29:28 seq as u8, "Packet sequence number.";
>> +        23:16 seid as u8, "Source endpoint ID.";
>
> hmmm, I seem to remember my very slightly younger self insisting
> that fields be listed from lowest to highest bits. And now I've
> violated that in both headers in this patch. arghh

My now slightly older self still thinks that what you have above is actuall=
y the
way to go. So, I think your current self intuitively did the right thing. :=
P

It should be either

	31:16
	15:0

or it should be

	0:15
	16:31

with a strong preference for the former, but this

	15:0
	31:16

still looks pretty odd to me.
