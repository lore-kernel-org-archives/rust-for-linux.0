Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEC5175D2D
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Dec 2024 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734516274; cv=none; b=AklA22Czr6aqKyEwidkgq9GEKcCAeD8iNjqpzQ65DaPj6X4qXsLfNnMCYXLRiL7I7yO9hyotyBLewgHwVN6P7UAqTKMBlyMJDdvcOUWuYgoqb+FL47nJGGqKwkdnyO6qvOpeJXeixVduFaMANEqykGdcwv20k0VjnhxxWUH45xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734516274; c=relaxed/simple;
	bh=+KPtdWR+FR20FLPaoO7XjCq8MQFrTv7CWnzwyI0iUN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ips2pPEwoI1TKfbHHQJ3Q5dtpdgRguKekuHJm2Pr/bm9EQ864cT+jha6YkjJspFlwlKt9p+3ghF+bdvrtLqhVll2O97y4wTDP3mLNqDd0sxlIOG/5UturbaDaKoo1CNeSGgL4bvDExra5Gmrt6CLlsx3TgC1XFhAj0P2Bi6SKkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=caqbkxl7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="caqbkxl7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734516272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qbUOxbfbfXNN/bRoyuA/9J1uwdYH9gGx7AeSDBbU2v0=;
	b=caqbkxl705GJWJbDKMcW/mhEBE5kWM6vbxXNVE+bcmWCyMXhH3REtjVX4nPc3dPM6exbNR
	Cz6zathUD+MWRBp6NiKP/PGGjrD2IzLfC07lPzD1GzkvB73rBQM4RsGKMV1iZ9aGDxlBgT
	RLsy39NVPDtw2q7rd591SFTRDcuA7Ss=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-OWcDDIUHPuul24oUNdNmnQ-1; Wed, 18 Dec 2024 05:04:31 -0500
X-MC-Unique: OWcDDIUHPuul24oUNdNmnQ-1
X-Mimecast-MFC-AGG-ID: OWcDDIUHPuul24oUNdNmnQ
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6e1b037d5so451996885a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Dec 2024 02:04:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734516270; x=1735121070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbUOxbfbfXNN/bRoyuA/9J1uwdYH9gGx7AeSDBbU2v0=;
        b=q4txHQzU2b+3I1YGvZY4Ogsx2bx1lZniIVDkfBc+vqciq7rg3uwOkGtzR3+fcMF8pE
         dS+TxOqAbnVdCcDPBCQWZIlbtzdCn01XTAxOIvnVjK5bP42SXReeCxbYBA4vF6aewimg
         B01CmSUTG7en1rZ5np0Iyu1dof1Km9XbSVtQOa2baga326nLbOFCJmVtkT+S0wCpARbT
         +i2WUJ/xR5sDaUFKB8IiPYfqbSSD061IZDeGLPFCKFAOeDmwM5+MC2fpoAk86Uk+fOjX
         zBoH/moRfwI3ZcIVZIHKWUAi6U2gUi3XUPQ3FUuEAPNI41Z9E6zgtmWUk3A+2CB7Tkwv
         +vxg==
X-Forwarded-Encrypted: i=1; AJvYcCVHQskWI5cFO75+5ikI0D2dMNXiFIfGgWnKU10JF8y0Vgju6VdtbKpg6BAhVhazLn1m5ndhTc1NKASQzdXI5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzswyAQAl20pFinQzG1UlXJDuL64QZfpuCJgvjaF3SNAaljFAlD
	1dpRP46IA3rOOhP+2LFyJrqskvDe0H+vK4PUKRTi19tFPB19mWFH22PmR6QDjOtgd2C5fp4Q88Q
	xgiX2zXiQlGJzIU+s7fTUAy+gDZkeKmGm45qmizzUiqjCteqPxVhigtjLJgwYe9+C
X-Gm-Gg: ASbGncvHTwbjuiXSsPv8PORMkVpV1XJofBmNhYPZMgPrb1evSk/c3WxHHYfZ6TCUBCh
	5uetK0u0a2qF424kf5i/LCCXcLseXTYDoJysemRqCY/7h7CrTG8H6w1u7EpOxLFZx9DdjUAetLr
	D6myVaBr/i8Aqu5q/EMbu4J6Xrj+fQuB6WMvqi3QZK58R92svUPU3Il0Cxtl0RPZLnkaYow95zh
	2ebnxiB1gTUIjI65YoFcm3iP+upp5Vl4zNQGsI7BikOBpd9J9AziuUGiyNFSLhSpx3FZ/7IX8rJ
	uLqVMYhb6w==
X-Received: by 2002:a05:620a:bc8:b0:7b6:d393:c1fe with SMTP id af79cd13be357-7b863720767mr279318985a.26.1734516270485;
        Wed, 18 Dec 2024 02:04:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2Y3XczKvbUlWK+RkxQ1HFLkeu2KgSghw/Vynpo4+IZZccOxdvv281g/heRIPOHkLh+xLFbg==
X-Received: by 2002:a05:620a:bc8:b0:7b6:d393:c1fe with SMTP id af79cd13be357-7b863720767mr279316785a.26.1734516270131;
        Wed, 18 Dec 2024 02:04:30 -0800 (PST)
Received: from [192.168.88.24] (146-241-69-227.dyn.eolo.it. [146.241.69.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7048cad55sm405565285a.107.2024.12.18.02.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 02:04:29 -0800 (PST)
Message-ID: <da411dfa-3dac-4205-85f5-b99bc35f3333@redhat.com>
Date: Wed, 18 Dec 2024 11:04:25 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] rust: net::phy fix module autoloading
To: Jakub Kicinski <kuba@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, davem@davemloft.net,
 edumazet@google.com, rust-for-linux@vger.kernel.org, andrew@lunn.ch,
 hkallweit1@gmail.com, tmgross@umich.edu, aliceryhl@google.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, netdev@vger.kernel.org
References: <20241212130015.238863-1-fujita.tomonori@gmail.com>
 <778db676-9719-4139-a9e3-8b64ffa87fd2@redhat.com>
 <20241217065439.25e383fe@kernel.org>
 <b701482d-760a-437b-b3fb-915dc3fc2296@redhat.com>
 <20241217074400.13c21e22@kernel.org> <20241217085124.761566e6@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241217085124.761566e6@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iFFSgBfCDAaxv2gxjxY-ZrAbRB7zWFZjclk6aB522Ds_1734516270
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/17/24 17:51, Jakub Kicinski wrote:
> On Tue, 17 Dec 2024 07:44:00 -0800 Jakub Kicinski wrote:
>> On Tue, 17 Dec 2024 16:11:29 +0100 Paolo Abeni wrote:
>>>> I'll look into it. Just in case you already investigated the same thing
>>>> I would - have you tried the rust build script from NIPA or just to
>>>> build manually?     
>>>
>>> I tried both (I changed the build dir in the script to fit my setup). I
>>> could not see the failure in any case - on top of RHEL 9.  
>>
>> I think I figured it out, you must have old clang. On Fedora 41
>> CFI_CLANG defaults to y and prevents RUST from getting enabled.
> 
> Still hitting a problem in module signing. 
> Rust folks does this ring a bell?
> 
> make[4]: *** Deleting file 'certs/signing_key.pem'
>   GENKEY  certs/signing_key.pem
> ....+.........+++++
> -----
> 80728E46C07F0000:error:03000098:digital envelope routines:do_sigver_init:invalid digest:crypto/evp/m_sigver.c:342:
> make[4]: *** [../certs/Makefile:53: certs/signing_key.pem] Error 1
> make[4]: *** Waiting for unfinished jobs....
> 
> allmodconfig without Rust builds fine with both GCC and clang.

FTR, I got a similar error (even without RUST) when I had

CONFIG_MODULE_SIG_HASH="sha1"

I moved to

CONFIG_MODULE_SIG_HASH="sha256"

since a while, and that fixed the issue for me (also
CONFIG_MODULE_SIG_SHA256=y is needed).

/P

