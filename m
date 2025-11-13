Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEF02DF3D1
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 09:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763027760; cv=none; b=JR47vpJ6kmsjGUWcRMVaab6lKnkfpiGnDiFvcnl9/4IzQUIXjEL+2Q75EVbt6ntY8b9PlZuUXodxQhRajIuqNSanBxy/vEZrF2FwBpxXBmmIPPkavlpQK7Tzmr/t0OxAnvCapkoSslmU1RuuYq/Nx6XJKuSzoep44GgCFwREv00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763027760; c=relaxed/simple;
	bh=ZsuHOUxeV7843uHha4yGE9ravNUsczAMQTXtPsfWvLo=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=r7IR1WtzlyhybW7gn/3AoZr+EYqfXInkmkPkia9gGIw8iGYxZm03o41dZr4KHMu7pZEDkdegFmmM+7vyw+fnW4sLk/sI4/GDFvqMsyPpIgQxC5Vop+USPp/o9163mYsLZyuWVrBXALhX5dQdda+Y6z7dC/CmscrQdamJCXPhg0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kluSNYik; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kluSNYik"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so94826b3a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 01:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763027758; x=1763632558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=faNt+r0keeOc2JGCl5tCmP+3nBRHy196zoYOCapOnAk=;
        b=kluSNYikWPmIFqfI3s6gFDir/AbNDce0z5R5vMMjpEyKydXrFsOp0aH8e2MpmDc96q
         AcFc0E6FLWBTBz/mjfrVSD0cKdBpAZR5vxKBOkKN5NMUSUfZqCbOH3P/cN+ZIXn2mgXJ
         G2u7Okcn7WgAx93+PVQgwDyRvTlj6CzdVtw9FN9UrbHfnc28Yl7Wcxe0RUsIld/QzulU
         nLxjTAvOuWBuGBpaQTMvjWFk8OfrzK7cy9hWy+McGt8maB+VA3Pe+eIla+syvmFp9x/m
         FA4E3BygxUmacQPEygq5K5Y2lCWbWvqEexo3E6H7cYk80bV4vOC0y2xe45N1W8A91BSN
         gTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763027758; x=1763632558;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faNt+r0keeOc2JGCl5tCmP+3nBRHy196zoYOCapOnAk=;
        b=AK48RFw1GciFE88ob1L5lzv/nla++7Af8eVtQjz6ah62JfVrM7SWvh5O6Sy1cZnPGM
         ZMtNcUKdSPnqYsKIorR6gRo7MstBKhIDj6aH4FI+kx+Dbgjkv3gLWMKmdtHVCDYYSF1e
         QZSc5B3bhVynDA+7YRG0LTnwazrYOXkcpxny//XAvTC5LMeQ/WdAEVc91Qi8Z206D8rD
         T/FNxXvStUKCk9NiotwdWXUMJF78/0/fENr2iPtZnV4MIowE6qbsH5+hoMmee+4etHMZ
         fFTwUzX8+j1G06/JWpIaSKqdvAAQBGKRN+s/Z4rdELPOQG3j5mUcRGo4vYHwZO+t0EdI
         otOg==
X-Forwarded-Encrypted: i=1; AJvYcCU6RYdzy7vbl25geAEPnVXpaqZipCmGUCm0xhP5P4lifRigCCaH0dNfZvTkd7Bj8suP1mBr1hpUAMQetxFCVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt071CrF9JXiOG9moetgNfcffAG6oJ9bn2g5o2pjE9TLRIF3Vd
	YdnN1nQB5jEUSX7DkbDCp3GKNO8+Iw7CCamcfsuQDAhWVXhTfNEwrbWj
X-Gm-Gg: ASbGncsDbgfYl423Uptz6doJUr0OtWXApzhIgmaX2iUcjr67vNSYgUy4TdKZD0O69tP
	v1iFAaXzVl4haYkxz5Uws7qOLBkl5vDu7vbPSZ/veNquPoEHSpEfRAG3T52RmKSq15oervlQ2fp
	ntFHJzYPoIGzQkO7VWe4ef/dF8eXq/R8sFIAmsuhDByioooiAwxefjKBWUyOQxuyWW4A1XuQ0Q2
	3dMt7/2ds4d+FQbhrzciE5RDghhUeTwdgnoaM3tFrG+ZS2XbkzZUWWy7REfBL3PB/IGky1P38fK
	DoeyOzjZaUSM23ePdC/YMH533CbZcGJq8eoxf42hm0V/VcO/ODaKrz8fujKb2dl9ZBjObcsuCLN
	nQfghdW1ssrqIdZ2ei48L9Vq5h+yhigrWCr6MjdNY9zoU3ODWVtanq/feKHau9MCKU7AYr6SKeX
	PoteVdB82Zf8Um5ucn8/V+WGLLSHnlKNaIXVVi9Tom06ba5bx3Vp68Lg==
X-Google-Smtp-Source: AGHT+IFWyHv1TnrMmPmjIwXDgOdpj11MeCyF8JPUNzW3bQPKUB9DTeAr9g0ObbSIbmYglDP6LjTpog==
X-Received: by 2002:a05:6a00:3a0b:b0:77f:4a83:8f9 with SMTP id d2e1a72fcca58-7b7a27a4772mr7539586b3a.2.1763027757813;
        Thu, 13 Nov 2025 01:55:57 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924ae6943sm1772147b3a.6.2025.11.13.01.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 01:55:57 -0800 (PST)
Date: Thu, 13 Nov 2025 18:55:46 +0900 (JST)
Message-Id: <20251113.185546.1187876813414512901.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, a.hindborg@kernel.org, ojeda@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aRPkSKCQKSQU8hlm@tardis.local>
References: <aRPdGg01VDJucAfS@tardis.local>
	<20251112.101853.1558870636834355421.fujita.tomonori@gmail.com>
	<aRPkSKCQKSQU8hlm@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 11 Nov 2025 17:35:04 -0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Wed, Nov 12, 2025 at 10:18:53AM +0900, FUJITA Tomonori wrote:
> [..]
>> >> 
>> >> I agree. I think that even if the type is (), a race condition would
>> >> still occur if the init member were reset to zero using non-atomic
>> >> operations. For instance, the as_ref() method effectively checks
>> > 
>> > I already explained this, the debugfs writes have to be treated as
>> > per-byte atomic, otherwise it's data race, using "non-atomic" to
>> > reference that won't be accurate.
>> 
>> Suppose the init member of SetOnce is set to 2 and then reset to 0 via
>> debugfs. In that case, if two threads execute the as_ref() method at
>> the same time, is it guaranteed that they will both see the same
>> value?
> 
> No, but it's not because it's non-atomic, but because there is no
> synchronization in this case. It'll still be problem even if the reset
> is atomic.

Of source, I was using the term "atomic operations" in the way it's
used in the kernel docs (for example, in atomic_t.txt), namely to
refer to the set of functions that ultimately issue CPU atomic
instructions. Naturally, those perform the appropriate
synchronization.

