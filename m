Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6072530DD10
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 12:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755518854; cv=none; b=cP3WgY4y+iyCrIBoOLweOOyt5L0sRguIwz2xpHJ8sn2w4rHsCqhT4gpuVi5o44CAyMCvP3hImQlOE8nnm624tXs3Q3xp2pnu7RCjoR2RPBWTY9Tek/dIJIwMSzkMfVHqSTYiXxsgpVOPgn5NKf4zVjDmxlvwYftAMD1GhLuPuq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755518854; c=relaxed/simple;
	bh=pPJ6q5H29dCL0FRDcj7NvtkUozSrMvbFa0wm+VzNerY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RwdFl3rsONH5Qtkaxeztl42focx2qJrzv+v0jsCfCn2v4btKatCmiScPaxVbWmGZQmZFkf2nBAco3zWHihF5zjjfhDyz2w1+nHX0P0EbySq5U1x4HMNBn/huE5VlC/H4AHfxmykhzdAbl/vIGJkYqn+lN5/lVCUGmIFVP5mRXXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOMqt8w/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOMqt8w/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84ABC4CEEB;
	Mon, 18 Aug 2025 12:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755518853;
	bh=pPJ6q5H29dCL0FRDcj7NvtkUozSrMvbFa0wm+VzNerY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GOMqt8w/rTJk73gqr0pzsfZICq8vzQnPsffhlxw73pebMEtx1nBrQjs8Wi8X6pJ/2
	 /D7gGqaoEWCV3eFuVPOLnVqnL9fsphs10DtYLEX74Ox+3ZLgL9dtQM5bAYCcUQubyR
	 msm4MnmKbldGyzmBQ7izfiff6RuOZFjJtSruszCKtpM8OxbsoZFCqb+m00LPmIoFSk
	 9xYoGkHkKMSo1zBfj13eeqqDTQqnnaze41ODi+Z5+GHPao0VFmCtxkeqs78jCblgcw
	 FXzwkCUq+MLbHxypX71ilK1wvzbhDzrZ19Yk2JvvblsjU7jK4RiPa5Fdu7A2N4DUpR
	 RQhwWbDAU+Mlg==
Message-ID: <4f97ce63-9e96-43ab-b3e1-20960bc2027e@kernel.org>
Date: Mon, 18 Aug 2025 14:07:28 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] rust: page: define trait AsPageIter
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com,
 urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, abdiel.janulgue@gmail.com, rust-for-linux@vger.kernel.org
References: <20250814093427.19629-1-dakr@kernel.org>
 <20250814093427.19629-5-dakr@kernel.org>
 <DC5JGQHBJ37U.3MFJ8XDQ3TVCN@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DC5JGQHBJ37U.3MFJ8XDQ3TVCN@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/18/25 2:06 PM, Alexandre Courbot wrote:
> On Thu Aug 14, 2025 at 6:33 PM JST, Danilo Krummrich wrote:
>> +/// Trait to be implemented by types, which provide an [`Iterator`] implementation of
>> +/// [`BorrowedPage`] items, such as [`VmallocPageIter`](kernel::alloc::allocator::VmallocPageIter).
>> +pub trait AsPageIter {
>> +    /// The [`Iterator`] type, e.g. [`VmallocPageIter`](kernel::alloc::allocator::VmallocPageIter).
>> +    type Iter<'a>: Iterator<Item = BorrowedPage<'a>>
>> +    where
>> +        Self: 'a;
>> +
>> +    /// Returns an [`Iterator`] of [`BorrowedPage`] items over all pages owned by `self`.
> 
> This is almost obvious, but maybe specify that the pages must be
> returned in ascending mapping order?

There is no requirement for AsPageIter that the pages need to be mapped in any
address space.
