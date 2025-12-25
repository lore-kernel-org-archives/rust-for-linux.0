Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E46423BD1B
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766655439; cv=none; b=DDHVGPgMFbr6V95igPqNNV4Cz2f0dz7hI/WPhbwYSIVO/ZsinbUeYrk4N4f1CzRQw+JKv78uCogJV+3u4BZ3bhwvsExdMLYHUnxmJzDMWT4ZyV9AKNyY5cXY3YvD3vXE05uN5hCg+tfE3B3fPlXuIPJFnad7X88XUes+gw+Cc5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766655439; c=relaxed/simple;
	bh=VxBqnPDdnIHjfcuIiI4D7oNyQ73l/jfjo2YNl08bqJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OB3471lAQYc63zInXGpGg+fbSF5ISCf3zrCKg2cimZtvZohgOlzwgfBx3FMjk/G/jFsGTMpPRQGtCVmJu5hJ4F6vLKnTxl1N77sEiO464a4hM4x3UVJQn3jESklUQ68UkPOlnZBMszhWqjxeMMfslCbQuQnpkrR46p6zeqZMp28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYB4Kp3d; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYB4Kp3d"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b2f2c5ec36so745478985a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 01:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766655435; x=1767260235; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nVJof1x/tXOVIVA84B6vueb8075E7eaQsUaC6CPaNX4=;
        b=bYB4Kp3dOCIKNZUpZacJP3WH3RWh6xfO55jGEMS21uqATakjZbASrCK4Dkil01nui1
         w+Hvviky4beOmYefTkqi2qQb9qaGV4+VOU46bybMMdiZ6iq1/T9+jU4f9cXBS+15qEmT
         EsFu6gNn++hM83JqlLhZI8qYNOmxzYoMZmx8brw7i3A+bmSbn1lJLbGhs/59CI8rjDM4
         IvljAzzuFGW9PkWfZZlMAzqmn4zz1CewJFFBFQiu32iAZHbFtYtH8QwwrIZsFVM3Kt35
         BjdtlH3EgTH8Ay9vhIS8muTxxRapDQi3dnj2dnXQtt1j7KZtYr2ebGu7j4x/hi+9w0Tq
         rt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766655435; x=1767260235;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVJof1x/tXOVIVA84B6vueb8075E7eaQsUaC6CPaNX4=;
        b=Ur6SbemHZHZSzNTEKvD9ImP7rtXqIguUojipIPhL+EzowAGw8zA/+EXfVSecKZ7dX4
         uEVXqOkabMyNypogj2DP664IrJig2ckBJwtphoqyjlbeDm8b7WBZc3tbWnYnkwlwbjdJ
         BuC/5ElTupGf2kVnRjMumf6tk+4XZYIjB3Ahn3jwRjkQZg6LSXADpWI4iMyQYFLuXjMp
         Dx0xDDICuQxbibM4uPlJdiAvfzcyj3PlSyHr2NjDv1G2VYyWVZFnBAN6rFGcCgT5lrkJ
         P1A8/JQGzRTajDUzDnT7W6dNiEFw+yLrxcrA9CtL477yzuK1uYsFjDjokKFVE2YCnc7o
         BmCg==
X-Forwarded-Encrypted: i=1; AJvYcCX5Pog5umjRTj6tGm4ZRGE+VfIOwnDzUEvNrR8yTfj42RV0NIUf1UdQ6quB6BCiK0uQGTQgxYF8NIF81W+FyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaK2ahF1Ax2vuujHQpp6uUkWzgA6x8k4SZ+QkwFjcfebLqfF3Y
	CKYAxaIrflU6E66pE0ZZyssYb7c1oV3w4M0a99glUX4pZ8Qa0Rs5FvHi
X-Gm-Gg: AY/fxX74764BqVCB9gmuK+yGk6mzVPDqpNwLW8CSm0jQpxYnFnWS16CnRvZXQiImcO0
	7G7P1FPEZTyZmoFitsjFdC0qhv8iTkGAnJZCnm/mdEF8XJn+cRfFcykZKdj20YgQ9liIkcqHTMZ
	kxPsg9pyzMD5AwRoNJsIijF1btAY6AGjFOzSQQD2RAOLxGSN812JaWb+fz6p8Nb+hD1P4cJqy+9
	oeM9yxrL5hxZFPqwUp6cnboa1T2vhV0aACjUc+JVQYTvrueF4rRAUHKYkJZQap1AIpY/4o9hfBH
	5WxrUuQ+P4g7MeC86E7FSp/9Ufzq5CpOf50CgieeBZr2fycBwtrnN75TM/B84jhEzvjCs44UBrt
	I4ZUEBi2h6J8Tjp8flJCEl52r6Gg31Hotyu0gmGiDW/ix/dSDMto751E2VTnRCqx3Go2AnOv7ow
	ckuaY9KuYhHHI7YHky2qMYVXZxu29AgWm5FlWfMrCzZvb2KDwJGV89SRQTOB5rQukojcXTp7hqu
	2Lx5a/Enwx5e38=
X-Google-Smtp-Source: AGHT+IEbRRGZzGujWcSUy0xGCmvJO9s2DIM/tr5qJ7KrDMoaQ6oVqoSAy936oz6+khGEi3m+dJtBJg==
X-Received: by 2002:a05:620a:31a8:b0:8b1:adfd:f850 with SMTP id af79cd13be357-8c08f657bddmr3283688685a.18.1766655434938;
        Thu, 25 Dec 2025 01:37:14 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096783922sm1491700085a.7.2025.12.25.01.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 01:37:14 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 081C8F40068;
	Thu, 25 Dec 2025 04:37:14 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 25 Dec 2025 04:37:14 -0500
X-ME-Sender: <xms:yQVNaa9gqC8xP3THqdxzxmukKh3HUKGi8emT874iWgZpND_VACX0VQ>
    <xme:yQVNaWjsM4lK2eGHNg2XLD5mpvPSh7pdaWPRkf4t_jvoV5a3fp3W2ZqEd4FPTzEp_
    uG7qhSYukof2Sy9Xl2K_UiUoSGLajvIegcTYOQoOyHUv14dGnPN0w>
X-ME-Received: <xmr:yQVNaVhW5xAU0gXRIiniTb3fKy2XwvhESYmWhbcG6v4-zEe0L_lNFgXi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeihedvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeejhfeikeekffejgeegueevffdtgeefudetleegjeelvdffteeihfelfeehvdeg
    keenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    peduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhighhuvghlrdhojhgvug
    grrdhsrghnughonhhishesghhmrghilhdrtghomhdprhgtphhtthhopehfuhhjihhtrgdr
    thhomhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrkhhrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhr
    tghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihse
    hgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhn
    mhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:yQVNaU7vLmlvz_TmzcKK8_GzqdrLXemwappQh8-qIqvrOgvxqbAxIQ>
    <xmx:yQVNafRDSgXhWrIjhsyh9Pp9n7AKTBJNjr6RAnvc-4qgnv0QQP4NRA>
    <xmx:yQVNab9kmwaFvijLW-Wef3zNk7ScOIt4bUHFqW-lXEvbLT50IfbPMw>
    <xmx:yQVNaYr9-SoXJgDtCavVte9R-z2AUlbCpZo1Gv7JzqP8QmEJcM1OuA>
    <xmx:ygVNaZX1HyyMaSe9_UxDPloPJKxV-eCNV6w9Smr60iJ45shfJfqdHfmq>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Dec 2025 04:37:13 -0500 (EST)
Date: Thu, 25 Dec 2025 17:37:11 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Joel Fernandes <joelagnelf@nvidia.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] PCI: Provide pci_free_irq_vectors() for CONFIG_PCI=n
Message-ID: <aU0Fx_w6ZSi-I7UQ@tardis-2.local>
References: <20251215025444.65544-1-boqun.feng@gmail.com>
 <CANiq72n1SX4OGFR4wNzurNX2RQki_ZmD13bBfywxxOEmw6cGZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n1SX4OGFR4wNzurNX2RQki_ZmD13bBfywxxOEmw6cGZg@mail.gmail.com>

On Thu, Dec 25, 2025 at 10:10:04AM +0100, Miguel Ojeda wrote:
> On Mon, Dec 15, 2025 at 3:54 AM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Commit 473b9f331718 ("rust: pci: fix build failure when CONFIG_PCI_MSI
> > is disabled") fixed a build error by providing rust helpers when
> > CONFIG_PCI_MSI=n. However the rust helpers rely on the
> > pci_alloc_irq_vectors() function is defined, which is not true when
> > CONFIG_PCI=n. There are multiple ways to fix this, e.g. a possible fix
> > could be just remove the calling of pci_alloc_irq_vectors() since it's
> > empty when CONFIG_PCI_MSI=n anyway. However, since PCI irq APIs, such as
> > pci_alloc_irq_vectors(), are already defined even when CONFIG_PCI=n, the
> > more reasonable fix is to define pci_alloc_irq_vectors() when
> > CONFIG_PCI=n and this aligns with the situations of other primitives as
> > well.
> >
> > Fixes: 473b9f331718 ("rust: pci: fix build failure when CONFIG_PCI_MSI is disabled")
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> 
> Related: https://lore.kernel.org/rust-for-linux/20251209014312.575940-1-fujita.tomonori@gmail.com/
> 

Thanks! I was missing that, and I should have replied Tomo's patch.

> I guess it counts as a report, so we may want a Reported-by (Cc'ing Tomo).
> 

Tomo, how do you feel about two fix approaches? I think providing dummy
pci_free_irq_vectors() is better because it's easier and aligned with
other pci_*() APIs.

Regards,
Boqun

> Cheers,
> Miguel
