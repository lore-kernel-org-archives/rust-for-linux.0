Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB54C1C5F10
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 19:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762284236; cv=none; b=s2ufFOUzwGzPQN/DYatrRiKxK0uSGXQgck4AexJhreJOMgkUyfSBLJJ4qWQ8737YBqXpMjcCKlPXsp2uLKmv0e6aCIbbpVp+5Dagcsq5QpfPlMzI8/u2MczkGrxg8y/t6geGwhnr5KyUetw+OJGUK6FKRFcjMNZ69R0Kl8zqpTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762284236; c=relaxed/simple;
	bh=NqeaPpBSzYADuuHCmtIk20h3DrnAs8JxaBG6a4X0D3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZS1x0mSpTO0qMnvvBHyuyVs9cGgdJzb2ejFh8jR+BZttNZQV00wBAnQUz4+INcYl0Kj3OHOSXwU8OrsT4EJN7nHYZVJuAeFlzxZU4WMsF0jYFMOdQMvAfuqiCzA5vxnvwuTG+NuK9JXvakZtOwiBauJt6ihBeXrIYzK23yVZnhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPPbhn6F; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPPbhn6F"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-294e5852bf6so9024025ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 11:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762284233; x=1762889033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqeaPpBSzYADuuHCmtIk20h3DrnAs8JxaBG6a4X0D3A=;
        b=DPPbhn6Fl2RtdKfVw5zJrf2q04vo61SN5jHglAzRe+LogBirALLCM8H2Rb0W5Ox68l
         zq2GUEF3FcaxH5J4sy81zATrTGE2GR2eW8nnZ0lkPcvgBpf8nOeidd/06miY+kAMZB+P
         AnAsa8SFLH46FCq6g6FdK4RHyLcMOwKLX0YkziVxCO0HTqkurKqMyBvbFubBO4uhOREX
         tFIpHP3DNC1LpL6dBSFmUmJ/XhZqsu2PmS3M1jSrssMdpSeZRSQw2cGiM9vCC7J15PMV
         czsE+7pU+RnrXeWunughC82mL7PmT9vRvlU/znDZkb4hEPm+3BwOlDAbwJV81fZolI3W
         1M9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762284233; x=1762889033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqeaPpBSzYADuuHCmtIk20h3DrnAs8JxaBG6a4X0D3A=;
        b=BkUghvRLPgbm8cWmEeUCZZiAlEyANNX5FuqJtuTQBZfa/xXbnLBjPFaS6A9kwNs+eV
         849+G/7cNTKq01veqkrlLnWYg/ZzW8v2mQl3XXptfEuOTAovQSF4sv49zNYiPl4sUfCV
         SZpidbLiYO9V1dXXK2ODc1E/cfEZt6RQ/mpxMwbveuLPfJ1f1m8+POnKygb27f5OZFoT
         vtkQsx2eab0WGe2aZ/MS7L89EayIFirb/Kvjwl4gn7xm4oBeU82rGA4jm9fGY7+MIf9O
         MN8GBsWwC08PoP/Qf/x+igdgKdQKOW37OCh/mZ1bcYbuJvMDoeKTJulIVlQH3gb3AOrP
         HViQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxVXMtfxL0LCp8lA+2tBVbXEyDoiD8kx7zD+8eL9pko1NezkBvD0PdqkgqEAO7Pk33ptb4XfgdgBxmS/+NCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGdGtcwBdshFlDEd+2WWiwfcb028/CVQZVgfog4v9nHXUjttwB
	LJ1RHqILieK+Bb922Ey34FxI3icd/W/hqPNELPJWpZq9btesZsG5Dw9WMncnF+izP8K/y9TeEl+
	dzu9aqdP98zXUq8Qq0NCgUgtuKbKLvAY=
X-Gm-Gg: ASbGnctBHACwKKU1tCwo9oSl6JZSR6FwP6j88RjRxMWOo1rmoroMAfxnT9PM+c9KCVQ
	1QZ0nLolfz/tthmK83hrrrqFuoHDAIGz5+HEPjo3+nT1U2/5XQ2GKjo7s3H+fg0d3aWEC2WcuHr
	FupiB05gHVXXc+CzUJlTBnEzni7mjqTTi/PgnTpGvMpUZ4hkj7gLFkqOJfvu4CVqFzjsBOR2ZQp
	DTkRXNbVpVhM+tMbR6ZnqOH+k3WjbvhC/DexkZxfUbEhEhfLEbcoKCJM+29Et21WiDPiwTL7Sre
	Pmqn3C+bcc6L1oe+5Y9A2NiqR+WmK9HP9qwEBZM/tLAsE2wSn+rUHqktUGgmKHDp7R3gF5vjDZT
	OYpg=
X-Google-Smtp-Source: AGHT+IHCk1/j2mBDXkX8+o2FTVWoribYQUy9xTzp1hxavAo8lRskxPigDirMoCigmuiFNy0hYHQN44kMGg808wTtLgk=
X-Received: by 2002:a17:903:2448:b0:277:c230:bfca with SMTP id
 d9443c01a7336-2962ad3d590mr4530815ad.4.1762284233160; Tue, 04 Nov 2025
 11:23:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251012224645.1148411-1-ojeda@kernel.org>
In-Reply-To: <20251012224645.1148411-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 20:23:40 +0100
X-Gm-Features: AWmQ_bmVIeG-cW8V3oOiaFedybQztgT0tJXqDde7XoeN52zMMEb3dKuMzzPon1s
Message-ID: <CANiq72nHV+HoHFs_wS7B4D0s4vihPLoCKu7AaAAv2AhCN0d23g@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: quick-start: add Debian 13 (Trixie)
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 12:46=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Debian 13 (released 2025-08-09) packages Rust 1.85.0 [1], which is recent
> enough to build Linux.
>
> Thus document it.
>
> In fact, we are planning to propose that the minimum supported Rust
> version in Linux follows Debian Stable releases, with Debian 13 being
> the first one we upgrade to, i.e. Rust 1.85.
>
> Link: https://www.debian.org/News/2025/20250809 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
