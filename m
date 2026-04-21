Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED72288C08
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 15:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776784055; cv=none; b=UJsO2ypgBxlHeVU/ht12IFVZ22TrRRA7Lo6fzO0aHlpWKnv3SGvpYUimh3zXBuv7R7z3dB5GtNHckuHaUxD3ZMXLFRCydh5CgGvRtAOZb0aeLQStFSf5w6UWGSpkmQWozhSl7Gtd3kjuhI1gYfFn0rZsyiHQZCP4NhEvCQD5JjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776784055; c=relaxed/simple;
	bh=n1Jzq2Ukejrv45aqJEzm0Hq9ouhoDvDL7iyxAvNwyok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZcN/P81LBsTvGxx4pd5QfjXxJ2tWn+dzoPESmFhfL/uF+3wol06p9/dUKjV93o2HYVpxz+/D3K3ZNEzA94FUg692fc4zVM4GSU+rNFj3KSmxeVar+um51BpeYn+GUtagDzSWdw/Lam9S9bm/OwBmPoGr2OURaY5jlAY+j4/O+k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QE89DUrP; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QE89DUrP"
Message-ID: <d2eb14ba-8229-4a41-b3ec-3b618a60b396@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776784041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wvD5z3d9+wA7tb/nW8saysrfgp0G4rLi1yg3WlABLYo=;
	b=QE89DUrPH1rS/mJokbAqm405th9d8TYKa1dLrF8IeeactyP3YmftMDTzTWrYObzGu2dBik
	RfGaRbfxglCRr/78WAbOgnrHM/BeX25AFAXBY2b5FkdPhwaGTzwbehqgVwHkIVjztyCLhc
	GE9AJw63wgunPZLtNjA+ZGkkyGNKGac=
Date: Tue, 21 Apr 2026 23:06:35 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] rust: sizes: add SZ_4G constant
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Tamir Duberstein <tamird@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
 <20260417-tyr-ioctls-deps-v1-1-41c6e9bb061c@linux.dev>
 <DHY2X44G62PD.3A7IMZ2FAWXLG@garyguo.net>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <DHY2X44G62PD.3A7IMZ2FAWXLG@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 4/20/26 23:15, Gary Guo wrote:
> On Fri Apr 17, 2026 at 2:05 AM BST, Alvin Sun wrote:
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
> How is this supposed to work with 32-bit arch?

Thank you for pointing out these issues! I didn't properly consider
word size differences across architectures and wasn't sensitive enough
to using `usize` appropriately.

I'll fix both issues in the next version of the patchset.

Best regards,
Alvin Sun

>
> Best,
> Gary
