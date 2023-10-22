Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF429110F
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Oct 2023 11:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXdd767q"
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F28DD
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Oct 2023 04:07:39 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99357737980so368723866b.2
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Oct 2023 04:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697972858; x=1698577658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jb3zAnuSf9ARMNcEiLAfRD5vH0SKq8CXeDkHXb/awRU=;
        b=hXdd767qQmVbM3MatfBLH+QoMNWQMUW3julOQw9b02SujcC1CNR8cB0LmzJffUNjtR
         2rHndgkbNUABx+4yYKXTeM81Z/cFplJEyeXNhaDeZrELU6vg8VMt2qAx4Nfjrfxr7Sbt
         /prG9d1+a8x/fMeUcrNMP/HdGPtlfUVnzPaD2ZFQQZEnbtSKdrSDVulJ20xrXR4AkNEE
         iOiZy7GAA7i7LXE5mg+1XfbcFEX7j/0MsJV++Ak4QhrrIV9bhTYUeMuMiFU9tltqndlY
         RUU/AJ/IoJG8dq4UqYwN2Velx58xE32nOqeJQNzJiLUr7GaYa4MvhfHHbK+2NMtoWonq
         4p+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697972858; x=1698577658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jb3zAnuSf9ARMNcEiLAfRD5vH0SKq8CXeDkHXb/awRU=;
        b=NoSwgeUCgWB9F5dYSANeQLS3/oiS80+7tnDueS7djQ0NSdupdVxdOt/umf2PhmKDlU
         8rk9OVOYikAUFt83+O6VG1maBJUtCi/3c1kFioKnmRwPtYCNgwTFi1TUL9HLt7c0Qlqb
         fKY9WVkf4WMqhYwHewY8+gkfx7uCVhPN4YxITL3ltGAER1gBqhoH+dNZB3T6JbVWtctY
         p9QyGQq/bPGOzYWz5ktAPH8zox3mtMarfonZxIcSHjzs+fJjouvq6bnHhLMOeNVvUmzY
         pKkWWGmWxJ9HqBaFSak7KrwEF6I5CZRUUb7MvD+UQT4EEPRFNY5Xpg7sDPgJvmTTA0Lt
         U7vQ==
X-Gm-Message-State: AOJu0Yy2L1gZUnMOzuIslAfsZ6eJdsfuJ31O/AKs4i49CFL+mutc4upg
	FsX9a+E2Z960wI40dSUYz2M=
X-Google-Smtp-Source: AGHT+IEQaRFjYfmzW2FXD/UPO3e5wyOSet1aojJYxjy0SLRDFA2B8jRkvS6YgG0XmU3aP13Injg1TQ==
X-Received: by 2002:a17:906:4fc4:b0:9be:e6d4:5751 with SMTP id i4-20020a1709064fc400b009bee6d45751mr5504007ejw.55.1697972857364;
        Sun, 22 Oct 2023 04:07:37 -0700 (PDT)
Received: from gmail.com (1F2EF1E7.nat.pool.telekom.hu. [31.46.241.231])
        by smtp.gmail.com with ESMTPSA id v30-20020a50a45e000000b0053da3a9847csm4757874edb.42.2023.10.22.04.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 04:07:35 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Sun, 22 Oct 2023 13:07:33 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Will Deacon <will@kernel.org>, steve.capper@arm.com,
	Asahi Lina <lina@asahilina.net>, boqun.feng@gmail.com,
	andrew@lunn.ch, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v4 1/2] rust: Refactor the build target to allow the use
 of builtin targets
Message-ID: <ZTUCdS0Vrev1iQOv@gmail.com>
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-2-Jamie.Cunliffe@arm.com>
 <ZTT/h5wKL7STeOhC@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTT/h5wKL7STeOhC@arm.com>


* Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Fri, Oct 20, 2023 at 04:50:55PM +0100, Jamie Cunliffe wrote:
> > Eventually we want all architectures to be using the target as defined
> > by rustc. However currently some architectures can't do that and are
> > using the target.json specification. This puts in place the foundation
> > to allow the use of the builtin target definition or a target.json
> > specification.
> > 
> > Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
> > ---
> >  Makefile          | 1 -
> >  arch/x86/Makefile | 1 +
> >  rust/Makefile     | 5 ++++-
> >  scripts/Makefile  | 4 +++-
> >  4 files changed, 8 insertions(+), 3 deletions(-)
> 
> Adding the x86 maintainers - no functional change for x86, any objection
> to this patch going in via the arm64 tree (part of the two-patch series
> enabling Rust for arm64)?
> 
> Thanks.
> 
> (keeping the rest of the patch below for your reference)

If Masahiro Yamada (kbuild maintainer, Cc:-ed) is fine with it,
then it will be OK to me too.

Thanks,

	Ingo
