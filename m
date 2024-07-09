Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B440394
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jul 2024 00:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720483848; cv=none; b=twxtQ8d39vp3bH0DsTtIQHKtirYR622dZzRt0jUyA+T69AZ0ict+wWxs9RQ3Ng4Ndqeb94dKGVoprGZ+PAdJs98FBYeDmQSMyyfVM3G0Q554BR52PTZ+4a6Z9jnLgc5RPL9oflTpIRXtQIAhBlhIWC7x7z7MPdRi8nSADDlyj6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720483848; c=relaxed/simple;
	bh=U7gv5IWk94daaO00MsgQ3RJYOtUskNt3YZ6I6/q3710=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWwylZQbZSugGjNOjjLk7po1ihiycK4XiCTs/tVwS+MWPHXRrmFlwhnafnAWoIBVr3LIy3knpqWa8IxbmdJHCDQgdMKx8/VE1Fw9y76UijIY88uKpqdyH/An85jxBrS9hnz3shVr8Utsd1lqgJOCQ+QRUjKXGP2cRcWMjIQTczg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WzWL12RT; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WzWL12RT"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-80fbfeecca1so943641241.1
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jul 2024 17:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720483846; x=1721088646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7gv5IWk94daaO00MsgQ3RJYOtUskNt3YZ6I6/q3710=;
        b=WzWL12RTbq+2Ffc3Vv9QWMRCHlvlbUsSO90F/2gjWI2idGnk/E7Ah/rkfk26oh4H4V
         VsZXrjXrtEiLxSec6DrXrb2lZOIFsJ0e3NNeLbopkEPZgtkrANjPvara/VNgppLd1K5S
         NOOYSAqTh00ASmpkB9QwLAgtJBBHE1YqkbKs231ylcELhL1KYIirowFOaghdYztpERMU
         5SbJMJinJR89wTIPQCyTgkQY+Snih3NKVC3+x0cr/97NflYnP4kyC5GNkqCa1wpEZmkS
         g1be7+oEiKHrSaTdDtTccKdXbJYVYGdhjQPy1Rs5MKpdO8XZyYh9ZgPNI9YjnB2L3xKy
         nBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720483846; x=1721088646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7gv5IWk94daaO00MsgQ3RJYOtUskNt3YZ6I6/q3710=;
        b=Bf9wX2tcVD90V2vOudhWsEehASq0U84mksIyn69rFhOy0wvS0YSgciIGP0GwhUomXH
         wVeFvtZtSiKKPXnmy2dPlJmAIEzfpnNNnYxZa0FD5yYBwsaE3o8oPHqGRdcVePpqeetq
         4jSMdD0+Y5KM1fer8ZZwQ1GQdyFVdKp8BRwNkWfDgisWL+Xmu6yB5Ecr+MPUMoDPS0fa
         VV/uy92Itdrd/LPBuvs8exOiwaBsk2TaXaeo3b3uNiRRvQPwVlLP29ZEcAZs4X2Gxqpi
         M3JU/xRCDg+WQrTUdyQLLbM9xRI9EtXoJMhLwqnCICQPr6r+fpA2Xo1znR6SdwMZp9xh
         DOKg==
X-Forwarded-Encrypted: i=1; AJvYcCW4iCd2jCpx0hFrKbWoMm93eAvK2NMFBvqy1mdyBfJ0LWlMla9LyMeltFVUQ2um1kNpXML+vC2p3Dmc3HpQYreGEJCsSjmi6rfIZNqRy9A=
X-Gm-Message-State: AOJu0YxqiAJ90+/WZ91Saw9/3PmJr711xhG9KxgY1lfq10BAux5LFrWs
	VL+SVvN4co2t7QkPDaTxww1+Iw1n4qtdrnD8xKesN7SU+o+7pL2VMQQJP5hL/0Bbh5FYbKemcmn
	i4xK6dv+fE/8s71T6pdtYoxzrU+RtPvELzOPJ
X-Google-Smtp-Source: AGHT+IHyCX7gkCO+NqTBzhVYM7TVH/DGTpigPO9y1Ay4QULiTrQ5FhAlGT+5uGCJX3mSvf99tSbeIBg97AF47w8qHMU=
X-Received: by 2002:a05:6102:38c9:b0:48f:e68d:c1a7 with SMTP id
 ada2fe7eead31-490321b37bamr1062532137.23.1720483845647; Mon, 08 Jul 2024
 17:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704-shadow-call-stack-v3-0-d11c7a6ebe30@google.com>
 <20240704-shadow-call-stack-v3-2-d11c7a6ebe30@google.com> <20240704-unless-cache-8a971c244348@spud>
In-Reply-To: <20240704-unless-cache-8a971c244348@spud>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 8 Jul 2024 17:10:09 -0700
Message-ID: <CABCJKufJz5Wu5ivbEuUFHJd8qk0M-W=WQDCOe-pR6w=4=YyEag@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: add flags for shadow call stack sanitizer
To: Conor Dooley <conor@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 10:17=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> For these security related options, like CFI_CLANG or RANDSTRUCT, I'm
> inclined to say that RUST is actually what should grow the depends on.
> That way it'll be RUST that gets silently disabled in configs when patch
> 1 gets backported (where it is mostly useless anyway) rather than SCS
> nor will it disable SCS when someone enables RUST in their config,
> instead it'd be a conscious choice.

I agree, we shouldn't silently disable hardening features when Rust is enab=
led.

Sami
