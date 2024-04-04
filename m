Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603D359157
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Apr 2024 12:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712234905; cv=none; b=QOYRnzKNIlQirtQHs7GjCFWGQSOfaBIIK+be7ZEdT/QXJnCU+vm/GfFODqvhiHwXWxm8DLNzHcpLup3SsTb84vN60WR+c95keTF1gfpKGT7WKeyJM8ct8WHD4A8GleDcDJ0bF4Gj4oTpXHCDZX0nSAai32RvEoAklxd7X5kHQzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712234905; c=relaxed/simple;
	bh=zItQ9R1wNOgcne/I6ELOtf+zMzkgqghvssWfXc2Iz+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=klGDIWjo7/S9Bo1/B7qDNsN2/YQWnRTwP1JXxVtir+xIl3gWNibYnbVUZrxPf+IE9PoGf6F8JGl7G04uvBdBAsYP06JM6GNRaSrluiBstN9fEbaw0qaP4ghVpzqfOlzsZiDfHvb1ZMqGXe8yggkr7Osqwxm1OhdWWsJH2B/owpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nt2YeS8s; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nt2YeS8s"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4d43a1f0188so379956e0c.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Apr 2024 05:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712234903; x=1712839703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zItQ9R1wNOgcne/I6ELOtf+zMzkgqghvssWfXc2Iz+U=;
        b=Nt2YeS8svF9pa3pij4M+cKgdBieIE0TkSB9iUNJN6f3N6kFOrtlfQuef+7/Lh+3aVk
         EG68LVA034OlGtTeFfS9ZP4NhF5lgw0i9kk/SzrHD7MNMRADksvbQBDJAkzhLt3qhh38
         3U7wN3KI/f5bschSFjwfMtfZ0UeX3tNU5aMn2IdFTDeMafpYG8S8hXB9e+hWTpxiMtud
         SpQ5aUTSBP9Adq2/eZZEEN7WO2zJkTf+Kp2JsRDnOvre29vlShxJ37gUUrv+BjnCF4j/
         9bC4v5BbeKkLiFcFnHyT7gHs1hCsKn8oEPFIMiJXi7PGS5r4tiNeIaszmBxn8m2QV95V
         FD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712234903; x=1712839703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zItQ9R1wNOgcne/I6ELOtf+zMzkgqghvssWfXc2Iz+U=;
        b=f1zYdfZH3ac19SrtS8Gc4x0WPctzEcprIglCSWhB/1VjAtYzO70FUHZYrA4/fidniZ
         c7teos6D+47xJWheU+d52MpI5OX+J2aL89SJ924pzHqFHGbP+B75gwiwrZMuKfmpJi52
         3nbD8XU4K03O/NX7PYAeEdH2YRnERNlHM16ugFqE9DGpxwT7saoQ1tcCfbNStI+sAU7P
         DsMaQogc2lAr/uLLYLmIYn58r9aRG7qZyDdR0OFlEEWI+De/kCXt+qIkihUwYbErgJcG
         BCRkaASD58GMPek+YIteQ/3zyHu/PQdp8dHK6uPj7uF6LuxSlwvBNFuN9X+B0PzhkLqM
         O5wA==
X-Gm-Message-State: AOJu0YwIUif8620+O6AcAACLVeqc1/pr75ln9aBb4nulcvtA2UyFbKf2
	2cavsPKP1ensoHcqK4gDdqMfnvlsurcC6nnpY923yORWFL46dIXPC03DRci6QCMhnJp39r3vwJ+
	wRoNAXdi2q7H1ObXvTT+/dvSRtbkvbpdLUpOx
X-Google-Smtp-Source: AGHT+IG9ft1FtPMeFD96GHl8oofYlvkbNt1h330iUt53+y8NfQzSzV0qlbPA3CMXk86Qp94i19OxnBnQNmd1HGLMlK0=
X-Received: by 2002:a1f:f4c1:0:b0:4d4:e92:1a71 with SMTP id
 s184-20020a1ff4c1000000b004d40e921a71mr1942216vkh.11.1712234903114; Thu, 04
 Apr 2024 05:48:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328195457.225001-1-wedsonaf@gmail.com> <20240328195457.225001-5-wedsonaf@gmail.com>
In-Reply-To: <20240328195457.225001-5-wedsonaf@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Apr 2024 14:48:12 +0200
Message-ID: <CAH5fLggFu4f03-FcG37xzfVjUnibg56jOuDnNsdk6Bzs0UW0cQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] rust: introduce `InPlaceModule`
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kernel@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>, 
	Valentin Obst <kernel@valentinobst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 8:55=E2=80=AFPM Wedson Almeida Filho <wedsonaf@gmai=
l.com> wrote:
>
> From: Wedson Almeida Filho <walmeida@microsoft.com>
>
> This allows modules to be initialised in-place in pinned memory, which
> enables the usage of pinned types (e.g., mutexes, spinlocks, driver
> registrations, etc.) in modules without any extra allocations.
>
> Drivers that don't need this may continue to implement `Module` without
> any changes.
>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Tested-by: Valentin Obst <kernel@valentinobst.de>
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
