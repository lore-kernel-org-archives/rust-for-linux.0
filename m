Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89BB42189F
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065930; cv=none; b=iYlBXy0h1I0eyCEuemE93AUGWlSGsStpmTmsrH36Ot6Un3K52foerzAtnCUDhfmYoX801AVQgJXPVe62wB/UbZDteBNfA/+2peexsS3SehEDVUXUHZubYnoJ5NNqRrIQ/cuquMLs43xEKetzz1chd4ZMQS7bSSM5bzB1+gQxvsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065930; c=relaxed/simple;
	bh=ofVgBl4it8ZU6yqrWiQbNGCpR3Y070NOzvRXGVYAgoA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qyjtpHUm2Hgd/CmyFA8TH65KaAluWGB9GMVWtVbLmVoOndXq7ZgWx1eO06nS7F1H9EHUSQx+fKaibUwRDX6s2zj3U+6nUhDg+ZQycDtFaoXOHi0cdMMyFn3CdHS1x+KKFE1bD5Zh3nxRLmni63FAIAJsA1Iw6KDpr805pjOjSHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AXsfefH0; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AXsfefH0"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-45ef616db45so169934f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 07:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780065927; x=1780670727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ralOVts9fCNQ2tqBK8zNgoCjriSrrEOepBDVwIQK1cc=;
        b=AXsfefH0xLvstlNc/oc/O3tQGPPtGsgFCdpgSOP/eBGCvEV0CBGHHjC54tUMg+hqYx
         M62v/MmYp8s7wAguglmJQeybGMT1pe5/zzVO4AkUEVyrzXZ36h8mnhHTDpTNamAg0Wcz
         ex0qJQBdOlKIsTwfSBJNjSWPfnWeuDL46rJZdOZzHWLHSFwo0Uq/bOh00+z6nXkm79TL
         8vCxVMiMrc8y0VwbvEjwIQuAyvPbqe1qP96MqDV4uLNFAUosgCez4/By/7OjyNLHVALC
         g2Xxs6RNoxvi91EvHkiXuOSPtP3IiKEhSyEKpTylmgP7wyc5dA6Dhikxmuloh0H+erja
         7EwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065927; x=1780670727;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ralOVts9fCNQ2tqBK8zNgoCjriSrrEOepBDVwIQK1cc=;
        b=b5v+Ys8+RVtYVuwCUpbmTk+AKQGcqhgaiHcPPm/5X0uMj5yrSpoTIQpsLUKtfjCzkK
         FuxJoQzhNyS1x140Y6eJjTwrDGyDIiwFBmyAVWUdGfHhGuoi6+WzsgWlQRlxZPZXKjIg
         YxmVO81M11OWoB8QLVRmtRv1HXeeXMPlHF6gD3AAOHqIOH6tSQGPv7LLXzFTMCHhEHkL
         0cW+gbKeYsUR6Llfpo4oaK27n94ebYXz3m1+nDGqB6vRxqow2pbG3FJdV1N0Xg85Mokv
         bRatA2I1CwZ07xB8yRtPKIK9NMyYfMx+0/RNSPxU61z/PvsLi9kov6Yy2F1mv5sQYioz
         ELJA==
X-Forwarded-Encrypted: i=1; AFNElJ+WwxWMl5vD16q9dy3ucTWQvOATagyaZ6AN+rpctfVyckkF793JWPBkQiMxCg/hnTU6w8DP+tlmzzBUhG4r6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YySV+HnodKjxL+vCThWA6LNAtdEBUzdccKa3KqZJYJT6U3tE8nN
	HXSZEhqG8m+a1YRL4G6dCQmExY0AytdRqNa+q6wlJcYXRylCiYIbJAcf3lRELv7ATUA3sOpHq2A
	qdK+DRhXXCfJwtOAXiA==
X-Received: from wmma4.prod.google.com ([2002:a05:600c:2244:b0:48a:93d2:60ec])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c0d2:10b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-4909c0b34e3mr44173425e9.25.1780065927012;
 Fri, 29 May 2026 07:45:27 -0700 (PDT)
Date: Fri, 29 May 2026 14:45:25 +0000
In-Reply-To: <CANiq72=eccCAvfG4kYA52uV5+1ysU6QFYq+3GUgTVwJ4=kxDwQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
 <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
 <ahkzD01e14wOTNBk@google.com> <CANiq72=eccCAvfG4kYA52uV5+1ysU6QFYq+3GUgTVwJ4=kxDwQ@mail.gmail.com>
Message-ID: <ahmmhcyfgZQjnOcX@google.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, stable@kernel.org, Bo Ye <bo.ye@mediatek.com>, 
	Isaac Manjarres <isaacmanjarres@google.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 04:29:26PM +0200, Miguel Ojeda wrote:
> On Fri, May 29, 2026 at 8:32=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Hrm, is there a way to perform the version check in the Makefile, or do
> > I need a Kconfig for whether the fix is needed?
>=20
> We shouldn't need a Kconfig -- we can do e.g.
>=20
>   KBUILD_RUSTFLAGS +=3D $(if $(call rustc-min-version,109800),,-Zllvm_mod=
ule_flag=3Duwtable:u32:2:max)

Ah, right we can do it like that! LGTM.

Alice
