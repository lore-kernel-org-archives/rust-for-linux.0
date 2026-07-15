Received: from flow-a1-smtp.messagingengine.com (flow-a1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D11A431482
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 12:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118033; cv=none; b=bvkJ0QZPpbTsydFzVaFFaFEArompDFZHwKTbGeogILfkTOR2DhdQFRq4PT0WUKTfEvA9sKAfi9kn87ecacuOVobe1KEDR2vspXXL3n6zySnQ4LmMLK1Eez6IoIe/+khBdb9PAZeETK6/x4klzlfPq1dHoTXMbGJcwAekRMZPuf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118033; c=relaxed/simple;
	bh=5jkA9D1gc9R71VYYFMQmbQ/tPoNCkWP9D3OZVFRm4Jg=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=o5qRuN0nsmn1u+vqO+5GllpHvJ3MC9U42srlz/U4O3SlOBiLMKcstuuPLhNi6+7gJ29FCZmNwAmeAIrFZiV4wvVGVwEqpvMcHMU5micGENc79nyAcJ0JjPWB7WjMMUhoEfBQOjPEbJaj3SZbCy8Z3DeLQhvHYZ8FfYsX75NfNrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=GS7TH+ek; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WalXxCEl; arc=none smtp.client-ip=103.168.172.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="GS7TH+ek";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WalXxCEl"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 53FA81380369;
	Wed, 15 Jul 2026 08:20:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 15 Jul 2026 08:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784118030;
	 x=1784121630; bh=4P95re0NpRN9tYWeE6FU2LXPeIRUq/vYjeGjj1z9cxs=; b=
	GS7TH+ekGH+uLrtr00ZHpOKC7OtGDwsYMY23FzlERYpsGHuTlt6Cxi8NoKQ2Habg
	0VMo5yed+POD/J+KN+LREXRIE1Dj+HZu991DBd1+1OfFRlVmqCvmh86k22Zaekvj
	BPCWsyPHT2fhIhysBSN7HOg16YR9DXUNcB07+a86g/vTIAIO2wJhatCPFior1CwS
	hJyJou7iGIAzYVnGlOMN6h7cYTWzep8y5znPPJlXQulvwBREIdCZwOr0zjBPUSyG
	r6X7XAvdHCHrf0G578RbUXsbf+9ymtNI8YyckDqWs/1QLckvMVCCflRtvU8rjHNs
	c0tt35ZkRE0FjmeQx7fz1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784118030; x=
	1784121630; bh=4P95re0NpRN9tYWeE6FU2LXPeIRUq/vYjeGjj1z9cxs=; b=W
	alXxCElXLxZ9Ql95MyG8FKUcGifw+VGTAJ3fPYNMjLqenSBdM+UvCzNi/ilWnAR6
	hEgh6hxZWBfSYQk5pfsgbsgmw0QQY4g2eTYmmeVyYtjVdNNQSX19BPbAkzWeLcnp
	uq9iZdjGb7ew8mR7RQ4Z8w0Jsr6TrTrEhStSdgCmWGWkuX16DUo6DVGjfB7W0jaz
	cSQBcTa0xps830yQ8AjOi+TcJrWamS1JUGNEuRwvIBuyq03+mjDkit+adHxbOj9R
	BCDWOwVZVGICI1lZUDbq1S42IV3KmDsPrh2qT2YcofCiV9KW/4RSqZpT2luFayrT
	o5jY3a9QRvMJo5aQER/8w==
X-ME-Sender: <xms:DXtXan7hoqMmTP2FGcKjwlRjDwUyoIt1OQSgk7A3U7T1TFf9rqAZEw>
    <xme:DXtXasy1-0doF-sZ8M32-Mn0aLI1w-DJgS6AyyhrDCohSuw0FAr8L5_Re5i-ELcqZ
    gnRSAFGwCzZwd0PR6yn2Bq9Kme6TYPwKz7-Or_IdZFc8zjYvBFRBYQu>
X-ME-Received: <xmr:DXtXary2aaKgSWpSTsZ9w2btUE_D9SuFoPZ8fOdOSqrPn0vs0V1eLKaq2Fk8vDJtDyppt10tihHcEvelVGUW4m6p>
X-ME-Proxy-Cause: dmFkZTGkSCX1AT6M2I0Qw5KCET5RmBCtpPg5NmzAOoQTEnPWtGX13WXy47gkECGBNt+mV0
    iXsXCS8Wi31n5UgpjcjMXrFHxZu0aZlnAPsn1gMDTNIq6tSwFyVxFos/v5Xhp23lDAff63
    zTg1UKfWRajsfO4yuZu7sK/p9BM86LZeVP/FCvfjB/29hwf9zHit+FoXsKZ+G7p3sCZf44
    ImAhD3f0gRHMNbXAmfJ1tNpUo1okwbt1mgORrsS/i0zbMWHXHqxUw0DqO+7IY8KSISATLo
    fhd//SYm5SdByw4sKBtuv+rXjSFQLVaWO+he5PXVVaTf8pFKaC/KXiToKbvx9a1+EJAnQm
    FfKiX61JxrpmsxUa5xjjYAqyUpfZx1BZJw9BU5/7QXZx+xIAIZR3DV0J41xBFfyAqjdwBi
    22RV1mIj/WtcroUC02foRB6UAcUAx8nL6/hmfhq1g6LUBvxdIxVtPJsFn+SKP1O4EKN3rV
    HO9VybmCYfzPqjQBr4a5BMogmItuJMvAbIqtJq43O745XeNkLtLSHpUiSm5WuWcNCPMXFP
    YPQEgFF7vcHVX4mzqPvA51W42E31gRbDYLeU6becQLIz4HqqBwVSG3mZ41tLbQWw4y/DcI
    koh7csanDBZT/R1rnKgMZhXSCTc0Lr4hn5B/Bluy5JxUKA6l4lNXWzIKWafg
X-ME-Proxy: <xmx:DXtXakVtMIbGlIynRw2PI4wAGHkMK0zBYY80GBccOQDELirKtL2vCQ>
    <xmx:DXtXaoRZ7mzFJ8iQiwJi6UyrQA8JlNCjpqf1rfhhYoP9-Rz5Drc_ww>
    <xmx:DXtXajP7ctZgOpgBhqYXDr7jKjXqhGNrGmENV3Ra6po5HRwn86QUTA>
    <xmx:DXtXalyC-Yfwp4l_7-rwQqoTpLA5G-hlh4h9v1o9q9u__qtXbQZXXA>
    <xmx:DntXaqGovZ4cAvKhWrGVYdS03v7PEHIOfjoDPeICsJqziUSWUtFa_Dh2>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jul 2026 08:20:24 -0400 (EDT)
Date: Wed, 15 Jul 2026 21:20:21 +0900 (JST)
Message-Id: <20260715.212021.485543459172925773.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: tomo@flapping.org, aliceryhl@google.com, arve@android.com,
 boqun@kernel.org, brauner@kernel.org, cmllamas@google.com,
 gary@garyguo.net, gregkh@linuxfoundation.org, ojeda@kernel.org,
 tkjos@android.com, acourbot@nvidia.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v2 1/4] rust: time: add jiffies conversion helpers to
 Delta
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <87ik6ghha8.fsf@kernel.org>
References: <qkuR2hizBbyuYmC9pigSGc_wAIN33sdtqV2v9CS9TjAP3UsxypcGi7F5_XXauq7AtTNawHIM2zR6awW7O1LsCw==@protonmail.internalid>
	<20260712235246.3069713-2-tomo@flapping.org>
	<87ik6ghha8.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 08:57:03 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <tomo@flapping.org> writes:
> 
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> Callers that hand a timeout to some C APIs need conversion between
>> Delta and jiffies.
>>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/kernel/time.rs | 30 ++++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>> index 363e93cbb139..cd054ea5df02 100644
>> --- a/rust/kernel/time.rs
>> +++ b/rust/kernel/time.rs
>> @@ -377,6 +377,20 @@ impl Delta {
>>      /// A span of time equal to zero.
>>      pub const ZERO: Self = Self { nanos: 0 };
>>
>> +    /// Create a new [`Delta`] from a number of jiffies.
>> +    ///
>> +    /// If `jiffies` is large enough that the corresponding number of nanoseconds
>> +    /// would overflow an `i64`, the result saturates to `i64::MAX` nanoseconds.
>> +    /// The exact threshold depends on `CONFIG_HZ`.
>> +    #[inline]
>> +    pub fn from_jiffies(jiffies: u64) -> Self {
>> +        let nanos = (u128::from(jiffies) * NSEC_PER_SEC as u128 / u128::from(bindings::HZ))
>> +            .min(i64::MAX as u128);
> 
> In general for this patch, why are some widening operations using `from`
> and others use `as u128`? Is it not possible to use into/form for all
> the widening operations?

When NSEC_PER_SEC % HZ != 0, we need to multiply jiffies *
NSEC_PER_SEC before dividing by HZ.

What the C side does is:

u64 jiffies64_to_nsecs(u64 j)
{
#if !(NSEC_PER_SEC % HZ)
	return (NSEC_PER_SEC / HZ) * j;
# else
	return div_u64(j * HZ_TO_NSEC_NUM, HZ_TO_NSEC_DEN);
#endif
}

We could replicate this with a cfg/the C side's const-eval
computing. But I think using u128/i128 is simpler. What do you think?


> For the narrowing operations, I think we need `// CAST:` annotations.

Ah, forgot about that - thanks.

