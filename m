Received: from flow-b7-smtp.messagingengine.com (flow-b7-smtp.messagingengine.com [202.12.124.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE3D2E54B6
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 13:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785505718; cv=none; b=kP1hgbPQ9dpqs0hpEug4hfrhXqMY0OboPWZa+PMNPQay9C7H/FTHxqZi7p6EFz+qE91w85a16uY4TF7O8HhcosFhTJrdIZKbFdAmpLCh4jW2hKWJ40c1pJUpXgrpEuXnfbcrZ4FimYg6kx+EmLBGjjH1b6D5l6RHdewwmzOqr38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785505718; c=relaxed/simple;
	bh=xkqL5M8U00Z/W9ZiDI5dtKWzRST/I8qxj4WESWKNuLI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qDvYrEJW4dRm8DdWO53VjI2yuPRBJ36IAz1n8dSfQ3YIWtmQWQHHf4/Ip8jWXO3itaeTF3Cw/m6Qp93qXSrY8je+CkwaxK5ebNuvtSrsaHiCj+3sG+eOdWvPdqS6ErnxnjsWnUwo3PDKO6WiYlTQ81gmyfUxBkgKMpQ7HwyEVz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=DGT6U7dv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pYMzH5D1; arc=none smtp.client-ip=202.12.124.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="DGT6U7dv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pYMzH5D1"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 6E9271300087;
	Fri, 31 Jul 2026 09:48:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 31 Jul 2026 09:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1785505715;
	 x=1785509315; bh=A1SAuJeYB6lFdAD7ODagJ7q/m5U4DkTomBcYz4A9xJU=; b=
	DGT6U7dvNKKNYdFg7y5QS9lWDbf0lCWYHZTTENuoPALV2H428NMmjtKyz/OKAROB
	g8jYoBikVHalukLTzrDbDW46zRmZgkFa8JplLfRx+Qg0HJxXfUFPnll6wy7Bm4qb
	BI3VnYPuJLDpVobBJYs270FgmD9Zm82xZx9VWlOPZ4PEQqssN2GpRtb0700OrKtn
	aAIHxz2tZR96orJKa2xZdWAdYaBAf2ffygz6wdU/1kOKiuu+Kx+P4ax661X5qkw/
	mkJGOghbtKyHoLZMPgHixSbA6TtrR8q1XRFDKY79xd7+j+Jh8ZH2nzyLd2MJr6Hf
	C0195+HdQRQ+ZHKoK1mS2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785505715; x=
	1785509315; bh=A1SAuJeYB6lFdAD7ODagJ7q/m5U4DkTomBcYz4A9xJU=; b=p
	YMzH5D1iUSH2opSs60SZZq8bAKnLipxxZkZrAecfsSizsQNrXan0tVem0UJ6AcYU
	go347QAnlk2dsYk3n6Xh6NuX3tdU3qgQkDDFXq1JRwtk01zt81dJZ9dxuLesG1AQ
	BQdr9De0lLfN4EMIr4a2VooChyNsdiY4tEfyHxK9pImKK//1HvYw9LQWJ1rE2LJ+
	MeaBFYkCIA3/dhIAQvmnZnsmcdtWBGLJDfy8Ka4B8/X6IS94ttw9uWi5tcaKRcHB
	rwLfrxVeXGY8C2VT/lqIFXHIzVifiAaaNa02tI8iStrEbqomGjf+NuoPMpxeUBSX
	x/DE94rDZiJkykWRWEZOg==
X-ME-Sender: <xms:sqdsanJ5nyLAVi33trulInzXOhw-V6jYWz0lid1y4L5f-XnswmkXhA>
    <xme:sqdsarCg_fZSVLGVaQtnMpUX1YSvQVuX8-6ZbexWpQB39eNgmYQxaUIweL8hxg33y
    zkklAzZS-evucVBXeHLR_e8_OL93GSz60joO_QLDiSVdSpqSlr1zsY>
X-ME-Received: <xmr:sqdsatCRcyEsT18nNYRNuBoohOj8H7Pdd25l1lFGI5LxBuYebFVecsnFnNgw9LUn-qUzV11zwzSL4QP1WG-avjPo>
X-ME-Proxy-Cause: dmFkZTE2lBE6+Dl7cyaCfbabX9DaFA2eC+YpUr20EfsJ5MEJk68HXi9Z2CI+VdaBtlfufF
    WtFArhqvxVqmFwcxxiD7r5LtfjXoKOp/DZvxTJrjiKKmeiHDFPGqedhjrokTNGVC3A1bQ9
    ci9W5WozvziwGHoUEHuk9AK7AWjqYJdXAWamP2n7DrqbIhY4/xAvZTBUrEBR7aSmVR1uxl
    G7meTdI2pFdS/HVCNWKE7f90sSV6sBokHldEJ1UaDIyZcyPemiPXwJWlyGep0ujTO/ar6+
    T/IM1ms13S0eyyGQoPV256E4uKvxjW9KSJpA6U1FQ6MyGD4esoFqId1bSZjMcDUiBTi3bh
    iUX3d/cX0kr/Cyo4UXZ/2dnLV4TsoFDqfLh50D8blPoUbgyfteWCl4BpnQ70SkM88jo6Fa
    t+pTGC3qVhduTJqKkwSBf8nuixtEM5cPIuFvBVwusstmVu4vsWv8LxymJfgX0O09NbwVfg
    Y3pnj9EFTVvuYfRnwKyz3CoGGw+cSGFoKunGCEfEMH+VVvBti/mNP/IJsxrSzaViFTZr2m
    Ctjg2MqEW4NMSTJTj2YqTcp2UpNtCLQ+jT0+yuso8R73vvRhcM1ICag3PLH2ss6+PzC1km
    +JatXvJuNOzFndEgc3S6/t9gXte43zmleMg5r5TI0Q0Vq3I1+ucBGtHPjfFg
X-ME-Proxy: <xmx:sqdsasmspsY3YE_eR4fEEmK-NRsAx8xAy1swUy72JdLCQkJpKpx0zA>
    <xmx:sqdsarj8ByKKd0m0cPA_TQ3YJy6K3dpM0ikLMymjwsTxWahN_ckQBA>
    <xmx:sqdsalcw7oYfZnzEWAgA4N0yT54r-rXMA9hJ5O56LXOk1pseQLf1dQ>
    <xmx:sqdsarB6XZOvQNPMp4ad__h4uwPEBXHDF6AIcCo23KDf_AqYcPMOmg>
    <xmx:s6dsalVOoOap5CthcMPparkmEUw-B_kw1eGSzwt_LieIDuE3acGmtX1o>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 09:48:28 -0400 (EDT)
Date: Fri, 31 Jul 2026 22:48:25 +0900 (JST)
Message-Id: <20260731.224825.536098581345512332.tomo@flapping.org>
To: gary@garyguo.net
Cc: a.hindborg@kernel.org, tomo@flapping.org, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gregkh@linuxfoundation.org, ojeda@kernel.org,
 tkjos@android.com, acourbot@nvidia.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v4 0/7] rust: use Delta instead of raw jiffies for
 timeouts and delays
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DKBXI6A044JX.3OXFT3R8DIK2K@garyguo.net>
References: <20260722214951.72941-1-tomo@flapping.org>
	<DKBXI6A044JX.3OXFT3R8DIK2K@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 30 Jul 2026 14:09:59 +0100
"Gary Guo" <gary@garyguo.net> wrote:

> On Wed Jul 22, 2026 at 10:49 PM BST, FUJITA Tomonori wrote:
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> CondVar::wait_interruptible_timeout() and Queue::enqueue_delayed() use
>> a raw jiffies count (a plain c_ulong alias with no type
>> safety). Callers have to know on their own that the value meant
>> jiffies and convert to/from it themselves, which is easy to get wrong
>> (e.g. passing a millisecond value where a jiffies value is expected).
>>
>> Both APIs just take a span of time so, they can use the Delta type
>> instead.
>>
>> This series makes Delta generic over its time unit with Nsec and Jiffy
>> types, switches CondVar and Queue to use Delta instead of raw jiffies
>> (updating binder's ioctl_freeze(), the only caller of
>> wait_interruptible_timeout()), and then removes the now-unused Jiffies
>> and Msecs type aliases.
> 
> There are more jiffy users being added so we should take this sooner than later:
> https://lore.kernel.org/rust-for-linux/20260726223613.1242940-1-dakr@kernel.org/#t
> 
> Andreas, any plan on taking this via timekeeping-next? I suppose Boqun
> could also be taken via rust-sync tree if you give an ack?

Agreed. Getting this into the next merge window would be great.

Thanks,
