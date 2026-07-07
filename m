Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F2841DEF7
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 13:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432452; cv=none; b=Ry0waklv0tmovrXddSq5ragWlMHLJ+BSSmXhimCC8UekXf0Os8zDcwZya8acs6eS3yCMlDSR2ngPDAKHuwHuDPJoO3FX2uY08qyQmVun57OquRTG6UapcfmU48aZxr3jSgDTJIw2CEAaB+R4hbN45jcoeXSypCbPkIJeeOtfdCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432452; c=relaxed/simple;
	bh=JgKqENFoGD+r2HcLqI6QzwLYU+u5xX6ykNoGtdPOJIs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FOXLVEx8MgQSqK8THQdHZKC5RP6V2vL31JrtKhpyKU2vux0Wg1a06JOV3zZez5LLYVSZ2YUSwbwPQEFzLFDiyOwCnXYfs11gD6YxRD2+ENrdaHxqnjjJi5IPmJgl6sma6i9RgbAzTpk4096xjALHkPV0hMvW1VSZV+3LrbKHAjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fQbX3A4Z; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fQbX3A4Z"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493dc8408fdso14053065e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 06:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783432450; x=1784037250; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h3qQIydnrntueQidkz9seiThuCHjKGkJFQ1LDomdEzU=;
        b=fQbX3A4ZaodvJ1La3wwChslkioo/rIVWvNeYFFhns6QuH6mOQFBckhNwRdHITr3Vas
         345AHVZK863Pt+XgvnpBwpK54/UQ/Za6gTOcH3Y52qzlqyc6UG7y4Mizml+S/fnlG7jH
         nLn5mKLIA0Pe64wMThbNWojDamTJijGVwvbBdbpNDeBaescoF6gh7ol9gCkhDbyhOC4x
         Ikt7uQgGnR2CkJha4oqzIPLhJt01oOvBZrOr99YTfBInb2SDCV40vGMhAQJhjbwXZ37d
         3dfhIptVGo2ft/f51pEjhRqL8tmN3L+50ZMyj+f5R6tK4mbHp9ykKQlqxhgnu+mUmiba
         e1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432450; x=1784037250;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3qQIydnrntueQidkz9seiThuCHjKGkJFQ1LDomdEzU=;
        b=srfu9K0A2Z6kj5RfHUDQpOYBcDnmIMaGdeiSApRZyI4R9k6ipotqMVmMan4MbzA9Sw
         1oAEQl66nq/w/Q5Jn8x98UjUlOe0ulyatEifllpi7nGEQU3On4Z2xU1dbJWb4YLDi63G
         Uy03BUCWNAXBH2ygCLIARzwMP+8XMNYn0ptPdcuqCi9ZVO83rht04kFv7YJVUx1ewctt
         r4I0wHJ9tWmcXpWVFhPz2IWMeO9JO9V2AZfcydPG7C2OjMmgB+2wXWSBNKQq0zkppPqS
         3ohJlxr3q1k4Uo8E/3byLF8JmpXjRFpZiyG0g1sGaeiv3LyRTHcaA7EoavyxihEbsgWA
         galQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpw1MChm+RLXyOS5YavTT5ayWs3XsBhy28NteCg4SamH+geJrclkoW1LF0fqrpYDUSULsd0Od/BzzT8OWN6Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynVPxIbvFzul6kzrMjIRnKnwTuZzAaIRebAU+YP4ZBXLTC5/Pk
	0ppUvNZh0lbBK4Qj1gNG/QhtXPNh90DEQEbGbesDg9x1iHTFzk7SanhuSqVqTjxBm6pVPQp9bga
	4FrdHBM2hnfvU4vkfFQ==
X-Received: from wmph7.prod.google.com ([2002:a05:600c:4987:b0:490:b2b0:c4aa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3491:b0:493:c0ec:9a5f with SMTP id 5b1f17b1804b1-493df08ce7dmr67025965e9.19.1783432449607;
 Tue, 07 Jul 2026 06:54:09 -0700 (PDT)
Date: Tue, 7 Jul 2026 13:54:08 +0000
In-Reply-To: <20260703210936.1128698-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703210936.1128698-1-dakr@kernel.org>
Message-ID: <ak0FAGpJtUH7VvHQ@google.com>
Subject: Re: [PATCH] rust: irq: make Registration compatible with
 lifetime-bound drivers
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, bhelgaas@google.com, 
	kwilczynski@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mhi@mailbox.org, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 03, 2026 at 11:09:21PM +0200, Danilo Krummrich wrote:
> -impl<T: ?Sized + Handler + Send> Handler for Arc<T> {
> -    fn handle(&self, device: &Device<Bound>) -> IrqReturn {
> -        T::handle(self, device)
> -    }
> -}
> -
> -impl<T: ?Sized + Handler, A: Allocator + 'static> Handler for Box<T, A> {
> -    fn handle(&self, device: &Device<Bound>) -> IrqReturn {
> -        T::handle(self, device)
> -    }

Why are the implementations for Arc/Box being removed?

Alice
