Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73BC1465B4
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 07:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075386; cv=none; b=BxQlr3LztOUktf0qLxm9HThE+czIMsIRg9hKjaNl5bVL5koPpBaxUy+/ijjeM0qVpC9FIhoDaKOXE1pTi7PXWxojpwG/8aIGBEMP9Vm9e8iAV5OI7DEBt627r+SAXYhhhWWmvSrR68xdKQJDEPybZZOWInfswyiFmP2LhMEvZtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075386; c=relaxed/simple;
	bh=TCECRQJcAYVw3jtmXt1AJ6xdYBvseXrqZan/JuUisrc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W/OM57XmQNvaHOGeVyayoeELZqRPQyY0PEmVmEymDpxxHA0c2EdOlTs+Kpx4jzqZOHJy2NfLMP+IBSXPC5cRGZJqiyNKPH0ze/n2xrhCZ+W2kSrNHwgjEheYSWTxZ+yECrScmesRnE7LtIdOAWgQ2jd5YmBpzEi3YTdi/F+CJ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=olb8+Ldr; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="olb8+Ldr"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490ae0167ceso29559205e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 00:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781075383; x=1781680183; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=78iEgvzKyAdyuFVRGpjwerAcgZljdgErta3DcqxTQ1Y=;
        b=olb8+LdraPrRjhhnNMTgCXohjPRDjFmJJPJgZQ8xC1BR+83zsRm5WNfIrQpw/yJsWy
         V87xtmLFy3l/OYR/k06RRK0m2cb5eDuqGnBYU0r0kYE3PGXBpQTdAtMeIudO0yk64Whc
         hydAhDozstHZGeKhFS2eWoWNsV8Gdc5Du7AXAb11kKXrXl5N+CRITez8u2Nxq1jqBW6U
         BgSpu9AHjEwsJbEbZwSXvpEi3yBWs/M1HFAqzsRIEBReGax/CAGzfnWSfnEb3Jt8g4oQ
         RFoPgMs8Hq24VmERqMdOHyPqS/PNX6A+zOH2rOgp8+viugMIkuQQ3ZpAB/CbQnXIsCPm
         ijfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075383; x=1781680183;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=78iEgvzKyAdyuFVRGpjwerAcgZljdgErta3DcqxTQ1Y=;
        b=gG3kpA4W/xRcgDRy5uYRHoCPoerCvPHp3o/OnPRt9GR5dTTweUgUX4OI58N1bq0xTQ
         yKMtYnSZrT7U7skMXNH/85BijEQjWyGeSEpPP54GOJYBPAjV/DFrW22Kes0QI+09Us27
         vxIQTE9oZGzpYVPv7DwlQoUNTI1u0kBhpEzZATJeJ8DlSe2Y9aW/JRHiEkwY9zhGzL7s
         b/LDG0xT3Of5L6EOjTUM/KkdOsUPWI/gmpdMFU26TGnJJiL4sGkKjaARIiEumpSNj31+
         fYjbuOiATY9eykpm6Bq9tEIjSodfNOICnU0MSOJ0G+wNmHCIGvnZagcNhORjCLk4wpxP
         yOJw==
X-Forwarded-Encrypted: i=1; AFNElJ/9uCauIfuYH3lVaDXxlm55Q8AswlYHdQk3cLbYUpuImxGl28uwODNZkua/Os+8Eg2NwA21v7k04cWdzGkAaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YytaXELF6oOWKevjB/Oyy+wYTCb8Z3UGacK4LF+u/74iD5oUenu
	FA11H83CuRmohC0exCxrIzvyMtL8ZBzxbd1JIkDOWGKJ8ZJjdPIdDuSwSlB6khvo5zAoNGKOmFs
	Qnx3H9/pWbQeZ0MKXRA==
X-Received: from wmv18.prod.google.com ([2002:a05:600c:26d2:b0:490:6e12:ab28])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3553:b0:490:601f:d776 with SMTP id 5b1f17b1804b1-490c25afademr358041555e9.3.1781075383301;
 Wed, 10 Jun 2026 00:09:43 -0700 (PDT)
Date: Wed, 10 Jun 2026 07:09:42 +0000
In-Reply-To: <20260608-numa-node-id-v1-1-28480299c62d@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260608-numa-node-id-v1-1-28480299c62d@kernel.org>
Message-ID: <aikNtuKoJUP49WZf@google.com>
Subject: Re: [PATCH] rust: alloc: add `NumaNode::id()` accessor
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jun 08, 2026 at 01:47:35PM +0200, Andreas Hindborg wrote:
> `NumaNode` wraps an `i32` but offers no way to read it back. Add a
> trivial `id()` getter so callers that need to pass the node id to a
> C binding can recover the underlying `c_int` without reaching into
> the private field.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

With #[inline] added:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
