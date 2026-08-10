Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8677F38736F
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 04:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337552; cv=pass; b=ZsSA8/ZADuNmvCAGI5beDgyyUwskWLeCPdf7wfBXqzE1uNCl5I8NYr4JqO1l+SuWlCp+npHt7rFAOCxuOWldWlw+NZk8WHR6itqu9XZ2d5U1PrnXDXj/RR1jtYA+4uLx6HY3qsLLp28zVnwf2SeXGF8O+9UuCbsVSQfJetWySNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337552; c=relaxed/simple;
	bh=NKd20xX0FZSovsdwvcQXqqGp0RiwPWTive5SUrC1Q4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKFQVKTfTH0QO7/gjzBgaEUrsPF1l4biZD1BY4WMMlResPT7/gGe4Nwt6FD0OWUEcUp7PjlvwUUYG26DEgWNf3723ciLAwE8zqTZvSkE5g034Mbyn8XhZWwSU6/NFdr499YKj2b7Uc+vJHRpjL+zI7mX/aF12/MhY229HFflzlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pouwypRs; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pouwypRs"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d027b7c8easo4391545ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Aug 2026 21:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786337549; cv=none;
        d=google.com; s=arc-20260327;
        b=Na4EzgmdMRqiRzqZmBZF+mUMwFbSQqeO7zKCKJ9Z2NxRraiwvna/eDc/eaPI3Jpgka
         2T2N8I8JnApKkyDcsi6tbxet12s2Gjq3Q9C0KO/W5mTxOrv8DrFilmrKR2wIAyMCEokj
         uxOGt5A/B9FGNp7XP9Sond61Zvd8forW92KHEi6F8G1zZB/yRvHeFyOe+8VVbAxuwlQj
         GNRgcsjAJ8Q5xjxKHMj8LdENpAq2a08VAy2yOZdzB5D2q6mcLLUj2QuJ95Tc3V041zYA
         1aOuH4AqtSa5SUg01GxAcd92r5w+KIQb5hr3A1Xtce9kppIiME0xSwygJ6dm9LdIoAIy
         jWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jbFiUObY8txZ5MpUtLKJuNDIqCjkJSRHCNzfg+qLV/Q=;
        fh=QH1VcRo7kdi5J0mpBTVgTG+zVka6rcF/+QwYyTzolU4=;
        b=p8pKy8i7LC77fPDTCcrWiiY3LfL84kO+vL2niifyPk2N2hN8OKk+d0NSAsYcnfhREz
         kx4VCsHWdy7UXZLkNmHA/Cq3hCQajP1sw0H07HJSxoiMq3QaDGZ3WSc4IwhNu2CwysHn
         0YMJ1a3WPOggLde+Yr3ZPeZyLy1+GPOWIecaFOTWIRjg6M36INDkKYDtw+f2h5UCWalr
         eqDSFLlZKeec4/X8h0kA1+esER84AD/TPX/qSb6YAV9jowL9RLGFlb6MNE5WOG2o/yrn
         gR4/4ZF94sEg+Xm3hXMmzzsam0oNkln/Dc+BtfKICcN4CP/3aFj0Uk2BSa66g/lh6GEu
         4/7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786337549; x=1786942349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jbFiUObY8txZ5MpUtLKJuNDIqCjkJSRHCNzfg+qLV/Q=;
        b=pouwypRs1LYqGVXusqB0e/OCuDkecH06J+wh5fH4vfJsI9Bhgw3wi9QQ6KDr+9CpqA
         vudT37kylaaWvNoGBgymDyU8wNRPwt48zb3Y3ZByuDE1z12fVQBnvq6JteTv5C8R0fV9
         ZvhXi9FevJdEKU+j3RM294BMmEbuLi6p12eDWqvwb32qXDapLD/569t8rjKoe6dutWDE
         O+GbWWRLfqASdD5KAXSG09bESGykqbMmLmM5q2yz6awPrShi1RBDsYBsLixBwPQedaK+
         tTRo/5hogRk/GFdRssnNXmgqO2jHXXhm3cnclwVzEcX1gq+pPkCuNTQHgmpezpeN/61k
         Dyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786337549; x=1786942349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbFiUObY8txZ5MpUtLKJuNDIqCjkJSRHCNzfg+qLV/Q=;
        b=XAhdm7UUyMcw/NWs+wKLQDXQ3SN5ewRCpBb6g/TNoqk2cpiibflkOQUxFqoNPpc50N
         YS4Xg5i/Ise2Yv4fBtVO5VGFXt5IkKX0RzFbONMo+RfA7JuTv0RGtYtAi224KFr8K8xy
         UchpBbPcut+XcGWdejLpJtHWH68a7wbI+fRWnZ2DHf1KYNGOQZkTWT5314RVPx/1ivyi
         jDMpjDX3943+BZqoKU6raV3yW15cw+7oBrRvj1GfyNt/DQ48QqaItx2RlA4UUXaPGiuA
         0YXWhU8dIscdjnPwBYLsY1TaV5c8KHGec5iBguuLifFhIbfECYdPF4KaYBSQrWAVywz8
         bGdg==
X-Forwarded-Encrypted: i=1; AHgh+RrKnveF9+BdIZwRjRvtAaw+Z3LdVFIIHT9lIr0DXj0pAgz3Cq9L6GymUzilyeLkCuFzLUhymww+gW88k1E4cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAYqoEm3HAxEtwYScwczALS7Xp/tPG8Nf2fHWG2IVkA3r7F9nb
	M+N8T5pdokmXLNRpZOWyCGQ2p8osYKyk2QnCEENYv3mLli0aOoOrNDhx7fQSoHpONJSi90noiTM
	qXoxHZVFAf/oE/U5z2zrYLj6t8NYrqJs=
X-Gm-Gg: AR+sD12mMl7eHi9jo7BdBor/BCmLnrZHjYOsOHjBF+8QZK/Wa1sybxKAqXOk0iA9vRZ
	h4HV+pgugwAnio5UnCGJsvkyGJQ5h3EVyCjNYItbA1i6nNaqTxnLSa/2o5rGfGyf4qFPZpfqmxE
	3OPjkINJdurtCEYFLspFGZumiIy2HLvulZJUyfcbimBli679f6AVoDFEv/1RTyR1CMCux9gEPiU
	pwIEyIiDYyzX/XjpRpg9qHua/B90V7ZjLvl2DcYSlDNms3FTP5IPkbVb3XNGHtFz6TwNyrkYvUR
	13YiQ0u0AGHa97wqqYeGdD6KOKurDgD/b2Qx2BpD95uqc8Viy+IrQ4nglhdIVIsuu4Tl7jO1wvw
	/TYdJKyAyWMElXkMDbrpWnR+keoTF0WEgbQD+V+Y9SM5nUhmVcA1ZxNaK5lFr
X-Received: by 2002:a17:903:26cb:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d0ca35c5a9mr315476065ad.0.1786337548777; Sun, 09 Aug 2026
 21:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805190012.2934907-1-gary@kernel.org>
In-Reply-To: <20260805190012.2934907-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 06:52:15 +0200
X-Gm-Features: AUfX_mxd43ToqpxfGTvErkv-i0xDwdMfWCtW5hRjzZ9fCmmq2vsn5Qx1rnkmP5M
Message-ID: <CANiq72=Dh+9gcn6_fA2zPv-xsaRzRyKfBRLHvO0wn+G7mbr4Fg@mail.gmail.com>
Subject: Re: [GIT PULL] pin-init changes for v7.3-rc1
To: Gary Guo <gary@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 9:00=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> Hi Miguel,
>
> Still more of refactors this cycle and not much feature updates. Tuple st=
ruct
> still doesn't made it as there are some complexity related to `#[cfg]`s, =
but
> the cfg-related internal refactoring are picked so hopefully we can land =
it the
> next one.
>
> I did a late rebase today to rename the API based on Benno's feedback. It=
 does
> made it into today's linux-next (2026-08-05). Feel free to wait for a few=
 more
> rounds before pulling if you see fit.
>
> Best,
> Gary
>
> The following changes since commit a13c140cc289c0b7b3770bce5b3ad42ab35074=
aa:
>
>   Linux 7.2-rc3 (2026-07-12 14:16:39 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/Rust-for-Linux/linux.git tags/pin-init-v7.3
>
> for you to fetch changes up to 1e26aea0355ad2afa1ccbc62885c01f5bcfc58ca:
>
>   rust: pin-init: add `#[inline]` to small functions (2026-08-05 11:36:18=
 +0100)

Merged into `rust-next` -- thanks!

(I have reworded the merge message to wrap and to use the single quote
style Linus expects for.)

Cheers,
Miguel
