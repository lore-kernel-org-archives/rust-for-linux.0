Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC8631E83A
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 13:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617318; cv=pass; b=oxKJliCYRr30SS4nu4U74FKOCtW5bLCiPYqtu7iCn/z9HeyDg5hgCk42RHrO5NkYCj6Ei2t85ixo1VtkgQq8typT/umaiyOUSBeDwsSXvDSLok/40HlCgIG8dexSNNkkEJDslNvlykHJoJlFhXWb74mN+CAkATFmdgvrM9NQLdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617318; c=relaxed/simple;
	bh=vFyIEqeIs5fuKpAzuSBPV4fQXXxeTn0cFHGy9OT1450=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hVPs6oh021eD57RrICFBsWCSO1P/oE/MzVb+BUtTTn3Czq16ZD3qPHkSnfYAX2cGlqIP01zS52nqstPXqrAceMrCCn8JOHoVXqkbr7vC2+N1bpzevjPMWkEB4gN2/tbUCfUXPOsMU/gAstT6+4zLsVBpwBu4gjijqNnRVIN+uJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K2Q+j1JM; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K2Q+j1JM"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304e83724bfso6227993eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 06:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781617316; cv=none;
        d=google.com; s=arc-20240605;
        b=a2wChs4lAphYw8oOwl9jSnrHwNnoLy5UsyW+s+omg+2CiMRNaXXrwDqx1jdin39/i1
         VnEg1G3Zh/Y1Y+wrEJLX7WrNCdBgpYhPTv8f/wFmtdgaPEZC3BCTNS9r2yThCWcVqtKU
         v1RzFvORK+q6mYlLhYWhGYRnuZt7pLXX/LBfgsHZUEFEIg831+TM+U7tyNy+gRw2xBc7
         xshOI5cq1U7HX7bAiK19DiCV14ErVP0uemdcSxHbMl7iugoAhGbThbJrIUJ7NEhvVCcG
         qHgP8XLbYrFp6oAzMxAiI5NmUo6ngD3mDegTQCR0zivtJf40+iuhIA4C6eGppOdMn6/z
         gTMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vFyIEqeIs5fuKpAzuSBPV4fQXXxeTn0cFHGy9OT1450=;
        fh=tA7xPoNxjiRJIoR99+ofKKscdh+ORufdndCMHbjWs2U=;
        b=A7AyvxAIuNyMTpSWfnoxytJOICuJm9aYw0apkyZa4bpoFkdOuNHOIGfX0hWlVeytdU
         5lyR6zTaNSxsKOzlsNCFsmTgOdo1ZtxZWNv8lZV4u3oeHwEdrN0ApjwpADZW+FHBxs5r
         qVXg3FLfVkXcIVmQbRLX4hjZZDPQHIiKQ4yEfglutMMC6bhdSN+emuWoXIN+cX76qYIL
         bwwkco3Fz7ndqYv9S0mVQo6n5lPf8Auv4Qz89SpErXvFwImxghBk58bQp0r6UfAlQDgO
         drYwEGqauMR8tAjrCOUHjcDteYE+j6NhXSlVR28ges/uFREFaALVQ+JUrPWnjc5Spp1f
         hXOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781617316; x=1782222116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFyIEqeIs5fuKpAzuSBPV4fQXXxeTn0cFHGy9OT1450=;
        b=K2Q+j1JMuaxoREgOUgS8GYQH4awesNrOGFD2kDr5VhE4EJ6f102/Kd6Isq+HOUqyJj
         P1FGn8/c+n5kN7nuwGgHfVMQuDHvsakIHyJP2N0s9MTyKXmeY3+Hz4XCIV98KLjcerb4
         3StdVgW6tgATcyuO0XXy4EtzDzdk80PIrJfRG4ZMOhT64IPQ/9ly1T+hiUTkoPR5ypSF
         z4OOgyR+lDDsKGppg7SMJq6f/sd79WBFLvZnllhgxUNiLSHb7s3XKm1PmFqj+cj203+5
         RSm5WHahrxiU7CFax10/TDMKbsc2YxSqzDBS5TpJ+pHW5xMZOugYKgjTnzmAonX8f0FN
         cSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617316; x=1782222116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vFyIEqeIs5fuKpAzuSBPV4fQXXxeTn0cFHGy9OT1450=;
        b=VgbGJdPIX0Abrd3Rey8XF9D/dvsk/dSxQR6gR94B9qY8rlROez/pThxdWmsULsqoHW
         8G4rnA9Dqa7g2w1zB4QrIus127iSWAnw629OV51d1V5/70arYEU0NrtPhukCcTB/2Ddo
         GPcEO/PBOTSjhUg25TSjQpiTw2dsIcGSdArrwMzBC0vWPi1sBBaPmFCtTy1dmzqEpro1
         10absnB/rqutI2iRV6m/7oYX8d0HhdorxhByU6ICBBSfBh82vFNatbAtjHvmY4uNUrDE
         6jp3XMuzYZVFgA3Cnls0DuwUwZeFFCVUSnJcGeyOVgbJ2RakGlDgmHvXYrfMbCTCzFmY
         YYGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+n8gY2nnHlUYimmuh6ylsYECdyvHr/l91qKLOCJ3w1jfF8G6jjJN3WVQl6fu+GyLvWD3NXC4x+aWV1GRPW4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3H71ElXZlM/7TaWNr4J0+65+7rk1vz1JS2zn0DdU0g8oeLS9V
	oru1nVggjPVErzhVbW54Fhb5pAECgBKGalxhxwou+Q7yf7Ry14CKIKKqpQsmTkmqkqEXAvsIO3A
	ba7b4de3VJUF8ARW4/3iqU4bISfOYnDoQW1HGGSdz
X-Gm-Gg: Acq92OHRlm2JUKGOvDSJe+OSSLJP4J5sS0sAattIuLxb7/I1j1mTLBF2P7X/WlkSaFj
	7abbYn5Pe/GYrgKhR7VOE/Voq1iZ3y7Mxvel7CnPdXEQbvRQyGTy27LS5I2nIh7GcNJLcS4DeIq
	JiHSMt3iifuSXMVecEVft/CrPM6oewoJs0U4mlIkSboTJ0GsbA/6NEVB7WbCZ3R0GgjpEKrh0XJ
	mAH3sqiwydG8KLoxhAIZkU7KK07nv2mHdkG1eH6prGsDU+7THk6MtqrBk7Qiuxsshn5ehzqKiNN
	2G7o3iSFTRtrmUOQueiYRpz7QCWTcTBDBJOJmQiqR6GMpR1YE0Zqf7wv+L2oD3gYhYdeJ4UNiy+
	9UzA6
X-Received: by 2002:a05:7300:8609:b0:2f5:5907:3a48 with SMTP id
 5a478bee46e88-30ba596d056mr2231147eec.1.1781617315522; Tue, 16 Jun 2026
 06:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-frame-ptr-fix-v1-1-dc6b29a631d9@google.com> <CANiq72kek9NoFe2PCFnND1p6BRbuzgv6kT2o5jw09sWg+wau_Q@mail.gmail.com>
In-Reply-To: <CANiq72kek9NoFe2PCFnND1p6BRbuzgv6kT2o5jw09sWg+wau_Q@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 16 Jun 2026 15:41:41 +0200
X-Gm-Features: AVVi8Cd0shxPdtGfFX62VGFf_4e2WR3Zgq27GdoB5xnmwoEa6aUwuGjBmlMVQhg
Message-ID: <CAH5fLgjqVxoBVdoSG40vE2uqybeC3zvgi7T_fTA1=HwFY010Hw@mail.gmail.com>
Subject: Re: [PATCH] rust: Kbuild: set frame-pointer llvm module flag for CONFIG_FRAME_POINTER
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Douglas Su <d0u9.su@outlook.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Fiona Behrens <me@kloenk.dev>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Kees Cook <kees@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 3:34=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jun 16, 2026 at 2:30=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Cc: stable@kernel.org
> > Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
>
> For 6.1.y, we use Rust 1.62.0, so we don't have `-Zllvm_module_flag`,
> so we cannot go that far back. I guess we will need to accept the
> issue there.
>
> For 6.6.y, we use Rust 1.73.0, so we don't have it either.
>
> For 6.12.y onward, we support Rust 1.78.0, so it is fine --
> `-Zllvm_module_flag` got added in Rust 1.76.0.
>
> In both 6.1.y and 6.6.y, we also don't have `rustc-min-version`,
> because the version is pinned there. That part happens to work,
> though, just due to how lax Make is... However, if the flag had been
> available, then we should probably still do it cleanly with a custom
> patch to avoid confusion.
>
> So I will instead do:
>
> Cc: stable@vger.kernel.org # 6.12.y and later (flag not available in
> pinned Rust in older LTSs).

Ah, I didn't know it was so new. That makes sense, thanks.

Alice
