Received: from iguana.tulip.relay.mailchannels.net (iguana.tulip.relay.mailchannels.net [23.83.218.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9732F32F761
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 22:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.253
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766012291; cv=pass; b=f3YpK9cXXyT7LUOC1dfzc4ur8vyN7b6J1dssnJccm5atYIfI5JMDMTatXkPDPeY+44CHRo81SwIGjYSxwEF/TA2Ij/I+u4BP3HlY44ZnLI4cEsU8nXfG5SvT8e64nNZhi5HxLFf54YpmpwA+Z7LSqhNpjgVPgN00YFwtw6iKhp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766012291; c=relaxed/simple;
	bh=fumxxnhJKGzyyiK38D0o8KCUnwy5TZNNuu1zn5iwpBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NoDICN2bgyQ6AJLJJGvH+++SlGODZYbEu2OA/U7PBHqY9BQCY9ul6PUgn44cEuASLoW+HjSj3MfHZS8pT/BEu3B2aisRHLQ8XcxZXkSmI6qmpYpdkfAg5WJJQ926RUW5Xlx+p2/bbf/rKnHY9O1dTKvcrhlYNdkz+gtwRnjOH5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gotplt.org; spf=pass smtp.mailfrom=gotplt.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=k8D6PsB4; arc=pass smtp.client-ip=23.83.218.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gotplt.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gotplt.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="k8D6PsB4"
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 41D67722400;
	Wed, 17 Dec 2025 22:41:57 +0000 (UTC)
Received: from pdx1-sub0-mail-a251.dreamhost.com (trex-green-8.trex.outbound.svc.cluster.local [100.102.180.166])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id CFA8D7217A2;
	Wed, 17 Dec 2025 22:41:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1766011316;
	b=7XgPd33rtWSsfwKQwDZJ7HYgREPReB/zRXFZRY3O9nhrV59lOQcnZwP54p7bWC4AHx3bkQ
	c1KS+wBhJawZGWo1UEFcDbIBnX8L8lGdecZp75ne4Jcp/2J+Zf+vDjo8Q0ihUTxpsuodfb
	wDyqlDruKdsoiZAik+AmjYd79SKEoqIQ/NR+QNBXovWjsybfj1iWd+fNtPzQn3cEpdXzcJ
	WPrdUg8q92l/iH5CF20aOmLyldGN51IWDrq/EiQOYeala3pCiADy+8I8xL6s8ZboyykXyu
	bLJUVMFMVT0BwpmZDJ0DjL8peMqAV8YpBM7Fq2AmzQNdDjLK0xrE5d++KM9dng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1766011316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Q8ufNqwwwOMlrjLqQ6PcpUY7Zftvgl3J+95B6QjEJ+E=;
	b=1DDtW9RyMHRBR7Otuyxk1ICNCK4awkBJwkqZMHwO2knKP97neF6jdh9irLUyqRfj0vaMPA
	kuTPl+GCSv/P2I6FCgjtAGo9JaAYoN9h+mapiVEdOk8JeUr9rV9WbaFD9ad1lBaV+By9Vt
	/Kcf+srm2ZRzI7FpES5Y0WKy1axlgHdyPBO8r/GUVc4EPJbAJvORCYglWvgRkvSmtoD/Vq
	n9otPg0GbW7queBjVYwFZgrfP/1mJ5uL0C8iLWRpAYtI5pbAQCGmoNAgkHxVpOWOqShadv
	F/YOxqyyPev8T3k0zGXl9m4nXbJtQMb8i0IL5GTWodxhG4hCgYLAcOJHaYBWdg==
ARC-Authentication-Results: i=1;
	rspamd-659888d77d-xst98;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Stupid-Average: 54dcb33f2055a909_1766011317093_856320088
X-MC-Loop-Signature: 1766011317093:3459152058
X-MC-Ingress-Time: 1766011317092
Received: from pdx1-sub0-mail-a251.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.102.180.166 (trex/7.1.3);
	Wed, 17 Dec 2025 22:41:57 +0000
Received: from [192.168.0.135] (unknown [38.23.181.90])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a251.dreamhost.com (Postfix) with ESMTPSA id 4dWph40kWWz1041;
	Wed, 17 Dec 2025 14:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1766011316;
	bh=Q8ufNqwwwOMlrjLqQ6PcpUY7Zftvgl3J+95B6QjEJ+E=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=k8D6PsB4p+Fm4/3JbyTo1mC/atyoStjt/5sY3518HtncfDP1lBDbLHTEYTG0Vwt00
	 kBzoUpli8BbYcsnnx3HZHsR8u2ub/HPvx9ePecFs4tRY+kPaPp3O+n6TYS0HmMDyPA
	 mnwrEa7qofkFY3yxt/jvKejLEVlDW/emZhDw2c7LvFwa+yKfbhiEbIL79tj8Xy43Wb
	 UWjsF60Ei5IaW/2TsDVRE6H9AIurz/f7qOrytvpgNq9B9leXkIij6WntNDcM2cEFnr
	 RtEeKO5ngnrnjMd260EzKd+C78dXhX2mNZVcirM2qYVrshvTAbY3BXdR1hnhWYuWEU
	 4piT8Lk2RYAiA==
Message-ID: <450694fc-f834-4af1-9437-afabfbf4853b@gotplt.org>
Date: Wed, 17 Dec 2025 17:41:54 -0500
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: Add -fdiagnostics-show-context to
 bindgen_skip_c_flags
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>
References: <20251217150010.665153-1-siddhesh@gotplt.org>
 <aUMWuezmBHFnZUaM@google.com>
Content-Language: en-US
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <aUMWuezmBHFnZUaM@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025-12-17 15:46, Alice Ryhl wrote:
> On Wed, Dec 17, 2025 at 10:00:10AM -0500, Siddhesh Poyarekar wrote:
>> This got added with:
>>
>>    7454048db27d6 ("kbuild: Enable GCC diagnostic context for value-tracking warnings")
>>
>> but clang does not have this option, so avoid passing it to bindgen.
>>
>> Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
> 
> Seems like this should have a fixes tag for the offending commit, and cc
> stable?
> 

Ack, sent v2.

Thanks,
Sid
