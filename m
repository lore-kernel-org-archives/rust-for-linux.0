Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942AB224B01
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 10:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908685; cv=none; b=T/H/kLzQNpEQcWIuc/XS4aXzasEflaZPobaAnV/d5JZYrN2iGCbG1qrfjKueLila+j/eeQXmknsHHEX1tZm6AtQ2vFzuN5rqUu3lne5Nr4VPghZRV/U/HAtI2X9lwe12ZPrwLhIeXFBtBgC5Bfw/ZpNwVKEAw92N6zO7R8a4CG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908685; c=relaxed/simple;
	bh=Si2eMKDg3KYvr+vf5RJUM3askzrPu4BYQrLgIqbuc+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PB80bhQgYIpnyuUIeXl41EGomaX+aOBSxxfLVg7dRQjfb0h0QK2c2W5vMamh9pYIb83XN8KLCAuhju2MaTN1/Uj0dc8nvqN/PI0kgyNNLX1v3qTV6x/znK6PttTEccSre4Gr7eWKPnF6VidjX05423w7DE+fo4JwK7EecNCPdUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8MXWPoK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8MXWPoK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFE9C4CEED;
	Mon, 11 Aug 2025 10:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754908685;
	bh=Si2eMKDg3KYvr+vf5RJUM3askzrPu4BYQrLgIqbuc+A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O8MXWPoKhNrBjNd8B9Ih37/W1KjqS8yZPm90t552h3T+L4vbQDzskIbnmgdXtzGlo
	 cgg7meXlr61FGqGBr3ibGkl9+iR/bHee7IhXqOKj66ofPNlfvKAnEXHi8mA5QmIqv4
	 WJWIXcBtP2kfVrqdLmT+1qKNbEHTHr7Kn9nV5ut+s+km9PoGZ3sfZ7lirM8mwAwGdW
	 EQT7Cfv8ddmqZ2FOw/h9bTsu+vtLvbrE4eZ8UJ0zYX6+ood1XbHiCOFY2JIBXIQj8y
	 E88H+GQPt9KEBW1GzGe84iuZZ1DXhNY8Lc1FfAoN/9Mb584XyaiPqVRDVNAdxAJVO5
	 44oTfN7Qlh59Q==
Message-ID: <aa82666a-42d2-4cb9-80fb-b54a10d83900@kernel.org>
Date: Mon, 11 Aug 2025 12:38:00 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] rust: page: define trait IntoPageIter
To: Alice Ryhl <aliceryhl@google.com>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com,
 urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, acourbot@nvidia.com,
 rust-for-linux@vger.kernel.org
References: <20250808181155.223504-1-dakr@kernel.org>
 <20250808181155.223504-5-dakr@kernel.org> <aJm1C7Pehrh8FIFa@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aJm1C7Pehrh8FIFa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/11/25 11:16 AM, Alice Ryhl wrote:
> On Fri, Aug 08, 2025 at 08:10:18PM +0200, Danilo Krummrich wrote:
>> The IntoPageIter trait provides a common interface for types that
>> provide a page iterator, such as VmallocPageIter.
>>
>> Subsequent patches will leverage this to let VBox and VVec provide a
>> VmallocPageIter though this trait.
>>
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>> ---
>>   rust/kernel/page.rs | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
>> index 631718a6ad7d..bfb5898ab4b5 100644
>> --- a/rust/kernel/page.rs
>> +++ b/rust/kernel/page.rs
>> @@ -103,6 +103,16 @@ fn deref(&self) -> &Self::Target {
>>       }
>>   }
>>   
>> +/// Trait to be implemented by types, which provide an [`Iterator`] implementation of
>> +/// [`BorrowedPage`] items, such as [`VmallocPageIter`](kernel::alloc::allocator::VmallocPageIter).
>> +pub trait IntoPageIter<'a> {
>> +    /// The [`Iterator`] type, e.g. [`VmallocPageIter`](kernel::alloc::allocator::VmallocPageIter).
>> +    type Iter: Iterator<Item = BorrowedPage<'a>>;
> 
> Oh, also, I would put the lifetime on Iter.
> 
> trait AsPageIter {
>      type Iter<'a>: Iterator<Item = BorrowedPage<'a>>;
>      fn page_iter(&mut self) -> Self::Iter<'_>;
> }
Makes sense, but I think it needs

+    type Iter<'a>: Iterator<Item = BorrowedPage<'a>>
+    where
+        Self: 'a;

then.
