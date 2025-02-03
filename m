Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014901FCD0B
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Feb 2025 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574271; cv=none; b=T/XJei8sN+VwAkYrDBUSH/GZuV8ZmM0yyT5W4TrV9AqsT5Mdbk4m+zWeLKEz39T4eCIv5rMcwUXuNqPZiUPXfnA9U3oK3VLjeimr/odk+Y1AL8vgagDZT0U32s+w5PJy6meoWKS1GCWTHNrx4I6tFUpU+sKTMke8MXyyBulSW1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574271; c=relaxed/simple;
	bh=YZvdJoCzVjHsxT40ttPflNqCtnquMUzEPyDKK26T2pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRI+4MAorFy5JAGO31yWjz0Mgr/opGl4S7JmxaPGwqxZYo5pPF6Q86vASsEy6nAzZh/0nKm+x4rG6VCw13KLuqdLWmsWXHH115MlCnEcOQoKtjeUSRzcLcSqbc4NdGsOAR6vyvzvhG+5c6FUj/g3zX5lwLSxAaDKIylWXPEVAZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TWaOm3sA; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TWaOm3sA"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38634c35129so3231708f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Feb 2025 01:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738574268; x=1739179068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZvdJoCzVjHsxT40ttPflNqCtnquMUzEPyDKK26T2pw=;
        b=TWaOm3sADXTGfvzGFsMxr+eezFyQw1Q+mwViUSw1TI82eYl4lPM7CSa1LAR75Z3B6Y
         yPzP9qQ7vjBszuEUnlCh+Uhc3fazv9xzSCVXjRvjXtA9FYxDyKrG7XUKS/m9Y3ZWPM+U
         Zk/qmvd5Bjm8xRPFeTtkigT0oElAGTe+zK72THHKQrxaSCTRBxNJuDH8+bp9WBJTZIQj
         jdbsbk2OVOijKoJz8GyausqItd7wT9TAOdVElD3XTsPNv25t4EX3RYH6fln2GxBhFaOK
         /7bpO+VaBmpx8JT/uQxmA5DqUA9X/hnyNw95FHqlv0xsF4X0zcVnG2dSSAWHQATvzhoZ
         wSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738574268; x=1739179068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZvdJoCzVjHsxT40ttPflNqCtnquMUzEPyDKK26T2pw=;
        b=IMilX2LPgNhhXAjFPdSY469gwteZ42qEwuiRSG9UoGedXQWSXsiMSNhzQLuxFI9FYl
         5WZGy7zslkpIc/21Cak1g3nFOD4rvKtNhghkin1oGlozt0VDucTdZBppoc+xAeTs2tGb
         EM9J9+gFIKq1mLHd7pXDaV3AHIf5SFfZ7BTZT/wLfpRhqRQINTwNA+xqGV/RzmtFI/34
         0Gkf1XbA6p/U9h2udyK65TqlhxiFHVLtB6K9nJYTRiPmD2MQXznbgqOQ28pa7lBf4rqd
         hzcnmH5OKp4wr+1SJvGQNnwctE/QS/c9zjdIuCe2exxPy0HHGD5Klc60nmo8ReeasIXU
         QtFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqfOI37KXXDjv+Lus6Mt4FUCaLurT8Wf7f0mm5sM6j4CvZJ5cemxXlkMlvTa6zTEz0n3kQ7FrS8oWyqC0/DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZRq9d1cT95a5Kg/t/p0H3yeW010tcu7ajs9hX141LquXWT1+E
	5tFjaj170z5tZ0M8b/aslAxqs5jY+wDDS4rOjHfu2Sjf15hiY8AOwM+jprYoHyMcd/RV1rJ0Bt9
	L7bYRoRRUP9NWzgabiPn3X9c1DNaJZnbvc6/n
X-Gm-Gg: ASbGncv8nDmKn9QfJ+VWI+jaKET+7VUZauHXHoClTz/cx4DGHsAdp5DqfMZ25b90Hal
	zZoYeOb/kIk5ePJdwOuACyo4/mLxcDrIn/VrHCSp1QNQD8wZ/727TuKEGl0zHDqScEkKFdp2jHr
	ijxIrIJwWkn4vUukOyjkjaZXpT
X-Google-Smtp-Source: AGHT+IFc/1AuykTGw2Qq96Tvv03ntnD9n7SFRLhjQXSqvolNCxvTm+SCCbwciWNaqMmYnD3m8ACiqaA8EI8pP0CLNkY=
X-Received: by 2002:a5d:6d86:0:b0:38a:873f:e31f with SMTP id
 ffacd0b85a97d-38c5194d20fmr16306574f8f.1.1738574268194; Mon, 03 Feb 2025
 01:17:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net> <20250202-rust-page-v1-2-e3170d7fe55e@asahilina.net>
In-Reply-To: <20250202-rust-page-v1-2-e3170d7fe55e@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 10:17:36 +0100
X-Gm-Features: AWEUYZnHBKgHkqPgFSXj_rkUh31XGNKQXaliK-ukOAh1dOlV4j6E8lRPRejB3OE
Message-ID: <CAH5fLgieTeYJ_prMX7K6eS63ctDwT+NBYrzmOakbNGBjuXA0kA@mail.gmail.com>
Subject: Re: [PATCH 2/6] rust: page: Convert to Ownable
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>, 
	Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 2:06=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
> This allows Page references to be returned as borrowed references,
> without necessarily owning the struct page.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
