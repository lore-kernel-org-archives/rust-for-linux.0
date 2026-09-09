Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F2C5540AE
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968252; cv=none; b=W1+I9+DUM81Y9Y7VBNbQyYmeqYDxLHD2sb5Ug/RxkKSuw+eXnAM4+WDNoMk9b43v1tNusvtTwPinvDhKtwSUMPoNMI0RdFGOzO356xDD250l2mT3XmNeSn8eVh1ZqoPGNXwE3vfUwycppq5JnK7B/5X/hUuyC+is6WMc0D5o814=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968252; c=relaxed/simple;
	bh=tlXMq73KJhLbqOa3sBQb6U+eAptv38yQqOaGm+TCraA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZaqGc0x5jM5Aob3eDi48GHu8Cb8MwaMtvBs0SiupDlH2RJ5gNGzNyMWVPuvOBZ2z9SQ1KHvo56BdoUWv1qHkeYhYsiLdCZ8Lf5WWiG6q4MAwNwjw4OCb30uhoKDSujLpo4cgVGwryTBg8YPJjh8OKT7tM29QWB+ZztJ2YrW64Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XwHjtY/U; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XwHjtY/U"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1fso183211666b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788968249; x=1789573049; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7MDRo1IEz0/ztB5k2AgA6IiU/moC5VF/pQ54TqLA70=;
        b=XwHjtY/U+jym45pEEOV74PkUlxGZmwntlmHaBN6DVTjlPQ0cYksJu25Z3tXy5VqyPH
         /xRc2h2BnwudNBdvoRiQbfszEjrP2xIxXcFuQS6+tEH1uB4Hny/BxvYeTnRVtseAHQGP
         2bOQK//DdhIzDHr5ESFNAwTHZW3bnPd7g9lCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968249; x=1789573049;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B7MDRo1IEz0/ztB5k2AgA6IiU/moC5VF/pQ54TqLA70=;
        b=gDI7r/N+FHBcAYayAr0mmpzBv0Kg5cx+1VVpcwE0lkMBrFYNaS8sGiwVJxQaFv9sd7
         AS2N2MmnmTSqnqkB1iH2rpNlU+8h0QDFgjQ4PITAMMW56D3derbIYgmY7XEfMKLWK1zD
         mLW/sJnzz0Di5yYT0II38HRkBp0rOes5QPCzOTvs/ukzFzbej9Ts1yEHpAkyiYsoHMkV
         9Oa3WKZ1lcFnT/OI/bRGd1IwBQjkCjoWhfWMLNCKhmSMb0NY09PNdZ6fB6oXWfKXiHY+
         OwyHEKpXvtN590zRpqb2OgQbaOUoHR37N7ui40UpjzBJQyQeUcO+csUdieV/s/liC20b
         f26g==
X-Forwarded-Encrypted: i=1; AKwUvBzpnjmIiZSxtcnM92lamp3R4P10rqXqr/WLDimZNDIwK8S9wnZ3J87xncYBgCF+tnaVHTRNzHvjY1uFl20xyQ==@vger.kernel.org
X-Gm-Message-State: AFuF++km9yR797wSR1pJXGUDds/D5zuv5Ywkfm5o4AaQbjckpo6Bw1IC
	D7B0y7ieZg/7wJ4mtFUzFP2Yki6is2aUsOH1tNWHSAQYTYW1kH/9VspKUApvLCVKGWKBiHPrA2V
	UVzzU566tDc18
X-Gm-Gg: AYBFou09cEWFpgt7PffdVYtr6KZLafXKTJ4aj3tmMdkUGevbJSCVJdwqLyVW6t5CQr1
	W9wO1auNBrbxI1cYSISyJugWvA2NhNL+LuCToD8olaTGobzY8jVf6R4rn+KsMWZmLo9XnAb46HS
	3e1GaKhI9nXVpeojxWEtqJi1JxxKOB8EJpctofa25DML2JJ8I10l8ZSBTTNKA5CnoWCJpjDDwAU
	HO/51YrR2ac7mO+qC847KsbiAw8nkutbaDMMI+xFpmoO5SWJ73X6n0rgE6RuStoALpyES5hsL9t
	1jYByohVuMfjHq8NYCWvyq7EWQfYnZhlhf0V5ZIphENvytnoH7mKKjTmPFKc+t1gHN1W7CudWA4
	pMVbiCnSlsM0wDIru8ZV8LH6ekHQbIAYxh1zdyxZDdfWpnkHrsQpeO1rIGP5Xra3NYKIWGZAmko
	2PZ8azBI+WNNP7vn9RuEXbIioCb7nNlmixBR+QBqDz5oNAxtca690m7zQd5xD3FSegXoNDN38/F
	1yibNn9435BIbtC/BRjNqUtOXpkoA==
X-Received: by 2002:a17:907:c50e:b0:c29:450f:bdbe with SMTP id a640c23a62f3a-c29450fc2d9mr22133166b.16.1788968248697;
        Wed, 09 Sep 2026 08:37:28 -0700 (PDT)
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com. [2a00:1450:4864:33::10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa0b9sm799137066b.11.2026.09.09.08.37.27
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:37:27 -0700 (PDT)
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae52so1920429a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 08:37:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwlORbJTrzx1VkYJFY1YwVEUn9wDTXKJ3dokP8K+s4S6xnkgpIi5DcRkz1reaqIy3Ywr6rziB6XU7rrP2Yj2g==@vger.kernel.org
X-Received: by 2002:a05:6402:3817:b0:6a6:58e:f84b with SMTP id
 4fb4d7f45d1cf-6a98dfd77b1mr5256449a12.9.1788968246832; Wed, 09 Sep 2026
 08:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 08:37:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wieaheq8rXSps3xRZpNNMQMEj9BH5gU+Dh4q_ZgokO51Q@mail.gmail.com>
X-Gm-Features: AcwNN1XKEJS_S8eITIntw19v_mcHyut1QfPlZfjowWaI1qZq5Mivgkqwhzm7f_s
Message-ID: <CAHk-=wieaheq8rXSps3xRZpNNMQMEj9BH5gU+Dh4q_ZgokO51Q@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 13:55, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> A typical kernel build consists of a frustratingly large amount of time

.. you're preaching to the choir.

>                 == allmodconfig FULL build ==
>
>                         before    after     delta
>                       ----------------------------------
> Threadripper, gcc       345.3s   275.2s    -70.1s (-20%)

Well, that's certainly very encouraging. We should do this. I sent out
some emails as just reactions to individual patches, but I have no
numbers to back any of those emails up, and I never actually applied
this series to my tree - they were all based on reading the patches
themselves.

That said:

> An LLM was used to first determine where the bottlenecks were then to
> figure out how to improve them.
>
> It generated a lot of code, much of it hideous.

This made me scared to look at the patches originally, and I held off
in fear that the patches would be horrible and this build time
improvement would be hugely controversial garbage code.

But:

> I extensively audited and rewrote a lot of it, and heavily edited commit
> messages, the cover letter and comments.

None of the patches look at all horrible to me. You clearly excised
the hideous parts. All of my reactions were of the type "this could
probably be taken _further_" rather than me throwing my hands up in
disgust.

So the Rust parallelism thing clearly isn't ready based on feedback
from that quarter, but the rest looked safe and innocuous. I'm all for
merging this, although it should obviously go in through the right
channels. Mostly the kbuild tree, although some of it clearly would be
other cases - the objtool change in particular is fairly substantial
and needsobjtool people to approve. It didn't look all that
contentious, but still..

Anyway, I'd love for this all to go in. Build times are a pet peeve of mine.

              Linus
