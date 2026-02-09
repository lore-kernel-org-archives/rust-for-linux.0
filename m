Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0A7238C29
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 12:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770641294; cv=pass; b=tvcnqzzchcMEIzHHZGrz8H5LTFiqfUl27Ep74Z5FAcYzctGG8OR2qYwOeEfWIRZ0dlowJrwur5fFipglktqot/YUswlmA0PqWDu75ONrVaA2HYIL6bSmg2csDd6Rp+UWk5CoqrroSgYAHiMCxaceE1p3moP5adU6ebMFuWNYoGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770641294; c=relaxed/simple;
	bh=p8xuouK9ZiwcM2MV9di4qerfc4MsxxZfPmqa8ZTA54I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+s4y95CANPUyenint/jGSI5TlEidDAocW4ssOnT/KI/LWPbTvAHqaM+jkX+7pWnolIjL1ptn7QuFzg8q3T+XXjztNVHbpdG3rfbPxgTd95eyp2IOYu3xGMx0R/Efi7jEI82SprSCGnHIR56UKuRH8y3aElZn87Q55XZXCsSB2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClakaICm; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClakaICm"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b869dccccdso98811eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 04:48:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770641294; cv=none;
        d=google.com; s=arc-20240605;
        b=UAILV3FsRQxWfW3cIOlxWCfTnWAHaBcD5wipMcC/5Ll0ZidcUt3jW6gwzFApAD85Og
         ROjxPrXqfaYDuMvpKFkXHcO4pfK7RCrnxbVd4Cb0m7jzWa8nnmtFL90XypxA6xgg+EIZ
         QyTm1JkltOIiIeopcA0IXk0KmawBpJmDdk+TKD7y9onwZs/mWrkoL/sfH02h6LIbLSpb
         MsKNRLHtc+D3jCFP4W3ES8deKsY1qqKpo3EMtDJx1L/tMmYEqoZi/wn51qaK2tgkaP2o
         O7+bfQrKogPQ+xlk23dPzX4hN/Hp4+viulBYdCw1AzZRHg8x9dmIg3/clD4+tijxRffF
         Mjyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p8xuouK9ZiwcM2MV9di4qerfc4MsxxZfPmqa8ZTA54I=;
        fh=1oULr52rFUEYNeW09tATw7gl59bdFdTqsfaSgw+NoSQ=;
        b=HLIakPJzbzc9+UQKVYMtsDbwOjzLGGqljmI1nMh95x31TjeqWYBvTTsKyx/alUuvan
         Skf6vt7pyskizlwgtOHCqWRSCD0KmKRmHCOWPkMFE47di9Wfp4hVGHTonUYrogzTNiXb
         gShTmCIwcVv1Oy7qBt/Q4Gkd6HR2jxDPEbznLSEWx4WslvBvRTHmUgNVlA6O6FKIrE6q
         QLTxwzjULfk62zjqz2uTy+iIFqozFbqTow+eFx9vEsMIOtotgt6qCyMY5o1tyOcciseW
         /ePCqtiF5aDva2U6f4ap6ZNwVWG027y4FRtPyM8lhxMm9oxkDfhA6rWQRCc9XLiURwVr
         sV0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770641294; x=1771246094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8xuouK9ZiwcM2MV9di4qerfc4MsxxZfPmqa8ZTA54I=;
        b=ClakaICmsE1yL+UafRVq1mZpUEutWrwl06UbF5Lzftu/tgcx6jIuZsK5V9RHIZVCL2
         6SgglWqooQgrkA3BVw+NITAvMmw29z+k3u1TehRwrAQ6uFvs7gLA6oA+j3N480TQc6+h
         qL6D1rWYgTeprCVZEYA02n+sLqPXfct6LmyMmTUnZsbb1EG+/p9JWTQX3qhgtofVgcq+
         qgpoPuW9IBTNsvvouyNY4Qf5d9tkWnXRdLoEYCcTmY8aTkNQYoBDYWZJMCbDvjX8WAUR
         G1aTXDozVgt4/2teV0hZzOuFFpKnDrFMklOfdn1v0oJRSv6b0yaGtHT9tHZ5HDJKUq+Y
         jk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770641294; x=1771246094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p8xuouK9ZiwcM2MV9di4qerfc4MsxxZfPmqa8ZTA54I=;
        b=RER6ql8h6UDlYFHSwasuNHFRpVFiJLSzd67AuFYgvj7fTc4nU/dBrv+LjvjIBQBksA
         ugPZ5mNjbZ5oGyK9nu1K5lsjVFdGFWakTyRPluZZuo2Wztook5+az90yDniF98hVpz9b
         v0eazA/yGzJTpsizPAuhV+8fv2NjFRhKM2dfGEgye+Z68HTkSbnJ4XgXPzVIiBDQf5oU
         z7V+P2zCIGOt2RajpJ3oWbdKtRNx+vrPje9FUYSM1ICVujYIgEPG8Nfrt7W32nN3K5z6
         wYk1hWqcMU4AVJgweLZeGkdI2jVUXm1QZ11x6pvCXiQQRhco1hq24xzN+jXY/dmW0yN6
         B7XA==
X-Forwarded-Encrypted: i=1; AJvYcCXGpQDuC7MRWWFNBlVsHy02wwv3Oh3pmr8N8jtz8/PGLn1seCs0LXQVHplp0bjPSvJ4o+Ftg9/T6O1f5tTcjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzApsUU48ya8lhmgJbuv2FU6UKk0sqxntzHU0ba7+to1S53cV34
	bpWjJKBJ5X4VRPyqLq51OpWmrWcaYoLBBmgD97UnnTs22ZxnfN4/6/McgxyrbH8WHkU8tDMh/F4
	+cOD/EA60YGfdfOOyA4V3c64K1IQ/rPU=
X-Gm-Gg: AZuq6aKfz4VRrJ6V4UCqnbkVf4rFOwV3n9c+qZOfl6sfut0fQw6ZMGHhphgRdRCTako
	Oag+RFTiVpoMsF4owrxBjsRfihM2uiQp7cIdjldeySqldzSmBIKVi9KShZvJu4LKrkIOpjRGEZ8
	Ku8a0tGHp947Q1UNkYHb+WYjgoZWhSBg+rtzfLqEQpg7h7/QKiT8pK8O0TfPrqvxa53yJmEVgh7
	SSC0qcChyuhrm6/YzDw9/FEyFlZrG79fGnZMY7XYU8Qz+amr21Bh4VpgNND0dozEWd2XJ5XzL2U
	1lDjAWmj8o2VkrcQ3koOyWhtRdgkD98opNy6hDyb+ULH7E6JtSxXdyI6aNF4RzeWQ2pBVRUAK45
	F2cVhud+q0MLy
X-Received: by 2002:a05:7022:f110:b0:119:e56a:4fff with SMTP id
 a92af1059eb24-1270400d2efmr3145716c88.4.1770641293834; Mon, 09 Feb 2026
 04:48:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209105456.1551677-1-mkchauras@gmail.com> <20260209105456.1551677-3-mkchauras@gmail.com>
 <CANiq72nqH=H4a_Yo17KPmku5pPRMVRBADgj8j+=TcR=3r0vOdQ@mail.gmail.com> <b07f1bc6-c63e-4b97-95d6-c639186a89dd@kernel.org>
In-Reply-To: <b07f1bc6-c63e-4b97-95d6-c639186a89dd@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Feb 2026 13:48:01 +0100
X-Gm-Features: AZwV_QgErW1i3cdVg9NCUS7ajodA3eR57gJ3TzoJcEMEoaMPMOSJAFJmjla3p-Y
Message-ID: <CANiq72nkVmE_91yz82e1cRuJK8F9SPP5GpD1mT=NYLBbRTL8OQ@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, linkmauve@linkmauve.fr, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 1:29=E2=80=AFPM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
> As far as I understand the patch is complete, the problem is outside the
> kernel, it is in the libcore provided by rust or the rust compiler.
>
> That libcore seems to call __udivdi3() and __umoddi3() which are not
> provided by the kernel. Instead if should call the functions do_div()
> and friends provided by include/asm-generic/div64.h, or provide
> __udivdi3() and __umoddi3() on its own.

Yeah, but what I mean is, should we add this if it doesn't link,
especially without a note or comment of some kind? (Perhaps to your
tracking issue in GitHub?)

i.e. if I understand correctly, you prefer to not add the panicking
intrinsics to `rust/compiler_builtins.rs`, which I agree isn't ideal.
By the way, it would be nice if IBM could join one of the meetings
with have with upstream Rust to raise this topic again with them.

In any case, it is up to you, of course. My only concern on the Rust
bits is on the docs side, the rest looks fine.

Thanks!

Cheers,
Miguel
