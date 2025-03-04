Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847BC1FBEB1
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Mar 2025 22:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741126072; cv=none; b=BTtVU4lMbQcH7nw5NLVHaHQQPV4TtZXSfnpwT4KKT+7KdMi79zVSpOlW8h3v2nX0FgDwKGRxsFl6HULuRC75NFRx68rVM1qBDaghpPweilJYjNPEh7YjA4xTS5IPGwPvYH73w4YehNzaw+wYVzpSWay5LBAwJIo4zCJMLowuG28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741126072; c=relaxed/simple;
	bh=rYa8UwAmLiF/ruWm+7Ip+yWVFZ1SaMjS81Bt+resw34=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=jW8rJgoaL3A069IJms3tDjvynUQV3LA0QXiWIEPlZvETW6H59W16ZSv4Q8CbX7JsYNouOJ8MYyXIPRasUP0Y+zRcObwKxfpBdYLfnjqGwbwLBtnxkZbQUhN5AlPnHH5XdhV8in26JiJBZuKo3/Q2EFQfQOFGAzmtDitlCGW/rXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ChvdcD5J; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ChvdcD5J"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-474d11c7f1cso14092211cf.2
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Mar 2025 14:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1741126069; x=1741730869; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKFucnJ0eu2hFoCdtrns3nmxFOzTMWGPnJoCE8LE9lg=;
        b=ChvdcD5JcW6GT82AZREdI9KJI5wMf9FHldqZCztGGm4XN/xNKrW3hnsfaFifNNI8Nk
         AND4RdlbUJoLC2IoFeTyDYV3SMdMgx9ZD+G25ygZaX09WbFNBFA8tbDaEuuVOPB1T27/
         0ZPBJfOU/kdBWwIIpcQ12Z5zj0bn85U3qGw3iL5Jk+OfXiNv+b6+pAxGN7CioqxCOn/s
         c4keFaTd394WdtGQfq4UEGbvuWQXs94As6WtZk4RGoybM+HV5WynToZX24Sr1mFHRVoM
         WOCe9xHTrzIIhwk5V2TBkZJKptNQ824nv1ih6ccKKb2tzfn79WNS6/bw+06kNKqMUcZQ
         Ru0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741126069; x=1741730869;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BKFucnJ0eu2hFoCdtrns3nmxFOzTMWGPnJoCE8LE9lg=;
        b=On3EgHhfeH7JqwTe6Hjkmz0xlRs0FZMbLbc6Z/EFyuhpMM3YgW8QqvZ0iauEQWR9o9
         +nYyKOw7UqI59zfH7BeTTJ6e+56PwjXNpVUy/CMTirsNACCUkg8KrT6vKQzzJZ2oUDgo
         Tx0H5xkhTr2527QOqu20V5kdmCcTgvENtDzpQ0LU040n1GUQIBp8dUikFSIBOKuDTc1X
         BGz9erXhf7eew9Ijb7PtRkMBd7ddwdE8EX1dowEWxjLdvWMD8Q/3aUU+p/GBFHVk/+u7
         zsuUTuPGgdHk0rv2qI+Y16oI3kILzF1f1CtOv11J3KzOux/3rOFXAPyWbNal7mRCtP6E
         6qTA==
X-Forwarded-Encrypted: i=1; AJvYcCU7I9ibmarKITzV9O2GvX3Fd9FBOg2OcQ24auPSWlvfZ+mZu1XNsgJFaiVL1Q3h/XPIzehlkl4HPZKOvrSBwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA4UUhxjS/VziL0bvxQoJITG6VPnr3yi+6uT+hErPiuTi6J563
	evyCWGr0najcPCIg7PHaVfUdC2uIFzjPoKqgFVTJHSx5m7zo95Sh4w+yzI2wJQ==
X-Gm-Gg: ASbGncsHrRNjtq+FRERyOi0JLU4Ijh1G8BhMbE0bZOpMhstmkbCgHonpIWZZ8Vd7bEH
	hogZZB/YJoaWLzy3xpWbvfHDOOlzPI/3VzgyZpp/BxHmkK7bhTiJOOlRyrCXmnVIEhL192lwqqO
	PUVFPTqYIqZDt0KGI6CetCeHUE2T+xCz79VN3PaI+1CNWGb7ur/t0bHZvoU5s6R0gXucAKhjqCl
	eVtIrBtm1uiVH3ztyx+M1d7qPGOwhwjzRxZJpr1cvJFF/DdeKc499q1CVq5X4VAk6vwl8Iu6eTh
	OT3F2hHkaGFBwcDFkcpSPOBETt/ltLIHvEUAUh8j2yfB2PnbsKSJvFOieCXHtZRF02qKLhBngBU
	3T9wQQDEO2dPB8Q==
X-Google-Smtp-Source: AGHT+IGUzI53OHoAUblYM2qlVQBUsHxaboxVDz0QodPEH5dELjV4Uu9kfywXUTbmN5tYZHwecjh2Aw==
X-Received: by 2002:a05:622a:cb:b0:471:fc74:100e with SMTP id d75a77b69052e-4750b4682d0mr10512251cf.28.1741126069306;
        Tue, 04 Mar 2025 14:07:49 -0800 (PST)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47472431036sm79332581cf.80.2025.03.04.14.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:07:48 -0800 (PST)
Date: Tue, 04 Mar 2025 17:07:48 -0500
Message-ID: <f52b83c88d715ac3ae989427bcc20030@paul-moore.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250304_1539/pstg-lib:20250304_1539/pstg-pwork:20250304_1539
From: Paul Moore <paul@paul-moore.com>
To: Alice Ryhl <aliceryhl@google.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Christian Brauner <brauner@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v2] cred: rust: mark Credential methods inline
References: <20250304-inline-cred-v2-1-7aa54011bcab@google.com>
In-Reply-To: <20250304-inline-cred-v2-1-7aa54011bcab@google.com>

On Mar  4, 2025 Alice Ryhl <aliceryhl@google.com> wrote:
> 
> When you build the kernel using the llvm-19.1.4-rust-1.83.0-x86_64
> toolchain provided by kernel.org with ARCH=arm64, the following symbols
> are generated:
> 
> $ nm out-linux/vmlinux | grep ' _R'.*Credential | rustfilt
> ffffffc0808fc540 T <kernel::cred::Credential>::get_secid
> ffffffc0808fc588 T <kernel::cred::Credential as kernel::types::AlwaysRefCounted>::dec_ref
> ffffffc0808fc570 T <kernel::cred::Credential as kernel::types::AlwaysRefCounted>::inc_ref
> 
> However, these Rust symbols are trivial wrappers around the functions
> security_cred_getsecid, get_cred, and put_cred respectively. It doesn't
> make sense to go through a trivial wrapper for these functions, so mark
> them inline. Also mark other trivial methods inline to prevent similar
> cases in the future.
> 
> After applying this patch, the above command will produce no output.
> 
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Christian Brauner <brauner@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v2:
> - Reword commit message.
> - Link to v1: https://lore.kernel.org/r/20250303-inline-cred-v1-1-b2527beace76@google.com
> ---
>  rust/kernel/cred.rs | 5 +++++
>  1 file changed, 5 insertions(+)

Merged into lsm/dev, thanks everyone!

--
paul-moore.com
