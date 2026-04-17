Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD59E383C69
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 10:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776423258; cv=pass; b=steLUxATI5Jo9YwgBBENOAFt1oIpHT3Ze9xiy8Zj4slMDGSPnYZoAXAtjR9Qfkzf8vHiFUznXCFo0VtRbX6hraCkoohwq6AIooCsD4Lt3pVM4KDLu0TeeS2zxo/RLkOO4aN0iON/rLMExLxPvk3+IiZArO3lNMFN7HpEBgDXMZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776423258; c=relaxed/simple;
	bh=rYOrWIDSNXAQo54u5HrFdLmmao5azs25TBe5nOd11a8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEESMp26WJH7GH1TWvVP+Z0bpXyT34K1g7i1CsTxo7dcE9D82b/cVIlFA0kecbwmT8TEyeKj/lQjwevbbaaJY1llRPyyIWEa1dqoB11KG1gM3PuuIQQt611g8YNzy+W80R3ABKq7WWadQX9ORG8X0Z7ecrbunA5ZN6dBmwggUt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpG4++RE; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpG4++RE"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-67e09232daeso269102eaf.2
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 03:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776423257; cv=none;
        d=google.com; s=arc-20240605;
        b=XDcArKwT+Go4hTXmUwQmJsnrrhSqsFO+mjrzkaDmx4aVxHC6I/4rtpU3bz6nxsaSU1
         R5kjnJe9P34ZGwbqo+ixVhIMaX/2+NMqiePzhXBBs73DnttLBhfXMyMcn/tK9y9UHxzE
         X61kLEPrCC4GGj2RylV9BAqq3Js2gjD+oPLpo/hbzaktdsRoFJtxYWsAKHvkTL2X3XcD
         7XECNdd7qUmNdHExdO+vzxoh/xWwOU77jmvCXBNLXUM7XD13mh0JHDXxWotbFfq82nyg
         l0qZum0TkYUFDHW9llj2f6eITe7bDq7X0y6wfOWWHuRUOQXCGz3yOs4qMW/OuKDqFAOm
         B7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rYOrWIDSNXAQo54u5HrFdLmmao5azs25TBe5nOd11a8=;
        fh=U35KgmCF9A6Vf4lxCMvQSjcutj/nz20M09qmQabDuGI=;
        b=POzq+nKtVDxjSdJ3mLMXiayEHn00qFAu1Tf16wq6E11ZHB1KuWtcUbg2407hKQYxtm
         ByoOR8ntQ2ee3oHSyyt/HwRbqr8m3B02kl4lRy7YfcvYYYzIT8YzZqG4sOC6dieH9X65
         WqufnuIytsUCGXW4sy2tyE1cK9GP2E5PkwO4LaXVWr/5zYhgr3+wfEbU3wtCdUQDCWTw
         FK2nbFSjNcLXHlxgyVDHreVagxPFNHEB42yooF/5mAQP395m4ZXVM5lfN0LM2mfVh+Ht
         zK2NtgKmjHfeVPtuvmB8nX/2/lzGh3pyCQnGZi3V3+HaqCCspoplIuTFJBaAqlun+8p1
         xWbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776423257; x=1777028057; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rYOrWIDSNXAQo54u5HrFdLmmao5azs25TBe5nOd11a8=;
        b=RpG4++RErmHAAKDAZbhCT6l/NGFEoY2SnzdKJXyitikagcxbsIDT27ggp2PhzCD2hH
         +KV+yyZpcKQnXuviY8Fbpuki40kF7E0Zm8FJnldfPt1t1fPKSdKMcXhK7OJ0MjV2fpgQ
         ZAxZe5VXuKzD3QW3KKnGIbgBCaufRPp/Erg31jBVh7MrjjIMZn6JVYbcjoYc5HhIQmhe
         28mtcglQ1Z/95td0V2nu0t/4irk3YerKd2stUPX0TMoVlYptdfA42f/mVDhfxvaZUHXZ
         RCytV7DPOin0PMMXjuVGWSja3RzvN6J0p8yEHQ6nDlkUmpcWOCfOBQfcqOYsQKW1FBUk
         qPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776423257; x=1777028057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYOrWIDSNXAQo54u5HrFdLmmao5azs25TBe5nOd11a8=;
        b=GctLAC4C2T3aZYK6LUdjT6nI4MXTu1/ez0fvMFklwazhEu+5N4Gow+uk80u54TY2mI
         5cBHKH4Mu4NZScIUeaze3mJU6ERhVIX5Hh6Ss5rkTirVfCnjtgHG8+8fheOAUhO2mNU0
         Y5UbmvWzn1sR8/26VNR7sWp0X6r0Y0duJ4RFK1jgL7ZIOoEA3YNkim562D/Y+nxTFj84
         +WHwGASORSFGimHnqPtRBhCTTzNyIXVunXgvcq01FyOYQgxGCxrzU3LyGzvXRsGboT0U
         9uOBG/nccBv8sNmW4lGwpqHLSq/EZkn5kgqMbOl+d2+TNU1c3w8muv7riMOelpM8YHWn
         6Hjg==
X-Forwarded-Encrypted: i=1; AFNElJ8k5MEdTvzMLNX0XcAc0fhWYyYb4DeJYmqaNuq2cg5u5CMCwYJ+HOIRndLpqo/f+dnm0d2y3gXGeeldad+1UA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBaH2kM6j/5Peyg43mtxmyW6p5yeRLDkQgTn5nyeM1t8dx1fvZ
	l+3P6eiBftZzW5J77KeSLtxZjYgP2DPP1ZwKOI0eqYJeIFDXX6D6qV8Np8ZrgyAN2FtafK/E+GG
	9g6myzMZLrJL01J9u6gAEY3s06fmfXDc=
X-Gm-Gg: AeBDievArw87PVUUSLW8M33wDR8wtS5l9TZpkrVczNyyJ7T9mb2yo21A8+eSceIOV3o
	tRWXyy3UIdKeACuyEkFS57kJmn+Wl4UpHrWttjkphQlDA/E/dnyhn1D9ZLQ2EP/3StGc7LpDx8O
	BSYle5NqqkUz0Z43xv1gHo7mxOfCyuOu1Bq5OLiDgUKEqAviiSojj3zKjlyyVwTF9qu1WFxSmpu
	+PxqVRSrIg/0gUhk+lEYTyd5w93sSY1XMYxcrD9fieRd01xvveQHClEpomf6EygX34NjCYYjqWT
	Na1wClJR1/P9CgXIe1uJfuDlFDIS5H6qLtvAKurF/PL77qFf
X-Received: by 2002:a05:6820:607:b0:689:dfc8:5e2f with SMTP id
 006d021491bc7-69462f04d37mr1237951eaf.47.1776423256628; Fri, 17 Apr 2026
 03:54:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415-binder-netlink-v3-0-84be9ba63ee2@google.com> <20260415-binder-netlink-v3-2-84be9ba63ee2@google.com>
In-Reply-To: <20260415-binder-netlink-v3-2-84be9ba63ee2@google.com>
From: Donald Hunter <donald.hunter@gmail.com>
Date: Fri, 17 Apr 2026 11:54:05 +0100
X-Gm-Features: AQROBzCmlobFC01Q7lv7Toh7g6hjFSHJpMM9Ccx-2HUcYBNacN7AJnZP98WiGoI
Message-ID: <CAD4GDZxGo6p9A07rKAW4MZNdFOYrMVzjkYNjwTqKfFcqKkzU1g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ynl_gen: generate Rust files from yaml files
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Apr 2026 at 10:39, Alice Ryhl <aliceryhl@google.com> wrote:
>
> To generate netlink frames from Rust code easily, generate Rust
> libraries with methods for generating different netlink messages as
> appropriate.
>
> The new 'rust' type corresponds to a Rust version of the C target
> 'kernel'. There is no Rust version of the 'uapi' target since Rust code
> exports its uapi via C headers - choice of language is opaque to
> userspace.
>
> This logic is kept in the existing ynl_gen_c.py file to reuse CodeWriter
> and other shared pieces of logic in the existing python file. This has
> the disadvantage that the gen_c part of the name is now wrong, as it
> also generates Rust. One possible solution to this could be to rename
> the file.

Hi Alice,

I started a rough refactor of ynl_gen_c a while ago, so that I could
reuse CodeWriter and the gentypes in a code generator for strace
decoders. I just rebased the work to net-next/main here:

https://github.com/donaldh/linux/tree/ynl-gen-strace

If that looks workable for a ynl_gen_rst then I'd be happy to help
tidy it up into a patch series.

Thanks,
Donald
