Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FFF390C8A
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 10:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658585; cv=none; b=iD3EFmSz+MEQcIcgM58vehz39QnOgjPBbbvSjOXCbppTXuK4bk72Naf2WGiH8tgLbvF9hjgci+zAoR7lMswTU0nuCIx55yCWToCSBQxXo4mt3Zz8DPfmM44B+q1A/jal8L+z9w63jQo17kF7NPxgRmdYc/gOZtZvGykO5+5ZNqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658585; c=relaxed/simple;
	bh=UsrG64AdOhup+wZBugoJxKc7YGItuood9RNG/AVe/pE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r4cVKP3s4hQ3G6XMPITPSWa0dFNT5S6nZYbelXiK8E54nUk8nj/dd86z8szOf/wc7nZ2/r6EsmjbV+wuvOtqtgtJhiTRJCwnNnceUtmjDD+10+MF5U2U5Z2TjJBlzouJSolCsfNKW7d7YSSbrgl/yHgufA31qhS0FW82mjGK1sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Et7Fx+F/; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Et7Fx+F/"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4853b0af42aso67485555e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 03:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773658581; x=1774263381; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/z1SiqPCUjiS0l1gYfp55UVRcWnc3c5gpJsp5+gG+GQ=;
        b=Et7Fx+F/K0livNgzpWkxm0lDeD3B0CP9OCpBTPmi4vlih/NCJD06O2mZe3+jKqJpT+
         QMiz9z7+7JYrfjXxAofK1n7KgXDlORGSrKR7WlebrahTOsmVx21jMmmiaWr25YCsfAcp
         uFxwv828mgm1zoE+AuJo5YkO18czJzpy7WIRptUnDFFXbGVuXem81QzN7mgBRwN9hlk0
         4Q6AZ3suC20pw9X8DkFhDWk5G4XtUecwwZ2FqfwNd6TrgqhX9NISj7+7r9JQQCvxDIiK
         RsYAV2dKFEkSoRBUDwI2pxD7aYO70yfLlOAZk6KU6bRRn2+czsTX0eGzb+oRTMICFWqe
         t/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658581; x=1774263381;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/z1SiqPCUjiS0l1gYfp55UVRcWnc3c5gpJsp5+gG+GQ=;
        b=WK1SueisD7GeZf7h7nl0tg66tzLX9mjP4WxMJM3C6sQLihqrd8zHfsgeM4raoN7HOA
         n+28lQyfCmKnoYnXTA/lolIevpOoCuEKSdNLNnOBJQeWVM2AIJiyUXsNcVVFVLpAZDHG
         UPVbTpcwqHYJ4lTmHo/h7jaHydc46LnnjVDyjEOUH9C/Ksa/M442QhG/n4Qk3n9qqcWS
         eQ30leZhI1LHGcHXUocESjnuvlOEIdM6Bs6cKwd8V4HAYvECCSNPSZnXdnxV3VmegBIH
         ODMnM2la0bl4iN7FlFjAnBqdDzXAlXiyC/Vy0R8Kab5rwxoZ36Ud+C0SmAYv0/uqsRAQ
         1iyA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ6htK2obqBCSoHndMp+sTwecZza7bmcbr9Wxx700y+YS2o7P+MAB0oW9+a/ok7ujYhM2/zaHasQYAsnffiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb93w3GAOmRlokZCPQTHd5YC68lZWe3DIhqC31VrqrQDtGEtIh
	dljuALVloEoMvDh49NtEK34LNlARH5jCe9BlzxTWpL1vD4Vzb4NLwpzkomEJVGZinWdnyPtqTps
	T/lIa2Gj7WI1RL+UJPg==
X-Received: from wmbgx10.prod.google.com ([2002:a05:600c:858a:b0:483:a1ee:5eca])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3515:b0:47e:e57d:404 with SMTP id 5b1f17b1804b1-485567066a8mr208531255e9.16.1773658581102;
 Mon, 16 Mar 2026 03:56:21 -0700 (PDT)
Date: Mon, 16 Mar 2026 10:56:20 +0000
In-Reply-To: <20260216-rnull-v6-19-rc5-send-v1-23-de9a7af4b469@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260216-rnull-v6-19-rc5-send-v1-0-de9a7af4b469@kernel.org> <20260216-rnull-v6-19-rc5-send-v1-23-de9a7af4b469@kernel.org>
Message-ID: <abfh1J8_4tOFkFaH@google.com>
Subject: Re: [PATCH 23/79] block: rust: change sector type from usize to u64
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

On Mon, Feb 16, 2026 at 12:35:10AM +0100, Andreas Hindborg wrote:
> Change the `sector()` and `sectors()` methods in `Request` to return
> `u64` and `u32` respectively instead of `usize`. This matches the
> underlying kernel types.
> 
> Update rnull driver to handle the new sector types with appropriate
> casting throughout the read, write, and discard operations.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

This has lots of unchecked casts from u64 to usize, which could overflow
on 32-bit systems. Could use some CAST: comments or similar.

Alice
