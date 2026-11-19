Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100940;
	b=EK3feYVC8DlgfZbFBfaAk/R7vt+KTQzS1qB+uD9zcPTWVTfxH4+WJvpCXY1E/pDIpY9Z
	 RMrib7/sbcjE/vHyG/C0ZlDkV+H4QKT9hjLNpEaJRASdyJSv9CLphFC6Dbsit1rMJpdiu
	 NT2X+V25Kit5Kqz7h36T635Ks6orLN/a9wOVkVgcM2xUNRAykhTvvVnqsgTDTCrNS6G6C
	 En0oKq+B3b7eTmo2j2uaYuHAUWa2BemR44eU6z/6f56m4+zCY60ZGPpOJtYcYcYMS9cZA
	 qAOVmj+CJ+Lo/MoowCrGhCudxQg57yLQKVWM1jPQHNRnrEWJ4KwwFE84Lq2ANGMaIPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=UfEaEG1JfkCAIJnh2gYW2V6ds/usdTdH+yyNEqHOfA4=;
	b=d1J6NeCDdqwW50Q8B0SxQJlMOcG7JKSmxyamELyrMVT0BDfGCndK+QWSIkzWjjf/ZyL2
	 Ft8L1nm9gEkyFugjbe/7q+Vydb5fW58iGXJaeifekFjAfQl//PBwGKLmqJh3FeJ7I5ksq
	 nOaY3hHW/fqv/0+150V4ynNb+pIAsptF0TYwiWQci0hatMltvuOHxVlKDSSr4tVVqtAad
	 KLyeqL2fMnM01cUIQFZ/eOsLDTwA2tUJPkZe9CHPfEZccLdR0O+cEgwNnGZiaNY0Cewfw
	 ddnVZfc5o2Zhj6M1Igo83N8uz0UYr+NxnHLjMwpGTaK0jEMlQNVWat+ytxxeS5Xk66Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="bzk/3z4j";
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023B7606A7C4
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 15:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 023B7606A7C4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bzk/3z4j
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-55c48582654so24287181cf.0
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 07:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795100939; x=1795705739; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UfEaEG1JfkCAIJnh2gYW2V6ds/usdTdH+yyNEqHOfA4=;
        b=bzk/3z4jzswcQyFV+twu+krdUJXE+GVIyeisxwf+iIsE3I5oibCCy36M5TTKnv8mXH
         Vq3XoQA+j8udATE8gOjcNbGtJbY4SgtNCKxorOP0T8XXG0UtcjR1vX98MS/wYAyqKIlt
         MxSSRZ5vdtLOFODZZeKz+xNYSiQ0oWyC7j11GpjtCAQlktQl/jAQgcbjb1zxOfk5bAqj
         Od6exRdKuflBW/dTejRCXKLToFiIqfWV2pCTbY3IB+41f8G9V9TbfDOohPlhhfoZPIli
         HGZE/2ME/+/bZInaV+zML+POCcIkUw92ymvgl2tJzJDs9gmBwXIBDIXJO1qW9ipl2fk0
         JJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100939; x=1795705739;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UfEaEG1JfkCAIJnh2gYW2V6ds/usdTdH+yyNEqHOfA4=;
        b=j5zjKe6HNxsykNy7r5znuDhWoHKassZ81CHPnrIWtpa7PFWvBjflfKqg0qhk8U64SG
         JLLV3yCFNP8lx/p0Ga6gAi/cZJrQIo3wZAe8SRunLoI+dC3kToHZjk8fejtcnPLQbCHw
         IMLwni7F9g7l8k1dukaFmKXCmEFPsNOMpjL8llQs79slyXW9/rsQMPwDXFCdDoOnDYMy
         ovi/fvPoEtjHFneEF+h/Gw+B5AiXh8yrFUhiRtJzZc7bSblyPNSh/f6AktlPSZ7qJCi3
         Z5yhPXVq3KznDZorm/G/SVCWwyvD2t/y33/3qm1AS3HQsl+vbAiHxIpKbMUZ8Z/OkDyB
         6MXg==
X-Forwarded-Encrypted: i=1; AL+hErFnF18YCx5jBp55Npzqr8J/Ylmrsz9yBg1zK5UkIPX0Unrt3qUO7o/3om9+EtcGPPR6nv5CanM1VIgZdTkoYw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9SGacf560zc+0Q5R+P2BPlCYSJ2bHaTQGUElCm7M1anky/0AIO
	xt/zknTZnGR+VV+Z4FaeaH7Ue83ioD7nAlKlzcGt9BTUVMS4Gx0IqpC66E2xv5L9pS8=
X-Gm-Gg: AYBFou2Hm31OTX3GBsGQXo6T1Vq840zJujAfBXafFo8uCrIecngQhhMlJ1UECIXeWvQ
	ywxdWI9JtNXEieYWnYvlPPehUTJh9UzXpGZQXgN6+1qWEF6o4iD0pdI00vP7wCeoK7+EWgefeqh
	wHQNjFhZ/XzBQTgL0DLyJNBGfOflvTmMexbdRIf+OaElbpZ8Qh09fRssrzSY3V7uttpILqEF10u
	JKOnDF0uh6Y0cDUM0GzHWgiPn0P29rgtfS2pMvQGh+cS1+Gv3EM+ObJBJh/wW+siJIg3RUgmG1Q
	qizpejhZfbTmwhMnpe8DarJc7hFGMWUt3aq1IADHxlDYA9CZm1xkMRcWndif3qrLbyY4yBmQLfe
	gGU/iIL/nU9SvTpm1PlwRka6Lt++Armpqp7VQ11fO36VHm0/XqUxlGhmH6Fzjpkb4bswHNv6pbz
	bUHHyaZt3JWycjCZNE4KnJEJ2B5Xqu8js3ForWanH1lEVw7/nDy/V30zjHd3mWXXYCi2776BicF
	N9INWfKoYMspOO65wZjkY+nKdKrexSvjaLLz4ElT9nSm9l8lvWj8Bx5Wmg00AYaJ/zk5mf4uV4W
	pRc+lQ==
X-Received: by 2002:a05:622a:4e06:b0:535:2e9:e474 with SMTP id d75a77b69052e-55d76993c6amr3007681cf.4.1795100938908;
        Thu, 19 Nov 2026 07:08:58 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d669bb8d4sm25325301cf.3.2026.11.19.07.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:08:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xU3kv-00000000xbi-0Yi3;
	Thu, 19 Nov 2026 11:08:57 -0400
Date: Thu, 19 Nov 2026 11:08:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, iommu@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261119150857.GK3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>
 <20261118160909.GC3115493@ziepe.ca>
 <fe60c0bd-1ee2-4b33-8ca3-564ee08e6db5@arm.com>
 <CF2BE3BB-4F16-49FC-8421-B2B823BB7BB4@collabora.com>
 <20261119143151.GH3115493@ziepe.ca>
 <32a64e144c11bec72908ce143044773808be5115.camel@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32a64e144c11bec72908ce143044773808be5115.camel@collabora.com>

On Thu, Nov 19, 2026 at 09:52:59AM -0500, Nicolas Dufresne wrote:
> Le jeudi 19 novembre 2026 à 10:31 -0400, Jason Gunthorpe a écrit :
> > With the additional twist that alot of embedded HW has apparently
> > choosen to not implement SSID but instead has a pool of SIDs that one
> > device can use, functionally similar to SSID.
> > 
> > We'd need also API support for unbundling the DT iommus=[] SID list
> > into something that the SIDs can be attached more like a PASID.  That
> > need, I think, has become clear with all the DT tricks and fake busses
> > to try to work around this issue. :|
> 
> The word "fake" never flies with the DT maintainers. On that subject, I still
> don't know what you mean with iommus=[].

When you write your DT you can list all the iommu streams in one
iommus property. Like this randomly picked out of the DT files:

        iommus = <&sysmmu_decon0x>, <&sysmmu_decon1x>;

If you do that then Linux sets the struct device containing it to
put the same paging domain on all of those iommus.

It doesn't make any sense to open code this in drivers when you can
just have the core code do it by writing your DT to match how the
driver wants to work...

Jason
