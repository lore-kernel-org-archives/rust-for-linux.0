Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D6A1A9F85;
	Wed,  5 Aug 2026 12:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933843; cv=none; b=iDQdRr/vYsVh2574QNWke3AXDFwVQCCHS/BYiZ64lvr/KxhVrOI2I6jAbbWhlryaslMzlYiG15k+YN+XS2dLNuUgAbWXAdzYyBpmPxXHIuZ0Qamcg9kzEFBo5o7FDjdrhiRf4Ep6C1hg6p5+0pJBpZkd1vRXtIkkII05GFaAmhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933843; c=relaxed/simple;
	bh=izEyKJwJU8JN0mgUvP8uxPMbAavjAQKE5ldwVfK1kDM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pKOJSkf9iucY7Mt2ZkDMNTT/UdP2FNLrLfHy/LTtAwLy7BAFpIUZy7vmu314swD2xd+Xsh+WEy/VxnC8Yp+kMNVfVF7R5qA0lt7VtGNEgQqa2tK+XQqP7PMV3q7JBDMPUqn+ckLv9rHOTr6jySwcgNKPAqKqTmn/AG6CAluj4lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qd5GPen+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qd5GPen+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A0C1F000E9;
	Wed,  5 Aug 2026 12:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785933841;
	bh=izEyKJwJU8JN0mgUvP8uxPMbAavjAQKE5ldwVfK1kDM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Qd5GPen+ewYReMI9+mAikMsL7DYQHfR9EpJbrm5uV+eirWTXndmslEnnK0jbDPvSL
	 8IQDgcqP8zbWODK3ps4h3NDV8He8H6TreU/eGnv6kYTOU1UAEw3anBS4Ea+u4e39il
	 usVhD8+OjZ2PzJBursJ+igyA86SqOqdP7RD2C5TCWi+tXzJ3IBOYLvCCyE/+S67a7l
	 WZKzFSty0RE50mvbaeITC9Hiq8M7bQl7PPndeL8EKV/VYLyuh42de0xqNiAbVERatr
	 Es8XT/GwQ3jMqlNrTNItGJpAfYixUfLnMUCpmGZuZDTMR6jwvXFaOP0nenYs17IB4r
	 TrF9/ND3yG0tw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Yilin Chen <1479826151@qq.com>, Breno Leitao <leitao@debian.org>,
 rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org, Yilin
 Chen <1479826151@qq.com>
Subject: Re: [PATCH v2] rust: configfs: fix release safety documentation
In-Reply-To: <87h5l8975c.fsf@t14s.mail-host-address-is-not-set>
References: <tencent_928148924004787BD355EAB1EA3348E30106@qq.com>
 <tencent_9FAFC60382D724C608F0F6BFABFC63BB6707@qq.com>
 <87h5l8975c.fsf@t14s.mail-host-address-is-not-set>
Date: Wed, 05 Aug 2026 14:43:51 +0200
Message-ID: <87zez07n5k.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> Yilin Chen <1479826151@qq.com> writes:
>
>> ItemOperationsVTable<Group<Data>, Data>::release() receives a pointer
>> to a config_item, not a config_group.
>>
>> The old Safety docs described the pointer as a config_group embedded in
>> Group<Parent>. Update them to state that the pointer must be the cg_item
>> field of a config_group embedded in a valid Group<Data>.
>>
>> Assisted-by: Codex:GPT-5
>> Signed-off-by: Yilin Chen <1479826151@qq.com>
>
> Due to vacation activity, I missed v6.3 for this one. I plan on queuing
> it for v6.4.

v7.4 of course.


Best regards,
Andreas Hindborg



