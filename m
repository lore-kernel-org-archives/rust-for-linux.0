Received: from outbound.mr.icloud.com (p-west2-cluster4-host4-snip4-6.eps.apple.com [57.103.69.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72D61DE8AD
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 21:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772313813; cv=none; b=cNYRAIVnANnII0zR6DvK6lcDX3wRbmmOSWanLHbkOq9Y6OTTMypH0Dhk2ktSbn9/lte0032ZvE2WjcDhiWjW4KeW/d8aj3RQvYUEFyHi//Ve5IeOOrdZO+0DZOxpapFhhoh6rA3Bq+BhvYe3FZIj6FcKsk3WkPx07Dr2Rl8CW1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772313813; c=relaxed/simple;
	bh=VOSUuV3S1m9hjpO2imwx3fhuROltsv0Xql/YqzWvxqA=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=tkeLvd7eP0Y1dErJYoKwtobYzuDobwhCLlPaoxGkO5G3sVtgaLbgvjSQkLfjo8lFufi0TXD4gsfTW0hxb2pZTMiPOg6dbHShZaWzx0uy0WwEnEJrMt2zgbf3tTp7+I+4KN/DFSZsKSzS+z+ATGqtgoy+suTGuaYaX6OIwpunZEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=N3MTTSgC; arc=none smtp.client-ip=57.103.69.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="N3MTTSgC"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-4 (Postfix) with ESMTPS id A4F21180012B;
	Sat, 28 Feb 2026 21:23:30 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1772313811; x=1774905811; bh=gFWif/EyfeLVbRQ1uIkFfu5qXHU2C9/eerj7ichwiY4=; h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme; b=N3MTTSgCEkVAXLsL2Pclx2Fideysa6xXJC8cYQG7TrOlq+8nxHO3e48NZl90BvjIiOLK41/l7Fog7IkajsxxjV2LAZgc36gg/VUj0VLCruZgRdH8xcyH4oI816gGl0gL/Zhh6AApO0NquSmzk/4zShxBO38z5SW80fyXa49b6H3vDka0+OvUFmL1HZr/HmG3QiUSeI5pUi6DCHpqdFOV7HCOmlFMKABxIRAfFyDb+me6GCGPs3YX1qKqXwdwIy9CFlkthe9KnNmMSlOgzvsWF+07bB6iLvnoMTMsXiMLaYyrczqoHPY8LctVbpoqf9+2dXV5kmWL5UWWFII/4wht6w==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-4 (Postfix) with ESMTPSA id 19124180010A;
	Sat, 28 Feb 2026 21:23:27 +0000 (UTC)
Date: Sun, 01 Mar 2026 06:23:26 +0900 (JST)
Message-Id: <20260301.062326.660359795478089124.fujita@bee>
To: gary@garyguo.net, a.hindborg@kernel.org
Cc: tomo@aliasing.net, ojeda@kernel.org, dirk.behme@de.bosch.com,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, frederic@kernel.org,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v2] rust: hrtimer: Restrict expires() to safe contexts
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <DGQM5E2RZ8S3.1395H7JR422YB@garyguo.net>
References: <DGPQVSXND3M9.1738YQZSFDNDJ@garyguo.net>
	<20260228.102641.702865761508670909.fujita@bee>
	<DGQM5E2RZ8S3.1395H7JR422YB@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TWeVRflf23OxhKTqUukZtTmMSczFnnA9
X-Proofpoint-ORIG-GUID: TWeVRflf23OxhKTqUukZtTmMSczFnnA9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDE5OSBTYWx0ZWRfXyEFmqS+O8Mzz
 +8qMc3t7aTCBk+Sx5qok6SSnZDwC/yZOGBnMava29BDeNm+TEnqwmuhwIbqcsXxdv9/KmWaxwFd
 acmy9cS0kL+1QKJ0IfK/wIqr2FZqsJT9D5y59kBnD9jxVgyUdmp6nCQpnRVEHtQbv9u6le0a1lf
 zSgGWo32yyYbQbZWwJyHMK2V6Q+fU5o8qCAGu1MUvYI9jOrGJUszghkTicpwWF1quSz3Gq8OBwX
 kSrAa8PgvVGAhhd63cw6aRlV7BWw9x8EjfXaqG2howYiPEHu24gnAAbbmnolS/Qh4mQ67fPSDDe
 +9Bnd+YtFvnHbhgqGX6Z7rmf/qP5gdCU1lVob5O05r8rSVLyheiF70SnZQ1n/4=
X-Authority-Info-Out: v=2.4 cv=dIWrWeZb c=1 sm=1 tr=0 ts=69a35cd3
 cx=c_apl:c_apl_out:c_pps a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=_2yia0w1AAAA:8 a=h38X0v18AAAA:8 a=QynxRjUVhtvtJ0mRFxoA:9 a=CjuIK1q_8ugA:10
 a=4yAS8WwzZ1jAEY03B-5r:22 a=hjDv5vYt9AxPTMVfK17q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_07,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 clxscore=1030 mlxlogscore=866
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602280199
X-JNJ: AAAAAAAB3ctwQf8jodS91vkfhVTNch9kNFV5m3iv20zjS4wPAu+INdDksxquAweNsGTKI2Xr8SBWv1FXJUro/GXJPNfpIL538iKW3ZjZvGB7qIDmwNbkFqSr6KK7b9hLYNjtQHieLaOGARA3aUpHDpxScbqs+u9vgDILfvueZx0rj+Pu3BVv+FtD5/Z/MaxZmpNUa2buddnJoV7WWKqyCGLAFH6Ovi8jRBhAeUxroWDTPOV12/3+CfzN501MNW6Q/2ByEaPlSlXZLZsyN0wTocF5jdBlTvuxYoApQVTrpMyM1MEGZG5JDR1zfExaTLXhlwaQPRF/SuR5Fa5XnA5T1jGaBNsMc3cXmq4lWoXrSbNmVcCkMQf7/lPq11FEQOvsVdNRkxSIS0TrtKbMcxOp4iAz6300x/q/44z7dHPW4gpQ0u1NxiyeMkAOSe8dakLG1xpICNDnWI14Jdo/aIspmED9Pgq8P/VhfOtIJAOpcm7GVJAwwU2lebgFxzAi5cDZQ1U5hwLp16tOQOjqwtbD73NHMs0jzgoBpbtYIKRUEUKUnA9iKVHURdjpTR3Fat7gKpEzTLwk6aIaHKbwoEKy1W7Jx1qSYitC2Eice7o2OE8S3aa/ZMdTyO/5AQIiZtwceCgl7jd9sXj2hKP4njqFsSRAJiBP8grqb3claiHU+vPpJ7phTae/J5HgeS6YUzaOQqyj9XcteseAXQpc+0GbBoqdXrE+dr31uRw/S09tcN/74wiAkEK+6ZeD/sALd5tm2SasbXltLcsrriMUZvdY1p4R1Gvhavy59ANIrmtMpqLYCWVVLaTppbi9kskumbYQzP1gYYRwwO71mkSAPnYxlMFc/DGRsLiG1uwJGhCNvbgu0Hb5Vsw=

On Sat, 28 Feb 2026 13:02:10 +0000
"Gary Guo" <gary@garyguo.net> wrote:

> On Sat Feb 28, 2026 at 1:26 AM GMT, FUJITA Tomonori wrote:
>> On Fri, 27 Feb 2026 12:32:05 +0000
>> "Gary Guo" <gary@garyguo.net> wrote:
>>
>>> On Thu Feb 26, 2026 at 6:33 PM GMT, Andreas Hindborg wrote:
>>>> "Gary Guo" <gary@garyguo.net> writes:
>>>>
>>>>> On Thu Feb 26, 2026 at 1:19 PM GMT, Andreas Hindborg wrote:
>>>>>> FUJITA Tomonori <tomo@aliasing.net> writes:
>>>>>>
>>>>>>> On Thu, 26 Feb 2026 11:42:39 +0000
>>>>>>> "Gary Guo" <gary@garyguo.net> wrote:
>>>>>>>
>>>>>>> >> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>>>>>>> >> index 856d2d929a00..78e2343fd016 100644
>>>>>>> >> --- a/rust/kernel/time/hrtimer.rs
>>>>>>> >> +++ b/rust/kernel/time/hrtimer.rs
>>>>>>> >> @@ -224,27 +224,39 @@ pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64
>>>>>>> >>          self.forward(HrTimerInstant::<T>::now(), interval)
>>>>>>> >>      }
>>>>>>> >>
>>>>>>> >> +    /// Return the time expiry for this [`HrTimer`].
>>>>>>> >> +    ///
>>>>>>> >> +    /// # Safety
>>>>>>> >> +    ///
>>>>>>> >> +    /// - `self_ptr` must point to a valid `Self`.
>>>>>>> >> +    /// - The caller must either have exclusive access to the data pointed to by `self_ptr`, or be
>>>>>>> >> +    ///   within the context of the timer callback.
>>>>>>> >> +    #[inline]
>>>>>>> >> +    unsafe fn raw_expires(self_ptr: *const Self) -> HrTimerInstant<T>
>>>>>>> >
>>>>>>> > I guess the signature of this can also be
>>>>>>> >
>>>>>>> > `unsafe fn raw_expires(&self) -> HrTimerInstant<T>`? Then you can remove the
>>>>>>> > first safety requirement.
>>>>>>>
>>>>>>> Thanks, I've updated the signature to use &self.
>>>>>>>
>>>>>>> Andreas, this breaks the consistency with raw_forward. Is this
>>>>>>> acceptable?
>>>>>>
>>>>>> If we do this, we get to argue that the NonNull we have in the callback context
>>>>>> is convertible to a reference. Either way is fine with me.
>>>>>>
>>>>>> If you change this to a reference, then I think we should rename the function to
>>>>>> `expires_unchecked`. The `raw` usually refers to operations on pointers rather
>>>>>> than references.
>>>>>
>>>>> Does it make sense to simply have `HrTimerCallback<'a, T: ...>(&'a HrTimer<T>)`?
>>>>
>>>> I assume you mean `HrTimerCallbackContext`.
>>>>
>>>> Could it be a mut reference? We are supposed to have exclusive access
>>>> when we have the context.
>>> 
>>> If `Pin<&mut Hrtimer>` would work, then we can perhaps remove the
>>> `HrTimerCallbackContext` type and just pass a `Pin<&mut HrTimer>` to the callback?
>>
>> During the callback, ArcTimerHandle still holds Arc<T>, and the
>> callback receives ArcBorrow<T>. Creating Pin<&mut HrTimer<T>> would
>> cause aliasing between &HrTimer<T> and &mut HrTimer<T>?
> 
> This is fine from an aliasing POV as `Opaque` cancels the noalias requirement
> of `&mut` already.
> 
> As long as we can guarantee that no method on `Pin<&mut HrTimer<T>>` can race
> with methods on `&HrTimer<T>` it should be okay.

If that's the case, we may be able to remove HrTimerCallbackContext
entirely.

Andreas, what do you think?

