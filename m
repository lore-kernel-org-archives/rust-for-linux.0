Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B5F2E7179
	for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 06:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172699; cv=none; b=FcuN543jB/p5ZXs0Hb7yLSEIAqiyXeoK1AiuaCFobip+3KL4KjDa1U48CqPePnrFE/nwcGKfrendjMdB2JrQqWPx6wbwChO8/Q0SdoKwgzCRgugTBHm7yzUWrIzqk53hSoHgg7ssGJNwoeLmxlH2bumQQWDZ71bhNz5X6RFBCdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172699; c=relaxed/simple;
	bh=3iGUXpWU/qz3+qeJZbTRSXZvkjGYZQ2XPkpZPoqstsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pk7+svhz1EiGdCZfEtkZuamNhemIB5HrP3F79VY6WQ3j539JP24S+Yk0GHO0H1DTjaagEgSDm26SJNSxwofXlzLmfpNzdtFSkZ45Zdr+NsJUl80wL3WUWrX9shgyhhsKZGis/q8QQOeNHL7gZxpq+smBtedUEZr1dTlOf+NZhOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=P/w2mqKX; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="P/w2mqKX"
Message-ID: <aab414e7-e4f4-4da2-91d6-93f07b699b59@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779172694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3iGUXpWU/qz3+qeJZbTRSXZvkjGYZQ2XPkpZPoqstsw=;
	b=P/w2mqKXRyw+wp+3erKztoQpY8MCd1fAtTxZqfyZ8kJDA1ODHZCr5eWvc4FfQv+Krj7FH9
	/GF3zbIbuOiT3jC/zHyI+RyTjL92tiHoMucWTQdgdaBE5qa4iaWQl3vJzHNUR6S4N89Hb/
	VRHJPvdNB4qHM8C6Vq5IDdKt00slmRk=
Date: Tue, 19 May 2026 14:37:58 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] rust: miscdevice: use vertical import style
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org
References: <20260519-miscdev-use-format-v1-0-11d526ba0edc@linux.dev>
 <20260519-miscdev-use-format-v1-1-11d526ba0edc@linux.dev>
 <CANiq72mFYDxd0-aX0o-Aa3_d-kq+S9SbzRjXSyppSZya_UR_zA@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <CANiq72mFYDxd0-aX0o-Aa3_d-kq+S9SbzRjXSyppSZya_UR_zA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 5/19/26 13:58, Miguel Ojeda wrote:
> On Tue, May 19, 2026 at 7:35 AM Alvin Sun <alvin.sun@linux.dev> wrote:
>> Convert `use` imports to vertical layout for better readability and
>> maintainability.
> A bunch of these are already available through the prelude, so I would
> suggest taking the chance to clean those up too, possibly in a
> separate commit.

I'm working on it.

Best regards,
Alvin

>
> Thanks!
>
> Cheers,
> Miguel
