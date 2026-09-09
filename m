Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CD2563FA6
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 15:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967981; cv=none; b=EqT9j91+6ZH098y58MR0sV4RS2/zF6wm029+Gxip3tnoQ8Ip4a6lml+bizSComMdTut11Hj74Mb8pwAsuNW4G1p+/vwfnn1WLZ97Ap0p8yWYSq6SRKJGoJ3t1+fRcqdYLG4Xvv1XUtx7sg+SfFSzXOe0zPec5uYmttRVEHGsqv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967981; c=relaxed/simple;
	bh=t3yqbvSqtFoLUHow+WwPXXOfeaEh7bClm80fMM9rQTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDjvp0/CLJUtU3hieLI6FRUYl9rs3d2nYBX4CQ1oJS7GiazJrKzWUYJEDfIbesna2r9YXh5LMpI10PiiOW+iKRYWRAyOREc8LGFPlhkHZHyXtyTQRooaGDCljZsEGMDp7qDCG1/ml6/GHVLBG7SPQ8BAl0o6Qf/61qyp6DtUKpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FQKLDsfO; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FQKLDsfO"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a1981228f8so51528631fa.1
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788967976; x=1789572776; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/FowYqhA2IUhImtOTNUOvZbuU0tnu+Lv5LcROnzCHgI=;
        b=FQKLDsfO7XOOTzbgGCRCZkZXNPARCw03IYYJY8+Ee1IWA9dkDElvV9SrpiQe+nhQSl
         yp9hSYdExvp2/fwT9LOKMPXkOK6zEpjkeHf9al7wzBwH1jheS3oTPDBdOu4jlY8NQlOD
         pksavNI4YN7rJxxT7AAMjve5reqhv9Dwc64Mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967976; x=1789572776;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/FowYqhA2IUhImtOTNUOvZbuU0tnu+Lv5LcROnzCHgI=;
        b=LSkD/DTfeCUBhgCbddLhha1gSmtxiddYb6FK7IVu9hV/QHwBFxvKnBpVZ0i0UuBW/K
         69Tq7wI+HBy5QrvIHcf8Npoo3hnUYy4eArAGxwh45lhhgiXs843xjT57y2RaPjDKp9c/
         fD8IC5VFFvTtzF2gUz9oFyGOrSyyZRHBU0rCJchGSknsMwjjjYgwTXxwJGT1fTid7KRu
         //XP0kmZN9xXg/4fstEQcL4qwlhuNYafMQk4p5j5BFMPXWAl2qixPlYtjUO4Fh1ScKFj
         sOR2DNE21vnOa1Blxz/IOncIPzzy9g3BAfjYTyk/Ref4CsJTzfylDN8X2E1MyDs2liDk
         /3qw==
X-Forwarded-Encrypted: i=1; AKwUvBwgfWnqEEZLp41QYbst+sMfBe0kK0M3Npf4kPQXRs0IfjRn0oBqPQkeNo2lNMBkDoWixMtFdI19i4xo4+SPDA==@vger.kernel.org
X-Gm-Message-State: AFuF++m/bw2eOEF7V/fC1tiFS+gRoqQ4rGOIXU69ijvEqUqS/giRAzCd
	B1kFYWDZnSt1fQWa2pck2Y8r8vySajUtuhWAf3Mm9emOLC3PygAa7NU0x38G78gCizCbxPwESMK
	qpFlvN+5T6w==
X-Gm-Gg: AYBFou3PG1fTeuZPeNS4VNx0zytvMCXwVvJ2LHWd45tI7KcX9p3PuPZIz6eGjFvVIsx
	T6A26NCmYrm73uSAMucMw/zDDEAEvj/ESdQpgy+eJiHf7zEgsZEjy+a1Arg5PkHooQtz8m+7Hkl
	SlH8LfxXbKtlkyN6XyTRXBZ7cezklO4MzWvFoa1gpmWujqwBZk7YPq8W8yxlNBqEZrtQtOCpL8z
	z6/3hb9KleakhXOMkVATovFQAi6eMT8JV+U5ZxeAs/bLxMvuSj1PQJr+Dynfix+tY7m7XWmiAti
	BpL9+yVitxEQJxvoYZ5oBsNjPxLu2LZ5TPjVZbvYO7l1BrnH2d2wsu5gWRJz/hVHaLxw6V3Y4GC
	5rB+cxE4sm9a+Vm/5bYZReBCKpnWShrxSbx7jUNlI4MgNq8dVVsMM8YuDN8WDNAyLF/DCKnIL8R
	jVwN3m051dU71lmsp7ACGMD9HHuzx+GvK7ZxwhvYPVbTBvTDuQl/YYsFIwabTrBhTIItRKx1DzJ
	kwhW1Bj0RPuqHA6xcri+4mAEeQK9wXc/pvICOP7iFAmc0z/
X-Received: by 2002:a2e:a551:0:b0:3a5:8dfb:8c2b with SMTP id 38308e7fff4ca-3a58dfb8f3cmr1686961fa.8.1788967976227;
        Wed, 09 Sep 2026 08:32:56 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a464106771sm39869051fa.29.2026.09.09.08.32.55
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:32:55 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48441a2ba14so5052680f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 08:32:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByZchWWqBhhAA/9zfWVfMjrqDntko2Rlco2jyf8kJ2JwnMuye1ofstX/bVMOJRrxTS5jo9AXT3guohZRjUKDw==@vger.kernel.org
X-Received: by 2002:a17:907:da4:b0:c26:1649:47af with SMTP id
 a640c23a62f3a-c26164955fcmr1368813666b.37.1788967618809; Wed, 09 Sep 2026
 08:26:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-11-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-11-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 08:26:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiA_UJbKiu8fOezKV=MfEcaFuzZiuk8Fto-Bc1KrA=43Q@mail.gmail.com>
X-Gm-Features: AcwNN1UWYYtk4z7iDc5cI-l9BNT1_XTZBZ1EzZVT-QGEk4RrzSdK76DVFXE4iKE
Message-ID: <CAHk-=wiA_UJbKiu8fOezKV=MfEcaFuzZiuk8Fto-Bc1KrA=43Q@mail.gmail.com>
Subject: Re: [PATCH 11/23] kbuild: implement and use depcheck to check
 dependency timestamps
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

On Tue, 8 Sept 2026 at 13:57, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> Each object's .cmd file lists its header dependencies, which often
> consists of over a thousand dependencies.
>
> When little has changed in the tree, this is what make spends most of its
> time doing, spending over a second, single-threaded when parsing larger
> directory trees.

Side note: from some kernel build profiles I did long ago, I have this
memory of it being made much worse by the fact that we use

    "$(wildcard xyzzy)"

for all our config header files in those .cmd.o files. That then
causes extra work for 'make' for all of this.

And we do that 'wildcard' thing not because we want to actually match
a pattern, but because that was the only way to have 'make' not
complain about missing config headers.

I'm not even sure the original reason for it is relevant any more -
this is all a very dim memory from years and years ago when I actually
tried to look at profiles of 'make' itself (normally when I do kernel
build profiles I only look at the what the kernel part of the build
is, not user mode).

I just tried removing the 'wildcard' generation from
scripts/basic/fixdep.c and the kernel build didn't care about it at
all. The whole 'wildcard' trick goes all the way back to the original
commit that added that whole 'fixdep.c' phase.

Maybe the whole thing is entirely stale now and should be removed. I
probably just didn't trigger the situation where those extra
'wildcard' things matter. That whole thing is from a quarter century
ago, and nobody has dared look at that code since..

Or maybe 'make' is better at those wildcards these days - or other
things have shifted.

From those dim memories, make spent a lot of time doing filesystem
lookups (directory reading  and 'stat()' calls - the wildcard thing
triggered more getdents calls), but even more time just in string
handling.

               Linus
