Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA05242D6E
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 13:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763128055; cv=none; b=hCrP4s4/GkzFOEeX7/NcVywIbbjCFC9pX1iaZ5mr4RDaPqrEiTuZIg9GuvJY1uVB4xyLbJCNFgggRiiQhRoJnz+VF48lc7DHvMaj32ZWq2vFy5bDP3o5B0JyzXy7CjPWnr5gQvGxa/UNn9nD5GS9Oj6U970747a1o48PTFVCipQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763128055; c=relaxed/simple;
	bh=iheGEXsXqXGrYhEvOmoQMB9pkByEVJVHUjAmMOVCkhA=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=aXEoLhXAPrRPybKYWJfjj8w0dwR5PGM6wLlFvvkf/XgrgxAXuJp5yKT+/uzcGxkQxi9Rk70Dyhx2bZgR4M//EHCQGlV1Aj7nIval8qhrOjNHrHKVINTpKPJkKna1YUH9qK29aKO1SYitOSzeVAO3Mo+y183YIP9QzSKvVVOLzSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjBX3t7c; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjBX3t7c"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2956d816c10so21444215ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 05:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763128053; x=1763732853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0OGIqqbxkY/+pBYJ0RmQqVxWJyffj1yDrkKQr5hDbk=;
        b=LjBX3t7c7TZqtks/6dn+YS6oRAs3fT03Pd7UkjRDGdRwEZj0YwEjXvx3ESp/KRpiDp
         My7XD6sK7vbFvIDyRYC1d5EC6uTQrjb9kIPoke7brG+Axn7PzD74nHe/4Pp6oHlLIXxF
         Sqa9eDMdlTpZ8hLfAqJ9mCeJ9aPsU8fziBUd8Cdn8ozmrCMYttG6fQrGv7G9TbJJdCMr
         nEjXQt82WFCtQP+f/KHdi41JmmetUyOMYJp3qa59ccSYvFPlmdaU6mJ1tR3ReKEWL1yK
         JFmmVWHH5yny7HizTNc7pfWG2+vkrYgfXXEDQPNe/yCFk6xxgRWQqvl1g0cT4HVQ1adJ
         Ng1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763128053; x=1763732853;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0OGIqqbxkY/+pBYJ0RmQqVxWJyffj1yDrkKQr5hDbk=;
        b=jliGw0f2lRWDPkez/HFI0cLIYmXIw53dDP0PHyxUzhdd+jyKBYj7vtm+nCgCtx3fP/
         B8Ebol6T0SljglIJRmdZFTmcrYGUvbF/sPyVkb0THscdpEz9J3mK9kEcbKuTBudjJOC9
         bHD+kHJRDm0fjRCgNnC71/0I6FslaZw2Y6YupGbslvWHLzFbV/zgIcwXd7WMqjteuzR/
         qnYQbR0g7rJHa1kD8TXOscK/gYav2A2vyPMj+nbp3JzLvliLU20XHnGAd2RSbFsdA+zm
         3imPh3/L3zvH4D4F05hEOziQsDqphYdWDvTppWcL5zhtPnFVqoNPCPXkB+Fk33wr1JCJ
         NBPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV93jISasz0j6KPwEdh1IDA+rz6kwOpy8EMINAS7rerwKOWIY8fNcRe7GVOqtoVF6G4JRCcze/O4sfcLGtcfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNm6KynF+BlC0N6Lfm4StXH3nPF/8zzWHn/OT0Dtdb0zkKsibE
	f6oAmKwyxedOst0gjDmecIf36G7iUubuHTM5sXbt//Y92cmgHBuzUyks
X-Gm-Gg: ASbGncsvJqruxjtI0P72Su84kvvO9riGGvqbDMSIgdSoAMjJ4YZ74/N5PCO/aSkYrhc
	BIR/pfwc8JJuyPTUJJB1PK7u3h5VJAHXrb8occK/oAr/R4czTRnQhJB01Vbrs5buK79ZlZXCbzU
	nkLoy86bL3Epj4NATXMEnlnE9qI4b/pCUxh83HyxYSD+OWSlwc7/0XTanjvJ/EJTN4Ge1o1jfQV
	Adr+V3oCUt6QyE/8h3Ghq2jh9FF5akR3+SC6iAJlO0ZRMpRfxdY2sZPQxQ3YlQWiQ7dvObJd03E
	FHh/tIqdLWhkL0n1hrxBZUXrSDzA+spdDIcjxIP1Laar6kCr/cL5cfKPEdH3/EkQHb7hPp50JKM
	RH9bNXfK9G2Zx+e/1JyH1LAehT8wtValhlU2g+DZgmTCDrYkLAhUgv2QfVNFlvBq9SoB64kKRKY
	2LP87teoI7GxZEAEoA0ozGsF+dSBOVL1xcE4RgV9s+8sQHGWfUTEJuJOWAsbGGlmT2
X-Google-Smtp-Source: AGHT+IE0trkSN/tfFDF9LHCaoGoyHHKdKw/rpOIJM3/tL6xnLIrwDomDnB9FtxZo0YXBIDQmz30MfQ==
X-Received: by 2002:a17:902:c94d:b0:295:6427:87d2 with SMTP id d9443c01a7336-2986a76f56cmr37091395ad.53.1763128053336;
        Fri, 14 Nov 2025 05:47:33 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986e54f019sm19827005ad.15.2025.11.14.05.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:47:31 -0800 (PST)
Date: Fri, 14 Nov 2025 22:47:17 +0900 (JST)
Message-Id: <20251114.224717.1233258376593458686.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, aliceryhl@google.com, ojeda@kernel.org,
 a.hindborg@kernel.org, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu, jens.korinth.tuta.io@kernel.org
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aRaDjpYMPJtOfxPM@tardis.local>
References: <aRZ-bsCDsoLZgglV@tardis.local>
	<20251114.101208.202243876104759244.fujita.tomonori@gmail.com>
	<aRaDjpYMPJtOfxPM@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 13 Nov 2025 17:19:10 -0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Fri, Nov 14, 2025 at 10:12:08AM +0900, FUJITA Tomonori wrote:
>> On Thu, 13 Nov 2025 16:57:18 -0800
>> Boqun Feng <boqun.feng@gmail.com> wrote:
>> 
>> > On Fri, Nov 14, 2025 at 09:47:30AM +0900, FUJITA Tomonori wrote:
>> > [...]
>> >> >> Using u8 as atomic type instead of i32 would require a fair amount of
>> >> >> work, since at the moment only i32 and i64 are supported as atomic
>> >> >> types, right?
>> >> > 
>> >> > Supporting u8 atomics in general is tricky, but I think *specifically*
>> >> > load/store should not be a problem.
>> >> 
>> >> You meant using read_volatile/write_volatile? Since we only need
>> >> "Relaxed" order so something like the following?
>> >> 
>> >> #[repr(transparent)]
>> >> struct AtomicU8(UnsafeCell<u8>);
>> >> 
>> > 
>> > Please don't. Please make it work with Atomic<T>, also store release and
>> > load acquire should be introduced as well.
>> 
>> I wanted to confirm what kind of u8 load/store implementation Alice
>> has in mind, and whether it would be used only for OnceLite.
>> 
>> Of course. If we add something like that to kernel/sync, I agree that
>> it should be implemented in that way. If not, I'm not sure.
>> 
> 
> Yeah, I'm afraid that you want to implement something only for OneLite,
> and that'll introduce fragments for maintaining.
> 
> For Atomic<T>, supporting load/store/xchg/cmpxchg is definitely the
> plan, so appreciate if you could help while working on this pr_*_once().

Ah, if that's the plan, then of course it makes sense to work on
kernle/sync instead of adding something only for OnceLite. Let me give
it a try.


> Alternatively, we can start with i32, and improve that later.

Sounds perfect.

