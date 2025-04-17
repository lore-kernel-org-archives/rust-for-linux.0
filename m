Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65216215178
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 06:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872973; cv=none; b=ktXJxf9G2MScMVmFt+CvgQ96obrcHAyjkDUBSyZkWlMyn77EIlEhDs/XxMX6kXHEOd3B567CpcWcRejlC7kBbP/asQWeV91CLSJoQc7j+g4FX1S/FAJwmm/4M++Ay1hZ1us63k+fnH/jiIrE9tYzmEQ8otec9H4mQLqMPhTcM/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872973; c=relaxed/simple;
	bh=TVdUZWWglgOqPPfDLDVo9eCE3ljW1YAkEEugMqmwKdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gB3CWy7oAcpzFVgcO7cOPOgEFEu3FAtXp4/kIUQ/S8bmV6LqFBDfcsV2BoNDIG7oKmtvjIWlQcIcsKZVxOCZnj05vcxId5Zp0o/aPZUC1Ko6Gy10Ts3OuxkrLVC059UHML/4U4GSThDv0yY9vmU8BSL1MggfZxgxSrHrVDyzN+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=fsRH7OVW; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="fsRH7OVW"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e6405b5cd9bso418578276.1
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 23:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744872969; x=1745477769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wpx5Nxip0kMwUv1rxDhMlvZV61V+9dPa+zk+LPDBwlQ=;
        b=fsRH7OVWqZvPGbht3e50OebtswUhpl42WTkgdlf5KFKAuJFnL/b7rvgWfOeEeLsCIX
         NACKZhHByaxC0zqq3NineY6xdCvmcQ0IIS0BbIe+InicHn2YnGk7weQljX12GelZR998
         3GJ86avWpm+XuAK+MpvSwWz8ETHDQdbl4rvrbKkIUzXa3m34vJZYDyMtO1V4zC0G2SOJ
         wqGYPp5BrUXHaNLmGBulLHSgRxFXFn+NEmXwuPT/n+d8wu3Om/wB1Z3vWodXtqYobfPJ
         e7PxvDT+p/DvRqxejkrXQjcpbQIlQH+iWxQj7m1+EW3rTHf6Qegj5eIpxI4LGi6j//Cb
         NNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744872969; x=1745477769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wpx5Nxip0kMwUv1rxDhMlvZV61V+9dPa+zk+LPDBwlQ=;
        b=fNujy/F1uMl/6gzC7XZYh+ckTaRtnPdYUuW6yLBZG6TA8fG+IpH4UIw+Cwz/yrf6Gt
         hQARtycgkov22i2Pe7pb8ZzFWiUtoPlMQ5MTEReBmhGNNdnoKWEo8hndu3II99ywLdKN
         8D7T2M6Z2JKVrznWDmPwdcVnbdtyMc9YbG3cMTiam5+8ryT/9UbvnSvQimqydRae2th/
         0XWcPzaGp4BVePFqIGyYp37IF7Si0brjeaV2EX6d4LyRMafxgTpcR2U123/+RKevD208
         By73eoyFRT0SYWRJRY4UAmEP+3KWAdBglgSnGz1I7QoQH2+6sTXAQqrMDZUKOhqUzp3Z
         mGag==
X-Forwarded-Encrypted: i=1; AJvYcCUPrfO2OtKYkhmGDf07YVSQHxJUL1Jhs7Gv4TgBbIf14ccgsFoknU3/lFW6lsp/MyCU1NqNEQXEW25v3CpRNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRDpbFFGQTSnGMJnf4xb1bW0tZqHnqnnqSMrCLT8SGuTwWziU1
	tl+yDhwGyUxKKz0fdR3q/8/TxHMJd3NhOBry9DeH5tXtfQuYki6KCX7On7NPLNOQlegYYof8XUO
	dKNpGLYbgRBbHsVrB+6ZyEA3tOEkHlsoZleqvMg==
X-Gm-Gg: ASbGncu8joZQBaz3Oxn0mk7PkCieZNCxPEXt0XOM2Qgphqr+EWoR019gQjKovPlw0IY
	aaoSidY7NGKv07s1ACoYeE+YNnEqdj08abqlXY1vzsG7BHLeoBATd+Hofnuoz8aGv5ytscxe7L7
	dROn4fTlCcOp2P0N0ZUoD8CQ==
X-Google-Smtp-Source: AGHT+IHi19XvyKL4/y6y7U3hAfkahZ27sf1NOGvOggYOW28+/ISGy+g+mnS/Aixp51ThOQOKr1pn3x1vji/Ote5wXLg=
X-Received: by 2002:a05:6902:70d:b0:e5d:c1b9:4a7 with SMTP id
 3f1490d57ef6-e7282a769bdmr2630257276.23.1744872969402; Wed, 16 Apr 2025
 23:56:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-5-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-5-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 01:55:57 -0500
X-Gm-Features: ATxdqUFh3XmDZUpJHPLk8vG2JmPsWuJCmizy_Iy6hLN6oQFpSaxY0TK5uMvptc4
Message-ID: <CALNs47siqmRedAuyFGfWSEagf+aO-e8LwHey1E7pVvM6LBmvOQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/13] scripts: generate_rust_analyzer.py: drop
 `"is_proc_macro": false`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:06=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Add a dedicated `append_proc_macro_crate` function to reduce overloading
> in `append_crate`. This has the effect of removing `"is_proc_macro":
> false` from the output; this field is interpreted as false if absent[1]
> so this doesn't change the behavior of rust-analyzer.
>
> Link: https://github.com/rust-lang/rust-analyzer/blob/8d01570b5e812a49daa=
1f08404269f6ea5dd73a1/crates/project-model/src/project_json.rs#L372-L373 [1=
]
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 55 +++++++++++++++++++++++++++------=
------
>  1 file changed, 39 insertions(+), 16 deletions(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
