Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB531FC11E
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737968154; cv=none; b=YLaJlz86dTJd+cRRyBTp/BmkqD+8A1BLrYUWpLFEP/bmUGLpqwmjsmzyaF3voUN1xyDhWEtkEQ4onsvm9f0mm3Y073hTXRNKJFJNX7IcFxV/bwM+dSm5TkMwW8nuIuuC2X/KuokuYuAPqQ6OovtMkrWrgkHzzn1FmvFo1ct+HUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737968154; c=relaxed/simple;
	bh=CoLrIETEJM4HEmbnTNrbssSE54rz8NaYURxUGzWYAg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPaBniPx4G+CSBkKs4Hxaz+KJnnv1wR6t9N9JitHA+xNpmuTj028a0Y9mjvH/Kxm4QOjI/zqT/oQgfWzsW8GPZ1urNpP2KoX+GszfcdPbAHSxJDQ0AHW4+sS3PXwuJiBfPjKS0ysa+qlLm5QxWvYefDsRA1zz1TclAjifV+34i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZM8P/DyR; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZM8P/DyR"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2166838f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 00:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737968151; x=1738572951; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoLrIETEJM4HEmbnTNrbssSE54rz8NaYURxUGzWYAg8=;
        b=ZM8P/DyR1rDSbDNPf5ZtN2NiuhDSJFGZMcL9ESrUlrZdSHHhrV4gEERC+HCUMyL3bD
         S8+lYOk1JPy/7fuv48zOArPHUohz6k3IQ96QuTu2SroDJkxALNzERP5z+OaHF8pt7Htv
         8UlNMBGkjkwXsq3Bz/yviicAvzawdOCO/6YYMLa5V5VwKD00LfIG7WX7wrggI3p0He/s
         shTqV0Vr68HJ5rURpZ0EmSvsnLgP0fhtiTBqy255IdK95FPuGNOX9l4VSlrbTo1lvTK4
         I+B7+12aqNEa0lPdd0+dbbrXUlrrpxHo32/DHD9LVIbSmJ12DUVeUBLhR1C8BBG1S+3W
         XRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737968151; x=1738572951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoLrIETEJM4HEmbnTNrbssSE54rz8NaYURxUGzWYAg8=;
        b=Es8ZFHcWFxxt2cStD0NLiWYVyK+9msmvTL1x344K3NuSj8oGSp2/pv8PbIcup/fmst
         09u71onACUFwX67ORyceZX/GA0mN7/kfLR5JHNbtw9d/bNrUbfK5Q3LH+z8hpCUwNLOk
         yrWArYYSfPWce/c3xQZrUrrYWKiJY91jeAFSVDqmLNvED5+KZDcqNd7H9BL+Lu59c01u
         asf/2qJAywdlHOARDlq7mFrNaN/uwOjQRrxEExLRLDn63jmaIZbELbOUlEp5dGGm+hcb
         TrZwWR2UJK0WzQfJtc+lH1dNTl8i6eOJ9qqI0pCGXXO9SmLvOVmUN7yX+q2m7QuAoRts
         IF1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsJatsJWRueoDhtFDAzVbcZQdAWzfOuDea23ID6i4efBgOVEmH7Esl/Atk2XUgqkHiBy8WX5tMxaea7ttULQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze+UvT0KL6dyFZCFa3n0SQjSQrqE5G79ElDMDh/P/lLFXsaK/8
	/FXGG8NxGw3GZtrRQyR+e0y/Qn1lCHfu+EPzWYq6vmCxPxiGORwik7Brn18kAnavzxcEDXmvCo0
	NsvV1HA+Kl66KnHi7YBCYOlytLisTwpmHKOee5mqX9beKyrLEzQ==
X-Gm-Gg: ASbGncuru6pdzSG200STZGESF8RNdJZalCHkswpFxbU+n/bYV+WG4skPMdujlj0PD4T
	wr4GPpBj4niU0b/wIjibaHLVEaaIWAfsCw2N//DiuIVCUj0D8AfPmCqPbH7kZXKWtTgqkzb64gY
	z4Q09HdI35dKegk0Rq
X-Google-Smtp-Source: AGHT+IGtHTy0iCGSRrN9Kj5dQNGmPzGkGJu799roqkCaCiLalR8bwKrGBngZwiBtIme84jxsk2IZwE6mTYRc2VY1HO8=
X-Received: by 2002:a5d:47ac:0:b0:38b:e919:4053 with SMTP id
 ffacd0b85a97d-38bf57a993dmr38891562f8f.44.1737968150640; Mon, 27 Jan 2025
 00:55:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250125101854.112261-1-fujita.tomonori@gmail.com> <20250125101854.112261-6-fujita.tomonori@gmail.com>
In-Reply-To: <20250125101854.112261-6-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 27 Jan 2025 09:55:38 +0100
X-Gm-Features: AWEUYZmfsfElH64ieGr_DJ-htzAUPy4pncAoMpu-D8v1qyQyfGzT67r1wWNS1_A
Message-ID: <CAH5fLghSx0UfOc3wycR5CDeKwLGupkBGy2Edf912a=362VQggA@mail.gmail.com>
Subject: Re: [PATCH v9 5/8] rust: time: Add wrapper for fsleep() function
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	netdev@vger.kernel.org, andrew@lunn.ch, hkallweit1@gmail.com, 
	tmgross@umich.edu, ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	anna-maria@linutronix.de, frederic@kernel.org, tglx@linutronix.de, 
	arnd@arndb.de, jstultz@google.com, sboyd@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, tgunders@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 25, 2025 at 11:20=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add a wrapper for fsleep(), flexible sleep functions in
> include/linux/delay.h which typically deals with hardware delays.
>
> The kernel supports several sleep functions to handle various lengths
> of delay. This adds fsleep(), automatically chooses the best sleep
> method based on a duration.
>
> sleep functions including fsleep() belongs to TIMERS, not
> TIMEKEEPING. They are maintained separately. rust/kernel/time.rs is an
> abstraction for TIMEKEEPING. To make Rust abstractions match the C
> side, add rust/kernel/time/delay.rs for this wrapper.
>
> fsleep() can only be used in a nonatomic context. This requirement is
> not checked by these abstractions, but it is intended that klint [1]
> or a similar tool will be used to check it in the future.
>
> Link: https://rust-for-linux.com/klint [1]
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
