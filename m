Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0CF1CFECC
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Oct 2024 20:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728593914; cv=none; b=H5CGOHV7NNExU7FjZibIypNkh50iN6mZeGJ+H+ITB1Yo3cujAF+yZx4BTi5DylUz/qFDgy7Aqi6IV9dWFVKa4FnKR0X3Ucj0cl/4AmCc2TnC88AIHjdS37ZrsbyfQraP5Fy0kzUAl9wa+ECe+OZiA+vbSKeMg74iMOxD/BuV4GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728593914; c=relaxed/simple;
	bh=inwe+6xklAHGB0zWcVw/2ybKiqBK5+NOWD5Qlk7AHV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUiiBXpjvj4mnXChvMeiTCFYjKdNQasKZBZjMBm8+NyGS3kb5GWmMIhfOgMpT4jp2KZ8WgnaMz+/1AhCcaC50YAhd5Vk3yk5P7sMPApHwRjYMtQrw1X3J9Bwkti1I9hemtcbpylIpW+IQkdLDczFCgCMHC0KzqWNMHr/1d/PVKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qhvgyqQd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qhvgyqQd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20b061b7299so22175ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Oct 2024 13:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728593912; x=1729198712; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BSyj77TOkKVjZ1a4D2+fI3Tz/UJ0e/hBBz2zXC85lD4=;
        b=qhvgyqQdjdeR2LNMPDciUEZFh/jRlaP/qeOT4EaANh/0/xy9qV5h/B8iZcNIhSHg5J
         FOiwmdWDqCzeBBcmm0MGHGyYxmhFdU/mUbJ891l4vUC/Ty02AmobtlSkflwflLOdd5VM
         +Yn9Ice7gvkrtUavi4WdojO3YYDvLJ5blQgA00AePBfxyuyp7o4TDUpSopb5cFtbbkLk
         HTcrDj5ul6uBoyZXEh3C+tAKDCUD9v+ChHXDSi5HgPM2HueTOiGtcMYVG/jrws9DOtox
         H8AMwqS6jydtsw7VLmOPzNNxry7A8/m6nL99a5gzScpOgrOOW+Nc2rqoHMwUiCLXqtpb
         ADiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728593912; x=1729198712;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BSyj77TOkKVjZ1a4D2+fI3Tz/UJ0e/hBBz2zXC85lD4=;
        b=E9tAHUsRC/MwtDN8X7CrsRFW+nRaRUSmHH/+6zpLyloX/yoTvMdFRehUcSK8cBKJIP
         mwvXuvvQNa5XL0SL5RhVLgYHmgtmTuzF1WiDJmcG4oVrBPuTbCNDCb/8JecSoaNFW+Mr
         hEFXOzqpMA3e4zVTxGxS52Ovht1MIlablmFTtW3VHvW2IlfXXz5r7M2UNdB9TOv0CMJi
         ztXcw/7THCXwv6tHC6BG+hFRkkHyGPAjalAtqtBHRz+q3/fmWBWGmePlU67uyNBImPVb
         kbD4EXQyBXmaYTTMKlLpmkLvk9szG0tl75whm4BdbYzq+E7vkTQ3BHB+rU/Ghz1Yb/60
         GhoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrUfFGCRK82N+gQ3u/Fta9W+ARJ/oLvxbbtxxt/Cq1IoKjCa7DVrEtJ4fyMVnqMs40Imh9rx/uM2Vx0uvsyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyStDCU36ig24pm16/NtjhKrgCVdbDEG0T815XaYOmKiMYkykA3
	ECqVf0bpk5V0sSXwVLtH43wwQttUakxRu8B96tjIPrsrBNjZU2pZFGDndDRKAw==
X-Google-Smtp-Source: AGHT+IELolDxR08MMvONc31AuMpSfPx10U28rT/lNq+x47DqO1CMN0v8y3uXKBRfbkL5/T1tcFK4Dw==
X-Received: by 2002:a17:902:b709:b0:20b:13a8:9f86 with SMTP id d9443c01a7336-20c9eefefe7mr751875ad.28.1728593911886;
        Thu, 10 Oct 2024 13:58:31 -0700 (PDT)
Received: from google.com (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c212e83sm13333875ad.198.2024.10.10.13.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 13:58:31 -0700 (PDT)
Date: Thu, 10 Oct 2024 20:58:26 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
Message-ID: <20241010205826.GB845212@google.com>
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
 <20241010-icall-detect-vers-v1-1-8f114956aa88@google.com>
 <CANiq72ndoSmGVzuPR6ikq0HG1kbMp6ADOY8BonD9=ij9tyU=EQ@mail.gmail.com>
 <CAH5fLgj5rPgV1wBbYJy=T0kjCdECYnDvbim0pEk5y6fp7BVx3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgj5rPgV1wBbYJy=T0kjCdECYnDvbim0pEk5y6fp7BVx3Q@mail.gmail.com>

On Thu, Oct 10, 2024 at 01:02:17PM +0200, Alice Ryhl wrote:
> On Thu, Oct 10, 2024 at 12:55 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Thu, Oct 10, 2024 at 11:38 AM Alice Ryhl <aliceryhl@google.com> wrote:
> > >
> > > From: Gary Guo <gary@garyguo.net>
> > >
> > > Each version of Rust supports a range of LLVM versions. There are cases where
> > > we want to gate a config on the LLVM version instead of the Rust version.
> > > Normalized cfi integer tags are one example [1].
> > >
> > > For consistency with cc-version and ld-version, the new version number is added
> > > to the existing rustc-version script, rather than being added to a new script.
> > >
> > > The invocation of rustc-version is being moved from init/Kconfig to
> > > scripts/Kconfig.include to avoid invoking rustc-version.sh twice and for
> > > consistency with cc-version.
> > >
> > > Link: https://lore.kernel.org/all/20240925-cfi-norm-kasan-fix-v1-1-0328985cdf33@google.com/ [1]
> > > Signed-off-by: Gary Guo <gary@garyguo.net>
> >
> > Alice: when I apply this, I will need to add your Signed-off-by here
> > (i.e. when handling patches from others, you need to add your SoB
> > too).
> >
> > > +if output=$("$@" --version --verbose 2>/dev/null | grep LLVM); then
> > > +       set -- $output
> > > +       rustc_llvm_version=$(get_llvm_canonical_version $3)
> > > +else
> > > +       echo 0 0
> > > +       exit 1
> > > +fi
> >
> > I guess if we don't find "LLVM" in the output, something weird is
> > going on, so I guess it is reasonable not printing either here.
> > Although, in principle, we could preserve information and print at
> > least the `$rustc` one.
> >
> > Anyway, we may need to rethink this when we start supporting e.g. the
> > GCC backend, so I think it is fine as it is.
> 
> I guess we can just do
> 
> rustc_llvm_version=0
> 
> in that case?

Agreed, that should be sufficient. I'm not sure what the GCC back-end
status is, but this patch looks good to me whether you plan to fold in
this change or not. FWIW:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
