Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED3D3054EB
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 06:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774591653; cv=none; b=Y3Z9VCBxXV6npyYuGfDX19XiWwWoqVknlFK1YGeH+HMkUehdQGvmJDqaawvtMZX5l3enB1e4GmcVLa6acWsV9t2o69EmySUcG/K4HhNw9MO7u/QVy58oLuzuxSGHP+9YyCReiDygPlvCzrMPDEgK2rcdecOFtMYoi9uUeyn1roE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774591653; c=relaxed/simple;
	bh=SdKGy2lW/g1dxnptadwybyuyDfn4DzUmw1ODcr04VlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k252VMT0T1dDoWddTUKHON4T8fzig3ImfmxvrtAzQ2sJeyBHpHXRL6AE+FOhqUia0Vhf9k52U4wboLIvNfVQLapqj2rXgI7wEbg90A678iUXJFp9RDTtmAh0931uL4ItKXFj/VRaqTY6LYZwRvlxOrQGe0lGltJpboZxYvntKqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jy3TCAvR; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jy3TCAvR"
Message-ID: <921fd8fa-48ba-47ca-9330-fccf7c76a80a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774591649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b3+yaBRGkX6r/5cF5q0bElvYA39FhyEYLEEUsNEigcg=;
	b=jy3TCAvRRL3jqI+MJBY4m/Z99lAC38crvqqZ7csFR3BcY+PQtpQejgTcAwQYWSmbVTkRQX
	EPMGS4chh0gZeW8snCFCwVfJv2vt6TB7honli5omXsB29bxWlGNy/Z8tfVIUaL0nUyCkvL
	HJ9/Op3oEKAkkeddBE9fXAOFMdt2oYc=
Date: Fri, 27 Mar 2026 14:07:06 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 03/13] rust: sync: set_once: Rename InitError variants to
 fix clippy warning
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260326-b4-tyr-debugfs-v1-0-074badd18716@linux.dev>
 <20260326-b4-tyr-debugfs-v1-3-074badd18716@linux.dev>
 <DHCSILUEKVYC.3DNKLNI6RBENX@garyguo.net>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <DHCSILUEKVYC.3DNKLNI6RBENX@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 3/26/26 22:40, Gary Guo wrote:
> On Thu Mar 26, 2026 at 6:52 AM GMT, Alvin Sun wrote:
>> Fixes clippy warning:
>> warning: all variants have the same postfix: `Init`
>>    --> rust/kernel/sync/set_once.rs:68:1
> I am not sure that this makes the code look nicer :/
>
> AlreadyInit is very clear on what's wrong, which `InitError::Already` is weird.
>
> Perhaps just allow this warning.

Got it, that makes more sense. I was actually a bit confused by this clippy
warning when I first saw it too, wasn't sure whether to just follow it 
or not.
Now I know what to do - I'll drop this patch and allow the warning directly.

Best regards,
Alvin

>
> Best,
> Gary
>
>> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
>> ---
>>   rust/kernel/sync/set_once.rs | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
>> index db9c5423fade3..3af5538aae1d4 100644
>> --- a/rust/kernel/sync/set_once.rs
>> +++ b/rust/kernel/sync/set_once.rs
>> @@ -67,17 +67,17 @@ fn default() -> Self {
>>   #[derive(Debug)]
>>   pub enum InitError<E> {
>>       /// The `Once` has already been initialized.
>> -    AlreadyInit,
>> +    Already,
>>       /// The `Once` is being raced to initialize by another thread.
>> -    RacedInit,
>> +    Raced,
>>       /// Error occurs during initialization.
>> -    DuringInit(E),
>> +    Inner(E),
>>   }
>>   
>>   impl<E> From<E> for InitError<E> {
>>       #[inline]
>>       fn from(err: E) -> Self {
>> -        InitError::DuringInit(err)
>> +        InitError::Inner(err)
>>       }
>>   }
>>   
>> @@ -85,9 +85,9 @@ impl<E: Into<Error>> From<InitError<E>> for Error {
>>       #[inline]
>>       fn from(this: InitError<E>) -> Self {
>>           match this {
>> -            InitError::AlreadyInit => EEXIST,
>> -            InitError::RacedInit => EBUSY,
>> -            InitError::DuringInit(e) => e.into(),
>> +            InitError::Already => EEXIST,
>> +            InitError::Raced => EBUSY,
>> +            InitError::Inner(e) => e.into(),
>>           }
>>       }
>>   }
>> @@ -155,8 +155,8 @@ pub fn init<E>(&self, init: impl Init<T, E>) -> Result<&T, InitError<E>> {
>>                       }
>>                   }
>>               }
>> -            Err(1) => Err(InitError::RacedInit),
>> -            Err(_) => Err(InitError::AlreadyInit),
>> +            Err(1) => Err(InitError::Raced),
>> +            Err(_) => Err(InitError::Already),
>>           }
>>       }
>>   
