Received: from flow-b4-smtp.messagingengine.com (flow-b4-smtp.messagingengine.com [202.12.124.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BA7481255
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108440; cv=none; b=tHh8t7vQjvCTRLKzZwt/Eo130oKwIhsMjoDpEghueFgZ7hZWfQDzcRRmxVqkC1xIraQ4bZmRccurFBETv9D1f6b+ERggBjk04Imh7GAjbYqf4rs2k43hc7ZOahBr+k0uXJq9vSohEqAY62T+P4T440NQKbuMiajMDhZUx5Qh9B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108440; c=relaxed/simple;
	bh=OFX82aQsW9pFvjBCKeUDe2CMwCO0wMnibo4G3x4psBA=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sftmqniXJYMzLybn+3/lytw53LCeJjamxQSdQ8Yy2227OPJTIArRKFG+YeDkBUzMv3RAbtUXVTrccHwgsa3vPaXNrJzMz/YeNfFPq/NBP3MPhDNQDV6cdz0iMCJNv2aRD2so2+CBqQ11boOqLBO5LFpEoLN8++iZ30nihJrKW9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=LF+MHx+F; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KJRdRbwI; arc=none smtp.client-ip=202.12.124.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="LF+MHx+F";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KJRdRbwI"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.stl.internal (Postfix) with ESMTP id C6C5613001E4;
	Fri,  7 Aug 2026 09:13:38 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 07 Aug 2026 09:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786108418;
	 x=1786112018; bh=ySHr/SWFhrADxrFEr/NV+GjpuDj0NF7WEzVBU8qqUos=; b=
	LF+MHx+Fnur+5o9vPGgpl0dVbZPfaG16JUtWwxo0VKOC9hWGcl4hEOTI4jSKwlHZ
	me+TfCEN5aDKvrfARlxuxZsmKszMQi6C6PD39Cal9S0gg0CRPh+ld9S9kAxUfaSM
	Xp73zfPOtc9Ofcqn/IcLJRMqxTNU8W31mafIdx0k92Uepf6zVe6toww3feZ6dr1x
	fnxryH+aGvYlNsjQ48+IoakUPPwkVGNqHzQytIJQ7OXDUMh0snFBNMnpHy6Ti/er
	Mk0IAjcGinScpqWP8duBvJDCbrsGMEWBb01u+0eZcY9HqsB0HhxIYcOB1obPW0Ae
	86bZxG13uY55NihpLC09Ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786108418; x=
	1786112018; bh=ySHr/SWFhrADxrFEr/NV+GjpuDj0NF7WEzVBU8qqUos=; b=K
	JRdRbwINbNH0pzn+2G5lGhK6GNgSf5JIwlz13RAahYmoZSUrEs9aYBja1tCD5AkI
	2dx9OtwQa4cnl/i2J7OYNCnv60GVvaG4qIACRUmlgs+/lrB8Ri164FYrbkcKTjPf
	/s7ExuTi4akJsNwvCGLhKP/sIo6g6cC8p0fq3vWBkdbYt0wUy+z99dQw04A757vu
	kPH6ShnDXQSPDMDBl+2Q17SFY5ZCKLNzp0s8RfERvSTjvy49+cGmeWkviknV6gL+
	POu/LoE1gizA0wZPqH8itHixsdDGADt0desTAsSgclT3mtUQZ0JC496GdaYMLqjd
	3uHJQ86d8gwIpLLkgiILQ==
X-ME-Sender: <xms:Atp1aiMhu2x6nfveulgCGEp4mLWXzlq43XC2w4Ybat59qpATnHG-pg>
    <xme:Atp1ag0NmXLCkw98V7kZvD8HvVyv-yc8yCqx61UoMnAKc9vmD5NSvYFuHbIB_xhE4
    ywZipyFCHkhz8cf-oseAes-9liu0k1_hu_ENiC60ZLG7Q2YxZQdY6Q>
X-ME-Received: <xmr:Atp1amlDuPFXHHgHuh5yQM-WgPMtCwolHBF2K8TkKkefTUGKontSwQteWb2E9OtW_H3ywfWsAGo5wb8QKpYY0T36>
X-ME-Proxy-Cause: dmFkZTGPuXQHxzHS68iJkFxsLUsz+OkJUs2+M5CCqZodjZP3Powuc7yEmelIbk9u9FkKGD
    8A8jQXnS8BtAQXQ7J0jyeoOjpaWPzX4I2cN76r8x5/05Vgf75Y7nS2qeZ7F9hnKg92tWCK
    FXHP6qcEir5T+aoeGIcRO7EBhZFUP/mJXGtt19PmHaSmNO3Vz5sIRZzRgAFyJQjdK5VStN
    zr9jkOR9Ad7ee7n71Qp02txRfWYP3qOV0WBPVlErxOA1rX3q6B1EMMsOtMevnUqHSVj0JZ
    PeOTRZpxEODYdvI7rp+O79MyVhIK60bELhufvdwR1LDOyADfJEAqJYW/7GTS+zKTTBqxTl
    Xfez8RwmuOb0oAKb41YGBJQbPStIirdpihklA8IbrvWZOSTqIC3mJCf0x4H3yfgG9fOfVm
    okRsqHmk0YXvvFSe9K7yT2f9T2ueNdun0mi6PBhSBV7iRLpFEac1AzgVsOGxRyK9RIB8SW
    K82+eqX0EWJSn2lMcnKWSHUxhysiOIAwoacLDMCgO6+MCzBqLcvioAls947GvNsBOgRTdA
    dG7iwlFTva05crEpn2Yg3/SXWgQBb8a48zrzEO8xjvdiFgokgO+yqpMKbzdHFiwTSNuxR/
    lwzF5Mld2QgscMNlI4jhzgUIk+AMlXsJLRAmAh8iNVJfeZzpOdD9aDF9nYAw
X-ME-Proxy: <xmx:Atp1au7AgZJC-RhLYI_4B9H-6zRep0sDxNqDMu8G7nKUGHoALe_h9A>
    <xmx:Atp1annOhGpzYv3ayMNGnJkNiUnPQUWTq6WlL_xNcsvS73zYayr6Ng>
    <xmx:Atp1aoTlckT1ZIKc552VY8qOpWE9ezT6s7oV3NBksqhAfaAhqaaTuA>
    <xmx:Atp1atkMIYu-GKRCloVPlcIn8H5ZKXOApplhaxciIkyS-7BO8BBUNQ>
    <xmx:Atp1ajZbkn1DtklIGkQLoKi5mX8pyjeWdk0q_xjMHQwKhkqmpHJzPzBK>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 09:13:32 -0400 (EDT)
Date: Fri, 07 Aug 2026 22:13:30 +0900 (JST)
Message-Id: <20260807.221330.1176623855678550212.tomo@flapping.org>
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
In-Reply-To: <DKIQAE0F6ZVF.3BFDX69JGNUI8@garyguo.net>
References: <DKHU7G936M2Z.3A8B6AQLWLEN2@garyguo.net>
	<20260807.213837.477414639891260460.tomo@flapping.org>
	<DKIQAE0F6ZVF.3BFDX69JGNUI8@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 07 Aug 2026 13:59:20 +0100
"Gary Guo" <gary@garyguo.net> wrote:

> On Fri Aug 7, 2026 at 1:38 PM BST, FUJITA Tomonori wrote:
>> On Thu, 06 Aug 2026 12:50:55 +0100
>> "Gary Guo" <gary@garyguo.net> wrote:
>>
>>> On Thu Aug 6, 2026 at 8:32 AM BST, FUJITA Tomonori wrote:
>>>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>>
>>>> Add Delta<Nsec>::to_jiffies() conversion that rounds up so the
>>>> resulting timeout is never shorter than the requested span, clamps a
>>>> negative span to an immediate timeout, and saturates an overlong span
>>>> to the kernel's MAX_JIFFY_OFFSET "wait forever" value.
>>>>
>>>> Reviewed-by: Gary Guo <gary@garyguo.net>
>>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>> ---
>>>>  rust/kernel/time.rs | 21 +++++++++++++++++++++
>>>>  1 file changed, 21 insertions(+)
>>>>
>>>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>>>> index 9d65a6c1992a..5844ee985a7b 100644
>>>> --- a/rust/kernel/time.rs
>>>> +++ b/rust/kernel/time.rs
>>>> @@ -551,6 +551,27 @@ pub fn as_millis_ceil(self) -> i64 {
>>>>          }
>>>>      }
>>>>  
>>>> +    /// Convert this span to a [`Delta<Jiffy>`] suitable for use as a timeout.
>>>> +    ///
>>>> +    /// The value is rounded up to the next whole jiffy, so the resulting
>>>> +    /// timeout is never shorter than `self` (as `msecs_to_jiffies()` does).
>>>> +    /// A negative span clamps to zero jiffies (an immediate timeout).
>>>> +    #[inline]
>>>> +    pub fn to_jiffies(self) -> Delta<Jiffy> {
>>>> +        let msecs = self.as_millis_ceil();
>>>> +
>>>> +        // CAST: `msecs` is clamped to `0..=c_uint::MAX`, so it is non-negative and
>>>> +        // fits in `c_uint`.
>>>> +        let msecs = msecs.clamp(0, i64::from(crate::ffi::c_uint::MAX)) as crate::ffi::c_uint;
>>>> +
>>>> +        // SAFETY: `__msecs_to_jiffies()` is always safe to call.
>>>> +        let jiffies = unsafe { bindings::__msecs_to_jiffies(msecs) };
>>>> +
>>>> +        // CAST: `__msecs_to_jiffies()` returns a value in `0..=MAX_JIFFY_OFFSET`, i.e.
>>>> +        // `((LONG_MAX >> 1) - 1)`, which is non-negative and well within `isize`.
>>>> +        Delta::<Jiffy>::from_jiffies(jiffies as isize)
>>>> +    }
>>> 
>>> This should be using nsec_to_jiffies?
>>
>> nsecs_to_jiffies() is documented as unsuitable here, time.c says:
>>
>>     Unlike {m,u}secs_to_jiffies, type of input is not unsigned int but
>>     u64.  And this doesn't return MAX_JIFFY_OFFSET since this function
>>     is designed for scheduler, not for use in device drivers to
>>     calculate timeout value.
>>
>> It also truncates, so it's not suitable for a timeout.
>>
>> __msecs_to_jiffies() is the timeout-oriented helper: it rounds up and
>> saturates to MAX_JIFFY_OFFSET, which is what a timeout wants.
> 
> Which sounds like is what exactly is suitable here. What you want should be a
> different named function that does the ceiling and clamping?

Agreed, the ceiling and clamping should not hide behind a plan
conversion name.

I will rename it to to_jiffies_timeout() as Andreas suggested.

