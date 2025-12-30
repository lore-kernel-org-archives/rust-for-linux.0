Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36412BE657
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 01:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767058946; cv=none; b=LDY9Y4EzXSL0M7a+5V0qCuud7EBm7xorcl3w2+K/X4U4md5PKDyotFTAt+4cy5itmYPiJY9vm9wECMkgaS1QOoWGaroHtajcIixehP2K1jhmCB82O0dZqZHIVpLR7F9DkhXjDsh2mpUa2l27i8soJWBHhDkrTl7hgsliKjzGwrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767058946; c=relaxed/simple;
	bh=SV/az+nQQGZqRrPMjW+L6FIQ1B9FchmJEu2rCok4a3Y=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=l7SoOxUIrWIFJyMm+IBmeBBsn7ib7b7OsDmJQKrpIVMPCt4x6pBxOFhAZEc36T0zFvSovyNAgpgkRcybiAu6IU605A+N6FZJ+XksYVKz9SS/b26DvdrrgKhCheXixVrcl27RvBnny4KxojV9wqKlpb9tFDOcOzjOc3+3lv5BkKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gd3T8yU4; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gd3T8yU4"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34c2f52585fso8556514a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 17:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767058944; x=1767663744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvi8oT65YQWIOV8o9Ed5WOO6+zupyeKcxsj5RVAs+yg=;
        b=Gd3T8yU4zU9c9uYRDy0HuH/7CjlDDAqJxlO1Yi6cFrtOPXf1zAR1D72K8jPqxLER9i
         s8EwhnkyX2wVFDTSpghb4evM0cxkh/9EqSA51xzCiEDQLU4v4eNazOrghTtukXi/Zwno
         T/UvWGSnBqFSeTxAJn5l1aW4rqtWtSiOUHFlpUih1IXBScxHztfSl38wFYun5c9uxATy
         cpePRf1sj262baR19JZNPLduTTFinjMbNkvaGWkK+Iv+GI0BtxJasUrvI0cyHnEb4bqt
         qVU22AC1C2bpxv4tq6F6hBh/zzmIJYlU0Anjow4dtP669yNd5eIjFwpaH9B3ZXw6tFCg
         6SpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767058944; x=1767663744;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvi8oT65YQWIOV8o9Ed5WOO6+zupyeKcxsj5RVAs+yg=;
        b=FV7t0rdMYlj5EmycA61mkru0Sj0pU5xuGK48hL5et3+P31si+4kxxAcAGdOKpiMNVb
         ICqhdVsxgW30yqRdYMxXeL0tkA6zVRtofxv+bxq3rWXJYW4DOuRcuRD8iitGPNwVhWhm
         ZJq5O7nNGiPGuwDo6i9kOwJjiyCWngrGpx7+1Nhp4Afo/7GUxziD6xAyQ8nUxiliKkWS
         Wd9AZZnGWTQNilz+Uic75bEU95fXOso+5P47llhLDhoTLquLeaQ86OQXSgsRG7D8e9Wy
         lHsZ+kUu2oVcJNzcsZXS4LUURDiFw0gzYdjhoMXdYCBwNIp1ulxktPfGfdQaTKK8u8tA
         uQUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHxOtheZbHEbWXPwjsKsL7CiZZx2lnoKXFyRVRKDx8X5vnmWqE528hRBYGvaYbGonBk4cPYt2+fPvbYgchXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqNYz83vi8/CWFF5M142CpMDwdoSRSD3aiZFARpsZRtkWkGcnT
	erxCgY7axj2Zq1SqwWDFTphAhAZw6U6XmiT35TUClfTGzaJmh/mjdzWR
X-Gm-Gg: AY/fxX4/ym1/xRunu2t/wt/FyzssDxPZFM9C/i4KcKvhjkpwyoWt7JsokUEs+rKgTp+
	3JlwYLREq+oZbiqEilHxm97uy9r1q2PGo/5xgcY7rcU7CisR4+47vnTB1BZAVoZ21K03o611c7+
	wwdfWOIfVwec1qqL/2NpQb7OwuJ8O5/WAU18FGlV6qaerugcDBrVKMNp7G+2lGC9C5DAGOSmenw
	GcpZYgeZAJixwV5N4enGxCEpCv1SLNWDWhmeVmsqO77rOCepnTYXZjkMO9+nAKXe9LPXZenxeed
	xw6rsaQUQWMdH6z9aT8lOqG+2id/jYF2GNaKFQoT3x68mzcnF0Oxy0c8t4C9ormoUNihc5XxoVM
	TG6dwJsTPwQkLJWxU/KngYxIkmRWkZeX841mtgsi1HnMt/xTynYLVemLR/NmoA3XtXbWImAgWLu
	14/Olm7//E8tCt0PXn/iu0bMWoZ/pKx4QocLkMCBOWbVr4Ms7XRCIi7SgfTQ1kNDNw9lo=
X-Google-Smtp-Source: AGHT+IEs+feop/b6vR5W+sInfZx+PX0Xf7ym8mfF7mwYWQqCEqn0aF2PvKiUuPuGGE3HYdI22MiaHQ==
X-Received: by 2002:a17:90b:17d0:b0:32e:a10b:ce33 with SMTP id 98e67ed59e1d1-34e921b7386mr29250224a91.21.1767058943678;
        Mon, 29 Dec 2025 17:42:23 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7af2b537sm30366067b3a.20.2025.12.29.17.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 17:42:23 -0800 (PST)
Date: Tue, 30 Dec 2025 10:42:13 +0900 (JST)
Message-Id: <20251230.104213.6061700722666003.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, gary@garyguo.net, ojeda@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 dakr@kernel.org, lossin@kernel.org, tmgross@umich.edu,
 acourbot@nvidia.com, rust-for-linux@vger.kernel.org,
 linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 0/4] rust: Add i8/i16 atomic xchg helpers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aVMna3OX5gIZJKCV@tardis-2.local>
References: <aU-JcvYaOYznqD-M@tardis-2.local>
	<20251227.181717.1843883205283099818.fujita.tomonori@gmail.com>
	<aVMna3OX5gIZJKCV@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 30 Dec 2025 09:14:19 +0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Sat, Dec 27, 2025 at 06:17:17PM +0900, FUJITA Tomonori wrote:
>> On Sat, 27 Dec 2025 15:23:30 +0800
>> Boqun Feng <boqun.feng@gmail.com> wrote:
>> 
>> > On Thu, Dec 25, 2025 at 09:56:55AM +0900, FUJITA Tomonori wrote:
>> > [...]
>> >> >> The architectures supporting Rust, implement atomic xchg families
>> >> >> using architecture-specific instructions. They work for i8/i16 too so
>> >> >> the helpers just call them.
>> >> >> 
>> >> >> Tested on QEMU (86_64, arm64, riscv, loongarch, and armv7).
>> >> >> 
>> >> >> Note the architectures that support Rust handle xchg differently:
>> >> >> 
>> >> >> - arm64 and riscv support xchg with all the orderings.
>> >> >> 
>> >> >> - x86_64 and loongarch support only full-ordering xchg. They calls the
>> >> >>   full-ordering xchg for any orderings.
>> >> > 
>> >> > Maybe it's just that I'm reading this differently, but I think this is a
>> >> > bit confusing, as if there's an optimisation opportunity.
>> >> > 
>> >> > x86 is TSO, so even a relaxed xchg is a full xchg. So in this sense x86
>> >> > has implemented all orderings.
>> >> 
>> >> For x86_64, I agree that the wording is confusing. xchg always implies
>> >> lock so different memory orderings all map to the same full-ordered
>> >> xchg there.
>> >> 
>> > 
>> > I feel a bit confusing as well about the need of mentioning the exact
>> > ordering of these primitives on each arch. In my opinion, as long as
>> > rust_helper_xchg_X() is mapped to xchg_X() in C, then it's clear that
>> > they have the ordering of the corresponding C APIs. But I keep it as it
>> > is for now, I may remove them from the commit logs later after I
>> > re-think about this.
>> 
>> Given the current implementation, I agree that the ordering
>> explanation is redundant.
>> 
>> When I started working on this, I initially thought we would need
>> architecture-specific ifdefs to select the appropriate implementation
>> for each ordering, rather than having a straightforward per-ordering
>> mapping like this. That's why I added the explanation about how xchg
>> is handled on each architecture.
>> 
> 
> I will remove those ordering explanation and I will also apply other
> changes to the xchg/cmpxchg helpers: we should use xchg() and
> try_cmpxchg() instead of raw_xchg() and raw_try_cmpxchg() because we
> want to keep the KCSan instrumentation for those helpers.

You are right, I should have used those. Thanks for pointing it out.

Please let me know if you'd like me to send updated patches for the
bindings. If you prefer to apply the changes yourself, that works for
me as well.

