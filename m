Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA2C2C3768;
	Wed, 11 Mar 2026 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234355; cv=none; b=iWJY7QnwjpGjOAFvAe/qxKFu+bS0i7AQHKEEb/rYFQyoj+rsFoQil5aAs9yjbh73vkzfEXdaAkCFhRIWaPM31avrMY+H52Yr1r6TytKRpcJje3XkmIzjdazOnBiXpITtA2FANqXb0+vkmjkCPJyuPX99db/6wbmhxOCjFvHxVDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234355; c=relaxed/simple;
	bh=nbZBUsdJcvcRYXPC15YGXFPTjlIlWJ4Gu6T6ZsV2KtY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=cx9UrnHfYsBC6gMFVXxBdJg3bKrGObTdz/xIrK8CqWpS1NLxv15UKUEQ982PERroQpeqLCxvIWec1IomY2s02QMkT/Uq8+2SRYrvQbQqfJjbTp6qrMCB/spWfjFmxaBd/2UgzDvwIMENVriBmMfLbG+zuaYFrW6G/+yULAmwCKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EvkrumX3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EvkrumX3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5913C19425;
	Wed, 11 Mar 2026 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773234355;
	bh=nbZBUsdJcvcRYXPC15YGXFPTjlIlWJ4Gu6T6ZsV2KtY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=EvkrumX33ovdE3XY7rAl0LGIpmzKFuCtSoK0XC5sVrCq4wBOqxNrlndO6w4HOHGO8
	 jLWVOwwUXQWzAOnsw9Yt1RLYHA5IDzWMh+XHqnPu5u4CK0XoWNA9UWNjOc0QfnNyYQ
	 YRukM9Bo8TdJyktArOzBJGJqhPdquElra7adPC3ikoYJn28YKwy4MeoI0Oq1YeMhVj
	 eHWodu0AL8oBTCYm24/VU2jD9wgz99jcS6CUCHRYa7Bq3VHTtCczcnYM25CEMYfFGf
	 6ptXM6KcayHRoi+OCyzuU/ThLqoMNZwGGpS4Oeq5HiYsxH37sFdObnEfdIvzLEHVSx
	 PES6/OYo8y29A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 14:05:52 +0100
Message-Id: <DGZZ47IBKTHD.3BB0V807G3V37@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: gsp: fix UB in DmaGspMem pointer
 accessors
Cc: <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260309225408.27714-1-dakr@kernel.org>
 <DGYQCXD2VH23.3D54NHJH6I0VA@garyguo.net>
 <DGZ1SFR07FY8.26IXX819VFGC5@kernel.org>
 <DGZYZOXZE7XU.YV5O6SOIR6KS@garyguo.net>
In-Reply-To: <DGZYZOXZE7XU.YV5O6SOIR6KS@garyguo.net>

On Wed Mar 11, 2026 at 1:59 PM CET, Gary Guo wrote:
> On Tue Mar 10, 2026 at 10:58 AM GMT, Danilo Krummrich wrote:
>> On Tue Mar 10, 2026 at 3:01 AM CET, Gary Guo wrote:
>>>> +// TODO: Revert to private once `IoView` projections replace the `gsp=
_mem` module.
>>>> +pub(in crate::gsp) struct Msgq {
>>>
>>> These could all be `(in super)`?
>>
>> Yes, or just pub(super). However, that's not the case for the functions =
in the
>> gsp_mem module, they could be pub(in super::super) though. But I think I=
 prefer
>> pub(in crate::gsp) for those.
>>
>>>> +    pub(in crate::gsp) fn gsp_write_ptr(qs: &CoherentAllocation<GspMe=
m>) -> u32 {
>>>> +        // PANIC: A `dma::CoherentAllocation` always contains at leas=
t one element.
>>>> +        || -> Result<u32> { Ok(dma_read!(qs, [0]?.gspq.tx.0.writePtr)=
 % MSGQ_NUM_PAGES) }().unwrap()
>>>
>>> I wonder if I should add a panicking variant of index projection for th=
is case.
>>> Perhaps of syntax `[index]!`.
>>>
>>> We could also make the existing `[index]` becoming a panicking one inst=
ead of
>>> `build_error!` one. It is more consistent with Rust index operator that=
 way.
>>
>> I thought the same, as something like this `[n]?.ptes[i]` looks a bit od=
d.
>>
>> However, I think we ideally want both variants (I like your `[i]!` propo=
sal
>> above), since generally users should have the choice (as they also have =
with a
>> slice through get()). For instance, the index could come from userspace.=
 Sure,
>> you can always validate the index in advance, but having a fallible vari=
ant is a
>> bit nicer.
>
> I'm not proposing removal of the fallible variant, just that we can make =
the
> infallible one use panicking instead of `build_error!`.

SGTM.
