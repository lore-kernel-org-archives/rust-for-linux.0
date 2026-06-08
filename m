Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC623385AA
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 07:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902336; cv=pass; b=DRjKIHTd39hiOz6iNczsnzcPnIZzfoWK7+sBAHboiq8U3B890uzj7sTaqNRHT4rojrB83mQnMx+EzOfkFx4kY3fkIQdV5s3Lp5APaXdpARcqQFGNVNGdGQloeuFBC2RWRSyOuWDeAEEcpN04s7ZWDRXpE9iY54VtqJ26VMEKAwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902336; c=relaxed/simple;
	bh=9qA/8KwvDeFQOrwe6QRAt2Mp2y/gEjBhT+fubAMXObg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RtkXXo0Fhgyzx48YCaCAuO8+hW2P4cl9mUC63+fcA3dPmbIHbc0LZO3rQyuiGtl43UpvaUbwmABNnFCWAC1z+YRcc2b4gRpfkW7XMY4A6smupV5LGKLvgQCdyTMC/QYcuwQUds9obqCHzbS8rsW/jE4hOAzq32rCZESQBINVhsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoPfLaQN; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoPfLaQN"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-304f9bc869aso470121eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 00:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780902334; cv=none;
        d=google.com; s=arc-20240605;
        b=HWKijaF4nSv7OQoKPxm/XSPU+vmIGBYgdM5UpFBtfDRQRbgMEAJq/hTD4cTM7YpXQe
         VMWupFGRv3KiST1D8aMWQ4G5FKmrFNcJW2EvAtolQtYDZhEdI8P1hP2HabZq9gR/f1UD
         A40d2i1pDWtNV6y3LHmHh/jYJ+hrwxxymMLln0YD8/klL+oBQHhNX727uGIDv1iqAbEJ
         W2gfBVUABMY77ONOOJxxFetuQ9JXYkRlI+GzXiWYpMq/mDIYqFwvsk6ZgIjgYKR7g4gf
         tM5X/eWPe+mgC368P155t3Z6QSZoEbtYRZcKCrM43wjgdlc6rigv7BpnOwkVRy2AZnbk
         EKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9qA/8KwvDeFQOrwe6QRAt2Mp2y/gEjBhT+fubAMXObg=;
        fh=l2n7zDyZYGfIgP2SEP0FUW9ytnon8M+pYX6X3cDt7JM=;
        b=h2ODSqe+z/zdYEcUZV9g70IhN35Dr7q9wjYJK8KkaEWCO2VFT56YCBMqpP9qbULzKk
         mHasFNN7iEdkW+fAQbHmEsR0ugztpkyT0mDBZa12VjwQ1yIDn2noDa8sQ6UxwqIzsy8p
         kPaTlS0YWux2yF5z80QD/MQHz55DJ1IGNOV1hwo2UDTDIBUNu5cVev/XPltQ39PUQ7dU
         ssmTRKUQFjJMiR+LBluLPwcFQxk20ZikfyeiuRwmJTf9PqMKz97sHUgCwVZxbP+iDAvH
         T8dWCP9HfP5H00mcm2Jr1Jyhb8eZlu8zXB619hASTcwXUdtCUIRGP9y5LqdTqO1h6unc
         B0Lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780902334; x=1781507134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qA/8KwvDeFQOrwe6QRAt2Mp2y/gEjBhT+fubAMXObg=;
        b=GoPfLaQN6cRrkfeQW9ATXrOyQ+KQr1NqYzBgYP1pEpkvLeZVBcC1+SCyHdCfA2NcTn
         CU5H6EB6E8BSA3HvmtDdCdWlLGXXFS4IFZBLu6cE/BjqaQCT6wGNBjAmw1S3UaxagKka
         Fy6TzTO0oreImyB+KZeCULHwosywZaVcIzZa5jmk0ctbpWY26/16xsinRp5zWtVOZoeV
         /9R3EzUb4xUBQz29rlrpjjdlg/SFCslEQNr9/xPF4ZPQh3khYmlc+/FqfIMn/hbOCzXJ
         qEyKb4h1EzZYoKjv/al4pFqy+3+xcADW0MqmnItGde2HGtW6ZzWC/uM04CUqN5nGj4gI
         wCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902334; x=1781507134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9qA/8KwvDeFQOrwe6QRAt2Mp2y/gEjBhT+fubAMXObg=;
        b=pQ9eKGt4PecqZBlZfriC5Ei8Gp4/N8fFKofSChkwvqNUu9J32XQWHUfRagG9yvFJT1
         vLR68LLyatNEd/d/DJqi1xzH7bZKeS39AG9nEcnB58AyAgXT1/iPiU02fwkoqpqgcJ04
         45wa2Bwf2r2qQe71sllLmdCMHzNlccDLyoB17p9ue35JYcXqXWyGokW7mePwGuTZ9+0R
         3lPB1djlhqCqFa+mDujhlGzn/7rdK6U3MLRUZo+d6hk4mFlwn09x2687uPRzrLNg7od3
         VNNZxSrnNmdbdW4KYEivLPO2S/jdb74/vW8V7jnxbOCWjqG5PoCbDzIq39rw7BOx/QFx
         dx7A==
X-Forwarded-Encrypted: i=1; AFNElJ+HV+1DPU4hCD4YSRPC5ZBUZoLSJNq7Kt123x/8kCxYSoRMV+Qt0YyAcZx0yuWs6agOJR44pTzzmU1PWMBtqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd4gxApvUC8Canasht3yrftChAlv+kjvJZpAykA7CJ3e8oKFph
	JQFWbjsEVJzsxkqH3PGRK3W53b958IgGDVUe+XB43uXYKdPcukdInzRh3aZ3fBJxm9PMv64T3lX
	u26L2V9oWQMtmfZiEWzEyNDWyq+bHIjk=
X-Gm-Gg: Acq92OHillObx4pM2bjoAUKDoX3kX8wLBwzsVrV+yQVr2oqj699mdjclvY7V6uz4Zbh
	15PDBJrUpEbBS6aQSoyiP6O1uRLprAvyqCisXa0W1BDsavLtDH1k0SSuWPkOuz1Zd8T7NNi55gv
	r7+U5dYC3iNKV+iXI8vAT6+Db1wem6OgJwGIPA5zUqGqmWxVf+8JWCpqdAmggqN92uqa8TUI5RY
	G2V8S52TXJXXiaw0vvHMg7HWfhgGw7AOp5Pif0powIRjyYs5rzWgfTU+d0woAmMhuhhOtvQ9UVM
	mSNgpO0O1aSLnQeU3tlsCZafgNGS72FS24h46pTge5qDojOcMMLeXsXjy6tuKtsHizY+3cQxyA6
	0ztm7z9izEhz1f7eSPwi37VJEbXXJtTZ6p+MbDuq8Wlel
X-Received: by 2002:a05:693c:3945:b0:2da:a813:a629 with SMTP id
 5a478bee46e88-3077b223afdmr3473571eec.2.1780902334313; Mon, 08 Jun 2026
 00:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com> <20260605-nova-exports-v4-1-e948c287407c@nvidia.com>
In-Reply-To: <20260605-nova-exports-v4-1-e948c287407c@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 09:05:19 +0200
X-Gm-Features: AVVi8CeF1bmJ1otTtbNunaCFacq0cljAH1ygtuYHCVlQ1ktOIpRSg0gpBxWAiuo
Message-ID: <CANiq72=ceH60sCPs7UWDXQiV8GLznjDWsCKFa6k8O4exFEkW1g@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] rust: inline some init methods
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 10:32=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> These methods should be inlined for optimization reasons. Failure to do
> so can also produce symbol names larger than what `modpost` or `objtool`
> can handle.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` (just this one) -- thanks everyone!

Cheers,
Miguel
