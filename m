Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F313F58D7
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787567637; cv=pass; b=euVOKBQH5cM1UdWKl/Wm28SWVlqpIgMNjloz5d3FIg97vm2hE8bNqAfjcDKyFchqJM+a7JywjA3UCI619XMIgVrnblRyyfEuCLYJLuhF5V3c884wmN6CpYe8rivevR5jCFNqlSNpS1fJenDFzswbDW/YbxYuL7gLkn0S3gfwtDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787567637; c=relaxed/simple;
	bh=rTsk7zAhD79ApS0/sKWkLliFhDHabfK66J0Rk8Rj+zY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmHdk5ZGBDhJz8lIxKHOgE/jODpluK0MBv/oxPAlm9zH4A1GFo1dj3uBofq+2aB8YccYKqvy7xoS/Z5yq+X7fwO93H7uz+iCy9jbMSAPrmvsI1iBnGtKUNFhElxvKe080a2V54BrXlM4n2YHt6904MDPkaibUZOQj5aF8IUVcd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QulusW1J; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QulusW1J"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ccdce28edeso3651025ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 03:33:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787567635; cv=none;
        d=google.com; s=arc-20260327;
        b=EeP6Irm5Gyl5roCCMe8OP9a1gJvsgoziFVLqyELBMFHRvJm7lnmainjzfCd1joa//v
         I0RdgtiOGIfliDeGh9HvWGz1fEW0M/brqV47XfBeQEC7AwhMGqk/MpGWlopaJ5nTMwVb
         akUZoj9QWsT/AmFZTZYu7qG5OA6+Ysx7UlypY8UrkmgEN5tUuGVekjzszzRftGIr3MuZ
         qe3xjRITM2+eDCdaLpN2AVdh91D7VnnqIRIfPteINrP0K5GhiLo9+sIB/DMbP23IkZ5w
         Yhy4W+APVH11nLtHfKuYHqVZYlZFviT/uRNQoCYJKqSOIgkxvn+X5UByEgmhGFhY0fyR
         iTDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Sxqv7JcbCSLDzUPku5fhjtOE0dghfe3mxOBWPzMEpk=;
        fh=aTIk70QHuSKA3DNBuO8TvfPF9c6hTibMhJkn7NluPWs=;
        b=c5eCIiBTrTn2GtTrKX+d+7i7iIcYFv0XntDPxijLE4Qt26RKaMZTRORh8H0yrXSUle
         EtGVlmKwbYpJxTKzfICmBVbtyO5TQ9ZYKsgQ4U6JM8F4m2Rq9SzqA6OBp/nlT5lxj421
         +h9aI8yxO/H+Ouu1Lc00Hlf6TMm3uTvSoY2J6wDwC+gtoSTEj3D5JecJ95W2Hz7CvLSc
         FEZ2ASo1TXcWRImIjSX6ZfZ3qOoRDwd17OZOqVWVM+zydsO4ex8jsMnpWif6q7ecM+5o
         C0E0lGhT63E5xsQNvpxXEtkSCGt5KjKQllDfMxSwWOzxwu/P/IxVW7JLybMqVERPPKpZ
         Vqhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787567635; x=1788172435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Sxqv7JcbCSLDzUPku5fhjtOE0dghfe3mxOBWPzMEpk=;
        b=QulusW1JRP++7Bg5FKks8SIRgRBjw05QfmLWOjf86PEGu/25FoRfYgne2kTZh5kjsU
         TtJdA6AxUyf6TJ/to1jFsgX1BMk2ArJA5rqhp0OcUQSA7AtlOes5qOoagnPXu6j8cYJi
         AL4IaDaWBqYs3azjZch6k5F8JOl31M8lwbZn8WfKdW8MzWD/S35YFatxvdwg7Xn6Xa5R
         kia/LAtRP/bijM9+tOEpqAMsGerS2TOfH3072gOA6w0T+HsvBYeIJYV7TisdxuEUHyPI
         MiX237+bE0hiM8Ff7KNtqGTxDCDIjbNVs1WOZ4LSXkYPOIWX+0Xwz3SIR8lCbcZBpsBS
         mhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787567635; x=1788172435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Sxqv7JcbCSLDzUPku5fhjtOE0dghfe3mxOBWPzMEpk=;
        b=OZnxSpmxH38/HBTCKgwnqOcy5DSv2Wd9iIltjL/LhnJufvFzlzf1CWumOcuNo+gz7M
         i87gpYFAHPb2TvrGh18pbbKkLDWyNwXDE1qbs2+8mcEY+fvCnknORrSJPQS5un9suzUm
         oKYEpdzOuthAs7Bq1XPEOxIyRqxCXs4UN4wIuJGGZdA/K6JaVxrF3lVLCe8jMk8DBwl3
         QO21tDjyi5HzwaHkVpyYUWeWmcUWUZXUL2LsoF4/7Wu7jexJDl8SpQ0q4qQeq7DfodX5
         eeo1X0TdtHuUIw+18DRpYBj4q7rusLrDSMcwinUfNS0j3I2CoH5kqZpTHzsiVtacX+2K
         9WyA==
X-Forwarded-Encrypted: i=1; AHgh+RrI+wVFXutLZG9ub8/bhMgebwTlJhrTY3I8Z3kBifWJNIs8Hk+dz2ZH6LseR/2VomWuQaUdPJTzAF9WOjgkIg==@vger.kernel.org
X-Gm-Message-State: AFuF++nFQZUzE7NYADbpYcgme7CjKikPcxoeHORPOlQdhoRhGkH5ATbs
	/LuHCMwpOnom0X/LGQUk+SmGNJNcTf3ECEySnoE76VucptMmmrORn7ICTeEpIf0Jd51EyZDHRPN
	6Do0mzzpg8WlSh1mWzSLt2x1m644BKQY=
X-Gm-Gg: AR+sD11l7OVMc2PsF9bcwlFVnAJe0dMP3JlH9tEEUITUDL1YhTOknPSMwnv3MYK+zQh
	IsqtrvntoYZUOtGnM8M4kSZGMX0v60V44UL9MIDr54WX5CWzmSU4pq7G0FdvdIooCJ23DZo8QLr
	HieLcjExcfb3vv2hdRTbojm1ST4bDbSjhBPIqfSjw/sV8Ap0kAebvDtBpxvbcDrwYMXuEppUQCB
	2CqMwnELVlud1cyOP6CI90XQnH/9vo/4sc7mPlg2t+daZ/s27/ejCOBshMnKLO3ua/bQyjko8xt
	y2o7dpkRh5sTAnCVal5cIroif5nLAtZ58fTDbFTD4+15eDOuwwwAMJzzgtL8NtxE5IXi3RZUZrp
	6c/7aKkvuYoetRw6fWue8CCJ4a0dk7g47ys07Z1vhGfunsGSrwHCrMUGPBcBg
X-Received: by 2002:a17:903:b43:b0:2d2:a952:2628 with SMTP id
 d9443c01a7336-2d64b0d7b26mr223449495ad.2.1787567635111; Mon, 24 Aug 2026
 03:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816133233.197500-1-ojeda@kernel.org> <20260816133233.197500-2-ojeda@kernel.org>
 <20260817181212.GA1249844@ax162>
In-Reply-To: <20260817181212.GA1249844@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 12:33:42 +0200
X-Gm-Features: AcwNN1UQhMeA17Nam-JDCwmn02-8UCEoZ5cc2iWtmyDKrZlCDreN1zPgzdBNxyQ
Message-ID: <CANiq72mAy93vnGZJ+wfwh2epJqSpOhF6XBK7K9XWC6mVEcPT8g@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: rust: keep Rust objects out of Clang LTO with
 inline helpers
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Matthew Maurer <mmaurer@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kbuild@vger.kernel.org, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 8:12=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I am not sure we can use '-mllvm -trap-unreachable' for C code, as that
> would mess with manually inserted calls to __builtin_unreachable(). It
> has come up before:
>
>   https://lore.kernel.org/CAHk-=3DwgPCbZv0JgqoNWMOO+p=3DN772YW16xYk_pmb1G=
U7aeuPFA@mail.gmail.com/
>
> It is possible the '-no-trap-after-noreturn' avoids that particular
> issue but I still think the "compiler inserted" vs. "user inserted"
> distinction that Linus comments on is likely still potentially relevant.

Thanks Nathan -- yeah, that is the kind of "intended" thing I was
wondering about in my note above... It would be nice if there could be
a distinction between the developer-provided ones and the ones that
get inserted for other reasons.

Ok, I picked these up to fix the immediate issue, since they only
affect the experimental mode and only the Rust side. If there is a
better approach available in the future, then great.

Cheers,
Miguel
