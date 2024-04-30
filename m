Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC4774E11
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 22:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714514804; cv=none; b=ahuHepslmGX7LZFrdDeGFf+IUF27fqfIN2OosOZjBwGVSwcTReVYQsPFbxhVYLnn/iVml3FBT7cHFRyi1ChxQSAnpfZhHE4n5q/V6X3ZNJb6J2z+a0Rw6/X+vApbIssjOxVesMlL5HbHoycBDD/pRqUovMRmx3+86IgUwK8OOBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714514804; c=relaxed/simple;
	bh=0dfuTfN5Mi8kc3+Y5Jro2Q8w3kdPZ32de6qXrw4Cvg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/2xospEWiTIEUaMeqGmGn1tnRp2rUJrMFaEQdUYHDAwQo8bTZzvh1S9+2IR76UJcHloZYIhqNbvz8y7aDz1EP4/kQ4JS5aS2U5nYLZl06crd9JA4nInp6nUQTGKNB6ovfiwMDSdGD7A2pfGZNai/idoTwbN22Y8pkYA58vPtpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/qeaRM1; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/qeaRM1"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-69b5a87505cso27015066d6.2
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 15:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714514802; x=1715119602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzMLBlumCIS5ZXchijMBDEtRNL1TD3rcmtzQklxXsuE=;
        b=F/qeaRM1D9gZmGghqaz3kKrY09D7t0+Q4rAdC0+ucXJn/8unvWIYEht8ebr2jAos59
         ZkiARMapDRv7/fBtoPAiKp7q/ETim0UuAnHQzWtTT2E1Bc3My7eskQQ7/VNuVK3cPh5P
         GbR+P0oknQpu1TNxd+HcaeZkjZTGWL/uq+mwm6ESxcFqOUZZDCbk3MH0CFsWiSTifwm7
         UmwSds3RnJcDNs5h1kqyJ2ECkeKjjtxco/MhxN/PivRhsoA1Gsl0fqMRSJfkfPVKka/4
         gr2VLmqjZAyQgYqWuX+5YPc0/6CNd7q5pfs5YrxQlanr6707hgLOJd1tFIr7wWbjmfVJ
         BFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714514802; x=1715119602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzMLBlumCIS5ZXchijMBDEtRNL1TD3rcmtzQklxXsuE=;
        b=IFHBsN30VmdBQZ2RSg0SW7ZqUncC6MLWjnYf27VurxCxP47mfMHQPwuqHJt7Z4mi2q
         Ljhwn+XiUOSrdE1hE02YQxV1EBLaTxPrTpTg9o3FM5X/l0HO9aSrxaI+pO1xCY7DoAW7
         7CTJyCvkX/ufbSiCcQumyu6lR6ff6k789Gu4X/FCp4iPX1Wmmtq3INadkIkSl/lck8BU
         ZiGACAe08dCBCcwS6HpmIXdiNPk8EKhXloTLxxRWDZ9ElHdQgq8boxumkVh/GRiaqsdD
         uX70azCaSroD63TaVhvOaHL59Dg/cqzTCavTdAbhoz2KnsqwehHGf59ByzliQonLobdD
         xqqg==
X-Forwarded-Encrypted: i=1; AJvYcCV/YmDQvtiYdbgKTsRY2U+HyzhH+VRD++uOwVgQ0mfByJtbxZgLdZOxOSLaQHvcOqGStrs+toMFqMbC+CY55G5G6jK3yB0B0EckehX8bfk=
X-Gm-Message-State: AOJu0Yx4CRoXbyggSS51ZpRMA63NcB4p8yOWS8ePxgTY5QOJzMeBIenp
	Xe033qkTcySDJ9lCofwqstuwydqFRhvCqtQrLdUD+N0AqLXtaZBZ
X-Google-Smtp-Source: AGHT+IH86X9kFoA845tqcbZGYYUU7McDd9i3LgMG4cV9Cft31dQ5F9rcUe32VmeEPYPfKeqr7IXHWQ==
X-Received: by 2002:ad4:4eac:0:b0:6a0:c929:7905 with SMTP id ed12-20020ad44eac000000b006a0c9297905mr816176qvb.27.1714514802130;
        Tue, 30 Apr 2024 15:06:42 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id j7-20020a0ce6a7000000b006a0cc19f870sm2459841qvn.9.2024.04.30.15.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 15:06:41 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfauth.nyi.internal (Postfix) with ESMTP id B70561200066;
	Tue, 30 Apr 2024 18:06:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 30 Apr 2024 18:06:40 -0400
X-ME-Sender: <xms:cGsxZpFpEBAVqM0BbTRdvl5YGWZJ1kPZhFaf2buLdA6gQrxDKdrgSg>
    <xme:cGsxZuVUd-16vJtszSVdINXmNHLM7KXpz8_K4DD7rKOKvqPZb5Sr3pAHOAYjolebm
    up2DEci4jc5xmsklw>
X-ME-Received: <xmr:cGsxZrI7kSL647FqmDdNgThHOuVi5l0F4yvp45cDE-vdNokzdpO-Fl1s6BI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddugedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueeviedu
    ffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
    gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
    igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:cGsxZvHCc9zrlyRRPZ42YlCpy2tXFs2niETiTP3WCIrPDyP655Hx3Q>
    <xmx:cGsxZvVK3s5gnRULaRc5xXF6kaSmYM-0kALQLHeKNZEmewhopZN9EQ>
    <xmx:cGsxZqOkwNzFMhHM5To3RGFvQOav9iaoRKAlAcYaVzHJVmf_5LOfkA>
    <xmx:cGsxZu0c0qS1PRewJWIoazZJPXqtggkDHyb-XwY5Ks13YhpQKGdI2Q>
    <xmx:cGsxZsULoCxQHPSUGYzPAhA3NNgCTWIcoamXCY0iVJB3cTk2C0ugaML1>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Apr 2024 18:06:40 -0400 (EDT)
Date: Tue, 30 Apr 2024 15:06:15 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
Message-ID: <ZjFrV2u2vDNolphe@boqun-archlinux>
References: <20240429192435.2235-1-dakr@redhat.com>
 <Zi_6aDHO4B_iY9zF@boqun-archlinux>
 <8b68878e-2ddd-4f31-9f82-4abe638bf148@redhat.com>
 <ZjAYpsFROI9agY_L@boqun-archlinux>
 <ZjEfW6QpErDDnntk@pollux>
 <ZjE5gzb-aDNyK2Xv@boqun-archlinux>
 <ZjFYvPyTl6UaYSrn@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjFYvPyTl6UaYSrn@pollux>

On Tue, Apr 30, 2024 at 10:46:52PM +0200, Danilo Krummrich wrote:
[...]
> > There are a lot of testing happening at
> > linux-next level that I know of, and that's the purpose of linux-next
> > and -next branches, so fixing a bug in a -next branch is not uncommon.
> > Plus I generally think a pull request is the same as a patchset, I'd
> > avoid adding a commit at last saying "this commit fixes a bug introduced
> > by some commit in the middle".
> 
> For a patch series, no question. For a whole subsystem pull request, it's a
> whole different scale. Maybe it scales for rather small trees though.
> 

You're not wrong ;-) It heavily depends on the scale of the subsystem. I
do see the point (and examples) that subsystems with larger scales
"Fixes" their own unmerged commits (e.g. in drm or netdev). But Rust
tree may stay relatively small, so rewriting histories makes sense to
me.

Regards,
Boqun
