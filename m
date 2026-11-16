Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794835058;
	b=rDIMpWlvWDKKDjt0DayHbaFx4mwmUMvig61my8qtf7MImvHHhwuLWjPTD9bBhdL1Xq8X
	 5HA1iQ/YnuIyxSvci2GE/RcDA6jpZuCCocPFTf9ZUY/NyZq6JUDU9L5bwEEjmN/2z+ue0
	 IDRIObd+W5KpnG1Ytu30GeO0HuYVqmcRhGh1EEzFM8Ee9J6EgfQp/nzgdEKURQJTlUi4p
	 0oI9OxG/9bUL4YOxXNnI8fDid1d3m0eKacDG1mrzV7+7HUS23kUDuHwDUfFfPhJvdlpPY
	 6bye24MT0ADgrVqNsSFSJkAiA+D4vT6zXsHa2xul4RpjxEg8eHnwjpcZikIdJtZ+LlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=FLidMWf8qugragaoF0sw5sSDF8bTNATAcsA7wuXsmKw=;
	b=FeAE2bYXEe6ELf70DYGH0VOO3UUFBEFAKhIRXCYjgLzNNnJW1fR7HCK0Ynkg4XnvA0/b
	 xcpIKrtKnLb2NgQAINS1y8k8wVHELxwyYGqy7D3QPHywKKCqEnnmAqEN90+Ue03HsJ+ui
	 bsm1EXawUPU4d6v8sZItkyCK+JTYb9ag+QAz/l4kmv0nK9IaPa+p6Q9Ne3TkLJMEpgNSf
	 8Mv0a/c3Er6F5XTPZW3pltLjqKK9qmzIZF1P51qxEecb497wampLL02CNhLuCqAEu40pS
	 M1sRnzFKe0mEt3/A70ASJOBwMv2WLVVxIvOriRnHSYJc5gUVL1OxOwaBYtYnhdoJTtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VdeHwEXL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259C4606A323
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 13:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 259C4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VdeHwEXL
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-86156cf8a7eso3541981a34.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 05:17:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794835057; cv=none;
        d=google.com; s=arc-20260327;
        b=q+lHAUU39A4mRJdGyKD2oe/x3zH9dBWRr6znzaRzUMxVBV3ywEcnCWGAs9nuzh0YLa
         GbWM8GctWHJl74Qs+81ldPDYyR9SGXDTH6s6Mdrrkc7hxqJ0O+JiHT/DcO9e36JkWDTH
         tNSLImcG/+8aNtg5bItgPhylI4O4Qss9uf1cANgunFFU0JX+fODEVZD8MvQXr906ftQi
         EBo44eccLtfBNsf6k+YBSNK2BEbF8Bbw43lFQrq653xeh8rgdvWCjWAqfFGXI0XE7x8h
         3ciA/64TgZPR8REsjdvNOQWkdrcx1gRBH9mmaGjgzV9YqRvFkxl9sF/hAN5pTsheVQcG
         gRQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FLidMWf8qugragaoF0sw5sSDF8bTNATAcsA7wuXsmKw=;
        fh=rQmuoGKnnYBVRpJjTloHD+NP2HezmJgH5NMdJNwTrAY=;
        b=mWrYYRTo314uL42Q5uYBsHAGx3UtSH7xSHG54BSQ1AudZBNaNlZeDMeo32PxoGGQ96
         BqtRajp6tp1g30bSWAQcZCn1nm7YOq/Jqon88pcLVWWbNBEik131ic6nlGLkLIbln40c
         /dB8SWN4/ZPA/53jMTEcR2WE30GUUnVzIn0R9cLO7+nC/yNj9ILRf+C3bIB48UPgPE1i
         r6qEoIrE+9WotzIVFHli5fC3YBgvZSSlbIaPYS2QKDZ++0rRevDI8braO5RBkfIU3+iE
         aqgE7n0He7AKkF0p+DcTuBsrIHvGZZn5jAi4B1SX/DCFOD9icDAU2KwMnxmhMTpcdxCi
         cFhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794835057; x=1795439857; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLidMWf8qugragaoF0sw5sSDF8bTNATAcsA7wuXsmKw=;
        b=VdeHwEXLxTQ5wqSxntNGvc9Ws38HB2eJrHvik4aokKDtjy0XuYwT0HmNIXQkAvE3FI
         oO0WG9M/cs+ZkDGSQ2qAD8FahJH1JxbX205leePGzXfIq40RpvwyWBBa7cK1kjeiHoJO
         adVyZ6kBjdwSJbPGckd6m9d8Wpeba28HJmhc8UI4rgFcxKSInSYHr+lgMydjFrDIj7E2
         Ioi/sCbpL/FjcAcl6H5XjiyeV4uEXkf2RtXo1m08PhyHynVM3NDJJelJE9wDafX+lfOm
         fexyWP4kBMyhpxjtolVoEZVEJd7whEkLSpsECAJoP4cdKmL9uNNO1aQAfiLYSkfbDLec
         QLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835057; x=1795439857;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FLidMWf8qugragaoF0sw5sSDF8bTNATAcsA7wuXsmKw=;
        b=FhVdmmLHh93h/Bjy5pXWbM8437DxKtBnWhKaRl2ggIVjpnS0FqVW0hlqHVU5adiAFo
         GXDUfQfpZFtBjWKSRhxM0PpbVmB3KguNMaiGZ3jUhtOk4uy6FW6WEralkjwUkk4/PFB1
         mX5YvVJZ1nf3Fi2xBjT/1P1YoXUXtwzhDHzOdvHidNhh7q94ng7m/I9kX6pmKS6RR05T
         nkkQ2Th8hdh4g6ZKp+OicqgYMUFIzCuZSHpaqih/jv6GU/Ay2R4fV+yvcJ4GiSuSu+fO
         IiUE8ll4JT5jcNvst2tmt9UEbtBpuYuOD4XABJCpi+34wH8SDMPleNCZwPf11yyuY4Zt
         7Yrg==
X-Forwarded-Encrypted: i=1; AL+hErEUXlDXVeut+iugKhIG1Kf20j1BKKkeYHrcmvZwBatZ39A9vvxpwzf+2IpgEPs/t+nXF1huKEG67STv0FMiJA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9EkWRmlDZkip/Zx0ED4p9nbPxndXGI99S9y9jN+FFq4jipFepj
	AP9zrrB+CFo+U85vq/p/qjSYUKPWVgJYlGK8DX4LdcLUjJvanBMKuOcvz+XxiCZFX1jBVVdPYjk
	BKe4YbxF4HIqU2jxlrsnRf/agwpmFXt0=
X-Gm-Gg: AYBFou0HdkMpJYj+7k1Ui7rqMuPPfidAlTqIfKWeIGRD2x585lSjMslqwSQjAN4/MIb
	0TQc2Kg+wYf4G3by9bl9vjMI5ejyLx4HcjDfhHT0EWw6xOPkmIbDeBAKnZOLxiRx4X/qyR8L/gg
	yM7yVYYNogQ11HDXgBZMgAqA1RQUFPswJjjtIZZnHXndYe/4JaxS82BnQ1o2hfkFKb4ogGs0DPT
	Elij6OIT/PNf9bLQxiHMEF5R9VF/OmQGYGvyK419WCX9JSMACIwQ2+c3XkhT8d+xGa4YOUF+WxQ
	ZDcXG/ESHoYCPnVpVbSKXe0g1NW5ge8x6XlannrNl3tWUJS6oMmYktWYjGofTVNmm13jLOEwfB9
	FdHQuccZtQ63TuQ8m5YURbcWDFNJx3d4xhBKkatkeqd1bAnIoP0eIH4bJYHBNXIx+pkEuaEFAYc
	v1rnzlv5Qdio+Fx+fQiju7QHE9sRu4stjuc5Tj0wWCnC9nFrflOCUXhoId
X-Received: by 2002:a05:6820:2911:b0:71a:dc2c:ae3b with SMTP id
 006d021491bc7-71adc2cd460mr3609748eaf.16.1794835057100; Mon, 16 Nov 2026
 05:17:37 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-exp-phy-rs-maybelocked-v2-2-8fa7897a0352@gmail.com> <179481441244.3136.17001607410238147789@kernel.org>
In-Reply-To: <179481441244.3136.17001607410238147789@kernel.org>
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Mon, 16 Nov 2026 22:17:26 +0900
X-Gm-Features: Aa3M54okYT4QHq5C_H4ZZaGZh80n2pqronqCTMY0U8ewYc3mFcR6BO0CjcHXiwg
Message-ID: <CAGAB665suSc88922+wdYBJrmMsZvtx8KtwQmo72KZGm1oGN8Zw@mail.gmail.com>
Subject: Re: [PATCH RESEND net-next v2 2/3] rust: net: phy: make Device
 generic over a lock context
To: netdev-bot+sashiko@kernel.org
Cc: fujita.tomonori@gmail.com, tmgross@umich.edu, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, andrew@lunn.ch, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 4:33 PM <netdev-bot+sashiko@kernel.org> wrote:

> [Severity: Medium]
> Does PHYLIB really guarantee exclusive access for Driver::suspend?
[...]
> [Severity: Low]
> Is Driver::resume actually called without the lock?

Until v2, I had left suspend and resume out of the context analysis
because the existing comments already said the lock might not be held.
Running it now, resume is always called with the lock held, while suspend
is not.

v3 will give suspend the MaybeLocked context, list resume with the locked
callbacks, and fix both SAFETY comments. I'll also move dev.genphy_suspend()
into MaybeLocked context (while it holds MDIO bus lock by itself)

> [Severity: Medium]
> Does a shared reference give match_phy_device any protection here?

No. I had kept match_phy_device for API compatibility, but like read_mmd
and write_mmd it has no Rust user, so v3 will drop it.


> [Severity: Low]
> The commit message says:
>
>     Update the documentation and SAFETY comments to match.
>
> The from_raw() callers in Adapter<T> weren't updated, though. None of
> them says which context it is in or why; they all get Ctx = Locked by
> inference.

I'll try to compose better SAFETY comments on v3.

Best regards,
SeungJong

pw-bot: cr
