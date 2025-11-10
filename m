Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10028307ACF
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762775049; cv=none; b=ZwcJquVRKu3XmlPDCQbsNUyzclaRTZ2OHWtgDS6NRIhRMRkhU0+fLubCyVgIflSPJeTIb5RYWvNLEKTd94S0gwpinye3ZyTcZsGH2ZTij169RIAtu7OrdEae/tjx+jiQlaBxlyF/eiwxQ5TvRLe3ApleV9VRr1uLCGAztzTnEkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762775049; c=relaxed/simple;
	bh=KHlEJ3ZcFOvOfciC05S5x0Xt1y97nhfIAVEf/vmkfg4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BBYp0klCngmFV0dX4yzjd20FYxifQor2/JYEM7wxJt6g/gPFc6crvgEw/AY/aaD2c3ufIWdmhj2wv2BArfofZhzlw03RWqkSG45XhDMWtL2A6NbV9bFr1YWRSuqchEvJ3M0onSK8D9WKvVrlbiZngr+tS+K+rXttJpsqqHgnNs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DTmhAi2G; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DTmhAi2G"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-475c422fd70so18963945e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 03:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762775044; x=1763379844; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qjIkKq2mWwIfqO3bEG9TIc4WKN6b5GBEeKQWWDEpLnw=;
        b=DTmhAi2GRC5/ozUW5FI0/rOwl81sPZduocy2op1eV4dYPJppBB7NqvN8RlibAG/jg1
         /ZrvW1pGpLkAzxXlRRIkTWvuouko3aI5YXxiPRyTa7QP7uIKtZhupLcxtPQk7yH5blAe
         1arYaNgFy2+OEk3CMRjYh9bc6R8Io3/FmRHjvilSpUeUXqECial2ucC8l72Ayx2uEOOX
         ZK+hNpp5jrynxgeD0aLvsU6KxfMQ1mikbKUMt3Hk+RvgVKkNWVJlOx0TpOzOjbKwRCGA
         fAb2CFPTCIuE5+F7xZx8X72SjzeiKFa4Xtdoa739NMli+/+hKYOz9faoH3qKmuJkP0X7
         xV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762775044; x=1763379844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qjIkKq2mWwIfqO3bEG9TIc4WKN6b5GBEeKQWWDEpLnw=;
        b=cpox3SjNOnDzxD3G/1LdReHKV/NjWM4qu08PpXj8rZPMYinJHC/e/4NBEfAMCaT/Bs
         EYogC4Gjv19xOQ5oCweMeap5htIsh6yagUzqpgB/dqp198UaaHUOrPUKhcXxs3aRC8kl
         CIJ0II82Na64rUP+D9BtYfDuZmTbOJF9TdcLQn5xICPW3W/nDB1LOnhM/fY8/sVVLw9F
         ykDnc5T8ho0DthWirKrRi9K1dCTkMOr2GYoIEkxYL7+VpmyBSQGpbmNIqkZ282NVRNrb
         EC9mAce/ltCQtCwXoTmsk3zNo9hzVBi99lhdNXn2RBjhwHjp+PnTZTO5rpmDmNqtUxMu
         vHKg==
X-Forwarded-Encrypted: i=1; AJvYcCUQuvDUXHRimBR0+/sD0tlLa2pavRZOQZF9a+w95pTkOTJSzlsSipJHldqvDFeSdZPk+kStod24TFulJlYpPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6rmfB7jqW/uzdH7eO6+g7TpIBicwRLVvP/A95kvGBsHYB8vac
	E9oio8E1Z+v62hdspg/AMdVQfBlrNCZriUwcE51IaGpt+av/rGRmSbx7RPgVkapahgqpfgs2QdY
	sCJeasXoO3C1HVn9gkg==
X-Google-Smtp-Source: AGHT+IGkuNbhhInDD1ZmUt1/NhCQQS/t6wQ2i+1z9bpocdva95THZTedwTKnj4SLT8o++qExerTsl+FlUO1zVo8=
X-Received: from wmom20.prod.google.com ([2002:a05:600c:4614:b0:477:77a8:8918])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f94:b0:477:639f:2ae3 with SMTP id 5b1f17b1804b1-47773288ba4mr64880965e9.40.1762775044443;
 Mon, 10 Nov 2025 03:44:04 -0800 (PST)
Date: Mon, 10 Nov 2025 11:44:03 +0000
In-Reply-To: <20251110095025.1475896-14-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-14-ojeda@kernel.org>
Message-ID: <aRHQA6FEoxACerIQ@google.com>
Subject: Re: [PATCH 13/18] rust: quote: enable support in kbuild
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 10, 2025 at 10:50:18AM +0100, Miguel Ojeda wrote:
> With all the new files in place and ready from the new crate, enable
> the support for it in the build system.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

> diff --git a/rust/Makefile b/rust/Makefile
> index a614a23023cb..801a8cbf3bdd 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -199,8 +218,8 @@ rustdoc-clean: FORCE
>  quiet_cmd_rustc_test_library = $(RUSTC_OR_CLIPPY_QUIET) TL $<
>        cmd_rustc_test_library = \
>  	OBJTREE=$(abspath $(objtree)) \
> -	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
> -		@$(objtree)/include/generated/rustc_cfg $(rustc_target_flags) \
> +	$(RUSTC_OR_CLIPPY) $(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
> +		@$(objtree)/include/generated/rustc_cfg \
>  		--crate-type $(if $(rustc_test_library_proc),proc-macro,rlib) \
>  		--out-dir $(objtree)/$(obj)/test --cfg testlib \
>  		-L$(objtree)/$(obj)/test \

This change seems unrelated?

Alice
