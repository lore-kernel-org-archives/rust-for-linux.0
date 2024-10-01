Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E121C3F04
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Oct 2024 13:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789578; cv=none; b=nK4JxJLJ+nPgkCBn/KKBqLO7nFmPTUR5vUGiG/1Ng9KjgWrbHechZIp/22ZvSGniO4wKToeY5XEiVWR2Vw2KWJUvSEB+x5auecVUrGRDj/hDGvk0jVaW9SJlipLI9l5El5t/BFQDatsIUbA5wu/nE/oUfXb2BIcsOPg4hh6RTfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789578; c=relaxed/simple;
	bh=jG1f8aoHpacDaHdb5KmywmlItDO2TWAWsVpCx9NXHQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LjljFAiA1DcWeuqVVML9olPxfzptKCdpvQfA/qziP7vJ8ycHelwrJgW7eB7TEzXDCX0PLnH6JyAjtA0PI7J3/x6ie/rg07fxLYh0FC5FHCYSPvNnqIkhrhHVnFW8Wo+HRNfBEvDTJyxhEwGjC/au5XzsKj/PWD/jnQTsq5Nl0uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O1mX0LwS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O1mX0LwS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so18091945e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Oct 2024 06:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727789575; x=1728394375; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jG1f8aoHpacDaHdb5KmywmlItDO2TWAWsVpCx9NXHQc=;
        b=O1mX0LwSRL3zNP4rjkvL89rfY1wt70Vs+hGAibEAvPb/0ImD5dJ0lNh90KQyMEwFM8
         X66kLAI6cqq/dmNOhZxPoOgdzVwKGD59HSTLm2x9dTSv2cHV/S5XIJ5P2seYvlR8fC+O
         B1QPClmPDFncpHNToWU7ZLCfdviBk1/0m8ta587kHmLl9nHX8V3ryi96JW/wExoD9eES
         BisXkDQwHWseMz/RsXoGWSNX0SVZ/d0D5D117bZZxJBFN6eH5nCLAUjcOZMtAdhnvJ8i
         rXFFoBjd8YkeY2o//LqVOenjPpK+SA0ILAAsNnx4N6u5pGw81QKK+QNbX96OEX7h1vxN
         XeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727789575; x=1728394375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jG1f8aoHpacDaHdb5KmywmlItDO2TWAWsVpCx9NXHQc=;
        b=rHEqE4qG1TQ5SAZ3jjjrvfK8RtPMxP5PrDMCZelZoQsbf1AuNmBvGoICj7iVxyV/ES
         ndo4UbAURyaqqaNvTsajnI4GRKj1DYBfoUuUhML9wghvztnOw3udyuC9jG/DDSKTXdU0
         auaEzmuB6mI5Rw1YE7S9Qu12tyJaELewhgKuoDxYy76cFt5CjEAIFGjZgTNiLMmEhi2p
         Rm3hVLw7isTcUTcFjIQmd8DGKoc8vEQmXDWF4MC8zcBNjVDc9snhPneukK0sEhBPNJGt
         Ate8UfgbWeyGVo6EQQONhlG7K2mbCVVSEl2CSj7HWsMVCw1OQNPuldvzBw1rUjGUqoXm
         t38A==
X-Forwarded-Encrypted: i=1; AJvYcCU6qHwENU9CWTmumpHACvq3llEieGE3Lf3z58W5yM0cLCfRPV5GwIEJI/AJVX5lbCb6r756cF5u73SilOAPeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDRXbQM9odEhNMT4E7xvgYB6fdZptYM0CVzDokaqgEvMytQv3+
	7IoikGmXXrteVcr6WQTjyT9xps5m+JzhfjViTFz1R7Wey4kTOlxGcp9d3Yb88SKD4GcpuaW4DNY
	K/rzU/nw+yrEwltAsQm9GR+pOdrCxUwL9xRcI
X-Google-Smtp-Source: AGHT+IHyQsBQmmP7WyMzsvnT7IUWl/PkBkfPPLhhwzoxkBXURriZ4Opu2OW3tEtRkPbGqwQWer73IFV8Bp15N9mptmE=
X-Received: by 2002:adf:e8c1:0:b0:37c:d261:3c6e with SMTP id
 ffacd0b85a97d-37cd5aa9a0dmr7774912f8f.10.1727789575379; Tue, 01 Oct 2024
 06:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822-tracepoint-v8-0-f0c5899e6fd3@google.com> <20241001091527.2fe4e039@gandalf.local.home>
In-Reply-To: <20241001091527.2fe4e039@gandalf.local.home>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 1 Oct 2024 15:32:41 +0200
Message-ID: <CAH5fLghOiGmcpQZvOwn=d2Jyo5+CDA_cinbGjkmjTgSeusAC2Q@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] Tracepoints and static branch in Rust
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev, 
	Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 3:14=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
>
> Hi Alice,
>
> Can you rebase this series on v6.12-rc1?

Done:
https://lore.kernel.org/rust-for-linux/20241001-tracepoint-v9-0-1ad3b7d78ac=
b@google.com/

Alice
