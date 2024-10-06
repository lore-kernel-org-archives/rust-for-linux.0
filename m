Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D551F4409
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Oct 2024 00:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728173269; cv=none; b=tYpVS7MlWf2QFewTRp4zEXWEIGhs8VY46wAT9Ojanz52/G534xE7DcqR6WKByiBoghMeSpDtii7ms1q99JmzxiW93R3EUxM0n8/52vC26m7E516gDFK2BkD1EKme4GFyYz0VldVML/Z+i5oFIjVkykBBd9IKGzJ16iJbpLWW73c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728173269; c=relaxed/simple;
	bh=7PhV7mSmrjXdm322I5AhDI6uiC32DXT2Ek81VrbJ7rA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=razMDUx/RX/bbRV6Lqk3+PfMLZV0dfvQqWd+qmdGEKtZP3V3IN6NssBeMd8osSKnjBlK0GNy+hwFKJxRuY59AijQ1G8a3RUCRDfCT10qeDbJEX+sY9jYWWMw1qlBhtY1XLFSP7q83+YrzBnd5s0coTkr4oJTtSZ+yBS+44NWDtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WoGrRkfV; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WoGrRkfV"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c88370ad7bso3905256a12.3
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Oct 2024 17:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1728173262; x=1728778062; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zwWtZnU6O3CUnR/7Ge8+NpuQOrJwSLSqT8+8zcDG8JI=;
        b=WoGrRkfV1hArNK/SExEuzEcw80D3ztTuYmkzBUkKd0d98Kyyd7KNaHvz0jNefRnv9n
         3/IZt39eQWM1MBw+Fgsg9QeNP7+6SIxkJUEG1YkdrggcwsUdssBqAC8OY+eSOw31Aagb
         Qn6LOjyOfp7kvtrZaEdNVvhY9vZ37/EmrI+Ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728173262; x=1728778062;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwWtZnU6O3CUnR/7Ge8+NpuQOrJwSLSqT8+8zcDG8JI=;
        b=ChQKsisoqqFC6PpaJrRAu38ECtI91MxqmCChSsX1jcW+zLeggULOnDSx3Gep0fW2/Y
         SU6kUC6XsNAwcRThABsd4E5LFALzjwYFEsqkVbqkESEPrdYW++JTEv3tR8zPPMEMQ4X9
         /I2LCSBHuKygnZyjMXrpX/IfwzgOhVSX+eC5t3XUPF4OFIHgqei3GU2mDGdWWMIsEuJS
         5qu3mDiW86Ci2HzT+J+rn/u3AwRvk1WRYM6z5LUOhsMGnz79Q+/gU8fWbcHKD3qD1mY7
         mv0kWfxv1ni5nMumKPt7nysTiwufPYCFSLm9X+f8Q3Fbb9f/9GPCr0vPLG9+ZkZvEo6X
         85Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUgui58dK3WlmbMm8hA5ibk2hgXoQPi2C4/Hg9c8raEULf/SdI/zD6vllUlLygFZ259N/i2J7Vd94iSGdaIig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXsJF3eMkrFjImfhnlL+kkG6wNgfb5Dn4HOEPdpg0aW0zl/bZK
	LHnIFBteaC4TykX6NtsygHLvf8JoztW2Z1i5rUk52l8sGGr5E7xnw0aapHiWJpCN+hFovfud1Gm
	+kbRO+w==
X-Google-Smtp-Source: AGHT+IF4l71HEjDAYZv5daxpkjFZWsBReQ1LgW9TP3wIF686fsl6oU4NKmdFu4moPpYjYLYk4OTcpg==
X-Received: by 2002:a17:907:e292:b0:a8d:42c3:5f68 with SMTP id a640c23a62f3a-a991bd44facmr688293166b.23.1728173262015;
        Sat, 05 Oct 2024 17:07:42 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99420bcc1esm98800966b.199.2024.10.05.17.07.40
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 17:07:41 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c882864d3aso3569972a12.2
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Oct 2024 17:07:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3cEcpa1oHFAiIyJ0mb6O3PpxpFDFSxUJPogljdSlS70yhaQjwevOM7JnxFnxvdLGcu2RB4NCy/s13vXuicQ==@vger.kernel.org
X-Received: by 2002:a17:907:9693:b0:a99:3d93:c8bc with SMTP id
 a640c23a62f3a-a993d93cc22mr339286866b.13.1728172818387; Sat, 05 Oct 2024
 17:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
 <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
 <CAMj1kXEU5RU0i11zqD0433_LMMyNQH2gCoSkU7GeXmaRXGF1Yw@mail.gmail.com>
 <5c7490bb-aa74-427b-849e-c28c343b7409@zytor.com> <CAFULd4Yj9LfTnWFu=c1M7Eh44+XFk0ibwL57r5H7wZjvKZ8yaA@mail.gmail.com>
 <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com>
In-Reply-To: <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Oct 2024 17:00:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgkgnyW2V4gQQTDAOKXGZH0fqN=hApz1LFAE3OC3fhhrQ@mail.gmail.com>
Message-ID: <CAHk-=wgkgnyW2V4gQQTDAOKXGZH0fqN=hApz1LFAE3OC3fhhrQ@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 16:37, H. Peter Anvin <hpa@zytor.com> wrote:
>
> Sadly, that is not correct; neither gcc nor clang uses lea:

Looking around, this may be intentional. At least according to Agner,
several cores do better at "mov immediate" compared to "lea".

Eg a RIP-relative LEA on Zen 2 gets a throughput of two per cycle, but
a "MOV r,i" gets four. That got fixed in Zen 3 and later, but
apparently Intel had similar issues (Ivy Bridge: 1 LEA per cycle, vs 3
"mov i,r". Haswell is 1:4).

Of course, Agner's tables are good, but not necessarily always the
whole story. There are other instruction tables on the internet (eg
uops.info) with possibly more info.

And in reality, I would expect it to be a complete non-issue with any
OoO engine and real code, because you are very seldom ALU limited
particularly when there aren't any data dependencies.

But a RIP-relative LEA does seem to put a *bit* more pressure on the
core resources, so the compilers are may be right to pick a "mov".

               Linus
