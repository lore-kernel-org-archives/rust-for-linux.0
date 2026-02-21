Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D70A2E22B5
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 20:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771705894; cv=pass; b=Ts8PjwZENRAGaxn0IoOsFBtMI9a7YWj3aQRnOagyY6hIkvkasgX4j6m5tDcGtZWrhleVNz3vw9TjUqfMz1coHEELP8h0Yu95k38QXmZPbrs0XlMnEhZiacE/y4j6Qgfa10JZsTDyclt5F/CKtSnQVvbRCn3anMz49dzSagg0B+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771705894; c=relaxed/simple;
	bh=FrJ3od3X8M9bOPnstqA2Hb/cX/Yif+NbwT5ilPFnH3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UxC1p3eS6RDQuJ8jROjO09Zq5cSB+cTA5aBN+6uoLdMgYNoDHDApAKTtxy9c5aONIt9wIZ/CtafBLB/L3kyXMAIeyB0bSBxFx7ornuJ1C1T5aXc+TPg9JK5rZIJMFettkgt88Pc0SU3VPRslH2AuJj3C+/QX36ctU7Yfa15vAwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6AH5HFN; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6AH5HFN"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bd784c3e2bso32563eec.1
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 12:31:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771705892; cv=none;
        d=google.com; s=arc-20240605;
        b=Dz2pMJXcgwYxNTET4or6kSCGOZVou4BgdvNMj6z0kC+oKJ3LFLAxlQfFzVSbTsVbnj
         UcvblnZ3YWftHmlbVIscOyEGQEgvVOKGgrNwNp6HID9EJOys+8wNMl1CZdUNh6ySVMkH
         sgbl9xFjSfavYSGIBkYle7h4K1EVTIbkORQr+ZPdmzllGxIk2GGw5cZBVG4f224O8uVU
         j1pUsvMOwmlkOSsNWd6LpMPZ/Bvrn7FqNVvV3xZg5od4H/yMHdTDvZgEdArvLSpcjWkD
         HH9z/IcOsy6peQ/Tq1zZr2t/4lOCQpRxS35ik4S2CHPD2WYznLdHdsC0z1A7/kS1+6cH
         DT4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FrJ3od3X8M9bOPnstqA2Hb/cX/Yif+NbwT5ilPFnH3A=;
        fh=vuvMMyUYhDQ+HVl0pBECYf6LG58/aaFRg6bZRzwzmAI=;
        b=ErYgAq8VRwvXrC0pcUNLqfQD7ULJj3sUl0vlfXB8pEUElYu9c25/6Lmw7gO2NTMpMh
         j95Dr7OeKbDvKZPxurgZQoLgjC1dBqmDYAQZL6MY5FSQ4PvmU2cbcuz8uEtcretGIGFn
         OaOAXBx7aMdv+QjtdPEjstOPEey0g1eTV21qYqqlysgBI9p09qyETGTNG8ZZeKGx6M1v
         Q1QOabfntee6x0E1L2haZdKE08mq4tll5ifeFWsVskaszhNWvWzkvSclFqio2NC0KPUS
         f/U3pRCQWH9U+kdFUmNkxDyk59e9OWbbSrGlMJ3cEX8asQv7TrM3V87LMSUd3DeIKmrc
         NK7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771705892; x=1772310692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrJ3od3X8M9bOPnstqA2Hb/cX/Yif+NbwT5ilPFnH3A=;
        b=k6AH5HFNGbr60z2XbCACCeQjrWalRYfvgDryc4Kjkox0RDdSPWdxvo3gO+OJSrdAxG
         Yqv81mTFOClKD6uRnUGNaz3pJMHL9Gt4DwNKJf16yQ4ayx6gRWq0GR6BtVY5MWRw+pUF
         1TrHp6zis+z5MaefMr6ckdNPjGTEMvSCCw+UnyyVg8Hg9swaU9cSjr8LNX559peXWV76
         aMImXoW7t3/O3JTVBP6wpgmu+0nYOoizzWaO88k0e8gIOy0JppGTsTCT/knhKmLroLOa
         93zQ6ehr1GIcpOtnAeraJSGhank+yAB+oSyPo0JdeAVL0k35R0akwI6bNLaPPtYLkHDX
         6DmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771705892; x=1772310692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FrJ3od3X8M9bOPnstqA2Hb/cX/Yif+NbwT5ilPFnH3A=;
        b=ctkSk1j2MK6GxMtrHbDaHnPt6mzV9rp3ABd8hE7307+Xv0SQpNQkVNI+fIPb0kup0E
         2IuE4iyJLCJPrznpG+Rq5bLS/c8E/uUD+KTQOsmDJ0NwDct45WPQssE2Cn+oqRA6ecve
         MYNNMumMKVhkOce7c6G9xJsk5/Q+q8oeL81Y9VSUxMnEqic2eQ4beGZVRGaZkQK7OIVm
         7Mkxq0O8ZdsqEXeTC+ClhQg+eh2bGUctTqF4R9q3QtkkWEumZt1l2HBwRlVH6oId1EZM
         2FldybBIdw7CZjxjYQumI5HfNCjM8/n7UGLq91hIbjpWKS+a1SBXXPUsc0PvtEmcpBaH
         Ho3g==
X-Forwarded-Encrypted: i=1; AJvYcCVLnvaQ0MnU0loWMxqT3WYygdVigi9ldB1A9BMFAVT6wSyRQvLeOa2VwPF9dVeBeUd18M/nx8CYt5Myd9rczw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLCZfbkaswLuJ0rPH3fOPMhtW9oiDREov9JnlAaQStFQBcXW/8
	LbaI5S86jOxn90vIgnwC/Wr8RF+4NF/HE25z9OgOoVnSgFUeFVRsQfSDpk7KjgQ/KGJm2ztf3My
	7eIFc5rWP3EQc2EzUcNLJWP7TeCI+TQw=
X-Gm-Gg: AZuq6aIUs5vYLdJ30GlTGy5uT/wWyEXvSIQW3dXEQZp7DpoOW0SNoERBY3YtrM9qA9y
	v9QxI7DCYMVkeLorMTUCXv0JNs4N1jkAxC0/9WxZsiPLmZnrWjZyiECLT1AazVnEW2nZ6Y5+MRh
	TLDHvlt3csbgcCudvehiv44zVrx0cLQfmPijZo4wbV5b5DEqnR2SJG7FcKU+dSxw73X7OT2Epx0
	CrEJP33A3Qj9UyExSvu7nzB/yBExxS3qE1TpOuI0sxA5FeiPmiuzvbwXO7/XIKCzgShd9c88aME
	+/crErK9guqByzfaddbNqmD7gcWQVDF5Q6hvLddvAh79nl7YeVznh4DsPGUO7mPvyAxZYyjPbF3
	MPVK+9ssC5EOSKGpyHC7sS9pM
X-Received: by 2002:a05:693c:310b:b0:2ba:7783:d1d1 with SMTP id
 5a478bee46e88-2bd7bb62b24mr903258eec.2.1771705892150; Sat, 21 Feb 2026
 12:31:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251221081659.1742800-1-stijn@linux-ipv6.be> <CANiq72nqwqTmCzKb=rhRhUDg8pju_RB2zzCKnJ5hDrVTUVnhPA@mail.gmail.com>
In-Reply-To: <CANiq72nqwqTmCzKb=rhRhUDg8pju_RB2zzCKnJ5hDrVTUVnhPA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Feb 2026 21:31:19 +0100
X-Gm-Features: AaiRm52aBfPYjtJMkeqYa1pVE2nBJzQoyEJKXJ-q7qII8d--4j4XXVFdcCdfMEk
Message-ID: <CANiq72kuP7P8NL51S2J48q=epqd+4F6iPXSPaVCF0ET7rAN9Og@mail.gmail.com>
Subject: Re: [PATCH] rust: bindgen: disable GCC latent entropy plugin
To: stijn@linux-ipv6.be, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Emese Revfy <re.emese@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 11:46=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Cc'ing plugins and Kbuild.
>
> Kees, Emese: from a quick look at the plugin, it doesn't seem to
> change the signature of the functions (and even for variables it just
> initializes), so it seems OK to ignore it for `bindgen` purposes, at
> least naively. So I think this sounds fine.
>
> Thanks!

If nobody shouts, then I will pick this up soon.

Thanks!

Cheers,
Miguel
