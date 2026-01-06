Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA4D335579
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 13:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767706216; cv=none; b=iH8XXf2WYXKE1vBb8988sGX0QHxFan3/IY8Vl7kbqJmKyniSULF5/WXP89SX1E7gN33N1EzURWhBSrDdAQ7xjPDmU+Dn+6v6zZv96NKHmJzbIjMp5h9rKQkLtHl+gdWtX66dSdR6/JWPBGoaJfJPToy3Zoma/3Q3sfr58rleTV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767706216; c=relaxed/simple;
	bh=79wUL8+MzaOwQ2U7shDb1UZWWAWSsgwCL0Jgy/egVlc=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eJAOldrFqE6BOW5Ia1OPztSWnXGH+YGbwa8bxGyj9yqyXG4RfpJPNKMCHqc8hvRAGYCgrPRmHm0hmZ9RHIXOiiFu9UwCE/iNcGWS0Kf46eJka2rRknmyqwo7nOBBbP0LRB4eamj6dSWJVVnnWPfkKLgy6zFYJas04IlVw4avXi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpRIIY0b; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpRIIY0b"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7ade456b6abso865596b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 05:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767706214; x=1768311014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kH6gPiHojgPMq8ZXJ6RVibQ9Q36cA/iXytWSANCCBSU=;
        b=HpRIIY0bqFN6NKg1Ay7/pvCdjwJp9v48hLBKukaHx4x5LGYsKIjWHjVMvJjU+78ocz
         5lYRs8H05Sc3VkNDr9XoMeIRVXHpxlglLqQAMmmStaLj++ktLLmTpbFyi8USnGdOkqyV
         cKKF/UNGEGlcOOBlXOLHX8ZE/8eWv+Q3ZKv/rR03v/12jCRHHNoDjtsCgN1mMTiZyx/o
         ccuOOY9dgW/jEOJHMylnSAqYogvvEV5zUBNVE5W+MbpaBevnUIwdIA9303XJWbQcul+m
         y1pPH+7pckJj72BCq8akOQ5fLRnRM4JATpfbRDGrrLz4xNVVxlUOon4RlKVKrHSzb3F8
         8Gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767706214; x=1768311014;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kH6gPiHojgPMq8ZXJ6RVibQ9Q36cA/iXytWSANCCBSU=;
        b=eZ0gsOpClVnvHjjIehpLhOLn05t3uWVj1EwdxuxsEhaSBLKJmEogLlDJoxfNv7YcXN
         ++UPeaH1m5zateg6wT7hqiDDhmOC7FkTpkDNJN/IuJ/6PN3/B18EZCuVt4EFPeyRkz+K
         Ho1H2PDBNfhB95PniaIqCCB8J7nyXKMjOO9U4xQXgr4FAeB4A4RRWFkGQAf7c9DEoGN7
         jE4p3TrVvoyF7Vu2n1KuODBbgVPb/9OLzqPDbCHJK1DEsDvs8SXAf7kBs9is04wemmld
         hUY5HKMYDESi3R6rhhhN9DYu9z+CtlBaFVJBVdDmWVUvEOQqzLnccA3u1vXWyhY1V3wa
         XSRA==
X-Forwarded-Encrypted: i=1; AJvYcCU87SknQLEpaUcl7G9/PnSjf+tVmVhNWkt05QlLxQGZd2tFIrbYY2OwL3xPVN8xNIw4Q6EPkpiEm1LWfnv3Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoOnskvGSM2YBQdw4jsnGZngduccKOGcrAGsZaEtNN3Aa9bFCx
	kpEh1UlOWfWf/CX6kXYkjeQnaefhjAKmbpkhQ5A46E7VSyTpfmC3PaJ6
X-Gm-Gg: AY/fxX76mLCQg2mDE7BdJdpTWdLx7CZmIhNylggmswIuqi8BeYSecauunAp7N2oSNab
	SD2+c13vuvUAjy/F22UGO2WfXRSD0RqIhcg3PZKn4N2UJ5wZKzqIFoo4dCC3cFWmojsK8EQWWtr
	dYT8h9CU6hxObos7Gd1PDbbYNDQA0PrjI32Lu34c0UVmTt2uALZo7yy3QXcDvUeJa5P0mxLkwJr
	g54ounkbRu76nuDMGueF+Jgs5rfEaqge81MGYi29mmDw7P1LJAnjyj9oZs4V6pNVZN/Qnv7Pd8P
	CcC7VLu+TtkWlLI4guTVHxXAcCrnstKIVwyor6P8VamazO56jsTIh3oSnjYx+nu6WghOBJIJQO8
	PdmfGbTum/YTR0XHXZKlpWGuv4bEFDVL4NXaLE5s+Kgui6dmEPVfZkKhGEBkP2Mj47Xa5eTGCd0
	3Our+SeLWBmnrLmN3SwB1nSMxaqiYLJHjMu9DDSgVQzck80YDS0zolBfJHKGodqQd0lmE=
X-Google-Smtp-Source: AGHT+IFdszWb1AVWkR0MrH4I8Lr1Bt/96yPfUAuddIHA3E3KbYedZe+pkqMHENxRvXalBgPCIY+nJQ==
X-Received: by 2002:a05:6a00:1d08:b0:7ff:acc0:869f with SMTP id d2e1a72fcca58-8188038c8e2mr2895137b3a.3.1767706214282;
        Tue, 06 Jan 2026 05:30:14 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e983fsm2289349b3a.55.2026.01.06.05.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:30:12 -0800 (PST)
Date: Tue, 06 Jan 2026 22:30:06 +0900 (JST)
Message-Id: <20260106.223006.975482344774303287.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: linux-um@lists.infradead.org, x86@kernel.org, richard@nod.at,
 anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, ojeda@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH] arch: um/x86: Select ARCH_SUPPORTS_ATOMIC_RMW for
 UML_X86
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20260106034034.60074-1-boqun.feng@gmail.com>
References: <aVxcAZe6AEXEfx3G@tardis-2.local>
	<20260106034034.60074-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue,  6 Jan 2026 11:40:34 +0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> x86 atomic instructions are used for um on UML_X86, therefore atomics
> on UML_X86 support native atomic RmW as x86 does, hence select
> ARCH_SUPPORTS_ATOMIC_RMW.
> 
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
