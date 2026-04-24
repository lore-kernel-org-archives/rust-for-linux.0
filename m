Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6F62D0622
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043674; cv=none; b=HuE7iREqGfsf/v7tqGimnS2z8jvzERrkEWsAh7+2V2EGpeIVQc8oHteB0OsbpIsQYdxilh9IWD6orjZLZA24/xZfWd/Z2HIJooQmECRu99vov+szEKW5MFQlmwpM+cgx3L1s8/dIqS+ENS+BwDpOt13Z4SA/Pv7knQSc8UZQ/GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043674; c=relaxed/simple;
	bh=3Vr+G5/sfV71G+m+azhJh2hzauLWbcMkhpq1LDpf/HU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iv0x06XzTXPF8ppyRXwWe/aNoKMktX1T9HcNMSOxTZcwJvUDww78Xd9YBZLheDItyDbcYH2imOf5y47KjxNywI58IbCWVDcoQZmqxedHNgoZRPKUrupGORnezUaftGLqadPTC5Il6Uss5RShMNdIO/PsL16RRB4EFYkgo9NpNVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dePqNvuh; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dePqNvuh"
Message-ID: <83dcad1d-5c0b-4b4f-a9e3-ef962cfde9eb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777043660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Vr+G5/sfV71G+m+azhJh2hzauLWbcMkhpq1LDpf/HU=;
	b=dePqNvuhL1GrSYynem9cvEFEzhZts9U3er/geGeOGdnJmra8W82CFSwL5xlErn1YS2E5k9
	tGwZ/wtd8i1AVFNs8ZHutl+PPNCAdLU6pv+/FyWou24i8Yj8uhkZrVW9eKr6bY/bCcVSIy
	+wn2FqWhumlh5qG17IBK5Gh8B1dfIPo=
Date: Fri, 24 Apr 2026 23:14:06 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] rust: xarray: Add Guard::find() helper
To: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Tamir Duberstein <tamird@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
 <1TcoEoC6DnctfKo9mZsuxSJtZ02ujRRd7O0Jxu62xR0JPeJcq2hB7XD1qBbjleyTBRMWf-uy0HLh7lWkYXbaMw==@protonmail.internalid>
 <20260417-tyr-ioctls-deps-v1-4-41c6e9bb061c@linux.dev>
 <87se8kh9f5.fsf@t14s.mail-host-address-is-not-set>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <87se8kh9f5.fsf@t14s.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 4/24/26 19:42, Andreas Hindborg wrote:
> "Alvin Sun" <alvin.sun@linux.dev> writes:
>
>> Add a helper to find the first present entry in the XArray.
>>
>> Returns the index of the first present entry, or None if the array
>> is empty.
>>
>> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> I submitted a similar patch a while back as part of the dependencies for
> rust null block [1]. Could you check if you could use this patch for
> your use case?
>
> Best regards,
> Andreas Hindborg
>
>
> [1] https://lore.kernel.org/all/20260209-xarray-entry-send-v3-7-f777c65b8ae2@kernel.org/

Sure. Looks like Tamir has already told me about this patch series.
I'll try it later.

Best regards,
Alvin

>
