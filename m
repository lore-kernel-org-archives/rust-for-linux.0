Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1FD39D6DD
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 06:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780036371; cv=none; b=fmDHpKmvv3/40KQpzQ0mo7+woXFnV0bMv+PUas0WChQCd1AK3mlKolECNiFBSc6xpEyIEgT1iH/w/NEWgLgIBelCsJpHyapwFvXN27r+i4DoBt4RAX+SCj81o6Yo75A8HBSb4Ao2Z6zW1IH+bUuam1SkfbOMC2wQJEsE/MZ1fSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780036371; c=relaxed/simple;
	bh=1Ac+5uIaszjTdXeXl70hvJYRphte1CL/Kiuce7KK8/k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r8q9YhUpHIpDnsgq504uORlDQrhfWfRRsYTcolc5qXBH3ovzeawwcHE/vE0ZTTLqHYAPUAcuGjQknmJNH48Jf+HoOmde7E9V8Q4PzTA5rizNxHaCHyjlErbozv7tyOM/K2RoqnOqLSwuMXH1Tij1Yo+KzyieOVRYUgN1anIm7tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ViCDDk83; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ViCDDk83"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-680308c6c62so11598941a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 23:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780036369; x=1780641169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Ac+5uIaszjTdXeXl70hvJYRphte1CL/Kiuce7KK8/k=;
        b=ViCDDk83xs493uMRyzR+9IDdpBEe3le3HJL2r+QCoY1h6SyYNms7H1pAq22hi6mc3T
         oh88pGt7lb11/aPBlTz6s5xY87S+YHOaK66leo49pQGl3H9dJ0u+N+k1yfLV8g+D/6SI
         aEpJsrbADmFa1FU6ANH5OcrAl25DEv5PEP7YyL1N+AVFEMj1+JJcAjMOuOz5ATqoJd0m
         7Qca45Y34BfU60hi/iNSLahZulHK022ctuLrZ3ja00ey97ldEBFTx+fFxQtM5H9WqGcX
         0V4cMTUne39T3rVR6s5fV3CJpIWPD8IbZ9rOe2F2ezAFQEZjPYgHSY1rRItL1F3sdScc
         qzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780036369; x=1780641169;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1Ac+5uIaszjTdXeXl70hvJYRphte1CL/Kiuce7KK8/k=;
        b=XCArwDZYvngxfRuYvl/f+/RvcW0lFa4yGP1GgdSC2gYTWjJfaRMYZXElMrWyso7IHv
         zUSjtids8GETxrPn0CL06wCgnqxsGRI8KnF2MJd83xiWdHLwuNINsIqzwyWW/kocRCNX
         1xntjJDXu6mwm5qx8pfGh4yhU0GukTxZ2rx6hfUDzb09NT4Yql/5xgpCDH4ApaZkSAiF
         8X/59hEh2aXdwB732DEVTR/w1WFIoRN9hTBukriGe3+EG4z+bh1nPXb5D1Q9HdqRjuYK
         LKoxCc38EqkkpAH3x1rQ/hZ1BUTYBEggvNB0BBlla2bGzzC+s7fCNHcBtS22ZShXzoOi
         IUUA==
X-Forwarded-Encrypted: i=1; AFNElJ+V+t7XTRCnpLlovS81tdmpIBqgqf/G9dtoXNYSgRiNu5PuYfMv3F5x1kxI1faTiVAhuVlR9D+iq1+jhBGdgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0I8/UYOha9FY9ejSCxO0h7q8/1OnGZVBR/W0ctZXthzX8aff+
	EcGUtsXGbBXPoPI6tgzLGM9dG6oeznf9ZSb1uWTjxbkpLAYhHe+tnSyn8v9bphLeVflFfMIkehf
	LU+68dztOFWAJI7rlmA==
X-Received: from edbev9.prod.google.com ([2002:a05:6402:5409:b0:68a:ac9f:e69e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5113:b0:689:bbd0:45b0 with SMTP id 4fb4d7f45d1cf-68c10681fd1mr663109a12.9.1780036368563;
 Thu, 28 May 2026 23:32:48 -0700 (PDT)
Date: Fri, 29 May 2026 06:32:47 +0000
In-Reply-To: <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com> <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
Message-ID: <ahkzD01e14wOTNBk@google.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, stable@kernel.org, Bo Ye <bo.ye@mediatek.com>, 
	Isaac Manjarres <isaacmanjarres@google.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 07:26:07AM +0200, Miguel Ojeda wrote:
> On Wed, May 27, 2026 at 8:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Once the fix lands in rustc, this flag can be made conditional on the
> > rustc version. Note that passing the flag on a rustc with the fix
> > present has no effect.
>=20
> Already landed now, so if the uwtable one is enough, we could already
> do that since it will be 1.98. But since it has no effect, we can keep
> the fix as-is and do that on top too.

Hrm, is there a way to perform the version check in the Makefile, or do
I need a Kconfig for whether the fix is needed?

Alice
