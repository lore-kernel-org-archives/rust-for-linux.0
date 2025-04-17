Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B014564A98
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 07:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874044; cv=none; b=Kd5TkALR6tRTae0ZJFQyMYB9qn3Wnj9S5BdKzuaZnPebsNx/EJYh/nw6Vxpufcvxolv0k67P+CPzp+LtHEwBV+QaklGpeGiVE5qTPrjxcvrm5UptvGQKz2kRSYWYJXQtYrPwYZ7IL416tuKqm3RakL8baSloc/MMAC3mBCC2hwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874044; c=relaxed/simple;
	bh=EvVaTxYSOCEFwRObssSwzCT7FNsnxAftH2lmiKmLtYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J17qJQaR2Vkv+yJ00d4s0cs/l8FsU46yJ6vgBBfo3gEgLHsOxc/wWaoslObpuAFyzSqnFMV2scxKMcC8tHNWhsQqmEHum5JRSbm3RZiNmz457tH+GsESFVxoeLY7GBpFneqHWdvlhiBhJk8dkj+5S3JHge3MqHI0mVTdSDzso34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=jF3Dq1sq; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="jF3Dq1sq"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e6405b5cd9bso430291276.1
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 00:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744874041; x=1745478841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+O4cbDhgMk+GYK9ZCD5HDXYiPfr9BlYHfrpcdjbwwY=;
        b=jF3Dq1sqe1Xn4SDDqkr1ICKxEHu/gL4Sx8bLRPZdqLeMsiMVG1DN8MhRvH+2XCqU/U
         7gtBq0tXwNWmtk3P1Z0/6MnbiofO2Ew6/UlDDvkLuYSKxdUSSBXrnL7OIu81tw4YqWGR
         v8aPMHj4a8OzuQTXaEtIB2xd4EqzGQ1M2s+Aaaz+Og79C29gjXt52X9H4oScRRWCk2X6
         XIU36oezyBflkV47d3qijAKAsixKtrHUUcWgqQ+vt6o8a0ciUT0xHVz1z3Ygk9VGc9Aj
         tFNTPqY5LJpQIyll5n/iDBWgMhRB4FeRzzyV3NXAj8fh8NueE+EHAT5MrKem5CJU2qAD
         hxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744874041; x=1745478841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+O4cbDhgMk+GYK9ZCD5HDXYiPfr9BlYHfrpcdjbwwY=;
        b=b/3kNOpJBPeEPq3aTs15NgvBmZIbr2rDm5sMa0vnXCBu7WlpLMXjQUft9DS8ghf2ob
         cnM8t7OJ1ZqzdHbOiyHF+oE9LikiROoVzwzwIFd7PIgKbgYA4f0JTA9Pf5Bn839ceBbn
         lom/pS0xvbPtUaCMyFEGC26a1JI5sO5WBEU3fB//zfTVhJBcsKYUFYjq5ZkrONf2HhNv
         xqAuwAZ4LOf6MZSUi8U0cO1jy8EV+al4uopZped8hNg1+4kj95xxuRGH1Ide3ynmmCsT
         k4uxNboM5KSiEO3RWVv/QxW9WZ6llF8I29YTlv8VGc6cH1zi0WeBv3AEUhvsgLVSb9Z2
         ZPZA==
X-Forwarded-Encrypted: i=1; AJvYcCVE3Ef7dPuc022b2MQ1Cwps6jhrUwHdeB0qSIq2BptH58odJFGESlCiO6Tt3iLc99GsicIgZXBNO63XICKF/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC2cCkPe4xuQRODQLeQkS9NPbOiVQZPcVYxWaqi05i3GRwz905
	eqt+gtHZcU6JIMsaePo+nk1OqcLWftzKf+HkbppFK7kLAi65D+llJf5KhA0UTet7zJPVE2WX1H0
	MK1LDm0FaYsCfJpTGF0xyB1HQPfkdTQppJ+vGkg==
X-Gm-Gg: ASbGncux5oTAVi20vYe59zQednYc7gSbyi3gVxLBdbZ37eimLxDDWPLA1dsUz6IUKS/
	CPTpXxuuR5HuqaZSiNhUGrgSkBtmxZzU4mR9dtYfThFTPcsFTlWwOGkHnEp2kfH/ryLOIrzHvZx
	jd2+NGc3lIr696o24GLXkCsw==
X-Google-Smtp-Source: AGHT+IHjXNHcgEMNPn9/Qw7IhtVV083uTrWj3Mps+4tKHWowHe/w0s+WaarAR3B1zcpfezoETNmT5G4le8YXRdz96/k=
X-Received: by 2002:a05:6902:2204:b0:e6e:1a1b:c026 with SMTP id
 3f1490d57ef6-e7282c816e0mr2452242276.12.1744874041720; Thu, 17 Apr 2025
 00:14:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-7-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-7-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 02:13:50 -0500
X-Gm-Features: ATxdqUH-xs-hRAvXvJIhLuBMx7vKXsYwZ3FYn9EB3zw3sXP1TOy3akDce_VI_zk
Message-ID: <CALNs47tpZyV24o08BKOxG44UjSQEmQcW2mkagd7mnkqvt=euig@mail.gmail.com>
Subject: Re: [PATCH v5 07/13] scripts: generate_rust_analyzer.py: avoid
 optional arguments
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

On Tue, Mar 25, 2025 at 3:07=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Make all arguments required to reduce the probability of incorrect
> implicit behavior. Use keyword arguments for clarity.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 90 +++++++++++++++++++++++++++------=
------
>  1 file changed, 62 insertions(+), 28 deletions(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
