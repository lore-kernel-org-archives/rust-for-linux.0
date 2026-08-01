Received: from flow-b7-smtp.messagingengine.com (flow-b7-smtp.messagingengine.com [202.12.124.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96403AE185
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Aug 2026 02:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785552620; cv=none; b=FYtJQPWlo8jaxFFXDOF9DJdLfPD/HYIxr6GcDpK4R5ZcRT5hceufVN5yEDG4Yz/cNEI7Vu6KBC7iKGiwejnFgSLujgBwjulMKs4afhPQuz3LBd/GG0kva5BDSybdDe8/0Qi6Wt9vIx9che7CRG1PKihIbJerqLvLpB0yEgZUCrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785552620; c=relaxed/simple;
	bh=vB6+xPNPh4BSLPkTslslKfbNJbUmfurGhlrgFHGsqGg=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JaN8qkrgqP8W5FQILYTWTLjxHOIqDXbUpZUq09vzf2BAX+WyeaD00KdKPaF4gruY4+p3NnA/mUUrzYQl9dJr6htVAgEN3xHdxfE1wV4CuqrSU7JV6TF5lKw24ziG8xn4/YhfRQZEAoVAeHtrvvD956Hj8MYhFtJwnpzG9GjQ/2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=i1QtMXVI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=o/s+763/; arc=none smtp.client-ip=202.12.124.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="i1QtMXVI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="o/s+763/"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 2BC551300119;
	Fri, 31 Jul 2026 22:50:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 31 Jul 2026 22:50:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1785552616;
	 x=1785556216; bh=jDyGZFCuEenEm6juqZjLr4hSsbJRYPYkYg6LYEc4AOs=; b=
	i1QtMXVIxTdUwvLNZnZKWjC96fDiaxSHfjYETvzxqlqaKJP9tXN96eOoQkK8N9HJ
	Ndj5HY+C9+7PVAHv2udOUbSUQcbm7+Nqfl8F4E5s9Fq2gdhwgFOpus0LTckvpY25
	CWEX5GBsDlI2pVQADf2IJ/VXgqVP+VrR/X2r3rFfiGRYu+aVx5Zd5uYhnXkwXpZK
	dBJ0Kup1k4OQSSWNoczSqjXIBD+A0qbFyHwgLPBypp1h3hdC+jNI1nule7zBhU1a
	pFbPyOFvMSJQ915LsbqRVD7hJfEM7o7ByOKuVOeWfZNlDgazwVvsp0u/n29xg3x3
	4eu1RInV19Gnzw5gjAS0ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785552616; x=
	1785556216; bh=jDyGZFCuEenEm6juqZjLr4hSsbJRYPYkYg6LYEc4AOs=; b=o
	/s+763/MH4yva/z7lXCH9zwmBZVjnH2WMRW4mx9evdc71z+KYgiS/7kTSsn1hhD8
	vecRVUcZtpMgLf7qqwuWPGdpr3uouDa+pYEKJ/bdCYPGQ3qKt5F8x76pAmBBxw7W
	1u4rW0nZoZtuXRMf8U0m9OROrNBkGgNku9zR2+xhWLR489E/4c0EQl3k9mEMXIQK
	aXOu1tg9oOny13SoHmLoU7ncDFu0T1nqFjlrG/i/RAK8vVfJlKrtjJ/9xTeYQBFx
	u5wlwukDd86ZXexSfrr1VOCpbymo8kZXokebcRr5IAI01ORiwA6cIpljeSQwV4hh
	Bdf/umUldR1YQkHk7C4JQ==
X-ME-Sender: <xms:515taoAIQWFOimbcnz8lAq9IMkleQpceBtkbu3-xEj-j684uD6PFUA>
    <xme:515taq8R_t_5L21fv3w1PZDWdcmP33vTciqkn_BRyQMSF0JY7hOV1fnh5V9ScGHyg
    ZweUuBWCiVBlvO0m1-xWNBwHhGqxm0ZQh0rbHXGqPDwYNE1g5JD-to2>
X-ME-Received: <xmr:515tarUxSBPBzlkz0KubdUR6CCxblXo_CPAD6NDWjXc2gNRrPX-OKShj3BlufZ_ywAikiFJb0gQBrTLog0wtM7qI>
X-ME-Proxy-Cause: dmFkZTGA7EeGYQRkbIT3CVFMPYPCAH2k9IvLU9SXF4O87iPDR4vwnpcy3JDVMmm8Vz+zfn
    bd2P31J4iYgB7/X7pVTDpEJpGZJ47RkGk/RkiLx5UveB2smvnqVjLn+zU04paxYK0v3ANa
    UyRkLeTdBb1+XsCZziof5qscshIoHmS724FFSgiput95a9fcOlnDI0dlKvUFUX0iY2dcG4
    6jUL+IT4HThV3YxIj360NKFQUpb1rfnT9b5f1LxBWAi20jtCucqqQTTTkWtkuH21jbloHc
    5so5RBTWVugxXUyI2yhavM6ZflixEO33o3c3wVsiJFgGhnCHZ7QXvUHSiLmdhyWybfn+OU
    LubPmqRTE254kjjkLkPxPHxHNCQOEiRpdshdkNzNotsFXmga+4RLbRtEzf+cH05yXUeaAM
    8WraVHVicCuMb9/wIa5LAhox+1pj1XxfS/rQbiXdARmuF+MDqpsKD7E5JK+RqxvDJY/7py
    7Te9gJd5PWLxatOJgJnEaP5ak7k/wH9Uelmophnqo1GGpWcUbEgNVP7q8bAyqe8bX5GVF9
    HJD627Fu7cmsi0k21u50y09LyiTTcpnaI60xD+MEpc6+Ctk4ST4CnfqJsbDogFkAokddKg
    Trmw3u7Suc2pmHdpka20sdw6bbKs12IpTF+ik/umk0nfMaZXqD0eq4sEC09Q
X-ME-Proxy: <xmx:515tarKX0zFcD-Q3OrVwFs5L-fZHxbIKDRhzpL-MYK6WRYcR0F0NAQ>
    <xmx:515tanCNJKCN6LK-oEd2lgYqQyhTYgqVMEVFJ87_seA28stIGF4KuQ>
    <xmx:515tajE4lj33ZKIn4pRv1PPTq6p6Zm8aSrh2Zp49ApWydHw-0yLoIw>
    <xmx:515tasJ6744QHrkor81abEfIB-4av8LJXH4aoCdXSJ5mobir_gHU9w>
    <xmx:515taj5i41f66TRjCgZt3NErJ-TPycz6HduBPlLBIQ9xaZAaqTKsZNAo>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 22:50:11 -0400 (EDT)
Date: Sat, 01 Aug 2026 11:50:09 +0900 (JST)
Message-Id: <20260801.115009.962811080870881264.tomo@flapping.org>
To: gary@garyguo.net
Cc: tomo@flapping.org, ojeda@kernel.org, a.hindborg@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v1] rust: bug: prevent dead_code warning from
 warn_on!'s flags constant
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DK6U16CA3L2Z.1M87YWGIPFQRM@garyguo.net>
References: <DK6CISNRMHJD.391EZL08Z6HM0@garyguo.net>
	<20260724.130853.1719089301624801198.tomo@flapping.org>
	<DK6U16CA3L2Z.1M87YWGIPFQRM@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 24 Jul 2026 14:23:23 +0100
"Gary Guo" <gary@garyguo.net> wrote:

>>> Also, the proper fix would be to mark it as used in the `warn_flags` macro
>>> that discard the expression.
>>> 
>>>     if false {
>>>         _ = $flags;
>>>     }
>>
>>
>> Yeah, having the callee that discards the argument consume it is more
>> logical than working around it at the caller. I'll send v2 shortly.
>>
>> The same reasoning applies to `$file`. Since there is no warning right
>> now, I'll rename `_COND_STR` to `COND_STR` and consume `$file` in a
>> separate patch for consistency.
> 
> Given that this is closely related to $flags I'd do it in a single patch.

Ok, I've just sent v3.

