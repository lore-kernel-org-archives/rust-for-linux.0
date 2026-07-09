Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9FF4DB577;
	Thu,  9 Jul 2026 18:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621138; cv=none; b=NK0USoyW9IRdeTSUAijvBvmkuFM2ttp5xhMtjrHkulVRo2KlOtuUGcJvfRDQTbfjeCzDqJoDpMKpnHyVfsA6tVmrqgq3LFT2hVHGFASc53ulsXifoVQVDMTMnLCuBysWfMroM41rG1ojO9kjMtHxqYKKNrk48eexe7qvZIQkMaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621138; c=relaxed/simple;
	bh=a7oxLAGaNkcB3tQfCgq+b3/RwKTl/Z6/YS2dQiTjNt8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=GE8HPmpwk97eWJ5t4CDESmshCGy/0YpnLZWJFVL5rCBb7rZI+q0w5lYlASSOUoqzWBF+yep72C4IXWkRo568fVDcOc5RgdFC+t7WlIAsIHTgqLyVtefrOweT9pAWSJebhIxv7bt7pVY4CROEuetVHpXufaPZdZuSwW10IdpDAR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=pSWQT8dX; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="pSWQT8dX"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 669IImGW1987563
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 9 Jul 2026 11:18:49 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 669IImGW1987563
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1783621129;
	bh=DbByMtnI99z40g9OS8AsGPosrrs4ja/b+2xKWC+Cc1Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=pSWQT8dXMy3jbTnATTP27fAF6QMd24Aod/pWssAxxyE/4KTmHHNpVLE3obwo5IHQN
	 JqDYVyVCu5MpS3wlJwJ67Dm+uAnpzPwe7P3ZG2fpaJ1A1GwPWj69fwBhYHeqaTzNlP
	 avjPcUONif5+d03+QL6ZqBsBA9NersrziWuKoMMIpNhLvhn5hHFnc3S1RvR3YPX52k
	 wIGb6GOj7YDg/98lCmsoOdoik6ESqUEPrJQnjpqlaBFYhyApVaZXFfufuoSYXvWGiC
	 Z0Dygin29hMPAiSwRhkOsfjlUM1QY7wK6b/AkP3WiRGyn3uUSJxzjM7yahogp6Aniv
	 3TJ3N9K//3ynw==
Date: Thu, 09 Jul 2026 11:18:41 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Matthew Wilcox <willy@infradead.org>
CC: Kees Cook <kees@kernel.org>, ksummit@lists.linux.dev,
        Danilo Krummrich <dakr@kernel.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: [TECH TOPIC] Implementing malloc
User-Agent: K-9 Mail for Android
In-Reply-To: <CANiq72nQ=BmM0GRVrcmXHfE6VqD2hsssxqJEE40TirDiy82+wA@mail.gmail.com>
References: <akKBVsFBro_4QM74@casper.infradead.org> <202607090956.6381F35@keescook> <ak_WOfpcaZIuh99t@casper.infradead.org> <CANiq72nQ=BmM0GRVrcmXHfE6VqD2hsssxqJEE40TirDiy82+wA@mail.gmail.com>
Message-ID: <1F884E12-63DA-4A65-A811-C2D40FD9B5F7@zytor.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 9, 2026 10:40:55 AM PDT, Miguel Ojeda <miguel=2Eojeda=2Esandonis@gm=
ail=2Ecom> wrote:
>On Thu, Jul 9, 2026 at 7:13=E2=80=AFPM Matthew Wilcox <willy@infradead=2E=
org> wrote:
>>
>> What I really don't want to see is a whole pile of Rust changes to
>> accommodate having to pass GFP flags to memory allocations=2E  Would th=
at
>> be a better vehicle for the discussion?
>
>Currently we already pass the GFP flags and support different allocators=
=2E
>
>For context, initially we used a vendored `alloc` crate, because we
>were trying to see if upstream could give us what we needed=2E
>
>Then in 2024 (v6=2E10) we were able to drop the vendored copy by using a
>workaround by Wedson that allowed us to pass the GFP flags and avoided
>our reliance on upstream's allocator unstable feature:
>
>  b6a006e21b82 ("rust: alloc: introduce allocation flags")
>
>Later that year (v6=2E13), we couldn't wait much more, so we ended up
>implementing our own `alloc` module and allocator support on our side
>by Danilo:
>
>  b7a084ba4fbb ("rust: alloc: add `Allocator` trait")
>
>Cc'ing rust-for-linux and Danilo=2E
>
>Cheers,
>Miguel
>
>

In case it was not obvious, my comment was meant to be ironic (reductio ad=
 absurdum)=2E

In fact, I'm surprised and worried to hear how recent this was=2E This und=
erscores my main concern with Rust, which is that it seems to have *very* d=
ifferent stability criteria than the C code, where we are not allowed to re=
quire anything that hasn't been in gcc for 5-10 years, after which the clan=
g people discover they never implemented it and so they ask for another 5+ =
years of keeping the old-syle or fallback code=2E

