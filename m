Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3324F1E7C0E
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 19:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314222; cv=none; b=C5AVmwF8sywpUfzwb94toXig5hNoffkEkeBHjFV1FA7pqcIZKHmveiex1AXxrfVk0NiBnsuyoU9LdRaPNezAXvRUkojOm9NRQd/0uH5WLzdR0WKzsSl7BkBg3d9ca6CkvEpptP7WiS2qaS31VaenW4Cks7bICz89y4An2YBI28Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314222; c=relaxed/simple;
	bh=mNAX33oXLE17IXsgRf2ZBqnaUHbAcZtO3oJiLgtufRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ww79lK/KjDCCfuS6C1NDH0yCEGN1TA5u0Rg+qCuT02VIcevkBWb3rgZTl5hwjYb9mPKxqS05mMEYDg+Pd8w9XGPeVMu5dlEAz51M7S4mFx3ZaIKssbyebHeAK4wzfDXL5dViwxh6w7hepHizeHoEgGTCuGw8+SVJ5tT/ppbn5Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=psVvYNxz; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="psVvYNxz"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2264c9d0295so41445ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 12:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744314220; x=1744919020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ED7Dxab6qGrw40q2OBGqgpglrY35NRELKm5U/HmEFYc=;
        b=psVvYNxzBXXxUqn9Nly4jkBAjnBURIfhgxYcl9gUZ9anVWHCaSPIKh7aOqeLPclSVT
         umbaBb3W4mMSMGLTRPLiVErWzOV2ccBielK3ghn18fipFk+0pE2cRKDs+cUHxCTY5Dad
         IBkyM0kwWxTJM1Iko5UVNM+0K4C7hA97HgDW93quDpmcUQSsfb6mG6YTeOQXlJdzigwM
         SYtuDRWmEdv8qKWUZ7xyBgyYHpSzTyuzmK31MJJBI8ySuBsHebDNbQii+pl4k6bb9Ug3
         /LDfhAAyrRNzd2pEupfoZZp9F0sSxnjgmqgPX58BMukHHRWmBvM84wNFX9RpIqye46qy
         R8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744314220; x=1744919020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ED7Dxab6qGrw40q2OBGqgpglrY35NRELKm5U/HmEFYc=;
        b=SM4HfqpILiJHpE2hhRHmJwq3hlNJFdR9T3Utt3yC2KwVqvJxsAQtqhJcCucoqxCzfo
         F5TQ7I2+L2QD50Utxi0SsDOkBkeqIRMjbK7f4R7WcpwciPAo1piHqZHatdncKZ3RSZo9
         eHD0UhLPpYVst06q70AJLdh65wGg8DV6/h5LB/gWCV+Foc/2lyHfQpyabAonE031P2x1
         /WbCcui+ON3VKA6HOQUptBDcFsNi8Xsekwn8L/m6tECNIO7PccCdnvVghRh2ehCKtIQv
         gIx6HeRQed5aJr6xtSx+bxCO5GFyhC5tL90ehBYtfTv+WMbhQ9S+hF7+IUrXd3J7mqBt
         tOqg==
X-Forwarded-Encrypted: i=1; AJvYcCX1gMHsYnGyQsfudxIeIdT6SmhyyANoTHKlKcS1dLn8pX1LbHgJWh8AjHuJDbBKA7Ge/znh+eWat5seBFwJXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx49ACymjgYK+77jIxsiYTab+V5AghjG1N/dHyLipRLP8ml4DuS
	GRXu+hbREMtWYCMO6g5P85K3rGUyif930NM+ckIk01NHRgg3oq04zz8TyEbTwQ==
X-Gm-Gg: ASbGncsqdupohnuhu6tOVbxXY2jh+OVQmcm/09ia3heVmtYkBCQLCWj9qjmtu13hmLu
	mDbSL0iIlP2Npz5A3bKXP3L2bfN3WUHGlAPVQIMktuHYW6lciHrbhI90IpmGD464h1LQRMnLU9C
	3Ylm4GbZi5l1FcSpgSlQBpUKVqmcLKPdWX5hRd5LXHI1jT45uIMtcqTnVFC5mFPKvgtP98nnj9k
	g1p6i7e7yywFctpXsPzzagPZ6hyTLm3Mpc7/GJs5RYPMYdyaTS6EkffeCuoNNqywFZ/ZeMIZYgo
	IfxrZLxFr0JeQV/DodTVjfYRfC/6prOUJgbQzA52htM5dFMKyy+GXVlNyxhCKtMC6FxR0M/s11w
	vNXjfSKn8
X-Google-Smtp-Source: AGHT+IGu2dtDm1AMq/3WnkzaLXFSXm4uaGVeeMEHiTWo7rWwRyUUdX5IpaYykOLqEwbtJBQit7pyAw==
X-Received: by 2002:a17:903:908:b0:21f:3f5c:d24c with SMTP id d9443c01a7336-22be982230bmr804405ad.0.1744314219997;
        Thu, 10 Apr 2025 12:43:39 -0700 (PDT)
Received: from google.com (242.67.247.35.bc.googleusercontent.com. [35.247.67.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd10dc4bsm4115509a91.1.2025.04.10.12.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 12:43:39 -0700 (PDT)
Date: Thu, 10 Apr 2025 19:43:34 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] objtool: Detect __nocfi calls
Message-ID: <20250410194334.GA3248459@google.com>
References: <20250410115420.366349-1-panikiel@google.com>
 <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <CAM5zL5okN67bsTs6ZodcJd45zQ_BP+ruUwOkPMY97Snma0ugzQ@mail.gmail.com>
 <20250410132522.GD9833@noisy.programming.kicks-ass.net>
 <20250410154556.GB9003@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410154556.GB9003@noisy.programming.kicks-ass.net>

Hi Peter,

On Thu, Apr 10, 2025 at 05:45:56PM +0200, Peter Zijlstra wrote:
> On Thu, Apr 10, 2025 at 03:25:22PM +0200, Peter Zijlstra wrote:
> 
> > I should get objtool to warn about those. They undermine the point of
> > CFI.
> 
> ---
> Subject: objtool: Detect __nocfi calls
> 
> Detect and WARN about no_sanitize(kcfi) indirect calls.
> 
> Apparently there were a few in some Rust 'core' that got included in the
> kernel and things went *bang*.
> 
> This is not a supported form for kernel code. So detect and warn about
> it.

Cool, this looks useful!

> Adds an annotation for the two cases where we have to live with them:
> 
>  - EFI stubs;
>  - kexec handover.
> 
> Notably, EFI calls fully disable IBT, as such using runtime EFI services
> is a significant security issue. If you can exploit the kexec handover,
> you get to keep it.

OK, with this applied I now see a warning about the __nocfi call in
Rust code:

vmlinux.o: warning: objtool: _RNvNtCsjWi3sh0wSlE_4core3fmt5write+0x170: no-cfi indirect call!

But an allmodconfig build reveals a few more warnings:

arch/x86/kvm/kvm.o: warning: objtool: x86_emulate_insn+0xaf7: no-cfi indirect call!
arch/x86/kvm/kvm.o: warning: objtool: em_das+0x290: no-cfi indirect call!
arch/x86/kvm/kvm.o: warning: objtool: em_imul_3op+0x15f: no-cfi indirect call!
arch/x86/kvm/kvm.o: warning: objtool: em_aam+0x21c: no-cfi indirect call!
arch/x86/kvm/kvm.o: warning: objtool: em_aad+0x1dc: no-cfi indirect call!
arch/x86/kvm/kvm.o: warning: objtool: em_loop+0x312: no-cfi indirect call!
arch/x86/kvm/kvm.o: warning: objtool: em_cmpxchg+0x329: no-cfi indirect call!
arch/x86/kvm/kvm.o: warning: objtool: em_bsf_c+0x1b7: no-cfi indirect call!
arch/x86/kvm/kvm.o: warning: objtool: em_bsr_c+0x1b7: no-cfi indirect call!
arch/x86/kvm/kvm-intel.o: warning: objtool: vmx_do_interrupt_irqoff+0xe: no-cfi indirect call!
drivers/misc/lkdtm/lkdtm.o: warning: objtool: execute_location+0x5a: no-cfi indirect call!
drivers/pci/controller/pci-hyperv.o: warning: objtool: hv_do_hypercall+0x150: no-cfi indirect call!
drivers/hv/hv_balloon.o: warning: objtool: hv_free_page_report+0x5da: no-cfi indirect call!
drivers/hv/hv_vmbus.o: warning: objtool: hv_post_message+0x457: no-cfi indirect call!
drivers/hv/hv_vmbus.o: warning: objtool: vmbus_set_event+0x2a2: no-cfi indirect call!
vmlinux.o: warning: objtool: hyperv_flush_tlb_multi+0xe96: no-cfi indirect call!
vmlinux.o: warning: objtool: hv_do_hypercall+0x12b: no-cfi indirect call!
vmlinux.o: warning: objtool: hyperv_flush_guest_mapping+0x2e3: no-cfi indirect call!
vmlinux.o: warning: objtool: hyperv_flush_guest_mapping_range+0x36a: no-cfi indirect call!
vmlinux.o: warning: objtool: hv_do_hypercall+0x150: no-cfi indirect call!
vmlinux.o: warning: objtool: hv_snp_boot_ap+0xb08: no-cfi indirect call!
vmlinux.o: warning: objtool: hv_vtom_set_host_visibility+0x54a: no-cfi indirect call!
vmlinux.o: warning: objtool: __send_ipi_one+0x362: no-cfi indirect call!
vmlinux.o: warning: objtool: __send_ipi_mask_ex+0x655: no-cfi indirect call!
vmlinux.o: warning: objtool: __send_ipi_mask+0x635: no-cfi indirect call!
vmlinux.o: warning: objtool: hv_do_hypercall+0x150: no-cfi indirect call!
vmlinux.o: warning: objtool: hv_query_ext_cap+0x175: no-cfi indirect call!
vmlinux.o: warning: objtool: get_vtl+0x38c: no-cfi indirect call!
vmlinux.o: warning: objtool: hv_get_partition_id+0x224: no-cfi indirect call!

Sami
