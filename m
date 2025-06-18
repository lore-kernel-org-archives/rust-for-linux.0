Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8AD286887
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Jun 2025 09:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238672; cv=none; b=XRuIV5Uu0PeusKF6Wcb6jM2zKKGRPMptkw0xXdwcuSuYIDgUAM5/8aa0yUR6eCS2m54HIlb+NbOpheARb0S++0YpK57q13tOe4wt7JljyhVG7LeN2jj5UATKgHlkFWWReHT2LGFA+A2najuErsZ9RWZzZdnb+iSDikHApXbSBRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238672; c=relaxed/simple;
	bh=ahGo0gZhCU3CeDsK6pb/bUJ9TVXFQfyAAc99pp1Tkuk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BKnYNQeBqMNmXLhhgE478tjdsPaR3zP+FGEWl6EPYszc0iabWdp4aYaz9XfOIggtT+E6LWlyTw346rP2LaAGARTVpP+oV7Ie5NmzbHmuNrotP9NdtLWIXoktIKI9tkxNRrBK88zd0UNMk+hRTyRgOZ9khzh/J5r3/jPlgZnGBa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tqB6T00g; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tqB6T00g"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4edf5bb4dso4445607f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Jun 2025 02:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750238669; x=1750843469; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ikmadVtxSuGulRLsrZM3Z70EtlcT0yd6ifXpM9KcROA=;
        b=tqB6T00gfHMZRS9uBIDmtvkiXfuJlRazNVTAF3JoTGMabOmDh7yjj5h0sSeW8jcRSS
         congenUuTVarRyOZBfYBqAfoOfCU2/gBpOQNfdUv+vrCwFVFgEmfuR67yo9nuVPpccsE
         txjIAkHFZSAUbqCznAjqL4MhUrmdGL4gc3/emtimBB15Wu8XS8T41Zq1tjqPDUBJuwNH
         SRTbRsCyGJwiOeX10kJHGzwLo4/eFmaigWrPIXIRghmtL/9Aj4Zz12OE2V3pp2Fc3coU
         c8lSqb2XBX3HHvSw1zbbeOv7s68hu+zLozeHM9x5ggCrieRW+kclsG28PpS+uGhftYiH
         8UsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238669; x=1750843469;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ikmadVtxSuGulRLsrZM3Z70EtlcT0yd6ifXpM9KcROA=;
        b=QvnANljEVroqDlGz1qb/+P9q7wl6KSxtgRHoN2VSWDoRC8UjwahiWTLpBfGwnDGd0E
         W/LDy4nbK1vbtpPTn7JKGFq2jWksydrBZwLpWFfyTDwa0b3Sg1EBzTdP0NgROb8Qd+r/
         W6Ccia5VnwSD5V5Gz26fKCMn+Jb2U8zuXg5TsnpjG/Kgx4FDqFQMrxavx9wpg8+BsVZL
         ZdOcVcT1xE2NzCCFU65YrYDlOSPnZYo4e0fJCx6bTc4NE2rh6NaXk+VhBq3vJVsKblXX
         VKTUvkxK9GG7h50z67vO4FdfSkWtHAp5oZp3iN0RoY+4l54xK29xn2IxT9BwRo0OCGjp
         6byA==
X-Forwarded-Encrypted: i=1; AJvYcCUDSJi5CpMUgc0FSvHt+KrKNtGyaRM5cm6NsZcQGoCzz9l1B9+XJ4AxwkyM96mfzExUt0peT5PNCLlFTMY6qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSljr5hzBtw3UINlYGewoFfYtiRgO4b/qxZ6n34PuQWlKfWXrA
	GPrmnGvSqoG1u7uRDVLPY+/w0+YF3TRBqYkR/RrlTG12aYci59bNkm+5vlpVRWSP3oHE2TqWIC4
	zl7RUBvAnz55IFBgWdw==
X-Google-Smtp-Source: AGHT+IEetsSD1WOYtNY17gx1HGwTCmQudaYjAErSn4cc8fGNGI5dUnFqbwBCgT/0uHY/f0RFOpn5wA9QwUUDcuw=
X-Received: from wrmk10.prod.google.com ([2002:adf:e3ca:0:b0:3a5:7b08:ede2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2007:b0:3a4:dbac:2dc1 with SMTP id ffacd0b85a97d-3a572e9a0e8mr14675077f8f.54.1750234895372;
 Wed, 18 Jun 2025 01:21:35 -0700 (PDT)
Date: Wed, 18 Jun 2025 08:21:33 +0000
In-Reply-To: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
Message-ID: <aFJ3DZbCwstu38G6@google.com>
Subject: Re: [PATCH v6 0/5] rust: DebugFS Bindings
From: Alice Ryhl <aliceryhl@google.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, 
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jun 18, 2025 at 02:28:12AM +0000, Matthew Maurer wrote:
> This series provides safe DebugFS bindings for Rust, with a sample
> driver using them.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Overall I think this series looks great. I left one comment, but overall
LGTM.

Alice
