Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D0E155C98
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Nov 2024 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730452287; cv=none; b=WNUvOkNmKNyZiFpZUfXLgcCTAhSTFglrZrelGFbHKdqljtwIwtsKg74v+USVB3heYvFyWcPjTqMO6BtqqFkKCPQP5E5vcZglf8Hdwgeg18vi7YCaTF4NnbZnz1+3CReojWWpFkJUQV54xz/XnCLtbC72klVdnFxBfE71RyHPjRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730452287; c=relaxed/simple;
	bh=4cSB5Cq09W88oLyxZ2Nnt8VK1unVUhcI4RGMh3WtG34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TsmC/1MpQwEgtbEkwIZ/P6lgMuw33E+qOINT0Q9BIPREJLHb5re06YPsTh5/9BSNvl7/cGC9+Xz4AIF3H4iiUJ3J9g69OP1BxRrsjAwNRnOxsc0Jqog1YfMgTixmNFgvFSSqx5YwNjDPl/ugNKA+i9pHMAVi8Ztrwlkrr3Ulwc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cQFSM2YZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cQFSM2YZ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d495d217bso1484062f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Nov 2024 02:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730452284; x=1731057084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cSB5Cq09W88oLyxZ2Nnt8VK1unVUhcI4RGMh3WtG34=;
        b=cQFSM2YZpRrcdOY/Bb4SqJ0YfEysBOQCyp6q1HghPfcP5Wd6x0wp5Z5roXWP1JUROV
         Q2hh/kJjPcluNosm4k5ocwOi1HVJ/YGN4LU0fiIhcv9obG7nAo6cuCu9f4rkOhzwsKdV
         nmBjgy9/a5VN24sx99QMc35ZDQd3lfOMYq86HmtXvYOtrahSyl2WjyDPCsFvBrq+7VSG
         2Od9w8Mi1s+x2S4W8OspuWHWlutbwtlYCqAq0t5EAcZMOtXkfvB5+x1V/pTTJx4LDRov
         D1TFQd7S4eC6VHfEyueUT+Xx4BFVGf0mxtyAnvXyidYBEiKAfoKVRJI+hi6yiyKnZ/IT
         6qKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730452284; x=1731057084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cSB5Cq09W88oLyxZ2Nnt8VK1unVUhcI4RGMh3WtG34=;
        b=oN1ixKmB2JJMm7o5S9+ofipvpyvpfBM78nHP4bhgVj69zI0OeoEwFwO7rW0aiGDfRi
         TKOdbjSuWzBHy9M6MHy7UKSOU9nKUQf5uJZBhwKo7l2+cMNECzlOmkeTUFKKpILgJLJZ
         I4+iMs1brn4QrvMbqLIOhEVGqEy9zURZcyTx4oO4/aJweM0vSc08eNoZxiPpj+kGRqUV
         wjrWxWVrR6EVB1BViETJI2AfzpE6oJ1tXMUJAcJ32uGxMrTI8yjzwbmnSpcWLRV52y1V
         0OYJ8/Y+E/LhT23VS1qZpbpUg0ooKWu5JnZ5AaV2zBdFmzz1t2JxpsoTd+rRNSc9KJpd
         wfgA==
X-Gm-Message-State: AOJu0YxKWiQuk0EbffYVETq5ypFvrdSM+JB0XlYs5LXZjubISl7ouRF9
	zGOYl/1B6qqR6njReWynYpXQvWwJHOoXQ9HA0u+3vxpyYNYWqSFdcy4tKXRNDXoP3z6DE/k2kxl
	YM5r+LhtiSdL5LeJ8CLskcOIKJeDhG3h/DA00
X-Google-Smtp-Source: AGHT+IGeAyqZlKGNJOe75qmuPtMi2hgivEI5vof4f8/olpYjnTg2touXC6W+wqreUBykvGeWkUr9TSLb9rFCROm2K8M=
X-Received: by 2002:a05:6000:178b:b0:37c:c51b:8d9c with SMTP id
 ffacd0b85a97d-381c7ac412bmr2555766f8f.38.1730452283554; Fri, 01 Nov 2024
 02:11:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031231025.3466571-1-lyude@redhat.com> <20241031231025.3466571-3-lyude@redhat.com>
In-Reply-To: <20241031231025.3466571-3-lyude@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 1 Nov 2024 10:11:11 +0100
Message-ID: <CAH5fLgh=qgJ-+VzzVn=jGTJUQDx6WSiUaRLYouQknuKkCi05dw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: sync: Make Guard::new() public
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Filipe Xavier <felipe_life@live.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 12:10=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrote=
:
>
> Since we added a Lock::from_raw() function previously, it makes sense to
> also introduce an interface for creating a Guard from a reference to a Lo=
ck
> for instances where we've derived the Lock from a raw pointer and know th=
at
> the lock is already acquired, something we do in the KMS API.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
