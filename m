Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EF2248F68
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 01:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763082746; cv=none; b=hyzXeuzgmmeUR/e2SVA/pFV8lDUOCkEX0jCOTMPDQBA53ioQoj0Q51FAn3pvl3U2XCbWIqHek3ybstwjhfDop9z2jdT/ZyH2vl1JtCqMezjNLIYguKIl0Xfmy5SdIzo8Qq/PditAIdhDh0fNBp+q25p2WWZ3KdzwVdH73A0ab1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763082746; c=relaxed/simple;
	bh=im/91tSFBLB8sz4UUZ0FmZPT/a2q0q4kltzQQRHw+J4=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qx/bE8LD9bZzop+/ltNGo1B9XXBkKWxqu+YE81tHXk4vnPeTOLk8HA0DhvmP74OxtKz203JRUlU5x77jC5541fcH+qESz1H8/AKSzluJNhs5oaclB9Z81JrI4lM1CrKJKy3Uf1tL+2JpLgbZC7ysi7sWr4jA+tc/PMgshADMYkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZZCPDJq; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZZCPDJq"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297ef378069so13814095ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 17:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763082743; x=1763687543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9u4/eqVtGdZYGImQ5uUqVjv1ASSav/pGLn3dxaThOM=;
        b=IZZCPDJqUllgGC1y6YBxSmZQx8N8lj8HyI0cxUJjkugvxvhFDpEb3UDX1P7Bnoofc9
         wgr2ZAW9F34dJGIqUD9cf6FP1uVeZT30wMUZybVCR2eSk+OMk97K8M6i5hBl+Ns0gr15
         nLXoqBkjgv3CCJZKsvWmOfPxCeWlB7ZygFzaP3Mit0lGVW9B16JxmkUoXDIYbj83p9m9
         cDWh/CLsEZwziJrv0Iu9Hb/AGpkBdM/Fy6N0YfP2Yjvpi2FHkMzqHXHzWiVj8pXgwF7O
         gBG832U6uiptzuPnXlIwPaQlNhN5qTkSqks1Dr/zCMkpzMYVXcaL9f/f4UAYBLJN3IC3
         rmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763082743; x=1763687543;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9u4/eqVtGdZYGImQ5uUqVjv1ASSav/pGLn3dxaThOM=;
        b=bntGC9SiWf52S2yiQ9nMJcE+6GHELp3QSDyzV4cvlcpi1ensylVHtggTVBy2lw9/Mj
         uj8PBtd78IZ8atWp6OryjVN9I1rxbZkjgdqAKe/aYBfc/QROoziPty4+Drugb7WzufP0
         g4sAFkUpf5v62hYMBSug2catdn6vZkeT+/7WOJzoPHyionBYyUILX/iB8DsuGScS+LfE
         nNNtovkNqBP3BWlHLo0R+G4e7vkGE8RRoTcPF3aD9docQ1Wm9L9uH1z2iCnQpYeDAjo3
         wBUzsmbyxX/mx4Sap7T2ItGrSZ/kAZLogLLYV0yLisFJuFKYcTIn3M33U7m1sQlRhC0O
         l6sw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ8KwcapRXiCc3RlveUT9Cb0OYwgKtHmHS4Bl1p9/Vw2UHG9RI9bkfn5MCQ9AGf9RyhVjPsuTQ+ZtUTWsOGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRCRK9H01KY3iX4cEs+4fMnKTsF1J8XjpeLfSrH/Uq2Pon5hXW
	twTCQNcJ68KQT22VVt7UI0HC01HcAro1MRFOA+XMYu/YKOZHj7o7Txb6
X-Gm-Gg: ASbGncsXIGJgzoU7lmN8J9dJGB0Ll8mcLaGobCjCwxijyYjivDuISoLmd8B/3MRcNLZ
	4T0+5h9jYl17z+CABvOwGyHzLgMNmfy5QCuBY9dw56QJDE0NyJTEpA3m2RoGySbtXfOCq2PiwzQ
	8nrWbBtX/CGun1nYoxpl+bcVbeXSCDUNRiDZrziiZjGrIjgJotgRqMpkhDUylLgxjaRmKR1qwdW
	BVKcPEbafIGZc5pX78Ce5ye6AO4arExnuwvnYh0wpStli0XXwpgkqWgX4SdMvYc/3XCRDMKiMWX
	LlnSQCYtt7jdo2QGbrJyjpjFAGp8nnpYkgJWwXRDl+eKtXdDxhzeg2IPUgQfsh7/0k8OaLRPJbo
	ISyd6+6Uadb+kfMxFUrv9em4puEc+4l1arVO0N2SHySAdZ9J4m4r9v7m5KR4+4X8ScsA8xnSwLn
	LYsqRtHobZev53paNV2hUxzL7rAi3l2CxQafl3HTDGP7Ru7m98AkL+By4XoxGUCRfC9qTHNPOLX
	kU=
X-Google-Smtp-Source: AGHT+IEBcWUrwYsnuOWwFGJ6ryzI6eDQME0Hs3ZjCK8BB8QH7SNqUpb7s1X1KrbHEEonpJ6T5D/oNQ==
X-Received: by 2002:a17:902:e543:b0:28d:18fb:bb93 with SMTP id d9443c01a7336-2986a6b8261mr11360425ad.7.1763082742924;
        Thu, 13 Nov 2025 17:12:22 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf1ddsm37240325ad.92.2025.11.13.17.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 17:12:22 -0800 (PST)
Date: Fri, 14 Nov 2025 10:12:08 +0900 (JST)
Message-Id: <20251114.101208.202243876104759244.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, aliceryhl@google.com, ojeda@kernel.org,
 a.hindborg@kernel.org, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu, jens.korinth.tuta.io@kernel.org
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aRZ-bsCDsoLZgglV@tardis.local>
References: <aRXJuUTR1fnWiBQF@google.com>
	<20251114.094730.791355531242483716.fujita.tomonori@gmail.com>
	<aRZ-bsCDsoLZgglV@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 13 Nov 2025 16:57:18 -0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Fri, Nov 14, 2025 at 09:47:30AM +0900, FUJITA Tomonori wrote:
> [...]
>> >> Using u8 as atomic type instead of i32 would require a fair amount of
>> >> work, since at the moment only i32 and i64 are supported as atomic
>> >> types, right?
>> > 
>> > Supporting u8 atomics in general is tricky, but I think *specifically*
>> > load/store should not be a problem.
>> 
>> You meant using read_volatile/write_volatile? Since we only need
>> "Relaxed" order so something like the following?
>> 
>> #[repr(transparent)]
>> struct AtomicU8(UnsafeCell<u8>);
>> 
> 
> Please don't. Please make it work with Atomic<T>, also store release and
> load acquire should be introduced as well.

I wanted to confirm what kind of u8 load/store implementation Alice
has in mind, and whether it would be used only for OnceLite.

Of course. If we add something like that to kernel/sync, I agree that
it should be implemented in that way. If not, I'm not sure.

