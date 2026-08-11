Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4333264EA
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 06:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786431265; cv=pass; b=TDloWEkyqt4pQp8WD0clnfLPI0QyJeciYEmBDsdAUavmkGvGicTUQ7izVVMJuTIacOtZS8U3hg0UGVIiqWihN+dBeYuPdH3XMtQk1KptFvRA58bI26tlJq2odXocndVm/mznALCRvC7w4CnR37CN6ENWJACJ9S1D8EI2ujFoR0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786431265; c=relaxed/simple;
	bh=35MATFdbyLHQ0QlU5OvOz6E4DM63JiVxcT0f42AVM/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QJt7j4sfWp7iZihyTggtGIvVKzQgVBO7bcnDM/YFz/xRaDOod6nJ65oGIGopPCPeN//lkK8fbJuH2zRVXjMv+gUNXe6I9mWfUTpC+MocYBdQAkj7gQOBlyQKN1AhEIDy2a8427loTuDZGI9/TvurbiR8HnJydP4KP1prbvxCvTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxvvGevj; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxvvGevj"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d01548ac96so3840505ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 23:54:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786431263; cv=none;
        d=google.com; s=arc-20260327;
        b=JEFa2us1RfbiF0UeUFhzm4izzeLAAlJeqiWM/V7qGaXcDcWOLQghA7WjAq1sv9haNh
         y0VtO77r58GExbDYO1dpZedtO6GB5ppfFZGlaf3BRfh+1pQkvobyn6v6qDDjoWXZC1dC
         rATO/JevMre81hHCo96jQvAensLZMkwemrt6IoPBG6GOdByzwlI6ldfSyH+LhC7CXWJz
         PQsoQ7gtSUi13q6Q71fAMTUgGaR3Xh/OhJTKty4D9X4sFQSCXdLtvl2yOpqRO8FH8cTG
         hmz387uZ/eGAlb6Fb/baCPiS7mBKIoX5Im5hOKOx9cCez3SrHeDXGD859o6Mi+TrbW8c
         Fr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rlJLjJ7PsefaIMUT6ZYfUUy0dgLEkPZhprHtd33n0x0=;
        fh=prin4iec5LJIOP64HWT8KjZNtpWqZGSDPnRwwxz1eSs=;
        b=UGPty0O5FxvYubz8pSUxyPKIcRpXaovJLZSAsor9+S0zJK+LknEluwSPQh9B6PzkBW
         SRowv4WTsSLX1sJJGYT8zQ8WKgmA7i4lIWGQhKdelYF7RwROvgMF7W+8cxuAXsI9nv5t
         X0WOUrlUBAVsZVnQS8AhYon3CuU96eYDMql/BAKvZICWGa0AaGFZKoz6xQq4tXjHhWH7
         6VccXJU/qdu7ylX5PRdf1bi0Temo+aHuPZre5w1hYKD4SO2XeaMDc1x/n+TycDNrxQ5k
         KdRIP8vSyf39Rx7+z6FO7KXH8Iyf+DvVyRTlPVr1uS1Kp98Bmo1xRzMOhjdyN5RPt+wA
         a/FA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786431263; x=1787036063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlJLjJ7PsefaIMUT6ZYfUUy0dgLEkPZhprHtd33n0x0=;
        b=XxvvGevjNJ5AZo1wcj79xDwwwBSRC+JHo+cO21S/YbkfXkMs9pHHZSjIoaB4rJuQyi
         lTMP4OIKxI01V5sYj/0tyKMJ/9YdhzXUlIRxoLuaHIqv0hUA30TlDyopE4Er2aQk2MNF
         OvntgOiqUDoA2DJupi0pO2sqk0B7hRtKThuW6bxdnmPuKO3tS4SPT9m/dRnF2Nxjf+4h
         zkeBaYMjDShSvKumJi7I5Jpz6jd3kwtaoTdcsBsiThr73CsvhmngErClV282Kf3nY5a/
         nYewe1Ohg8CRTpxHBdZFD5RnR4NFqrmc/cZVAaHfZiW/5zYzd5CGcIn4WjRxV60Jq3QY
         SsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786431263; x=1787036063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlJLjJ7PsefaIMUT6ZYfUUy0dgLEkPZhprHtd33n0x0=;
        b=F+T1387XEZ0WDQ8D2DZBludpciED+zb7rQiOW6ps9XvMHJkp5YlBwWBPP56bc+RMZt
         aHdolSHCNUIxIv8bSMrmL878ShbCAB/p2CjXsQwvlce0xpmVzYzz3P4KuXRSk2kJpwHz
         qwHFCRrHQZAMRx0P7yFCZNwR3urbEwKTrQjVqwWLMOMPoJvlNdxVdESVJCyzWjpvUPSG
         OaPc9dN9NEzCH2mbXawBdwc1KIJsgoWW+W9eLAZThEmKjzlHMcR9wakFycF8MP1QEq79
         zaW8P8ASxSmFfLLTBxS1BkdkFJDM9oNqTzrLaiAj3zDaYuwczMDPeUkZbYpRxLEg6QJQ
         Viug==
X-Forwarded-Encrypted: i=1; AHgh+RrXjiZqGoOWBuKeIdU1TA7d5HHj5a9fpoSUZPQ+HaIZ2zRsXQUHC1CR2pwsVMhfm+IB/w6U9YSeXJQLda60ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJjenEf92eEQetflqrW0ujTb+V6vaE2ucTxU/zVrJW9lWCsz6G
	cADgdu+6FK9iF5Z3X7xBW+tJh4C8jvI1NJ2+D7KObpav33ZGAiKIaKSTyYh8HpiKkn9p7REwoew
	p68m8J+yyT3rUscDhyJVh3J03ViskitM=
X-Gm-Gg: AR+sD11AFlrxEn+DO+HY89jDDwsJYras6qyDJAo8Si2MHO0m0Hjhr3P0qWJxqk43Lqm
	6aG3VJ/ws6FbR/c9Mf+9vSwZl81nbZL+sf5khSiCFKRMuKXBg87VWls5ybS8QFFcmMitKR9tH2I
	d77sLXIjj+xvxctIR2DFOOuTbkoxKGVbBi8VJv3KJCLRrTNOvc9LMA67nO9W2q5qNDIvCRu79WX
	dp29FIvCZX6FLhxae5PBKM2hRPLitV4KtsdX3htQyVzVHLZAqSYy9u651Gdv67ONElkifT2T+ea
	NJUT5glSRJmJkU3iYIP5ko2r6lKSfahtdZ7bIIvygBP9foAQYB9Ot9rBf+ot2rSgtIVzXy+3IkE
	Wk+JFf4bTdQPbbR94fudZW9jl9+Xa5JH+erDfgRUs9UInUYgM/l0nhlr+3cjD
X-Received: by 2002:a17:903:3c4f:b0:2c9:fbde:ab68 with SMTP id
 d9443c01a7336-2d3178fd06dmr11071265ad.3.1786431263163; Mon, 10 Aug 2026
 23:54:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808062839.1159990-1-tomo@flapping.org> <20260808062839.1159990-5-tomo@flapping.org>
In-Reply-To: <20260808062839.1159990-5-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 08:54:07 +0200
X-Gm-Features: AUfX_myKDqlVdQG26ONYQTWTZg3qD-tRMCCVa8Iv1Af3XexqEaopTbBgK-C4sS8
Message-ID: <CANiq72kHP1s7bGr4=xfJGR8KY=aUpjOB4OwLEG5E=TKULXg5Rg@mail.gmail.com>
Subject: Re: [PATCH v6 4/7] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
To: FUJITA Tomonori <tomo@flapping.org>
Cc: a.hindborg@kernel.org, aliceryhl@google.com, arve@android.com, 
	boqun@kernel.org, brauner@kernel.org, cmllamas@google.com, gary@garyguo.net, 
	gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com, 
	acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org, 
	jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, 
	tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 9:48=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> +        // CAST: `__msecs_to_jiffies()` returns a value in `0..=3DMAX_JI=
FFY_OFFSET`, i.e.
> +        // `((LONG_MAX >> 1) - 1)`, which is non-negative and well withi=
n `isize`.

I don't think I can pick up this one, because this comment isn't true
for arm32 `HZ=3D1000`, i.e. `__msecs_to_jiffies()` can be higher than
`MAX_JIFFY_OFFSET` and can actually reach `isize::MAX`.

Which in turns means that we don't saturate to `MAX_JIFFY_OFFSET` like
the commit message mentions.

It also makes the method non-monotonic, i.e. going from:

    Delta::from_millis(i64::from(i32::MAX)).to_jiffies_timeout()

to:

    Delta::from_millis(i64::from(i32::MAX) + 1).to_jiffies_timeout()

means a big drop, which was not what I would naively expect from the method=
.

Could the documentation clarify what the saturation is? And add some
doctests? (Also to the previous patch's function if possible).

Thanks!

Cheers,
Miguel
