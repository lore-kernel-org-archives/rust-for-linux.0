Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36CB369995
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Oct 2025 17:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761845611; cv=none; b=ENJpm73dBLOsYJeVDNabqqLeI9+grm7XBryl4Q/59cQzo0yW94X/8+j0MS+iMIVJzIUJknYneb40ztqLq3eUdOLQUGUMDamHYNqvpBzyDtpuR1/dgDw7l9pbYxfTyGz4XDj9ah8M+i8pGB2AC9RQuepOaN9etvGIADAXVIW+0vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761845611; c=relaxed/simple;
	bh=H4oxfW8LlpZdjRUq6Ea0t/3CAVHgSecFYn9aaImDYe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BcyXJ57dkKlI+Fh4NbiAZFS3919Ojb/fEoGGD5CYHQXZquwhm/F31fimtyqNuEmJwL3HlBlP5/sczz9ZgDFik1w5fKqhdXH0yLq4CpSGVf/xecufcpVUooKtCwdjgZmxrazaVLVlDYuX5kfSGlIIVIkE5VT1ni98vQ3avMplw7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuFB/+08; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuFB/+08"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-26987b80720so1798275ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Oct 2025 10:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761845609; x=1762450409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4oxfW8LlpZdjRUq6Ea0t/3CAVHgSecFYn9aaImDYe4=;
        b=VuFB/+08pdYeJA78Eo4ssiG2X1KkwUEaqAoi6f+Mc5ll6SexgbAFJ3AdmuOYDeBTKG
         5FaKeMQoWNfnPnePO+0mRpdfVxmhm7qAIVhhA88NgEpkEB0u2yEegWSQhwqtGE1MYf+e
         Wz4+biaRNXGmftZgd6AfXdfC4Jgpa8Ik8yGL0i8Al48v0RsDI+NfU9/vsC6wkPDYVvEV
         iDPhLaqrrorm81+00WSFevjLbxwZwI7gzeRL1Xw4xmtpNeZP1cgjPLzH0vfLyNNWg9nq
         QgzXghDXWXbwkjsWr+CPWf3nbATZbfWv90NV2myUcWpOQ1HuHmsQ1QF9WeDlIaeGI7cX
         zDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761845609; x=1762450409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H4oxfW8LlpZdjRUq6Ea0t/3CAVHgSecFYn9aaImDYe4=;
        b=GrcoWrhcrAUlflD4BMrZr6tblZcrnr0AXzREF6v0nORR6YqiRO9MNSwVL/+Htr7jfR
         7GPy3WT0RGCBUmEzkkAbCNXySneluoxCY2cnmU1MbaLdcDRAIPTzAfVgOiD68+eCgoxj
         oEqiVVj4Q8ngDA+VK99Z2EinEl3c/e5n+q55a8vopNji2xA4IAHuLMQQ6h+Fbx6mbo4P
         D03AQnSGR0RiueP12TE6fANu5L4eZEZ3EzaMrSL0x8lFiUBNHiQCOCPAR0kahPUy8Mx1
         6qm39iTfwpQy2uhoLMG0XEEE8GpFmtZt5hxnD/YTFGQzCHd5+JQjMFW8lXRXLeG8qMn5
         P1ag==
X-Forwarded-Encrypted: i=1; AJvYcCXs75Yu8pFfLYxCQaJKiG1jMcscNqolENDGraOt2IoBuihzSjDplWcuPBcnHc9jKpTBJT0T8t5WpZa1Qu3Hyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/foFnfLvJTY4HZzbc1VVdlxOIDQkK+Q9GiHQyQdN0fdW+Oc5W
	k95nfJi6TxPQY7cFaaLq5akYUBKTx22lLczswx9Vk6X7J2bd7CukoLbsXw5JHcFWB7iww8VAlxY
	g+/d8kw2+lILxQ/NBVC+ypuWN5RZw64s=
X-Gm-Gg: ASbGncs4q9kD95n34K6rgkrjtR4s4/uugxptQn3N0kyxG/nTOp2+JCKZpb9VSPFEFMy
	OKvA714gBzzYPFEJoknkTLfGpFOTCHnUMFiZopsjDH8s2VHDIo+Xv1gaXyGObsPXIelVcVEqHIO
	S89qF91bppBHZAYxn9zUGfSGim3Y+tQG75IlALeY2DUPAkVxIyASrGDd2o0MTVYgymJbkC7TJLp
	e2QKbJC8v4Ke9IFj5mhHEL+7a1N7IPY1hz9fMQB8jGv4R9NCCckSBliZ2MreOijBfmQvx0VdnDK
	WANWXwGMhpkkIipdEcWYf/Vw2PJy2BYUlOGkt/YL4ZO5bQD6c0O7G0bv7QI4JFu50RrXDVHz0Ep
	zO90=
X-Google-Smtp-Source: AGHT+IEnjYjBApvEV2QGoZHHyDXa+qaKI8ES/te5I3LkfLBQaNi5vi9/OL65b9UrrS/ffKZv8Lj0Yn/P4npQa66AoQ8=
X-Received: by 2002:a17:902:ecc1:b0:290:ccf2:9371 with SMTP id
 d9443c01a7336-29519a8e2c3mr4051765ad.0.1761845608672; Thu, 30 Oct 2025
 10:33:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030-zeroed-of-rs-v1-1-1c46d025128e@gmail.com>
In-Reply-To: <20251030-zeroed-of-rs-v1-1-1c46d025128e@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 30 Oct 2025 18:33:15 +0100
X-Gm-Features: AWmQ_bl1pEXbFGijSDZoaUSFwxjZwY7dR_OCs0R-sUe03E0zMHx4JxOi_bitJAg
Message-ID: <CANiq72k1dEHK3f-5RxkAKL185Zx8dtUz8X_V2Pk7eALeyAzZ0w@mail.gmail.com>
Subject: Re: [PATCH] rust: of: replace `core::mem::zeroed` with `pin_init::zeroed`
To: moritz.zielke@gmail.com
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 5:45=E2=80=AFPM Moritz Zielke via B4 Relay
<devnull+moritz.zielke.gmail.com@kernel.org> wrote:
>
> ---
> This patch was suggested in the linked issue. It's my first attempt
> of sending a patch to the kernel mailing list.

Looks good -- welcome!

One nit: this sentence above would go below the tags and the `---`
below (the `---` here, above the sentence, should not be here).
Otherwise, when applying the patch, the tags will be lost.

Cheers,
Miguel
