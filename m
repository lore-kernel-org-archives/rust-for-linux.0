Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EADB38944D
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Mar 2026 22:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773096019; cv=pass; b=sVixVSk7Gk0efX2uSl/UdXGcCzlhtX0NCFFHqrxadDrvQlgweuAGO7wRlGhN/9893HNWVhMIDIMuvKbvSGz7g6QD9/n0RsqYjazWlBH/8sTED9u2Mb4957ivl3e2QfPkx4M97yyd+yx/x/38zrWR0lX8QsmmGV+A/7A290NE4+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773096019; c=relaxed/simple;
	bh=7ZruxRPvWNkf2N29j9GJ6qz1GqSjD5GFtkioQbQCT50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LOL7eW1+mXF4e5vK1pB/AtGJzjzAHWROTIlBt7Yusd7tUjBw4y5+8X/gZ9mm5Ts3Fa5cWLWGVptOZZ7Cqv5DK1j9+D4PihWUFX63h34qiKSfPTD2GTq354ftNkAL0+MJuj4uBBQN00I0R/uLSWhzAndzpELZnyoLYMeIujju04k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKzKCvI3; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKzKCvI3"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-124713e4244so739779c88.2
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Mar 2026 15:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773096017; cv=none;
        d=google.com; s=arc-20240605;
        b=GFou3XRv3Ahp9SKHqc8hBlDOnzcDPAqOi2JP350D1TVzpZkEiBPu2/1yP176yjacD2
         4Ih4OSUAMCrEnPvaN4wiziZb7r9rzcj0g6GpKv2x1xkaffAKqG/qT+s566u3hwaHSnH/
         F7hNuoizHsIK8tfuu9W2Dj8TMgrLQZ1PPCEtFJ8odOvcpiT0GZOhQk0h9ZUBYMvpp3EU
         LPtslv7JrtromUKPKODTLk45+9Ge4vB7W0lpLTWliUkk1/Kb1XVfCp5U5HvpxVFLc4dQ
         rndPEnlcP/kHOYQlLqFnREdik1zi4Oyo5mgphobRdfmGXUZzoIVOg07Lw7bxG7wjFtHL
         59sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ZruxRPvWNkf2N29j9GJ6qz1GqSjD5GFtkioQbQCT50=;
        fh=TZ6AVHnznbaPH2+0aauBNrLoHhvwQyGGI6GCFYpJJKk=;
        b=OqbUy2nA4b0pWFIv7xdtiKyvLFhSfxn3Qaayk/hcZDMZk6bWNGzpKTNXUArSDXnFl4
         oGg8LI3KS6VWZ4q4Q2VH8CK0ca3iZRqV7lPePJeXPqNSlgVAaEJ5pCJ4N5NsQTig+yCf
         ts/cfyUOE5pI/zHD6Q6pbiehqkNY3Uk07E7u4Ariv4upnkYgHnSq2Ad/HYLiWAwfTvWC
         pUuY8JvTU09usyRliIZ4rFjiJ718d+WEBERuxTH7HKLqIPYYaQD7oBSEPKnfgGl80Rxs
         YtZGlgmqVvUkkppecYdEZDbvofryLk9KmNQmlZpOploib9FWoBwAZMJyEjfB0PWnHOTc
         PkIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773096017; x=1773700817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZruxRPvWNkf2N29j9GJ6qz1GqSjD5GFtkioQbQCT50=;
        b=OKzKCvI3qaATyuK2rCUsFNOh0qp3Z0G1ELbPYx9YwirY4TpoNA2CQjLGs4kTNTUl/s
         0egq4WVTVMVe8OkXHc1/mvGHmWonwtvOTInz7HoK4eD+ry5OGF5K2jNS+L9IDJw3BkaF
         /9huU4wttGlP9s1u6Le5GhESqsDU4Lb3dv3gfh323G25SHqdIn5da+mdRX+4WOQYqroe
         76lt+JdRNZfcSJ74asngJYv8IOIqc++cS4UcOUX3+8FGc3WuRPyDXAudjr/GbMhbWS3x
         Tg02Aoa9/UZU4bHSV0lhF5RVUnmTBeODX3yOYRYss3aleD6nUz4SbG342sR3h6sDbpzP
         oMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773096017; x=1773700817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ZruxRPvWNkf2N29j9GJ6qz1GqSjD5GFtkioQbQCT50=;
        b=F2mZ3wsF1m8ACxaxnkiqLKzqeJCiTMpfMOAb2xjDxPPSHa0NLgUYTKNSMi8E4IC++E
         T0MVrBb98GnFWeogn6bTb1jN/A35DnfUy+G8Y8GCFAOBjxmRgGKoFSjDzuSrLSLcKbpH
         QGYjs+8zehEhYtpc8OFpXdXS+hk2gSCb9LH7q7hLnkSng2/YbrfoSDSNk8mTBV8Qh9EV
         lni+ImYitVWimyEiBDqRm7IJAV+Ab6lkn/LRymMc4AZUItMbgJIvZnv2cudlmcMOIT9b
         exv8KbczVSnPaFP2CokfJZtJgTJR5Y2dAtN9ZaaYhy5g1rkFzkkaTQf1WDpEB+ZLvh13
         wRsA==
X-Forwarded-Encrypted: i=1; AJvYcCXeteCacNRv8dBmaRLRLvrGZVAn3veinemabCY8ZwREpRg7y0F7pGOrRliBGJY6gAGkqLbupKN8gwjN5x76cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE8hEM5OxUyRMJtwMRwGDfXXOHsjSkYlq2vTybKNi3nOfG99Ko
	m+8USwoqqcMCQyZzRQgUKFm0LTMS57Ov7tPg9WF14b6HRWmoDw5E8GMDySBaJfqPKEwPg8sU51L
	jgefFOIuMNjOOYiMwxMmW09P2fiUP4Lc=
X-Gm-Gg: ATEYQzwAK0nzUYe2vQz2gc1NAn+lRHYsYqrZil70NBRPVyFPLkt6d6jusVVItkqGv3F
	MXE6tvb9LYkqVhoPWsNJni5f0X4re8o51dXG8msFEgQSesMNGn8y8YH4ZyymU3JeU+cJjIikWn+
	tLO5J9QGA72C1jdl26WeGdWb2Eju0vfP9zIV6eTYow1z3/Of7V0Aa63fvE1tX8tNcA5KZ3SJJig
	nlmJuHCVM5D/oRIRoaHeBjvDYDt5ODLNRPh8WB4WQIXCfhM/CjOEVuILKhjpdG+UNhSssoENUCB
	RgtchpVF6glcxgNL6zg3f2aF9HJ/uzu5P9YvJ0jrjOtk+nTKPQj/SeYH1Aq165Vo9CbNL3PJqho
	GlkDBnNMYb+l+M9jYJxDK+OA=
X-Received: by 2002:a05:7300:148e:b0:2be:2912:ff65 with SMTP id
 5a478bee46e88-2be4e055899mr2839234eec.3.1773096017354; Mon, 09 Mar 2026
 15:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
 <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me> <DGYI9CQRWXU3.XNDVWJE0DP6H@kernel.org>
In-Reply-To: <DGYI9CQRWXU3.XNDVWJE0DP6H@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Mar 2026 23:40:05 +0100
X-Gm-Features: AaiRm51i63wiK9zFG4xNzbBEqTFq-Q0BP2B6Ia2Eg8BVDjn1989Ch1oIVRSK_CU
Message-ID: <CANiq72nRZhJV3d33h++jYp1iEO3a=+pqrzZXf690Bbafs84qbg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] gpu: nova-core: fix stack overflow in GSP memory allocation
To: Danilo Krummrich <dakr@kernel.org>
Cc: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>, tim.kovalenko@proton.me, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 8:40=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Reported-by: Gary Guo <gary@garyguo.net>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/509436-Nova/=
topic/.60Cmdq.3A.3Anew.60.20uses.20excessive.20stack.20size/near/570375549
> Fixes: f38b4f105cfc ("gpu: nova-core: Create initial Gsp")

`objtool` also complains about it because it doesn't handle certain
instructions, so probably:

Link: https://lore.kernel.org/rust-for-linux/CANiq72mAQxbRJZDnik3Qmd4phvFwP=
A01O2jwaaXRh_T+2=3DL-qA@mail.gmail.com/

Cheers,
Miguel
