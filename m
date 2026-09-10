Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BCB3CDBB7
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 07:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025849; cv=none; b=AvOV0MXDP+gXdbrbSBDlP4Pw8gaz4bYNHUPAzmBn94ywPfNVtgCv4NNU2SbAhlBXlvMYaacViow84aZwn0IUKdYdJbWYLzWk5Mt7/vK3xbW6hx7ExWg6cUo8Bw/+KY08gYBVsTrqyI69VLIkbElz1XaO7YSVspHsYRaA2Y+03pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025849; c=relaxed/simple;
	bh=xP2NWy6tbMB5SQ4bv/wOShCOnnsGV1kVmtph8qJeEjg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J6DSSjK5iFYrcp5N16NLN2QIYVS6AkFgG5TfBt7UxYb8q4q5XVAS6kUmPjiY2UNRarY4Ngen6ofvVwNBWiD0PnuvKKDKK7oZ82lHdsybMXiWzbeZqD23kww7ow0BKyUKu8E/HH/UrKGeKCz5NYvTM9jilsNu7nB0egG1xgvldIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwWR5Ysj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwWR5Ysj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DE71F00899
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 07:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789025839;
	bh=xP2NWy6tbMB5SQ4bv/wOShCOnnsGV1kVmtph8qJeEjg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=LwWR5YsjcUJzWAyTDBmV2HxkrISSUbN7fNR32q4XNwGaNMGn1lV/dvYqL7N/X90nY
	 sP9PnTtTx4ufQm1rY4cTUVTO6iMr5kgZTgTw7/5CEKaLy4gqm0L3JAJiJRDXG626ki
	 pGnjuKmeoNC2u48didJ0qxk6O6wyXMe1wQEtp4nJkA9HmClLx3831MpTnz23cTAo5z
	 2LOuhgDrkAGrnNxq4PQLvP6f1Jq040A8aArGU6saqlmXmMeSKiNlA1N8iMdgkSjndu
	 yKxNf7nHubmjxN0Gba90z/Za2jDa6C9tswQKim1kTvKSsONTuSBVcsZiF0IwZBoj3O
	 Md+gr5zDEAZ0w==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so1720149e87.1
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 00:37:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw6i6yk9K/jAqrFxZKjmVW9m0/T90Gh8B3SggmNeQfn7vY4pyMcKDwUpB6ZK/pWwJCVPCcSvke8ISftchkXWA==@vger.kernel.org
X-Gm-Message-State: AFuF++k9puJxlcSvox9IjGYTBPjrwNz16rIbBgDEPEpQMWiAqIeq/QkO
	enUdJxK6q60Bl8SJ8Mll21ObH3W+h3lAyrsYdwX9R3gvRyhWDFi9DGrIog5aPEBK8XvsEQE2oGc
	YuDiIqctwDhZK2IsOgRgP8big1XBTSn7bqxnl6QE58A==
X-Received: by 2002:a05:6512:a84:b0:5b6:183b:d202 with SMTP id
 2adb3069b0e04-5b8981085afmr1156990e87.41.1789025838560; Thu, 10 Sep 2026
 00:37:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 00:37:17 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 00:37:17 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260906-add-rust-gpio-consumer-v1-3-24d192f93760@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com> <20260906-add-rust-gpio-consumer-v1-3-24d192f93760@gmail.com>
Date: Thu, 10 Sep 2026 00:37:17 -0700
X-Gmail-Original-Message-ID: <CAMRc=Meei7Z1f1n0M_Hy1LdxG=NVhkFeEiT3=p5QVpw6BTv3EA@mail.gmail.com>
X-Gm-Features: AcwNN1WblH_4DnqwSoSbaoD4YNI5OuN7Vd8NeXv9VOpbiqzrQs585HeeDA3MWMs
Message-ID: <CAMRc=Meei7Z1f1n0M_Hy1LdxG=NVhkFeEiT3=p5QVpw6BTv3EA@mail.gmail.com>
Subject: Re: [PATCH 3/3] sample: rust: Add GPIO consumer sample driver
To: Kohei Ito <koheiito.dev@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, 6 Sep 2026 10:45:51 +0200, Kohei Ito <koheiito.dev@gmail.com> said:
> Add a sample driver to demonstrate the use of the Rust GPIO APIs.
>
> Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>
> ---

I don't like samples as they rarely get built or tested. We seem to already
have kunit support for rust, wouldn't it make more sense to implement a kunit
module for rust GPIO abstractions? If we don't have provider abstractions, you
should be able to reuse gpio-sim as the GPIO controller for testing just by
instantiating simulated GPIO devices.

Bartosz
