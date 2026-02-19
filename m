Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E487F334C34
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 08:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771490281; cv=pass; b=YMMxTxp6Y8yOXd8d4N6Zf5rp8OAuOWfmBLT1Vvv9y/QLwKnY2ft8BdKj49qJ6zqvGxiyB2OXXOMBeTaMknnVRbIvQx4VnYozcZHur44RKGXFkBJRl3bMEDHOVlRwKnb0ybnd6SfjUCYBqvagxCmKJHgdQ1tyvrnHbqAIFWzrxgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771490281; c=relaxed/simple;
	bh=UrtfACOew606MGv2nqH9tcrmHnRPgNbKhwGOoHlxY2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8Km4WjidEgCgWQLNm0CyYAAZarPfWa7Lt48QiYGOMAGQe3Z3bcosJziEmOtxDRmmvl/EgIeH/5eW/4J81sIaO4TOA9yT8CDlM8559mw61Gr2yHERmTRe4rxCeRG/OpxDuNkHxVVLSm/bJz7HRJO3Bk5842w22dx4HpIaWsE/5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzSuoNIc; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzSuoNIc"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-124713e4244so28133c88.2
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 00:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771490279; cv=none;
        d=google.com; s=arc-20240605;
        b=IO8EUu9SQ61kkazD0fjdJc7T9mO0ko9BW7HsXqYaOj0QwvjT16K/b0EcQ1CdnMghgC
         dxb6vOBk+h+kw0K1kKYHPhxdZCo41fOFcbnefOzPK3wdIzwMszXlpY11Of6WIRK0Y/B7
         uax3IDS7B4oF25rG8nIZpne5sfRejQPdIvp2X6nLYa9uUVekFsWJhvQvCxKxWRat+0HI
         tcyb84lrZSTwA2DL4xToZRY6+FbDbi/LqzDR//jigaJYZR34u5+4TxwnGSqIv5LgO2IF
         pCm3X4d1UVlNYJXzMZGD6xcN8LBpLgqpu97SvN2f23R6I27Ri3l9vsQg6pS+zUClRi0q
         M9DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MkT4E3L2hQPNMesvGYH0M3bHrqrrqb8E2JueXQ4uxrc=;
        fh=66D63QP4Z1VMS75Krzw8Zb68TL7OrcqzyVlOvFlK9A4=;
        b=geNic+zMK9zkBJQzOK5Oc5uQquIM5AK/bHeMZDMfQI3KKdlfIuj2Jsxy08+5jwB2oK
         4PtBmPi/npwEoct5tiW0GtlY5XLd+tAmFf7lZrI2s9v+/EroOZhdQpUcvnAwxhY8ZiQI
         o6cOyTxmuXSeu5n3Usq/4nxbFwN0GeDdpfniGAXzT3mmqwHrOCd4FyW/9YPBV9jbc9CV
         QM9AHw/TApviZiUbnzkr6nHh48038p1h3kiG9xswlyicCRoLvC2znn4IuiDQDzo4HckQ
         sXL/Lbt7FvuFbkgsJV0xhf26DdRpRTadOoeCqD/cJSGPQ5pQrqobO4FaFhI1bJI42viM
         vDpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771490279; x=1772095079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkT4E3L2hQPNMesvGYH0M3bHrqrrqb8E2JueXQ4uxrc=;
        b=GzSuoNIcL4U1nFyRRPEJzXZBjf9BJJxXllp+D+sLiN1rb6ndjynhU6hV2i9LRr/ecS
         qfoFFGL8PB00OXAlmoUs9ptE3CLwbuxuq+XqHCGNczPmUeCOWy7YWOle1nDxErIBkfgC
         wH3gTsiIcpsz/HLkdgMjLoVEQx4nSfqYFPzDKwb7gHPLD/EeyJKnJvMLpJIfkERMAx1d
         ux5Yc1NpcXrm4pS3SsrOp0xGCYggNHH3JZxJiXpahNoDj7jyhJKw4+e8Wwa052MgChqx
         9tPn7CilZluDgZaGbdhbHI13uGs0EAO7GzzIOu/CmZdP1MhAv8RaaZHsoRZnCCBOdp8j
         WknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771490279; x=1772095079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MkT4E3L2hQPNMesvGYH0M3bHrqrrqb8E2JueXQ4uxrc=;
        b=CRTOGZTqbgkOMZ0CA9+H4cgOKond8BpJ/PhuLXib8V83Q/zdx+cjM7UcMGTkX3B8uw
         WjKWK3JKDWqui2ccqJDBKM1yQ9IPDVqoJv3KHE1325KPXk6BIe8tY9F7v1G/Qt6hqgbZ
         JdlnMZajGH2cVVBx+jO8j+EGeJA3rHHe5eyh7fQeVt4y7ycm8iijCAPO2CiLMSFoI9OD
         RHYh+xWOX9TRbO/36ac1WF8JxBKgGaJAg6VqWE5oX2KPSyCtYnYkS752a0DkBG1bC8m8
         Nn4J844qar7cLNEgbOoeyZ96tHrz9roEEabJLi3B/PJudNs9QVxQJzRYv3NWS8v64S/H
         4S/w==
X-Forwarded-Encrypted: i=1; AJvYcCX2hBceUE2Bfao9ZCqu6rvLUwiM36zwdkB2F36gycqocXMyOyli7JbewDG7MQ1SCLS9KQGMjx/92XZwhzlMzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA1PfJ6RRlw4IIXLFBAFiKPERKALMiOelVtC5mIo0JM2pYbIJx
	ijv9Y6FP2NGCJ2nObXdgVYWwy2t0SJ1TZTCAsHKSXhTptDDgPn3bL9f1zo+ZiUfN6LJ+46uvli/
	wMvsSARE0roqiE6yZGUlSsszv67ziYTnDPamb
X-Gm-Gg: AZuq6aLR802reDDPP1pdaEnfIDZDAcmE9auv6pC+vdZ0F1v7jkT4Mud1RehZOWUnVLH
	QtwsKftEZPjbtA02Cw/9W4J2T2pJPxJEENzZ0kTLyBT/psQpO71icmeixqyk0Zq8fJOPNQ36KCZ
	+bbl9C7sj0+jIPydZgYO9WYPERlg4/BT3xT7+ZOhJ+okeZoZsck9zXaCLe8MBH3v/DBSq6eRw8V
	vqEkkGbeC5jX42O/NWjOt4hCXhbqjcBhhJ+SAtE9gcEj+ilFKnyisk0+68hg445zKR256dBNvIi
	NeKzBuRer3UkHKsjTNrbpAK8+5be5CaQFcEwhlc7gmjSRxCWxJTNCg/NXZs8IO7SyIqVwb46/0a
	mryzRQCxFlLMh2rDB8qwRhAz0
X-Received: by 2002:a05:7300:a145:b0:2ba:7322:6bcd with SMTP id
 5a478bee46e88-2baba04cfcdmr5080323eec.3.1771490278971; Thu, 19 Feb 2026
 00:37:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214092740.3201946-1-lossin@kernel.org>
In-Reply-To: <20260214092740.3201946-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Feb 2026 09:37:46 +0100
X-Gm-Features: AaiRm53M95TEpmG1J3e59uYkpk2SaETIB_FNLBsM2IvOz1Bpi-Q7oz5CLslIkuQ
Message-ID: <CANiq72k-D2QFRqOdAU1rkHnh=Q4LZVxey3coDzEVcMXhG_aJkg@mail.gmail.com>
Subject: Re: [PATCH] rust: irq: add `'static` bounds to irq callbacks
To: Benno Lossin <lossin@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 14, 2026 at 10:27=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> These callback functions take a generic `T` that is used in the body as
> the generic argument in `Registration` and `ThreadedRegistration`. Those
> types require `T: 'static`, but due to a compiler bug this requirement
> isn't propagated to the function. Thus add the bound. This was caught in
> the upstream Rust CI [1].
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/rust-lang/rust/pull/149389 [1]

Applied to `rust-fixes` -- thanks everyone!

Daniel: I added your Reviewed-by from the other patch (and linked to
that patch separately too) -- I hope that is OK.

    [ The three errors looked similar and will start appearing with Rust
      1.95.0 (expected 2026-04-16). The first one was:

          error[E0310]: the parameter type `T` may not live long enough
          Error:    --> rust/kernel/irq/request.rs:266:43
              |
          266 |     let registration =3D unsafe { &*(ptr as *const
Registration<T>) };
              |                                           ^^^^^^^^^^^^^^^^^=
^^^^^
              |                                           |
              |                                           the
parameter type `T` must be valid for the static lifetime...
              |                                           ...so that
the type `T` will meet its required lifetime bounds
              |
          help: consider adding an explicit lifetime bound
              |
          264 | unsafe extern "C" fn handle_irq_callback<T: Handler +
'static>(_irq: i32, ptr: *mut c_void) -> c_uint {
              |                                                     +++++++=
++

        - Miguel ]

Cheers,
Miguel
