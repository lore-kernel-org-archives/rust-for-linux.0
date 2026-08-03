Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA1C363C53
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 06:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737087; cv=pass; b=kNdigpYIp6daVaciBsOO5nXhyzSVh//lU8YHmKGPB0YBpDInq7gKZZHuBszh1rqRtLL76HiFVSHhx1i7XrIJ/yX9dNs4nGZC7QblvEZ0WgCKU/SPHFnYTmuAEP9qKaZpyMJMcxLYmysM70TM2IYAPW4tIfs4ByE8BDva87lrw6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737087; c=relaxed/simple;
	bh=9vMbfMGekR6L5LEMy6L9Ow5VA2S82pVj+na1pJDz8R4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LA871uZbtVMhHP2PEHFcqA2itp0uEhXIJS3MF+/ptIdovLEARNL8bkfafWrP/pWG9Vx2NU/oFPrIB+ZewpL9exeE0WUgQyezX5KSVsGYOfGZwVz+78nfsVMqq9iLLfkbveZe0vfiM8JC8noxYXuGJ/keGdxIvH5POSAuL8D8qKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a29FPTti; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a29FPTti"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d027b7c8easo4661065ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Aug 2026 23:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785737085; cv=none;
        d=google.com; s=arc-20260327;
        b=kY0DtRpQSee2UEZPnLBPup4RcdXvfb0EcxGYgC8LGtkbfzNvMPxrIp3pgZrjax7Log
         ahh3WAWwH9Xfuq78ApfJSAjtaXhQxBs3P8u6N4Jh0ZnW7qCK1BX2CVR6Xyo9qpEwHr6b
         Sy3ENkd4RSeH5IWJ3HFTxO+pFX2GxfjuDXlh99Q4QpYW5AGRM4NGrW+/rCJttcGfQIXN
         KygUa4WDJrXd7uLlLFarpqsND8CYngwfxXbjCRxytZl15vxvVZFChHGERvWcQzBf/5go
         GRRdDsUPB1JOIUBt6MJ13c4nBQirBHt7R0mMzQILzp6gZDdJNRl9gwYXVnX+WA6dWgjG
         nvYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qA4isvNouelXiQWM1erQEPSc3lHghlduG5dGLUbCZnM=;
        fh=CBZ7+Q1XKhT0HwfW0XxL3FPw4GE5DN1d3FQsFI0HdJU=;
        b=L2u619gitEb+UsBPmOJXgM/uZvWyPi8/wlaEl8g3h1CQ8vuEq9XXn3rMWwCIfpK41v
         Pffq+rVqsJxjW7Ex6yjwjiJZFntxScvQ4qqNnKapuEvnkWZKSzHnIHam6ClH6pNsz+my
         ZHlTdVg0SCsgpLbNwIP5GawteIeqP9VtTncqGu1yrcbxghumfxXAflhg0LgTCq77GR90
         2gsSmZDZAFDesejjUTDvAHys0L592dz1B6LhDd4GHVPBujNdj5IJpU5V+/HIbUbBTkZg
         H3/rKfK0XWhO1Q8FpwypXEuL3VFpFHV5JmtUOPfBvvfAf4og1xNziql7QJ6kHryuR1ax
         19Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785737085; x=1786341885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qA4isvNouelXiQWM1erQEPSc3lHghlduG5dGLUbCZnM=;
        b=a29FPTticia/dR32cnGgiI5h/J89CwLSYc1V2k7SEFeU7XiVqwqUDKUOxoVpUTJATW
         qc8PKyaHzxAGrlCT3Q/h0YUqqAUMSZhgj8c+wDc/4j/1Hz1ZZ+lK3hx/JMaEojlOR5Ei
         FvbWJsmEr7O38PeCyNEs9rxIrU+WG4gwToJpxwfJJ4QP0C1ZQA92JjlAvzjGnTEsWDzO
         NfL8L0zQhauRPwfqeJ8anZjaqfwxh9HF1JBVdVhcVRc4VCy/3GjelY9XJEzU7OKa33+A
         0m01bBZA3qMxBNgNcQCUAOIekebYMW9rE4SSxKHz7HESrNQBEd2UJQxpWFPppVpfHtKE
         IrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785737085; x=1786341885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qA4isvNouelXiQWM1erQEPSc3lHghlduG5dGLUbCZnM=;
        b=iZQ2m+0DAAvoGq0hpoOGjwYEiZmVWN2rJac+TSOGJDLgQjX2a9jQ6bCT3FwAlqfQeB
         JkL0oybBN8AiyYv1i8cMQ/Rlay0VvakEdYz4S2RTgTYkge8mp3I+0pEfETy5yNLgcoDL
         rvd4nRqDuumBNMCsQNJTAgOzzK/IHPyjZ+/zGgXhZqb1Kd3Fb1rG2QgRgDhgCRLf63S3
         cbUCz3zMoulKEOc6ln1bEdL+VU++t2tNJKshIUMtfC9R3pE7iS9mBnZMK8po9QXISg7W
         pB9HZfW5/YCdtUN8EesXAEHzCqrbrcTgHrspQ5P38NaTMArIlS+57f525LFQaevuXyoX
         FAHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzoDrDBU5LOZmrkxMbL8z1M1aR1vO6gex/Lb/Yw/dJ0GFY+yLf9tMupLWcInuanHIYgPVmEvlOmmJdeKrdWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7KgimJzkE16I+6YXzVWNTPMIj5g/wZEPFu0LBrrE/4lxQVTJ8
	ZLX1KuCG0HHDMwXS4paUDWWrmE2QxNQWP2cB5x66/gNB0lC0vbfMBfe8CbItDVWk0J2QuHomuBH
	9RVcZ0mwgl16P+Bbp4kERtV81HDU6D1g=
X-Gm-Gg: AR+sD11bfK5u339AzNRJmKi6DLnM20GmnQVCg/B475iO3OH/KYVWistovMS7TfnBo0N
	9hYzZO9lyjb0cKL9TfTyfTnnlRiqhoiVRyxsgqldAD7dqHGQzPlSFC95EH1e5Em+rIGguEgQX2I
	uEFRbRmdRqRSNhWNTN/ziH+xFpggDuq3pzOYIjyaCNe5d4ojQwuGVAYOHciqm+o61WvG9xD6/ZD
	18NJTiFH/QsY4RoNuzwvIMmJBCjzSnwsHtl/38Yuep8G4ZqNotuDCIzbw37fGMJuXEHhmvBOOCl
	LyG/yOjQDeQQcg6m9ikfxPZCKGq353WRcMD51R67bCu3pWGOVGWPUMd6BFYJxVZpi5qXeBTMfQN
	to+Q98FzATyUEhiQim51cWB1V5Hv/6eFb4rn5Oyli1mhXMhgtIYuO3wZcy0GB
X-Received: by 2002:a17:903:234c:b0:2cb:2b50:d9da with SMTP id
 d9443c01a7336-2d05291e7f6mr106471735ad.3.1785737085398; Sun, 02 Aug 2026
 23:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719130723.162899-1-ojeda@kernel.org>
In-Reply-To: <20260719130723.162899-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Aug 2026 08:04:31 +0200
X-Gm-Features: AUfX_mx-rpdHacm21bSkc3uU5DWNngLdmwUdEU-PNwOi8pLd7KAzIYJfcPvxWqk
Message-ID: <CANiq72nE8_7sUWOtDZMqqCTcvw4bdCX90WtY6dWTXGu9r1AKvA@mail.gmail.com>
Subject: Re: [PATCH] rust: rust_is_available: support testing with `bash` as `/bin/sh`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 3:07=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `command -v` behaves differently on `dash` vs. `bash` when faced with
> a file without the execute bit.
>
> Thus, for the non-executable `rustc` and `bindgen` tests, support both
> possible outputs that the script currently gives.
>
> This makes the test script clean on distributions like Fedora.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

    [ Added custom assertion message as suggested. - Miguel ]

Cheers,
Miguel
