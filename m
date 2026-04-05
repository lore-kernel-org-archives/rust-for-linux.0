Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFCE381AE1
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Apr 2026 23:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775431342; cv=pass; b=IMaLYAII9XR3Qi6tcurBbsOAirK/O76e8B6fU6v20BgC4B6y2NhUrIHdGORVeWqrkP4l1QjWwXBA2A8oMpsY35DA1+gyan8g3oKMlPqHZA97xL11zKE4WIrm10m6Y/2YbRl87kSYWXIh/MBYnPCz/Mrhx5ARyGqPS/MNFzbkRak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775431342; c=relaxed/simple;
	bh=nhl1Cpms3c5xDA0K1CYKc2HY5cR0j5kiFV6jvhXLs/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlzRHxb1RTFbHnr+fVgR+K5P9SNmkyjGH6vAViHcZM6rMB83dRihLfZzp6wI7Nk9jqi9qsYP+K3DtrVJG2qh4mDrfa8q+HFxKpdCsB+CH7BD3ndFrYl7VwYPQPJLJREATLu86eNBTwe5ETu+C901hFSToj7Vn+RfLoRAQg4GLQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAKqwvzB; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAKqwvzB"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bda3b4318dso224611eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Apr 2026 16:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775431340; cv=none;
        d=google.com; s=arc-20240605;
        b=hwVhZDG+5UbfGIDbZmdUAFgh0GQJ9p82SYfpcN04rNrgqcSr+UETGF7VlBMm9mK0V6
         kM9BieCOcqAGG5zV3fXETK9Rju7QkyVD/JGpS+HANodv4el2A7JfRC4IYeW1X576ccM0
         RidlyYDjdTU1SKd21iCwmZClwdhbNkoooeG6F0qy+T89q+Jk0V2MBqrQaa9vBQN4k/Ci
         X8S4qTIq2KW2T/cR/J8rUtoUsFJ9tdXUrpt19D4yXhf40bKKUdshmC0168WAc8sM7ucQ
         38NsFTTB8n+WLIJotO/YZ2qaVmV6zu9QdvCN3fM6BIcTFL+rNPSdv99GViSHuMSHgjxQ
         yBgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gWTEEaxIDnyQ3JjxrGYYllTUGp8ICCNcokYgtb2+9lY=;
        fh=5UMrvnSjBcJwl4YSXIBYM/XQmzFViig+5b1u+B/Lz6A=;
        b=NtZoP3kKq/D5iXMGY36d1HVpVwMMYYlhUX1G3IOdNXvtxQni/ATVy3DcSP7fay5N1A
         kbqx71GHhAs+7O/b+ayHK8HnO1MLaPNBzIXHO5d0L3/y9qen++3CwRyetg31f0jGQRns
         iKJHo7+MqQ0JZsEgTnszM3TOZm8WF3KKf+WiJAoYxteONcE+6wQw8IIM9BmL6X4Fm7j+
         d1cDkNLGS7FbSruebIe3vfydVnJNbjHCxiwnUuiU1b/rDvDssyG/h1dHglVemVvXRZSe
         JRwz2mDVY4iQ/5YkISEFvFB4YKvGTWGfks3pki5SuN4rCEqIn0OxKPgKW3j1ljB+2BFr
         8a/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775431340; x=1776036140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWTEEaxIDnyQ3JjxrGYYllTUGp8ICCNcokYgtb2+9lY=;
        b=ZAKqwvzBTUAaRRLFToKOd++sW/cLVowGWTO7saVJ0mOH1o8cb6GSoWTTGFSFUxu3Js
         opGbNLEeMIbpLRa89W/VJqUro/LSxVOcrS4TC3MsyDGvtb5mmc91ajFKas5PR2hpjYyC
         ZdNvgHUBRok8XFKlqhXoCJBcQHsBSBAwVke9lyUT68j4NAbamhqiTC4LF82ZRtKx9dwI
         qH3r2Se8212EK0d8S2hrDYlpDsyn73Iac7gF5IYjcv97JS7eV6Xk/wQsgIux5gTPpi20
         sjnhJmdMtlkf+YHckoy4+LbF+NmzRaqlGJ16uJAbVF9BTtnP3pEDpwGNV8BWhya+1heA
         TCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775431340; x=1776036140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gWTEEaxIDnyQ3JjxrGYYllTUGp8ICCNcokYgtb2+9lY=;
        b=RRGljSh66BWhaVYSpNWfyPbPlcWbyZc3MI+En7a24IuKf99sSgPCB0SblAOFQNa+cV
         Zr/KKs4PGAMp7YxeyTjFMej7cXxk9jGnK7ZM6w7v9VyDCrbpucImPXqg2WQAzWqFBP6G
         GAi7ap/9oK2vbJElB2SzcucKQ0ihtNTP8lHpBjbSjHd1aP4vraLn8/YeNhnx+HqpdNJD
         zyzElKo+MIxbU/MJQr108x5eLVN8aIOKGrYy+IKwkzSEAmX97p5jyFUHX45CmdeKZqOp
         vX5xRullK4I7FMedUXLpeZ5TH+akyKsNbBFkNrXSRJcvOw4n4ERhT2Wa9mBlhHOYyrg4
         zaEw==
X-Forwarded-Encrypted: i=1; AJvYcCWe5t+xVQNbrvVJAC7dnaoQCkGlJVMAceZheB55qSWd6mkrY0/iVncpKbfHeg1MhQjA3j+KUTQ80mGxiHJM4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEIDHOxkz4a8HIg+K028sRplmxQi1gMjZ1NvrxJLInolxhd4fc
	Xoa+LZ4yUDuThntfEJCV2mmY9tS1kxoPZoA/wulL8bvtgg7PK1htk2W1ZOugP8sZiTAY7H4L5YJ
	KCGQC9AKWZj6qlSW0Y22QLkCUVUxkSo0=
X-Gm-Gg: AeBDieuGzd2PT65i9303y+mB+BQTpfW23U/QXnrrhbu7RIJK1RCYWAouLdaHxo14mkE
	og71AQ/OiljVgC5RbxPdqmpSGF+jS/C8q0vJyrn6c3npBlQwihjfQvp2ZUPZpdqfAiOsPKe8dP9
	dxL+Mq/NqyzdraQ2hdFR4yik7Q/qSgv3jFyOJBnjUJETVszKqFCh2DZS8QDOHFhZV2SReuIFewH
	LFM5TRjDXLLAjLGYUkzfhKbg4yRN6RmCvB/5lyaxTQxgpqv7UwUWxmy9i7SddUmAnVfAGiCYZT0
	q7ww4BG6Yq+Os5qyGH4FLgO8HBX2rpOGBCszou+sEbCHdyoiN0O1l9LK/Jer+byglokrvXzE9IF
	RjSbpnbVJGz9DCzH6rCTarSA=
X-Received: by 2002:a05:7301:6093:b0:2c0:c55c:156f with SMTP id
 5a478bee46e88-2cbfbc82969mr2229166eec.4.1775431340248; Sun, 05 Apr 2026
 16:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404212831.78971-1-jhubbard@nvidia.com> <20260404212831.78971-4-jhubbard@nvidia.com>
 <CANiq72nToewesUCDJS=WBKRvCO-obzixW9+D1vH6s9mJXUeO1Q@mail.gmail.com> <8d8b120e-be8b-409d-9a40-db0f2aa08d6a@nvidia.com>
In-Reply-To: <8d8b120e-be8b-409d-9a40-db0f2aa08d6a@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 01:22:07 +0200
X-Gm-Features: AQROBzDc20_XJT6ggcDd9tRdoICGmeauF4nFV3p3mSBVuyNKsL1zPxyw4wGpmH4
Message-ID: <CANiq72msbAP3F2wtCxA=Zn9w__7bTgUxjjOvS1pR_xOB9pQYYQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: ptr: allow clippy::incompatible_msrv for slice_ptr_len
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 11:49=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> And that bump is destined for this merge window, right?

Yes, but I already replied here to this:

  https://lore.kernel.org/rust-for-linux/CANiq72nbHtFpqgC-CGyLULSH9C90U2bw7=
bmovscqffd4HP0Oxw@mail.gmail.com/

So I am wondering if you meant something else in one of them (?).

Confused...

> I'm also wondering how much, if any of this series here is needed
> soon, to remain warnings-free.

I don't think anything is strictly needed, but the cleanup you did in
the first patch looks good and Danilo already took it, so that is
great.

Cheers,
Miguel
