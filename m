Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8998A34404E
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 17:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783703044; cv=pass; b=B004kWS0p7JxA1h7z6PDETYvTQv4PGp1+eTLLceHEhTudZ17+w9DEdFoP+SaUEoIuOCU/m3cSg/1REh8sB8Uh7InYZf7ljN7iMQOvxWA/ZvodEnfBV8jjQeK7zEbr+u/rl7Qu03KuGB+p60OXoU2hRL7n7HCKuacdY+gnBgzwPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783703044; c=relaxed/simple;
	bh=r/Xu8txnVfhGLqIVa9WumApz8wxucNom93IvsRFUfss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S2u0mrTj8B58SsrChF+aFHJiSnej+nVQjsV8HAK1tJr3t/nT0fsAIYBdcUl12YTOOlBkvBbTko/6pfcn/uqpMhFVtTuXp1tA93uH9dWFgC/tKSvv1xCrU8qEDOBel4c2cSJJ4EWIicAZCZSyXBAOTNiIYMdYu71iw+hNhsqwL3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFPgDUMl; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFPgDUMl"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3860f32307bso253483a91.0
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 10:04:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783703043; cv=none;
        d=google.com; s=arc-20260327;
        b=U3YDUHpota40xDcjBw9o4C/pwwh9CxdcjWwSN4MhrqsUSjc3ms/obQo/egJUhF0ICv
         awtqWgvnmunwYVEzE4bInP+76LA/lMt2aqFCRTQwjPaAbc2Nl6Qzs+ZTpZh3WkEBUFFS
         jdN0rkfJRQwl1tjFuCZDp82k0WNbqoLI7meYTTuC3BJ4Ofc994m9gu6cOlLyz8zSF/to
         DxNw1NKdyDFOgX4Kmkfs8go8a3mcLtR0+vFJ0K2eXElpwTZdK4JctSLnM9Y/R7mBfqTS
         bS3s57DAVvKagTSl7idrPWiiZq78DWeJbSP3vEKYbDnmgj7DP988Dbupr7xa597lsOTv
         lPnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sKHju9ERRl0+OcU04FZJYkzRy83jopbNTr6QW8e83dE=;
        fh=znowxEgj8BhqTJa7MtGqYNNgraXBx6bO2y5lCj5RbiE=;
        b=Q4RDe77uUcW/N+Jr6ShEX6c3vx+mS25TXRHzsRim78cefEwd+grnbukk2FrYli+GGG
         jdIuckeJ3ZbhDYZDK1mB71PnQBTP/OpW4VA2RhfE3cAKikSdNAKGzwHGkdYQdY17ZUfb
         5gLLQKMSaNKQmJCtaVGQHsetV8XIwIcPcidbnX2mbECU2GexHC4W3qcmRYZkFwTnIyD9
         +ZrzFHKZEMx3qfcIMiky5Wt0ZIxRNc/wB6KrpDiPf9sSQnBct+GDN14B9O6oBbSwkXy1
         PS5LycL6YcPqKKs+Cs2nCoBSHQ2QEkC9v3xn7IIJ9BzZtRmqmK8qXYZ+ngrD1rKW+pOF
         ThHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783703043; x=1784307843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sKHju9ERRl0+OcU04FZJYkzRy83jopbNTr6QW8e83dE=;
        b=eFPgDUMlZxGxCrwTBiVO+s27sozQtd0TtZLMcY8G4PSASvVCygSzJvhguS/TuLO84e
         cK/u/+ocwBOx3coio3YhHuvjWZg4SR4oMhK0Zvj0V3rIDrhS3S7iS3+RIGLO8BWNP884
         zr0Wf0iiPpeVqkNpQ9ng5W3TQeGgRwg5YKbNQqxOnOlk4m8qtRb2G8LY49MIQG0PEsjk
         BOBHJ5XvnG3K65N3Xxqt1Zx73g7scpeXIajdPHRuqghhzR3Xvl9ObtGJCK2IOZXPC7Xy
         sO0m9Nhw+5Cd67edwpOjbYhXepGQUGEvS6Don1zdKoyIAt9jPtQgFrRY1cYbvFRGKEuP
         X88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783703043; x=1784307843;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sKHju9ERRl0+OcU04FZJYkzRy83jopbNTr6QW8e83dE=;
        b=TcwhwOhF2/aiXNo4Aiit2KYh3myU+Gqn2U/s+wWH3rw/tn77C+iUlRKuWHwJ1RJ6GA
         W6u3tgrnzAnusmrTJ7oJg/hhMbiw5Lqujl1VSWWnCGLi/jj+39wyM81QMoEAa8M5Dk4N
         5BV2bsai0pjJWEqe91CSPXy94hqCPOAgyiPmhH5dgy5enD27jR5+eEe8VY470csWlIAS
         92/COeTMDiwOA7GAtpdB1NZ/y5aCNOuiLdJXu18Rpqa0vxSIoeYiY7gFAatjMW5VcjXr
         s0mYr7xFyQBWDaKCN0/RNwat/hxQYRLpEkurebRUmuDAepDXYQXapu5QyMDgYRb2/zc3
         nR3w==
X-Forwarded-Encrypted: i=1; AHgh+RrNOFXuUhO5uPV6w/g15so7cpPAWTC6gYcBN/StMS/Kv+fo107uFjFkQiNfAemgXey13kbunhvguxTG+dK//w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv2S1e9+qcOv+MHiffKkWJi7LQFovD7DjyDneSph6TPpk4AstM
	RabbspAsi7SOnyk+qvTqrqWoI3D3YHzfoSRi60lGXpjWCk6eqqSMV13hQZDk+LA6UZLykBgfmeY
	6jEyfIfARO+U6gLVjhcKnnyz2MK51p/Y=
X-Gm-Gg: AfdE7clbj9vGrLKmTUQ6cZqxUmSYD6iGBTC7xuWaHlBHq5zO3RNd6wmBIRLbEFrk5nC
	gnUv0pvk3JntRzfk3LfOLVzPs85DHPlgfKllMdIk/OHhPwP6YCMYhK91lzfO2Se7kNdF2/N7bBO
	kGU1qZAenEI1/MuAdfsAxzBMVLATyvKPQxB0bTqVn68fiuZpU6qZ+lff2MsgUBhjKG7R+wdxOtF
	UEv3eEcYzAGYBhQJUQ7hpibX1COfnCKTpQEPcf7Qnd1KkmOKVAqWoOubtiAzRsovEU7PRpEPDvI
	UYLM/nQvS6L9samVz/9IT7StJVtEOGIh14BNqpG6ryPQTzeRrl2NhxWQxxtOARBooDH+g7guQSz
	9Ww83oeG7WfXI
X-Received: by 2002:a17:90b:2d08:b0:37f:eda5:516f with SMTP id
 98e67ed59e1d1-38a1c0ba980mr7294960a91.0.1783703042886; Fri, 10 Jul 2026
 10:04:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
 <20260710-rust_binder_debug_mask-v2-1-2846410e3ae6@google.com>
 <2026071054-hazing-antirust-8e40@gregkh> <CANiq72kxNx6wdvAW1DjGm=JhPiqs74qwxfPQ6cRHxiuZUubBPQ@mail.gmail.com>
In-Reply-To: <CANiq72kxNx6wdvAW1DjGm=JhPiqs74qwxfPQ6cRHxiuZUubBPQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jul 2026 19:03:49 +0200
X-Gm-Features: AUfX_mzTfZ0XJqWxQ0GvAjc0gyWrkG1AWERc6cf_MoaQuU5hP2sSrldVs93AGJQ
Message-ID: <CANiq72kjcLJMz-Cqj_XJku9EhGFp5w1_Jk2wJ-r4_VkT+pjb9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] rust_binder: Add dynamic debug logging mask
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: jahnavimn@google.com, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 6:37=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> We should probably update the example in the `impl_flags!` macro so
> that people use it here too -- the macro already takes an expression
> so it works.

Filled "good first issue":

  https://github.com/Rust-for-Linux/linux/issues/1244

Cheers,
Miguel
