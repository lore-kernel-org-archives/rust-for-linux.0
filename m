Received: from outbound.mr.icloud.com (p-west2-cluster4-host5-snip4-10.eps.apple.com [57.103.69.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4672E542A
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 01:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772242011; cv=none; b=LWBDXVsFsRZSbsb6unu+peIGhOYNAsp7IhNjVI3yCE7mwfkaO1dZaeVxm2mTR4m1Ek9LK2heXU5wndeXTyJ0LgkQewK/a7cMMZDQ3c5xxpdd4zimI3ZlB3g2Zs377SIShyp8XtI4grS9ew0+2kpsXu13QbI3/kx7lqYObhuart8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772242011; c=relaxed/simple;
	bh=TRnW7hTCC+OdojCKqr/TN3JjhJb5UAlVCRKfVLHdyQ0=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IuuekOjsZqj9FwJ+6vCfGHk1OEiyeCVdNmyyK2BEd5vStG6+kWipyJVRem4DeEbIJkqW2SToSFNkSpUIVLzLuQWcoxXNNqqfi7f2x0oKaOUDZ0khpCP2Km3dhoXP9CMjAAVcjFfM3YR+zBs1izt40FDK+YlOf+FYKEHnAVTw5RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=yNrbWA3V; arc=none smtp.client-ip=57.103.69.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="yNrbWA3V"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id 111CA1800117;
	Sat, 28 Feb 2026 01:26:45 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1772242009; x=1774834009; bh=PK9N+yyc1bwgR/WTNZ9o4bJ7lyKNSDTZEVmMla0PuYo=; h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme; b=yNrbWA3VqtawshNLTmNxj7h3DUNlVNeWB58wGsFSAH6rzhjShD57ND4jlI1lIOu8MP/ZbPhkMkVsQK4I/lU+bpSZqkcVKHt2RtV+biM9S+upbjl0QG2jawpy2EQC0SY0Lm2oOTeiCGjkFMdZQFHFEdR30Rsx9s1HCDC6dglC21dY1YMCLQWe6rN7xdo8q/DffyXOtxHTGeyrJMHTRMbCc4ZjRNEzjipjev4+zyIVNHnV6/NWFqX4sfbx8SMi/R5if/Wb2ks0KIdTGPQkXG+XBWeJqA+nWmbGpsM2DoYsKi5QGJAHEwBq+4NA9FlEhN/63i5+9x1qpzf7lSen+CCnxA==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id D2391180012D;
	Sat, 28 Feb 2026 01:26:42 +0000 (UTC)
Date: Sat, 28 Feb 2026 10:26:41 +0900 (JST)
Message-Id: <20260228.102641.702865761508670909.fujita@bee>
To: gary@garyguo.net
Cc: a.hindborg@kernel.org, tomo@aliasing.net, ojeda@kernel.org,
 dirk.behme@de.bosch.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tglx@kernel.org, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v2] rust: hrtimer: Restrict expires() to safe contexts
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <DGPQVSXND3M9.1738YQZSFDNDJ@garyguo.net>
References: <DGOYGXQ1JWJ2.7F00MTVQPUKA@garyguo.net>
	<87qzq7bbig.fsf@t14s.mail-host-address-is-not-set>
	<DGPQVSXND3M9.1738YQZSFDNDJ@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FMujo4XJ9hQV9CPE1PzeJrG0bwRqUbVZ
X-Authority-Info-Out: v=2.4 cv=YsgChoYX c=1 sm=1 tr=0 ts=69a24457
 cx=c_apl:c_apl_out:c_pps a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=_2yia0w1AAAA:8 a=h38X0v18AAAA:8 a=ZvQN2bS3E4ssKD8-FuQA:9 a=CjuIK1q_8ugA:10
 a=4yAS8WwzZ1jAEY03B-5r:22 a=hjDv5vYt9AxPTMVfK17q:22
X-Proofpoint-ORIG-GUID: FMujo4XJ9hQV9CPE1PzeJrG0bwRqUbVZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDAxMSBTYWx0ZWRfX0G/pygKCi9Mv
 Vh/PPegwo+o8cbzqQhgc3Hl9Wx9rhL/LMEioMJnkjhASjdYdcuo4bj56B/eyiWMDhHBNtAg0YAu
 fiPlfOsA0ThQjujLCMuI0nWdCMXeqbb6c9nNn7D9+eOHGstu34dmg+NXavd0TAncTvf7+wVGVuP
 IUdgs5HlqC6dmKYC8TnGQBEiKmkRk4BIIq2yik0sT+QslH2r4lGVqR0demmP2lKhV/nmwoJRmt9
 SFP2X4BABrv6WzzNeH1sDFpLr0Z1owlX2GXFWSIN7MeVDrENEbj91fnqCw1T2mz62MELXPtdZMT
 WDjx3pmxhIP6b+01w2PxQ3XVPAHPu+7PQSokpZeVVvwzYORdw+WkvJtQNJHEJ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 clxscore=1030 spamscore=0 phishscore=0 mlxlogscore=699
 suspectscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602280011
X-JNJ: AAAAAAABL6nowZiawVjEGmpApsRWptEFEk6NOYgPxYxd1iuZbgOJ45UntKWOHtCdObKT37ceiBUtWQQnAIXvPifjP9rBROUDpLYCSYweXzBsyPRLwEw4pr2vAQx0w2M7m1sGYcNoNApzKeE7UzagwM8sPFc/IR+2992COM+b86p4UbLUssXd9tleD4RrsvJZdugd+vDK1EiV7bcSIKS1O7+6IFnpLzLYKMWVSekrntsAngyryJYh+wPF3oqQ7JXkD9AmaggQ0MbLL10/Sh+t8NwqpWDmIBgXqWYZzOy9RvM1wh1/jRgPxvkH2P14u96zBjedIlW2rM3zzfkt7uI+Ppe1xjBw36sdJ2U/1SM2ee2jQCAZzOH5loLp6VHOpWlmlwKREUod9WSlE7rThGj/GyRM87lDF4UexQnRdAhcANPRvhJ+EIJcO1X73cIyhmioUjPMtJ7DB87qC53lR7oNOxoNKfeMf8eneZ/6n9jATn1WfhtB0ZqxSplOKwIvmnQ8MOMNJjJjLTTUwZEAqvcn/JZ6IJN5tSzor7nHXuTtQoeZoVRMSFeqc6OfYo48Wm60WM894cdO/3Ladzz+Xpnyl3WKx7Nv9HWEKjytiWsMDkCIrwjqkdTcT7thLi6MJ6kBQXuW7u5ngOk7mRBuONN15+ygKDeGO3YeDHxTIcDlLXXg6HyiNRpltSVUMyd9oZKSUu47fRjFmxK52y0cyE9XGotkgugW4ZRitgPdcho3AESoChupdy8gNK5/JSccEr+M1kNYWlR2MKmCBh9rPPerF91hi2MYkt2fl3CwYIfXuEewhEX3QfM18TvS3yweaiM0dMBQ+fhAWZszZPTPX7Tg4z5b542C9x1jumkPds0Zb2GzoA==

On Fri, 27 Feb 2026 12:32:05 +0000
"Gary Guo" <gary@garyguo.net> wrote:

> On Thu Feb 26, 2026 at 6:33 PM GMT, Andreas Hindborg wrote:
>> "Gary Guo" <gary@garyguo.net> writes:
>>
>>> On Thu Feb 26, 2026 at 1:19 PM GMT, Andreas Hindborg wrote:
>>>> FUJITA Tomonori <tomo@aliasing.net> writes:
>>>>
>>>>> On Thu, 26 Feb 2026 11:42:39 +0000
>>>>> "Gary Guo" <gary@garyguo.net> wrote:
>>>>>
>>>>> >> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>>>>> >> index 856d2d929a00..78e2343fd016 100644
>>>>> >> --- a/rust/kernel/time/hrtimer.rs
>>>>> >> +++ b/rust/kernel/time/hrtimer.rs
>>>>> >> @@ -224,27 +224,39 @@ pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64
>>>>> >>          self.forward(HrTimerInstant::<T>::now(), interval)
>>>>> >>      }
>>>>> >>
>>>>> >> +    /// Return the time expiry for this [`HrTimer`].
>>>>> >> +    ///
>>>>> >> +    /// # Safety
>>>>> >> +    ///
>>>>> >> +    /// - `self_ptr` must point to a valid `Self`.
>>>>> >> +    /// - The caller must either have exclusive access to the data pointed to by `self_ptr`, or be
>>>>> >> +    ///   within the context of the timer callback.
>>>>> >> +    #[inline]
>>>>> >> +    unsafe fn raw_expires(self_ptr: *const Self) -> HrTimerInstant<T>
>>>>> >
>>>>> > I guess the signature of this can also be
>>>>> >
>>>>> > `unsafe fn raw_expires(&self) -> HrTimerInstant<T>`? Then you can remove the
>>>>> > first safety requirement.
>>>>>
>>>>> Thanks, I've updated the signature to use &self.
>>>>>
>>>>> Andreas, this breaks the consistency with raw_forward. Is this
>>>>> acceptable?
>>>>
>>>> If we do this, we get to argue that the NonNull we have in the callback context
>>>> is convertible to a reference. Either way is fine with me.
>>>>
>>>> If you change this to a reference, then I think we should rename the function to
>>>> `expires_unchecked`. The `raw` usually refers to operations on pointers rather
>>>> than references.
>>>
>>> Does it make sense to simply have `HrTimerCallback<'a, T: ...>(&'a HrTimer<T>)`?
>>
>> I assume you mean `HrTimerCallbackContext`.
>>
>> Could it be a mut reference? We are supposed to have exclusive access
>> when we have the context.
> 
> If `Pin<&mut Hrtimer>` would work, then we can perhaps remove the
> `HrTimerCallbackContext` type and just pass a `Pin<&mut HrTimer>` to the callback?

During the callback, ArcTimerHandle still holds Arc<T>, and the
callback receives ArcBorrow<T>. Creating Pin<&mut HrTimer<T>> would
cause aliasing between &HrTimer<T> and &mut HrTimer<T>?

