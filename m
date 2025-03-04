Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2665678F33
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Mar 2025 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741093087; cv=none; b=lGRuOD1PlgM5oh/BmGRCbsZuAxNTiB0ljUn5lGMqhkFCNinbbTCsuRFYYxsP8ZFcMPe7f9i67NATiZBcXQkrAgM8bg2sMQIDpicfh/+aEMts69gbZoQllmbulijxwmf5E0HUmtViIwY8sq/qo4kC/M2p85IJvD6Rna4lmls3Bn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741093087; c=relaxed/simple;
	bh=I2gR4ClyLV7N+/VOo2A4/QwTvsc1DBtHxBj7gdkVVPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XxLOc3VrqbW9H7oUW9TKKx4CIa8rO1BfoDFichWGjGzPUfjX+u09MzNbrLPI2Hb3C7Lhu0cKAYmjTOhlY93Hsj0b82okI/KcXi/tr31wBxpNLu7BzYxJX2m/bG8V7wUS0jEAmwvrXqjEXZCDa4kyrG6ao+v4mmyab07+iASI5DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GAi/y9bJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GAi/y9bJ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43bcc04d4fcso4331695e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Mar 2025 04:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741093084; x=1741697884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2gR4ClyLV7N+/VOo2A4/QwTvsc1DBtHxBj7gdkVVPM=;
        b=GAi/y9bJnWMZ4L0Z+wp1g4+eisiHeOHtHCA7yC/ULuoVnVW9LlVwAnNDP4MKO0aRVH
         wmUbIXfomDDz3MVptou2mKeXEGHs3cF4BPHE6eJEaSAdQM9kBYlYS9TYI1p/jGMcD+1M
         XrZtlmM57GspdqJpCilSjRUzFUTCZQkWg1ekkJW+OtHtgpof2s4nxPZXCL34UBdeTnT5
         SsYHtucuQxF4jOV7f7jTPftAyls80aNi9iEzzIdB/MwO+GmfM4o9jIOqawxG/pTHP5gf
         k9j/r94taqWG/c2uFTw26MqbM0Mt/1iRYqp4dy2p9YcPDeg9N9eYwIerkOHz0ozpZcj2
         KPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741093084; x=1741697884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2gR4ClyLV7N+/VOo2A4/QwTvsc1DBtHxBj7gdkVVPM=;
        b=ha9RUQEFl0ZDoKL/yr4JL3UrNaplRHjQp3cdBnqUNkgnZskPn3KN5oBJkpfkE6xKap
         r00RydsxaASoXUUVtqHMSar0dxHgb2IcXHyRHyfdC7clpnyOTku/ECdRWGQJbmndh2Lb
         /Xvg+3QIsU+F3ZRZp9TvAqaCqpYIqz2EU6kqHbJ5xCFeQCHren7kvNDVLJKNcQocEw0T
         /BKuh/y2w1+5UOqIMIbJhlsEXfs6YuKQpDgIr1lsAEpUcgQdCTM07c1bNfeR8yM8O3TY
         wHRFvNUU4FyeG+DSsInySU/zV0NTU6a5kfsaeCPWkqbDONX53mTfS8QGPcxsygSb+Z3y
         QGFg==
X-Forwarded-Encrypted: i=1; AJvYcCW2DS/1iIqblc3ftoznMzrAHzv5cw79tStXaRmAOvEMCmwAMk6VOXEAIZqiY5clEsgyf2splG27q4ZElJLjqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgFwnwe7bJp1VfYx6/Np+j0xMtRFjGMy02NMQEXBWkYO0CvK7P
	ExrusnElUM4LgdP/vuuQ6suI7ymX6ua/3NGhybkV6TCiLumAU+KWS9xmUEbOBDKsvw/GENYA6P7
	lM/FHQN1LZMOYvVaPBNDv0/9kYo+Ezf6dJeCD
X-Gm-Gg: ASbGncvB01d5f4s+/cDipfvSsoyfirbaBFTH/guLqj09iT9DwJZPH8KX7MNkVZ8EYsq
	J3ABW88aWh0lPKTE7GxtHw39DzNeeS6KYWrEBuB7vSnbxMxbHtNItseF+06KGwoYRTNlmQwQjaz
	BoeUN1jv4FgEyeuRa0Zsk9l0UwR8OApG2GiNOUcr1XOjwxQuc0+p4fbCA=
X-Google-Smtp-Source: AGHT+IHlD68RUCtx/XZotHNU6dzGsK/RF9/cgEyULiqkyV2udeXey94E8MwpPiD79esuvjPQS2tp4xWxCZT2rWRIQdw=
X-Received: by 2002:a05:6000:144d:b0:391:8a3:d943 with SMTP id
 ffacd0b85a97d-39108a3db27mr7447687f8f.13.1741093084338; Tue, 04 Mar 2025
 04:58:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com>
In-Reply-To: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 4 Mar 2025 13:57:52 +0100
X-Gm-Features: AQ5f1JopOq5cLDu00jon1XNvppjV6Mxr5ATnyGILw1dmUNKvgWcFA7LNY3fz8eo
Message-ID: <CAH5fLgibJ6wR4Y52MD0bA1Cwm2_PNMBsV+oZ+btoR-+jY_K2Ow@mail.gmail.com>
Subject: Re: [PATCH] rust: add new macro for common bitwise operations
To: Filipe Xavier <felipeaggger@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org, felipe_life@live.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 1:55=E2=80=AFPM Filipe Xavier <felipeaggger@gmail.co=
m> wrote:
>
> We have seen a proliferation of mod_whatever::foo::Flags
> being defined with essentially the same implementation
> for bitAnd, bitOr, contains and etc.
>
> This macro aims to bring a solution for this,
> allowing to generate these methods for user-defined structs.
> With some use cases in KMS and VideoCodecs.
>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General=
/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>

Hmm. I wonder about having all of the bitwise operations. Most of the
time, I would only want the || operator, and maybe also &&. That way,
it's guaranteed that you can never get a Flags with an unknown bit
set, which might be useful for soundness.

Alice
