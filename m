Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A32D97BB
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 07:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767599730; cv=none; b=BmTMypOEMDV9nMU8pdNWq+Jowas13rVOInU5OdSp3DZ/heyWjt5kL+jA5v99h/KRjnnoT2RaxNYREG6sjPPo5fOjV2MfLIFgkbrCp393Txjtqx3RKzxCHqVeEhwx3Z6+HBUt2tHIyw4m2SCMnHWiKYyJ8uTIK31YFSNI5gc07SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767599730; c=relaxed/simple;
	bh=RXXt8awwSFKvIYuULPDTP5ly+vfpPmoW/YiHxyCGXU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+UEuSfUoeGN2NPKk62zwCjsCc+p4kcoGLn0wAArNZT9QIjVVuFH0HekJTtQjD8d2pEznlG2Kq1IRciXPdeZZr8KY+s6/d4u4KAEcqnNjQcEw7XF31QnER8xtUQyHZXaiTf8nAmkzZ6yWnzFQAmGmaGKRE1+uEFibTVQdS/rzfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Trf31pcm; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Trf31pcm"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8bc53dae8c2so2114696785a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 23:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767599728; x=1768204528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Or/cXZmh9MtTld9m1B9ORzue6F9gk9B51XzjBDT3vHo=;
        b=Trf31pcmyKgOKT92X7zZFfxHnNCckHWxOFCzaKaUO/4zTtUlJAqCPM/mF7V+eET0sq
         V1A0v4QP7dWZfSZxT6hAZOu5sEi6WS7jhxCleCoLHMOtnlyMahnBrS5Y+Rzd1rpG7UjS
         KoY0tLXwKxHE/bAzDY/slDjSanM6pk17tZPoGrUaNgJf0psasRGNUirTmvaj13D5Tv8z
         b0RzAaEfefux/x+l6Y0G+ULyHdrDEWGvid8jDVdN9Dn1X705fvud6J/yVaEREvvC7tcR
         NmKP02mxvHtDuIurnvTQS7Jzsi7l/02ykAvG0Lz7foF3K//axKDiAOCTegDKUNFyuXzQ
         TObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767599728; x=1768204528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Or/cXZmh9MtTld9m1B9ORzue6F9gk9B51XzjBDT3vHo=;
        b=j1G+C4Ga3f71LKQgTaRFML8WIWiozGS2lh3xkC87MnFdtRvkJ2AdXBHhP5MKk4tRi6
         9KlJaK2fyHdmPx0DuBKno0qLymiHLCHT/assiBK67emrJ1jS2ApNRVWyc3wSy/QvbP3q
         yUZBqDcXaT0khuFMT3SQVZUs7weUvLjVrZHdH/ppX5aPYwh9IBR4/UVr6KetR1g/NqWZ
         f4WiCt1UWMGb1WX7xslkMVf0dlmFj0xMyuGGP2LX46gCLUrZlskHq++1BUM0njONrrJ/
         4L8i5KBMU3YQoxdUOmxKtmQSG6pd+ryeordztUL0CJzhsVARHC3ypN1ZOMU7DelLRCxx
         wnuA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Pbixx5pwBWjMVbTrhesFLn7z/yQW0QAr2RR69BpOP2VD4PHrH2nTxL8kaLvNUPzEfB8Ip6ZkJCalIoxVKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQKw7tBClT7StslaBDtmR4WzmLJLAKejtBzMI0TPIO6pYW3Al7
	VpiIvEX68QYDuyX46A7XSDEtscCPO3Dk8MG35Bh+WvVoqNLQkXgTZazAsTiivgmk
X-Gm-Gg: AY/fxX5n6KoKJ2ZLljlRxwdvLvd77jsWFSwutTBiJUckFxwja4SAfJ0nSxmXqmrj/kR
	VSMO+9eTSgSijj08se1HF3iizdt7eEDfNXYPjAsE6wIgV0yrQ/AcDpaKeqTChP8HVPL2fxIXzQS
	VWYEDBJanL01yTVDeO0MN5YdLWdXJMrjd8hCEAGJJK07K7GuPhIelqStehOG2W9RYNpJWlAAgPX
	ilI9MCILw6eWYFYW6jyuqWab6VRGGcA2Wws5Bh13o1rs0VuQ7palYgKX5iHm6lfW289YmSC2M+c
	PwBMJ/b5dn44ShHM4MohIvezh6GXix4Kp5A6TXSF230TlVqOUPLoPB9wHOnCDdeTX/Siv2UXFUk
	ui8u8d0UfRnBzrYjr7/qtqWrH529T1Vvu4n40BZGYvCechj5zr1+ncOohmt9zLNadLyURNNdMMR
	s3pFKKrdVkfiCoTS+Ucn6p8c3buUA24F/KR3OB9sqMa1uqcZ/O8TssTBblSGu9aUx17/npJkSE3
	U5v3gFywhmyVa0=
X-Google-Smtp-Source: AGHT+IH63V4Hl1SMFCag9vqcyDXRo5X2DiiJ481/ikMEIRWKKkSDpXpdiCe7BpbB3ci2m1RmWSd1eQ==
X-Received: by 2002:a05:620a:1a0c:b0:8b1:d2f7:9586 with SMTP id af79cd13be357-8c08fd041c2mr7415266985a.64.1767593341154;
        Sun, 04 Jan 2026 22:09:01 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0970f5fe5sm3707510885a.26.2026.01.04.22.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 22:09:00 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 06A14F40068;
	Mon,  5 Jan 2026 01:09:00 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 05 Jan 2026 01:09:00 -0500
X-ME-Sender: <xms:e1VbaZwzYlsCzXtNRr5nSpB7CQ5boRjumQFQQQrsFUIsXXPyeOe-Kw>
    <xme:e1VbaeL4z3uiJfcBBuxEu-GeRzBQEp-z7YxtC01T5GuI_AqF6RjK8ZtzQKJlVVVFX
    DyVRMlWYRA0xmDkVumHojWnQb34NjPAMOvWoCK3T0Scz4MSkn0UqEk>
X-ME-Received: <xmr:e1Vbab5MzDCJuzEFwr9pKg-h0MFJmveUXP74ztkxaR6WPprxpIEF4Gmo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelieehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    vddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghkrheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomhdprhgtphht
    thhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrh
    ihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghi
    lhdrtghomhdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhi
    tggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhoshhssehumh
    hitghhrdgvughu
X-ME-Proxy: <xmx:e1VbacyvGrPjpYGdYkEyk2jrAEGwxbBj1JZOCKJT6tmM0xqxdsK0JQ>
    <xmx:e1Vbad8Icj3Uuk5frwROWI1x-Y0mPUhGAlQiTo3Gu36QmjoiL7KMRw>
    <xmx:e1VbaQELjYCBxqt_wfKZOf5uleDsZEdI50RaOwQYhAt3dD-mVcj3sA>
    <xmx:e1VbaXBOSPKWL0hD92chaUqOZcZwW81KfuYUrgLUQrGoxobTq3bi-A>
    <xmx:fFVbaUmc3U78m7SdT1pqM6EjnBZ5Ghc6BgI5DeUr4VGZDlviuN1L_x8v>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jan 2026 01:08:59 -0500 (EST)
Date: Mon, 5 Jan 2026 14:08:57 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Joel Fernandes <joelagnelf@nvidia.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Dirk Behme <dirk.behme@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	kernel test robot <lkp@intel.com>, Liang Jie <liangjie@lixiang.com>,
	Drew Fustini <fustini@kernel.org>, David Gow <davidgow@google.com>
Subject: Re: [PATCH v2] PCI: Provide pci_free_irq_vectors() for CONFIG_PCI=n
Message-ID: <aVtVed-vN1ESHHHK@tardis-2.local>
References: <20251226113938.52145-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226113938.52145-1-boqun.feng@gmail.com>

On Fri, Dec 26, 2025 at 07:39:38PM +0800, Boqun Feng wrote:
> Commit 473b9f331718 ("rust: pci: fix build failure when CONFIG_PCI_MSI
> is disabled") fixed a build error by providing rust helpers when
> CONFIG_PCI_MSI=n. However the rust helpers rely on the
> pci_alloc_irq_vectors() function is defined, which is not true when
> CONFIG_PCI=n. There are multiple ways to fix this, e.g. a possible fix
> could be just remove the calling of pci_alloc_irq_vectors() since it's
> empty when CONFIG_PCI_MSI=n anyway. However, since PCI irq APIs, such as
> pci_alloc_irq_vectors(), are already defined even when CONFIG_PCI=n, the
> more reasonable fix is to define pci_alloc_irq_vectors() when
> CONFIG_PCI=n and this aligns with the situations of other primitives as
> well.
> 

Ping ;-) Bjorn, would it be possible to take via pci tree? Thanks!

Regards,
Boqun

> Reported-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Closes: https://lore.kernel.org/rust-for-linux/20251209014312.575940-1-fujita.tomonori@gmail.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512220740.4Kexm4dW-lkp@intel.com/
> Reported-by: Liang Jie <liangjie@lixiang.com>
> Closes: https://lore.kernel.org/rust-for-linux/20251222034415.1384223-1-buaajxlj@163.com/
> Fixes: 473b9f331718 ("rust: pci: fix build failure when CONFIG_PCI_MSI is disabled")
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> Reviewed-by: David Gow <davidgow@google.com>
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> ---
> v1 --> v2:
> 
> * Add Reported-by from FUJITA Tomonori, kernel test robot and Liang Jie.
> * Add Reviewed-by tags.
> 
> Thanks!
> 
> Liang Jie, I added you as Reported-by because of [1], if you prefer not
> to have that tag, feel free to let me know, thanks!
> 
> [1]: https://lore.kernel.org/rust-for-linux/20251222034415.1384223-1-buaajxlj@163.com/
> 
>  include/linux/pci.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 864775651c6f..b5cc0c2b9906 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2210,6 +2210,10 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
>  {
>  	return -ENOSPC;
>  }
> +
> +static inline void pci_free_irq_vectors(struct pci_dev *dev)
> +{
> +}
>  #endif /* CONFIG_PCI */
>  
>  /* Include architecture-dependent settings and functions */
> -- 
> 2.51.0
> 
