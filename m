Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5751DEAD0
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Dec 2024 13:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735564712; cv=none; b=ebMiSy+KxcZWmXTtEGfs3MP+qD8YNd2K1w5yw+Slqb8P6wiSj0x6252oWYLpgQZeicZi73O7/ZgVpp2t0IaIj/Rh2QfO/F1312pqaQmaMaC7u+ovWIzIzWDV09yMnAvc06NbvI6xEzSSJ/rq4Krfr6WEdVK8Py9bCiWOc1OmeV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735564712; c=relaxed/simple;
	bh=mLlWGpGeue68Qm80pGot7+TfqNYcOP74naMbrEr3lDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkEQ25qF9fK7VToDPEMwL5pLSzWtjd+Wwm/W3fSq5Mh4K/tNEEP+q3iJxc1SQgsmvwYtUwZX0wnNdISWmxCub9HoIW1WiDgfOcRGOQ7/lFEbZ5hd0Fr13Y/NS+ywjNdNezDTFCPrK+Fncot4QpE/4oAB/zn2JIBdPLVY2KlanKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ryhl.io; spf=pass smtp.mailfrom=ryhl.io; dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b=YDt1DfDr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LaojXvpr; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ryhl.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ryhl.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b="YDt1DfDr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LaojXvpr"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 6C5E41380782;
	Mon, 30 Dec 2024 08:18:29 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 30 Dec 2024 08:18:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ryhl.io; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1735564709;
	 x=1735651109; bh=0wHT9HOW0L3moRtBIHXw+tW9PY8Z2GOiPhxZsVO3Aak=; b=
	YDt1DfDrM+SWb+CHAjLxNL+DhJ/jCeb1ZmwPECl0Klb2P1zjV5117yi/vk6U78h9
	AwVm6hhFqT5C2ImsawLloLcUjWB++msPALiNdUvxDxZw9F4VvpvAUznyZKiV2MT9
	FqvMsrgxHehXW2x/+SCZ8eQKjgCY1W16o3jOo9lIWNZ9+64Mz/1hkF6J9tpT1Za6
	r8wGD7U/qBoDhMi43ParWXaXeIh6Gs9HgZrm9CA3ovH4qsIFLxwHOaOHjEH04WX/
	4GlGwnwIXFP+wfaRINtkkGfNeCTP/4GYM5y+FWy5vfUpp5flY49De/q8ZVaUqlhp
	7ZIotnPtPPQ++kWZ/8aO3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1735564709; x=
	1735651109; bh=0wHT9HOW0L3moRtBIHXw+tW9PY8Z2GOiPhxZsVO3Aak=; b=L
	aojXvprOsCsSB8kDk7250bz6SQT7RptAanDSR9iEs2hoEX6kSIt4nS/1zjcdPCJQ
	Pi5I8oWTrlet2h9wDQIcQfmM8Ow1/6tA9kAT8Bq4NfAPsjkWP4ANZE+HhAzUV19d
	1CFP1bXxyUIQMKoOZI0jHgXPHxXvxJUWOUc80ZVXoihuVI7o7I5y7F/OvpbXTZLK
	jnwxj5qFI7CcpVUW+W2iS1W9Nr20F8clzoM1nRivMNONaqmc7PcUB+ZLByfZu+qN
	f7dk4kERG5palXxw2ToQHuy/7EZ1RYbBShhx3vGeOni5DC0R0L3dbC85nX90UPgf
	xbn9e0qM3WxosLtQYlkYQ==
X-ME-Sender: <xms:pZ1yZzX9DOfLoH6Qx3-wSdxEXEcz2Id2DNxL0xZKMOwfoFqiwDJZ5Q>
    <xme:pZ1yZ7mJ17amtsjo7NvArTXQbQcxSuxL6q9GH1_YhEKioJVPo-q0K6rrbvuYU6t8u
    eq5P4z5A_w_sIxZUw>
X-ME-Received: <xmr:pZ1yZ_Yxbtumriyly5rWf9e9zqXquTJJB5SqvrJJRrRjl-JLD5gEfupSN6YyjwOs9J8U5SGwOGZt2S-MimwpuLEWNxrBNNXCw7xZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddviedgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdej
    necuhfhrohhmpeetlhhitggvucfthihhlhcuoegrlhhitggvsehrhihhlhdrihhoqeenuc
    ggtffrrghtthgvrhhnpedtleefieduffffteffheduleekteeuheeugfdtjeefudejueeg
    gefffeefvdetleenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhrvggruggvrhdrrh
    gvrggunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    rghlihgtvgesrhihhhhlrdhiohdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgt
    phhtthhopehfvghlihhpvggrghhgghgvrhesghhmrghilhdrtghomhdprhgtphhtthhope
    hojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhr
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpd
    hrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghp
    thhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprg
    drhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhih
    hhhlsehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:pZ1yZ-W1eRbujjbZ7Dgl1LoS_N_vDasrCJnzwQJL-JOxrKiZ0MHvDA>
    <xmx:pZ1yZ9n0nWxY3Pg_qWf9XwNncgfK0IzJOCce3FgMja5X0Kh2iV4mTg>
    <xmx:pZ1yZ7fSLpCuu8ZCCbnhKDNekgShnkXXDcATLuobV3QW0TpKDmERwA>
    <xmx:pZ1yZ3GzkdpmyCUDIReyC57vIXNrGXujOAuP2hnzMCkSjc79_ndJvQ>
    <xmx:pZ1yZw9yRfh3QcjOYn8PV80ciqh5SJQsU6UMeBRo2AhVsuVPlgS-4wO5>
Feedback-ID: i56684263:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Dec 2024 08:18:27 -0500 (EST)
Message-ID: <7fee31c8-6319-44d5-b01c-7f5022054e10@ryhl.io>
Date: Mon, 30 Dec 2024 14:21:39 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: generalize userSliceReader to support any Vec
To: Boqun Feng <boqun.feng@gmail.com>, Filipe Xavier <felipeaggger@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 Filipe Xavier <felipe_life@live.com>
References: <20241222-gen-userslice-readall-alloc-v1-1-c57b7d4972f0@gmail.com>
 <Z2hKTPIBaJ2K9HJn@boqun-archlinux>
Content-Language: en-US, da
From: Alice Ryhl <alice@ryhl.io>
In-Reply-To: <Z2hKTPIBaJ2K9HJn@boqun-archlinux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/24 6:20 PM, Boqun Feng wrote:
> On Sun, Dec 22, 2024 at 01:37:02PM -0300, Filipe Xavier wrote:
>> The UserSliceReader::read_all function is currently restricted to use
>> only Vec with the kmalloc allocator.
>> However, there is no reason for this limitation.
>> This patch generalizes the function to accept any Vec regardless of the
>> allocator used.
>>
> 
> Interesting idea, however...
> 
>> Link: https://github.com/Rust-for-Linux/linux/issues/1136
>> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
>> ---
>>   rust/kernel/uaccess.rs | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
>> index cc044924867b89f6116c7f9ec216d8cea2b3f8d7..719b0a48ff5550acc19f2e607c0a09f818145def 100644
>> --- a/rust/kernel/uaccess.rs
>> +++ b/rust/kernel/uaccess.rs
>> @@ -5,7 +5,7 @@
>>   //! C header: [`include/linux/uaccess.h`](srctree/include/linux/uaccess.h)
>>   
>>   use crate::{
>> -    alloc::Flags,
>> +    alloc::{Allocator, Flags},
>>       bindings,
>>       error::Result,
>>       ffi::c_void,
>> @@ -127,7 +127,7 @@ pub fn new(ptr: UserPtr, length: usize) -> Self {
>>       /// Reads the entirety of the user slice, appending it to the end of the provided buffer.
>>       ///
>>       /// Fails with [`EFAULT`] if the read happens on a bad address.
>> -    pub fn read_all(self, buf: &mut KVec<u8>, flags: Flags) -> Result {
>> +    pub fn read_all<A: Allocator>(self, buf: &mut Vec<u8, A>, flags: Flags) -> Result {
>>           self.reader().read_all(buf, flags)
>>       }
>>   
>> @@ -281,7 +281,7 @@ pub fn read<T: FromBytes>(&mut self) -> Result<T> {
>>       /// Reads the entirety of the user slice, appending it to the end of the provided buffer.
>>       ///
>>       /// Fails with [`EFAULT`] if the read happens on a bad address.
>> -    pub fn read_all(mut self, buf: &mut KVec<u8>, flags: Flags) -> Result {
>> +    pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, flags: Flags) -> Result {
> 
> ... what if the copy hit a page fault because the target memory (e.g. a
> VVec) is not mapped? Would copy_from_user() handle this? Or would it
> return a different error code than `EFAULT`?
How could the memory not be mapped? A vector lets us obtain a &[u8] to 
the memory, which isn't valid if it's not mapped.

Alice
