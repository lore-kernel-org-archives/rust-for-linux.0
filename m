Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441343FAE17
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 12:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777467127; cv=pass; b=Uu+RxhReOBDm8MdTao7bPzNMFethEwtnJ6OpIKizL3YUSQXKRHUndE2YUSaJ5lMjNqiHkGnix7MUUUUbuj7bn6xeOjAom0HFr4mDWVEYFJbBOXdDXJ2rZ1b4ikgtcSBSqKqb3iJM8rcHyVphH0gdVjqCzB7Y4bWQlcxMDHOZTQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777467127; c=relaxed/simple;
	bh=E2TZSITLTsrNHHdKbUhVgqhN1rXI3sRd8ys1HWWOTps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/fChCzjP8ajEEVIaiEV7kzhmtJWBPhtCUenicqr/ojYEkcglY8FnLW3ViQLcJi3wBSqVVjqdWwWx/WxQtYdi7XLWmtqpGAyQx66iXyXlCh38G7qeWzar11cT8HWbAT/cSSG/n9+mM0CYVrItuY+K/XfwMdKOR1dpefN7JWWaGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Exc2au2I; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Exc2au2I"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2d9b27e4aa3so786731eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 05:52:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777467125; cv=none;
        d=google.com; s=arc-20240605;
        b=GOhQdHJrd8KUSyohr3WbT0EXzNAunJRt9czTPNXAEjVASFYJgCHhU9dVtzhnWDtLbf
         aYMWrC9kpQDhn3+BuwvGww6PETD8Af9X56JE4Jyyx/RGMzFEC8cydmmoEn1wSRHVZRcM
         s37AtY0z7U653ZPrNQWc3Q4vC6Icy/Y6+T6vmvE0jMR337lbnW1cLt6th3RodXhD65Lx
         RoaFIyZAUa/7WUnNYf6WcDZD00rVeMF5ZDGON3s+bzK+uiBkYasv24wv86xD1Fzz+xpV
         0WKMZ6zbOvE1zGm46vgscLchZrCZekX8UvND/FJzqz4yqkxoGDXxpOVN0ieNBcfEOfLM
         eCIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E2TZSITLTsrNHHdKbUhVgqhN1rXI3sRd8ys1HWWOTps=;
        fh=6W2W2/97UBNkzJL5CGkQ5xJ5z2oFBM2cOI9lHB0MMzU=;
        b=FBVZe1zkNApZE423F0TeDZy2aiJjn9HYGiXYGA4naJ1TaxkUk1kTQQajvxmDYv1LKA
         DEdnv+ygkB56ABj/FTFdnwYMYYkL3iTkCTrlPXrQ3QQDzYAzyVy7cDtF4nZeyEiJsFQT
         hetguP8HKDnZNp/2XgG5BKEvNH71aI0MMxZFPf3BiU4czdUAJxP0dOKvsfUGvZ3ik9y9
         C28RrHSQZKoPo+Cs3UNGV65YKYYr6184GCB6VvuBiYtiJ9n3cqEUnBvt8CpQpOrv226r
         xL7202M9rdfpz6ohQoLf2nBksZrhjaIzi3WcvBhprGDdEKeTDx/vjXQ8cfCavVhSPjUk
         8v0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777467125; x=1778071925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2TZSITLTsrNHHdKbUhVgqhN1rXI3sRd8ys1HWWOTps=;
        b=Exc2au2IjXUXElzV96a6LcTDD1Urzf8NzV8winb9/gMwmun6+NAmS1U9j5nJ9O6Q4v
         ZI+E5xLSf+0CwlDeJYB/1IfRfEmQfs8ughtXYP7KrbSwq18mor4C6KJycwchKgid+uRA
         hfJ5fAxyyVmfndAqT4huf/lCihzpoMdjmKy1Wyh7NoQd+uiPwIkuLObdsk/opjON/4Tr
         xEX+9a0s6S8xPUiONLuSiflRoZIrYt8uuKOK893EWwCctjcT02tA4yWN+9S2VkP7WW87
         P5zx42cdpk5EYgjPEeH19dQlHm4BRdwx1WjNvJIYNuZ8rU7rkrAZUFcmHfeeAKX33nLz
         bVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777467125; x=1778071925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E2TZSITLTsrNHHdKbUhVgqhN1rXI3sRd8ys1HWWOTps=;
        b=KcKgNLa0r0Uuz+6qIMSFR8iKJM/nXjuW0PDkwSkA/UBCzPrV/giGMcBN56kuKNLlLH
         /S9uxsUglKnPTllxRz/gaPHw6z4epR17+iH8h5FFuYtrATZlrSHTUt9dOzPrJKX/7Fn+
         1vIGcWOKWVhVFxBNs2Ws04XnJspZad7VduRptsneVcQCU57LhMpd4pwLOiQKE4LOwDqV
         8Xd5yVHOovZ4NLtLZ+6i9x8D9zhFNapfvks/XSSsjDg+tBi+5sBe1qPiEcLTx3RjtJPs
         OijVESwNRE/udCzm3jEIzFBcKo14vWMAnARrd5dfISCL5sMt3juONHZkzQbOf9O4imNw
         AynA==
X-Forwarded-Encrypted: i=1; AFNElJ90NhCYtbIH6LIc2sZVPtcmetX8OTXC5tQ6NjjJ5zElE1txVenxNj7Kj1qdfTdq8fT3l9mtDI9Td6IdRMa+Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOY4Jiimf0JckrSiBO2P69VYdO9v8O8I8pKboMUDOh95Sd/cIB
	inkIV4g24je2nt+jK2vmI5PfFGzj4UVV1VaJqvuEIaF/aljoARCQP3NYC4Uz/tkPs/nAreT2COO
	Q2ziiIp58tsq+Dsa70Ehs982Vb0o7R3s=
X-Gm-Gg: AeBDievyyk+P4AGUCU6nPOv4QeqVYHbm9uYwMFAeSeIOPd0LfG6/N5dQlSikaLOEef7
	/Lgxd1JRgfUEyFyjsEur6tmqWzTRF7o55EXQSAW0Rp3MB9+Mk0KX9JISSm8B3dPsiY5kbu8ADrU
	ihGsQhnEHhFR5FXbZ7TYuDWpsMpUHbKUPvBPKwl5R+jMrTqGCRC4K25AEZAvWCleiMMWJFRBJ/k
	nImsEZqhtaoJyr8oAxoUIjXhH0KEOVDXdVUcz2lg2pBqQJQu8oAM2rWssoDChNICxM14eqQ1J0p
	kxdeuf3PLgKw8qTOgDCWoNAcpFT1+vnc2iwwMgmnWBaKDjExeVnKULuwRyWhD6KQ2J+IBPiJx/w
	cHUg7cVVWMXmnpaVoCXm/MeXiffdIxHBgMm9D0YZgIWTU
X-Received: by 2002:a05:7301:fa0a:b0:2de:6c38:707a with SMTP id
 5a478bee46e88-2ed09bac677mr1577805eec.3.1777467125286; Wed, 29 Apr 2026
 05:52:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260426105932.2270364-1-mkchauras@gmail.com> <20260426105932.2270364-7-mkchauras@gmail.com>
 <afGUgjRQJgu34Dfh@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <afGUgjRQJgu34Dfh@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 29 Apr 2026 14:51:52 +0200
X-Gm-Features: AVHnY4LAv2pZvQgraP8cIf9jLSC31NFom4mG99W3yyif_zP68nmwU1vFvSNRIOU
Message-ID: <CANiq72k3X34X_fN8cOyE_XWoGF5UQ21FLhxrjZ7AQKWe1a2s0Q@mail.gmail.com>
Subject: Re: [PATCH V15 6/7] rust: Add PowerPC support
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, fujita.tomonori@gmail.com, 
	viresh.kumar@linaro.org, prafulrai522@gmail.com, gregkh@linuxfoundation.org, 
	arnd@arndb.de, tamird@kernel.org, mark.rutland@arm.com, lyude@redhat.com, 
	lina+kernel@asahilina.net, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Link Mauve <linkmauve@linkmauve.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 7:19=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> Upstream Issue for powerpc target.
> Link: https://github.com/rust-lang/compiler-team/issues/986

Great, thanks -- linked from the PowerPC issue:
https://github.com/Rust-for-Linux/linux/issues/105.

Cheers,
Miguel
