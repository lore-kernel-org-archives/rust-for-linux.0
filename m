Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83383496D4B
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416884; cv=none; b=AKNhXSiQNf2wNC4j2xHUaOpG9OPzUMuVWj/Yrn7yA9gNv/LzHMBLf2dQyPOltjt97ty+fMlSlgiTpiTCU1JnWB9hFfnHHOSbvqvv0MbBpGcF9Uquc+cNNBga4UxEOu5SB/r4i4dt13uUMWx3dLfNL9gQipMvnn3nYnVaT+lPXcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416884; c=relaxed/simple;
	bh=g8JbSv2uB9OVHPX6mK0/xKaLA1R5JXVM4OnU1gOEgUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rFRQHoX3PqPa4LEhtjRF9TlkEaGLaZRuJemPwFyO4h0Z0ajT+9bOlovBzW/+TwAggDEPFbP5NsA09mnRxrvTMNXAA6eyzm+RBKwKBkvuryxj77GLVm3xtQd3kOS7QJiEZ7sNWGW7cs8lueEdBsBGPrwzlyrDuRc8H1mnqXLVA5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=G4DLEh9g; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="G4DLEh9g"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9c0cd47bbso3802043a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 13:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789416881; x=1790021681; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhpCYoKplrM1IaRlncQiHxwpj03BaeP0oenEDpXOAEg=;
        b=G4DLEh9gxpke9W8W6n2q/LMI8R3s/wTm11rClkUCnVl/R2TN4Ke5CJ+weqUkkFfuYb
         cI1GNHRTckeifnZQ7LMbp6TkJ9QiAsquj6/BB02r6ZGeaRXKFypjZUh0s2kHKX5tJSzN
         ZMlNNTummDloMi680DPEvo/RMh8HghgVFckkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416881; x=1790021681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FhpCYoKplrM1IaRlncQiHxwpj03BaeP0oenEDpXOAEg=;
        b=Z6JduAYQ1eQUJc2wD4wFXhwGmYvWPJHSOy16o8gNRENkzWF9MTc6aVfzZ+9CQJYotC
         2UNkQ4Hc5asW0MUfOSeTMJ16lKpTnccaFSZR2EDVZ38H1zTGLUT2oG3Ekx2VMgPDzwvW
         MoqkM9M4H6jbfDlsfk7UTea4GJZmzILQKyHGVH5Zcf9aDnXwFKckHc4Gb+HyOXH7zyAC
         Hx1o9G0cgSTm5Esw5GRYsow+ncSaJB6b/WskC7/JBB+7nFhIRSeHRty3/P/TmFvtH/c8
         Hv4b8yAOPAiGqVS/pXW8L7o0jdPeeKFdxHqVckwSISwSSpdCIL/cgbRRQS8JjpEWDb9I
         YLLA==
X-Forwarded-Encrypted: i=1; AKwUvBzW6e7ZZcEFqdrbECIwy5Erio3wbVr5Mq50HKO5iHcFOS/RSj/9EAZUBh4pw2yfGtad2aCZEw4E1HwTLJseFw==@vger.kernel.org
X-Gm-Message-State: AFuF++lHeBgHrCdvHYNQA0/KeWkUKE9wjsUZzy7pXQsFhmOu8bqKN38r
	rrv2ccZ0bw3HzAapq9JmJBNKVOU4AdglfPidjd62SZyaU8NBkulfg4hhYUQMMW2qUlrIWAQxc6A
	hdc1sxXl+Ig==
X-Gm-Gg: AYBFou3Jpa2zZPwyMszvJ5os1W7KfPBkFraduFdkM1a/R26CA5fyp0raYK6Tc/OY6xt
	IkZQcXo1nQZkMLOvsMof7BulDH5SYh6wB7ZrzqSiWaLg9XEXWME2uSrlx5q/79+SDhJ14cLvumE
	Lzx9H/zxz6Bek4t5lE1DNpMk+UYltTEAvCoeLuJOqV5m8UpRix86Q8+dsey+M0gbpumIEavdUcB
	4fhh4NJfq9/WmW3sm7sdDc3B2rwF7Wt0UlevZv5KpKMe6sR82l2NBIiHe+LSL81+unSTCzP1sUn
	YykFFzQRUwS2E4V2c2d3rJpmKpijiGGxYMEZjeXcMvq40b2etMMUntAj8HXQJ8T90O8deIKhpFB
	fc1RehJ2aQNZKk1TFk9mBPFFmQAGPtQp4WV3bd62ut/9zu3L4+9B4BLkVZlTIbtfDV+ye+8iLAZ
	lRcYfKiuOLLrJs0kH5kYRkDkkd1C+Jyl+iNTi1DW4K3bTDQvWBk63TfKoCjCAiXhJaHnVMX6CuH
	Bv0B2IDa91fe7153UTVRRBmuyV64zBuKH3VwYbLhZL/pZko
X-Received: by 2002:a17:906:730e:b0:c26:2eee:ffc7 with SMTP id a640c23a62f3a-c29b870b484mr256728066b.35.1789416880666;
        Mon, 14 Sep 2026 13:14:40 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660654f2sm472177866b.28.2026.09.14.13.14.40
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:14:40 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98505364aso3751707a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 13:14:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxPtxaakIKG3ttqyxbCMGfN4pRvOkbuxtLFPd9tKDDY7e5ON8afmV1XjDsQomMDRVkmbFYqHiZ8ZrH/dIKwqg==@vger.kernel.org
X-Received: by 2002:a17:907:6d1f:b0:c25:5faf:b207 with SMTP id
 a640c23a62f3a-c29b84c9a48mr280688866b.3.1789416413732; Mon, 14 Sep 2026
 13:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-15-39817ec5db23@kernel.org> <aqhLhVMkNzf_4oJw@jpoimboe>
In-Reply-To: <aqhLhVMkNzf_4oJw@jpoimboe>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 13:06:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com>
X-Gm-Features: AcwNN1XwkDuRyfqGBvPSv1hGEYJIl2TPFZFoOf2g9mdtKKeoU1aAJmlE5veL8PE
Message-ID: <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/21] objtool: cache relocations, do less work
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 12:44, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> BTW, I found another initialization bug: klp-post-link.c uses
> elf_create_section() to create a reloc section, so it missing the
> initialization of rsec->hashed in elf_create_rela_section().  But that's
> moot if we just get rid of the hashing.

Talking about "getting rid of the hashing": the instruction hashing is
obviously a big deal judging by the hash size expansion in that other
patch.

Do we actually look up all instructions by hash in the first place?
From a quick glance, it looks like almost every user of "find_insn()"
is looking for just certain *kinds* of instructions: calls, branches,
returns, endbr.  And branch targets.

Maybe stack updates? I didn't check.

Yet we seem to hash them all - even if they are just some random
ALU-only instruction that is in the middle of a function and never a
target of anything and has no impact on any code flow.

So the question becomes: do we actually need to hash those
instructions at all? Are they ever actually looked up?

I don't know this codebase at all, so maybe that's just a really
stupid question. Feel free to look at me condescendinly, shake your
head and say "Poor Linus has lost the plot".

[ And yes, I see that whole "next_insn_same_sec()" thing, which
obviously *does* look up all the instructions when you iterate over
that function, but it strikes me that using a hash table for that is a
bit strange when the natural way to do it would be with juyst a
"struct instruction *next" field instead.. ]

So if hashing was such a big deal that it showed up clearly on
profiles, maybe the answer isn't just a "make the hash table larger".
If a "next" field were to not only make the hash table much smaller,
but also mean that next_insn_same_{func,sec}() would become a "follow
one pointer", mayeb hashing would become rather cheaper?

Stupid? Or maybe "not completely stupid, but too painful to change"?

         Linus
