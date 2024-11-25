Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7C3190067
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 09:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732528088; cv=none; b=UWw7vGuxUR+9t0ecO9LtLkVDVqVdpHrBn5ALFThc5OUxj7bUrmeey+oM9ghAHjb7hfk5gM8/HVQXyvoFTkttRM+siqvQqaaqHaxZzQ70AKYbbL41vFEa7PLAmxYJBfCLwC2wzB+fMqX+oKu0ph5D/X2h2d4iqa7XvSCt1g7tRWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732528088; c=relaxed/simple;
	bh=hJgbsrfBWfExYUYOXftgJ8QNfNKyzy7L4+nDPv6NGyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJYRJHoUYx9i3wxUjwtLnjwJaAjyWStoWoGqv8UdVRgEvvoZHeOZQdJFhpM006ADqtKicbcaSkf6xy4HCjaWfY7VlnLSfY8hTS3gf/PrlO6cwin4KjQxSvuvQjr+o6xUqCTD9+3OnrAH7LMzYA7EmxT25GT5CtZkrB5vfDOF2YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hjw/W+XB; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hjw/W+XB"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38232cebb0cso3279202f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 01:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732528085; x=1733132885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJgbsrfBWfExYUYOXftgJ8QNfNKyzy7L4+nDPv6NGyc=;
        b=Hjw/W+XBUclTXXoC6N4/gsPL/AtCMlhqhBf7y3AqheCg4lNZ506rsxawfHXl5Ny21o
         NLD/wNdR9rA0AbH0duzpnOZL2x3qZ72k8x+IoPpDLOipXO+gIw1GTDbuIlS5OY2oPi6u
         NDqFgtNyV0YrBivs1ddNX+3uXOtqkijhq8S0QrgRFbnCs83LHwW7QdAJVhMe9itNEqYp
         vQtiMHtI5dJsWKScKMYHVGvkZgoWpqHT59V2J3cPxnGiw8u+mmvi/RzIFx2djzxJSFb0
         QNItsDqVSSrilJoL2S5aS9pgg9z/PWi2mQpmymewZjc3Wi1yAi8A3GkfwhawSbPMPBoH
         qf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732528085; x=1733132885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJgbsrfBWfExYUYOXftgJ8QNfNKyzy7L4+nDPv6NGyc=;
        b=WVUYUjO1i5LbvjH+vWeQ7IOS699wx7PsMktY3W9a+anBnkJGbBkmg4oBnrOAn4yMvw
         odhwMFyYejwVq5Tv+BxdSZYbj53Fcf6PtV1h8eGTTR2ay4AOBhfW3ZLXe7N8faDM0qk4
         1vkoOzAk5fyJy1RD7e/cHsB7zgA2Lhw3mDSRiokGanOqPr0CdY92K9ZYztmoChlYdTwn
         Fc16fMO0WB+og39Oe2Wbi62S1VsGuwKujXA1D/vmt3S2HI2XD8/T0oSwyDqRwbCWR7Js
         E8FzzE1astdtsLUzY1grM5BrraMd+LcnNHXBt59ByWjgXzRjkYCo1rkJ80sy1EhzMkS/
         nraw==
X-Gm-Message-State: AOJu0Yxp0T4WuyLiTBsTCnlU8/LGCodAL8zjTxX+vd3kX5tuyAAtVLrI
	Sagm5pXf6NOzhiVgm9ESIYp9BPMtsVrgWIVUQAPWyIFO+yVYiAWLLRzGo4aCkjQhJPOv2s6zCeC
	KxUSiM6q9xVqSjN2fHBj0qV7m0375ZTOjkLE+
X-Gm-Gg: ASbGncv2BZA5j67lBuzA2gCTyTYg95gev3cbkmrbM3Dk9e0nzaACQKWjDcWIgg3NYTn
	S6Iw6n3/C0pqZ4G/bdPbtdQ78Q7Oft7/dFIOzv5TLudcAvzVsOtZQJa08ElfMXw==
X-Google-Smtp-Source: AGHT+IHrAXO8603RTW/PSQBZ076E7pfsRnlq8MGRYZ3LzsLhVNpRdvt57aeVDXGLjOJh8YU+EzwhhwVNv7DddX7Yl1Y=
X-Received: by 2002:adf:e18c:0:b0:382:2d59:b166 with SMTP id
 ffacd0b85a97d-38260b83dfbmr9653111f8f.31.1732528085567; Mon, 25 Nov 2024
 01:48:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120222742.2490495-1-lyude@redhat.com> <20241120222742.2490495-2-lyude@redhat.com>
In-Reply-To: <20241120222742.2490495-2-lyude@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 25 Nov 2024 10:47:53 +0100
Message-ID: <CAH5fLghL8OPnAGud5OuMUc1SpQ3j2DO2s6wtm2HjnvzCihrKuw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: sync: Add MutexGuard type alias
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Filipe Xavier <felipe_life@live.com>, Danilo Krummrich <dakr@kernel.org>, 
	Wedson Almeida Filho <walmeida@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 11:27=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> A simple helper alias for code that needs to deal with Guard types return=
ed
> from Mutexes.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
