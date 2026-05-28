Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7B2344D8D
	for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954057; cv=pass; b=cawx46zz7hBmvjTk9ZfydGf0M4Xydcq9o1Q6EIVbRcxEpTM+SwPF8fUAFw2qgo9ylbYR7jZda/+cOuxd5uEFL1H+9Ex3YgRKXoyOZV8jOZ2B42TP3klNmGnYSxjgpcq+8rVDHurbm1qsMJJWDCQmpILJQ19Q87Ul8FuZ4qp0gCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954057; c=relaxed/simple;
	bh=By9+/cQfDOiHKCLAdTTOdaNo5oaWqqrMiWl93iKDqH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qbc1P8BoH/k13icKhqVOAIov8VMum80GmCyLT2jbQ+u2IQLyPuZGVXFJvjQXJfY7O72Nx5D+uz97NXDtiXaaU9Wt4IG1bQOLxKVpEw7VCQNUipQCMLQZFz1LZCUDFLD//iFRC82Z4UeOQJRcHyKh687p7bTY4jQwow0X0Nh8Pgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhOxFYbG; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhOxFYbG"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3042a99f0ceso686556eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 00:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779954055; cv=none;
        d=google.com; s=arc-20240605;
        b=frYwunefnEFklrQOdfzlH0yOz752TS2lpPqCR31BXvp/drC15iO+SGgLqW6BO9DUPg
         Cm3wSbyrFpLP8aMZHK8/8PCg04P4BQX7lxnL9/s1R4mdUxVY1QcAmtYlas2zI+Y0wHd0
         IMCYGSMZ+PqVuQgnnQqRhKLaVMfT4TsokocVBKsE0Vydiai1GsZZGxK2D4JubITOVlc1
         cYvX6Q2agsFy1hVpTfYhaqxNbkeK46P1W/Qfbpu70FDkJYOW6Li9h5RISUTMhIAk03WC
         dg2XAjUvCa61tF2VCc1QHMYBqMiHXyajm7ftPkTCf8EYwec17M5V3HY+85tWElo5tKve
         b8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C6rQbKX094s5JJcUVE2Jp90y1SPQtpcWbKmtZxkv1H4=;
        fh=Y1ovPt5W/q2/azkUcCS8O8fqPmmveGeNrY0D7Dlx7wE=;
        b=ZKbIKWJK+VhhG8vUsEAZEEB9jXi7KbF9WDGrwcH3F5ciraO1++4bkLAsDkWj5CYADo
         YjGYeFhzvCoyTut5n/GtArLl9sz7NVqLUsDyJ69tVae7Li5AxwCAxLghySb6LcJ2GhW9
         2BIsrHKdxhBwbNbUw2k8CkU8sxPdyRQN3QDflUB15jwY/XDDremC5XppFqhYmKzxsBiP
         vv2v4an0Cwv9B1QVS5gvl7mA0UgEwroXToqar8Z3cLMxoBcDdgLMPXakGbATn9RN3RY3
         ocCPr6ronlrHDAaWmckmZuQccytKDyq1I7bNgDPi6hT+5EsjVEPdmCwQ+RbEbkPakr6J
         zG4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779954055; x=1780558855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6rQbKX094s5JJcUVE2Jp90y1SPQtpcWbKmtZxkv1H4=;
        b=lhOxFYbGXU+rimrbJ7DeZhYxOZdW2pkw8GQRatkjcnhdTPk/PtK7NvMIughHjavuoA
         mcDwC1ngdNv9Mr/uK+ULWtBywE5TG2wz5l5OBn686oaQcj05sKkn0Ksjq90Oitr0XGIr
         e2eFNuv6tNy2KlFi1sejnU2Pva7YbrT2mesx9t0oUTS0ulVrHq60HbRVBA1EitlEO9ng
         09QQOovTvTFtdOQy5DrC3VShMXMVPTVDSWmfjSwtL1l4YHCWEMeSYteqXf51AN+/+SQO
         Q2gydAQ2hAb75mKpYUsa5FpV03qb1xbYYaA3wYkuyj99qGnzA+Us+BTRcLMcJacvtvio
         9SQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779954055; x=1780558855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C6rQbKX094s5JJcUVE2Jp90y1SPQtpcWbKmtZxkv1H4=;
        b=ek7ifVhs+lX8T1hI7BDLZ8K75zz1Un3LDwmdfo86FOHjL/ysQe9tquST1wYGPRVEmo
         P+Zr3VIGPHYfS81HzIDPY8gVeq/EBjdUr1nfpeLpo128FE8G+7DFZj/pckLb92YWxwL4
         gPk+xWAJWWDFAXFIwBg4eikmQZ3DxjkmRz2BRMecEr4bSwhK44W0pCgLnFxAW4Ye9LXS
         4iDxaam04ya9/dQRayDxYeQzDDR6n7I8Sv5zXs4Cp/kLfpi18coFkZS6RQDg2Ank6Kf8
         YoVXYPSOqXX5b/Igcy/6OmX2uBKqkCH1lE7C5bGjr/EX+Z+NEB2Pcb+78vYDBnZomI7V
         gaeg==
X-Forwarded-Encrypted: i=1; AFNElJ/1z6UrfEb8bjTU4gIS2ne8gB/frQj/u0WYnB6e8A2hvkPAySQIXCDY1OyUjjYn37APy5v0b7IX29ybR3F3yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YysGcSmb66kFP54lNYdRmAzjVrgZgTEEcEtg/SRQh+3ycIkk4PB
	LavvY55Xaf7rRf92Mx/Ey7e6aMKvsrG+0FE3WP4mfRAhXKaRFsy5ytHSH1yuc0fTzk9xQBx20XH
	Ut79sRDOtLC7cBbuk8Auy/xbvjR6FYGo=
X-Gm-Gg: Acq92OFUSF/qGenjFNDUiAbUb/iHsHX4fbqXVIUydxT61HF1fGv6DPRl0HILIIW5Dxe
	jF9cSeT8Y3l9/3qmybdZd7HLsa6tL5SJ6vXmk9rWpGP4WoqUGdj2iMBPqje7VXIkDcC/MiXZm79
	PiVKbi9slKStBxRh4cNIgznX08GaJuRsN8LB3OBqF+XbH37tGVeG2CW5faTIh+4xKv1OCMFK4+Y
	9nqBWTTB0+3rcmJQ2UPL9lKPrCalsVjs7SN8e5epn+OJaAjAYdp6Pbsj4uZ7JHGHyxH2K5iCjdw
	A4OKeEIuQwFoxHx59GoBWbLQc5a0q9SR98dA6+/j7UQZTdvfNEjXCr2pQ+qHID2e9L/sRnTMpYU
	EiAJJpyqxYjqnJfw0cQc5OvxcH1HlX6imXA==
X-Received: by 2002:a05:7300:1805:b0:2f3:3835:2005 with SMTP id
 5a478bee46e88-304d2ef2446mr416452eec.6.1779954054763; Thu, 28 May 2026
 00:40:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DIRDATPB3JH2.1DPMQ081MNQI6@kernel.org>
In-Reply-To: <DIRDATPB3JH2.1DPMQ081MNQI6@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 09:40:41 +0200
X-Gm-Features: AVHnY4I6zxWdlk3GJhjLaPKjGTB3T2AnX4gp-YmEbeBCLBdgnLDGXDD48R-mp7s
Message-ID: <CANiq72=sDOuwbLa65gFz9B2HrHRxCuVDsxFExL6wz65qY=4xqg@mail.gmail.com>
Subject: Re: [GIT PULL] Alloc changes for 7.2-rc1
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 3:30=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/Rust-for-Linux/linux.git tags/alloc-7.2-rc1
>
> for you to fetch changes up to ec51531fb8efda9b75316111c040dd756f815b0c:
>
>   rust: alloc: cleanup doctest imports to "kernel vertical" style (2026-0=
5-20 17:34:17 +0200)

Merged into `rust-next` -- thanks!

Cheers,
Miguel
