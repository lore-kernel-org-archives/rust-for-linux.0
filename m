Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0A5313545
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 09:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767172073; cv=none; b=cmt+K2qskKCJkinCuHvpb3RBLkSWyfhEeQ73KVObw7CmlOzOfqEQe5yihAzjsGhhdeluG50dmcbOEPZ0AlQFR0m8SapWWbtYpzhXgiI+HTRsGjvVzyt/d0rqsBB5DlDIhMUeKPtGfnU7BhZgg4lEabiijvADftsh+Lv7Ga0Nawk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767172073; c=relaxed/simple;
	bh=BJ4NS6aPTHzZHtkij10Sq8/PDCOeFtd1plTMRVG0oPo=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=WHpM1jTZxlcXZQ0DM0X9/BufvWakY6hlC4fOA6ZyPgEZtB/89Ls1GnehU0bWEDu4YbIjwjXPTrogByx2iKJlg8665mF9sMSRaXtn+RCO7xrJNpExYBOa1mypLsgBhVp6Jm70fs1FpL/U4VfwfJF9YIOz7D+CQHr4JZAsRfFhAhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+y4TSHZ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+y4TSHZ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0fe77d141so116537425ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 01:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767172071; x=1767776871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2csFpJjsQTZAVzVJuElk+jEYxwXUNGktGke9qD9bxc=;
        b=h+y4TSHZ5+t0Ba1HE1bwlfeKBUT7aowhrot3uHVewh9Nf+uNFuMdec76CvFHYZNbm1
         qQkGEb8i9mhf0Vc9DCB6OyBzTKFAHfFmnkjPTd6RPHukMoxbz01Gam87cD9LouHagLkx
         56f0v0+1dTynUV65mtetjYEV3Zdh7s+HK6vJNfXbVCxRmLBcjFeOeIdvGCKCIOzmBQrl
         dUUV9tN3TJgfKSAOmYYeHVViovow37vICIP4mMazgoN0NIdan/1Z4p3X+ZohG2UN6cIX
         Fi4F1GoCP9wPjKY1gT3YdkspdGjfVFVvqimY9P+mFE+Limf36PSWpQbltiNlfY7OIDNa
         ILIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767172071; x=1767776871;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2csFpJjsQTZAVzVJuElk+jEYxwXUNGktGke9qD9bxc=;
        b=nn8/Hvz7CkhAQf917rcmWDhYC3/eZyTn5DuQqXyQKM9L/hwKjWN8oS3SnrNPITIzi/
         xK+/r+EzbHxmaqaE/JKtAQuAmbDelO9RpNZ9uW4aOkUI2JYB1YIwxXDaUtSCOoPNQmIm
         fpGLuaEMNQIT4nFTz6BQFp9Rn3ltXFQYQbBOLzptaYjMr8aVLsxuBvshfpdINSi/umMo
         CiRwuRbPzVtlmSgXiaeSIVKPPpZoYSfelgYsZA+SdMy70HDEZ+0KhcC237JR+GKPPTNW
         05+ro0rvc4z4SLU6Q+1kyni5BAP9SFUoEt8+NxVTO+00mv/htX2+YojFdB7ryIVW+wjm
         9PqA==
X-Forwarded-Encrypted: i=1; AJvYcCWHWi898dzCl0/r0UcbTDUjyMFipjsARGHCK5pNPlPe8XBlYbQMpNJO2IXJkTQiwsKjtp+osZoxKR5UaPyVGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHxpZTpUxm1sxh4x1m0+hLr83GjrI1s9f9nO4eRbR4Q5whxV4B
	YXm1I+JJxrnQDMCGAadXTEjqE4hCZL4MrYAujYGTg7j74PHXmv06Q+In
X-Gm-Gg: AY/fxX4o+02NV6vqj8PFg+3r6Y/3GyJCZCHjaa7rQ6sfv7hNcpmxCkxB+Hhh2PtgR43
	Wkb49b8JzKuNWgJnmeuVdKtLGBfhlGDsnK4EHIk5NyXWI885vK0C58b97rf8cnkE74S/495iLVr
	0S9j+d1o5WZKXcLZgNO0YmvAPuh3yDzOApW012ZbSQ1f3DwVnzEsK8PFBtoTzYqwV9f/J0Q35Ew
	fqet+Jfv9y2IVbkpzcugF54LgnI1P00jYS3Zbmza0AN1e0HvBU+FB95vF7mQOb3Fh5l9BEhG/mH
	Hbgzn/xPvKuwOHrDxzawpKpghK214wlVrdIlNPA/Pl2phDzsxOWRbwYnjcdHOSAQ/R3N0Cki0kq
	4Mg4iey5GAcmmt3h/mtLhgh0rk4AMcc3NAek/xpuhDnQgo1iylsbSNiX0kkYosbcjeZQdkTdDnu
	V7GHSUdBNV0SJn8fC5lD/cdAzOIMxS+kmFbcghx38dejYLANkK+K16YqPZ0QztF24Bqr0=
X-Google-Smtp-Source: AGHT+IGqBssE1o5Zv8tDd86gub83G61yutZTpn7g+EFYoO26Zb60qQ4FWLgBllahFipMXd1XrXA/uw==
X-Received: by 2002:a17:903:3bd0:b0:2a1:39cd:7462 with SMTP id d9443c01a7336-2a2f221278cmr311412805ad.8.1767172070848;
        Wed, 31 Dec 2025 01:07:50 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8279esm316307685ad.28.2025.12.31.01.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 01:07:50 -0800 (PST)
Date: Wed, 31 Dec 2025 18:07:38 +0900 (JST)
Message-Id: <20251231.180738.11732647006485259.fujita.tomonori@gmail.com>
To: dirk.behme@gmail.com, dakr@kernel.org
Cc: fujita.tomonori@gmail.com, gregkh@linuxfoundation.org,
 ojeda@kernel.org, rafael@kernel.org, aliceryhl@google.com,
 a.hindborg@kernel.org, abdiel.janulgue@gmail.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org,
 robin.murphy@arm.com, tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1 1/2] rust: dma: fix broken intra-doc links
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <2ee56a65-c618-43a5-a050-231a3ebaf3be@gmail.com>
References: <20251231045728.1912024-1-fujita.tomonori@gmail.com>
	<2ee56a65-c618-43a5-a050-231a3ebaf3be@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 31 Dec 2025 07:08:44 +0100
Dirk Behme <dirk.behme@gmail.com> wrote:

> On 31.12.25 05:57, FUJITA Tomonori wrote:
>> The `pci` module is conditional on CONFIG_PCI. When it's disabled, the
>> intra-doc like to `pci::Device` cause rustdoc warnings:
> 
> Typos?
> 
> like -> link
> cause -> causes
> 
> Same in 2/2.

Thank you for pointing out the typos, and sorry about that.

Danilo, would you prefer that I send a revised patches or will you fix
them when applying?

