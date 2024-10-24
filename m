Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFA01DD88B
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Oct 2024 14:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729778555; cv=none; b=aMS7ZFj/vqbhQH12TgOpK5GkEyX8Ekn/2rHIhZ2f73Fd2quo30glj4X49DZMKeSQlqYc1CNf6pC+fua1FptFN772mgMnKc3XeIdqs7fEQH6dqYbNz1FR+N7CdZjvUd+orwhnfWLonA1y+FSb/827rudwjAq1UnSOp/RxDdarIOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729778555; c=relaxed/simple;
	bh=BJUW9o5T+0389ynSlmZYcdzqOwtWKK+nSqKf4+mdE+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EbAANNs0glNxHDka/AIoa6uOxr7NvTAgZs+/i46qwXMqygBy27QXxYBwDv+ngG20jhiYRec8Mn31ThMxWNLTaSqnC3b8EteFaPu4ByNpsWkRnnw4ui23p1AhJxCLKYHnWUjCfb6wUOt7V9EhONd4cyF01eXVtzQVIyR36/WZa+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/dRKa9g; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/dRKa9g"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e2c2a17aa4so193265a91.0
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Oct 2024 07:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729778553; x=1730383353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cO71aRg65/X23lv004Xn1sA/4IVese/2NUnDNzBuvQ=;
        b=H/dRKa9gPniM6xLfbAYxZWpQ8K+I6oAVIXn9EXRY5wo90hc3EfFDlLc7+fwThE/7bW
         BFsBXHjfyLDhY2ZuU2avEtoscs3e9Ic61mfSSMPCiPVJt+How2nEWDF1H3Mvyx/EEx4K
         +wvaN+kzRbwewZILC18MBZwbDmwoaS/oaQayPikVBvpI4IXh92FlTaMdk5+OoDcYOk8X
         +QirL+wSiFhgMv8JHHd85EtOGIpmY/kZOv/LSMWFexJ/LBZEZMm0Tt47zWSfDfsh2dsX
         d/p3fvTTUujQWpJvpkptelgyCdOMV9R7jCxXCWKIObei81knAqQTc/WuUUMcxzbqsEpY
         oLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729778553; x=1730383353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cO71aRg65/X23lv004Xn1sA/4IVese/2NUnDNzBuvQ=;
        b=btRD80f8seIXPcfuzlI15p+WNQlZ1LWcyEfr2wNb5GckfbnD9OLXTY3EavkfGJ2S85
         IDemcR43zhF1q2MnrqHwJCw4JP6ehYRloKbxaV8k0RglVPlKiQi25v78vnY74HDdV7/q
         bzzK8vLu69zr884jv9rP9+kbrodFXefZ2XO2VteGvBAGNQM6bdVIyz/e2kWp7nBXUZQ9
         jp89uLHQCKudxxuYYiJjFwRcw+LJuSLxKyRn7+yGSCOEWjb+MIMx91VQYTLY8GkBiEE1
         Dup+wv6Kvrv/Ep95Wk6Ae3+CCVuypQ3Or7LjSOWBxQb1Xav++8E6uOQ73fzNDCEvqTw5
         bBwA==
X-Gm-Message-State: AOJu0YxKuSLjS2e/DwF50nWPmu6ufSoUxdkRy3nm+5LX97OVyIpjhZYJ
	dl2idpfSS6q1LkRxguRIq9wF9wfVCzkASlQNRdzihYfrIwsPqWCJlDiChz+z+Tativ6liDzNEVD
	aQbWM28TINWRSwSDqBCIHRJ6j430=
X-Google-Smtp-Source: AGHT+IEB2U42AZlteFQt8sVuus/tnGmJtLO7Bc/DpO11wYXaFZo26JKX1nEykkl91YOp0ZzNGb4pr/4biaSLLjj5sYg=
X-Received: by 2002:a17:90b:4a83:b0:2e2:e929:e8d2 with SMTP id
 98e67ed59e1d1-2e76b6c3194mr2928943a91.4.1729778552619; Thu, 24 Oct 2024
 07:02:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZxkcU5yTFCagg_lX@ohnotp>
In-Reply-To: <ZxkcU5yTFCagg_lX@ohnotp>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 24 Oct 2024 16:02:20 +0200
Message-ID: <CANiq72n_UpZVgcs2=bBGPX9NYbpmGA6TQgREYk+2qAD_8ksV3Q@mail.gmail.com>
Subject: Re: [PATCH] rust: block: fix formatting in GenDisk doc
To: Yutaro Ohno <yutaro.ono.418@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 5:55=E2=80=AFPM Yutaro Ohno <yutaro.ono.418@gmail.c=
om> wrote:
>
> Align bullet points and improve indentation in the `Invariants` section
> of the `GenDisk` struct documentation for better readability.
>
> Fixes: 3253aba3408a ("rust: block: introduce `kernel::block::mq` module")
> Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>

Andreas: happy to apply this through `rust-next` if needed.

It would be good to have some automated checking on this, just like
`doc_lazy_continuation` does, so I opened:

    https://github.com/rust-lang/rust-clippy/issues/13601

Cheers,
Miguel
