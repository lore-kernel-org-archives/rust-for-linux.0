Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3225F374A17
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783127; cv=pass; b=b+4o20tZVtGKjoxl935jz2A47zgNZLmhmLLrGDp51J2ZAW+MmDOmgTeQb/jk3mu+Djp9+TG8hpvwa3oFiKVmh33tqT2dsPsRWptGgGXooDEcvpcJChH9ZHAaTtDU+DZ0Qsn9VGpg8SWNb12weRyHbjJajDx/8xXW+Ddm6uZUCGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783127; c=relaxed/simple;
	bh=i6GmaXuuU+zwtj2v1bb6dDRelxF99MNSWJOfop71WYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CoK0fY8zAVqf/WUPcRDt6ORIEvqpGXpL4Uyd4jLV0zLAvG2y/wi/BzkYYC4H6zg/8LUAWYzfW/jJW/p72vicYiwyQbk+jJUDt16c3fgUNoilKrjQSlHDAvTn+BT4BPyL3UzR7IvnSKonv06aSHFbkZd0Fg+qjQYGvX/lByLd0N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qRC3q1U4; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qRC3q1U4"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c5d196b0bso138038eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 08:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790783119; cv=none;
        d=google.com; s=arc-20260327;
        b=e8CW3iFNyX5GPiXdwmkELepXzrTB/EPweqlIyWTgN7uVZbEeZeLgRUkf/73oeWxkm3
         nP23JLfYtOYRVuGU35fyERMmkOIJz5h/ikiT5oKIbuxY8Trr94uSweEb/D60A/1C1PTK
         oMNi1GAy+ADfvt0qLfPy13FaaCQufdZChBBjHIc8EnjCMQZ2j/TXoMITo6bIVO63HwIF
         cINupR7SSlu2CMKlBFfdZAS48F118tr0LIs787S8ugRCbY/TOiLNNItdSIUW4fkCNWFd
         SaTBuXOy1cp1LzxsmftRnt3uTDQbgFKel0XToXDv74gde9NvSWJo102Tb39SYEApU63a
         dWAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i6GmaXuuU+zwtj2v1bb6dDRelxF99MNSWJOfop71WYo=;
        fh=rUaJKMV83oMoHTik5IFXIeCWyy6B8LgzRiUntpbdjaE=;
        b=c6jK+I3pTEK15nPLgkbtlwpBw8gg8V8Bw87KEsupn4G/fUc7YNiNK0wXbVC7azwxPP
         A7+sPuMekKWXs7iHcV8soaGs5/Y3e7wxoFGL36uRDM+ejypOSvJb4zy7etGkCp8R92VC
         cGPjODynZaPfcjShWRtrHDdUOjChNyO4lvKuWby0g4tOFB8kriGIHR41g2cU+5D8ftWg
         UB6PhU0ysLJ6Oz6mUsouU604kxWfiZXeFKosTxZFIlZnmhgRybZ1jYOnbkb0hLfo34Zw
         rF/iUkNaYPLp+cQ60PB2Pv2EfUJg1yVAHHKzfNHtItklSUbMwajgcUm9oxOtA4iF089N
         h/Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790783119; x=1791387919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i6GmaXuuU+zwtj2v1bb6dDRelxF99MNSWJOfop71WYo=;
        b=qRC3q1U4Jm+Zu721GKeU5MDnP/B/YfgcHDimuBO5GEsiNU3VKKWDkCTZEnb9l6VNdg
         2uX4rKqKKIRYnLId3f6QSACrT1BuYB+/v103uivfoG2uzHbF0YZOsIgq69yeNBh1I3e3
         HAnHMqj/wY9foUx+zI4vVlmTk8XcjO0FPDfuf+0XeGg5BWx0ousOEhzuYVoipo3y4Q+J
         B6+oL/hSVZ7tOHagecfCogIYPBI4rR8fabNJ6k8iGEETNQhY9vxiznMyv47p1Haz+9ym
         0WgLUCer3Z/1LejsxDM2pZNMPbS2DRBHB4tfobW3hNvGxxVKmqG24dXqTo/5yhxOO47S
         LQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783119; x=1791387919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6GmaXuuU+zwtj2v1bb6dDRelxF99MNSWJOfop71WYo=;
        b=uX2QoVxi6UuZkD6+xQfXZmNheV7hi7bXPJHqTHNE80pFgvlgDfzMi/WxuqYV1+czSj
         iaU4G1KiVj279wpCQukaSXPyeYz0VQGDuq2d9+gX/xfBuoWrYmnUQSEYI99vVpq6chTm
         csZ9i22QIOz0MkNaCPlVNfaxHdP5hkmWlTwf0sldng0yJ5mjIEeyK6b+Irpz3cpi7VNM
         J2bJLrk2+cS2NcOk0rLkHfN6W70f8VRfvAEF/NnyE4i7OUzqQ0OtpHKGE46woFe1DDKb
         DXVS70OJa10jvCCkGYT4hylMtb+OWynLjBp+b6tf/t3zEleUN+R+lPTaVNTtDPgi/3I4
         0Atw==
X-Forwarded-Encrypted: i=1; AKwUvBxL5TlB7TMaUX/LGE4wgRl43+PHnxcI++XFAhxwNoEYx+6igOxUTNGek+hZXhV8l0W+pwWcr5LClJdOovx4vw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIDd317tWp19DnXFzBYkhis0b+196MoK+jrfdkwtx02aQxIs9bz
	kDqX7yVsO3109gx+F4YHjvQLLJnULej9ranvjNnnLP8kXIAumTyltMlUzYtTrMIteA5ETEe4qir
	Rmxo7k6odDgijCmMCAa16oqYGYlrg/gw=
X-Gm-Gg: AYBFou3O97mLnHEwTYeLRmo6HTm/vdUud63X9I7cyd5g2hTHZNyT7vuRBStsY4cjGMs
	1HsmxrmPHD9TZBA63+aFEq8YkPOLJaqBqbLcvPH14r01oUwtgRbrmWo82cus3TxEaataor0rRAC
	YicRRBGUJXfNC/7kAC7d+n3J1a1d24+CB2GDYjquWJSIgyVTUjs8pg+o46thJ9/+liwQNiT50ei
	XB2L/xxKYzirQo7qEBSanqJDeEfUg6+fmnSGMTWHS3MPf1l+QKhGNX5SY9tcCe4rG7dktuwuKEL
	H1zd4fszfMt/XmxpL1Z4WFAHN4K7nujHymBlpCTWaFHpRPmrnpYlsqjhalgnmqXPJaY7Oz7Ert2
	ddSse/hTSmDbgcTpwYosMvxEpackHhh+/BtYjB0zCirZgXmMWx5up5WV0o9IZ14UgqY6U68o7/n
	Mvam2bSlC+6tenwneMo4AMy9ZyJcYBsi6JXvFKP+ODKjVVKGHzoxc=
X-Received: by 2002:a05:7300:e9c9:10b0:34b:7c9c:9a69 with SMTP id
 5a478bee46e88-34cd8795e5fmr3668963eec.0.1790783119173; Wed, 30 Sep 2026
 08:45:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917051147.98775-1-tweek@google.com> <CANiq72nRLF7PmqqVUrAiw_M3dYZCr9ifoo+Q4SuXfBQsAFH-pQ@mail.gmail.com>
 <DLSOH1EVCWKD.XEIME3CYEYYJ@garyguo.net> <CANiq72m=rhBDJSSPBZ3yXb_r0jiCq7f8KOy+Fs1k8SzWJUwkhw@mail.gmail.com>
 <DLSRGVBPWMXX.1LAWUQHDYKLCV@garyguo.net>
In-Reply-To: <DLSRGVBPWMXX.1LAWUQHDYKLCV@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 17:45:06 +0200
X-Gm-Features: AclHuK-xcuO0mR7ZCevwePsscH8hBfb4GfEBBZrYNyFBbqkPe1_OxY6I5DHFIUw
Message-ID: <CANiq72mi-9xCyX0VfgbXwvSQsfvowzOdsTGVF1HpKy_h8eHesg@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: allow non-ASCII characters in `authors`
To: Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:37=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Ah, that's my patch. It had been completely paged out from my memory. In =
that
> case this is indeed a fix.

Thanks for confirming!

> I don't think it's worth tagging stable though. It's not something worth =
putting
> effort backporting, but if AUTOSEL picked it via the fixes tag it doesn't=
 hurt
> either.

Yeah, I think it doesn't matter either way. I can remove the Cc. If
someone needs it, we can backport it later on.

Cheers,
Miguel
