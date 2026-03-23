Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0372D2DECBF
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 18:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774291393; cv=none; b=dpq+gw435iZYX1SrByw5NDOLUSrWJr/OrvPeK+C1p9NPMzZ4E+pGzIKK1ZUu6FhD8iFh0tG3NlxxDVXzjSfzqi2mFQs8NnsqB4oH4LPWUINcto1zTjjjVprwWLVf/phKM//VeEEh1GMqwjVgI84PWqj+wj6SoqXHlGAsJVGbX1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774291393; c=relaxed/simple;
	bh=PNTr9qzB/yJg/zD8UVCBYqDyvJdpct7ih8dyaDHt1cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwSVXX1eJ+quIrmWmqegRpVPVzeN51Ec6VAQ6vxmKcGONXEo2VNiA49MERDXS92fvGerNMif99PvOGlBq6ifLJRzy338TcD2tZ0jnCBQIcfQATw9enHsEw3kBpx4seexVRMdqnUm2zIqSeZRllz0LsxSwr1TdFd89t8lD5AnFqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gORLrDKL; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gORLrDKL"
Message-ID: <9eb4f574-26f3-41d6-897d-443dfa61f254@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774291380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UtLZMjwr7aYX1haziC0yN8TfuqFtdWirjJLK+Iba/WI=;
	b=gORLrDKLhorJxmeZ/sTv+uFN5DQD+ICpZSwls4oAAjQg0B0SOLza3bpWspTY7Mi80ZnPCh
	wxrJpLXeOydTTZ7DuLq1x3EHox0YFSFwlO2YqIvZANTzOxkYGwAXo26es+f+/U/v58Mbp/
	OwhP1g/oiHS48Ngihw1HdjTm5KHFdJE=
Date: Mon, 23 Mar 2026 18:42:57 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: Update Rust I2C Subsystem entries
To: Gary Guo <gary@garyguo.net>, igor.korotin.linux@gmail.com,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260323-update-rust-i2c-maintainers-v1-1-0744ce44f846@gmail.com>
 <DHAB14FI33XH.3NSA1457TCHL1@garyguo.net>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Igor Korotin <igor.korotin@linux.dev>
In-Reply-To: <DHAB14FI33XH.3NSA1457TCHL1@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 3/23/2026 4:32 PM, Gary Guo wrote:
> On Mon Mar 23, 2026 at 4:06 PM GMT, Igor Korotin via B4 Relay wrote:
>> From: Igor Korotin <igor.korotin.linux@gmail.com>
>>
>> - Change Igor Korotin's e-mail address
> 
> You probably want to update mailmap too?
> 
> Best,
> Gary

Didn't know about that file. Will add a line there as well.
Thanks for pointing this out

Best Regards
Igor
