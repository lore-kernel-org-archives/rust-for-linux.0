Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5547928466A
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Sep 2025 20:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758917035; cv=none; b=te3+hZM7m+CKbr0UG9aBwgsn5PG7PM1FgwUYm2h4Rr9cwYHgu3mJ5V6BCsR65DEJvXyu03r9JLoxHYyrmYdt/qciyupy5XtxYhDBTmkOWRlW2ZygmZ9Yc6MtbkaHUrNlIXgNZ2jRBXrug7cNFLUze6UQGn5Jy3G89/CJoxyjyAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758917035; c=relaxed/simple;
	bh=R2O66mhq7TFy9y4WbsUYB5mx2K9cq8FM/Hgd8b3di8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlt80tfuqRjsfdXiw1j9rHz3R1VannBd793VMD6Hs5oWxvmIQCcA6WisJown6joiB3PglVUuQKqXQksWGqt5psKeZQvj+hY0l1DuwUf7IV+ULTZEV8I6NNaiw7H2cZzp1Ayv2e0Npipm3o04hnjA80yDs5F8uCpC6BqLz2oVFpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=DRTJGQT3; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="DRTJGQT3"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2570bf6058aso37221265ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Sep 2025 13:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1758917033; x=1759521833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2JzK9TdtNq0q6HuoPTI7S0mcgrs1VMBW3yQfWD8QK0g=;
        b=DRTJGQT3fCqMgMI15Iv7O/OrLuoGqEODTM4hchVQ9jElmaFWa69KYMCKDnFMqozKRI
         yMiBno4HhYaV7kRj5jIDkRZFvK9BR/3eVXMjZf2Qr6kdsgqq7RkBU4RrNycBZ89cYSbw
         Kfw0MxlfnWWAXHOV8eEvDh8PJCen6U5b8BSHhJTjfAps1HyBo8J08i2GLf//rKuEcbk6
         1I7hbNSGCsfWZ/wZ4rwHou84rUHxmWBYVV1zj63qaUNkP8MMnJJtQH96efF3hcHM0kQt
         X29fgK/Tqr+7kNhUBhEROUSOlmAkBr1WsBGWEaqEwZWr2muYWPvQgRCQ+pyBvaYvmt4g
         AHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758917033; x=1759521833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JzK9TdtNq0q6HuoPTI7S0mcgrs1VMBW3yQfWD8QK0g=;
        b=XoAowoL76o6aIhVFw93pSdovFICE+TZE4gZ6oSxdlDhA3ruPkTL/pAjBixoSHD2aOW
         L+dRtp8pWlRrEmWO/tQNPVsvm+oyUiWllFC1KCuvYfgvAvb/W1fDTpk0e66ZqrdspVwQ
         Tbas5rM6TcwAFJTNS48PhUloeeK/sLYPjdF+hf0NPsQRsdyKSCPMD+YMeRY4NEcFMT7b
         DrgYqjTfcQOaqINLOFfqtA47gWlDOVNiqhxwAY5ATaEupLOAmfo8JxZXTuLqKdn3Xc4+
         xNVkIXWVartMY2QDjOZDyf7MYr2yqDoCXPomxkFw/7H89Ry+sKyxzbm3a/6zgoy2m/EY
         wO9g==
X-Forwarded-Encrypted: i=1; AJvYcCX4Vh2pU05OCUXPoSVZtjT8iYfQC1IYY3wAs+Ui8z3RaW9PgL1I6oNRpLlMx6u6sb4zh+cN4oB4YJ2eaTTfEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkfzRbRIOJKMQ7Hws10lyS93lZaCtfOEKLQ9adtR0uUwQYByn7
	gVuaaIE9Y79Py/Cvyv4bRGr/x2O69aMcMxiUsw9ukjME8masYegDi2067qhcMNFCgQU=
X-Gm-Gg: ASbGncv2/QF8vuU8FdBziRMP8lqbF1THke1Bz5fSIPHCt9i7ml1XTw4TH6EvrbDMusx
	qOVMhw3S4thh4hozcnJYkwsVU5bu8MorhXRb/+DznZrPwyH1Y+F0+tjJUKSI/CndCALjmHzXbLH
	+vpYnHStUqPW+V/wkBhkfJgajKLYnvmyRiA0CMzeaczag1KFctdNIZpgLWOGXC9T4gAJymMYnbL
	d6IpFVSTdc5Gj4VjZqKVrvl7YmQ9kajafcnJSAd4Nf5pzEUXY+rALnV49LiFJ6I+osv6uVV4GN+
	EOiM3LKSj/ZOO+y81ZQ9PqgGDj9SJsrz8wwLaCIDnENhkxvWdpKsF1lIO6vIKGe3oc2g4OJVn+J
	0q2bGxftY9HS021qIMRrIyALIVmWU5yoI
X-Google-Smtp-Source: AGHT+IEqlWQwd3Eq3xfSDG4ZoiAYivk9596CJNNVWWuT8jIb87TOCzT2mxQOQP9H5ZgZVw/+ZQZZqA==
X-Received: by 2002:a17:902:d052:b0:27d:69de:edd3 with SMTP id d9443c01a7336-27ed49d2c63mr75874405ad.20.1758917033572;
        Fri, 26 Sep 2025 13:03:53 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69b0685sm61092355ad.116.2025.09.26.13.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 13:03:52 -0700 (PDT)
Date: Fri, 26 Sep 2025 13:03:49 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: Liam.Howlett@oracle.com, a.hindborg@kernel.org,
	akpm@linux-foundation.org, alex.gaynor@gmail.com,
	alexghiti@rivosinc.com, aliceryhl@google.com,
	alistair.francis@wdc.com, andybnac@gmail.com, aou@eecs.berkeley.edu,
	arnd@arndb.de, atishp@rivosinc.com, bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com, bp@alien8.de, brauner@kernel.org,
	broonie@kernel.org, charlie@rivosinc.com, cleger@rivosinc.com,
	conor+dt@kernel.org, conor@kernel.org, corbet@lwn.net,
	dave.hansen@linux.intel.com, david@redhat.com,
	devicetree@vger.kernel.org, ebiederm@xmission.com,
	evan@rivosinc.com, gary@garyguo.net, hpa@zytor.com,
	jannh@google.com, jim.shu@sifive.com, kees@kernel.org,
	kito.cheng@sifive.com, krzk+dt@kernel.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
	lossin@kernel.org, mingo@redhat.com, ojeda@kernel.org,
	oleg@redhat.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
	peterz@infradead.org, pjw@kernel.org, richard.henderson@linaro.org,
	rick.p.edgecombe@intel.com, robh@kernel.org,
	rust-for-linux@vger.kernel.org, samitolvanen@google.com,
	shuah@kernel.org, tglx@linutronix.de, tmgross@umich.edu,
	vbabka@suse.cz, x86@kernel.org, zong.li@sifive.com
Subject: Re: [PATCH v19 00/27] riscv control-flow integrity for usermode
Message-ID: <aNbxpVddsTXL7F6T@debug.ba.rivosinc.com>
References: <20250926192919.349578-1-cmirabil@redhat.com>
 <20250926195224.351862-1-cmirabil@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250926195224.351862-1-cmirabil@redhat.com>

On Fri, Sep 26, 2025 at 03:52:24PM -0400, Charles Mirabile wrote:
>Hi -
>
>Sorry for my previous email, I realized I was mistaken...
>
>On Fri, Sep 26, 2025 at 03:29:19PM -0400, Charles Mirabile wrote:
>> Hi -
>>
>> Hoping that I got everything right with git-send-email so that this is
>> delivered alright...
>>
>> Wanted to jump in to head off a potential talking past one another /
>> miscommunication situation I see here.
>>
>> On Wed, Sep 24, 2025 at 08:36:11AM -0600, Paul Walmsley wrote:
>> > Hi,
>> >
>> > On Thu, 31 Jul 2025, Deepak Gupta wrote:
>> >
>> > [ ... ]
>> >
>> > > vDSO related Opens (in the flux)
>> > > =================================
>> > >
>> > > I am listing these opens for laying out plan and what to expect in future
>> > > patch sets. And of course for the sake of discussion.
>> > >
>> >
>> > [ ... ]
>> >
>> > > How many vDSOs
>> > > ---------------
>> > > Shadow stack instructions are carved out of zimop (may be operations) and if CPU
>> > > doesn't implement zimop, they're illegal instructions. Kernel could be running on
>> > > a CPU which may or may not implement zimop. And thus kernel will have to carry 2
>> > > different vDSOs and expose the appropriate one depending on whether CPU implements
>> > > zimop or not.
>> >
>> > If we merge this series without this, then when CFI is enabled in the
>> > Kconfig, we'll wind up with a non-portable kernel that won't run on older
>> > hardware.  We go to great lengths to enable kernel binary portability
>> > across the presence or absence of other RISC-V extensions, and I think
>> > these CFI extensions should be no different.
>>
>> That is not true, this series does not contain the VDSO changes so it can
>> be merged as is.
>
>Oops... no sorry, it looks like it does. See 19/27. I was misled by the
>cover letter which said to pick that patch separately. I completely agree
>that that needs to not be included if this is to be merged.

Yes I sent another email.

>
>>
>> >
>> > So before considering this for merging, I'd like to see at least an
>> > attempt to implement the dual-vDSO approach (or something equivalent)
>> > where the same kernel binary with CFI enabled can run on both pre-Zimop
>> > and post-Zimop hardware, with the existing userspaces that are common
>> > today.
>>
>> I agree that when the VDSO patches are submitted for inclusion they should
>> be written in a way that avoids limiting the entire kernel to either
>> pre-Zimop or post-Zimop hardware based on the config, but I think it
>> should be quite possible to perform e.g. runtime patching of the VDSO
>> to replace the Zimop instructions with nops if the config is enabled but
>> the hardware does not support Zimop.
>>
>> However, that concern should not hold up this patch series. Raise it again
>> when the VDSO patches are posted.
>
>@Deepak, would it be possible to just resend this without the VDSO patch?

No we can't do that because if cfi is opted yes and user enables it then an
indirect jump to vDSO function will result in a trap to supervisor and then
SIGSEGV.

We can compile vDSO without shadow stack option. That leaves vDSO as the only
object in address space of program open to code re-use gadgets because return
path is not protected with shadow stack (thus dilutes security properties)

>
>Or to rework as I had alluded to to check for the presense of the extension
>and remove the instructions from the VDSO at boot if it is not found?

I have responded to your earlier e-mail on this. TLDR is

If kernel is required to carry two different libraries with a need of patching
it in runtime, while rest of the userspace can't be  patched in runtime. Is it
worth the complexity to enforce on kernel? Because we then will be doing this
for every future extension which takes encodings form zimop space while rest
of the userspace really can't do that.


>
>>
>> >
>> > thanks Deepak,
>> >
>> > - Paul
>>
>> Best - Charlie
>>
>
>Best - Charlie
>
