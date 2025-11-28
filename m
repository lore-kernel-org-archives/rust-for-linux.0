Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C82F285058
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 19:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764356978; cv=none; b=N4/kyVNz64TRbRHFkkRjBtBKm1pHjiRkFbWL37w02/aXM1N9HfEbwMPpB6A7qDnEyF2ND8RcljZm8g4MidWtgfmvItPhv54sSvorW+y4dr4UYzPNNrWy7hxboAxmprBb8rKUNqUxh8GOF3UawTsD7rBL/jN7GzsCliPJsJ0+qps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764356978; c=relaxed/simple;
	bh=WZYXsmXZiDc+6oGbeZOkNyKJJ5gm6081EhkQ3e00Wts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SAv8qQFu0uFMW8XQrGHrbbIQeCWciTThy+qq51DO4ef8Vzx7lco4mcugS/6YPASL7gkTfm4Wpk7rb5YxSatmiiina8SgV8/EcRF5XW/9XATiEK158vdHUajODPjJsJfizgcPLPD0mpqOEtRoW+B9eWGrhBCMAGrB+xEBM/fGk3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtayefEs; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtayefEs"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-297d6c0fe27so3046155ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 11:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764356976; x=1764961776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BT/5LJ0ZitujHfqNEYrtQtZeuMs6gXK20d74EIzNeDU=;
        b=mtayefEsdURTnVjhR42++T1/TRMHTRwCZykrHFek6YR6CRUQDVLh9KF8SrC9PRzmfC
         oFEdjQRG1vA/fXho+X9Ut9cS+KTie0Zj4MUQ2L5f3ve6DSWjXNVvZ6GGZb5CKvjn2AJM
         TMkZluMA4ZkpBItrHr0kWsVqmttFNC0cnjVGROi+qdOcyRP1y1Jvuc4rChwmmJOxWXrl
         o4aj0pXCMF8EMGwV6k7nyWnk4vewFsW1GxI/RXN4pZt90mciZtBL/XO+/t+V1zAcHOLw
         Y5+7vvIKtTXpkaaS9AuLRhLea03Zx4t4ldBBlIABYi9U5lYC71oFAjwczOqfyOZDKdsj
         eD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764356976; x=1764961776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BT/5LJ0ZitujHfqNEYrtQtZeuMs6gXK20d74EIzNeDU=;
        b=KWtmx3leCgOU22XI+MtLchlyj8G03KvZP7VLdJ/0ajCjoTUstBCKewJ0Tmoz2KGSna
         woDlCZpHlRaINZTbUdXcaA1ss/6vfGpLaLEZooB49nKNNO6Ss929rh9JkHtHR3xUvOTR
         bWIw0KnrRj+ERSBFWb++WcZg5vj/jvKMMeSKL/xMg5hzd/yRBonODDdhcOochNKuuCXl
         YfkzKVA5I8nwvEEITmlxCI8+FzdQGAbCXRXoYCqHH0qszgRrbiYphM6hyDPniGY7YAIm
         G/dQ1bVAED7BDRVk/XjLOKcRHfCjHxqmZixtQAfQObtMJrnFK0UpZNZSlxzKx1UmNg70
         UWvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWte1v1pU9QVC9oA4uqg4JwlkRI6pBrD9fOK6QhJ6GBYFPbkDkoscJ3xAwSZdX6ynfkT2LwF3WS3ZoFND0jDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxH8bYhjIlUl5aZ04anrj11id7aXVl9lWgl1mlq4u+2rn67raix
	Y0aDG8eiLLOuEcqwuPx1xCi/nzRTXQeUJNw6B6praSyVPSgDf7tqbp+9fK2lbTCUedY6Qej7e3C
	ouDUWJIs43tSz3clJ/iCX2OcCpEzlvf8=
X-Gm-Gg: ASbGncv78gEV/lDNHtedvbb2u4zBrpRfWJmaddkvxk7TClC1Z7mEblg7y1u55mRFj5B
	2x61nFa9TgGN/+fdj5+S9U+jalUjRKH+VXnUydIIQZD97FcJkgHQZoVy3yQBWYstQkWwSxB9Ew1
	23xxFMommEny3mwXgOe2JvSVnFewZaiCP/Mvh/+gZdn4UTbCdp8iJbJJ00h/+XJuAS6CH6q4F2q
	yEloWVJbTWzkiZzDUqqnUpZ2lL/mXUG0Ue0fpvXDmmeQ8PlIUUWJNeeJ1TqVR8SRM0LSMcxocVI
	rkAjYFQHSMUcEx+0VmeuEDAnmg98x7k9P+k7JbRu1aDO1NBDK0FvWNXwoNFHUBXNwlSP82PMIh5
	2YiMQNNbc7vSkxQ==
X-Google-Smtp-Source: AGHT+IFN0Rwgnn3PVQ9n0wV3KvasSjG79tx+LlauO9VKJzPdjNUV3o9dyZAhTjJJbkqOnY02yyscnGDaExH30tQbEgs=
X-Received: by 2002:a05:7301:1906:b0:2a4:3593:5fc9 with SMTP id
 5a478bee46e88-2a7192a30bfmr17815118eec.3.1764356975613; Fri, 28 Nov 2025
 11:09:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117163112.22515-1-alexandru.radovici@wyliodrin.com>
In-Reply-To: <20251117163112.22515-1-alexandru.radovici@wyliodrin.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Nov 2025 20:09:23 +0100
X-Gm-Features: AWmQ_blHhb04pD9gMUbg7ExDzFtno_SLkXhREMHK9KWep04iPr-cQ60rwQ4yikA
Message-ID: <CANiq72kwr4EgqEBa2X9zdEK-iuhKyOUt=9sBnQWTpBqt-WFfrg@mail.gmail.com>
Subject: Re: [PATCH] rust: add a function that returns a reference to the IO
 Ports Resource
To: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Fiona Behrens <me@kloenk.dev>, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 5:31=E2=80=AFPM Alexandru Radovici
<alexandru.radovici@wyliodrin.com> wrote:
>
> Co-developed-by: Fiona Behrens <me@kloenk.dev>
> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>

Procedural nit: every Co-developed-by needs a Signed-off-by:

    https://docs.kernel.org/process/submitting-patches.html#when-to-use-ack=
ed-by-cc-and-co-developed-by

Thanks!

Cheers,
Miguel
