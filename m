Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697B3442371
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 12:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450730; cv=pass; b=JnLpfnTBhbZoW2j1nbXlI9QgjYAuylsmedm6TvuGFQ6+jFxg3uwa4W3TmKpce52IazaVBIUVq4GMWA81nT8xLgNg8OQ6b7Hhp6G6WlyRvEe0WdjmNsObs25F1jhQGYOawWks2XTXN9k+fB3PwH29SS0yg+tuJCEqmS2nufldwrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450730; c=relaxed/simple;
	bh=otOwUfRtr8fuySYLKyp89W2pZkkLwyvGhG8YpNXMUf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXVnAzR7ysIv5P3Zj2FEQtesyjsrFplXm/WWaA//iRNmclFOUySRFklFxhQFxcFHeifyrR08fpTE9rI0V5QIyplaAsdpsgZB5TSyATATWolZdWcyrL/lsuMmIeP1JY0csua24cti+PWnBBjgbim7+zDlzFBGz5+AsokHZS3loow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oej66qt1; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oej66qt1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ceeee8c46bso7555085ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 05:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786450727; cv=none;
        d=google.com; s=arc-20260327;
        b=QrVhglcsA69KL09K2yzdt2rRnoIU9p9GfrCtNPB5+/8Zn5PEtx3tawGC6aowPLIN+3
         MLyWj0Ty5Rwhzdzu9Iz7MLnVgZW33C/M6ivikPRs7sr24Yluvt7J39dM18wp28WxMZLz
         J4/P4u6Xht6r6y/6Q44LT3Oc8rkqr5eYznJqEx+LG2FIfJ5MbZF1QYIRxMLU/7UET6VV
         t63kZWYR0PHBJq3eSHfDbRfsbASj96p47GtfE6pjgrZLUB9YTypEz+BZI3Io+UoT2yVg
         ZggqIDSJ0MfHyzQjllLw7BGLqWHPH8+Vv6xDjCvPrtQto44skpPxXFZIIfGJA+G1vy9y
         Vvzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/RC1A2PguOF1hAQQY37c6brOTFPnjNMMKjohruTM4f4=;
        fh=nnnHvsiFoiebPKtHbDsubNwXbfo+IeBqnK6ai24ZrxY=;
        b=iEzbizrxL2sOHnHqF+JaqLgRtsdZ7N70xDiutQ8do5s/kh3VWdjqY1grSQEXYq+kw5
         VzYk1Knahh5JpOqnYKRJ1mSa0AGCO80TcQngFERQ27h5kHz47z6YICHNYeYgdR+vnX5I
         q5iceYTQrtyBzl7d4SueFLvm52g46M5l1nryy00JwHEtNmjWfHpuwbnUruouhvgArvUG
         NscBxXF/G117X1/FlqCgp3CgALJ3jq9EGaT0cu94UbJC6RIP65mpNzKRtiJG3Qmn7QXv
         btFQXORWSw4oRg1/3NGj9dvBLdL2LjVswMsME0MUILsoxhM6mDevB36glREwvUiO6pzq
         5UHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786450727; x=1787055527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/RC1A2PguOF1hAQQY37c6brOTFPnjNMMKjohruTM4f4=;
        b=oej66qt1SJufnzuYIy0CZiQ9bOJQdes49SDsT9uBI0rdJC/mxSR+bSvE6J8YNCQhb4
         2aZJSLrJBmFmGxHYHvkS6dDExEUiOJqlmQy1Kkny2p3P9g+KwQSCzKNa5T7MhmBuLprg
         dp/n/5S+fY/GuW/fuhE36nVEglpVQRUjkTZSXOoibPQUP7qLVF+sfVokf9ZQ1zF1DBH1
         ZKRu3TINcBsJvJy/ZlFoc03A4I8QJXm0xMMNNFzzIwsLPcPHBzK5tEcNSXfuR4p9W0mV
         ckSVBWISvEGKH8tyOkkgpImeUw2OKKtgWZKpB1HTUpjmn5b9yasMW8/xjMzVP+2RRU/W
         eMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450727; x=1787055527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RC1A2PguOF1hAQQY37c6brOTFPnjNMMKjohruTM4f4=;
        b=GjXlkYoJOG+e98C1CcvydA4i9YuB33bhcVf2gzOZ88hFhl5gjZ8bAuZPimkPILnt84
         CbsM+CNwwdliexcJ17tANiz4HwbGphCEC2h3jlpHjC3BK1FxBPLbrQudsl254/O2Zaa+
         VIDERSRQ7RJ8cF3O6AuosOl0zVP40XkPAljH5ZNjqSyJNDMYsV5UVILHx8yJQmJ86u6M
         /rQBXU+wSuVLWfojv2srCzSBAXQrafsFwbczfl+IKOLTmwUj2B8B9LHxEimJYuL4Ka3T
         irwh2wXQxbteuaDO9WpQQNiUfoScffVzRAkgdBxsiWz2KzmOL+1LVL+GEmW0moZhAfrp
         u/7w==
X-Forwarded-Encrypted: i=1; AHgh+RqYFiiSw6j2cHBVHOO3IjWrhJOTLpCw1V8eSlK6seLOSBQAy86KZXMNP8WtM0H63M8pPHRjkedqBdJfZ3HK0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSOYUX6UIPQzPq4evjFGYIE/xMwvqWgWWNZDXfCLXtL+tVFOLK
	tukivXUk9+fNTcaMEFBbcDLsoexfRJMwFkyXPqr4uKwCwOVjqPrvMH6/GQcQw41Rb9Qd6BDS6xB
	vVR94uGcHUSpCLs46XCtyzqw7ARLSS+o=
X-Gm-Gg: AR+sD11/U86ubgKlx+oN8J8YSMCvIP6XuKwIliuYyFvfnBov0Sz/FVphUtuw662wNcY
	KQ2pSGR3A0K6hD5Ef8/cN+s5ANvHlFb9xrkU9b/lWDzuuZQAf1cHMZgNM0qxsc+IHZpQgGOcAme
	Vl+rRuNDk4DavCbN7VvscJmeAi4tCdIuyUIS15mc1ZY1xD/3oxqAoCLQWzZEaoQHkOrS0W8CQbF
	pshu0vnWPsXnQX2hhyK3gzNClzCwoAjyUVsHI0VmT2lSqnHLgMK/vH5Oz5Jb0242LENYH2+23eT
	1NElNNn7ESiW/OGTaGIxOorMEnVrTUCq7s0AfzWhztZtAHMf6Ra4IAGLTLuoum9/ff2WOovsHZq
	Twf1Yq4wCMwlsj0EBiya4usFZBDZxYBRwAKEDHpER+7+LVuQLWZNsGQPDJnLJ
X-Received: by 2002:a17:903:4583:b0:2cb:2b50:d9da with SMTP id
 d9443c01a7336-2d31791fa70mr26298785ad.3.1786450727089; Tue, 11 Aug 2026
 05:18:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811063345.685884-1-mkchauras@gmail.com>
In-Reply-To: <20260811063345.685884-1-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 14:18:34 +0200
X-Gm-Features: AUfX_myED_ed26Nu7gx_kle1gVGJiVIo0YquA2caUOf2Oc9Uqm0rk5SAR4nUG5k
Message-ID: <CANiq72kVXHSKO2xEp9m3thexiXc8z0kg+hc8RUM2ZS=xfO2wuA@mail.gmail.com>
Subject: Re: [PATCH V2] rust: uapi: replace direct asm-generic/ioctl.h include
 with linux/ioctl.h
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, cmllamas@google.com, 
	gregkh@linuxfoundation.org, paul@paul-moore.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 8:34=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> rust/uapi/uapi_helper.h was directly including <uapi/asm-generic/ioctl.h>
> instead of the proper <uapi/linux/ioctl.h>.
>
> On powerpc, <uapi/linux/ioctl.h> pulls in <uapi/asm/ioctl.h> first, which
> defines _IOC_SIZEBITS, _IOC_DIRBITS, _IOC_NONE, and _IOC_WRITE with the
> arch-specific values, before falling through to <asm-generic/ioctl.h>.
> By bypassing that chain and including <asm-generic/ioctl.h> directly,
> the arch-specific overrides never ran first, so when other headers in
> the compilation later brought in the full arch-aware chain, Clang saw
> those four macros being defined a second time and emitted:
>
> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning: '_IOC_SIZ=
EBITS' macro redefined [-Wmacro-redefined]
> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:6:9: warning: '_IOC_DIR=
BITS' macro redefined [-Wmacro-redefined]
> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:8:9: warning: '_IOC_NON=
E' macro redefined [-Wmacro-redefined]
> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:10:9: warning: '_IOC_WR=
ITE' macro redefined [-Wmacro-redefined]
>
> Fix this by replacing the direct include of <uapi/asm-generic/ioctl.h>
> with <uapi/linux/ioctl.h>, which is the correct arch-aware entry point
> and already maintains the intended include order.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202608050618.9dekfjtF-lkp@i=
ntel.com/
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

Applied to `rust-next` -- thanks!

    Fixes: 4e1746656839 ("rust: uapi: Add UAPI crate")

We could, in principle, backport it if you think there may be
downstream users that may backport powerpc -- I wanted to at least
have the Fixes: tag even if not the Cc: stable@ so that they could
find this commit if needed.

Cheers,
Miguel
