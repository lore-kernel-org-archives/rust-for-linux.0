Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A96A30AAC7
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 11:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762773015; cv=none; b=pqGZIzuCm0W2Dgl3s1BNMlFnZfdVIxp2AgwlGvSjgRHMRfTS8xXXBsKbzHTAxwKr1zSYrAeA6x9KqiLCKJ575cGEsuhvRWvE/yGcxrF7RAIDC53+GDteqAyRVbAB5qSLL8qWu32bockA6vp2ERSt0cKtcsRTLa+U88h9VcRtkRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762773015; c=relaxed/simple;
	bh=qYod02zCx1H/VIglPSYtMCLBMHqDjGDF49aeweBgJ6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+uOxOoGmPm32IFEmLb2y+IvcUELH/FplGFGctQg+vReZwnpCbqKZsG6TK35NAcBGHdZUVN7VnAWoLZp+VCu1EXjg/8LZrkAwwGDjnJa4+asDUn3vvT4p4SsAsXmQRdPLsKHQj3CHy5jDI09xJ4i4WrJWYgOwhmG7VVHH8g+iJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgLvWUIj; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgLvWUIj"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b997ae045b7so234005a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 03:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762773013; x=1763377813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYod02zCx1H/VIglPSYtMCLBMHqDjGDF49aeweBgJ6E=;
        b=UgLvWUIjzQk8VSMa2U+laJQrFNGM4W5Hk1rmIuPuSrK9Vj9TwXmMbnzEjulN/PKW7K
         3dpURacGdJNl5DAwLfkz4/djY4g8etVYltVz8hyh6vOAgPSsdaqLnzHFQol7saPx9k/6
         p6JZsxUqUIXTz+oONrniSMuZhG7Z7nKfuwiq2vMrTQL3ts959pzMG1CK1cAfkNjcDaYS
         bNWUEMEOAORCWWZquUl7f5Z2k0DZef9fBQPnhSogNVoF1qVQIoHQcPjC2JzoYh0sy2NA
         hUmgcO0oajwid+mUrxJrmAgwDdNbDKk1Z46SWSNzL232B45WXDoZwFcS9uD0T5el90xE
         CyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762773013; x=1763377813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qYod02zCx1H/VIglPSYtMCLBMHqDjGDF49aeweBgJ6E=;
        b=QMu7lCmttHoh3q0urWNpUhlKB91C8dfyVYXGb2G5ItoliyRdlz1J5ACk/bChWa4iJ3
         /c/xM+0VFqdi0IfLUbGF+ZGmqSpKrlYcllQjMAsjEzFjeJw/tpfthw0P2XoUHOEjfd4t
         vlGxnkOfUjaA60ZcQi7ghoWxaXljtzjn7u5f71mv8Gf6406TO2IL+JRuWAL3EbSDO6y7
         h2xdOw5EJH+6Qkv4ZnCt10xLiM0vxbQ8GiPrsswlMu9tr2oUIdQX1QwCoHNwhZvel5vs
         e1okfr73sJNacCHjRUkaGOzm+YhC7DQ/VwSLc7rDhsSrwYa2paRPYEUzofTJedjgj8no
         PQKg==
X-Forwarded-Encrypted: i=1; AJvYcCWMgqJxTmsKEv8uVJ/Ol9T+6BM7tJsZhL4VNnbMfO9zhXzJv/AnLOVfcVayjh4zUOtf3zbXhRfQ+iH4RXkI+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSiIaLf4V6OOkqr2hiUm2iCZv0RxZTiDtFDJAeClZCvyJVFiwS
	zOx3VRbgUwdnjpUIzDpHmuhu08md+IY7UMc4Ik59wYOWjqG2it+0MPwkG2BTVyvlfmSzWIlcHFg
	wkDXcBTlqrjz5NSZbSCJS5puWmt+uems=
X-Gm-Gg: ASbGncsK64MNsXom9UaQSiXrghx9878PdNymx16+VVxj/Gs1TzQ8TxTuwPU4z2E4mQS
	mgdklhJv8rzUFffll+T933bdT4TAhsbom23jtvvM4t+z40zL136va3ntxbiVs9ISzBNFqjjwZN+
	ZiXyK0Qyy7NjvgwkIU2iX9js+kDIaAKIpYxUck1fiel5kcoTLtXDM54boeGKIwvNfpd4OREVZpd
	FBiTjL6ipnp1NhESn+6npcAwNGnxlN+DepAFsJLbaLTsQtWomL5kxGkqvh84WykuXiUghWZOyfQ
	jMqlG9pXaPtM5WvHR+f7tnNtmOPrf+ktLf9FgEzKgO6EZ8MoOHTCu3nKRKY8Tady99F/6nneWhk
	aWtmBqW0cr3vEyA==
X-Google-Smtp-Source: AGHT+IGVXq7fcQEVvIh5RJVo4EGz3TaqkWRnWgnqaRHyeXV2fhzl5cAwdSbAJFL3N5gLtGPGFbMfA/d7S7FryVq/+Z4=
X-Received: by 2002:a17:902:ecc6:b0:267:8b4f:df1f with SMTP id
 d9443c01a7336-297e561612amr56745215ad.1.1762773013490; Mon, 10 Nov 2025
 03:10:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-2-ojeda@kernel.org>
 <aRG9VjsaCjsvAwUn@google.com>
In-Reply-To: <aRG9VjsaCjsvAwUn@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 12:10:01 +0100
X-Gm-Features: AWmQ_bl715oPxt8H1J_mTcx-bHvv176_Uy8uXuVHipx3MICAaN0f0Hfn-QJfLWg
Message-ID: <CANiq72nQr8a2Qkt10rPGUgb6DciYQZCsLb-fg8S_ZV=0+Y+ZVg@mail.gmail.com>
Subject: Re: [PATCH 01/18] rust: condvar: avoid `pub` in example
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 11:24=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> The unreachable_pub warning normally does not trigger for documentation
> tests since using `pub` in documentation tests is not wrong. So this
> sounds like a bug in our doc-test setup.

Yeah, we can allow the warning for doctests, that is easy.

In any case, this was needed for the future pin-init, not the current
one, so I should have probably removed it (we had a bigger branch with
the new pin-init).

Cheers,
Miguel
