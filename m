Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF072367CF;
	Sat,  4 Apr 2026 21:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775337774; cv=none; b=hccnpk5fGLUQIvAauHN2/eVz/DUUciZt5sG863CI7L8vVHnS3JDlU10oY2zrhwM4DZWZtRyoqm+Nk97t39X7dSb+nsd9+rig6o2F/fexAXW2KAh4Lgs0HCPu2G+cUI1T2RYHlVSQYTrlD/4MoSMgoDh/DguKDwu00Zt2v2C9adk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775337774; c=relaxed/simple;
	bh=ST0+tvvJLL3lHxfakjkACSDVoO82L3dR9d0eC/KKckA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PgNeFsLJEK9b2m8bfSA5BjZijaBBzZVL7B6f9k0L3AYG1PqbYJjm2n94CDIdrjM+WyopebRRjVQm/vA+6DFQayhii1KR1R5BYEwSyyjM60EKzrr1XiT+R88WtvcKQa+gNS5yjffOR5qYBH2EldiRwMtmN7Ht2R5GeUFFwzNCLB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z2J5PsFF; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z2J5PsFF"
Message-ID: <707e9f2e-048a-469e-adbb-17334dd027ab@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775337770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=okZWCoJOtXxzqMJxoMVOszl66GfcKUgyDQGPuh2hHS8=;
	b=Z2J5PsFFd+tbBaiertU5w95q3vzy2PVxBdQlSPHtwVAGwIpS+j8twYXEpozF1AhDucQPik
	Ewsx1xQ7NoFniJqUu5bI37UFXYND3NUkc3JMhkysONy3CK8Zk0YfOfkZGSUdvhC/in5AEV
	ayO1rtgOIL0MQMdKZVJ/h4Vv31OdeJs=
Date: Sat, 4 Apr 2026 22:22:40 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] MAINTAINERS: add Rust I2C tree and update Igor
 Korotin's email
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260404-update-rust-i2c-maintainers-v2-1-42f929828eb1@linux.dev>
 <CANiq72nzNa29_YduauW_qwPq9sLbYa+28ykq42_bbfLnOqUm9Q@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Igor Korotin <igor.korotin@linux.dev>
In-Reply-To: <CANiq72nzNa29_YduauW_qwPq9sLbYa+28ykq42_bbfLnOqUm9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 4/4/2026 8:24 PM, Miguel Ojeda wrote:
> On Sat, Apr 4, 2026 at 7:01 PM Igor Korotin <igor.korotin@linux.dev> wrote:
>>
>> Add a git tree entry for Rust I2C development and update the
>> e-mail address.
>>
>> The tree will be used to collect patches and provide a basis
>> for integration and testing, including linux-next.
>>
>> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
> 
> I imagine this will go through Wolfram.

Yes, Wolfram is added and aware.

> (The patch is sent from the new address, but the SoB is the old one --
> Cc'ing the previous address.)

Yeah, this is the only way to overcome the problem with b4 we talked about:
B4 catches the line in mailmap and changes the e-mail and b4 prep stops
working.

But I assume it's not that big problem. Thanks for adding previous 
e-mail to cc.

Best Regards
Igor
