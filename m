Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9370D32AACB
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 11:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776427036; cv=none; b=k9kj3xc/dTYzpdJJPDOKv7OR/aDJrZGcrA8QAm0CBId4+oW3sm2lk5bscfaKozpYm01qQl2xckDykjcUgBoJU7anpPkpO2iMOPJ7mOawxi9pZ8EDwYQjZ41qD33ybyg6D8/OGMy4O8MQ6HOFZMucPviMgMokhXFypsaFm1I2MUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776427036; c=relaxed/simple;
	bh=E1BhsGENQ89U1hlBHvwJt0Yfor7SOcgk8l0xYEVX7rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mW4eusSHwRJr4ffAi8Og1oQHAbinGRn3xxB5Wc3byrH2zIcbFdY8FkxbRgtDE7SQqzvlHveDVQvGGOFeXBTe0dPGjjnjv980BFXNoz8ggtc50c9d4th2gxPV59hQze3b56DFloYcyUQYCG4RkUIA4Sy8yqJqLRDMqi22o2qnXUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nGR66OsI; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nGR66OsI"
Message-ID: <cb3dd598-04f8-486c-ba6b-9965d93170a0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776427022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VocBKMQd24k2utfjrgbZaZRKOSSRYHwNHI+4XQHY0Cc=;
	b=nGR66OsIEtPjvlGMeDVhIadGArVE5v36orOS2xMsH1Y+xkcnaN6NELOR5DGOCNLWd/KEe+
	baQbnrRGWrVBFEurFGxgCMpMzVagO66B75ZU1/7W/v22C4lJnUXX9GmscKoXsVxV2kkoAL
	npIlDr8vfP6YU+9ujdyy8R118Q5F0eg=
Date: Fri, 17 Apr 2026 19:56:42 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] rust: sizes: add SZ_4G constant
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Tamir Duberstein <tamird@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
 <20260417-tyr-ioctls-deps-v1-1-41c6e9bb061c@linux.dev>
 <DHV3SQ191564.3FMK513OJUMKV@nvidia.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <DHV3SQ191564.3FMK513OJUMKV@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi Alexandre,

On 4/17/26 11:18, Alexandre Courbot wrote:
> Hi Alvin,
>
> On Fri Apr 17, 2026 at 10:05 AM JST, Alvin Sun wrote:
>> Add SZ_4G constant defined as SZ_2G * 2. This constant will be used by
>> the Tyr driver for calculating user and kernel VA layout.
>>
>> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
>> ---
>>   rust/kernel/sizes.rs | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/rust/kernel/sizes.rs b/rust/kernel/sizes.rs
>> index 661e680d93306..872f5bb181ecf 100644
>> --- a/rust/kernel/sizes.rs
>> +++ b/rust/kernel/sizes.rs
>> @@ -48,3 +48,5 @@
>>   pub const SZ_1G: usize = bindings::SZ_1G as usize;
>>   /// 0x80000000
>>   pub const SZ_2G: usize = bindings::SZ_2G as usize;
>> +/// 0x100000000
>> +pub const SZ_4G: usize = SZ_2G * 2;
> Note that the way size constants are defined has changed in `master` -
> you will probably want to update this patch accordingly.
I just noticed that my development baseline is based on the stable
repository.
>
> Also there is a `SZ_4G` define in `include/linux/sizes.h`; I am not sure
> why it is not in the bindings, but we should probably add it and get our
> value from that.
SZ_4G is a complex macro that internally uses the _AC macro, which bindgen
cannot handle by default. I found a similar issue that Miguel replied to in
October 2025 [1], where adding --clang-macro-fallback to bindgen can solve
this problem.

I tried adding this parameter to bindgen_parameters, but SZ_4G still
doesn't appear in bindings_generated.rs. However, when using
--clang-macro-fallback with just sizes.h alone, I can successfully generate
the bindings.
>
> Finally, maybe I missed something but the new value doesn't appear to be
> used by this series?
This patchset is a prerequisite for the Tyr ioctls patchset [2] that I'm
currently developing, which hasn't been submitted to the list yet.
[1]: 
https://lore.kernel.org/rust-for-linux/CANiq72m20pom+B9EmWO+91E8fjbMEob3JmvHRQ6UaXe_JmatfA@mail.gmail.com/
[2]: https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/64
