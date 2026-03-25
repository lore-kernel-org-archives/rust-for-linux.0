Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB9332AAA8
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 22:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774476229; cv=none; b=MyaavTAP8oOmJQtqwQ6LJuHhR7i5slhJQT0j9K+rcbJ2nlrVW3MG6/HtVSIx1m4D83Z7A6aYkhs8MYi3Q8MX5Ut9g7m7DsNdEMXbZNKr6WDCiNqo1vDDESAxLnfAZ18qzJivfIj3oOiFtBAYOkICogk0UDLr2U5fz9CiL7YlYhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774476229; c=relaxed/simple;
	bh=BgumzxPutRe9jxHUN4whh8SPd+4m2uSpSYiaSbPo61A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uMo9byxds8/p8j7HllvYMdol6+F8eK4Y0pCEBCP6odztqOSrSvszhal68NmGToBCnTTfOKbmVLvsbKu79601cyW2hvu3iI7wZpC9pMwfg6P36SAgUmX+XMTkhG+69WZmjBKj3Xu6Kv1ngTB20KtfdiGO8Zlvgi4Zv6ar6E0jpwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CVg5OmIK; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CVg5OmIK"
Message-ID: <5176bfd8-9d01-4355-9f5b-143d885d648e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774476226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FYhksAhl4ABe9GfOr+73pVoYcDa9AQIiBlyZfKIzSnE=;
	b=CVg5OmIKYNLZuAW9r8UjyMk8Z3Kfh1ys3ieuoi83vWD3ceVWzPc4t7nNlFWdQ7LKNZ6Kc2
	/5msu2DQVlkwFsKKJ0WE6fPZuYGTlIlfgNGwT2bSh8lfw7WLbjZQwgTs4X+Cy4CWWi7WmM
	eOefgGGLfZZP6LFkYnRv+zdOfN0fLqE=
Date: Wed, 25 Mar 2026 22:03:36 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: Update Rust I2C Subsystem entries
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Igor Korotin via B4 Relay
 <devnull+igor.korotin.linux.gmail.com@kernel.org>,
 igor.korotin.linux@gmail.com, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, igor.korotin@linux.dev
References: <20260323-update-rust-i2c-maintainers-v1-1-0744ce44f846@gmail.com>
 <DHAB0HOXQJIV.2ZRJ1VMNEIEA6@kernel.org>
 <90810e54-3324-4100-9f04-1d4d07b20ead@linux.dev>
 <DHAE8HD97E6I.2VLTL6O5QWJQJ@kernel.org>
 <CANiq72k2-pDStQ6WJFPJvvn7AgzU+P_rkB_2T4ZA3P=oPJVWdQ@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Igor Korotin <igor.korotin@linux.dev>
In-Reply-To: <CANiq72k2-pDStQ6WJFPJvvn7AgzU+P_rkB_2T4ZA3P=oPJVWdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hello Danilo and Miguel

On 3/24/2026 2:14 PM, Miguel Ojeda wrote:
 > On Mon, Mar 23, 2026 at 8:03 PM Danilo Krummrich <dakr@kernel.org> wrote:
 >>
 >> Independently, since I think this is the first time you manage a 
kernel tree and
 >> send PRs, feel free to reach out in case you have any questions. :)
 >>
 >> I can't speak for other people, but I assume Miguel and Wolfram are 
happy to
 >> help out as well.
 >
 > Definitely :)
 >
 > Igor: I have been helping others become branch maintainers as well
 > (since that is how the kernel scales after all), so I am happy to
 > help! Of course, Wolfram is the one that will receive your PRs, so he
 > will set up the schedule etc., but if needed please feel free to ping
 > me :)
Thank you for the offer to help — I appreciate it. I’ll reach out if I 
run into anything unclear.

Best Regards
Igor
