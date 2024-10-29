Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A51A8BEA
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730204702; cv=none; b=aWkwt4br4q0sNWTxwO5yGarLuAwCWUe1gD5T4NskdI/qvVOzh5C+DVTytVagnGh+OvcfV8eWwkjs6UCJj6gztEbYfNIkNWA3ZXU/EUYWpf79tST8LQJmtw/GHVdTPJj2jTWtVz1QYX6My9Ce8tGTh4FHnGouIJofpImIKg7LN7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730204702; c=relaxed/simple;
	bh=9HhgZheDk6u39hAfD9zZtcp7zcAZUmyFSYncubKvQao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HoHLhUz6fGZ+Tms4Ov09/Cwq64lRuXHU9MtZ6klCulJud31BxdsKFpjNdvgwnM06soGvWQ4cAnj+3vTsyJQlYIakm9XwzpFc0gHAX7pYDfZzi7wPr+1bN2Lk1NFaDmIAas+1Zgad8o/pHupekocqc64UFrt+C/XDeyycHa++xKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gR3oYj1W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gR3oYj1W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F89AC4CECD;
	Tue, 29 Oct 2024 12:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730204701;
	bh=9HhgZheDk6u39hAfD9zZtcp7zcAZUmyFSYncubKvQao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gR3oYj1Wj1znexSzDUDsFu8ofDOm3JJGy3V5k32oQ9shSDBYYbkcj78KHB1Qc0+nt
	 CyDTAO3PZ5LS3RpHf/5Yps864qI7l8SY8qxHxHqV5nHXVfTUtNGQM8LdmZ5wNbE0Li
	 WZssqtGesSbHuotlCn2r9opJ1MUnIsbz7mUHNGP44bp9lvWq1a8PQCcSAOuLORsaJ1
	 VCKc4uOjFRK7SQBwojzHJ9b9eVi3mFjjTaM37+h7ExFlIYaze5aZ2b7nYus0qV2EZJ
	 Q0J9yI4ZCVDL5GDxpu9uFPIIajYo7twKQaTrOWgJOEkrUJUs26xiouLqTBbpN64OR1
	 7MSTogiZbGa0Q==
Message-ID: <a335869c-6bc4-49c1-b6a8-1c4ca4e98b20@kernel.org>
Date: Tue, 29 Oct 2024 13:24:57 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: Implement Display for Box
To: JCKeep <2407018371@qq.com>, Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org
References: <tencent_F71CE9D125A8C6191D8CF95B3A4F3BB2F506@qq.com>
 <CAH5fLggUUG5dCTjqM0oMpLff1xdGRFxdbkL=gpEaRfkq1fZgng@mail.gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <CAH5fLggUUG5dCTjqM0oMpLff1xdGRFxdbkL=gpEaRfkq1fZgng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/29/24 9:44 AM, Alice Ryhl wrote:
> On Tue, Oct 29, 2024 at 1:55 AM JCKeep <2407018371@qq.com> wrote:
>>
>> Currently `impl Display` is missing for `Box<T, A>`, as a result,
>> things like using `Box<..>` directly as an operand in `pr_info!()`
>> are impossible, which is less ergonomic compared to `Box` in Rust
>> std.
>>
>> Therefore add `impl Display` for `Box`.
>>
>> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
>> Link: https://github.com/Rust-for-Linux/linux/issues/1126
>> Signed-off-by: Guangbo Cui <2407018371@qq.com>
>> ---
>> Changes in v2:
>> - Add missing tag: Suggested-by.
>> - Update the patch title and the changelogs.
>> - Link to v1: https://lore.kernel.org/rust-for-linux/tencent_CA5A5D6268F0D1419BAFA6AFB4EB5A37920A@qq.com
>>
>>   rust/kernel/alloc/kbox.rs | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
>> index d69c32496..5f4765800 100644
>> --- a/rust/kernel/alloc/kbox.rs
>> +++ b/rust/kernel/alloc/kbox.rs
>> @@ -427,6 +427,16 @@ fn deref_mut(&mut self) -> &mut T {
>>       }
>>   }
>>
>> +impl<T, A> fmt::Display for Box<T, A>
>> +where
>> +    T: ?Sized + fmt::Display,
>> +    A: Allocator,
>> +{
>> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>> +        fmt::Display::fmt(&**self, f)
> 
> I had probably written this as:
> <T as fmt::Display>::fmt(&**self, f)

We could also write

`fmt::Display::fmt(self.deref(), f)`

to make it more obvious.

Either way, I'd like to keep it consistent with the `Debug` implementation.

Hence, please keep it as it is, or change it for `Debug` as well (in a separate
patch).

- Danilo

> 
> This way it's more obvious that you don't get infinite recursion from
> having Box::fmt call itself infinitely.
> 
> Alice
> 

