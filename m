Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDFC5B5AB
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 18:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787077051; cv=pass; b=ZCYvw90dEvngkQRIIRNGoSOUS/APMEFpOJOIMn5MYK9Mth0EVBN7iDpp+olIEF5vDa8j8wjG5qXDCnKYxZD/tTFka/zYlDranulQgPKDxqGuF8e5XVZacIypKvHgjd4gjnKiev6IAsjh5xihXYSOaHGqGJH95zdRZL9Oqyuq/V0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787077051; c=relaxed/simple;
	bh=MUf5DZU3Q03FFIAZ+LaGbU5/hSFCbFpO2CIY7ZfkgsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cj0ggUKPc8lOSr3ETit5+vehOqKWgYkASHAw00rkIRiZQ6crast694eaK+1pueDmITKhEdLuyb7F6GWNu8gJXXpjPAly3IxEgtxpvtJcIkt7eXvijYIMvbzBKYxu0dLw1LWCOkdfsx2VvIsfXhLLdgaIcsPO3Ri9hf6uFVQiSpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZRxU4iA; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZRxU4iA"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aebe49b227so29591e87.2
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 11:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787077048; cv=none;
        d=google.com; s=arc-20260327;
        b=a4oLtU9RJcPSvjSe1N0hV2A/ZNZyxPTusX9eoGMxc1A+edpWOQ8MUVw0iejGqHd6D0
         kTB/gKdVstw0CbPMOgCfHvjeR61HFwlUN/GqDP1CdhTUyYXQzhtFF2WZhEsdbUg5QbOG
         jYV0CRQrF4gIarWb15jeZ8MaWqnp8vWopwnY6GA+Vw5PSXMaStaqr1J9j9b6anxyV9VU
         pvwTUrdhHfU+zvM8ykHjGHtyNTREFNRZsdyTwoGo7iFXHlNc8K2S1kv4MY9xZ65dX9ef
         PR/NpwxZ5ViAA2SgcrvKhGwWlniSElihlF+PmVGHkgvO4btCkEXtExr4pnTjeKJbuz7x
         JfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MUf5DZU3Q03FFIAZ+LaGbU5/hSFCbFpO2CIY7ZfkgsQ=;
        fh=xJ5JapiGgK7CmMDzBSqVxE0ZPDop/e7C8/1udRswA14=;
        b=YICU/LqMCx0/OFKEEYPMAchXq2ok7j/4Ec4gF6xHatEd4QpO6yXpY8IRoE6xw27Gwv
         Yw3jFm6y8TniSc75bneodgEiiuz/zBsJx1fAufkJD/L4QDM6FjTwE12bSfg9C4IaI+DP
         ncv23dLF1lU1l57ZSTtdBcwRv2AjfGoNsvhCSj4bgeobZZx3j7wYxgKQoy4MZdJPsTc0
         JxWVkCuc4B3+xECWtEPpUtyqa9uWVv+8Qf6TvlE0yB+bZwytD/YwoC6/BhXtxdrb0gu9
         tqD3qqzTzKdbe8mk7Epsu1jvejD04NyMikRbtXsvGZ5PNg+FVgfHd0z4dwzOmqg5/Mwn
         GnEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787077048; x=1787681848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MUf5DZU3Q03FFIAZ+LaGbU5/hSFCbFpO2CIY7ZfkgsQ=;
        b=iZRxU4iA/T6tES5G5Sh5p1DAfcviKNF7ByAaqbuIhbbf1CUrpe3vDnsfrL6ULpjLWx
         jPw4XVs9ES8tRFZbGvUrEDe/KuEJGGQ4wrrmtz7nReiIrJNGhPcY9Yu979qeQ8O2oTw2
         GwAbWTVSfXv1GDwUkVTJzNOlrZ9clPTqklOBi5OqIkzO93LKc0qu1OCtCYISgu2UtRXw
         k3w5pMauiHGl/R5GhaMgTSH0oK2LucVQbbmNlCP2bzuS4wgr8K+QyT3jZcfz7J8WaWHj
         Bk5SFenkD4RwJmeMyjwVgqAprOUSUSCWla2Z7QcPLDUrZNG7gMjAZ4p/kOU4Tp9/OtCa
         waPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787077048; x=1787681848;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUf5DZU3Q03FFIAZ+LaGbU5/hSFCbFpO2CIY7ZfkgsQ=;
        b=e5h7xhCdSW7a1znNwE/V98lqfy4tfcHWdxsbsElv0dyFFr8ZBwWacT97nmhuLgMtBQ
         PgJKjYLcDg4tiehlo5eggrMQrNeUZfW8s4qUsfN15KnDiU3lp614XTy91XTdEhwjCQQy
         oJio6Ybkd4rbx2cCyoChDplBKQIdj5LOdWNdWERfPNpvxwqJGfWAhJLAOmRRF34cc5s8
         X5QNl4bTE8HyhGuRVoW/bVdXM8DQ/SiPRaHlY2cUKOGpV1ldyKCutXUuG/GGkLUm2tpy
         QSZn+Y/b6cDwdVOwC1eiOm8hbpWCIv/znHyKdYmI085i5pmmlZg/gT0kXFAbd/6kUIXk
         O1Mw==
X-Forwarded-Encrypted: i=1; AHgh+RrZNMwLOYVbNCd4xc/BXIbFZKAg7PBmokZhayQZsqG+oDHq3LS/g+3lWMgA/16Smj+1I4MgBfzMtfbRSNDasA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz16roRQfFPSV+IS+Ov8Mr/2wt+r92kB0oDG+7XuNJ10xgOAe9H
	gcweYeT3LnCdxWXj8aOx/vFf2KQx2+tZr9pkWD4yhwzvBzAlyhdtu7fLJ6xud+Un8ZztVX7kwEU
	0zSrqLd480QTosktYL4XtsNFyhYEzU2s=
X-Gm-Gg: AR+sD13rypdDV7KJgQBpYvtsvT2ekDQBHKJP3G8gbdkd9vc0ds5zPM6Mj+AYOceSm4e
	tomV6A5CN/ba+7IGtdF4VZp1ZOjSUsr5bkoH/CZnfgqAAGB7teKk3Cc8KPc5wIbFdKwRp1JL0XN
	AV1E4m/4TyQnn7p6eE7lAqy3AWGwZ/8d0rHzPdGKqbSJECchrsBifwKK2DNJFcfEig4nHV4iqji
	sRNzzD4b7ft7Er0sfvM6rAu2+wboKVYaDZLVjCeeDh/65NwbRLsTlB4EgUMrH3zBiAf5XO98sF9
	mCO2nedsv2M0PLk0QWmweCmliOFEZUCVG56LJi2UXfk4ozuPgKP44gIKoylu7RqW4KriYhYx0B9
	m9cWsIkkKFWig9fb2qbsS+pjoU8mHD64MGVz8L6//UVV9EJTNeRWRxJ4MYsK9
X-Received: by 2002:a05:6512:6183:b0:5ae:c5b2:9cbd with SMTP id
 2adb3069b0e04-5b477cd96bemr41177e87.4.1787077048073; Tue, 18 Aug 2026
 11:17:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805144524.233362-1-ojeda@kernel.org> <CANiq72kBrbV827gHUXd4R3AJrMTAVwxA=vGvzJ_AuOcNjVfVtg@mail.gmail.com>
 <DKS7U9UHY6XR.2JC0EBIPCI06Z@garyguo.net>
In-Reply-To: <DKS7U9UHY6XR.2JC0EBIPCI06Z@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Aug 2026 20:17:11 +0200
X-Gm-Features: AcwNN1Uv836ARLdQbgkToj3v8gdx8hMD_6kS0CWsyg0UYgmOqTTk_SuHdI_fuxs
Message-ID: <CANiq72moj1pE0XtBgh35uQxPoTghz7chynyZqEDFM7ieWy-XCg@mail.gmail.com>
Subject: Re: [PATCH] objtool/rust: add one more `noreturn` Rust function
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 6:38=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I am seeing this function causing issue on my 1.85.1 -Os build, although =
the
> error message is different this time:
>
> rust/kernel.o: warning: objtool: _RNvXs2_NtNtCsaNryh1j6xD7_4core3str6trai=
tseINtNtNtB9_3ops5index5IndexINtNtBJ_5range9RangeFromjEE5indexCsldbe0TGTmNx=
_6kernel+0x1d: stack state mismatch: cfa1=3D4+8 cfa2=3D4+16
>
> Disassembly shows that the function call before the warning location is a=
 call
> to _4core3str16slice_error_fail, and objtool thought it can return (which=
 will
> end up with a unbalanced stack if it does return).
>
> Applying the patch fixes the issue.

Thanks Gary, then I will pick it up.

Cheers,
Miguel
