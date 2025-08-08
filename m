Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CD925A2A5
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 08:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754641401; cv=none; b=mnEgWhAH2yELnKva6glKJ8KodFDr62+7/2SKzRffo57t5LK+DSFNqWnGkDnxvu/dxPy8YLEttVCBVZTVNeMJnx+8EMaEzWmEF50Yg0RGZ/G6P861KL62V3yZL57bg/F+VjRXk7xoZpnjoOeCB9bDU0XFWxUdBwtvx1rB96C1gCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754641401; c=relaxed/simple;
	bh=bsh/7R5V9XNvtRBgbRptJnuST96CsEj614d/3uw/SME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7JSudf0t/KeaFwpJBwaZx1xoAXjQ7B6pVnMNFL4Uz0EKcLy//FjmZzM5YTuZ1RV/fWkVc+IFlDQ8+5t97choIs0mnFezrkivvtGSGA7RiNvKaO8eUmoH2dT7Z/GHEr/JEzN/faZTXDpNKh+79ezZC8G0FMwAmRLXJXnyd5swXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=cvPx8n4T; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="cvPx8n4T"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24049d1643aso14217225ad.3
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Aug 2025 01:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754641399; x=1755246199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rqclBjlpReb8Zh2xzaAy1Tthw4Ak4Apujt4wspR+yjo=;
        b=cvPx8n4Ts3zqRUY2xG6AtHoEFC+hNzZ5gHKFw2TMNfy3bMZrzR2d8hpL+kqLbwSmYR
         WQt08ukI6iwh0c7HnzBCxequGbVbH3ag+m2JMvUnAqXZzmRxkDtRxIacrlNlCyXthOUH
         IgzoduBNZj2S3jD5DSUfLv/zUJPROXyNTcLEU5meK8kRSXnpt9FYN8vypJKpbls9GeYI
         JWhE/0YwY8hwXhJggsRr8VCuj9vpNEERGnUvxPn5WjXqo0915MLiSCeLVHUdpmlKIZV7
         vzHWIsMCoZDofevhvGraylyWzfrqJd+KwOaoQU11M1rDPanciQKQbvHVUHKgHOex1zgP
         WGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754641399; x=1755246199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqclBjlpReb8Zh2xzaAy1Tthw4Ak4Apujt4wspR+yjo=;
        b=FVCyY4yX3Y1U7uffGLOP9F//KPK87RSGGzlG1aGryhZ4Fca0YIRje+a9W0WW1dneL4
         GX2EPqVaiPAn97ToLJIWWVVBBuRR0mtuNky8bf13IJltgxmeAkl7G+mL5oAKJ5DNrz/N
         lHXG/QYiTwQAsqxvfD08y9+7/0il661gA4Afwq3b+nicztGgMMaaWnv+khVL/r0Mgls+
         9Fku3qkb2GfH2QqIIFUg7RdCO0idHQ64dMX9xw/UEcyAtKvkXagmAJv9ryO+Gh6QRZom
         YmzP3WoNlpbpbCiLc6t5PBQmbPVjaqBhtvpyemEoR9hswkUSqM8L3osDLpG1UhuTh3GI
         3yyA==
X-Forwarded-Encrypted: i=1; AJvYcCUnbS+JjdsWOC6oA1z9RlRSQdhBhiOe97Bn2icy//fhTtbK6kZ2018ooDGGNicnMMfkta5OZzzbnViep4Rjew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8XyP3iCv+mExC69UibaQthWtWRZ79sn7FHWToDJ5FjE4fNA/0
	LbeN2sPWHkCSuNI5CPOvE9nxuzlgV5IJmnznHINJvSd3HWiEDnQ4NVuaOAGEd7m//s0=
X-Gm-Gg: ASbGnctvk6BEB6cOBI7FmB0/GT3uykj7f7QWtF6aUAGbun3GSGL+06NZSa+sgA7lFI1
	GVObhstJ6Bb3gtRi0f8CDZGnr3MDVlrJMmSwoYBtYI7bG70sYlJqIPBeZeuDux9fFZaYK2k8++w
	hyHFNHtmUDjfLGjWf6z6zaGEF7xrv3FS/Rc1TS/hsPSQJCrJbFBl2rLtp64as/mGeo+AFrTTKJ7
	oLs7kWZRM+XFXnWZ9TBukMOKw7NzfOByrNfSFDnv4N/guA75aywGPV/1JE79/EAGKW2Z5iDON6p
	nOMbyrvYrC2k8Pn5zXclz6yCNgql1x/NwwlV+8Dsirepw6UThTBLj9EgoaPLgtbXZr5A301MTFU
	J90zOa5qF7p+DzrpnZN6Q45J0m/o8MMy4WYGjyttC3tI=
X-Google-Smtp-Source: AGHT+IFzkjQpJ+CBSP5FDKaUMlIyJFyzXkrgnGdlTX6xXb/Zh2Ht/mDaf4SC0H4gKEAF5ZgXVLVJMA==
X-Received: by 2002:a17:903:1207:b0:23f:f6ca:6a3 with SMTP id d9443c01a7336-242c2245139mr30852795ad.43.1754641399054;
        Fri, 08 Aug 2025 01:23:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef5934sm202807465ad.21.2025.08.08.01.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:23:18 -0700 (PDT)
Date: Fri, 8 Aug 2025 01:23:15 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: patchwork-bot+linux-riscv@kernel.org, linux-riscv@lists.infradead.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
	lorenzo.stoakes@oracle.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, conor@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, arnd@arndb.de,
	brauner@kernel.org, peterz@infradead.org, oleg@redhat.com,
	ebiederm@xmission.com, kees@kernel.org, corbet@lwn.net,
	shuah@kernel.org, jannh@google.com, conor+dt@kernel.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, lossin@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com,
	richard.henderson@linaro.org, jim.shu@sifive.com,
	andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
	atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
	alexghiti@rivosinc.com, samitolvanen@google.com,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	zong.li@sifive.com, david@redhat.com
Subject: Re: [PATCH v19 00/27] riscv control-flow integrity for usermode
Message-ID: <aJWz82F21pVTSVJi@debug.ba.rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
 <175450053775.2863135.11568399057706626223.git-patchwork-notify@kernel.org>
 <db4eb976-693c-426c-a867-66cadd3dd7d8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <db4eb976-693c-426c-a867-66cadd3dd7d8@sirena.org.uk>

On Thu, Aug 07, 2025 at 01:28:36PM +0100, Mark Brown wrote:
>On Wed, Aug 06, 2025 at 05:15:37PM +0000, patchwork-bot+linux-riscv@kernel.org wrote:
>
>> This series was applied to riscv/linux.git (for-next)
>> by Alexandre Ghiti <alexghiti@rivosinc.com>:
>
>>   - [v19,11/27] riscv/shstk: If needed allocate a new shadow stack on clone
>>     https://git.kernel.org/riscv/c/9c72a71321a6
>>   - [v19,12/27] riscv: Implements arch agnostic shadow stack prctls
>>     https://git.kernel.org/riscv/c/52eff0ab5f8e
>
>Congratulations Deepak!  

Thank you. Happy that its going in.

> Do you have an update for my clone3() shadow
No I don't.

>stack series that I could roll in for when I repost that after the merge
>window, and/or instructions for how to run this stuff for RISC-V on some
>emulated platform?
I would want to write-up instructions. But I don't want you to go through
a lot of hassle of building toolchain and bunch of other stuff.
Let me see how I can make it easy for you. Will report back.

-Deepak


