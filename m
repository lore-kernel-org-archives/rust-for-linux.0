Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD163126A9
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245570; cv=none; b=kh+vCURmoU3GnmrxGvZ4ttsrULayFZ0ZsqvqCpjpmjcq4msD62x1ekGVD2fWOC+T/47jXUtL68abXqh1NeCXwTURJdqCpMEPx3Thr0vg9ygTk1CA6xWr555hV8nnhXwfid47oMSuLcOPIcxjNfcmFFUSOba7od4CcJe14N7a3gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245570; c=relaxed/simple;
	bh=h2sULprMiu4wN4KAUeGPmQvu2wQnnQR98dqeeRGDV44=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r7k92/J07LErbwwYvPVj77hRtQWKOdwfJ7EHdCL7qdfF1AZqTGywpLibf7j4Xcj6Wx5JiM4x7yr5aPSnMTnTcr6slNEcpn8x3xD1YWSARosEORn1DPt28ljV9d6dc8sqL3KoQKnivaoBxtzKK70VrHxcg7ERVawJ4bSMdl025+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=no1UisIr; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="no1UisIr"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-64095177aedso4269676a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 00:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762245567; x=1762850367; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rXJXC5xQMOSakE6z31ZXBIwOFgfH9N+KP/Twx5AGmg8=;
        b=no1UisIrJsCM7qet0NJuKdKWova2m4Ls081wkarfe88DruZ9Pwz+a3hlgoH2qy4/e6
         moi984qQbD6EL1DN/YEJxZTUu8CWZr6hLfOqZ0AQlj6hanDC2RXDgl9kzp68OxZbGt19
         J2ByH2dYKW0pTU7lwFHJF7rPr4rR8iKqzr/Sy3iq1fsOKh6PQNOIJhUVBVLnhH06/egG
         FgSXgpIfZJ7cupeS13XjcLNB4shcB8bvxGtLtMJpw8VptsbDZBuTU5b1V6boMsSQJJsP
         DkSo43H4A4B8vEZiwJQ+1E4smYePfueBa1rRfv3DrQVPJcxIXNuyMbmgeH/vdomqSFxj
         AtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762245567; x=1762850367;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rXJXC5xQMOSakE6z31ZXBIwOFgfH9N+KP/Twx5AGmg8=;
        b=X9NYMacaIqbZeUorU+EgNa437ckbYoay4+RtP5F0rjbS68XNLaTF/V+wvqAoG91qFO
         cm27kHVYsR+Ks5VlhtNGlY+0pzYbeinAlWDn8PJjPrPTedz+MgVa2UrLFkhWuYHWEEXB
         OvB/4Wixb3VHj9pPTpo1DnddvjzgjaxR6ObzWpRl7q/BoXKAH8v+sm4sDym0w5yG5LfR
         5Ssrnm1M094XdvYOYiMX81GeLjSdjWX6xVK4cAs90bLkYMNdxE0uzgf3ux8NJ3SlD79o
         QdLJREKQo1PeoOKRjY8prJoPo6cw0Lc9Kktt6WWLnylKW09coVa6/5bYgZJmqpo+wxCw
         uIIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfg0bZQCPXTMnah7dCpJfsqwiRC/mUPYKSsdfC3Td6PYhtRPJTXjZaF59YCkgFnSGs0T0m0DwwJGGG2i0xkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyki/PgFs3Yi7eOxHYEqvQqk2gdi7jvqlnKcpsSUQBBq09kk8HL
	KdAs791j4YwVnE/paFZyXAwzlGlwSbI0lEtv2ptlNIjRf5UaxZWJIceZv9agTpByVA2vmkCcM7E
	i38V2M3Ims2FpLy/qQQ==
X-Google-Smtp-Source: AGHT+IHkkLru3RbEHbg6oteE557RNvxiRGcW+0DLs9KKkh37U6J5Frmy/B6gSA4955Mr/WPDvyloEY0RzOh+CrQ=
X-Received: from ejclm4.prod.google.com ([2002:a17:907:18c4:b0:b72:41e4:7530])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:b859:b0:b70:b077:b948 with SMTP id a640c23a62f3a-b70b077bc3emr512890366b.35.1762245566871;
 Tue, 04 Nov 2025 00:39:26 -0800 (PST)
Date: Tue, 4 Nov 2025 08:39:25 +0000
In-Reply-To: <20251103190655.2326191-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251103190655.2326191-1-dakr@kernel.org> <20251103190655.2326191-2-dakr@kernel.org>
Message-ID: <aQm7vReThpKDOO67@google.com>
Subject: Re: [PATCH 2/2] rust: dma: use NonNull<T> instead of *mut T
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: abdiel.janulgue@gmail.com, daniel.almeida@collabora.com, 
	robin.murphy@arm.com, a.hindborg@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 03, 2025 at 08:06:50PM +0100, Danilo Krummrich wrote:
> In struct CoherentAllocation, use NonNull<T> instead of a raw *mut T for
> the CPU address; the CPU address of a valid CoherentAllocation won't
> ever be NULL.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
