Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025652E2663
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Apr 2026 13:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775480644; cv=none; b=dLq3gvg2dZM+TEiWTptR2nlUbpBkoTfqOOpJx31Ohnel8Hz5baeSiAI7vNKoluroaWrymEulfdkfQrKIQuAO+phG6P3V7g34EZyEmWOwyBSgeCqYnaN80tVefSh7hPzFeSu6ouYox0g2PlnV+YBD6kYdyv3rEXFxd1CZ+I3hzmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775480644; c=relaxed/simple;
	bh=RW4pqtNpcAOjskFOeZXcTscIvc5LIfTulhETJcnLfEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJdsqWBl8WefBArwHzgrvUX0BsY1EQVSBzav4X2C8Hn46/OE59Os8GX6MUDkmSMZYA5/21bqlZ/o3GcbyeUkD/Tr+3W1CO8Yp53E1+m9NpFDqNrvPdujP/YFZ/kWz4c2PvKsru7KC4eQWZyN+OpqPnkkwsj/XTL0A72a7EEt1ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FQUj9mYI; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FQUj9mYI"
Message-ID: <c26d043d-43a8-49a9-a866-d2bd5922b549@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775480639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H07pinsuX58gLCPNDO+nT7+9wg4js5Ljkn5gi/p5/nw=;
	b=FQUj9mYITNDQTYTDJEzJwGv2ZsI3DO0b6KJjLqooayuaRWc3vAXdLRSHZLfYqwyOnX0nHH
	qkuXw1+Cok/mYb0Peusqw8g0liO01kFW+oBiruO2vdndRzrOVhoIJc6bRmQTitpL7bukW2
	mc4vOYDnIRSb9wpvAWYpeybLLJccj14=
Date: Mon, 6 Apr 2026 14:03:56 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] MAINTAINERS: add Rust I2C tree and update Igor
 Korotin's email
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Igor Korotin <igor.korotin.linux@gmail.com>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260404-update-rust-i2c-maintainers-v2-1-42f929828eb1@linux.dev>
 <CANiq72nzNa29_YduauW_qwPq9sLbYa+28ykq42_bbfLnOqUm9Q@mail.gmail.com>
 <707e9f2e-048a-469e-adbb-17334dd027ab@linux.dev> <adGOXajATeerw91I@shikoro>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Igor Korotin <igor.korotin@linux.dev>
In-Reply-To: <adGOXajATeerw91I@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hello Wolfram

On 4/4/2026 11:19 PM, Wolfram Sang wrote:
> 
>>> I imagine this will go through Wolfram.
>>
>> Yes, Wolfram is added and aware.
> 
> Well, this doesn't apply on top of rc6, so I assume it will be included
> in a i2c-rust pull request I will receive?

Yes, this will go through the i2c-rust tree and be included via the 
usual pull request.

Thanks
Igor
