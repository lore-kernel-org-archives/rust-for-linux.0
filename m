Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48163326D43
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 12:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519522; cv=none; b=tpBj3lfQqDi34ISNQRnB4l2qcV+YlkIEGDfJ+/zoe5gwIm8E3NoVsG5JSR7ohza/Yvt4yNwyoDGaHGEpTN3Ofg3Uj8osRx/Qf0/aXWOZE6iwt19ZaJFiaqLKCDCOGiazw5P+m5Mohn4y0RBALa1+fbPpy+1wgWu5EoGM12i1nFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519522; c=relaxed/simple;
	bh=ASFLcmiJk7xJ9bP+3ilUkY+IZE/yDU1+lpovQA/Jb5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/lhLTSOWVEHdyAuc5kKLQjJxD93Vw2ak2dbAUyOSTewpO7tuVn4yRT2RriwbxrRB4WT2ZcrTVNVxz6EQP8YoktWNbLDteNCTIHRpDFo6tb321VrMOsiRWCo8/8+dg10SdFIAW3qu0heMV9sF90C+xsVvdwuj9GuhmGpTwOEifw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODPymvq5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODPymvq5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E887C4CEEB;
	Mon, 18 Aug 2025 12:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755519521;
	bh=ASFLcmiJk7xJ9bP+3ilUkY+IZE/yDU1+lpovQA/Jb5g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ODPymvq5w8C2MzaHXIN7CY1qjGIQVbhXPmmW8udvx019v8I52FeuGQ10B5kWYjW12
	 M4b63gEpWIolzSN2o7rzUXrCGjrO9xfw5VuHU/3kfh3r0+26INlvUkiUHcvRMrNwBL
	 rgcQKRf+b+PmQXTnuAsrbx1V5H2L82zbytUSCnKVpa70hkl3dS5cIGtP+Z61GvHvY5
	 x/0AoIixWnWlYCY85bCwRVE5f8+Zc6Iow/atqpRp21Da9Qp4qiU59IVMjfr5cuwk6j
	 pHuycXTsB2UPVhTMiLGT9AnBK54qqagUF+A9t7k0N75eyp6vbvxDbM+Ul7EvnqJx0b
	 Blf9ig4q19/ng==
Message-ID: <958ef505-8713-4f88-9f24-5971ce8a08ce@kernel.org>
Date: Mon, 18 Aug 2025 14:18:36 +0200
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
 <4f97ce63-9e96-43ab-b3e1-20960bc2027e@kernel.org>
 <DC5JNG29SP9H.173LYQAFGZRWK@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DC5JNG29SP9H.173LYQAFGZRWK@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/18/25 2:14 PM, Alexandre Courbot wrote:
> On Mon Aug 18, 2025 at 9:07 PM JST, Danilo Krummrich wrote:
>> On 8/18/25 2:06 PM, Alexandre Courbot wrote:
>>> On Thu Aug 14, 2025 at 6:33 PM JST, Danilo Krummrich wrote:
>>>> +/// Trait to be implemented by types, which provide an [`Iterator`] implementation of
>>>> +/// [`BorrowedPage`] items, such as [`VmallocPageIter`](kernel::alloc::allocator::VmallocPageIter).
>>>> +pub trait AsPageIter {
>>>> +    /// The [`Iterator`] type, e.g. [`VmallocPageIter`](kernel::alloc::allocator::VmallocPageIter).
>>>> +    type Iter<'a>: Iterator<Item = BorrowedPage<'a>>
>>>> +    where
>>>> +        Self: 'a;
>>>> +
>>>> +    /// Returns an [`Iterator`] of [`BorrowedPage`] items over all pages owned by `self`.
>>>
>>> This is almost obvious, but maybe specify that the pages must be
>>> returned in ascending mapping order?
>>
>> There is no requirement for AsPageIter that the pages need to be mapped in any
>> address space.
> 
> Yet, isn't the order of iteration important even if we don't intent to
> map the pages?

Not as far as the AsPageIter trait is concerned, any additional guarantees are
on AsPageIter::Iter.

If we find a specific classes of guarantees we want to provide, we should
implement additional traits on specific AsPageIter::Iter types.

This reminds me that I forgot to mention this in the context of why SGTable
wants VmallocPageIter for now.
