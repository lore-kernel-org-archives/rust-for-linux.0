Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F80A3C3443
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885149; cv=pass; b=TI9nt2SFvy/SVwWKk/kzxAfBO06XZzbDEZK0slkyAjUh9Cy1YZq/JSPxRhg6sDgR0w1KTa/EAHu9GHK+pJCo45UgB0Jvm6TufNkCJwB3li62f9t7NfZb5rMtYSN8M8C0ATtACQxYC2wA3jPN1qI3GKHYgtZE8dyYB+IPfV6Iu/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885149; c=relaxed/simple;
	bh=TyAuVkyMsHJJREXO1/HTkl4JIBxp9Fm42OQD2fqAPFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4zqlECUq22kXyw73s0NJ06LwEcoDcebu8Q2IPjdCBay7hxK4SydQAFQZUhkDP0HTKLL2kQpWfa00dHoo5ff8DVeZdlbmpbKzOjafgJKpQosdRqVkCEakQjl+dAeRkjMEwGKpP4DHA6PLpfXHaGuKUZEhoAhi2OqSdE+yPmENDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OUe1p8Js; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OUe1p8Js"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so5103091eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 02:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791885147; cv=none;
        d=google.com; s=arc-20260327;
        b=ON/3WryGV5ofucZh88iMWAK2+PdTzgiGngSW67zRJlW8v+d6dSPsiYnGimCWkBYiTE
         e5Ally+OLPjSBxa8begZa7Fy2iPiKzbHcQQAYPtyHt34dSxC19ZxoUgXfb6STuGbf/Yr
         8p09ipGiiYCZfoFt37jhuz4Afpo8OOUbu7JTAEfkQQLnzOhK8p1GVgz9y8lFsLV1H8Jl
         gnIJYI7fBEz46WYk4xVaAKem+nf68MF7grSGk+wSnjl0rjMTRgsE/ysa8gPWfd8Oqit9
         JCHvTIDEGckQF6pQqwFwYS9E+3ayUr5bdDwusB7nc2GVqKzwLcuulyGG4rMLjuwYA3xD
         a7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        fh=qtTNAdbDaYFppC5siZx4wC8/Sx+nujRLorLTrdCmm6Y=;
        b=e2w9i60vz8cD4xK/ecYbTzwMJ2l4MVIg15YePCiC3OGPigCfKRxei1jwWAbJv51QAY
         QyxTknIhCz25I7rrpj2lz63SKXqRy67Qx/Oq+nGhw+uN7nAtKpQLO4bBMu9lDDwljQ08
         u7alckTMiv7VAcXkv7ebOiyXdrFEeEzyhy0OJff4jmTmpQQdWh4lF53FhA2YGAV+pB73
         fJ9+jjsbq7E5/NHhjG5Y6c2eyyPjI/iBtKriE/mcGVltSPbvREeJ64pk+RJnfQgFpdkZ
         MSkZ09Y+lgI2hLhIG4RxLNbd0FoeZIJLD2xKBiihcUdbdILQ4jiBhYkSt1g5axFOWHIF
         FY7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791885147; x=1792489947; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        b=OUe1p8JsbeOEmdidmgAwZjuQYWObCln0UY6mN2eUEQlLo8RQwV3Wez4R6Toconn+2u
         SwPGP8b+GpqrAeyfYZLM692dVCl8k5vn4xCfNuGKRAfvfdLW4KGBVya1t4RWLKH6ELWD
         9A6WuTcdLUTdhNf/MuIce3PoimcZODZ0HtnvYu+7q5io1IQl6ksS99sdaHam2o+3ZYqL
         niW9YVjN+cw91gOGKi1XQJ3scIcybviJt/gxM/9I12iEZMz/64ksZfQ8QV7Zh7qg+gew
         8cSgZD1M0cXsfyOnBJpvjsn9WE/cAIIzU57mjE7HVw0PwvaLRqH0Jo+eujidbn8w+Y/Z
         fV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885147; x=1792489947;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        b=TK5SLnildTiYo3qpTMb+It74qPpMaye1jK3W53McHFuO2we5INQbH90aGRlmIdWhNQ
         lBGQeIfA7wRmeeAfqtT8MV/eUGmmAQGFx6AbIP8pyeDJ/6x5ypeq4MgheRsvM36r5qqe
         LAaxmfURkDAnxZxnLvlBfj4aHon8Fam6CWBQWc/iJ8Dr9KUALZMtdjXOw6vuiM1ZYQFF
         psMRLRi4chkRwEM9c+mXsAjt3Szhp9OeFaVCdA9FDNh31zFP4tJd/pm384C0w7SVuQid
         3f/+bYAuB5gQpBJvdPC9e3C4w1inZ3FfyNUtetb7SL956YnEMADWaArxd2+RS6em5+Na
         gJNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJgInrnbnADFAIzvD34tbZGYSmeP0i35taPFR2yL/YpqdZQ4VVi68myi7gVlR4h6oVfe4GPY4Xb8yaYHBOAQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIE1HRj0Ey9Qie+rcTkJ1t3N0MHjoo48rPvHtPL3pcVZ3g0Uxbg
	PbJhN2sqwdK4OUsU3kfWSwk1HjhN/CrjGme7n57FXwQgpxXyrPFowCs4I6ZCyzEpCRJb3hReXG2
	iCwCSZ9mZs5aolKULrR7MP3iUVXpno9HzOr3V6EuL
X-Gm-Gg: AYBFou3OKkbNOpANQcSfqX1q0J78vIZHl5+wqDub0uRVAd1dcVl4aiWwCJXcE04+4zR
	79VTN5cAdTffsgn8rf4ekKfxxtB0z+PzWhmFsh0PQrRWIobDNCsleokmFxRNxbMzI5bmeeIXNFV
	RTfdp+WrXIvcwjZTrDM4zhrgX6LeEsNm3AfJUcnc9DCJ5bFDp/qiXWm1GR8aI0zxyz4dTMzoXQN
	dpsJVm3aXv3273qVnKOmryme9/DE7W4GB4Pr3wfKVQYFqbwKK30XBKnXgNb6b0RF3t1+W++LtQj
	6LsAR5wmFLTYwVaFnyFugwad77BOC2oXxZ2JpeYtt4fxelKZAOUaZf2YvStnxiaT6+/EaVRA/Gw
	9yV9YHDPAFQ==
X-Received: by 2002:a05:7022:92c:b0:165:8e0c:1886 with SMTP id
 a92af1059eb24-16a610c9bedmr22542241c88.25.1791885146407; Tue, 13 Oct 2026
 02:52:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <CAG_fn=Vx93UmT_Pp8F-JDeGM==UicNmMFEp3RW8+stzkm5+sbw@mail.gmail.com>
In-Reply-To: <CAG_fn=Vx93UmT_Pp8F-JDeGM==UicNmMFEp3RW8+stzkm5+sbw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 13 Oct 2026 11:51:49 +0200
X-Gm-Features: AclHuK_xfsOoDi6wrmohki4XfQkFak1e3ZKbYQiASZjaKFsec73Ai0xMvJurni8
Message-ID: <CANpmjNOdnZw7kgjruLikbyPK2fqLgtndMdnX5osWtShP0Wh_UQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Alexander Potapenko <glider@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 11:36, Alexander Potapenko <glider@google.com> wrote:
>
> > +ifdef CONFIG_HAVE_KCSAN_RUSTC
> > +# The minimum supported rustc's LLVM supports all of these options.
> > +rustc-param = -Cllvm-args=-$(1)
> > +kcsan-rustflags := -Zsanitizer=thread \
> > +       $(call rustc-param,tsan-compound-read-before-write=1) \
> > +       $(call rustc-param,tsan-distinguish-volatile=1)
>
> Do we also need -fno-optimize-sibling-calls here?

It's optional - I added it for Clang so that stack traces are always
complete. But rustc doesn't have an equivalent option (neither do some
of the hidden llvm options work). So this is the best we can do for
now. I might want to note it in the commit message, though.
