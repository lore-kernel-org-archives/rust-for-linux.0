Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5924D25B1C7
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 20:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770322545; cv=pass; b=W05qHWjmN57orOxVyxnyDrRhT9IxRoOgxLBFhLRWTPoz5ZVhtKpYuYLFGopqhfBFLVT7PDs7VNPm4WUx/r4yE2X7VmoA4Yk9Y57V8NF1XZlyxSS2Tpb7IeVG92CQOc/AJa39/RKufGwcP/aTc+98+ouCV4jGP0TjQwcS3mAlFnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770322545; c=relaxed/simple;
	bh=cvmMOG/Nbs2y01Em99NJUpodsaB5RsOB6Nm2Q6MYBKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYbfKDbHr/SDQO10UuiIzG+KSrmbpfSFrHrSiIAg/Fcm1+BKtE6TXFk07/vCWNMPmrIggo6DrAW5ZQcOuomFb6u5VCizO99yC7y1jG7kH7rbrkceAuGpYsAlHZgVia2i2HCqOD4S6T0wi321cmFDLNWsDi9RFXJ8tg3zQNLOpNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkRbydmW; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkRbydmW"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b703e04984so168900eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 12:15:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770322544; cv=none;
        d=google.com; s=arc-20240605;
        b=IZYQcIwtHc+IPbj9nfeXAJ4tpRE5rRsQNIe64Kf5ykErb4hchkAtie47xc6vAT0b0/
         nCn9ED6iJbcDjGWUJ6L+HvP0FuPV/GAMfQag8DnWTO10m8jQksqb7RjsqYdyEIaVql8i
         sH8EAavbe6tE8ekD0xYboE8l7IGarPyAi1D1t1o8DeT/wHxb3swfMQ6wlCOMBSntt80J
         oFcMwpjGoy6DYLhrocsRt1chYZiZYIsaNhGKbMZQqn2rNmrfzDT2+epKWmjpjq9loYhb
         zopFiIvbWcokiZ98f9bLX4m2MoA2tcin0UPjJc4MWUvpuuGOizQFe+vOENXpZZbIgHI3
         i3fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cvmMOG/Nbs2y01Em99NJUpodsaB5RsOB6Nm2Q6MYBKw=;
        fh=bcfqkSMYVinj1sFChcfRUzMBeFJKMWXYmMlQJ7csF5g=;
        b=hBAGZs4MUFXE+5VYEKK6kamyam5O1xcfQulTGZ+DOFVEZHGxaUhHDaGMvSvKN0rXpV
         Xo7+tgzuqIVOKUGkI3Ddg541QRVacXfU/2sENzSlEY2IF/khuOlHxhT34mYT++PRW4lz
         DB+3L6muq68EQHQyQumxhwEsZNhOVeSDhcOMbIu6U+H6AxVl2ygADQkEIMwWZ1I5vmjx
         0TTq/RPdIZiVHEpVF+y1fBOW9QVJhrP5EbZOUOwTUEhZECF1xkP0sfJ2D/oj6Cv8d1kk
         qyNO9dQdgCD+63GGIpYo0rUCkOMD52bqWbucq1GCaU4B+JP5Qp7oDpLJMiI7IkGTycl8
         1S0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770322544; x=1770927344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvmMOG/Nbs2y01Em99NJUpodsaB5RsOB6Nm2Q6MYBKw=;
        b=SkRbydmWc40sUZraebaYWCGOsX7MAxsD/UVl1MSQbXWJ78XVD0xmQYTgGf8ixXUGz6
         uJcAnntvcAil3yZ9kfyEPQPrHsViLBpiwkp3T1nwWPKkWoua1sGxQp7MvEckBW94VTyN
         qGO/FjxlrmrxWPy62tZnu7W7c3AtXJ/Fbd77pToG1TFNRDiRuJceHpraT3Lozv9MIHgG
         Azv+/X5vTMn52uIQLKITWNMNdILpAkLpHVAeMOFmh3ZM55S2rzlkzZo/chUv5+HG+Dy7
         wTrOK4zjuxg3eOM0uVp3HnCVt+cbmFy/FqLU39ewN2lqb8wKU00n4Uotv7raVp8suw/Y
         FSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770322544; x=1770927344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cvmMOG/Nbs2y01Em99NJUpodsaB5RsOB6Nm2Q6MYBKw=;
        b=fXRE2VgbtZriZGzpoxbF20cGOKAXylWTcrcIaCY9RIFHAbedtcK1yskv7XW5Aj6QlW
         qApJIT55WC5bBj/hw+chPCr/0zXfZCodxJO0f6vuBx1JfG7k/i3WpBNJuQGmjIuiZlTG
         YyMOsxNk3t428QonSZEyklGTthjTXrqm9UAGh9qjDkIMcHMX6POVDae3WGpvrCdMHJAM
         Ed9ifoQ/28wW0iSfEHCljprRKWU7o/SsgPlXM3tcFENLshhbTWmHXpXb84Ka+9493NFi
         xg4eN5tDuNc+xjP3Z/VnFhttvU0rWp86TVvdKe/EgA/aX1ZGyN1jwlYWK2og7dXbIX0l
         MqYw==
X-Forwarded-Encrypted: i=1; AJvYcCXxpFviKfhRFoh2wOOXIlxdsrshYyHDXi2Fc2BZ06sOTj2CM+YqrxjW/piCWwnCyg5daOQglPzLm1g7+LdjnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnDcp20vGAmU8oHegoejID+8VC8YWtxiSlmD2wdHRmr0Z98dDM
	H8uWFdJFfQuV0kNR1gaVLUDhjVF8/we11KLC3ijK8ZW7BTKbCykNAGhFw+dgc0D5F2WGfObjYKS
	4D1Ps9DK9G5lyz2CxaXxNA0vXnLcQqMY=
X-Gm-Gg: AZuq6aLPingP3V3O/hPRe17dlp09cx64st+j0MWqnjIC5d350BujgfGMdx7O3VxhjKp
	ABef+tiBrW4tE0gnf0XRl/vCM1WU1aXglgyu+CLNUQaR/U23J1RZAin+9H/lHh/MTQpO6dpYt2m
	+FewMC+0UavIyGwNq/f0p5AHc9zSorEClOB8gWiAHEb2+TbkAzrgByWfGziP+yh3Ki7os3noFQK
	1ie6GZ0fEKeFuyPTyZRVIR2uGmnrYUkvuvcCjktwaZGl2WcW7NwcRgijhxz3YLeetZy72o3vnHT
	BAVTo2M/HVhOH1Thxmb74K8GgqxHzXlW5liD5hW2ckCRB8ybiFaEyzXF1lHCcDT2tTDqtogCgPO
	alfoZlWXb9tmYWqkd9PMU4PE=
X-Received: by 2002:a05:7301:290a:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2b8565170b8mr67598eec.7.1770322544408; Thu, 05 Feb 2026
 12:15:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204210125.613350-1-mkchauras@gmail.com> <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna> <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>
 <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mi-V_SF+JErMJu1wZEd27HPHqhsxE8dELtd5e3ZEaA4w@mail.gmail.com> <20260205200222.GA1298159@ax162>
In-Reply-To: <20260205200222.GA1298159@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Feb 2026 21:15:32 +0100
X-Gm-Features: AZwV_QgYb-zr50IKZRngiPF2__DedHoXx9O8lOBxwz2l3ih7SO-AZRhJAl3SJvE
Message-ID: <CANiq72mqVNGJSFAm2UhjXRV=5cWQ1Z4xN2aVeYQ5Tn-veym3+g@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Jubilee Young <workingjubilee@gmail.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 9:02=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Thanks for the CC, I had not seen that issue. LLVM 22 is currently in
> the -rc phase and I see that the fix has been merged into the
> release/22.x branch as of yesterday so it should be in LLVM 21.1.0-rc3
> when it get released on February 10. LLVM 21.1.8 was the last release of
> the 21.x series (hard to keep up with all the numbers...) and it sounds
> like this is only a regression from the LLVM 22 development cycle.

Yeah, sorry, mixed up 21.1.9 with the potential 22.1.9 in summer this year,=
 bah!

Fixed my comment in the issue to avoid confusion.

Thanks!

Cheers,
Miguel
