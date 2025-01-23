Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18BC21147C;
	Thu, 23 Jan 2025 14:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737643506; cv=none; b=MF43peqAovULB7VLZYYz+I4SlnG6a+iToI7a0NIHIcaI0Eb+SUPH+NqzkIHqq64EOmttEUld+XJ9GZsNXFG/+7ut2joqpg//0uWlZhyoVegWwITEFxo3GUiilpsG8gZPcmrNVFNrnVxSmFwx/oIxBxgQodBoMiWmeLYVZfBDjxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737643506; c=relaxed/simple;
	bh=59TAt9fjZIpo6zMhv5/0UQlSV+XK+wUgVioWGViGU/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=appQnYQxwi/FsYR5lKRzOWFuPHFza8mfJl4fHu2NHFeHcCIAwgl1nxJQQan7DdYLU8TLoaGvmH3gHJDykc8zjYUgTcWMu5rfrTRNlRMevCtAa1mI8BdXXSUWaq/jaLm/9auGHsJu/lqXxIcha0kMEVDtV9K3upK3dmF6Rk2YSGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3XeS2IA; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3XeS2IA"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f440e152fdso238479a91.0;
        Thu, 23 Jan 2025 06:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737643504; x=1738248304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59TAt9fjZIpo6zMhv5/0UQlSV+XK+wUgVioWGViGU/4=;
        b=X3XeS2IAJrJcCxCknwqsyI/naf83B07FrKohRydkjcipHbg7S8O1xg/nxNsLC84UzE
         0BtF2lbZDCMUZ3XvptNq9kB7e1CbSE+5cyQcLM+mWR9CCqOG2Ysj43O6rUd6njScZrXp
         k3ro3qSnE0XOW/IKykI80W76n5wxchJKsI/DfN00qjq4GU9LqRRCg65Jn1zAitkYowsp
         rmgz33/C/2KDK3tFRUPj5Fdrz5DHNnQW/yHlBKTeMlyFvxgLE0IdQXc8x7ZPGS86VkOl
         IUCH5L+lz5nqh5K4UCklo3E1nfl3R1IrZctT8K4SJATz2vzHrnGPVepwdfEpFCrd1BmK
         g9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737643504; x=1738248304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59TAt9fjZIpo6zMhv5/0UQlSV+XK+wUgVioWGViGU/4=;
        b=R9i40NmcyjNhG/phlM86PxQ2fsleRHMOagpjVsRja11EHb+fPQG9rFMg1N49wLyGUD
         LPBOPvcDzI0B9hGk89KV+SxQ3hmhpoTX0cXG5FAR4TDh7ygVm3H/H9B7zz15MQC85D/m
         gxpwxTEC2+jamJwO0E7Y4Kt5Z1bTEkrU4fuKLjFKPXPLmEmg2ie7YeO96BvbkciL9fSe
         gZ96xTgTVVEgmeaBgTOasARAFbhoFVzvvznSNz0YeoXQhw4psXHvodxPtDHAC4lsD7Fg
         y4ogOsesxagOu7RffCAs1oi1siEGDl0on/VwBeqKstsAMttEv3ALuOBWS1W5vU/7FnSV
         p1xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVphLgM9JhoNrpnNmOblE4oif0Y63sTbRMCCISWWSQW8Q6tE1gCF8NDe9NZBdEvS9KoLx+7NDs5S9aZ6nk=@vger.kernel.org, AJvYcCWKRIswuaKuKw57d9FlPF3ImGUaSFgkjGKWh9pYhecfcO4gLL1M23kkvMIkjqGwiqrBwn5aSLn7uDZc5sv2z48=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8GqrtpppB3hBdo8lRgSOebj8UKqFDV3lQoy6NLK3VzUWfZJkL
	ItashlCEOdSgvVD3gUHFtc6kMq48sikg0zE4KKvMPHAJHrB56VfPRWB+Z7+IkEYSnRLTRYZU9V/
	XvFQpdiUK16jUkDFBZU4i/EK89UY=
X-Gm-Gg: ASbGnctaTpc6tLfFd0UDNT3R7kok0wq0XBhAKIZbFU01zQgDXiIjeeq3GiCx2IFjZ16
	zoj/l4gcJr4VAfPmATO6RfuyYWdhcM/FD4lT8J8iIHh5zenAaot5xWkbYMNZcxQ==
X-Google-Smtp-Source: AGHT+IGaQ0gL/+/weHSk8LSL+JDfJmOxyxmBXryc7xtAqA/LRkVP4oLH/9+rQROG89VDB/4UN7R1ubytmQDN51o977o=
X-Received: by 2002:a17:90b:3ccb:b0:2f4:465d:5c91 with SMTP id
 98e67ed59e1d1-2f782f9d2b3mr14018439a91.8.1737643504187; Thu, 23 Jan 2025
 06:45:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123104333.1340512-1-abdiel.janulgue@gmail.com>
 <20250123104333.1340512-3-abdiel.janulgue@gmail.com> <20250123132940.1f3c2666@mordecai.tesarici.cz>
 <cd25d3a6-c203-4460-ab7c-81fa4b56c566@gmail.com>
In-Reply-To: <cd25d3a6-c203-4460-ab7c-81fa4b56c566@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 23 Jan 2025 15:44:51 +0100
X-Gm-Features: AWEUYZmkksCt9G3YVgZQ6w0QIRxra5paOEbubhos0RuTJ3C_JxEeFHK6DmYSkm8
Message-ID: <CANiq72khT0LgvOd+JfYVx4iZpTVMzCDUiUteukHLjGOA_gLWjA@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] rust: add dma coherent allocator abstraction.
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>, 
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, dakr@kernel.org, robin.murphy@arm.com, 
	aliceryhl@google.com, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 2:38=E2=80=AFPM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
>
> Miguel, what do you think? Would it be possible just include this change
> and the one below locally if you think this series is ready for merging?

Sure -- there is more than a week until the merge window closes and so
on, so we will see if there is more feedback and Acks by then.

Cheers,
Miguel
