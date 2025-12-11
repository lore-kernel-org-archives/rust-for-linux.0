Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79033314A8D
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 17:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765473204; cv=none; b=WtA722p8OuJur3LoO+AQSJoij8bA1g4tzTahATZ7asGU1AZAhR6750S2L4gGSUZHUoIC5UUHN7/CyeJ0WAX5ykWPkdPgGvyntj9Q9nxe3qHaC9obXynIkttvtAhxf7C3zbSzbvQX5LF3Pqo5cRuEoo55U6VvZq/u12bj0aWzPos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765473204; c=relaxed/simple;
	bh=8eJeVSDMC2OXA8/c1hedw2Ay8kqSusEdqdEXbNb4yss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWTq1W4/IMdgdemy10bzmlgI16WWE4Z0qnzGsMlvjBBlVCTPUP2yFB4UIOcMyY0y6pA+HHuWohpchL+fVKmrCBFKfakVk73qNESNc8NLfOqEUWm8+cb05DdctLdJVFwPJrtwGCtUZvJDRs7z2pICHhSq8zXMOFWH5/LJmzP8HiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=e6f64MLd; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="e6f64MLd"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6420c08f886so440813d50.3
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 09:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1765473200; x=1766078000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgsqjP5OdKf2pfViq8wHSszLchDHEA8k2q0YnXN+A5g=;
        b=e6f64MLd2MbEBff4BHorsHzanEbrMQAu8wJXMFvB5usQtYutEDcxhEAG9rFaanAo7M
         SlIMSfbi/CvsCZpN0IkOUEwAv5EuWNPrrc7z2HrxxnTThwWz13oqN9+fwU6QQkCawE9v
         KIn2GIqp2ruyHGxMV6X4q/JDLzQimoMsHz+1+RoPuAvTNSSJAayZEEbhrD1YFctw12VL
         hyuU4oZ0W3A2PKZa6TaacLnq43A1Du6F8AMlyw0IQyCcYEtMaJL7cCz+aoCTGOziUpqg
         O8bxAFT2rvuq47dSG93/Hw5wgQH/PXNZx73lJAb8zDzj3nrInoQj0ZCuvngwDEglabuE
         ZyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765473200; x=1766078000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XgsqjP5OdKf2pfViq8wHSszLchDHEA8k2q0YnXN+A5g=;
        b=siBOd2zHqzRkxQwd13IzsJ3Ov0j7VFY8CI0EjFHKXJg3uLBWvl44tXS4VraScZ7rUl
         s2TeYz+PgX7KN2sA5e+ExnRSvfWP4T+F0QWnEZ6UlNXbH7KkDIAJMZo8QloU0L0Vxu27
         ikkUhklFMm1NpRYVkxwBTYs5Rrsij6RW2w3Om88m6GE3c5UoeIGUVsDI78IVMndv7jFM
         DLXhoZJEy98nF3beCoRQGxNmLarMYDTjJbfphu86F6tJtDxpSnAS78XFY8n3jKMML//2
         9QKsgVQkeQWCXKqW4eBfg2b1k0hwXUcKOILZCfGoDS4ucrwAytGu85BoB+OLWQcI1y0m
         Qiig==
X-Forwarded-Encrypted: i=1; AJvYcCWrw5QFCKiScRokiYjv+E8Wcns+8YXgNRS/Am6t0eI4xBicS/UsqjgpECMY5NwCH5XTRgDzWdM1dhJ4FoLSAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLPNBdhdPMBt8pIUlgJN82wL4PL/6iLXHkJM1MWrzEsPoWV8d9
	HIk8MyeqXfsOmn/Hwkat4e7kQsaDQCh65r7JPK/tXGOw/ynzDn7IpMBy6oGokAnRtvwyJ+E7rGg
	ka0ZBYFxt9JDVfbcIhT1YYPjjwnyBvvtk5nUWc+Ubpw==
X-Gm-Gg: AY/fxX6NDeemg2QFH2N8Oza93HYAQHKvctcMyvUVL4cSpwltZN0vfcf/jbODu2bttEb
	9z64Tv+Wxz+Hm4/y7Cks3RwsEHf/iAeTcklCcnLyiO432sejENFnROICgfehZvC0UcYSj0Vp/Tj
	30STFBnJtwjBYQncJvnSm5Ore88J9vT8y3kKwY9gF5GnuoeyE2D+Y4YO6S9qcmPd/ZLIS+MoYBq
	x5O9vsCQ5ldvcov7u5SClmC02Ae7RD6ik7lITbrPlScKqQ7BC+KcF8KSQg9AdoAgXkgazMw
X-Google-Smtp-Source: AGHT+IEDvxO44/POz7bnaB+zrKXCNOOS/WPSTW3GIVXm1upC0YATz2kq4R7kn6XsCe0YNeacKDOWMUqKTxb574ExUiM=
X-Received: by 2002:a05:690e:2514:20b0:63b:8e09:7a47 with SMTP id
 956f58d0204a3-6446e97b295mr4684556d50.19.1765473200251; Thu, 11 Dec 2025
 09:13:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205-v5_user_cfi_series-v25-0-1a07c0127361@rivosinc.com>
 <20251205-v5_user_cfi_series-v25-6-1a07c0127361@rivosinc.com> <b2acb9ca-1320-ab42-3937-2ea17153fac2@kernel.org>
In-Reply-To: <b2acb9ca-1320-ab42-3937-2ea17153fac2@kernel.org>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 11 Dec 2025 09:13:01 -0800
X-Gm-Features: AQt7F2rXBhYBRubaxsEthZTktAJEjMnbT8BXdFrJ84aaWwsz26es8ubAplXa-kc
Message-ID: <CAKC1njTfn-5ZeAV7x5819kXUqitVgO0HkKQi1S6UvZyiuroxvg@mail.gmail.com>
Subject: Re: [PATCH v25 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
To: Paul Walmsley <pjw@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org, Zong Li <zong.li@sifive.com>, 
	Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
	Valentin Haudiquet <valentin.haudiquet@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 12:47=E2=80=AFAM Paul Walmsley <pjw@kernel.org> wro=
te:
>
> On Fri, 5 Dec 2025, Deepak Gupta via B4 Relay wrote:
>
> > From: Deepak Gupta <debug@rivosinc.com>
> >
> > `arch_calc_vm_prot_bits` is implemented on risc-v to return VM_READ |
> > VM_WRITE if PROT_WRITE is specified. Similarly `riscv_sys_mmap` is
> > updated to convert all incoming PROT_WRITE to (PROT_WRITE | PROT_READ).
> > This is to make sure that any existing apps using PROT_WRITE still work=
.
> >
> > Earlier `protection_map[VM_WRITE]` used to pick read-write PTE encoding=
s.
> > Now `protection_map[VM_WRITE]` will always pick PAGE_SHADOWSTACK PTE
> > encodings for shadow stack. Above changes ensure that existing apps
> > continue to work because underneath kernel will be picking
> > `protection_map[VM_WRITE|VM_READ]` PTE encodings.
> >
> > Reviewed-by: Zong Li <zong.li@sifive.com>
> > Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> This Signed-off-by: doesn't look right.  It doesn't look like Arnd
> developed this patch, and it doesn't appear that he replied with a
> Signed-off-by: to the list regarding a patch that you wrote.  Did I miss
> it?  Did you mean Co-developed-by: or some other tag?
>

Seems like b4 messed it up. I'll fix it up.
