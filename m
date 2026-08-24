Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFD1283FDC
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 10:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787569176; cv=pass; b=VCaIi49If1zMJQ8Z7168ly1LQKH4309etq9wiVn7Mhgabhzpyuinm8zDiQ5PNLHkJ5ZA072BueQW6WA5f3aS+eySZB9owO8EAQlaKhfzZ9SdTdPjJZtByK1pGv/xR+3ZY8WOgS4yZJu0dEfQPQcNwW6t7CnYgLgKg9uHY541AA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787569176; c=relaxed/simple;
	bh=i+csBIbKMorSN4aSyWH71CQK6AJ1loBY/sSj7Nobi+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U64mCGEScLbk2hINmpzvoARTFbymWg7gLFGLFvmgJoAoIONGEvfRRpF4m9tAfU771GuBynm384AMnsQ7xEI8fhB1Z5Lz7CEsah7F6AkU/qxSXCtTp6Ty2vyBEK+jkkcTyA665suxMs6szbJRTp8csUEBDDvOkEgC4AEyPIRGItY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFrFmUyA; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFrFmUyA"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so435976a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 03:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787569174; cv=none;
        d=google.com; s=arc-20260327;
        b=A5pNy/bT749WhwCNOR3wniJ1pDP2Rj8+gtQUnqsKM80bm0CEoeuP2oAv6ixH6BJrmK
         gd3y39NUWWH3jjpXGr3Mf0uzsC8VhLqZhTqTjmdZi3o8naUXEG+gRbK8xrDbkOveaVeQ
         SatT7ykX9tTvp7Bx/RfUuPRrAUrIXcqitACD89jLMjOeUcNi4TshILZ1llYaJsq+VzTW
         PvQ4tTEsBZdixPfEs0gA6QdK2dGNlEQz3aVQn2y7K/2j/+YGClRURfUqXrcvgEAwH21f
         0PGWmIOB1PnjnHT0Vrs9tF0wvL7F632VT36o10nj+DU4udjkHKnk9lDEnvyUcySDKwtV
         Ax7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i+csBIbKMorSN4aSyWH71CQK6AJ1loBY/sSj7Nobi+A=;
        fh=ZBp5Lj3Izz+ZiwNW1iLdeLWj48yck0DStVoLffV4oAk=;
        b=Du5vtVgLtvOU79ST10A1m19a2jsyChXx2D+BaXOQtQmwpmLhtJWUsyKwNXn6DkkEOu
         AiTxNOrCez+k1xPsUkEDMY5Hyr6crgoD33FpQDVrdcD5XrbmMenF+eu2vMEXgGo2zM6c
         zUPzXBTYaaUUdxAiCS2FwBoEIl6ppQ1vwKkC8wQ57NwB55baGQd1TziFwz26E/luxRe8
         acwDFor/+x0hrNSDxdV2cAygph2HFFSJxyzchPZbuf8agjZ0D60HbrUbQQ1u91cl3hpH
         J+7mbeD9xkmGqPLVLvlWmIMYRSgk4zbpTSTTJonwbbORQYkNAo7R95nDUGPYzHMlTVUI
         U8ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787569174; x=1788173974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+csBIbKMorSN4aSyWH71CQK6AJ1loBY/sSj7Nobi+A=;
        b=YFrFmUyAEMO8Re7dvvtI/nhpvfsJs9eL5eNHm3YeH+h0m3fT9nXyDgXg8vf/VhRz//
         G99b2JHi9mKkBvzIZwtbKfdE5zdLf9rRtCCTmFRy9Jsf38ZWXxg5PUgH36SCRw1JjvNf
         zHiwhDEw2LBexrcbWAhT+75oi2BJRfhQG+GTwXsaLAZwcvvBXG677linQRjsrX6ouKgJ
         U9LJygN/gO5yQQHVaimUkJNRe7v6RnRnaU3IBcBKGT307r/GR6JrOCNyTQ2fi6ZeAm8R
         JvRCrJFJIS3qxOrnzRMiVGRXuMDUsljVvqPfH21yU9hfGw1poSYyocE6GiYid7L3s09t
         NRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787569174; x=1788173974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+csBIbKMorSN4aSyWH71CQK6AJ1loBY/sSj7Nobi+A=;
        b=ObstQcoqfeqc9X/LL+QG3jTJQVSY/Yk+t4nOfj1VNkxRGiD8dcDmft8tExDtN19EEm
         Cshx3yOXIPugW2WOh5xmW1HFtWGcMUuf05rVqyxebCbWSm23c6TF30Sq4A2zJ94oa80R
         ffDGPgYSqkpAivAsJjfD1wR2uQmwudHJaoc1aczSlLI0WIe85/gWKjzVw2v59yG+5xTz
         fQDXevW15C4FeC0N0UCWI52dVwi04eE3EfybcbGBgspTwBuIqM3F+wgj0GRYc3zSagzF
         vrgcT0F/vEK1gQsooclywN3tiz1zNsqjVDbXRr191Qe+PhWg43UXhJxN98HlusiCKiMI
         z+yA==
X-Forwarded-Encrypted: i=1; AHgh+Rp954rFljIKvUAvc3jw51OM8yDq5G8t88EbpxGSgMqGd1F/wCQKAgJS0RoTK530/hvVwL0UOsZDggI+bsb3NQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n9nk+fxTbnW+bJfmWdECK4miuliElE/GBdn5r3t9+uYsE0H4jt
	BVlIYUkERWGJs6Ei3KA1S8otVEt07ZCi0oHK/6aYHTS6UsxIBZ2vAiJrMmqE/6o2fR+9QPsgMGL
	B3N3SvJi3/8T8u2zSXUkR7UPlFds01c4=
X-Gm-Gg: AR+sD13M6d9zeGFwUMBS0GYQCx1BWP7oJ9nOzKqbUMaPevKkivRZ7sID18zh/YoBVSO
	BIWBYqdJZmWom5GjxrrX0CnABuAuwF1RGriPTFXF5A2ZoWgttS47S4jI+dTQRUTCszC4z5zN/K6
	yfS5kF8nPpAQvumXzeDEcZG+CAarYWO76VcpTmxARKOd1C+r1IZ0kbop6eyRMN6jqC3evxAuhlh
	f/MTTv3C7M7YwQ4zwbQ8APaMQM8GevS1lQopEzRTCBEepTtne2Vw+WRoKTfWqseTvfvCjuoxgAb
	Cuw8EUvBu6Ezrs8jdu5ugM1BvRWfDU443Z9GZBqp6z+edTWW+ITEL2JVANucuiIQoDfl582lAak
	vf8dHSWXa3lYB7pz0galBz2hU+Ep0A3M3GjC7uk8m9p8LEqZVmwzntKScrpJ1
X-Received: by 2002:a17:902:ce8e:b0:2d3:a50c:5e19 with SMTP id
 d9443c01a7336-2d64ad815bdmr231792075ad.1.1787569174117; Mon, 24 Aug 2026
 03:59:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ecft7yyf.fsf@kernel.org> <20260820.215332.1257209020327006274.tomo@flapping.org>
 <87bjaw7xqa.fsf@kernel.org> <20260821.185308.614720109603525569.tomo@flapping.org>
 <87se437q77.fsf@kernel.org>
In-Reply-To: <87se437q77.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 12:59:20 +0200
X-Gm-Features: AcwNN1WA403ZB48Iia3fYiWrPmP5SrbQdmGYxyinv6EZ9k2cLhBwe9gZC_inEsA
Message-ID: <CANiq72mvtFFu5ZHUP_EtAzU84FPXSYBFmm2zRMngFj9W_rp4Bw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix forward()/expires() racing with concurrent arming
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <tomo@flapping.org>, gary@garyguo.net, ojeda@kernel.org, 
	acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com, 
	lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, 
	tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 12:44=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> After we submit the patch, if they do not respond, I can see if I can
> find one of them in person at LPC. But I think they usually respond.

If it helps, maybe bring them to the Rust MC? We could have a small
slot for discussing that :)

Cheers,
Miguel
