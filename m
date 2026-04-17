Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BDB39BFE8
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 12:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429916; cv=none; b=TLR5VfKbzNlOaHcU0mOtHhvBLOaW5BTpvy2cmVr9wIN4lFZ6BmDVuKMh78pWowb7iRKjT4Uta9FaexUlAyRftopYvw7xU6z6oOiR7wUm6/NrogBR7FJsMLjVDvlAMAHl2jXsh2y2s4i9dkxhBENyB2ezubpjo3XPsLcGPVxLc+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429916; c=relaxed/simple;
	bh=ZvN0FuZ6lMVHGQ7odbPI1HGRkPCCQcJ1aJSZ1X0+Ct8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EmkeVKtpUMfIGD5PJUyTyRbKIkUl3DR7HbxW/L8xcuzgVz6yXvilQ8L/j39wFlGLoagxag0+ie6DXLJdaU3iUS9NxxzFaeuDUFVUmGWZ83ATq0/QRnT2wZXEAEl9qTnE0xfl2Z/qhMw7WnNm74uJcRxWIFkvVfhDqPj0W9QyTCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=whGWjVmw; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="whGWjVmw"
Message-ID: <6d10d3ba-8e0f-440f-9ef5-220b7bad67a1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776429903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FXXbWD5rA/oeQBIHJ+leDmhecsxq7TxiUCheP87Tc9M=;
	b=whGWjVmw1fsTxIxkA4IzwDX17B9Yj8gCGGqfbfcRxWvVbpVfafWXhojQqNx2vnuM79ifu1
	ZWDGOaKLWaJVdTMyZHxIbaQ63/B3k6qMIIAJ2kRpdTpiTgLslP6ZgSEMddAxohOkxWoy+6
	w2pGQB4ODkXrmrBsnrRFusfR7vuhkLk=
Date: Fri, 17 Apr 2026 20:44:50 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] rust: Add helper functions and constants for Tyr
 driver
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Tamir Duberstein <tamird@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
 <20260417074348.98280-1-work@onurozkan.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <20260417074348.98280-1-work@onurozkan.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 4/17/26 15:43, Onur Özkan wrote:
> On Fri, 17 Apr 2026 09:05:50 +0800
> Alvin Sun <alvin.sun@linux.dev> wrote:
>
>> This patchset provides helper functions and constants that will be used
>> by the Tyr driver's VM and BO related ioctl implementations.
>>
>> These patches add:
>> - SZ_4G constant for VA layout calculations
>> - A task_size() method to Mm for determining process VA space size
>> - Updated StoreError comments for alloc() usage
>> - Guard::find() helper for finding the first present entry in XArray
>>
>> This patchset depends on Onur's xa_alloc implementation [1].
>>
>> The complete patchset, including the Tyr driver ioctl implementations
>> can be found at [2].
>>
>> Link: https://lore.kernel.org/rust-for-linux/20251006163024.18473-1-work@onurozkan.dev/ [1]
>> Link: https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/64 [2]
>> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
>> ---
> FYI, there is v2 exist and I will probably need to send v3 to address some of
> the review notes. It's good that we have a use case for the series, I will share
> (probably during the next week) the v3 before sending it to make sure it works
> for you.

I didn't notice there was a v2 version. No rush - I'll wait for your v3
version!

Best regards,
Alvin

>
> Thanks,
> Onur
>
>> Alvin Sun (4):
>>        rust: sizes: add SZ_4G constant
>>        rust: mm: Add task_size() method to Mm
>>        rust: xarray: Update StoreError comments for alloc()
>>        rust: xarray: Add Guard::find() helper
>>
>>   rust/kernel/mm.rs     |  7 +++++++
>>   rust/kernel/sizes.rs  |  2 ++
>>   rust/kernel/xarray.rs | 28 +++++++++++++++++++++++++---
>>   3 files changed, 34 insertions(+), 3 deletions(-)
>> ---
>> base-commit: d1d81e9d1a4dd846aee9ae77ff9ecc2800d72148
>> change-id: 20260416-tyr-ioctls-deps-25805eedf332
>> prerequisite-message-id: <20251006163024.18473-1-work@onurozkan.dev>
>> prerequisite-patch-id: c472a9548969ac774d36fead73378961a0d0489c
>> prerequisite-patch-id: 63890b91e911cf96cb42308c056d639580ac0fa0
>> prerequisite-patch-id: 337eb93db35359c611abe9cba299e6ab0525a2b5
>>
>> Best regards,
>> -- 
>> Alvin Sun <alvin.sun@linux.dev>
>>
