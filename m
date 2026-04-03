Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675C0371D17
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210670; cv=pass; b=Uo0V5LBvzCnmnBll2fD1pV/YRtjB+EedMCaAzwDrxW8mAtoQywYrXf6l7gDfM3nJCE5Y442nTfdsPwOb87erCYap5dBuJr5JWUzkXwFs+ftJJ8TIl/QC4WQYxdMm2wRajIgLQ4HRFSwTWYtg9rMcJmq2J3UiS/1JEY1hllY+hyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210670; c=relaxed/simple;
	bh=5Ub2qm2j/9wtMhk2YXDRQubiyelrtrH9hR7TQ8pFlUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktzKUXetxqleIzz2Ajt28WA76CCgyt15Lk438yFLSVcQGD3ZxT3jrpuHDZFVvpJc2pcmwpfS+tSajQ2NCMKcpW75oO4yf1P3pi2P6VI56K5OY3NPkRTcOQ7vif4a6qPq8j7dWOHoMradDpD8Kd/ai3cmzIkrFm670zsebYWgzqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ucio1low; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ucio1low"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2cad171900dso105708eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 03:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775210662; cv=none;
        d=google.com; s=arc-20240605;
        b=aWeBYWexc/Vh6hN2wEKY0RNOM9YntNr3ah8SDI6ZT2+9a/3FkQPRG0oNT/qoUp7EsF
         iW2mMVR5lZkGCK7i1avROZYynDfo1K2wBuG5sL7adzQB0WQn1PCLLce6A/iOBA1uJr/t
         QDOQnWKz9NuB5MPOwzdDzPa+qw8A4HdsTy7tDa1GigQ0SenQfOH3cOaC4yB5cbQr5l7x
         s/eyXNV/6jsA7dGj4WRVbw9R7SIEk2M8oaXh46P8nAd7fpSyXDWpYuschswn2KNBF2WN
         zbj/UI86Bo/C+AFZgMIDC+RQW0b9OZv9GKxRxttnHs+j1V+o/XpNN8tm8yhG0nn+lq/y
         IZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Ub2qm2j/9wtMhk2YXDRQubiyelrtrH9hR7TQ8pFlUk=;
        fh=qaTke1sDMLmdHhpA5VYR0MNxWzbYT5a8LL5sVBe+eE4=;
        b=h1MmXFrD74mkUfyKutC5Xfz/LBWW6xO6jAXQNb4lNUIYSNHgff4NdeWT7FQNeUwD0d
         43Q6GY6zz802SALanGd0yDDEpCnlQYlA+Uks8eVGaGkQKUoQ+T6NWHAfXbPd7quHLQtK
         6+OAlYtVNva2sezP2hIFCEavSTKTk09avKkNXbtBganxLvi6+A/2KAwRrjO/N9k7qlf9
         woGVWqa/i1UdP62Z9pf67w4+6zl643ztMGb65pjGoxZl5hDIhT/GTCzuWrtphzrPCcuJ
         odyapbleb3yNi9yK8lz3JZOBiqVo5dSIEPNex99hmjs6EL3RQa57dVEbW3S1p3IOkiQL
         kzww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775210662; x=1775815462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ub2qm2j/9wtMhk2YXDRQubiyelrtrH9hR7TQ8pFlUk=;
        b=Ucio1lowb9WylS43hrVgY2EBZDDnSMm+rOs4JZEGD39u3SOD6X3DzoUZkXcElf1L0+
         x6qGG/xFzNUl9ibjkl3by7YUBHYbXUjDqAZT8bWTZoKo7bl05cIj390K1pums52yFob9
         +5u18jLKs41BlAoSQ8AgAmtnCLrQ5jV71t6A1agz8VPTk/wSl8+Z3Heoh5oOi48aOLFU
         Bbu6+RCan8oMZY1M6QyJt0blR/wgp4I+IUfAc0DpfOzk6NfvZQ6F4OuaqQeNY2XfSRug
         KflFdMN6p+LhmhBdOrMCwI9eV/a5ElYf2MtBjifFwn/f7ZeAkrPgxBIPubyl9LXR4uho
         dQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210662; x=1775815462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Ub2qm2j/9wtMhk2YXDRQubiyelrtrH9hR7TQ8pFlUk=;
        b=rGPgg1+rnizrK8mTIcBDwSicgiLWKwOjrcRPWJqlbGTpKHSZiV5gam4viMq7+PEdBv
         WE0swTqQlATlEcTCNh0tOWtc76NWnrBGq3IC1dbQ+aiv2UWFWV88oKtdH0WMAzsMjQ9I
         /OyPMTuLdEfKYys3wu/GnaMh218fj3+jBeW9O+W22L5EJ4XVMFxgwbkskwhH3dYW5CJ1
         h6FAC8H2vfOQzy2fHHkeaIyyY54zmNvR5Kzx824uF+jHonV15kzSZX5TiPdd91b7BlWS
         K0oQLDlqFmNsXqESlA4vFgZSb1UAnx0uI5eDOrc5BT/sAkWC9h9NNSsGrWxKPEQv08jQ
         tJeg==
X-Forwarded-Encrypted: i=1; AJvYcCVervoLf8QJh5F9hpUtZfMzy1q0hdjVTmi+fVYILj8z77PHRr8H+7FBjgR2k7Bs0q9B9NtetPE22fYtOev+KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx33VBj9232Hej4g9FWKnss6c6jnTjD4oEdPW/ZMyE/Fdu/5Ve8
	18+OBc/QxjXtfTxHfTpglLuorRiI3e1V37VZ+2SiC8y6TowSLR9AmB8SROykR+3Elb9GmdNFj0G
	T3O3HEvCw9XEbT7Dxp2GCtlHN3Vt0fiY=
X-Gm-Gg: AeBDieu8D6yNSeMcUAFcfKvEkbHrCrXgHfztS6t3hYeHOUE1LpsMLHH45MGQLj9dUBO
	6eW4hdYtYKUIV3Jhj9jJrc0LIusZuSCPLlGq1tDIkcuM9y5od60SLYE7hfhCNtvpLWhzasFPxnL
	7/otqUAV61ZeyAolJvbqlQoYWP/DA2Oop5C/W2wGi6I9br4RtnuVhP9GbIudZi8IzG2b5NV7RrF
	2YaAJmrHxQwSc3bElNv+vu/Ejq+ns3UmR4ao7oYq+IHAUKl0yRka9uR49VwdEbgKH2hloNex8DP
	N7RYOtl/u4uiDdDnU/L1BBgnsSFnHkfNDT00DI0jLGxTvT9K/igN748ZMfX5BrFtPIUsgnigoZ5
	l9ywIdIxRqWqtpK8uwzX4WDeMNulUqkt0tQ==
X-Received: by 2002:a05:7301:129a:b0:2c1:7ca:cec2 with SMTP id
 5a478bee46e88-2cbfce5068dmr491773eec.8.1775210662077; Fri, 03 Apr 2026
 03:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
In-Reply-To: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 12:04:09 +0200
X-Gm-Features: AQROBzDGWGQe8LG7T9EapBc3mqC597eB6i8cF8SGIYhy3xFBCktFl3DRWuS1lDc
Message-ID: <CANiq72kZOtA27UuDZztLCAfR2rLeO=1a_ajAaza4idrC8AzDog@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Alice Ryhl <aliceryhl@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 11:08=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> The Clk type is thread-safe, so let's mark it as thread-safe in the type
> system. This lets us get rid of hacks in drivers.

Applied to `rust-next` -- thanks everyone!

(Given we heard nothing this week either)

Cheers,
Miguel
