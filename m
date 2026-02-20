Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2595242D97;
	Fri, 20 Feb 2026 15:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771602816; cv=none; b=qsWjKR1MxDC6so7RvBTf1flw+8QXiw8QHYlHNWv2GheXMSkO+EmKEefIKxCUQQ3D+w+yRnZ+TL9rblFLSXlL8gbPJMSmyT6il0RBHZdBMVtz76D56XyNf5SS6oQzLDBxohJjTf45NeuVCFcbFoqHrZXqXH5AiNphMPkMBbTLS0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771602816; c=relaxed/simple;
	bh=BRSZoWiOrrbUjMNKZzInHFPXJxAj9NQkpI+8zNvNgzo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Q1OVYiRaFJCRIU1uLuH5mbKqiyV5yK6Zd3FsRGMVZ/9BQvggC+OSiMv8Twq3/W1SpGnJwWpPjjbA7tyZvNXVgaxBhhOuFskkIhJ9/GHdqP4na0VXUsNg5GtN+XqKZEP4EOvapH0COF1NjYTCdgwozp0AidFUShPdkJpp1O1BsAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5V9Z3ma; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5V9Z3ma"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6ACFC116C6;
	Fri, 20 Feb 2026 15:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771602815;
	bh=BRSZoWiOrrbUjMNKZzInHFPXJxAj9NQkpI+8zNvNgzo=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=Z5V9Z3maLOYLu+osNnMhsHhEkfCfGptIAu6jzHiuxf4tjkcppBE7O2tBsjdPZspfH
	 CMj+ycuyoRS/eI0yXv6Xx+qrsVTv001W1qojKUR+HK/zgJatY9foNUQx5BRE9Tr04p
	 1VXEgBNe4c3P9md8C/vcPNPkUEvuVtzfTUTHty7YHCMM+8AbM5NdaK8XPzY3u4RkRY
	 VFye9bORMTO92a/n/WSXNycv4gd0OHsk79ZBaakNkmjD7D12kC65SCL3XH44b2kfkV
	 QJKB6irhnFdx05wdbi/nlCaGrWUnSRRg86t5As8cfDTHXOngahqm64PdvSGuVsmsRm
	 hfPDfxM6HZCmg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 16:53:30 +0100
Message-Id: <DGJWS7GBIQ2H.3VSOWO6T8Y482@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, <linux-kernel@vger.kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Dave Airlie" <airlied@redhat.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGJN74VW6HS2.29CXZ59K9M220@nvidia.com>
 <ece7e6c1-f91c-4e7f-801f-28b228bddf3a@nvidia.com>
In-Reply-To: <ece7e6c1-f91c-4e7f-801f-28b228bddf3a@nvidia.com>

On Fri Feb 20, 2026 at 3:54 PM CET, Joel Fernandes wrote:
>
>
> On 2/20/2026 3:22 AM, Eliot Courtney wrote:
>> On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
>>> +__rust_helper u64 rust_helper_gpu_buddy_block_size(struct gpu_buddy *m=
m,
>>> +						   struct gpu_buddy_block *block)
>>> +{
>>> +	return gpu_buddy_block_size(mm, block);
>>> +}
>>> +
>>=20
>> Will `rust_helper_gpu_buddy_block_size` be used in the future? It
>> doesn't appear to be used in buddy.rs.
>
> I think it is worth keeping because it is a pretty basic API the underlyi=
ng
> infrastructure. Finding the size of a block can be important in the futur=
e
> IMO. It is only few lines, no?

The helper should be added with the code using it.
