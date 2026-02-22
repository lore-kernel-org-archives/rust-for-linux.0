Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFA31AA1F4
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Feb 2026 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771783794; cv=pass; b=JNpTejSbwWl8qiS3qTbRgm64UuhxMWUqKZq/bkPneMEGWdHF0gcOcKUzGCeN4TkFeRgmP8MEB58i/hxe9CqQ1HyBD72Dahh0dgQ5bSCCpJqRr9eXaLSqy91M0XPLnIVC2gyS3Zw7XvKtYH1HxNW6YLkfTQnGfHR2PvoYXCxQGmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771783794; c=relaxed/simple;
	bh=+ZLcpx0EeYCuav5+AU0HUoV7c8dGSHXUVko87H7r+g0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0jqnouNql32T+KAqZu1+kbQUW9Tlk78v025QToB4ZIGO9blqvyfQ6v2Ul2L+AZhowa6Eimmf99He7JysA/ivwPQNmeVMr+J23acDnbVbnD8amLAXfCOsKCgEB2IWNxvLAM/DKNUORijF4cldq9YAFrorzjHBi02JKC1eOfe9fE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EDywi67C; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EDywi67C"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so40433185e9.1
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Feb 2026 10:09:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771783791; cv=none;
        d=google.com; s=arc-20240605;
        b=A0O+seA5zc92CPqpCl62xfZxY5aHQyWhG65RLa2Y80UvNfw4xGxrgKvgioFCe0T+XW
         XnJdQqrvLQlCaXk9MS8fgdAwrHZfQDK+tngHZ6d2ayRFTqDRUIw0xMUD3iO5SNR6HDMW
         f3UFss4vCAa0hyp3S7XtVjBpIBMnFcCwGoQtqkwlu1fzJ8DpR99IrVNyQxIZlzNDhE5B
         WuoFjj5iY1kagBU5Y+dtbrejxWQm18JnmpxBpsJLpjr1JQHmCBh4oqxc/WhW1ee52XAa
         jL/qVMrUZl2RkNKYdefmNEKhCPLSRta26op8jLV57ExIwasoyjXn95/DRZdlH9ZJbcEZ
         FzSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0ioOo1oxBko9pcVJkHyQzgZqWkho96JvS59tLy4wQc=;
        fh=jMsejrC1nsth63a/z7MDdJn7OpNLlOvlNx9ev48moWc=;
        b=UgfGFnSQRsEQ2j9MCFjBhXRr78Cme4Rntqe/uExBHJ16x+iNpd3n/bLNDfdw9Xw7TK
         Mi2HsfS1t60vo4kc79XQtRW4Aygd/7WEbux6NgT1Flg7vp3EeN3JzBkVVEzelgqMLzcV
         YsUudA5Ev7kFwCZSP119XRR8cdlZe0zIgASdmFZS0SoPRe/Nh9wrAsiS63RJghfhIwuo
         xHiftTbePgln5GtPj+W2pCR5Tk3JW9Qa8ud27xQ9FjPYJXL5/7r5C3BzDG5TvV4H/i/o
         eRxecJ9Vyjme8tt09xlPHCkDG1drP46YZ5vQAksGbKULsON/XeNZc/MsPqv1bw9lfYzU
         N9jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771783791; x=1772388591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0ioOo1oxBko9pcVJkHyQzgZqWkho96JvS59tLy4wQc=;
        b=EDywi67CWjXEzbjOEg7m6sxY6IyWBLSrIOHjdNShfdqaAe+L9BFRsD0YTKSywZqhsA
         aH2YWbh/gzvYvFtoXNAz1rdyOBZNpkajy0nb45Y0jbahQx201H8tfPyrXOYZ7H2wJMKe
         rH8i17STFWc+U0MkUz6bzIIPeQXbfv1xZ2RID5W1YFpKKinkyqMpwVxJ5SwdRNeq6w9V
         2msgcOcWIAfQ6iUXkzVahD2eEqR+xyWr2sz3w0vUUS4aOFZXD+SUvCyL0RZahrAe2Kzi
         COZzFCOzw/rshuyP3gGpTwc/faPp+JrW7/5ETwfUujM0ZLPzEeR+Y9exd48APST33ICm
         oZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771783791; x=1772388591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M0ioOo1oxBko9pcVJkHyQzgZqWkho96JvS59tLy4wQc=;
        b=KQtHKQt/mEtwZp2eTcYHbA5BHS8slm/fEhPY9oWiHbiSictxh5u7RQNebS6HhMVm5A
         V2Xa6evQGRfUePG+j3DgcUtmY4FIHuapFk5XFLdCIKf71G6K2dEE+5/9wEIx2lDr2kbD
         BJV4cXiTgd3S/abxMHuoernerdQI1m2chXjUAN1wsL/Ypp4F07HxGgapeZi2sQqyOdW+
         2muCWEq7qLk29t1TjCykKBPa4QNQVNVL565Nmwn7q4IuV6crdNBbmTrsjyiVHyKxvAos
         2ekhTm3cCvPaIB/mlVf6Ts9OVxB9yDtoCu3YRdWGABn/Ddkik97E6BeYVmSX1VDCrg3P
         YyLg==
X-Forwarded-Encrypted: i=1; AJvYcCWzV+sjWQbE7y9wb/RoZimXKOMcqXa35G4SNjyK68W3RHpP8FeccKwb1VrkESyxGV27WfnjkKBiHEhZn6soUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzySTogAuqKn3ml+gkTHWJpS4/aDMVUaPhrGmEbUAc5fQlFsAlX
	qm2Y2+EaDy/Av9drXHuUfpPqaoeQquyBrFSkmUuciV0sWAMZoI7t6jIE8wXiceWo60fVXAUrMg3
	cWJubaKlpPUkec57cRwy+fFKbm0LXj8xVbQKxlaMy
X-Gm-Gg: AZuq6aIhFxKRaSfpIbr2RPxtP+BN2JNXqYKl2ZA+IxZ5L9x4e4O9xk9+VPzUw7Eub+N
	vrL2V9W4dExpQJ25lUCQ7dk7b0wKZNtYsgBteR3xTAdrgqMboNPr9xpGiDEIqotd4eiD4Pz+TAB
	97A++k5Ez3IYDoo/QKM3+JLIrUWnB82zov/9+RpYiz/x7oahr/9GxLLoFr8wU3RuAWIt1VL6Pmn
	H/IJ0wOv7K/KJbVUBi+YktrBTy0QBPNsHYU2m3wK3qtQv6m1GTtoevqIMlcoiTFgeF6xOKdFq8K
	x0TZzbHY3KRY9DVgBD8civS9thbJaM8b0xEiwA2f2cZk47md
X-Received: by 2002:a05:600c:620c:b0:483:43d8:8d68 with SMTP id
 5b1f17b1804b1-483a95f8988mr99041605e9.28.1771783790563; Sun, 22 Feb 2026
 10:09:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210090023.2587534-1-mkchauras@gmail.com> <20260210090023.2587534-3-mkchauras@gmail.com>
In-Reply-To: <20260210090023.2587534-3-mkchauras@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 22 Feb 2026 19:09:38 +0100
X-Gm-Features: AaiRm52Q8m3SEnrLH6jkyBDSVsN1hOKBCoLoWD_xybQBz668Fl6X4XkBu3NwbWo
Message-ID: <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 10:00=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> From: Link Mauve <linkmauve@linkmauve.fr>
>
> For now only Big Endian 32-bit PowerPC is supported, as that is the only
> hardware I have.  This has been tested on the Nintendo Wii so far, but I
> plan on also using it on the GameCube, Wii U and Apple G4.
>
> These changes aren=E2=80=99t the only ones required to get the kernel to =
compile
> and link on PowerPC, libcore will also have to be changed to not use
> integer division to format u64, u128 and core::time::Duration, otherwise
> __udivdi3() and __umoddi3() will have to be added.  I have tested this
> change by replacing the three implementations with unimplemented!() and
> it linked just fine.
>
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index a58b1029592c..9fd82c75dcbd 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -61,6 +61,8 @@ else
>  KBUILD_LDFLAGS_MODULE +=3D $(objtree)/arch/powerpc/lib/crtsavres.o
>  endif
>
> +KBUILD_RUSTFLAGS +=3D --target=3Dpowerpc-unknown-linux-gnu

This needs to be a softfloat target.

Alice
