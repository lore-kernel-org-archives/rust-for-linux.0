Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98045292B54
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767195989; cv=none; b=IwGMIBL1W3LSvnJCiNPSsX8dmFzQnwBHk631VFWhQ5V3AZMSk2bjlAZQhw8XlVvktnnK+Wag9xpfpKbmfVkg77DH/c7jktfuoBa5w1jZ25YNMxcbUELT1RyDJD/GKZhO7gDMc6fADB8iLkzocwC5avRVdcjVqlXLTW1rQRvfigE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767195989; c=relaxed/simple;
	bh=HNtsw0ljiLXkvv9HML/Ndt2VWRZlEszXDRsejv2KNZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LgaQzTNgynxiOayMnaZz5qpn3i5N0nEPVZM+DMKf3x0vBHi99jXbXz5tuUuSW5K2hbShWyWm8wjEFThtZMqjbHbstwomTwE5ZOCABijD8vLgnxiRRTnvwz6dRqztIGhaX8DkNMMAfrruZ4Qjy81EMNrVxP0Q0Mfl8xh6nLciuxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtIqi0xv; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtIqi0xv"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34e825b0c42so1687612a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 07:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767195986; x=1767800786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNtsw0ljiLXkvv9HML/Ndt2VWRZlEszXDRsejv2KNZI=;
        b=EtIqi0xvNlJ89M/cwU6iwD4eAVKha1Ol7hJa6erpx8FVEpLSB2969xlUxTRf2Odmmx
         BgmUOlEfVB1ozDs6DAOlGV6OQadL1zyqVmmUkSe0aEiOvdlR++6Ke85eaJgWKElblUGx
         pVafThv59+she+WScODxGnaO4cQPWIy3RWTvB+rXKbbhR3kDQjRe7e1PyR/wey9FpDcz
         cikzzP6QN2lTGYCytmm1ZSxBFJJKlLF1Cio/NVcY9rhhDOPAtWI51KKiTEdWVP0Ii+KX
         oHUH5nipF5Vd38ZWOBn8IZj2iFLpy5eUG3tyoR9lcEhVBe0R4m6Jq8xOGCBoMmkWnsxa
         /QGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767195986; x=1767800786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HNtsw0ljiLXkvv9HML/Ndt2VWRZlEszXDRsejv2KNZI=;
        b=dbQqAROjav7EyleAoY3hDgWy9Ob46aBQ43igRIZxJlNRNSb6/KEN31mxuoQbrRbHf+
         +3RMNHnUL0chs/GVHMkuKW/wBdE1OwwpnwVEgdrjFcuuiBV8qIaxwrCoq/NjYO36fWq2
         L0USIVZ1xjXqPnxWmQkdD6TgB2YiqJhazVsJBxS6BcNGuuEGefFxO3fZIkVb1Ge814Pi
         reR7Y6KWXc+A36PSivEuTNKaKNhkER2d2br4p5DcPHnBrBTBEsvOD5UknP40AYCw40+2
         NTjqIC8Oaqzq12JmvSufbLGVxiIFh8RarKUeTt+yD8h7HK2m3g+qD3Ol77RHhuk51hJK
         rirg==
X-Forwarded-Encrypted: i=1; AJvYcCWIVOkPlmVH1EmoGrH6TM0NWAU2uq9fW1areouuq/XZ+8XD2pc9an/ACFpCZV3GLAyKV948187Bw4OETv2BRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8B4yv8zUgEb9BI/Mmvpcy7AsVR2kCtD4jeuuk0/nhwdRN4dqs
	LpHeTNdkKXC59c9ehhR74V1x8dSfGquXon/cZ8RQNVCX7tCXdydKF4kM5cADShZdw/aOQFZ9Wsc
	2ymAAeaKOsFL6asgea06WD47sxva77Cc=
X-Gm-Gg: AY/fxX64CXmhAITPDdQzf1bQo0Oc0hFLXrW0CXiJb3/PPshYKiQJzzX5BG9PQkFCuJY
	QFPGlS9+ZS4ogGOTnrs4qX2j7SbbkHgkKN3+wyOHJCEved+yFwI3MipYKxjfMpYZ/ZDCekyO0ZQ
	rf/r7AMpRhD4qXD6ODsBppld65gkCXIYlF0AANynEAcaty1gO7fnDBAgGvJIm6OoGqGytXDjbvd
	L5FuyNxPy6FM+0khQzPt501gAi2iaqsph0arCkyKpc3GI+hXV3w5yNwk59s9uFzoPaMk/Nlz3pR
	UQ3vkyPR6Dg9nl5EVZy1i84xJDqI3VA5Sx1foeXPjD0iAYZWRPzfvIHpQkAxCxyQsP3NrGq+/5T
	UFE74SPLCsMc4OaEHBq8jNbY=
X-Google-Smtp-Source: AGHT+IEW14uFr9VATOUQ79eOq5/Fo2wqE114yBbsaqZ+/BaVDT1pLgu4V7Qt5gzDl2UUv9WujW9hjpbBuo/c5QyZUEo=
X-Received: by 2002:a05:7022:6194:b0:11b:65e:f33 with SMTP id
 a92af1059eb24-121722afa7cmr17780965c88.1.1767195986404; Wed, 31 Dec 2025
 07:46:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230-add-entropy-v4-1-fa9485b6d372@google.com> <aVUbqo4wS7_47wmt@zx2c4.com>
In-Reply-To: <aVUbqo4wS7_47wmt@zx2c4.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 31 Dec 2025 16:46:13 +0100
X-Gm-Features: AQt7F2rrJJSM6diz_JQd5iXFecKYOM7FiimA406Vo81rQBAkOErUfg5cQGEVJVU
Message-ID: <CANiq72nuK09czKyhZJCy-LLpH5UZ0iB8SBmEMfXDVNu23gybxA@mail.gmail.com>
Subject: Re: [PATCH v4] rust: Add support for feeding entropy to randomness pool
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 31, 2025 at 1:48=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.com=
> wrote:
>
> Thanks for CCing me Miguel. I find it strange that it was left out on
> apparently 4 revisions of it. Yes, this should be added to the
> MAINTAINER's normal rng section. I'm happy to maintain this.

You're welcome, and thanks for the quick reply!

> Bigger question, perhaps for Miguel: what's the convention for adding
> these bindings? Is it, (A) "this is a useful API surface, so let's add th=
e
> functions so driver writers can use them later" or is it (B) "add useful
> APIs as they're needed by driver writers"?

We follow the usual kernel practice, so (B), though sometimes a user
is known to be incoming, so it gets added in a separate series for
convenience or similar.

But, yeah, in such a case, it should be agreed upon / explained where
it is supposed to be used, and the cover letter here should do that
(and you are completely right to ask!).

Cheers,
Miguel
