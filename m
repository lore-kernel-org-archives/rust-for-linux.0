Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0064D7D45
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 12:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771967; cv=pass; b=gC5Xqr8R9bwvF7mNB0nhED8E5t7U5ofBwY61HG/dOSj2Uf5kKmBxfh0rc+56uVRLhxjVDzz3cUfWVzejn9vvhqY0Xf6bPj9kdJhxyDOxpdTYPmLqV5uwfeDY3pxMWoAI5sf0t0DxqRkzd9HgnTdx2hjU8XBYUAfcKutOjLYFNUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771967; c=relaxed/simple;
	bh=ggOnnSaPhdsj86dUOseU8Y9Ysz5RAaEBNsyAS28L3WA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mE1RHDd2DNS/y9T2VQKUyVP6KhB3ca3tYYMIMwENEVvIdobnal5i4n46spjRTWRFUMPfdLAqVb5Na+bjv2vYWfhy1D0Tn5DRcMChe0v+mNdAkWNodYOSYtO/hcaB1W+3QJLxlpvXBG01gH2YZsK/Ff0BfGbLLZ+4FiM3HCtsYJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6G5O46o; arc=pass smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6G5O46o"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-1431a73fa1eso354890c88.0
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 05:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790771963; cv=none;
        d=google.com; s=arc-20260327;
        b=sNncerp/AE1oXY5MscKu1+noAZiud1oAcnSitv5qCpNBigXE8BTWiZE7lPSFvrSt2X
         PmUvimGOurjuFrMUEE1lyiUdMZmcGA8wZBeEx9zX1hXEGFpOtu/1CfFcUeoeNDR3IaFO
         ikJ6VYiV4XCWrxQh81nPhVbEEIFa2RzUq5GakFufICpQeO6imHQsEyphTGZuT3n7FVCt
         aGrrQHEgCzoep+jhrKk6YUKxs3YZV0OCbIGmmaRNsti7nS8Pn7FHCVFBPpV1gOTbqb0A
         yUtsjnTpU2NJ9J2RX3KxlilULXY0YHsY8to8PF3PbjiqoNVQ1XcBxz/WjvAbJ2TzhOlv
         8R7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ufPsRVmbq2iTAMU5/0hWY230+5/O8NUpBJI9AxEx5Fk=;
        fh=8TpyjLshr1c4UGexXr8+x1rGjrxwR2jJlnGjQZro3bs=;
        b=R/JsQtdL/NXA7wZJQtu/B4/gp6vUo+47fssPD2+Jqweu6gOGaHyJRvq1Tx+iEcpHvk
         gkZgPNvdvkOKt329C2czekmD29Asax7y+Gse/a+XegkwNU6p4WFfG/jUdknXIT27o7yW
         YmXGh3BM+vUSi5SWEpDyZGLyRIKkXNdIb6ysYDGnlQvXqW18q/iKWDIwPzLB6Y6/NDB3
         gH6QDAfBbM/jiaVHSblWN8XQP1k/6m82/dztETu84uUqf3qkF/BUnP5MBAsOyR4oWJS7
         JI1zr4eggLMeJqMgSrbJ5S8zvOk9iHzonjdlzDpmWqsQ7wRGg48bzYY0fw3h+lLKamEt
         2lxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790771963; x=1791376763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ufPsRVmbq2iTAMU5/0hWY230+5/O8NUpBJI9AxEx5Fk=;
        b=T6G5O46oSkBqmbG75j8aJ4uRWWLkolcFHWvLDQp+WQ3tcKamK22O5VQxwJugk7nYJC
         diLNJtBV9wnZ1546EJQVHc9dEfduhHFVEIPS2SiXEaNC0VQWCFapLk6Gj9YGRvvd7lUb
         FGwNqZwPg1/ph1EL9Aijm42+7sngB56d5HUmvIDeLeq/iLE2yzbNGZ+w0f+F9ps/iBgq
         k7eQmbdfriiNKlb5+8YdGicPoWs+qyXJ/0kF1CXz2yJDGMh2GYAzocr2uhZN71ScQDAj
         Vgccrq3+6BqeJ+Q4rACGr73MddrNUHSsqAfApSv8CdTB9gAZxyBHvMrbhGjQVQePEqYe
         cFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790771963; x=1791376763;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufPsRVmbq2iTAMU5/0hWY230+5/O8NUpBJI9AxEx5Fk=;
        b=rUVCTIUlDzP6KhUi8n9QvaksAlvIf90SMaImAj3GQHyt8UncQP3x4wqCjcZ4hqZVGz
         1ml+rskkQAYpbfnSDGkOP0/aClSCSet0qrF7veqfFgkazBWr7hP+Yy+0KrF+uEBaB90d
         v6jeqBUkV7E/H/+9eE2LVlG3OtmrFxswVqvGfxNmR1pbZj/qJ0zAIMu7SZXFrZJdpEq/
         puYM5pNgI+av/RRYWp68owtFFr9xTuEJ0BjJozt4MuyW0u1tPGvqfFWwdHkFxMm88IGt
         fiCSrx/gIMFuay8JHZY/8wMxctNJ+GqIbviLT6x8T7s28Mu1A0YtYksRSah9YJ2zd6CR
         64Zw==
X-Forwarded-Encrypted: i=1; AKwUvBy1QfkJVBPtTPmV5DNrzTVQEBhflg5ldGwSIw+5qwu++asrPhjhGLxaYOIRN+uKPbjgHb6eMnZrl3uqr5DwCQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIm+W/lpVp/8IAWfpIyVu59gbKpGRBZtNeGy2tPIwrT+/Mi8l6B
	E0ILDxWnlmlnQr8LHUJjMhuO9x16nUSBtW4Q/E0N2SP+p3k60ixLmFmdY7I43+eI0EmhaNoXLnb
	jfBd1wDOEwv8VXGtclxdRYW/ecEcT/fg=
X-Gm-Gg: AYBFou0ZWT4TfRB4RuRibAmFjwIIHul9fpczHcFGeWLe3/cBS0+A5iPPAuVafPpGxQT
	l0WOUYVU0lRRnU0GeiHirYwOZYi/rJ5n4iqeIIO/AxEqjmMXHuNVwKw/892ETVtn/eaZ3cGv/sK
	QvdRJTE/KBh7vWsPpauiam4LBoV0hMaAfaprzz0CW2F/HTqP4iEdpeI1z3EXWjGfDX5xoEWZDem
	E9TBTYUDx3pAuBAP215w3fhk5USPDmrw4qpDHshTBLcGTCUFGDvrk68VDWMCcAIEVO5LvUbbxvY
	5FQOT1RzNcaJgzd/p5ZtCCx5JV0KJYmFN/VBaeAjYL0/ZAta5pu1yE1WY95uKCFk1c7/syAwRuo
	j2lkvA/i1U9G+tIMOuoL0BcBdfXA2Le9vwVIVQVGoNsuHWpaxB0VM5F1yzy6H2cYvddjysASmtW
	z65gpluE3dylC6+tDPFupjlfbCvfvU1jUd75e7kXBBnoQ70H1VdWM=
X-Received: by 2002:a05:7301:6192:10b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34cde6749bbmr2898570eec.1.1790771962989; Wed, 30 Sep 2026
 05:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113192949.689834-1-lorenzo.stoakes@oracle.com>
In-Reply-To: <20260113192949.689834-1-lorenzo.stoakes@oracle.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 14:39:09 +0200
X-Gm-Features: AclHuK-Sjsrg_okIPMKenwQ4dypX-VxuVqb8A4w8gwXJEEOTFm7LvkAnn343C9Y
Message-ID: <CANiq72nHOinPTuJ7NLP=X5tLN76uxzz0k5t4tTcU+pz_JOCPHw@mail.gmail.com>
Subject: Re: [PATCH] rust: fix typo in bindings
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Chris Mason <clm@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 8:30=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> Commit 2b6a3f061f11 ("mm: declare VMA flags by bit") added a number of
> overrides to the rust bindings helper as the change performed in the comm=
it
> caused the rust binder to not be able to automatically determine values o=
f
> VMA flags.
>
> However a typo was introduced leaving VM_MAYSHARE to be incorrectly
> interpreted as VM_MAYEXEC in rust code. This patch fixes the typo.
>
> Fixes: 2b6a3f061f11 ("mm: declare VMA flags by bit")
> Reported-by: Chris Mason <clm@meta.com>
> Closes: https://lore.kernel.org/all/20260113185142.254821-1-clm@meta.com/
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Applied to `rust-next` since it doesn't seem urgent, thanks.

    [ Reworded to improve title and to fix typo. - Miguel ]

We also have a similar typo in the `bindgen` flags -- just sent a
patch to go on top of this one:

  https://lore.kernel.org/rust-for-linux/20260930123645.302318-1-ojeda@kern=
el.org/

Cheers,
Miguel
