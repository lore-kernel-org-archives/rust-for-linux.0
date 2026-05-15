Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4EE38736E
	for <rust-for-linux@vger.kernel.org>; Fri, 15 May 2026 19:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778872065; cv=pass; b=FFuR+gZ0AOeLMCn4t3ghZR/hmGHmG3dmCy/AHvvU/jy+YCb9wSbbhzaRvB3uMkwTsJUj+oRnSieb7FEMFX9heC3/fv8VIfyO7PQwmFdLkvdFOAXShzH/BvBgAX8NhotsEcAeTMyeiKZMlyZFjEJR63lN00eLfMDcKWlYa4QulS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778872065; c=relaxed/simple;
	bh=mb1275eXwJqneXc4dEDy2KyI4gv+gxxbGFakf7VbqpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gl+3DFluZmCMNE6l65rUnEXHWp53dmmjxIgZZbVmlvpqV7kmGzs2d4FP3kcnFyVNQN1Lj/pdCuWmvf0YkTKCW2Icyql5I+4867zjUUXx8ydVc2MSY0JzTONjT/Yk+REXQQl14J0Uvw7UFpRDQ4US9WZmrvtomObgcLwh0+N1evo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=soRkrA5g; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="soRkrA5g"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-130a1776581so12709c88.0
        for <rust-for-linux@vger.kernel.org>; Fri, 15 May 2026 12:07:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778872063; cv=none;
        d=google.com; s=arc-20240605;
        b=O509+wIjqNX/o/1Rg/sWR4lmge8zZQ7Pod4ou1JF4eyhpU9YDAWT20JbVcYWzu0w2S
         34qUAtYOrwKlX//WslE7OnmY5upASYpTFEUsqC3nSbTAeVhKUnQ0GbaA0ltGaonyxAmV
         phDz6W5TdihDgskd0OF1X9nkz00t47y65rdgo0qvXx/ysZ/ATmpxjDi6Z6BchVGTjKld
         uWBR6iX75AAl46/b7Pw99WCcqMDt5UxtrD0xFvPML/Mv2mZ3MwUxM7anZoNoQA+8VRGD
         +LeamCrMytMktqIW5dyI4A3RTgENJvriX0XYtbrBUubEQQZPG4wgUIWtIg36zpU4xRUv
         LCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mb1275eXwJqneXc4dEDy2KyI4gv+gxxbGFakf7VbqpA=;
        fh=j8hJ7txlCTxFCUUXasb6f+glFl2xwb02SEgDPNCmijA=;
        b=WvtXyNEOhbmLV9tgO8oeUc1B5mjfd+h/PhQR5cKPAhftsBDVSUbYu4oi0FLInGkvnr
         ZuuLvKBdZqB2bbPEU3CjdtS2gdrWQiS0xRGN+8EWE5u77lwG19wISXrONLQvK/vIt44j
         h8Mk1wA+1C7qpanS/F5bIeNuhCHLD+IYqB2tklRec5ct/GSmat73JrQh0dBnB/MvV44r
         vkfRJO03e/ZDdJP4LrkRCu0EMSFJqTzq+0YnR9J3yO6CXNXO6dwuH1JZVW8xcWHDxQAV
         mvxtoIAwtQ/40JjFTedkQbtr6uOIytX4c7eut2uL9vSNJgZ02M+vJ4PNQ9YuplWlFqs0
         61Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778872063; x=1779476863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mb1275eXwJqneXc4dEDy2KyI4gv+gxxbGFakf7VbqpA=;
        b=soRkrA5gqFcht2XAwrqu73/RTed8YJULTo4SxvZjKkN02agNPNmLFsl52dQ/SPpCzU
         I+fqjUr8FmXq1YgJWqx66UDnWYvfxTHbL/xNFjpQzaIL7ghfGPD1KMb9PQ/76V7r44MX
         SNid/uvUtB4euuv1C2xbCY91SYg9owBInFp6C2TJ8MWkKA6eTrg1yrL0INMuIWR22zxx
         9bM7pQsDx90w/Q1kqfdbz2dHo8Z+RwqCWTRTfIu3cURdN65Rz/G0Ojzk6wmVKCOrRkab
         QniCi3HyJv1zO2MRbYHYFsT13fFoYYq7rVMY7idAkOdhEGA2JuXXjQcyGyzI01YO2k1r
         +uVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872063; x=1779476863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mb1275eXwJqneXc4dEDy2KyI4gv+gxxbGFakf7VbqpA=;
        b=gsW5c7ky3uHxaMf2w+HDQrX8oGefTWwPUcrP06BI18ULzL+R89bcERIhQId+Cp8jhG
         wz6/qt/pRr048Ax3CjWuLzTJvG81HBmE8mTGOpmgYl8ukpllSx4YLqaIrtvyaN3f9Uq+
         ox/taFe+CChJX5WQq0Lzjb3rilEStB3zaTtNPp1Tk9KRwmF4H5mXdh23B5wK0pJbrW0c
         VkXTUNx3X+rJ9Ludm8B/lYxWIM6ECj6h3mBlvTyGcRkMQoPhElFWDMNTfR3UlADZZtIU
         n/7gvpD2YwAC6XTdqNfl2mDpcQo8RBRNhx6JAYQRsXubMpYqvGcxTpQRC0179Bf/iMYb
         0Ztg==
X-Forwarded-Encrypted: i=1; AFNElJ86iN0pRPQh60Z5HViXzZIbIEYFWW5azvwmJAZs1D0T0SpnT0GEy+QwxoSeLSDH7ngMsloCapOVcclQw5ZcgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi5vatm1nHokIJTL4t5Bp7Y7YVdt6rSIThY4YMtqPppN6e9CoE
	2n2Z4HGv7T31kWBnP5HqNiTvoxZ5AAIKrg8Zlgopr76pldGci9OBibsCu6suH1oe03BvTmdi2UV
	WGTYbzVOd9dMUIa8Fc35dhBoIRhIy+CY=
X-Gm-Gg: Acq92OEuDbGvSnwdgXJgIR2FDh1HBJan9LlBT6MlIQDfpTCuSb135Zgv/QtxALVKepJ
	sZe5Mk9eQ/XLWfRCf/syPQUoHwo1wfX9xUkPY6+abLuOdGIHDOzzxgJPr+pbldDSahOCNSG0we4
	+l2yb8LEVcty4udd+OQjs0k+wrLt+CNaI96xGh8FttzL2zqwTYEZMR4JiMlh/2Co5RCJyO2nEyV
	OWFZ81I+q0DuTwcbJJykhUR3iytwDOGA3HjBwsBBvIwHQRLvRrSEN7GM9xQu/mWzdsKzvKiGpdJ
	xSoptVcuUJnxcGd+xDT5hXWY5gjolUxWRPbV3cda14hVahkBBRHWMfwrsOc+4B3UJa3iwD1R5ua
	fyqMBhcl7u0Dg9xXqye8CFGk=
X-Received: by 2002:a05:7301:6785:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-30398176f35mr1270947eec.2.1778872063122; Fri, 15 May 2026
 12:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACeWta-RVTqcmLVmLTJ7yLrStjrLEyL_oYpG8QLAcy7sEyKmCA@mail.gmail.com>
In-Reply-To: <CACeWta-RVTqcmLVmLTJ7yLrStjrLEyL_oYpG8QLAcy7sEyKmCA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 15 May 2026 21:07:30 +0200
X-Gm-Features: AVHnY4LEIX3vOzKlV2ckoEdFUoIObrLviqRMWlwHLjWbRjHNlz5QC0VlkWAildI
Message-ID: <CANiq72kVzYdu+74M-VNSRgq53n201qjoOaua1K5S4abDqrsn=w@mail.gmail.com>
Subject: Re: [PATCH] rust: cred: add safe abstractions for capable() and ns_capable()
To: Arnav Sharma <arnav4324@gmail.com>
Cc: lkp@intel.com, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	Benno Lossin <lossin@kernel.org>, oe-kbuild-all@lists.linux.dev, ojeda@kernel.org, 
	paul@paul-moore.com, rust-for-linux@vger.kernel.org, 
	Serge Hallyn <sergeh@kernel.org>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 7:13=E2=80=AFPM Arnav Sharma <arnav4324@gmail.com> =
wrote:
>
> I don't have an immediate in-tree use case for this. I'm fairly new to ke=
rnel development and was going through the existing Rust-for-Linux abstract=
ions. I noticed that capable() and ns_capable() had no safe Rust wrappers a=
nd attempted to fill that gap =E2=80=94 I was approaching it more from a "H=
mm.. this seems missing" angle rather than "Do we even need it". I understa=
nd now that abstractions need concrete users to justify their inclusion, an=
d I'll keep that in mind going forward.

Yeah, in general, all kernel code needs a user, i.e. a justification
for it to be added (i.e. it is a general rule, not just for Rust
abstractions).

Please see https://rust-for-linux.com/contributing#submitting-new-abstracti=
ons-and-modules
for some more details.

(By the way, your email uses HTML, so it may not reach the mailing
list. Please use plain text instead.)

Cheers,
Miguel
