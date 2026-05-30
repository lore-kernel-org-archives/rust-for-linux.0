Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A0526B764
	for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 19:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780170046; cv=pass; b=NV9NUtlxeCGw2Xb5KJhWourQloGKFRzkNX17+BLr69iVNMezCmSHFZTx13JB4p+MFgF0sFFh9Ve7qeIrs1wHJN0jY74oRpG35a9dAGZTukY7CIWHsV6PCQyHRiUiHPv88T7EkLguIjCVTkbHwDdatkz9xnC+FrgcsJg5kOZHMTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780170046; c=relaxed/simple;
	bh=cIra25/7V0IbwrRRmDW+gsrIYwnkI1A+HRB1U6+DiGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEFa4vjQWJrGUIr3jDsnUN9QhMqg3bycbFIa7Fk37Ao8YMsb0caAhoHBbKUyirU5SIYuZK+f8wj7u+cCBcKfAMReAHAUayBUAAh7m17ue0XteNCwkOkGtfT4ymb5Gc5yx1C4gn52fN60EPjnn7UNBYe/RNxzr98w9co1mKOxFEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=MY6DdfAL; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="MY6DdfAL"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7dca5a81be2so29057497b3.2
        for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 12:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780170045; cv=none;
        d=google.com; s=arc-20240605;
        b=OOuzZeCriaVJN/Ud39mjDgICgQAf+OBNzXUr+ET460u8ONltqy75gRzGOolzspcVnv
         UMcRJFgq+IwyuIchRUbbtru8rXsDowHmE05OBefQBuSvvKBqLFQkx/MwO9v02Wg5iIme
         pCPA4gzFQEiNZVtY7TKf5nzi0Xt3dY/lGv1fdWLHAbV1f33utYM/5ksrxGcEC8rjs7P/
         0cmOw8zDypnUJRzoBUHiB3nQljajb2KEfiyN1DRlHq4n3KkfQW/BuirhT7LgUVT650C2
         1Nu/hhPHkxQzAEOVu1uGCP6tNvHj9U+MynnWk8PjBiAKhN4HCzGSEvZvQxU+8kuMzPvK
         3RnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZhMPXpo5C9bO9KiY6ITYmWYOylh8Rc870xEi824FVCY=;
        fh=bN2f5e7Egn0BbNX2O7LYO++S1s82n2Dvanj0FwSaEMQ=;
        b=CGxG8H24/jNjp34ABLg2MN7eJRAtNb4w2vGBC6nHe3dgHCUZVseyjNfihAEsLUUq4V
         7l8T+Mxtnwni0pN0UW/nbgGRb7tdb4nQ9uHxHVy2kendErRBAJTpIKD0169xb1r92PDy
         1fFcOvpZS36G6lo4219RzBeMwVgsEdRY4VzIFo6Xm5Su84YBIDC0revAXtAcfSQIWk0v
         M4KS3by+8gCcBS59HJ1cpMT96zQG4cXjDJXyWoTFjEoarBSUHe/ph1ru6q1toSggQxux
         xPvYPgskwdhLHM0VI1+149jOtG+STQitjN1OgkpsLB0tqHXoDeHGIaVGqDmOGDo7f3t5
         TXmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1780170045; x=1780774845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhMPXpo5C9bO9KiY6ITYmWYOylh8Rc870xEi824FVCY=;
        b=MY6DdfALfU2jE5XLhMv850ewVAbg2AmF3OlwgDROnQb8CBjUKLuT9j/n2VnQ1OaHEH
         Fj1l8ZMwvmY4tMJXPfKAURVwRyrsKNGa5283gCuH8ezfn6U8pEK2kPcFD/K0WlrUaVXq
         S1fi5+HpURX51EOa10v4vWvD+ORNKj741qku/aslBKkRr5XeTXfUDpYQRk/zhjYrCj15
         R4uj1z6YRwSNUKm9YtnMBEcQV37eY/nm1e2Z/gnZHEgeOBbjIaveXR5n4e4AArW141Fp
         9H9ECvGeM9Z0mvi8AuibXvo46pvYOecKgCtkqN3zC4DdGwiValuykAC5Xzm4H7wB3nVo
         cHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780170045; x=1780774845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZhMPXpo5C9bO9KiY6ITYmWYOylh8Rc870xEi824FVCY=;
        b=NJHfmnBleWKoBMxUgtqWOpjQ7RyHbCFf9aEQdsSNMcuqumEjQIJBZXYBU9Y0q4Th8u
         fOMbisEkrgaIhr6bKFo/fpiMt0ijWIMg1X5x2vMa+l5sf2uqvgRPV/0i1rs5xqZKXll6
         WBm/+P+ZRjo2leKgQkK79DKXbYOnlADnFipY+neCE60F6NcszfPgKVjC8CWkXjUsbps+
         6hgghKkODQz2WrXOebKil79hW6+0qwgGy/77eYl7dhrHQ99D+DlfUm4QAMsKII5o1nFA
         WwbCZBo149QLb6J4FVQW3XqwPpV5Phl9lYexqLKP8UiUIJ5w7qLZJkCaLOohizCbqMhO
         oQPA==
X-Forwarded-Encrypted: i=1; AFNElJ82+A33SuLUbvJ1dy9c+oSqRjcXsFq1laaa6YaMY07vRiS36gxbhBuomq98eGN8bAB0qCY7t/n0levz4la2NQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy93BOAfxbvM1UYXfa1Eot6jYt+epA3C7iPqwebHo57Kx4ROSV
	2LKLWgBMhER4JmMmklupr5fsuVQroMobreZEQSk4HRNoxDNaN+GEA/IM31QPMetNV5StBdgKSyl
	rKgkAiO0bLGCGvRu3NDFEVPYaikbiq293TbFKstayKA==
X-Gm-Gg: Acq92OG2nIjb/hqHwk1YjRf9gP8es7xIrzrahLe5gDlEsfSiMafETX6STjTeNGNSxRy
	HUt7VdQTf8tqJvTUb1vrGjSngprNK4jeVRPGCj6WnuRdnhzfxyOGXcFArWeu3fNFjh5S4l4GMyO
	Sx5M+NdyDH+mcS8nyiiCZQznW6lkKaoYgrPtPaTSt5pumt4LUHP2Z28mpRvEfTnsgYBKc3angyg
	PnE2oBw77uzjdkKaqY7O8fBtY7pWK1SUfSTyYD044UqSmG8pA6BRGNh/1bh1fT72kDCDvJASL7k
	SLMQFvqMJhFieray6GL+kt0ztoo6YryQMqaXa1Me39fpIRLf5Ko=
X-Received: by 2002:a05:690c:f04:b0:7b2:513b:34d7 with SMTP id
 00721157ae682-7e05c664b30mr45779587b3.29.1780170044578; Sat, 30 May 2026
 12:40:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
 <20251112-v5_user_cfi_series-v23-6-b55691eacf4f@rivosinc.com> <87jyslndo4.fsf@igel.home>
In-Reply-To: <87jyslndo4.fsf@igel.home>
From: Deepak Gupta <debug@rivosinc.com>
Date: Sat, 30 May 2026 12:40:33 -0700
X-Gm-Features: AVHnY4L_dtmKXZYG4oLZDjuNSTdF7bCgCYfC8yAIbkNUuu6y-j26ASIyCiMoR50
Message-ID: <CAKC1njS=AHu6uHrH4ae8VxcdEbhgiPXYCAoN3F_mnppBd3SwOA@mail.gmail.com>
Subject: Re: [PATCH v23 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Deepak Gupta via B4 Relay <devnull+debug.rivosinc.com@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
	rust-for-linux@vger.kernel.org, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 8:02=E2=80=AFAM Andreas Schwab <schwab@linux-m68k.o=
rg> wrote:
>
> On Nov 12 2025, Deepak Gupta via B4 Relay wrote:
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
>
> This breaks LTP mmap04:
>
> $ ./mmap04
> tst_test.c:2042: TINFO: LTP version: 20260529.5ccf816f
> tst_test.c:2045: TINFO: Tested kernel: 7.0.10-5-default #1 SMP PREEMPT_DY=
NAMIC Sat May 23 12:09:09 UTC 2026 (bb95589) riscv64
> tst_kconfig.c:90: TINFO: Parsing kernel config '/proc/config.gz'
> tst_kconfig.c:753: TINFO: CONFIG_FAULT_INJECTION kernel option detected w=
hich might slow the execution
> tst_test.c:1870: TINFO: Overall timeout per run is 0h 04m 00s
> mmap04.c:66: TPASS: mapping permissions in /proc matched: ---p
> mmap04.c:66: TPASS: mapping permissions in /proc matched: ---s
> mmap04.c:66: TPASS: mapping permissions in /proc matched: r--p
> mmap04.c:66: TPASS: mapping permissions in /proc matched: r--s
> mmap04.c:68: TFAIL: mapping permissions in /proc mismatched, expected: -w=
-p, found: rw-p
> mmap04.c:68: TFAIL: mapping permissions in /proc mismatched, expected: -w=
-s, found: rw-s
> mmap04.c:66: TPASS: mapping permissions in /proc matched: rw-p
> mmap04.c:66: TPASS: mapping permissions in /proc matched: rw-s
> mmap04.c:66: TPASS: mapping permissions in /proc matched: r-xp
> mmap04.c:66: TPASS: mapping permissions in /proc matched: r-xs
> mmap04.c:68: TFAIL: mapping permissions in /proc mismatched, expected: -w=
xp, found: rwxp
> mmap04.c:68: TFAIL: mapping permissions in /proc mismatched, expected: -w=
xs, found: rwxs
> mmap04.c:66: TPASS: mapping permissions in /proc matched: rwxp
> mmap04.c:66: TPASS: mapping permissions in /proc matched: rwxs

But what does a writable only mapping even mean? It can always be read.
I see two ways forward:

- It can be done in generic way where incoming PROT_WRITE means
  PROT_READ | PROT_WRITE irrespective of RISC-V. Although others
  (x86, arm, etc) would have to weigh in.

OR

- mmap04 LTP test can be updated to expect either of "rw-p" or "-w-p"
  whenever only PROT_WRITE was specified.

I think latter (updating mmap04 test) is the easier path.

>
> Summary:
> passed   10
> failed   4
> broken   0
> skipped  0
> warnings 0
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC=
1
> "And now for something completely different."
