Received: from flow-b4-smtp.messagingengine.com (flow-b4-smtp.messagingengine.com [202.12.124.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDD84746B1
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 12:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106341; cv=none; b=bS9Fmnemv9vr3wbNQKyN+9TnmbFdRG0yuBoLgnVgXa91uGqStgj0iNirB7od16N5/nivRF/jAY6RAdEBv3foBSdWx3iwlLm5vv3yYiKr3bDpWqDytDukFIJfJ3GHGHUSAjWXR47GzIJh7OpVpK0CO03HIDA6vm+Mt3w8FFKXWao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106341; c=relaxed/simple;
	bh=fVJEosinVsnf5xvYgQ9QcB2ILKA4wSZ1FUAZbInLYLg=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Pjw3BKySECOv91TDkUO4xrqYV5wI/Cmo+Ook793WPUf68DwXdTew5t+HyejEriOkPYlA0VzLDJWmkrDvMIO2m9IPIi4GF5PYT/ayhpQJ3ghrU7gU9qIj21KAb4n5NdRILx+UJl4htR5hERDvnZ5Xzxf+2vlrY9ylLACGKpAsatw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=Al/HSok4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LtJr42My; arc=none smtp.client-ip=202.12.124.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="Al/HSok4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LtJr42My"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailflow.stl.internal (Postfix) with ESMTP id 87EBB13000AD;
	Fri,  7 Aug 2026 08:38:45 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Fri, 07 Aug 2026 08:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786106325;
	 x=1786109925; bh=Q1E+g6bnUri6S+fG1/p0NTG7ojJNZuYRQtgrRDTGGeQ=; b=
	Al/HSok48nTEvpMwUPiSx47ZeExBefM+esqQYlGoct3VFYKNxMc7nRPOZW1gh0ya
	P7k+0pEWS3TiBxg40ngQ5PzA2SeTUERdlDHMpBIyRqQArLEYFIjQMtz8Mkn4O802
	A1EmeAPdBgchmDwNhC7nMGu1+f9P6uqVw/NhjmrP/fw9NACiFq1ei2YzvpPBrRA/
	CPD35Jbl5F1lxSh6vC0i2KZcOCA76HcM2Z09BeAdVGI5XEiv358doBT/O3Rr2I+t
	MX1rdcF0JtcjM8H+ZreZm4rGZs0c9MlV4URRw7xasG26M3bcwwvKOG2WKw7poA9R
	inkpcqxsdgYHnO1A3iF/Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786106325; x=
	1786109925; bh=Q1E+g6bnUri6S+fG1/p0NTG7ojJNZuYRQtgrRDTGGeQ=; b=L
	tJr42Myn8ntbEpjQMzdecTiBVqBKqVvsu0Zae1XsWQQfMvWceQDOZqz8o7oKVK2k
	F/v2PTbnVHmCLBEUzSX/bNsbrD7w55emVo0hj+OwvuyaxD2b4PHs1V7oA6vInYFP
	HDu7G5I9tkBIQOTsJN1kIpLPrRo8NvyG7pi4ya0MGdqCpP7EENtC+dSYRl5xBKop
	vuThEygZ3Xxo9UuMA98AdfcVSeAzVIMkpLUu7PXTIxLhqv/WtQEjdbXw8EEqdzOz
	ODTtU4U3jLdTOOnHlVuPymQHoBWcMBN+IKdPazLEp7JoKog2nTwNnt0Nlg3i3mRb
	iZbFJa52XyNQf0TDp/uDQ==
X-ME-Sender: <xms:1NF1aln1yjoUcskVk1LJFcvYxFoufQ0LPLUJZS9RLCbz7fF58xl8nA>
    <xme:1NF1asVzvBMSafwEoLEhxNLuftBKn-q43gGA5WZXcRBndhZ_5wfcCVuMNjfLpG8kX
    YErCzVsWPuxQh4GLkmUyLgukdtS-_daP0usb8i4j_D6KGviuxMw8TH2>
X-ME-Received: <xmr:1NF1ahoAjS7DEoPGC3z_bPBXs-_i7YKSaILxvl5JFHtEmvp8ZlH147Z-Vl592csN-Ov6V0ZOivUmThCVPlpK3hPX>
X-ME-Proxy-Cause: dmFkZTEOaIt++PMr1KNKLbE8267UrsVrkIaqKR7bHGY2LdW6Uwdo91OjyQ1V0oMs6UNtkG
    KJfN4yN34pHiybwzE8GjcVx0BHRh9oFCQaRaWviUAqWUQsyLGP7lndVeSfupiBIcQe1QWd
    sEuVP3n8BCW8Q2KoT4yhy/hKV7cppi/CQ90UfkPbeehHcIKW8ZzYiogw1S3Vut3fcZqMLC
    6TB5R/AQLvIQBJllQ0EAfJhCe0pMlaPUnaoVTW3ayIUW1j3A8UJhp43XO6mTPZcfWflh/n
    Sx26gyXNvAYyidNuE90lFjjpHqcftmy82/+Th/2R7emXTuZThjsLhVedJLqBUV3tdSe6ba
    i1MR/oOq6XmYIC7Cc30F1uqKyuD7t9o8a8ZDE4otCKTyDHomcNnvctMzXlXym12L2YkpHo
    1wp0VoQkaNMhrkHWUovLu6KqQAPnesM1FhNAxFd4MBmeprHmEsvDmn0bpOIGcbJuRjeyKb
    YVchq/EXdkBKMVyFcso1/CPxS9t/3kpPzrnpB1hsV3vqh6EimvS+uj9w94nhz//P9G/Npt
    MkacE9oNpvvwBYAB7bRM+nRMUSf2ZcSwXBLeJK4tC/10snPZTEUG7ZAsUDCoXK4mtjaEQQ
    prl9r0O0mcPYLagOv6zLCiA10J+DT34SdUIVwiKTnPgbY8MR0zP8PstAZU4g
X-ME-Proxy: <xmx:1NF1ajU8oFq8bJI_WGTE4rsxgnYQQwzgqMUJ89SGCx--5Oc5Jz4IuQ>
    <xmx:1NF1apCGB1anzbbPeZV_1jIlulytjdBT5L0230cq-gfidIJoCcteuA>
    <xmx:1NF1avVmKm_8zt3TS_myDDte_fl1GcN2hhGzkbKxME4AzKZrqeGbTQ>
    <xmx:1NF1av-MrjfBRzjciNJm8J55S3EMHeaRwTtgyZpK1Nw4xhHAULyDCA>
    <xmx:1dF1akRuFH0Va_QZXjygo17BDrf69VnOIoAIA7P1KIMfIEvMkn8Iw7Iz>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 08:38:39 -0400 (EDT)
Date: Fri, 07 Aug 2026 21:38:37 +0900 (JST)
Message-Id: <20260807.213837.477414639891260460.tomo@flapping.org>
To: gary@garyguo.net
Cc: tomo@flapping.org, a.hindborg@kernel.org, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gregkh@linuxfoundation.org, ojeda@kernel.org,
 tkjos@android.com, acourbot@nvidia.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v5 4/7] rust: time: add Delta::to_jiffies() for timeout
 conversion
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DKHU7G936M2Z.3A8B6AQLWLEN2@garyguo.net>
References: <20260806073241.1024319-1-tomo@flapping.org>
	<20260806073241.1024319-5-tomo@flapping.org>
	<DKHU7G936M2Z.3A8B6AQLWLEN2@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 06 Aug 2026 12:50:55 +0100
"Gary Guo" <gary@garyguo.net> wrote:

> On Thu Aug 6, 2026 at 8:32 AM BST, FUJITA Tomonori wrote:
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> Add Delta<Nsec>::to_jiffies() conversion that rounds up so the
>> resulting timeout is never shorter than the requested span, clamps a
>> negative span to an immediate timeout, and saturates an overlong span
>> to the kernel's MAX_JIFFY_OFFSET "wait forever" value.
>>
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/kernel/time.rs | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>> index 9d65a6c1992a..5844ee985a7b 100644
>> --- a/rust/kernel/time.rs
>> +++ b/rust/kernel/time.rs
>> @@ -551,6 +551,27 @@ pub fn as_millis_ceil(self) -> i64 {
>>          }
>>      }
>>  
>> +    /// Convert this span to a [`Delta<Jiffy>`] suitable for use as a timeout.
>> +    ///
>> +    /// The value is rounded up to the next whole jiffy, so the resulting
>> +    /// timeout is never shorter than `self` (as `msecs_to_jiffies()` does).
>> +    /// A negative span clamps to zero jiffies (an immediate timeout).
>> +    #[inline]
>> +    pub fn to_jiffies(self) -> Delta<Jiffy> {
>> +        let msecs = self.as_millis_ceil();
>> +
>> +        // CAST: `msecs` is clamped to `0..=c_uint::MAX`, so it is non-negative and
>> +        // fits in `c_uint`.
>> +        let msecs = msecs.clamp(0, i64::from(crate::ffi::c_uint::MAX)) as crate::ffi::c_uint;
>> +
>> +        // SAFETY: `__msecs_to_jiffies()` is always safe to call.
>> +        let jiffies = unsafe { bindings::__msecs_to_jiffies(msecs) };
>> +
>> +        // CAST: `__msecs_to_jiffies()` returns a value in `0..=MAX_JIFFY_OFFSET`, i.e.
>> +        // `((LONG_MAX >> 1) - 1)`, which is non-negative and well within `isize`.
>> +        Delta::<Jiffy>::from_jiffies(jiffies as isize)
>> +    }
> 
> This should be using nsec_to_jiffies?

nsecs_to_jiffies() is documented as unsuitable here, time.c says:

    Unlike {m,u}secs_to_jiffies, type of input is not unsigned int but
    u64.  And this doesn't return MAX_JIFFY_OFFSET since this function
    is designed for scheduler, not for use in device drivers to
    calculate timeout value.

It also truncates, so it's not suitable for a timeout.

__msecs_to_jiffies() is the timeout-oriented helper: it rounds up and
saturates to MAX_JIFFY_OFFSET, which is what a timeout wants.

