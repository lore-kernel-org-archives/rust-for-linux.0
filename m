Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BF91A08BC
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 01:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762911308; cv=none; b=luXu71yjO8HMQPJr+RDhNnBcDoGuq8437pYL04howhBi5W5MfWGp+kyk37t7z0FLVAotUVGGBvTNMFU4DCgB9wklh7wYb/y5A4PiO0WGuUUwizAIZA4G/aHV2Ax0bQqmSe+OrqrdVchfJjN0y7dDF5TNl332DP0K0IrYAdtQXuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762911308; c=relaxed/simple;
	bh=g3adwZNj2VT7/71xWZVogcPF7iFtfynjdTGU6iT14sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8UQ0uq8H7cE3GoJium3ZGkklalfA9blBZ60onAzvGQJAN8FcEjQl/F5iLUtGkHQkH7MdkkD/KJdhHno/sSE689xGbwPzDlBNtR13HREqxty5CLdJDZNIoP0pEN5bfH67Hc9imZDFG/8CDpOuZmIlzviGYD6IX45fhn7kmgxbhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMFwo6Np; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMFwo6Np"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4eda26a04bfso3430151cf.2
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 17:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762911306; x=1763516106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74Ig6uTx8zmeeT9eLJ6vNWswEBWiCqJJ9yrw7PqhxKU=;
        b=hMFwo6Npm1JX8rKm+ly8yL87hI5FvUU5BHnMKHHYrlS9ku5050V9v0QSV/qiqhqCVw
         b8pycLonc8vzDCjjZKcVy4bRKSjO/Ffe4F2xaI23XTwOLFLo+tlZ74zKClertRt2n1Uw
         R2PyuR8LRmTPTfiCdZxVedsNRYBsEna9UrxrLnrjVA7cxiRyETsqnbEWxFQuGlXnN2mW
         ECEtFHbhfQ7m5/eGipLKsBi7/l5E4h8vUEzU5fvTNgusbKhXAz1iiissv2wxbrFcgs9Y
         P/SRRbY4V1NcKKlY2+MVcwk0iYRrstLHroZ+mQeeC4hDbqMioqNTP8TeqOrGKj6lHu0c
         iyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762911306; x=1763516106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=74Ig6uTx8zmeeT9eLJ6vNWswEBWiCqJJ9yrw7PqhxKU=;
        b=ilT2UwmpxYe3+iYS4gpcXSydkg9vWH2d8aQuCNr5El9i6xJI/9Eek68QQyTFr2xxs6
         pAElU3QeKfYWJMO8xAPUO2HqTFu9kKMFTJTVdPUygtQLopjz5XsYuUDNBolkDH0bXGlP
         7tknnxVkTIFmUgeSIx21bKcNFk2F+FiCyHYdYx2BF9NV3OOGw8uDvCPl+Wzt65n90hzk
         j+/Uq472vvAV5ULyHr0LTkK3u3U5fwZfFM36VM6RCoiRXF1obX71bdSVBI5+9fLd3Dr7
         9b/p6PW+m6Gjw1w9ezrjg3Iup0pQ/VunU6fDcL+CEx4B+3O+iQ//jn1f0XOtKDk0TU4e
         qN7w==
X-Forwarded-Encrypted: i=1; AJvYcCVk3hqGau8WG1tBNTokxwNs5Obq/E9lI+kwUhvZhNTzZ8riejf1SygrHz5ZrDgGuM/02ve5J3JXQjLXiyTCAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWFUDl+dDumWg5Vrg0i20rUtlfAkUBdMY/BBljKdk+/+1zPTPA
	c5Ez8tUVuyO7+kSIR0IJkCcsLaos9A9Um0uaxOd1AND+ihRq+Q9ieQkp
X-Gm-Gg: ASbGncuetAIhChardztv5bcy384QnVNRp/Y1SiOUfAC1wLYx9pUDvXghDZrHeJnNxsR
	2hXCjReb5kIecoIDMjTUIfjlsakfpy8/QjG/SJIdBL36vJH2pI0AYhn9/0E0oqVvUJ8RSjNcuKT
	MrLLrmELFrga1Ul4hKtfTGT6aJaJjx5CXgXmlDYgxn3dDrQnAFjUYwBzALOqgz1Ed+SpX0D4PnX
	TsFqQQfpjI25rELl5GloVq0B6vEdWJYSWS74mKp6N/oQeJ0PksepZjXBODGEnwoR4XkkZh1X48Z
	uszYCgX1XWn8eWSHziE4R8rJRXISJJDyivAdVtkiSjSYzFXy7zD2IKrMM/Qp/PxH810AZtOpkx3
	AXgLSd3LViwRK8T0wliZmNf+N1LXsjZolEX8W9ixOM7nLyKkv6IcuVCBp4zhpbCLB1BU9tjNO6K
	IiSpxFnbVje+2Uz6cBNUMuwD5GxETd6SWpj0scBwP6kDksmzpxUsZnQal+gC5q6+iboODDbOEzJ
	nmc
X-Google-Smtp-Source: AGHT+IGw21AG+e0LCM312xs7EBq9H23Rn9g4eaXIrnlM8wwvnRMpycT9GNJPA1aGnWlXrkx2i4IYlA==
X-Received: by 2002:ac8:5a96:0:b0:4e8:b478:66 with SMTP id d75a77b69052e-4eddbe2146dmr16996861cf.82.1762911306298;
        Tue, 11 Nov 2025 17:35:06 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88238b75896sm81830636d6.49.2025.11.11.17.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 17:35:05 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9429DF4006B;
	Tue, 11 Nov 2025 20:35:05 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 11 Nov 2025 20:35:05 -0500
X-ME-Sender: <xms:SeQTacESTNZouH3boqo8r9iiBE58SpiGo4lFgDtzObgFqiz-4oISRQ>
    <xme:SeQTadhymwFqRetORVuzF9faDdGYcXzbc67TAGVDLTyptqYrY-vD2UUiRh6at2Ib4
    tN8KGZ-HQdtcpP-t5yV_0SPzmQjuPTGhYo56ZJ2FEojUAzEdQI6IA>
X-ME-Received: <xmr:SeQTaRu4-BDNIJbSXZZ2OtyzYdz0sIB-Lv6jxJJurdMwVNPLQbR8V_YLxK0OtzjIxgjbxoeAgLXcd1YMr4WdZet7DqoGm0WN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtddvjeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpth
    htoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgv
    uggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhogh
    hlvgdrtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdr
    tghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgh
    grrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:SeQTaYsrqzQ_ihHUFCvhub2vEtr9pL14prncqe37sUx3NBe_mv67OA>
    <xmx:SeQTaeGvctssS0WSB68KT3PGjMJtyOLQBMaKu15yZ9RT2JLcrCsbhA>
    <xmx:SeQTabPbKbIHausxUjUUiT6QHx78MHi5ANmtClBpms8BPVbc_tupYQ>
    <xmx:SeQTaVJ4BAq_pReZe0C5pFJIXmyUY6oUVZ5D_pdWsAzgtH0_5clgAg>
    <xmx:SeQTac9RygwTfuTcF7W4I5nWr6ErRHkRzj98Eil5UZG1ymH-qOcPrXMq>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Nov 2025 20:35:05 -0500 (EST)
Date: Tue, 11 Nov 2025 17:35:04 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
Message-ID: <aRPkSKCQKSQU8hlm@tardis.local>
References: <87jyzx6ix5.fsf@t14s.mail-host-address-is-not-set>
 <20251112.094508.554651669948369724.fujita.tomonori@gmail.com>
 <aRPdGg01VDJucAfS@tardis.local>
 <20251112.101853.1558870636834355421.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112.101853.1558870636834355421.fujita.tomonori@gmail.com>

On Wed, Nov 12, 2025 at 10:18:53AM +0900, FUJITA Tomonori wrote:
[..]
> >> 
> >> I agree. I think that even if the type is (), a race condition would
> >> still occur if the init member were reset to zero using non-atomic
> >> operations. For instance, the as_ref() method effectively checks
> > 
> > I already explained this, the debugfs writes have to be treated as
> > per-byte atomic, otherwise it's data race, using "non-atomic" to
> > reference that won't be accurate.
> 
> Suppose the init member of SetOnce is set to 2 and then reset to 0 via
> debugfs. In that case, if two threads execute the as_ref() method at
> the same time, is it guaranteed that they will both see the same
> value?

No, but it's not because it's non-atomic, but because there is no
synchronization in this case. It'll still be problem even if the reset
is atomic.

(I was distracted by the mentioning of "non-atomic" and didn't see the
real idea here...)

Regards,
Boqun
