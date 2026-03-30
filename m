Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859793ACA5D
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866465; cv=pass; b=YgOjyjEtLhr76xGXqDyu/QeCE58udK/lY7nQSDJ+qiZRrrI6SQ69Tp+lCHAY4FuOKs9JOQdal01v51ZoN2SSWJPtlCQxap9gK5x4crOgfltqBk07Nl3FymABwsj3LxvdD8N3ae+CR8xGPnlgFx4RvjWg6d+u3fs/c/95vMmiyr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866465; c=relaxed/simple;
	bh=d9y55bKppxCwu8kQEd9JuS1z3KUYYcK2BoJdPrGox3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAB6CbkMbi7yyX2bkkJKAy2CJIgd+4asSVICpXJ5VlN3Prj4DOzlBsIuUGvTCniX1ZK7Nx9m00HQDvzgIr4qlHyROr+8f9ayOGaLOcNVwB9rSipcXYcOXdKrMAILwqtc9m8AXPbRIEXaDJ/pZAisRHFu1JiZncJFITDcOh3jUA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sak1P2kU; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sak1P2kU"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-124b07e5fe4so142957c88.3
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 03:27:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774866464; cv=none;
        d=google.com; s=arc-20240605;
        b=a2wnzwvi7tJrXLS6blYw5W2ag9CWsfTRoiDNrTrjVislFpiy/2vXwveFL7J+cT+XrH
         tQ7MMkT5rbA+N3s+Y2w/QdaorQ07p4NT1g2KxDO/FCBMGGEhs9shqekaDtNEz36QyfO0
         uciYBqB++0zm4FZEF3Pz4Vh7h6kijBkJunW9hh+Xet4Mk4wh8aJzyWxE0AnlaBZr4ta0
         Tj+xzwjtFFyooS7D39lqDd5ajQLCXv6G/2zb1CWfZ94vnAwgCX8SBhXPO6DSTp0GaDZQ
         ITgX++/7HtUDzyKE18LeB8Y+s2O93Zgo7KIbdU6MygabkPawAIGlga1iqKFZLNChWtG9
         Zrrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d9y55bKppxCwu8kQEd9JuS1z3KUYYcK2BoJdPrGox3E=;
        fh=9IYl3v6dWNaH5zjv1/OIcEv5jTYrymKvC3Z9igzjvzo=;
        b=jgpNChOXk0rWRHSZbuWIRFpcTuRsVmEt09NKsEypnhkajwkQOXjw6Jd1IH3psdxccT
         YHEKEI5Is4byQRIbF8wh8g38Vp5lztn8l+W0J9G7s9Fcc9s4QkWshpCOUj55iK5KOjBO
         BNKQpmqCjCMp0PDCAEqjb/B5zKcVq5x4Wd1+RRDRKE5Lj6Apmro5rRHUswXCJoNlWK2Y
         jwh8q1kxlzr1J1BsfeooLmiK0kKHoxYg/ZmNhMP9zjD0YobBIQ3BYWv/25IujPljnAu3
         2O/gIb5WS7WLFNtpEckF0sKxH7ildZjHoKjLIlby89vCjRNXV74adCgqojEUNFyPaiuq
         zcOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774866464; x=1775471264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9y55bKppxCwu8kQEd9JuS1z3KUYYcK2BoJdPrGox3E=;
        b=Sak1P2kUGPLJ+21jHok2OEvJKwsqygZFcoRoNDqjwKyu2I5I+z9Nrx2jqFrXyx4J74
         Qxtwh5n8S61HpPbGorLzdfZzH776mp21LsQNRJUYE3PlhxjoJu1xfi/c5F7eEbTU0/0d
         oygWt6qGvliVrAe6U219gLY9yBHsLq9Z3EGnfae/MXyzvBjSG1F/5+oFg1PawnrxzzIo
         j5skVCFiPM8x9aM89S4tBUSU0rtR2s/35ShIQlxIb6mc8gEGrlHWoOopMpZzIV2VhsvQ
         yVWT6p0W8i2dTg0zjY1Xc6vV7qYFAfigtaIltCdBezOr9iadgWS97kEc4fcB3rscOTZV
         YjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866464; x=1775471264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d9y55bKppxCwu8kQEd9JuS1z3KUYYcK2BoJdPrGox3E=;
        b=RaRzJZ9q9/+Y0Aloiz11vMkTDa0g6MIWzTtXPxLcDbJoyjWXfm0kznA+jU2/0DsN/y
         r+E8MDvFtVfGiImo2jhFQefLzdr+Tyr2jWt5fNpsoWK1Wy8dfkoXR2ZJivRIyF/aCezq
         BY5y/hIjqYNxRJGCyn3QKumqLKgz7toPD1BRCwrq9ZGi5iXXnaOwnB1xh0MgHEcrtZU5
         FuFtLrKuHIkbhTMCyBEcqJGhenbyAsnZdXc/dfjipcmbjNtWaMkPZGySIjLNdou7qP4b
         NX6ZmNzW3kSYkZj1XqiMlTEemEGTpQ0nBK2L4N+hR1BfjXE1Cav7kf3whwcHeS5UEmJL
         /fDg==
X-Forwarded-Encrypted: i=1; AJvYcCUeqOV/OeEsssubSKwpeY+d0Vi2tqas5s4dvWxIhAsETb8APCQbAMxYXYO8dga42tbG/MuGkn/kqikA6LRWEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU0KRIli2Bn3ch3U7eiFZeQXpkncP8SoCNQ0Zwit2GLlzMJSB1
	P/UyhfAv/xE/e1+UuD3Cm4fcVlfIC8lHBCyzvPvnHM3maiHCgOdsClgnQu0nejJjz35PMA2HZGI
	Vichi9Aq6An9BSCIUPyqIZbcVJTjI3Kg=
X-Gm-Gg: ATEYQzyVDLOGABoMSE1lwfcjcuCsosEu885MIA+cL5Gc6asnAyBtpqKsiyBrpHqJrxo
	NPwTI2sSTJrL/rzUv/iGTkb7g6xK+O1AfMID/FhMAym8ojeTfeTKxu/EDiWEySNRLq5ufbZ3JEN
	ko0xa0KY4lOzu3cKW0GLQjhNA7KuAbu/4KKgnnfOu1RbFrJcDHzu3BzcK91QWtduaS9BaDIVgro
	ikOkyCTrrHarvBFMBxjCoPr5AHhawWAZOvFA0LZtgJwKejIG1fS7HyvsXOodfQty6Okll2XqY2h
	hXMRXSywrd+fbzhfRb52ubBlbAQ9yxo8itkOi3PTs7Vnf+1HGqe+9lnD1ZDnr5W0NJCKNbr/r07
	V1NcCNykXV23G0zCrBjM43PM=
X-Received: by 2002:a05:7300:f794:b0:2c5:704f:7157 with SMTP id
 5a478bee46e88-2c5704f7c1amr684174eec.2.1774866463645; Mon, 30 Mar 2026
 03:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
 <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
 <CABx5tqL+G9i1ZW7i5AHaTqUFTVRDmBvP=RycUdwjG-GOp4uzBA@mail.gmail.com>
 <CANiq72=M3H-06L7udG_LqTwLykZkAjfy2d5NXQZn5TYRJ+N37w@mail.gmail.com> <acoq7E8NH-ihCq1K@google.com>
In-Reply-To: <acoq7E8NH-ihCq1K@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Mar 2026 12:27:30 +0200
X-Gm-Features: AQROBzBw2zE5e8wBGjGUmjeI3w5sXAYU-mC5MJEbQZIxPhWtE3tBZZKIxgdi_Gk
Message-ID: <CANiq72=b6bFQ=OFEXMedO1JoL4qckRmTPYzFrXGCzgxZZOmbuA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Alice Ryhl <aliceryhl@google.com>
Cc: Brian Masney <bmasney@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 9:49=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> The drm-rust-next branch has closed now that -rc6 is out. If we don't
> hear from Stephen, do you mind picking it up Miguel?

Yeah, I will pick them -- I talked with Danilo about it a few days ago.

Cheers,
Miguel
