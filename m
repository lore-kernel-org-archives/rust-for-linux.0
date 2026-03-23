Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5981390CA5
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 12:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270194; cv=pass; b=fzy0t+hyW2XJVKzGVR/dH1PO0KtKfSsqugL3GJ1qqkAek4VmqbPFjmifm8nToKkz7e/uXFYgfy9pQ76aKoAH1763KcfvaXCMsaEHW8SARDB5yWb7KPxFau/NqARp6fkNoveDiXrDDT7yGNcnQiawsex2ApN1gJuTLp7T3faRWA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270194; c=relaxed/simple;
	bh=mhaI30SNytJzSanfaF6YNaJhdYu5uF4diqTzJ/Jmkig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MwtT8ZEIekfaVTTzXfJv9gVFzua7/qB+Mc1HU2/+hQ63AD36b2GJ7yFtdYZAlR1OV+XoWwObU7SYf+fs/uclFkXVXT8TYOi1yGmuxmvev1NQzsdO2rV8CAVxuI5v0lzhhtJot2grlRg/wzz8u0zqUeKESzRjF2e1AI1vuxRAKZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W7BVK1J8; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W7BVK1J8"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso2120005f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 05:49:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774270192; cv=none;
        d=google.com; s=arc-20240605;
        b=HuQKueEEJzfWHadUyp9HcTSeip24iqtN3uslABb8BOGdzP8rsCyghM8TFkPnEB0g1i
         xc+Au+lVDEKppx7LMwmfOY1a8OeV/MD7b/fuCXFT0I+kOdLkPq4MWvEIR0IKGqoU2MAn
         dJR3rQ/hE7ReTfGM/vV2R2R24V23zeNMjpx9beRcey8CnXhSPmMMfTdCGxXTLdpu5jTS
         PN+T6VSJOQc8pxHQaXwPxjoBKdan/HokCrEamL6UgU1CaFbs1sa7WUxBdfxuKYstmtnT
         jM72suasnqOxvk9jTTw3hu8sUWy4nhwhwrYe503BMXuDAUYjsmzAnZPnsGnMaWjqcuXL
         K5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mhaI30SNytJzSanfaF6YNaJhdYu5uF4diqTzJ/Jmkig=;
        fh=UFtimwlizP9qbYpr5z4S/mgOZz9pVnYdR4LhWFrJwwE=;
        b=C3VTFPQGp9G/bJmZ4YDYOMwuypMPXaUaWrcAqhLaK7REKM7NaiL7438B0Xnv9sdEga
         ce2izBBJRTKFWi8iObDTEJwrfOM2/uoLOZBbeysOEtXZdECX+XwJHYGTKK7lAUhsiJLp
         wannY7uBJ911pX9N9Tb5tQFReNJURxQEpM0WzmTD7snVc5aBxxMeZUV+3JhwME0wyVIl
         gCqW4c7Yt2UsqYm4jgpW1hlJk6V/EvYoFublLvef+566Tte/KQvdh5q3gma+EhI+7bzh
         qcHcvXdPC2FZGfYL4hO8F60CHLzv/nkjE3ijqOWTt1u7PQERqYY0jsWTcR4D3U/UDcGE
         /+YA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774270192; x=1774874992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhaI30SNytJzSanfaF6YNaJhdYu5uF4diqTzJ/Jmkig=;
        b=W7BVK1J8C7hOAv2IsN3dZ/3ZRDnVgfuVtWlfg694QvPoeqMjEJy05bHxfT//R1sWsJ
         HLkq6S+Hzi1kZRBWgiRMbefQ6Di3MwbdZc+C7pqNg+DsS2UFGUpTQkC9/9IT9gUP2zSh
         Ng1W/pYXvTP6QXir4fcj0F9HUeRcbnj+TWS0+g9aACFpOun+F3kmY2hXHRGCallO8Mw5
         YW3Kp/7KH26iuBKqigakHK04wYc0Qbal9Xnm/Epjc2KfvsryyIlda/Nc1W00fn81W6YC
         hIsR61HIxY2iEuyJLrzgOf+jZDiHVbG33ih9aQbW7HT1toQFlN+2VNUpCDxxuacrtxey
         3Dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270192; x=1774874992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhaI30SNytJzSanfaF6YNaJhdYu5uF4diqTzJ/Jmkig=;
        b=M+RES6pc/F/2MDIV+ST25vBlBxTfc10+emTeOhCNOMUPqj8dvxiInCWp7wc/SFF3TN
         86DfG1xIvRYi8O+TSu7RV6qgdZA3VB+lep9fvHdmbftj2ejVt9aK2D6jXPLpSDR4++4F
         vmHmEQIni9PaXcWuo8FuUTVAU5QchIsxtjrqL/gyZ4xUseS7A8sYUYLg3SHeTNmiYk86
         iPpOKPyA4KxmZKsNFuKdLvI2BfWll6TxGEHCHhIMGW3V4UrRY1AZDRkDgCxnBNgj5pCE
         kEzH5rDo1UvQzUu5ckaCikw1KmetXmN5ArraDvIKRjk1nUZugUAEFoZl1hElYpeTsZO1
         bDkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrF9pj50LKFD1PzgzlAShYB7zrPeII8Hat5HyL3LG7eB5cgWAacM0nfkn/29WDw/UkoPkFNCxRqETnUJ6g5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLU9CAbYd70ZLoEkjngxhIRzX9EZ4j3E7V214EIZAhHIMauCPU
	8BrjRZ9gWOhoIY0ovRfkLbanktLRTOXBOdGG+l4j1IlI7JaKPf/HGqcFe/LNVbSjas4OfjZuvCw
	RPSSI9jh5iuQ31mt7uu9xZ5UCx5pvQBH/UBF/7j5R
X-Gm-Gg: ATEYQzz9cbn84CszkhsbnjuLQMIX0sFCFhRo3dDQFniicaOmScV7UQqhoqJoson6j42
	A7yrXR54mMI2Sni3auRMlIinms8T7ViwKNWfgkIcl/W3nELT7TrglKDGqYsbGdb1T5saAcSR82M
	ceBJkZSl7xyS/mdKzkd6z4wSB71fk2aYDBU/fVbGRIZsqKguEO0mNMbwwbwtKiMvoBn8NNi+vhA
	MvBH/3JhOdOvTLGvp+Qw71sNp4tesp091s2+PsjLVOiERmaWrdE/C2if4GcOTRDfQOOePY6PylW
	rFE3S7C5EuwYWpOIAKi8X3dUHB2KGsFpafCuJBhQzRNKVgS1zMeMTF6dJnryPGc2cO9JhWx79ys
	p9ssY
X-Received: by 2002:a05:6000:2601:b0:43b:4352:1bd9 with SMTP id
 ffacd0b85a97d-43b64290e38mr18021646f8f.48.1774270191803; Mon, 23 Mar 2026
 05:49:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-module-value-ref-v1-1-32507e1085f1@kernel.org>
In-Reply-To: <20260323-module-value-ref-v1-1-32507e1085f1@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 23 Mar 2026 13:49:39 +0100
X-Gm-Features: AQROBzClFWF7ntMYn_osU78DJFaK2xsZEw0vRnwYGIT2wSlft8Tag7vijAEcrPw
Message-ID: <CAH5fLghnHvnSNsZ_ME14KiPeKh2V93L1ZQJOqs0Ztn4YToam8g@mail.gmail.com>
Subject: Re: [PATCH] rust: module_param: return copy from value() for Copy types
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 1:48=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Rename the existing `value()` method to `value_ref()` which returns a
> shared reference to the parameter value, and add a new `value()`
> method on `ModuleParamAccess<T>` where `T: Copy` that returns the
> value by copy.
>
> This provides a more ergonomic API for the common case where the
> parameter type implements `Copy`, avoiding the need to explicitly
> dereference the return value at call sites.
>
> Currently `value_ref()` has no in-tree callers, but it will be needed
> when support for non-`Copy` parameter types such as arrays and
> strings is added.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
