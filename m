Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10DA46AEFB
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 18:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779906642; cv=pass; b=p9CNGP3m+1EZOldJUYy5yzSV5Wv4ExL9Ul1GoQmVCMoW22vCL2+JPgRTdcI8wkwLAaUxZxLX/EVkcIlibF3tBEszOw/ebTi6r5rPAX9eePn05Ld2M2lRdqKMh7YHElnK4c6GXYhygS8H4f+RJ/yPwVRBhO4bgZbs7T9cfIxpcqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779906642; c=relaxed/simple;
	bh=05Y9XjvkVXF+qq9omK7FB15O1pQx7r6zROjb1Ybl8ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xqf7LqWxkm8behjSxLa+H6stb0SdsnK/N3fPoeoLM49uwUNJJEeuDw/wdEnqSyJXDAyof+oY2r5sHm5KHtnMQ8Iz8rvq6/v3aqN2ywal9o05uAhOuSKakkWXvlXS2YqUSnTnsO9l7JiMLIIOWAtCkach2gtTo8qZhOUGCLdN+UU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hbnm/dpC; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hbnm/dpC"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2f33ae12f97so4316447eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 11:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779906635; cv=none;
        d=google.com; s=arc-20240605;
        b=dXfXNmkS2aL6WnunVrMAVMc+cFPpwLelQJPfCkpqn+YGKHy8pKQ/3rxAPU57y7kMYH
         ZoLP7vEYzFuE1BEcFG+YrtaR6gUSIiqcxMIblAT2g023OX7cCIZgPMxitVRXlGeL0aNY
         0nWu++T3xO7w0jJDi74w8me2pD90bLQyI+OkoN4cMA37fhROE0pAasLCB5p5gEP/UPX3
         ibK2A+Gv2tiISelb9/bjDIeBE61L1VkNyr25tS5X+DXejIU2vnSe1Ywu4PFT3TsHsNmd
         gTeTm9taQvGZOyGodGg6qme3rSHiaGPnJSZfjb9kLt5QSTBxsjC6FyICzNqp3vJpmtSp
         fdFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=05Y9XjvkVXF+qq9omK7FB15O1pQx7r6zROjb1Ybl8ok=;
        fh=zzhb7NEpkDIhe4NzwUAEvAm7kX+AbQyVkKHA7Zrwak0=;
        b=RhLdMb8IojQN/3Bg+w7g4lVmuPtJ0o/9eeARyR8Moq1uALDhfAzxpTonQDL+/+c0CM
         z3oyoPDvNSJFbSrHioImAlX1ni5dSHHtIZ9/MES3+VrYZEgraZVNURH0s8rZZcEWXKz2
         0t6Ti0SIWPtwwa2d7MtE/CXY6D7DwT/o/JNAzotlbAHEGrk5b6nJOmgxiMu/3F176ren
         LGCJvtpwlfNX1NwKkylp9r3u2vHPfCItAJmQ0Uw7QC7G1RBwVpChhqnUBg6h+WYTcNDU
         lbzOWZDt1qo64SsKcI1w8yr53kCuecmtkd6nlJJcJhNCKSw0dBLEWD7cwH9TnU4gCt4L
         h2TA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779906635; x=1780511435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05Y9XjvkVXF+qq9omK7FB15O1pQx7r6zROjb1Ybl8ok=;
        b=Hbnm/dpCk0fOW00fQVGJnnAqYf1Gs1xUq58LeIvz/9flr5vtAOFXXw4MbyXFEht5+t
         VnU4rglc/6wN3lKm+0mmxZE925EgRGIPhlgXWZYvvehYW944EK1KlWeUXIYVflNB+JJn
         K4Ldc4G+R290MuQ7Qg0ra7+B+vyEHk0voD+KlQgC6Q4X0nasV/KLK2qsmJ/mcMc0kJbB
         QlzWkzIO7Tm+13I69adzu+sfD7GDNljkG+nc0s0UsHPdK1ntFRJvnvLNdUeChwHngwTP
         uq5VCj0om7xb4VyxjmoZ1yn5MGtl40toUuo1TnO6/ve0Cay+y+kxSi0l1vRdQiMD8lxw
         tvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779906635; x=1780511435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=05Y9XjvkVXF+qq9omK7FB15O1pQx7r6zROjb1Ybl8ok=;
        b=CceTtuEhldY+KOthpnt3/IdQFEe3TKv9DGb6HediI7MwwSb8KKKESBUmY0KRoPCkkO
         dz9nUt/A/MVdTf/+YzvHJFbgQ07RIYxt8+r9j1/9E8ZeHzFU7AK5A1Pqlm7wuy36fHzj
         7ozqYMexCvJn3PM9nF4u1lOvfSHZxT46x2SpRfUrUjNWd7b6ccD7HeiTefsA5qnOTohU
         xkOIK/aa1vS8TCyp8T3YqkIHtNOMIn/2KlWE0JrPj3vShcokBZT6J8ppQ0OuwWiVUWGK
         olF+t32Iu86BEETc5PG7HwgkJpT0CV5nMinou1gYQuoz88rVCfXmQaX4hvR2RTrcur2P
         IFlg==
X-Forwarded-Encrypted: i=1; AFNElJ/A6Qvn3wDo3FExasyvfQtvJKbYWz+AgG4vRIA08s4433LCtCVOCGUthukILlKAUyL8MpmCIKWctM+bjt0Fvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyug1xLCb/3y0XK0Lop3dS0zZoZ1yoH7V288tLQh8Q2rd6yGokr
	QUK1sq5GZW70TLQy0QtLGWaa3IgojhthjrFC8dP6QVdubcXxrs/IV4tV/9+OEf1Wg5aYDXo2Z76
	SUBdj0/BELXogUTRkuABOfq3ISjytuP9BF8qJaOuC
X-Gm-Gg: Acq92OH9v7RqQo9x1B6xEwgFUpuCdp9XVILgtOA+TzOhAuCfy/dKJiG3CIqCeOv/jZ1
	2/ttQtFrDM/CrSmmaiV+mY786iS9ytY+8xPD4EA5iEKTc148QGRfHBOpLk7boiD4T0PqhEw8c8G
	LHLZP6y8B9OdE/CLTxz5kraPl3F+LPH7z/l3LGtyBm1rtEFVhEJU/AMBEOor9laLte3RvecQfwL
	p0OMXGJE9g35Nu6bCL6YyodT5Z/kXEtqFXd/TxgNn/HnvR4O2kZdQQRzbtr2NVd0EmrDQGxfAyK
	Tx3SzDTLfmjodHBzm6Jun1/7gy6mx9gRFHLjDRwfWfKbrawX
X-Received: by 2002:a05:7301:fa8b:b0:2ea:3370:6e51 with SMTP id
 5a478bee46e88-30448ffc5a9mr10859326eec.4.1779906633763; Wed, 27 May 2026
 11:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
In-Reply-To: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 27 May 2026 20:30:18 +0200
X-Gm-Features: AVHnY4KCCktAaAvshFXaUEjSxCxJfhTGbdSffnT8DJ2KsZSbTwQFBibAhZnsXPI
Message-ID: <CAH5fLgimP4Rp-jR5i4rpMDceg0VmxwY2pybKkcdJaPmcmkChFA@mail.gmail.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, stable@kernel.org, 
	Bo Ye <bo.ye@mediatek.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 8:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> Link: https://github.com/rust-lang/rust/pull/156980 [1]

Oops, should be 156973.
