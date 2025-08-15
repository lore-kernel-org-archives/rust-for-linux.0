Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A11E21CC44
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Aug 2025 15:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755270354; cv=none; b=IzU+0fPoeOKFKLx8RTvi2OAue1mhHgIjUHeHeVq1Lfy7O1TvMKMscgagyig4/FAuKHbgJyNqjVF8BgdaoqlaexB4BXl+CSnPDVZqn5JSOSyRFKtUO4UxPpkK+Qj+nWVwrS4DAsP0pLsBBRXP0E1n+Np+9slx142kkP4R+gs54Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755270354; c=relaxed/simple;
	bh=wNfhEAk3rnqID1OBHwaELciuLi86NZwkA7swq1t5JdI=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=rASAgkGpYOj0ADowST9EiSTsfR9p8um8MlOG3j7LN7PQ8lm0RO+8SCSmWYVN0Up2z07Y7NUvXyN3RX+bwaI9a5o6bWYnSGSEl28phL9illhlD+lxNLxM6KNUuuEeQbAIWWS/ZZlie8+Rwj9oZ1SaSmBH5qtux5ii0p5KWM5G2+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=mZKauASq; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="mZKauASq"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b4717543ed9so1341357a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 15 Aug 2025 08:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1755270350; x=1755875150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38zqqxNHqbGz3C68JOy9Ugb8wAb711DWGVbxjNinx0U=;
        b=mZKauASq6wZkezrwzg5EsqpZPzKSyUiLiawcT9BlsvW3YiILWWbdCLQfpTP13qY6fB
         oZwx20nglnVNrDmmPfk4aePlJDu2TAg1mBu6EglTB/5H97T2cGuSu4PxV7HImr8TrepE
         68t/id3y3tOVHNYVxVkwTaIc14VHd7H1o9mUsS4bzQlMJR/z7XxZmVnGsRHSebQYgnEV
         rSZiKzLN5z5qnW2SjxlNV1Brx5GmqFnBIIZxMHmU2kyWh2/WybeT81JLEcA4kHv1QC8W
         CS8Wu00IF1ktWN/Ff/zHUzMA0yvpQqSCuCbC8nUpYkKRabnJW3fuJQ0QupC66XAb6JiG
         WqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755270350; x=1755875150;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38zqqxNHqbGz3C68JOy9Ugb8wAb711DWGVbxjNinx0U=;
        b=m/BxYeHjunjXAodd7Jioz/iS9plPoWmkKExroWa0UwlkNbPiESwDdBxIEV1VOCIzU/
         6jrHYL3gZQaS5K19eumfc39sSHge8U5dXIL+jDzo+NePom5o/StwTgUySFcMzCAhdpVN
         GSWTvBYqgmEjYoeO3JC8jAYP39PZN8D0Ucitjv7JuFOTrKs+TAJlS8dvU3sF02RqdkfT
         cRDLkyl7Ko0Na7PNHDPA5LA5pl4x245ampxEwm5pK4iRVn1hcrJKmE3FZOPWQUmYhbaW
         mAQscPc1bpnj4d6WIRbPh/caVboZxP74DOk4ep+zVOtv9bUYsanrGtnMlhrLjSE0TxKU
         rblA==
X-Forwarded-Encrypted: i=1; AJvYcCUb0C0DtBHZWdlPMoa3tDmCHisxQa1E9qtDyWmWsmvJocwBm3QvYMrv9Xgvrd3o8/IEInfh2Y+FcSogThj+Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqXIcSdGPS6gAJqUvqWHxZBiQaMqGRYDMYd1YSdYqXu6XGO3/e
	SpSqP74cA8pGVZ+PQWdDX78qfwvlrdQW5ipkNFDn6NoZJIROevhvuXTjRjTa2to91oY=
X-Gm-Gg: ASbGncsr/z13K3Hdug9h9cVg1s//XG+eIjT+KpqwTpiGhl6LqlbGMizoF5aXQGFhakq
	4TWR15q9q0bAK2HFc4TsDXjLOErIT2WtZbLlyzd3EHghc9K5r39o23KND1+6F+6mk5vO+cIt3JW
	kNL1bSDoHc/EGMCU/UB/9dpwKGRjCDkczX1gcs9r4CpJvJ/R+TiFiY6pBZcD0vto8ucjP7XQXJr
	D65Rek6C8A62dm7yMs00EYCa5GQ+76GmEGcmBSvuByPt9+N009ugUqLKmUfycTyiuIp9/2pbEaM
	YoK9o3Gy1b5mzh/8bQquzz/8vc+UZ+5jiZbQlBFsrRG+TEAQHMDPkCQIU/GWui95xUMSpeLNHyL
	cd+KMQyQycASlAFk7MASnGtazH2NOjSkHg30=
X-Google-Smtp-Source: AGHT+IG3gBMogdOr+spUGY65daTLUVfmz5lhgO/opdXo6UimhkccgL0C2Gx+F8DUbrOBq4AI/2z6Vg==
X-Received: by 2002:a17:903:198c:b0:240:a222:230c with SMTP id d9443c01a7336-2446d5af743mr41307075ad.12.1755270349908;
        Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2446cadf96fsm16286885ad.41.2025.08.15.08.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Aug 2025 08:05:47 PDT (-0700)
Subject:     Re: [PATCH v4 06/24] riscv: elf: Move relocation constants to UAPI
In-Reply-To: <20250812-vdso-absolute-reloc-v4-6-61a8b615e5ec@linutronix.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
  justinstitt@google.com, luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
  kees@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
  hpa@zytor.com, richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
  linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
  maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
  chenhuacai@kernel.org, kernel@xen0n.name, hca@linux.ibm.com, gor@linux.ibm.com,
  agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, tsbogend@alpha.franken.de,
  ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
  bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
  tmgross@umich.edu, dakr@kernel.org, nicolas.schier@linux.dev, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
  linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org,
  linux-kbuild@vger.kernel.org, jstancek@redhat.com, acme@redhat.com, alexghiti@rivosinc.com,
  thomas.weissschuh@linutronix.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: thomas.weissschuh@linutronix.de
Message-ID: <mhng-5B6E084E-60EE-440E-BFF9-5E81AAC9A473@Palmers-Mini.rwc.dabbelt.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 11 Aug 2025 22:44:19 PDT (-0700), thomas.weissschuh@linutronix.de wrote:
> These constants are useful for cross-platform userspace, for example to
> process ELF files during kernel cross-compilation.
>
> Move them from the kernel-private architecture-specific header to the UAPI.
>
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/riscv/include/uapi/asm/elf.h | 66 ---------------------------------------
>  include/uapi/linux/elf-r.h        | 66 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+), 66 deletions(-)

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

I'm going to assume you want to take these all together though some 
other tree, thanks!
