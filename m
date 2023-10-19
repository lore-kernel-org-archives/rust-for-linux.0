Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AAB17994
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Oct 2023 10:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SXUoECpe"
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD7FB124
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Oct 2023 03:05:06 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-66d03491a1eso42476546d6.2
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Oct 2023 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697709906; x=1698314706; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X3bjb9rubAXmEx3BuTMzb9DXzA+Icb3ceQsdxtJC/Jk=;
        b=SXUoECpe8Nqneq+LhOtX8hB3yRr55n3RE0jS7au85tbECVbOSYro3wbUKJ543rwF/c
         XMy7p5iZzD3sLLP47IIzzdJM5GJgOMwTlg2rhqa+NR4tpF1cx7elsQoXzYYD6tNN9gp7
         6DO8LgS3MCcwvlxC6siOUI3kM/rN1VSbREuhJ39RIooSTaW4oXrqGkF75THM05pC/Xby
         KfuBYQSokrLJRhaGcQRNsf4X6ohd68MhTytvbZJYSlgkcKgpacxBg99SLc57noWSUpc3
         ed+nQhrpjGqOCZOB2gwSgoitqEEEvCqLZg9qfRpQUa2XNsY42zRBJ7BwyBzxPzyN14ky
         4hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697709906; x=1698314706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3bjb9rubAXmEx3BuTMzb9DXzA+Icb3ceQsdxtJC/Jk=;
        b=G6eFTxySx36BT0B5cHA6KIBDVULpBnT5KN8WrQ9rWi71oTLSfSh7PC7l9iZ6pKUmCB
         +LJr91IUebxvXKopBCHQW5psMmt2aIugksCmhV0gmg3DYOUMUxhtIA6gE9x+gpfHBIr8
         Gz1HMH/qHQxV6Dv5YpDW7755n2YZOwrKR3b6avM0eRLWvFbtqFQ0JbNqoE5Uj/sNlQSe
         LhRCGvkmNqdrClrOUwZGnPAPPDG1YYzbmpl3NmN19JDi9E5yAZIT4gUUc2OO9ZL2N2wm
         u7ZiTEuXG0mg/M13Xhdw6cKpFtRhtMiXU7mzyVT254XfbaxpKQSGsM47ckzpc0YtvIAe
         bC6Q==
X-Gm-Message-State: AOJu0YwRDPZbTXFjMyllWOub1Muz3fHK7SrBkPj4OdPac2U0iPj+laFq
	zNS024zivPCiZq/JeupUjE5draGKPB1X1C9dUUsR0g==
X-Google-Smtp-Source: AGHT+IH6FHJbxjRMVCH1yb8tkbndeFnPREHuEjI+EYywqZ7BjmHUvnxgyZZpMGESGZMAgQQUcjtqiwGQIFSoapndiHM=
X-Received: by 2002:ad4:5f0b:0:b0:66d:1624:2200 with SMTP id
 fo11-20020ad45f0b000000b0066d16242200mr1943369qvb.13.1697709905579; Thu, 19
 Oct 2023 03:05:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231018182412.80291-1-hamza.mahfooz@amd.com> <CAMuHMdXSzMJe1zyJu1HkxWggTKJj_sxkPOejjbdRjg3FeFTVHQ@mail.gmail.com>
 <d764242f-cde0-47c0-ae2c-f94b199c93df@amd.com> <CAMuHMdXYDQi5+x1KxMG0wnjSfa=A547B9tgAbgbHbV42bbRu8Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXYDQi5+x1KxMG0wnjSfa=A547B9tgAbgbHbV42bbRu8Q@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 19 Oct 2023 12:04:23 +0200
Message-ID: <CAG_fn=XcJ=rZEJN+L1zZwk=qA90KShhZK1MA6fdW0oh7BqSJKw@mail.gmail.com>
Subject: Re: [PATCH] lib/Kconfig.debug: disable FRAME_WARN for kasan and kcsan
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, linux-kernel@vger.kernel.org, 
	Rodrigo Siqueira <rodrigo.siqueira@amd.com>, Harry Wentland <harry.wentland@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Arnd Bergmann <arnd@arndb.de>, stable@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Nick Terrell <terrelln@fb.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Kees Cook <keescook@chromium.org>, Zhaoyang Huang <zhaoyang.huang@unisoc.com>, 
	Li Hua <hucool.lihua@huawei.com>, Rae Moar <rmoar@google.com>, 
	rust-for-linux@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> > > Are kernels with KASAN || KCSAN || KMSAN enabled supposed to be bootable?
> >
> > They are all intended to be used for runtime debugging, so I'd imagine so.
>
> Then I strongly suggest putting a nonzero value here.  As you write
> that "with every release of LLVM, both of these sanitizers eat up more and more
> of the stack", don't you want to have at least some canary to detect
> when "more and more" is guaranteed to run into problems?

FRAME_WARN is a poor canary. First, it does not necessarily indicate
that a build is faulty (a single bloated stack frame won't crash the
system).
Second, devs are unlikely to fix a function because its stack frame is
too big under some exotic tool+compiler combination.
So the remaining option would be to just increase the frame size every
time a new function surpasses the limit.
