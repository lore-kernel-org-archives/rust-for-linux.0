Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB7A1F0E57
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Dec 2024 11:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734003780; cv=none; b=qapjIoIawHX8AonML3TenjqwF4QuyNK7tnB0RIkOvRflwhG3Sshlcc50bBaBSCAmyehEiMHPpSxWzPKLrV+JylFM8NKsygUkYBuYS5RgqbyhzN2JuuphrlYfcw85kBLwuJnUZnj96wbhL/4mo4NWaZWqJDeCwBI1ByIeOGAGat8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734003780; c=relaxed/simple;
	bh=ta6dcw5Lqi+epCtRiM3z0EbmMHGpPpDCzAYGazBBDJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ukxyyY+YTsJuoAHfMEoCzrDbbqqNFZZKb+ARuPB+mZ+Hh/Q3Zf7jnJZBipC0rIiRsLJAAqGbkDn40sqNi4mksedV9EjU9ZrOKigHnzLh/8LXOpwatF4lrrL4pDBU+WfkpCpE7349gGUaLXIaIcr6p0gqaMkHdpvr2schXVXIuvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QNF+kuNO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QNF+kuNO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734003776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7P/AmC8WjbEmUQlPKcMRCF3Av6ELgVoyqiaamWp15Q=;
	b=QNF+kuNOXBnYBEi3v8gS4IIAuphF3u+9C6YJpr7O9ZeAxo0u9AEpnLUPHC639yoFg5ofPQ
	f+hRDufxAotaRG/hUaghk0BiVtVqsKzgdVXxEmBEZ6wKZOogNwawZN89tycKr8ow7AHWd0
	xBP+nlaikGhKzSuBtzZ5+2mdOQLfznM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-o7vdx1vcOVOOJdkVN9-Z9w-1; Thu, 12 Dec 2024 06:42:55 -0500
X-MC-Unique: o7vdx1vcOVOOJdkVN9-Z9w-1
X-Mimecast-MFC-AGG-ID: o7vdx1vcOVOOJdkVN9-Z9w
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4361ac607b6so4204775e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Dec 2024 03:42:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734003774; x=1734608574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r7P/AmC8WjbEmUQlPKcMRCF3Av6ELgVoyqiaamWp15Q=;
        b=nSX7ixdw6eh4MjB2cOlwjzAadS7KL6VoPALrOcNiQ4Bf9lFOFesc/DI+rrgYaNCB8k
         SVbGIKiUrqTa6PNr7keg+ZQzA7fM6R5ETDPmYrftU2/t1hbofUJKRedyOnE71zmay2K7
         AydeGCMZyg13dS3e4lHmFSpy99PMQkmY5XCHtRkV7e26S8A6hwzmbyV8wnJ+D32k8xQi
         SvxtlpXanPRAAx51VRmq/BbONuw7V5FFRAfIecmilDBfq6lWVbzoNp/smRDBwk///SrP
         dhjzkHbYvXh+8It86wogm6oYg2VjJNLckUODYPwREcLZGoK07FMgoHnLFem9yfyTLeMa
         BLRQ==
X-Gm-Message-State: AOJu0YyjXIRfKEzh9V1ABTAoFEq/Ebcfhz4kBYnC5yVZ+Lo5YXy68Zxz
	8b90x1Ecvi6qQJhg8Sy0QQ8w2E9W/cvLMf7ojumahzgiK+N5sPZf4Nru+aGMqUsE5ThUgZiEj+t
	NhIILGrnZ4jQjAMqBiv5arLqas6bdl+RKOgmSRN+x4BQmAutM+i62RcdG+rm2UGyu
X-Gm-Gg: ASbGnct1mqsqiUnDEtQRENMPxjM9IRTSN3hRTp6h7GmpVxVfo0XtMZ/qaQEYwFTX0xz
	VQqzXJfff/rONti5/VvAQdUuLKGKMeSkqwsRx3iUG0s7QENKlZztJs7FZunMcYwMgLG85pUhT+Z
	f4vSU+Nx4z1n6vF4zDXouj4QCcVvMnkMICNwj7c1/9y7+9RyK7ZUgOIThsWWZO//Ls2ryQj7vmJ
	T5beKchPVwQ+kuP44vgPAb7y1zivg6aGakgLZszA73AaeM6iYGNde85qmMkn9KdG9SOXSF808GC
	HfWEnvU=
X-Received: by 2002:a05:6000:79c:b0:385:ed20:3be6 with SMTP id ffacd0b85a97d-3878768e462mr2339257f8f.22.1734003774406;
        Thu, 12 Dec 2024 03:42:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzMbTMQjj/EcKrfC2zE6T1mgloFv3AuV4opo8+3j9huepSafAMh3r5R/Gh/+RpnVOA8JTdcw==
X-Received: by 2002:a05:6000:79c:b0:385:ed20:3be6 with SMTP id ffacd0b85a97d-3878768e462mr2339242f8f.22.1734003774057;
        Thu, 12 Dec 2024 03:42:54 -0800 (PST)
Received: from [192.168.88.24] (146-241-48-67.dyn.eolo.it. [146.241.48.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824bd889sm3836322f8f.44.2024.12.12.03.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 03:42:53 -0800 (PST)
Message-ID: <8d00ebff-5f5e-4b00-865c-aa7e48395d08@redhat.com>
Date: Thu, 12 Dec 2024 12:42:51 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v1] rust: net::phy fix module autoloading
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, hkallweit1@gmail.com,
 tmgross@umich.edu, aliceryhl@google.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com
References: <20241211000616.232482-1-fujita.tomonori@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241211000616.232482-1-fujita.tomonori@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pYi5eo_oTKqjoY0Re0FlqIbVDCkisNnSgp7QAT1Up5I_1734003774
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/11/24 01:06, FUJITA Tomonori wrote:
> The alias symbol name was renamed by the commit 054a9cd395a7("modpost:
> rename alias symbol for MODULE_DEVICE_TABLE()").
> 
> Adjust module_phy_driver macro to create the proper symbol name.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Please resubmit including the fixes tag, thanks!

Side note: the netdev CI is lamenting a linking issue on top of this
patch, but I could not reproduce the issue locally.

/P

