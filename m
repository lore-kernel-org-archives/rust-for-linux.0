Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493381E25FA
	for <rust-for-linux@vger.kernel.org>; Sun,  7 Sep 2025 22:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757284271; cv=none; b=cczUvpVklATYAe69UY87n3Obnyt7HL8Tj/lq7EieZZ8XvU93E/HclfaI1C9N+oF/s2EqZx9dfQ62IJjY+1nhMipe/k1oeUzD99Hrf+OJBnHupuD2qGYFoKOMOmkyraSb9q0vnNsbkIhocJuyLjCUPYnmIme6BGqygc4wbllswrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757284271; c=relaxed/simple;
	bh=CSFBlBtDLQ60LZNRpaUXVbkiMpIx+cA4r6gRvNosVrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UKjAe2cVawHX2DoXYdYCN6QdycfvO4+9qdHVeUF9y+naC4mAlouy7jVQCN8TC7Pjr4Xl5jYNOWI2CPD+5qkMV9JkHfuUXOPRaqnllwcBKGr8pUnEiz12QdqTih9Dhn18l6GHTw5qzJPSZ1UfFCMjJnaUX8bjQXf2BspuE7stsog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATzfk1d/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATzfk1d/"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24498e93b8fso7745345ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 07 Sep 2025 15:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757284270; x=1757889070; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9bPu15Z4/dThW5eomvhcfyNbJrTtij67l4baLOyMhc=;
        b=ATzfk1d//Juk/VG5BxRmzz25+ABMjpU1lCUl+iWoh50ZUqPvUd7JB05UQ0/hTP0T9U
         SOa28a7RWGfLdU41jzkwXeDHH4ssXBT+W8DV6RMAyXDO2UA3z7uZ07nnqn2sr5PME7rs
         x+jvvsYPDHyc/mEj/40i/FKogEdUbdrk44Xl6Dd5NUIE2zEn8dZH4OzlVk40eDjl9tUs
         3VIIwj8v3n8HsD9RNxgDjuMwsw9SfPmle3Qd7Ssn8WX4GuaIHJOnUbapcQkjfQUpPMfb
         WJQyzMeyq3Fpf1JpFNtOuip27vo63xipjcgUxRphs3LMXoFKQiCLALyC8D5yHDiB2kax
         JZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757284270; x=1757889070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9bPu15Z4/dThW5eomvhcfyNbJrTtij67l4baLOyMhc=;
        b=Tus8I4viILKEu2QzUPTkDXnZ1UEfd/e9DorotY/tOpxHGQQUmnhip9XZNWDA1iFif4
         +9LkAV5lCI1AlCtHYQdoFNBLG/1XjY7DfnI8ppVtkWOgmpU+ud6Rv+YqSOH3VU+eAkV5
         X+joes6lu/XZGtoWTUUJbcb5x7H1jXgi+fowkJ3p4V4cu6wxiBiBEIfdyPT9uZX8jDMe
         aOb06VUans5gVA4LsRzW8o5k6P7DZfyFBIu3tregSie1oJi2ZO6B+4uy06/NJTaevyyZ
         rFIJ2hoSMw40C0w4/IaPzANdqNq3majBhglMeTo4CxrJyU9psNhOZo0oLDic7phNaF8M
         HCjA==
X-Forwarded-Encrypted: i=1; AJvYcCXDCikOC7KQukGrmXIM0nnVoFhs8HN7b77xIbKEc2skM4BJQsekMhnX8ahUoGfw6fop9lhKJwKNx3zHRNbrRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaff1OqxHy/yJT4GgUWP9eSGOGSya1b7BQEUO8S5NUeTUnfFIF
	edoFhVCSxJx3n9tXv78rX12M88r9++aH8JsylkvCE4GB/ZKqvtvpXUVTzYXbRoW5oCeeEsiJnID
	K/fB09GdhckEYD+j62aVNpFAESsBc6kU=
X-Gm-Gg: ASbGnct42onC70AJ0I0xXfd0gIIakYc6XBPxkZGTvRRshmc4ZLOND4YzrIBTn3DEhWM
	wM1EeCdELREnI4Dfovb3kYF2TopS7m3+hvjFpqfarOkkku4SqVHXfbyT14Lo536JSILB+6/Fx34
	AzJy23pP8BobmkFxzXHwcCA1XfEgVeKhFfw7hS9NdYerfL5UtwP23jB2jN84gPqJPKO8TfLXV+l
	QO1ozAIkYlkRxMSzHT4PIiGPYNwRdWfzzrxW3XE415LjQO6M2b+c58PixOf3a9FxYiLz9kZSZGE
	zPex+93EHFRxBLTw7v4Z/lMyu1+l/zA5xeugh0AP/QtpndU=
X-Google-Smtp-Source: AGHT+IEj4AVClx0YLlxE3BvIdWOpSMLw0zkdrNVU6iMlzQLJXUNXJO8RnxcSaBFanH1/GPk0Wy3TwbgoCxNXplP3A44=
X-Received: by 2002:a17:902:d4c4:b0:24c:cfcd:7356 with SMTP id
 d9443c01a7336-251663b6f4emr41816155ad.0.1757284269623; Sun, 07 Sep 2025
 15:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801161752.443431-1-ojeda@kernel.org>
In-Reply-To: <20250801161752.443431-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Sep 2025 00:30:57 +0200
X-Gm-Features: AS18NWA5OqPbW63AgbnzQJKJXtbFL3DAUQrImPSTwrtiRAD94szVxKKASywRaM8
Message-ID: <CANiq72myxAFJbKYaxsuf1PmRQetEct=3yqeJ2sqNkJROT1CQaw@mail.gmail.com>
Subject: Re: [PATCH] rust: prelude: re-export `core::mem::{align,size}_of{,_val}`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 1, 2025 at 6:18=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Rust 1.80.0 added:
>
>     align_of
>     align_of_val
>     size_of
>     size_of_val
>
> from `core::mem` to the prelude [1].
>
> For similar reasons, and to minimize potential confusion when code may
> work in later versions but not in our current minimum, add it to our
> prelude too.
>
> Link: https://github.com/rust-lang/rust/pull/123168 [1]
> Link: https://lore.kernel.org/rust-for-linux/CANiq72kOLYR2A95o0ji2mDmEqOK=
h9e9_60zZKmgF=3DvZmsW6DRg@mail.gmail.com/ [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
