Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345923DEAD5
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Apr 2026 10:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775125848; cv=pass; b=hoUBoYq1EOvX/gNTG5fiGpMHTpMG4W07OVPszdcZHXr1Y1C1pZtARedftNjz6MzcJDofj2b96JC+v+aBwc09VAdPHMP04FUiMA61ZGQMcD+eCJaXyYP3t5rfo5sC7RnrAy51WNsMPqejqDDEcHx2uOHK36GF/gV6BPNbNU5Gh2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775125848; c=relaxed/simple;
	bh=BiK66Ja63sGBdP+p5szis0SgkFa2xSLSpWzb20fg000=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pEHAnS5+5WB3RYOUtqfcFpKXhVCegB0950RNp0qiREvdqG4I8JOrId5+ZTXUq5rgwf+/VAHLsNFmpXab1K/jPOnSe2hom6kKvrWK/tWz6pIGBzFBBFzbnR2KpeB+opnC3mMiE7UgGs520SA7FXshgviW3ysgndCwTO9Xs4UETo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fO/4s9Pb; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fO/4s9Pb"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c98928e4bfso76966eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Apr 2026 03:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775125845; cv=none;
        d=google.com; s=arc-20240605;
        b=kavrt2N/YZ40bGUWUHLS4bUqPmiOVf0gHSv+wWVQIOQWhwMcDzLlf28D5q8BwOYq3J
         GHugl66ykbBP/I35ojMHdYlbe+uf17YkFEl0V6upXSyxmkdfgXXgSBaHVA5c/dJ4q7V7
         coweTpPG8TcBEqjNrNxUG17T6RfuJzc9OFANk3AQ5LBi23cndY+w1QD/8gzG+PAVGkBx
         9MrWQzMv5SIhJwdhmfbkmcWsAm0dMOGYTFD+B9GsfcV6APTpCnBSCOD+A1QCwPYDKguz
         yI5NaSjxGqX9vqoMABt9KozpKi7Vr80qeI9mqKSOpv5SmiRcRsx01xt3soOIzYK6a4a+
         snsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BiK66Ja63sGBdP+p5szis0SgkFa2xSLSpWzb20fg000=;
        fh=jRdFlTLoHWM5dheXgP7cy1Srw1hNwJFscR/873fA9Oo=;
        b=PYdr3P6JDofEiO+nClgr4b0NqeJGcApJJ2IpuXbRRPTLNeAmWXzvE2WrDFGDN7vf9v
         gIkzgy6RvMWxdrcuGi15T8A+7CBZue41ysdZV3mIAnH/j4ZhvAdVDh5rErpeagVlUlqj
         dGJORyPGqq3C5BiZlri5sHi7CA30C8HMSc+uO6Ue1aGX03QX+p5+ecq50MJIXKdY7f25
         L55fiZLc/wbLAenBpxK4ZHxSVE9QK5NGb0TbXCJqbBM46c7JFgt4vpowRQOqVmghmh8q
         K1QxJLNt93mqFeGr2SpL/YsBHiE9W3PNuRtiWbw4SNpUXLg0fGlbgOWLJlg4gUBxRuIz
         6hVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775125845; x=1775730645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiK66Ja63sGBdP+p5szis0SgkFa2xSLSpWzb20fg000=;
        b=fO/4s9Pb3nM0qSacm1iTY+/NyU+h7WZC9jeuPTIpLmv9OSjbmR8YoNaXN8ks9TT5q9
         gRcaplJdbNHvR3AV2nNrsZIOUtFDdRCYDQatLe1m3kk4gL+ACFLqd02ipB+8/zwO97dv
         i8yhOqAjLMM4IJIY9LgB+AyaRThD1uvP6Qn0ewqeOBYcjuzTKhoSPdDohaSnkU9dmgAY
         tbOM82lwu2XHN8Ajpw+skBPN/1F1qFudPYqdsN8IqbzYVb+rTwSVggQPmnp0ARmAYSZG
         alBjs3WBrMndLvzlWe3OdOYoIPribHlhLI5+x9bq4rH/yVmGmRidvuMCGaImncTkUr5M
         nF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125845; x=1775730645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BiK66Ja63sGBdP+p5szis0SgkFa2xSLSpWzb20fg000=;
        b=q+RBUQ3fTLtGsPXiSBcqsoEJ8hsIywK5E+zc4xHiMMLpd41IUm8Esa70rx5lUHrqY3
         6lWkbuB4hnhjhSAGxo054wF6C/pTA7zmcKFvd15eY3+PdW5C/IpsUEkv5MHIRH7tdv+L
         4PSfiQw2g1dlk/+y9g6GX0gzzVxtC05mBJ9qmlP8pZ/3Z3Q/PbOErvVJ6kFWIMLmdkdU
         0SblAP/YwOqzBGLmBG6AQNE8RNgIJBofC9rCVVvmn/gppBnOidOHXLgRJkzvuydsFBB+
         bMngH3wSeLWggXYt183SlEhkgkUkrUSzkq7NsXjlk6WpFVnwY6lBCMCUR1j40KUbVh7k
         71gw==
X-Forwarded-Encrypted: i=1; AJvYcCUc99U05d49lZjw2zgyZXfbhKy3YlS6vXmjs1dgCmnie31oN9njWWgnX9TN7t/QU3REPEgsw0uS0rXPPfl/lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXwlawoJikhA5DPfPUA98Tdw4uRbrpbsX2dS0zaKSEfDj0WPoy
	jA1kGrc8rEvmy0qc4A7puNxT2vi8AtAeuIgBM+zR/VG8XDRrviaaJkO9J/RjQ7Se+o4zjQAFRUV
	8WogoToEMXZ5qdPuEoxUOLA/ESuKJ1UcIf2l47kM=
X-Gm-Gg: ATEYQzxXGIrdBMJ3PJMkP5+YhDhV7jeGDT+DL/ks5slwXXKQkMdufG7fk4JEU3zqdBT
	/V/QiJ3r9KETj9zbwcthnlpFoHc9CGcyl+xnqk8+zq2d5tXX2/x+ON5+746CAJDkjaL1laPVz/s
	NMJ2lfyctPrRImRu/xu6hHfKuFPKMaVYZtbhvGZPGTxpwZmIP1hKTiqKKSXs3rEdXSUFKRSIsYu
	eR5A/Zl5nDxdo3nykNO1//HwGjTCxzxm2/qOeG3999UaP9Wi8YIoLiJyOJBCoL8hB/SzvE3t4QV
	TNKZ3zitdFmFiFQlKClcuIkVieM6LP8bqcj4Nwonkmf8QPsgZb/bJQBNSwbnA6SWJxImrpVtRym
	9TXJn5pu6OqzVIJ5yTmBtUXA=
X-Received: by 2002:a05:7301:2c05:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-2c930798a4dmr1632114eec.1.1775125844672; Thu, 02 Apr 2026
 03:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-binder-crate-name-v3-0-c6e00f239fb1@google.com>
In-Reply-To: <20260323-binder-crate-name-v3-0-c6e00f239fb1@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Apr 2026 12:30:32 +0200
X-Gm-Features: AQROBzBsEeAx7nnfVGiSD2TX6oKkCL7WuTUbbT011Xm4AwR7twRDG0Ux8Qwzhlg
Message-ID: <CANiq72nbd1krDja-N-HwL7=dw7+OYmqGSa1c36dRMWjRo+OA_w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Change Rust Binder crate name to rust_binder
To: Alice Ryhl <aliceryhl@google.com>, Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 11:33=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> - Make rust analyzer python script a bit cleaner.

I merged Tamir's PR -- could you please send a quick v4 with the
rebase so that he has a chance to look at it and give the Acked-by?

Thanks!

Cheers,
Miguel
