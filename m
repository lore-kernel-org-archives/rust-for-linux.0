Received: from flow-b4-smtp.messagingengine.com (flow-b4-smtp.messagingengine.com [202.12.124.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FB426ACC
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 22:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783809538; cv=none; b=HtIEM7pvGDMM2L2waOzHriL3fiKDsgasV83NSy3+vHQ4j3qC2vL6AH33NKb5rdnAiXbQ26CCyFPonHvY0aQc+1V5yaZW5pieGOZwKEGVFB2yVOAAExi8dV7AkEFlWcn//1ykPTQcxuphL5ss5yMN071Kx8K+qnK0P6TlAc210/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783809538; c=relaxed/simple;
	bh=+xEm/4iT4PBor91YTBdpqnG2r+ITU5rbkztJu8claU8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KusBhaSwApteZkHenSk9mD14hdwG9m5+oVVQa6f4PHk14RQ05oyCyfSv5ZKE6jlJZffodhPqM6w78Xp8nzLgZIoipkw+HPq8yuMiR/gWKRVtA2W8/jjGiO7Iuu5gujwHkW+vkf07ac6CybvKof2JuLuwXgNkMR4ey6fPPVWjoKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=VUNQlcVF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S/+VXUzW; arc=none smtp.client-ip=202.12.124.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="VUNQlcVF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S/+VXUzW"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 8FD5513004D1;
	Sat, 11 Jul 2026 18:38:55 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 11 Jul 2026 18:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783809535;
	 x=1783813135; bh=wa6ED/l1/Qft/Zzl6e6R7ksnn4l2vtGfb9NwWOc+U3c=; b=
	VUNQlcVF3LpFN9cCWsQXcvjTvtVo9LUfCBJuulGUJa29w02vdGMf6Z9/aTrUSm/Z
	L2IzcI1Qj6DoIR9Vh8Z+Z0O0j5D7jkTDyBaeQWxELc4X4Wv15wPbQ8QIfPJp+AIS
	3ZIvX23s4woW3PoqCRpoamv5LgYbKv9IidkQDvwVYmo6aByqNIRSs4d2fyYWR+9C
	nxkakKbJShQuwcT70nrX3Uz/7ExJRoDIJAEVgrNHxNK79uh16oFD/Ij99f9HyzNJ
	MvLSvw2/hzzYCHHn+7Ia2A9sRVjWkTlgOklckbBvOCheva6EnyKJY46LHcl17u+t
	WN3JzNtPFGtp6Mk3uCxwGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783809535; x=
	1783813135; bh=wa6ED/l1/Qft/Zzl6e6R7ksnn4l2vtGfb9NwWOc+U3c=; b=S
	/+VXUzWNuVkGTy3MFsHaQTNirzm63oW4CDlmYOACy2G8n8gZxnRakj9ejlKcnh4v
	rctsLEZ/3ATP9mX9bqSQIxgQ93w/r07UxiFD5xzAOeXl0PfzrfOB8YV4ZZI8/9mt
	02oDvoasjkDNqDJ6agutk1evP/2yk2s9Hj7HaNBMptiC11+BUIgHBhxcjpmURKLV
	4cmueAyXauvk+9wAzhgoLbIVDCcGXaVHyZwlyXEafCPzV4TNrR3VGFaqqbZOKjGs
	fjRVlR9/Qqpm61BZL/u7AS9oLC2gPzfrQPxP01EAFTee3I/LUWMyZfe15L1lQJ4i
	5etf83CpDRrOlhqZCPfSQ==
X-ME-Sender: <xms:_sVSaqQIyQvmXHLAPNKS_cPvUttYmNe2nl5GOH0q-zq71vkMvnZ_hA>
    <xme:_sVSamzGujTHQmHaHajvbbl6Ph2l-k26CCjIVea9iRV7mV9P4TtFpN0QLw0yxni04
    4QUj3WwbF8dSZkpez2Lmrtka45nTqowt9I0zmOJaLP59EYOze_p5xI>
X-ME-Received: <xmr:_sVSas2RRUNKjemyTItkKXX1QMT0VSEMILGpgvDca-PIzxOXVjqKMAC8t51Umg56gcRPK7lJk1HeInr3EgNRedYt>
X-ME-Proxy-Cause: dmFkZTGtvqF4rtmbuaVJeKSx3goZPEl/hcef1CJce6RhEue2lRXfm6dx+g2RYzRDgMUwC1
    xC0mOCD06Vp3bQA7SqG3yvedgihOPCzQm4DhpnzTZvLbgM1x3sJ9pH9hkPdTp7qYq5Ce1e
    8Eoa/17MtOISIuXaWqt25EM6n6Av/fKwrRCPvv/KZlA6gUdptz/vSzghFs5p/a+PO9AqpV
    ma68UCtOfwhA5eZuQ/V1gns/dsEuVZgILLr3OT4Fsf4LatZlq+oCRawfmlUTxJL2TN7VvA
    gajLmVVn1H3pyCegFGQELnylHOr6k3OjBTC96YS1VL+qHOJYd5rG5JyhjNTVTwP12A1BiC
    PUC3JPSygNXrjabprgNFVNSYW92r/leCm7+eJvK3vA/ylfcTQv03TuFBC+4WeLd+cNS0+q
    zjbLGmb51p80k9AxKJulJ03m+zsBUcumae2PHZXqv/Te0MpU87/MFXNVexWbLTxTi71HUD
    8GUxMymVMgMKvuu++oGad7ePXe8+uK+Tz1v7FEHxYv422yYB4N3WDP2A3XZiAaDOvX/dWU
    wRT7mnaJVaNzyP8gdmUcQ6faaIf+qA72O4vUbRDuM2nDv5G2B2v4xNpkaOqrPwD/bfvhfI
    FYki2gwt4r4OYjT0U6fYYauYssfw1SHnh7tVIRsPAB/NxTrEBHfMYkaLEN/w
X-ME-Proxy: <xmx:_sVSak5QuS2ZP_GKp16o5VdQaulZ13ULztIqNhcvMWYiK0_cpLLwFg>
    <xmx:_sVSavV6Nk-rlxI1fUf8-Sf6Nzy4P3cvnjqr28LnJBZWn6s1EDVTrQ>
    <xmx:_sVSajDGHMu8bku8xX-svN5RJcG35_ZjM20prThuEJvtauqznI29hQ>
    <xmx:_sVSau6VejGSNoi7hdzMTPwmJeD7gXN49Y3heaZBpGLHfJAcZL3cZw>
    <xmx:_sVSaoWtQlWF9Jtd5HOR1uVdSWPUo83cArd-MukIpjSQBeTvTePNuLy2>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Jul 2026 18:38:53 -0400 (EDT)
Date: Sun, 12 Jul 2026 07:38:49 +0900 (JST)
Message-Id: <20260712.073849.1464463190973607209.tomo@flapping.org>
To: alessiomaroni0@gmail.com
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, boqun@kernel.org
Subject: Re: [PATCH] rust: error: use pr_warn_once! in from_errno
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20260711210919.33619-1-alessiomaroni0@gmail.com>
References: <20260711210919.33619-1-alessiomaroni0@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Sat, 11 Jul 2026 23:09:19 +0200
alessioMaroni0 <alessiomaroni0@gmail.com> wrote:

> Replace crate::pr_warn! with crate::pr_warn_once! in Error::from_errno
> to prevent logging noise if an invalid errno is repeatedly passed.
> This resolves a pending TODO in the file.
> 
> Signed-off-by: alessioMaroni0 <alessiomaroni0@gmail.com>
> ---
>  rust/kernel/error.rs | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index a56ba6309..2d3e31aff 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -123,8 +123,7 @@ pub fn from_errno(errno: crate::ffi::c_int) -> Error {
>          if let Some(error) = Self::try_from_errno(errno) {
>              error
>          } else {
> -            // TODO: Make it a `WARN_ONCE` once available.
> -            crate::pr_warn!(
> +            crate::pr_warn_once!(
>                  "attempted to create `Error` with out of range `errno`: {}\n",
>                  errno

WARN_ONCE and pr_warn_once are not the same thing.

WARN_ONCE prints a full stack trace and register dump.

pr_warn_once is just sorta of printk.

I'll add warn_once macro after the patch to add bug macro [1] is
merged.

[1] https://lore.kernel.org/rust-for-linux/20260709000103.2912159-1-tomo@aliasing.net/

