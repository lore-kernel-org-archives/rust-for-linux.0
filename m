Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CA851C352;
	Tue,  8 Sep 2026 11:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866419; cv=none; b=SBsrkvS5F1+UCUnhgPl42qAtfO4i+T1BOkk1wF1hgjMDbLx27wDDHo5HRrhFrdl2dwl9v4b+rhThF/5zQwXYIaR02udwUsZX2UZmezQmP+Akgsw5y9/FW/kQqAuMaTzhAPGV2iat0mKDKqDg+57c0f/UNaaGHQoBKUP/0GjHWO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866419; c=relaxed/simple;
	bh=Fn1URNTKhYfk5Nkef6PweTEh5tOJSlthScFybnrsnoU=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JtCyTaTwL9LA9zHBkUar7p8tmX7tA4SwG9qw/ek9E50S79I+dOOxs/bLvR2LrUnsnFKfLfVUeksaOVYa4G3bbXqcMe3PcmPiQv07vw5P0nVgjELGmZ3yVolzWU5ksDqR5G4wJgnfZWpzaJQOrK0BUjL6tiTOlRkehKSEpVO3u+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=L5kK64A0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZpFNT1PP; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="L5kK64A0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZpFNT1PP"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 08B441D00100;
	Tue,  8 Sep 2026 07:20:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 08 Sep 2026 07:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788866405;
	 x=1788952805; bh=Dx5eBO920oW3jNHbAB8VFAqYBHFHWGYSzShV91Wo+gw=; b=
	L5kK64A0RnBz0GWpw5B5hVIE4UvsJOpluCyvxzKG/t6UTKER2Y67rQRRxcCOtVyA
	vV2so33GPzWsCpl5/AzZ02jLyPtkbFhWFryqqJi+TCubOSgJZ/1GhrnxwPJ8TN2s
	iAN5NKwRDKC+LqjFLaB/rqXVqv3NZ+BQs2cBTLvyeFjFgfVQanfURVSZl0FAyvyZ
	GI3kvVBpeIBIKLbQtnW/PoSeGzc01vQltqCpD0MHduiSnWvOCEYqfdTidhiAz4r5
	FlpbJ5mjpDVmjGfaT+inZ1vbbRpoI756Abq2GPzs7U0Q+sptGZRhkfs2d94qO2XB
	D+bxkjt2UsG4EX6ErN8WAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788866405; x=
	1788952805; bh=Dx5eBO920oW3jNHbAB8VFAqYBHFHWGYSzShV91Wo+gw=; b=Z
	pFNT1PPCBDqDEmm5y6hYeDQx+y2noGMp1mxmclddOVDD+Y47nGyuc4Jz2rK9tDrj
	59K9mZKGW/laG1eAZUygSpY0CV+vL4upGRV3IX5W4NIyuzyW6kHhIy7NZ36nVqJ0
	u75Cn04/if3eF2/uCJ0naYtafl3sbHw5Wu7FKmxUvfgQaxk6c4iU76WIohDONZiu
	4TfvSRwkvoq1jCLGdfQCSX7khVznyjj7/9g+mc5pEbpZkjoUBcPPueg1CVeCQxEh
	5kVwYHmk8EtU125bENM4uSBdYmoSiZPS9+lHnTTNqQi5IpnSJlDuZHvBS8sO/Mdu
	wsaVQusbP/Y9OetVrCUEw==
X-ME-Sender: <xms:Ze-famcRk4HB3g2ffiYAgisUtQxKNKHt_Uhpp4e1K8w1JMuniFHTbw>
    <xme:Ze-fah36_b8saWx3Z_vGEgwFK8itkQ00pI2mfnhoPxEjIuER-kI4NKO4m2jZjj7Vs
    gdyIFzvE1zMBinkXfm4K22ZsJ8obKpINsU4DZJwL5auHK21nh5btLs>
X-ME-Received: <xmr:Ze-farlxVw2WbHJzS5V2xLulONdCHIgNLUCiJmfEQ_cnleOlI8_cXUuHiH6GG3cJgjR_59FS5df71Q5VRSMjmtRW>
X-ME-Proxy-Cause: dmFkZTFhivq0pINEs8Xvdkwy3YlsP5VCfFULW51B/BlxSHu0NqSzrchHPQiHIm9FNMYx3k
    /VGERERIA+SKDLQk2j2UMCEOKZP1kfpn97veqejR+SME6AcSkdGpo0IZV/1CaBrCRsKHfa
    B0ZKWA1IDoGxc/MOuYkTnhBWFKlypHm3/qwwLRlSBzdqi/piZHc68zPuklGXnKCjUJ6v4x
    KjyZHCcJ/6L71tFGmU0qFr+wd7jlvXVMZ6Gm4OJ9z0oP91+U7gjYnf+6fK/s8rL5HbTj9e
    +3ngoSfHMHccbovHPwQCeBtcRghCM8uIe6b4zWlBnASMED3JYnPeZvv3k3Fb1q2e0UfNeg
    QzW9izpUlGSoX3jOdikqxExwMu51nZY+pYbfySsxDSMgIXOJpCRR7l046hj98O7jtLJJAC
    H1oRitGKLV6QG15J0HW3e3ZU1ykft8hnF/GElIsxC8cEmkhkwP+/IeK+uCqonDrXpbIP2/
    chwrqtFKnZCzwjgAlw69vaHBoRdjX8aB3r6V+tnH3OI1zac29mBHYwj64P0v79fJvK1UwD
    oAkLW9gFAi5CCtg01YB+L0tlTFcvXwW9KuSIy646b8idOkIRC3ljhBajaweBmME6G8YTBo
    cx3leh6UzhBfFudbISQ/jbwz8d9e41cILC8DGHOcbCTLwfOAMbIA/mhFmu7g
X-ME-Proxy: <xmx:Ze-faqZIBUkoEWFkMzGhavMWM_jNkMp21dyMFugJtdvUMf6LJYV5mg>
    <xmx:Ze-fahqvh5HZEEroypHfnbsdGqY567Y7qVgqu9VbyhToBHGfLn0Ymw>
    <xmx:Ze-faojdX9jqxFjIUVlz73i4Pq9QcII1O6RixTcvpdivj2vXYOubSQ>
    <xmx:Ze-faryTZcPUKp-n7A3sCvZ8B8qAKGl28HTfwhFv6Q9plmp5lc7ReA>
    <xmx:Ze-faoa6EB6A3Hm38Y7ozgzXqBS7oBjqXSzVD-iVfCqZHwgYoovNmvcn>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 07:20:00 -0400 (EDT)
Date: Tue, 08 Sep 2026 20:19:58 +0900 (JST)
Message-Id: <20260908.201958.1344474905985997937.tomo@flapping.org>
To: mike@fireburn.co.uk
Cc: rust-for-linux@vger.kernel.org, a.hindborg@kernel.org,
 boqun@kernel.org, fujita.tomonori@gmail.com, frederic@kernel.org,
 lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 9/9] rust: time: add ktime_get_real_seconds
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20260826162851.2497-10-mike@fireburn.co.uk>
References: <20260826162851.2497-1-mike@fireburn.co.uk>
	<20260826162851.2497-10-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 17:28:43 +0100
Mike Lothian <mike@fireburn.co.uk> wrote:

> Reading an `Instant<RealTime>` is the wrong tool for a caller that only
> wants a calendar time in seconds: it takes a full nanosecond timestamp and
> then needs a 64-bit division to get back to what the timekeeping core
> already maintains as a plain seconds field.
> 
> Wrap `ktime_get_real_seconds()`, which is that field. Document the property
> that matters at the call site and that the type cannot express: the value
> follows CLOCK_REALTIME, so it is not monotonic and can move in either
> direction.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
> ---
>  rust/kernel/time.rs | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

I could not find a user of this in the posted series, including the
drm/vino v3 one, which looks like it uses `Instant<Monotonic>`
everywhere.  Where can I see the code that calls this, and what does
it do with the value? I would like to see the use case before judging
what this should return.

