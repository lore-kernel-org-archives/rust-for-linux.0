Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86F91A00EE
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731940117; cv=none; b=lIHMuSyxkcUuTueRazKVwrXZB3KCURaCGwNEq37Phw9ik40JWC9aFeAT4d5pS0QPkWRZBe13OET6lZTPe6a2v89F5jy0GT/6neJ9ozlbXF8qZFvCO21jL4h2AhWMhAcny4HJ5eL9Ic4XU2HcYdvYUmTacm6N6U1MFgPUCXwXw2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731940117; c=relaxed/simple;
	bh=wdVLGAc1XWsSG5qAPwHUk3JBsnbEkFb8CKQE2ZmKQ9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWRPgk84Y62zlBra0KQsmXY0NV/tXNj2o1Pjm23WveDCjE5AUFxn55g3icoVo0LHHSd8p4BmsqwzJApneR2RPHe9PmVsV4Eva/egCc23biG3RGLsO+won7Fpe9HISv/SFvERlHLdEoejTkmgzOg5sdXeTuacbnVMf0xXlQ8Yb+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in; spf=pass smtp.mailfrom=iiitd.ac.in; dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.b=DqaK7Ec+; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.b="DqaK7Ec+"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-72061bfec2dso1599475b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 06:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1731940115; x=1732544915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ/OAdBG5AB8YI4ghzNAiU9cnKHlbBpEeuCaXgo24T0=;
        b=DqaK7Ec+QPGHa9mZI8jSXmw36b84sEyxgiJHXIb0mxWunVs4sHZsF7zovfcCbg+6ts
         2qjQG6oniC9lf2bS36I+MH4GIHZbd/436ZM4G6rMJ1OsSQya62CbsbkEeoL/t1umk9Cz
         mQSZrum4UqIgPU3ndJhh2CPYa3+W3dzVNtVqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731940115; x=1732544915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJ/OAdBG5AB8YI4ghzNAiU9cnKHlbBpEeuCaXgo24T0=;
        b=G0KOIKP9Z9Ydatgrtp0O9JKbN5u14RermF3Gnmz5mvAxVlt1dIMvwWIcYHNU7Z0tog
         Rv6iLoLdHYYf4vW2Kn96VHy2nSpNXqY0N5UzmuZOEiRp1r8RkxAB5jhc35kaeLkg30/o
         61K9owsn9U/jOzYC5F4UPpu9lFYc9n9TXkr0MDVzJfTjT8mREtHhOP+X+bdzGmpmFSpp
         6eB/ryXSv3JtMwVTrsddLi2+gVYepboe+RBRqgTOEPOOWqhRCsCMLQ0pXCx8Tm7k3bwY
         Lct7Jl0KduvjSMZp0i5iJBaUK+JyxaZDSa+nGiZfoWtJEMOI5MxSI1XAENidC3WVF/9e
         8MvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuOnOKlpnIgL9YAF17vzEGPBrTcqwF9mTJr6gZJbJpLbo4bRGEzn6SKUfHkwxKXC8rWCaTICnpw/xRfqcLvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVwrm5ZHp6Xmr0F672rSLtm1MZkzaJ/tDgm6PKMBunYMLYVGJe
	xOoj2VJYlw5MHHmezknnj8suQTmmM9M21spnai+DDP9jRN9eQfl3sKI/gxR1Asw=
X-Google-Smtp-Source: AGHT+IGmrSwC5OOr5CGGm+qfWv1p8qUdKfi5IPTRczbzTJTNgxVyziglqADNl9EoIejb73uMCQdBzg==
X-Received: by 2002:a05:6a00:1488:b0:71e:104d:6316 with SMTP id d2e1a72fcca58-7247709d4c1mr15508159b3a.21.1731940115150;
        Mon, 18 Nov 2024 06:28:35 -0800 (PST)
Received: from fedora ([103.3.204.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724771c0d37sm6431267b3a.104.2024.11.18.06.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 06:28:34 -0800 (PST)
Date: Mon, 18 Nov 2024 19:58:24 +0530
From: Manas <manas18244@iiitd.ac.in>
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Anup Sharma <anupnewsmail@gmail.com>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: qt2025: simplify Result<()> in probe
 return
Message-ID: <otjcobbaclrdv4uz3oikh5gdtusvxdoczopgfnf6erz5kdlsto@mgpf4mne3uqb>
References: <20241118-simplify-result-qt2025-v1-1-f2d9cef17fca@iiitd.ac.in>
 <2f3b1fc2-70b1-4ffe-b41c-09b52ce21277@lunn.ch>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <2f3b1fc2-70b1-4ffe-b41c-09b52ce21277@lunn.ch>

On 18.11.2024 15:15, Andrew Lunn wrote:
>On Mon, Nov 18, 2024 at 06:39:34PM +0530, Manas via B4 Relay wrote:
>> From: Manas <manas18244@iiitd.ac.in>
>>
>> probe returns a `Result<()>` type, which can be simplified as `Result`,
>> due to default type parameters being unit `()` and `Error` types. This
>> maintains a consistent usage of `Result` throughout codebase.
>>
>> Signed-off-by: Manas <manas18244@iiitd.ac.in>
>
>Miguel has already pointed out, this is probably not sufficient for a
>signed-off-by: You need a real name here, in order to keep the lawyers happy.
>
Hi Andrew, I did clarify that "Manas" is my real name, (as in what the official
documents have). It is not a pseudonym. I am unsure if I am missing something
here.

>Also, each subsystem has its own way of doing things. Please take a
>read of:
>
>https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
>
>    Andrew
>
>---
>pw-bot: cr
I did take a look at the subsystem docs. I added target tree `net-next` and
added all prefixes. I thought `Fixes:` tag wouldn't be appropriate here.

I missed the Link: and Suggested by: tags as I was moving from v1. I will add
those.

-- 
Manas
