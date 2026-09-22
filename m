Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3639F55C1B5;
	Tue, 22 Sep 2026 15:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090861; cv=none; b=EOkDgsjq1+ynt4TXShF0HdzWsbmZM9/0ERXe9o1Cibt4gzPOkDt3gykNLrQDgNXwrk2ZMpDMovdvCJzoayETPDXM3rKP5Dq82+uYBsZdJB9OI43arVdsmiD82IL2darHjxSqG74kSU+MU8TRDuTU2k6iObaKd+PUUNXKc/Z4se4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090861; c=relaxed/simple;
	bh=ed/J0wxXUIqzdHhF5vCCqhoLUrEJ1cSfwwOkVLGZUnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y27bLGLHhejhqmtiMaNRn3AvGELqDlHDdju/r1k89CyUFs4bOXP7wWACdGSUp7jE6E0LTWq6b2R3a3f9gcbwsCz3bxOqiReM4KRFX8xNy3jSflaULLYkZpBx6xydfOsvI0TzMinersiqhhH6wXVqLZnbHD9nGj4iSv699OXgYys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 46B331EAC6D; Tue, 22 Sep 2026 23:27:30 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 80A811EAC5D;
	Tue, 22 Sep 2026 23:27:25 +0800 (AWST)
Message-ID: <d00d6512-ec95-4337-ad62-a515b507862b@davidgow.net>
Date: Tue, 22 Sep 2026 23:27:23 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] rust: kunit: #[should_panic] and same test name
 with different #[cfg(...)] support
To: Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Nicol=C3=A1s_Antinori?=
 <nico.antinori.7@gmail.com>, Alice Ryhl <aliceryhl@google.com>,
 Burak Emir <burak.emir@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Miguel Ojeda <ojeda@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun@kernel.org>, Brigham Campbell <me@brighamcampbell.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <cover.1789500084.git.nico.antinori.7@gmail.com>
 <d20cc2b2-afeb-432c-924b-55ad00d980fe@davidgow.net>
 <DLLVV64UIC5E.10C9AB66BOEXV@garyguo.net>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <DLLVV64UIC5E.10C9AB66BOEXV@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 22/09/2026 à 21:35, Gary Guo a écrit :
> On Tue Sep 22, 2026 at 8:56 AM BST, David Gow wrote:
>> Le 16/09/2026 à 03:33, Nicolás Antinori a écrit :
>>> - Is it ok to 'stringify' the configuration so it can be distinguished
>>>     in the report? Would you prefer something like `_case_1` `_case_2` ..
>>>     instead?
> 
> I also don't like the stringifcation of cfgs.
> 
>>
>> I don't _like_ this: my preference would be for us to keep the same
>> name, and just not emit a test_case for anything which should be
>> compiled out with cfg. Unfortunately, implementing that is a bit harder
>> than would be ideal: we need a way of evaluating the cfg() arguments in
>> a proc macro, I think. (Ultimately, because otherwise there's no way of
>> statically determining the length of the TEST_CASES array?)
> 
> This is possible with a trick. In pin-init we have a similar need, so what I do
> is for
> 
>      #[macro]
>      struct Foo {
>          #[cfg(a)]
>          bar: u32,
>      }
> 
> to be expanded to
> 
>      #[cfg(a)]
>      #[macro]
>      struct Foo {
>          bar: u32
>      }
> 
>      #[cfg(not(a))]
>      #[macro]
>      struct Foo {
>      }
> 
> However, for kunit I don't think that's needed. Deduplicating the names
> should be sufficient?
> 
The problem with (at least my naive implementation of) duplication is 
that -- while it works great for switching between implementations -- it 
doesn't handle the case where _no_ implementation is active.

(The current implementation just compiles to a skipped test if the 
#[cfg(...)] isn't active, which sidesteps the problem until we have 
multiple implementations...)

Even the expansion above could be problematic, as we really are trying 
to add entries to a static array, so I don't know what we could put in 
the not(a) case (particularly since there'd be potentially lots of them).

Maybe the trick is to generate the array size by using a big series of 
something like:
static mut TEST_CASES: [...,
	#[cfg(a)] 1
	#[cfg(not(a))]0
	+
	#[cfg(b)] 1
	#[cfg(not(b))]0
	+
	…] = {
	#[cfg(a)] case1,
	#[cfg(b)] case1,
	…
	}
}

Then, as long as there's only one or zero active configurations, the 
array size should match, and any duplicates will be caught by having 
multiple definitions of case1.

I assume the compiler would be able to reduce that down to a 
compile-time integer, even if it is extremely ugly...

-- David
