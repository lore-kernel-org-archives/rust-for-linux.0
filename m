Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E148477E3B
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Aug 2026 16:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552725; cv=pass; b=JgmF+G5TI5U2wxkxu4HTZRmTwL1KhLyYIhglYThg+ixQZylLjo5nhkvwdpsAN02I09cgYD4hOb+eh6ncdm/OxNIwJWg8/8IwS3G/7bsMG3tpnT14LaWLQIgvMxSWSwT0czwIHh+VLYr5vjaiCXWtpshgZUE15p8hnA6hlJedyUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552725; c=relaxed/simple;
	bh=FkwtoKcFurXiLPrF6tBgQbVw5On3wlCnB9x7wfh6Wfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uEJMiWnxgLdOtTPzn1Kdg7k8LCes1xc3VCsh9DneB0AV4m27tqyE8Tqqyct5jSHM4TkZWT3Hm24bFPtsMgjoNZpHCuKJIgQRtoBBBum6iDewZ9x9oxEPeoUpGNXaXG9S/GxsR/cepvwYtVS7Rj5ZQEFysvG0dXmPobM1lXhVbmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwoNUfz3; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwoNUfz3"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ccdce28edeso2253155ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Aug 2026 09:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786552723; cv=none;
        d=google.com; s=arc-20260327;
        b=oGwlI/+C8gdgjFDoC+2PYWfkBIGYrC4qklK7oi3JCmbAc4U2V8ChDbQMhChwSzSIpC
         ToHK6cZ5XYFkIjo0BWmYNScT6c7dyaq+CgIt5gHk+59+9ZLOS/GCxxzN4uU544NH+zH3
         cJ6ZYpiBaYU1XgkOmzqA62xlgcqrJ69qhlwpR9xSozRBPs0t3eEHDHeLrsEYLH/OmJYp
         piT/QXrQhWAiTU05N98fo6+0MlaBPSQofU1/ubHlp3OJyLKwmGJ/kgZhy6x82RbzcZwj
         k2byegnujDRoY03MCNy1477VMALzzSnz4Okvho0c9Q3q4mn4GTrgmH1vGAZZFeEx8Tly
         mhfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pvNLT0lGjpOonHWc8X1yLFfLsn4B8p6Rym18PoYgv/A=;
        fh=YrbwLTF1DBw3IVEpzdVgN1XxE/eYmXCtsAY6jV8cVNQ=;
        b=CZ22wwV/XnaPwincZLZrijqrfwOURvjn2Su/eWa+eRgudFfSRkfEqOESS/UoxsxOdS
         WfeL87W012QRepQwAHHDEq8QkfjPJdB8GjCxMDFlTElgWgQ+aPFvv5rVXxfNsn6I8R76
         I2NodJluyBpZmyuqphSSrNLpX/oMPAGA/hvFDDrIhfhij+tTf/5gNpAb90up7Jti9aL1
         JJHQWEOLNoKGyNmXWHlh4eAxMpcPc6PlTX7ZLpMvhoAX/v1ttUS5pssB4MQp53vtLixR
         LVRXKY0fpeXx4ot8rZCJCJjvnOtHXgAFXl2eBRTGbClNa0FjKfKRKMnhw+d6sZpegOK+
         QjMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786552723; x=1787157523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pvNLT0lGjpOonHWc8X1yLFfLsn4B8p6Rym18PoYgv/A=;
        b=iwoNUfz3ctfySszb5EWn4K7E8rNYQcgdlG32zfSDBYm6OjRP3uu8KwD9joUjkRT7J4
         9sOsJskV5/ToKHyDveYslrNR1rT3VmnsrC/6D/swgs0++j9BUSS6jvhWF9Z3s5mIPdNb
         78SayW/bVAN1ibk+bQYdlAGgnlUV4nCo+FNyj6kUY5ras3XxIDjLndUI1q0WxVL7qS6b
         OmObfb6M4oRG7CNAWRdI1xHlfkEagi1+QV0VvlXDp3UBpXC6r29QZ5rqIw+ZEPGmQHic
         KDqaN1xLNfq77iFISDdQRapRDNg/Wbu8hyAOJsI7tNcGiu5boHjywN8YmhYlmFS0AhkD
         nLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786552723; x=1787157523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvNLT0lGjpOonHWc8X1yLFfLsn4B8p6Rym18PoYgv/A=;
        b=g//dupYleNhf/Y3vGQs+sbR06SykIF4k4h9X6BfauhTb66Ol68TH4Gs7U0OEggztMD
         iI5raM2pJKpHv/QBVc8ykvUte2mKRXD4oibnkT0zRSpIOsfgfPEJhjtKJvZJW5w8kzDy
         n/TeTvwwaBLSwr6TLo6FVYSa1rCRJJ8m8QlUXWRCs+lAaao4/8Q+yTsEdkvrPM+Y/J9Y
         UYYBh1PZqJ7vP6avHKHzIC48pWRcMoYUf5PeUD7cc7mW3tcTHqLkYSHB5ymhgRDSfuRW
         WSpioa6QbiRR3xWMVYPAvfhB4W10E8xk9zCT1jh8Lr8HLokAkOawdjBSlGKYBmqnM3l+
         Fv+g==
X-Forwarded-Encrypted: i=1; AHgh+RrFc+cTdy98khtLt4lEZCmdscf52C107GMirLOEJMd5RzHR67z0Tk8JXP7IlaqkyR/TAKPxh6pNXhVDtXUG0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Y370Yaj7LfSNG9WtSyapUNdj91497Ydg/tZBm6qk3LT1GcCY
	GLSz+bDa+oXNbiyjHC4lan1OiYUTH0bqJXK4u8qMBso0DwgG/rSc+UNFvyX2V9Dy+IJmHY8X5HD
	CWlIv4JmJBWM+d1O6i+fRnM7bP//B+i0=
X-Gm-Gg: AR+sD12H1uFpL2JoWO3uPs8r89W9USz5vvjXGihnCt1R7LIuWZkqWy4ZMNSjRVcCkmI
	8fqw8K0vjH6hrTxeVjFf3DC5VjB6EZ7qUK2BN0hZvQ4kHn0eUX/pjwptMaQtyRtLaHRCQrGglVk
	cX7PqovLpRnqUaScax4SiatQyZzM+DLJcuWuC19dayNTJH4xUgjxn7ISfORMjKj3SV1wQmnLLwM
	rsdl6GXf+jY9PYAVnKHYKnCsrnIPWQv4mIDsHiUaTaPtZiCYW4j8zJ133ALZVdrlpQ3SKVnu78n
	dDxdn3/Mm7w/M+bTlog3gXdT0qclcC5nU/fX+NSvbVlH+Oi4PbDpM9kclqeGOz1uNLqv0vUCpcm
	E0mxiu1jwE+RUgZ8gH7fdNEAMMGRJHBd/h7dnI/GPAaSvkmpAE0qrm1QBj57n
X-Received: by 2002:a17:903:1104:b0:2c9:fbde:ab68 with SMTP id
 d9443c01a7336-2d345754553mr51680385ad.3.1786552723374; Wed, 12 Aug 2026
 09:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-hashedptr-v15-0-eafd27d36476@kylinos.cn>
In-Reply-To: <20260810-hashedptr-v15-0-eafd27d36476@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Aug 2026 18:38:30 +0200
X-Gm-Features: AUfX_mw38bgIBLxfsxJkWGxDhOOKa4RQUYlY4T0uHRhdY5QiH-ypUTLkZX--WaY
Message-ID: <CANiq72=hGtRyqcZpEvLB8mS-qpQeCyecruVGXSaPCxFfkzifXA@mail.gmail.com>
Subject: Re: [PATCH v15 0/2] rust: Add safe pointer formatting support
To: Ke Sun <sunke@kylinos.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 8:35=E2=80=AFAM Ke Sun <sunke@kylinos.cn> wrote:
>
> This series fixes two issues with {:p} pointer formatting:
> - The impl_fmt_adapter_forward! macro destructures self into a local
>   variable, causing {:p} to print a stack address instead of the actual
>   pointer
> - Kernel address leak - {:p} prints raw pointer values, exposing kernel
>   address space layout

Applied (v15, not v16) to `rust-next` -- thanks everyone!

For the first one:

    Cc: stable@vger.kernel.org
    Fixes: c5cf01ba8dfe ("rust: support formatting of foreign types")

And for the second, I applied v15 because I didn't want to lose Gary's
review, since the test code significantly changed in v16.

I included some of the suggestions from Gary in v15, taking bits from
v16, plus a minimal fix for the KUnit failure, but we can still
improve the patch, i.e. I would like to see 1) the other things what
Gary suggested (e.g. the extra checks), 2) more tests for the KUnit
failure case that currently early returns (e.g. we can still test the
width etc.).

    [ Fixed KUnit failure when the CRNG is not ready. Then, as suggested,
      replaced the `scnprintf` comment (with v16's), changed width to 100,
      replaced cast with `without_provenance`. - Miguel ]

Cheers,
Miguel
