Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1039B29B228
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 21:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760996049; cv=none; b=qjI9edaPUtQd1CRkTT83yMo6p1rLTiliy34LohMg9bpHlAaXLavabelGRDtB+whhaF0QMqVgvMhJyGl6fpgN64L/egaSTIVgHF9dMO0hEmEUHZYJqh0t+T/P/Sx00KcXl2fiOW/5OkY3F20FGkmPfFR8wm59mTJMA7TPxTA7fRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760996049; c=relaxed/simple;
	bh=TIA8kHBtPk6GgWmqAWWXnwTpPlJ3gJjCHeq/XdJy1Q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lNrIvIcSKWy3RopzNfazbe6RI5Wj45L4RjLY6vI2+mimRwz2FEzPgsy34fOyFosTLI29gQTCvl1ezX0SYN5er10McqmewbPoJ9adH54Vlun6tkKdcD6ZoI/ZotSDVjIOBUOiN8REcfUb2z2u2dmA2FU9k5tM443fil/gi9W1L10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfC0+dAB; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfC0+dAB"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b6a42604093so124996a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 14:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760996047; x=1761600847; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIA8kHBtPk6GgWmqAWWXnwTpPlJ3gJjCHeq/XdJy1Q8=;
        b=PfC0+dABzi7McEPnvNXL1o/SGhMP6mPPuVFfSs/N4Z/v7KcBkwXhB8C6WEEpTjviEB
         mBTHjyQv5KuUNSCctqXDV40Om8VrnJLYoRZO6Ri1gqA6muV6O6Ec61kQDHTR1q7YFiGQ
         +HQGcXlcemS5sTORHQ9oDXebIBzXM5nSShozdgWlC94FDtuOHMaxeBz1Web5psx158xp
         q6EhJ2KfN4yl3dZl/JgGuKOn1JkpyOi/athv84+iZiZAShJig2ZIBWPV6G/Z4k5+q9ux
         PFEgLpy6Mld+8q7mki7/tizk4SY2j09E2T/fwxQ9cm/9jBJda331/KbZBoCrgxU/u20T
         wLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760996047; x=1761600847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIA8kHBtPk6GgWmqAWWXnwTpPlJ3gJjCHeq/XdJy1Q8=;
        b=r2vq8qkMLeOK1Jn4RQ1easqAzqvqVnw7UNeEyKmOXl8Ol1s+p+YBulNzbWNQxoVf5O
         Mmh/UzqDa3XF6KaujUScPz2i5FvBuXXQYeqyRR30J8L7MZUO1k99uApBGRSkK3EF3j3X
         QmCPqJgGIwg8+5H4HHggT4P/r2eJxrlevv/5C2pU5hzrGKXuj7dfpMfyFSgKkuM4I8sM
         AT35ffLux+0CNzggleRiDzCqrSAapxcl73cnU56pGiJYYzGFCTJANzIQoPeaR+VT6c5I
         tiMRcHBK1CJ3KmevY6jcG+7eiYrTmup0vcIC/7zuoRxwWmbYMEbjOJpjPTGc4lhTK8Nb
         9wFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2yBYhqDJKssMpQlkW+c2IUOHAbokHx0u/g/BvPjZRf+YvGPpcz2LbSH+1rZ3q9JFxEofzYi0j/DAd8TP1Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUqQS8H6jHjcrUnZrR73UKFPQXFIWxVCavVxfHoqI+N7iu5+52
	gkVdKGoMEzqqYB+0EjI42oIyKO3d+wmYXL1VLtpz1XY6Imi4Go6nr9mygUqbkIfytDpBPy3367t
	JjjCI4CzkXCxSG5qvTHBUx6Ozvd2n21w=
X-Gm-Gg: ASbGncvByPu0sViQODuMtzsFoStYTsg/C3IUhYT6AvOUz73Y7hIZlN85AT839Citgqc
	LYtEyLKaKnyq8OhyN8ew72Pdl24+9dgSW1oHSeLXFbE7Vw6Cpk07fddsEMSbd2rF5+nxgMW/6GP
	vSMovpAhWcY/Ah2bOe/enST+LBF5TIfvvYKyBB0JtwEkCSMocc/Hvv4TV93Jsh8cws0VDgYLN0D
	Zarzg66+XrVXwqKYdLRaj0avk734gmjSujIOqlrWYHdS0ase+9a62zvovIsRZcsGcjCNb873yRQ
	cfrlaZzmjL/x7NOdBfmJS/L5lZJxIsKH2h7yk/nFdB0cKdaYj5LV3oAVfeBLDd9v/wWl8N2PFw6
	l9+Simgwy7yuXxQ==
X-Google-Smtp-Source: AGHT+IENeHKMjyzGTYHHZV28uVbTm7W0v2W0HGYIwZ1YpX54wVhZRXd1wDtmMhBidXjOzxTnYzIEdPK9TNFHSokqIok=
X-Received: by 2002:a17:903:94e:b0:26a:3c75:5241 with SMTP id
 d9443c01a7336-292d3fcce91mr5493965ad.9.1760996047308; Mon, 20 Oct 2025
 14:34:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020185539.49986-1-joelagnelf@nvidia.com> <20251020185539.49986-2-joelagnelf@nvidia.com>
In-Reply-To: <20251020185539.49986-2-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 20 Oct 2025 23:33:54 +0200
X-Gm-Features: AS18NWAADgBeA1nYLOcKyihsh6E3dmd5BWRM3ztrLw4uDz1-mBK39vAmoeM9Wwg
Message-ID: <CANiq72nGPeLvrjQB-62Ht8TR7oWPgF9HFO=yPX7TT3faqxnNFg@mail.gmail.com>
Subject: Re: [PATCH 1/7] docs: rust: Fix a few grammatical errors
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com, 
	Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 8:55=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Fix two grammatical errors in the Rust coding guidelines document.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

In general, please submit independent patches like this one
independently, e.g. this should go through the Rust tree.

Thanks!

Cheers,
Miguel
