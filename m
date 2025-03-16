Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B6C3D6F
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 21:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742158904; cv=none; b=sUcmonwd3GtL4ta3X5LGRj+GzbZFRw4ZW1FgEyjtdnX8PY4Kkrt8gALZeCaLGYb0S31kkagVQU2qFI2xYoFfyFQ0OMQHPdXPS+xGEr7RqODhwK0xSzdlFz9vp//P4iQwZVaIfnZrwyFYchE55VuomTr0Et8HAPtICaHZ46p3CNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742158904; c=relaxed/simple;
	bh=SJ5bzWOGbQBXTAOCFSR9shkAh1VVzKy7V47j7PPJ2PE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EvQorv+a415KfAiVFMQO8C511AtmJBsaTNRpFOxwgkbW4wHToYm4pc5G7HW9gdvqlXmGjc3u9fNbDSWmZUOqFXiHHPxfSB0dlAX0WW9u9Jr+3XTDR7egR1chS/0g0JH4mBiFGhhA6gkPDNtrcf+u44XHBDCEMIqmd3AQQBVoyk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2B8Jond; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2B8Jond"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30144a72db9so463045a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 14:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742158902; x=1742763702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsxWwIQlZ3JBfn3w1TYV3CT9p3lMSg4qwliPEbq1DEg=;
        b=B2B8Jondzcdu7ftsyBfWMJePA1PZgxiSS8WbAcL847edai8Zx9GrROItb59rHX7HRc
         /5/LV0CZF1QiOz6wRtK9JbRU+ZGoAwZX1hyhf1e/9IUQyzWWklLWsN6DB+dTr88SgS9H
         xhK+AQOxXeK+7r8+kHbkf3iBNsuHVhymmXlZviT43T7lJAL6/qCa8WNRMtzVk+kYiW5v
         Z/8jurKXSpWIIzNnkqh/l/G1ExFamDIC+twE96RiJqHS2LmdzYgl5V4ExyHiHjctmFW2
         4by2aT8KMFEMiahNdvWTZdzkeRLoCn3v/deHGnjolMI8hjHC4YN4CB5E4qjoSpYay3+e
         ZuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742158902; x=1742763702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsxWwIQlZ3JBfn3w1TYV3CT9p3lMSg4qwliPEbq1DEg=;
        b=U91c1cy7IzhxohWgoli7P40dw3JEWSGkKk8AL9N7lUbYNz3XgcO4iVVF2XetBJ8r31
         /nFaJAkEd3g+kclM3ZxNaoDbE99PPx5dz9OpebHjsIUgMK2lq0AY1RMl7C6tzrR3elin
         loVui8VjY4/e+kdYlLTIa5CKiwrZJloMEYULOOXZDXL6glE54sb4BgUSieltwJI4ZGLD
         xlFeWKDNAD218F/IZlAKTXA/smbXc236wKDLhf8nvFpiIaYZN769pl1OyECxwVrogeOj
         zO6QfppUiLHWmR/me3JdgHUI+e1oz+ICchlt6RdrLQSgcQdl4BPnxK0Fk1BercZvSgCt
         D3wQ==
X-Gm-Message-State: AOJu0YwmYC9KYUwJlBxoaxbfaXnPgWisvph24CjgVIXSUPgASVkGHJMS
	3mtOAgvVaFS63Qu4rRwIzu2BB/CQySDkU9Xsr19PDXtPQTTrH5pqbPYUC2FrJG0yB+66HabdO+2
	fde3/68jDQehRy/DfAZz58ruJnMo=
X-Gm-Gg: ASbGncvwulFT4LbgL5MR9o/OhHth/YW7V3ZgvqGPAm6QZIsY0vM/dbA+gg3xk6kdnfs
	/mmSsiXoztfiaqqQ1qAMzx7I5Pgt8gP6gUpJ7P3RLmJQhl0QZXLtYhlzV4qMKJsShcCwEd6FnCU
	/uQg6zEKMoepF+uPt6hwuz9iFFTA==
X-Google-Smtp-Source: AGHT+IEf1VAiN4T5t6a6MUIMCfeNLZUSh3MKAQrrAY6aA2Nz3JJ1TwAgzMhAldNZZR6oH/wMrFDXGTNS6gG6H/JJLWU=
X-Received: by 2002:a17:90b:1d0e:b0:2ff:682b:b754 with SMTP id
 98e67ed59e1d1-30151c5f223mr4659260a91.2.1742158902244; Sun, 16 Mar 2025
 14:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122054719.595878-1-dirk.behme@de.bosch.com>
In-Reply-To: <20250122054719.595878-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 16 Mar 2025 22:01:29 +0100
X-Gm-Features: AQ5f1JoW791nynUvJWoIvEt2ML7Gn0MVW6uQ1ICOZqHxL0b9R4hmDpnleZxEI90
Message-ID: <CANiq72n8pZN_e1_dMhY1ReFXaTx5BiJ3auxu4LZGO5V289=C=g@mail.gmail.com>
Subject: Re: [PATCH v4] rust: error: Extend the Result documentation
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, daniel@sedlak.dev, 
	aliceryhl@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 6:47=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> Extend the Result documentation by some guidelines and examples how
> to handle Result error cases gracefully. And how to not handle them.
>
> While at it fix one missing `Result` link in the existing documentation.
>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72keOdXy0LFKk9SzYWwSjiD=
710v=3DhQO4xi+5E4xNALa6cA@mail.gmail.com/
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Applied to `rust-next` -- thanks everyone!

    [ Moved links out-of-line for improved readability. Fixed `srctree`
      link. Sorted out-of-line links. Added newlines for consistency
      with other docs. Applied paragraph break suggestion. Reworded
      slightly the docs in a couple places. Added Markdown.

      In addition, added `#[allow(clippy::single_match)` for the first
      example. It cannot be an `expect` since due to a difference introduce=
d
      in Rust 1.85.0 when there are comments in the arms of the `match`.
      Reported it upstream, but it was intended:

          https://github.com/rust-lang/rust-clippy/issues/14418

      Perhaps Clippy will lint about it in the future, but without autofix:

          https://github.com/rust-lang/rust-clippy/pull/14420

        - Miguel ]

Cheers,
Miguel
