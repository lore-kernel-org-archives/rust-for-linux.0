Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96FB1FF7C8
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 02:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769220898; cv=pass; b=lEXs2W1+1553JVNqazlK7Iona4Rg50/bXAFeIDZ05PaIsylDj/lqTL8NSzNTyTt49ZWVQfJd6SzRZOGKcF09lPotbhIbdTTNKFVbM7Q4R7XxyrM/Csn6jAdRbZfz41pzz8rUEWsjxSE7D1Yj0hWyrQInqAOv8xB61J8G5x9NnzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769220898; c=relaxed/simple;
	bh=2Gq/lvUnytD8+fukyp45NmMLYSY0JZKM4/4VIkUEgXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YqKTkCmQA1yzhXamc3La30Fgx4BaEKgeTFcaAA7kf2oRIPSB5gHqaEUQapOywZXKwbTzcqZ5HIlQ1A6XSxW7F0LU1NulRjDkllYnXzm/Y6K/u6+L8Ke8VmtbOSeGz/vc5ek4y+EPiz4H2CrB6wi7yavoCOHFW1EuiawQhlrX70c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jvesk939; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jvesk939"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9412cb281acso797820241.2
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 18:14:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769220896; cv=none;
        d=google.com; s=arc-20240605;
        b=J3PlkkIMOVVHtiWeZF2OwdxJN46F3CJ1W+LOXOlLmGdemDkqdIDaliFAU+76481LU6
         Hl5PmdnQnOaQNq/OunnTH7S0KYV7gvWrLzyLBwStMt4YFm1IL8KmIq74DDrTt+EFH6cg
         zcy1kghVT0v9zF1S8B8T9V6nPQIVgmvMjlM9bRe7d8T6ZjwGdLK4xs2nGTikmSBhLE43
         vJjIQk5zqZJdmhdeYVXAv9a5T/xcH7hsamWdVz9SF7HqY1BqQ3kWRrMltew/FvCDqD3e
         VNyzE3l1y2w3Qjpp/VsBRKxjkXaRpS0aqCCHvwYcpFEAGynz4t3eyxVP3uMPKGS24eGB
         tH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W2N1wDXtYPeyIY1quDYkdx4NkyGyUWGpIrXxyovfpK0=;
        fh=bq3sKgqj+89VdWgu9r8ee28kAOdZrwUr4Tw++rSd/rg=;
        b=Xra3w3LUFdyTpQUp1cOMrwyZJI8fRfNd1RuFoT9I331tmotjudAmV09Q0w87it465T
         K+DhpR2o2UhAiePnjydo1XoH4FCgdZWHVMPYCfh9YP62XCTGoh+QfkWjqnDtboosWTJG
         kRuGa4jS4GhPdxgCkJwjuQ4mkO/DFKya5kJGg2k6/CxZ2BZOqXMGsHBwgpaIiOvFaoJb
         OzvShKQSk8nQqljzE8AUYZ8w84fybYxz0jQysKgrTzI5BhFstabV1iLCtmoJYrBbeKB+
         RSucF/HKZUCcbxiZB/6XIo9B+d8hgO7CUiqDGSD9eKSdb3eZtIAzDOsS2LLSNseGh5mT
         H61Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769220896; x=1769825696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2N1wDXtYPeyIY1quDYkdx4NkyGyUWGpIrXxyovfpK0=;
        b=Jvesk939lcfq9hUrAwYGk182cB3nizcEqCG2axwVPz29z7QNP2rWzdlTsxSzG8My2J
         BSJ4/qRFb55YpzAslCxTdJx+h+9jevg7rtxsK0radttrFyXQ51rmolr7sN9NA9DA2w2z
         2jGS4WGhVp9kMnXtmVx/BheNJ2ruJ+Nwz1egg8cxmcrDgkQuaoVEp5AUrvQomWjb5iPh
         MXbNp/6+Kfj5yt9HiZBr2lbV6CZUnf+eTAc1HGLMdtocZXIZfCvD33u27qNBg1KdiIu3
         j7jhGlo41Hmv+rpUb9kmJaJvEN0TD029KbU7hUk3RE0tIik2I2+gNCs6z9JaNZhyWNDI
         hwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769220896; x=1769825696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W2N1wDXtYPeyIY1quDYkdx4NkyGyUWGpIrXxyovfpK0=;
        b=NxqYXKEpt8MPqVzbk86TILlWRHElgI0r77bVVhUOWPl5JpoosAlaMvHx2YfgZIMAab
         9elbOhJlzi1A9kqh92QJ/TKg9pgO0PekQaFvBcGFpfbQR3naxdInLFXN4/j8yz0cOk1p
         y4U9tQ3e5LrCqg0lz+bW2TC+gCYWhx5IM3ANBZ7ffmXRfFbHCsuAmzULvIsHsZ6t6EJF
         z7qwHkhKcAj8mGfFiJ3XXQ+V85iCqNnAiYraBHxOS4ynY205Sz0iR0MQHyF5QWZtIwKT
         SsG2KHUwrZeb3WObCSxnRNElheFSUPtjBN61cahZ1xJCjm97AMBqey/8SZXFlbM8+swq
         PBQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkM8I51o8fti3jvNmPjiJMxT2UpFrCVUgzyfr3UeSl7rPfh0Qyf2UJjTqpzQC7l0QbgvFTNnF8Z21ry8H3Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOUhKanHu/iz/qWM8bsklB1EQ73NfC7TAmHmA5uVndab0JAc2r
	tHkoRubbUhlw7j/LFNpCZFg5cnlcv/iioLkdk+oj02NJGbcwylydsb/2aEWbOW5ZG05C3Vw0mpO
	xOPwZa0JmBc6zzQK34B4C6qeediphmAc=
X-Gm-Gg: AZuq6aLja6K5i4zy9vji0ikm+kcxZxL9+Cchau+zw7EGE5rET+dJVrYXMTQizciTgmG
	Fj5/793wsk2cHiZ/D0hUGaUs+IEyHLCuHUQsPelWi7TjXcRWbJ+W6kGiNcaDeJOhvKrs9fY0qIu
	DtB288lO2CrqwJxxm/vW9C3bJaCZdOZzg2eh6LcDdnc+ozk7bYmJdpOwpPd+HXK1htI/dyKY9qI
	u7IWADBhnc+b+81n01e30Fm2jWWN6dviLjGh9TshbrVff1MXJGAfeoIiDxCStXVCr7QMxTQ7WQM
	IXWSXSP50uAW/fk4MHzI8aCDieQYZSJxWo3cOvVhCsr+GHz1sRcCD+2nd/v+HKpSxkNvj2aBCN7
	8gzCQc3KvntlX+H+7bYG+GHY=
X-Received: by 2002:a05:6102:3594:b0:5f5:4055:4558 with SMTP id
 ada2fe7eead31-5f54b9dd693mr1591544137.2.1769220895712; Fri, 23 Jan 2026
 18:14:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-fix-pin-init-crate-dependecies-v2-1-bb1c2500e54c@gmail.com>
 <DFWEIHKOKVQS.1MGF5PHL2JFVT@gmail.com>
In-Reply-To: <DFWEIHKOKVQS.1MGF5PHL2JFVT@gmail.com>
From: =?UTF-8?B?7ZWY7Iq57KKF?= <engineer.jjhama@gmail.com>
Date: Sat, 24 Jan 2026 11:14:44 +0900
X-Gm-Features: AZwV_QjWynEU03j8R2M16ywWXPtNbQBn27OQJikZ2bDm6eRlQhhYf5ziXO3uSQY
Message-ID: <CAGAB6667fm45e9ZNg3FCAw-O_jV3cnK-gGfG=xe2ftPEQHxxgQ@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: generate_rust_analyzer: fix resolution of
 #[pin_data] macros
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 1=EC=9B=94 24=EC=9D=BC (=ED=86=A0) AM 9:43, Jesung Yang <y.j3=
ms.n@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri Jan 23, 2026 at 10:18 PM KST, SeungJong Ha via B4 Relay wrote:
> > From: SeungJong Ha <engineer.jjhama@gmail.com>
> >
> > Currently, rust-analyzer fails to properly resolve structs annotated wi=
th
> > `#[pin_data]`. This prevents IDE features like "Go to Definition" from
> > working correctly for those structs.
> >
> > Add the missing configuration to `generate_rust_analyzer.py` to ensure
> > the `pin-init` crate macros are handled correctly.
> >
> > Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
>
> Perhaps I'm missing something, but I wasn't able to reproduce this
> problem (which I think is expected as the `kernel` crate already depends
> on `pin_init`) with the following setup:
>
> Tree: linux-next (next-20260122) [1]
>       (includes latest changes from `rust-fixes` and `pin-init-next`)
> Files: samples/rust/rust_*.rs, specifically rust_configfs.rs
> rust-analyzer: 2024-04-29 (which corresponds to our MSRV), 2026-01-12
>
> Could you share your environment details and a minimal reproducible
> example?

Sure! Here are the details of my environment:
Tree: rust-fixes (commit a44bfed) [2]
rust-analyzer: The latest stable release (managed by the Zed IDE
default channel).

verified the issue with the following modules:
- samples/rust/rust_configfs.rs
- drivers/block/rnull/rnull.rs

My reproduction steps were:
1. Without the patch: Hovering over structs annotated with #[pin_data]
(e.g., RustConfigfs, NullBlkModule) provided no information/diagnostics.
2. "Go to Definition" on those symbols also failed to locate the definition=
.
3. After applying this patch and restarting the LSP server, both
actions succeeded.

If you need me to test with a specific pinned version or provide a more iso=
lated
reproduction case, please let me know.

>
> Thanks!
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ag/?h=3Dnext-20260122
>
> Best regards,
> Jesung
>

[2] https://github.com/Rust-for-Linux/linux/tree/rust-fixes

> > ---
> > I encountered an issue where rust-analyzer fails to analyze
> > structs decorated with the #[pin_data] attribute while testing
> > Rust kernel modules.
> >
> > It appears that the dependencies for pin-init and drivers were
> > missing from the analyzer's configuration. This patch adds
> > those missing dependencies.
> >
> > I have verified that my rust-analyzer correctly processes
> > \#[pin_data] structs after applying this fix.
> >
> > Best regards, SeungJong
> > ---
> > Changes in v2:
> > - Fix typos
> > - Drop the quote module workaround (will be handled separately)
> > - Rebase onto `rust-fixes`
> > - Add `pin_init` dependency for Rust drivers
> > - Link to v1: https://lore.kernel.org/r/20260123-fix-pin-init-crate-dep=
endecies-v1-1-1c6cfe9aa352@gmail.com
> > ---
> >  scripts/generate_rust_analyzer.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_=
analyzer.py
> > index 3b645da90092..766c2d91cd81 100755
> > --- a/scripts/generate_rust_analyzer.py
> > +++ b/scripts/generate_rust_analyzer.py
> > @@ -214,7 +214,7 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs, core_edit
> >              append_crate(
> >                  name,
> >                  path,
> > -                ["core", "kernel"],
> > +                ["core", "kernel", "pin_init"],
> >                  cfg=3Dcfg,
> >              )
> >
> >
> > ---
> > base-commit: 6d7fef23043553336259211346b6b135d6c1f4c3
> > change-id: 20260123-fix-pin-init-crate-dependecies-b94ac4247a48
> >
> > Best regards,
>
