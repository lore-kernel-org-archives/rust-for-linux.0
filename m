Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BA52F3C3F
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 19:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769369261; cv=pass; b=SCOoOaFdYu816gmtlAswL2kaRCiLo8silMuZhDkb6Qnix/kMGfxtJwEipgcxdtviEJQ4gafeExWFcZqn2DPoHF50p3DMqGUbcvWErgKkzyqv+fx4GKUgfSbzAr8BTCm/X5SsNST1Xmv4pE1+BK8uyrLxdpw+ynvbHu6pa+q4tf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769369261; c=relaxed/simple;
	bh=YRUqYgGttVfHKHB5BU/365ttQY2IwUNgPejOAIiz+NY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bnJJfqS9HxGo+0qE6tp3UHdUYQ3t8SpdtfbqE5VS3NxetMvJbCZA77+fbRV9L1eGBbXttIYKbhIm2t6J0vPSLRsGtRPsVjpIgORAFbYZW0+XJVCgKhlXwAINKWBLY3tM9BdK9hNFqKRY8586I/q0OObqV6zEyskOzZN2KHo7ROg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSKCgcNQ; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSKCgcNQ"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b6a868ad45so417303eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 11:27:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769369259; cv=none;
        d=google.com; s=arc-20240605;
        b=f8m2g8PXsRtrSHXr43FejWgqcqJNbg6hudLtmiy2G4+mBSNgH9v+WldD5HQDRx6P2f
         iB1COhNZJF3tALfMzMviX/MOEUUiduNmXjlN3eDlHHsfBrdzm3ApG7shu5w+n1/rtTJk
         RjGln2x4JN/F5GRpj0K/fZ3IvWQU79FD0nTevxLg5nzgNJ9ykOEsqr7zGsrZMH+rNg4S
         oFZq/e5CO0WErtKWLqX/F2XYXuYL0eBqywxXK6KlK4lEPZj2/fR87VX/k44yn6KserNd
         ak9QjZS9hYAkSE+RKzl5Y0+3VIgtqrEoq+23XrkXeLjvGiodu1bZp5eaqhabZrmYlY7h
         sMOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=va8g89JuZTXjoG8J36wmdQ0UU7zATe6HtF/PIIS1Cqs=;
        fh=gPjrJYSViP1LA/MVY3aUJPoazJjDBrE20od+5VBFOVQ=;
        b=YPLvIlOUJMmi4PPKi6aJko5FwJD1Ibh7dzbaLN10EsId7wSqHISwk1ZxSgk9q+QCHa
         oVy/U4273uiO2UJba/zfOqJtB/DoTgmyYc/iZPcomKaRtAX5QsTXUdwPyAhOszurDNh9
         nK7sbZ/ST9smAEp5KIs7QqlckfQBY5dcX6Df3FRcOojSHv1Xo8oFNX5RcT9tiDeFSH99
         enE6djTwzRpXKmLqRh/8/z6uGELbIFOJ5dD8w9Ru8bZP0lZrQKkPHnLamVOXEOJsEDXM
         s0tpw8HqAH1cu09NHTP4yrC285FcFXpfjXOTQRuK3wGwvvd+CnD8K1zXq1ofwLOKci7g
         dzSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769369259; x=1769974059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=va8g89JuZTXjoG8J36wmdQ0UU7zATe6HtF/PIIS1Cqs=;
        b=YSKCgcNQXmd9yetcNlAx+WB361+GiAtnwf23jhxi+OeXNGcBc/CYtIz0rjrW99/Hz8
         BAeXFj1diErVvyblJQAPnWgiPap31ZghNcJQq5NWh3jWHfqdNkTR6d10CPmViDzBWWIs
         JoQKO+2zYLXwFOBd4472iRsgO8BIQ5b+T2EvQ9bRD4ZRXcMm1Qetu59zC97DNcOzL056
         1fm6Wdv5M9uRQAudcjW+C2DeBMBQ9dxux3b8w+biqRHbPHoFbSARbNZpuZmWPGilSt30
         dPgoWWEhYCk7PC8em0sT3QmGX78SIYdevqZxVhZ5bhPNIQxeWPuPaKbWN6CatXLCDNwx
         JiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769369259; x=1769974059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=va8g89JuZTXjoG8J36wmdQ0UU7zATe6HtF/PIIS1Cqs=;
        b=jhj9H1/Y1A5fvvtd8SDHQMKGtcP8ShTXvApyvNAmTJdQRk4qh7l6wBVAT7dfTwajIt
         6V9IJU21PA5rNDBLs4U/lpeFTI06OzRik4sJTw5EViO0mNuQCF1KvSaz46SvmFFEV3EE
         FylF9+5703ax7RePZBgpqXFIiAg1K3JvEd3sRz67Eyy0VIOTO2ftxRKBxYqo7SayUagB
         0oAJQWJzsMxrpm0It/ntYA1MDxepiKCexDY4bEfbP5xBgQsrEfcohXbdJoqF9eu6cQaR
         d0JS6iYzHntOg4Yi3hqidzn+ltP42q/pVFSqWU8qQ/9f8WW6LMT4ECMBpWAJf/QFjhKj
         6UCg==
X-Forwarded-Encrypted: i=1; AJvYcCUSfogNdM0r3xr8jnRKWzHa6wMrjIDXntz6eQPTcuqhUaYTkZJjQQw0CabUBOxteFXU6MtLfxShKOJp2+eFKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmZiEIAKDHjZcsnw7YdjF/3DQIerQB68xkhY1EDJHvO1NkPm4q
	1TEXDcttfizqY+8mKKTVIItyO6Ezs0dgZCcSwufNVgMPazhJeTxNyPsF+PSg0nAJcozn6Ndcyst
	iDwDPEDHg3Rvx3GHeTyi4WUJRtbfF43c=
X-Gm-Gg: AZuq6aLPb2uFE022PSCEe+qSfgI+9+HRDa8bjCH2A2EwNk+VYAV3ApsvtCPh+U5G/qo
	DFryssI8iS4BzxvlQDel5pEx+VLkaQj5mWx5Wz5xlwtFSUvkjpTyDL++n80jPzoQ/BBNjQJNgf3
	tOMwFff8RB13JAStevun8BchG3ZiTL5RL/uPKldj1J1xp4Zm7bbUA4u3+2dnpu+0J1SQHACLCPu
	sv0viFUYYOwJAFxtAU8nvXzeg5NQNDHp3epMoyl78ySXsGksvVywspDgB0xIUzn8RR9wPp4kvzj
	Rvl5NNJYoig8mLEtShTA8qPG3pxfmxvXKryFzp7+TGUTGaegn3i+Gv17dpTkTrvlCMiZ5dwf44y
	B9oSpwLNhweX/
X-Received: by 2002:a05:7300:ca1:b0:2b0:4f9a:724b with SMTP id
 5a478bee46e88-2b764515574mr562351eec.6.1769369259234; Sun, 25 Jan 2026
 11:27:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251129135657.36144-1-atharvd440@gmail.com>
In-Reply-To: <20251129135657.36144-1-atharvd440@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Jan 2026 20:27:26 +0100
X-Gm-Features: AZwV_Qh7R3F-trvK1p_xsfUuFtGe3-r8QyHWw3LgKNheUc3kGLpPXC_8QRn8uy8
Message-ID: <CANiq72nJqFOR9vhPBfZUNrxU+M1HMV6wN9bN6i8e9rf_oOD2qw@mail.gmail.com>
Subject: Re: [PATCH] rust: security: use `pin_init::zeroed()` for LSM context initialization
To: Atharv Dubey <atharvd440@gmail.com>, Benno Lossin <lossin@kernel.org>
Cc: paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, linux-security-module@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 29, 2025 at 2:57=E2=80=AFPM Atharv Dubey <atharvd440@gmail.com>=
 wrote:
>
> Replace the previous `unsafe { core::mem::zeroed() }` initialization of
> `bindings::lsm_context` with `pin_init::zeroed()`.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>

These were also sent by Benno, and in the issue he mentions
"re-sending", which usually means just adding your Signed-off-by below
his:

    https://lore.kernel.org/all/20250814093046.2071971-1-lossin@kernel.org/

Otherwise, if he is OK without authorship, this should most likely have:

Suggested-by: Benno Lossin <lossin@kernel.org>

Cheers,
Miguel
