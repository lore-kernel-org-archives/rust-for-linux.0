Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D8930DD19
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 09:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769419577; cv=none; b=jcAEIjM+ILbKHllODxdhrP+afc+N+xdHU6oiXR0Igo4ozo3GxYWZZUXsju/XTY+YyVUsGBVLUqvmqLJso2q/3edh9NbItvEJ2hFfBLQfeG4kkie68nVo6f/KWvw8wUAkZsJ+eGUj6xzHnEd+YmdhN2835lzpfgQomKCEQ8LdcSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769419577; c=relaxed/simple;
	bh=BZV4bqh00p5xO7ab42DjMwCGn0MpxW/4pb51CTwZlNY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j8F3FcluHla52NgxflskVj01XBkzHCpCsKc00DhEtgIpAVOtMEBnr12oswBbChPYSn0sf3iTlL9rSGTX6t4Ld403soU/1k/DtwkxSQJF2/xw10xxoDZEIVQf+5227qbwIz2md5R/LxHOSvjmCQTt7WJzGwPHJJa4LRpSvV6RRN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e1Lxm2Bp; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e1Lxm2Bp"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4801e9e7159so36437765e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 01:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769419572; x=1770024372; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2SrDYmlpec2mU4ltHI+/3rkdKueDkmdv7nIwgH3Ob/0=;
        b=e1Lxm2BpJbJRowXobroZV5uR59YNoTAiobXUOupe5yDXG0ZfV5AODTMF14a2jRfVHr
         hJdqQWyBCJg/tT2Yf33gqVr4zReWtN8R1qPwlTSHHZ/jTVSRD9fXW+mApVAtHlQmf4ll
         65Td0Yoez7Hwu65ZWHAeFaAALgctf3bogmXkbau9oxvumz4uc6xKeWuqDvk3yDBtPwOU
         ig/1+YSBxylSeji5Vlmd1fEiyiqCshFElBQ1onQCrapvoBqZmXw0lpasvUtqS1fZNXyR
         cEePUcc70bjdvnqBdYO7mED4pozXL7nQpMNL26YD9fWmYgsjcNvY62mkbx16MjdbhMGQ
         QgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419572; x=1770024372;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SrDYmlpec2mU4ltHI+/3rkdKueDkmdv7nIwgH3Ob/0=;
        b=W9YQIZPdj9RVX93Scrk1v/8mGL9mfLlHF2ZU4V950OWp3QgVRLv0kYJr/xAcNcb1Oq
         OZm+0PNNCIS7v37p9j74V5MvB+I5lQzU/Ub0FpqzLtMTF5taUUhmqz2rKSJq2IcGv0cY
         cprFHNnyqFlwO0qot8wrfhbvLiE4yLEl6ZVhIsu2UrGsec9XvNG7NpQmZAMq43NoHwAB
         ADaIcsjiIWdLB3W/h81N6ufrWGJaaCfbxgblML7VmNQL9yjiAsE0/FYMPS/yX2wy4ehw
         1Qf4T8fqNyCbz6Q2vR8aKzOU1nHTzaLRlqmzKdIvcCtCNnvQctU6r0LYMEJTVCtWpMF1
         9x4g==
X-Gm-Message-State: AOJu0Yy8PFDKNnQHxI0BLO5sxCf8ADwevplwbPmeilTaXf2PbtTTIczl
	Hcl/2hyrvOgNRz5lh+93h+EZLUFy5emN6nJ7QTfONj+tpY4o3DItT/0bvdnIfBMzc6lp9VLil7w
	CvD7DXN180diVlnRbHA==
X-Received: from wmmr7.prod.google.com ([2002:a05:600c:4247:b0:480:39fd:8dae])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:358d:b0:47e:e61d:b8d2 with SMTP id 5b1f17b1804b1-4805d0645fcmr67842605e9.27.1769419571807;
 Mon, 26 Jan 2026 01:26:11 -0800 (PST)
Date: Mon, 26 Jan 2026 09:26:10 +0000
In-Reply-To: <20260126071738.1670967-1-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260126071738.1670967-1-dirk.behme@de.bosch.com>
Message-ID: <aXczMrNTy9IjHOMD@google.com>
Subject: Re: [PATCH] rust: dma: add missing __rust_helper annotations
From: Alice Ryhl <aliceryhl@google.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, beata.michalska@arm.com, gary@garyguo.net, 
	dakr@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com, 
	a.hindborg@kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jan 26, 2026 at 08:17:38AM +0100, Dirk Behme wrote:
> The commit d8932355f8c5 ("rust: dma: add helpers for architectures
> without CONFIG_HAS_DMA") missed adding the __rust_helper annotations.
> Add them.
> 
> Fixes: d8932355f8c5 ("rust: dma: add helpers for architectures without CONFIG_HAS_DMA")
> Closes: https://lore.kernel.org/rust-for-linux/DFW4F5OSDO7A.TBUOX6RCN8G7@garyguo.net/
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Thanks

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
