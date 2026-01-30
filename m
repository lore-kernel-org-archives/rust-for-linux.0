Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DB223C4FD
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 04:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769748156; cv=pass; b=mXwZF9hhjMHaMSAPwcRzMvytGZz6ejj1k8cKJ4TEAHIYvmN7a9G9aMzFsmKvCgWDICcJQv84SSyIMnR/GhC18el9wE9EyGsGXwhIXFFbetwAsSyvQg6lgK8wVolQitkTbrxV3fkT0TgtjK8TVTuLWI1RmV15e+AhACBHKpDIttk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769748156; c=relaxed/simple;
	bh=OFRjnkpyqQxEyT+M/FMZi4m7BHy2XO3hgVgXrD8nnEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCtrn8pHqk+klvWD1rRMmUSXtKjI4LbScXHCCXqcmUqU0AXi0NgBtjSvcwvCfBbuhfuPFu+KMdwa/K47xaeYSlrcZDxhOXU0usJPJDQXIuiFDSYZGF3pdIZBu/+fRMHhA44IHTMBdgeJGahqfaEOYYcnfaK0zRtpqLf6ot9rFbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xrsn8iVk; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xrsn8iVk"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b71310e8ddso110124eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 20:42:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769748154; cv=none;
        d=google.com; s=arc-20240605;
        b=RTIFLovtUgFsp1wPiWJECqotPD8ye+nepY2JTz6Ich3hlwmpYU0JAOZ4LE0HcWHG+N
         TYQyYuNuR0uMrqo2Eyqhoe1iRUJVCEq9/KrZXYyhThDCwgAXf/rf9EL7ZUgGWufGjJOr
         QWhh1DxkzfnyEUxsYT0bwxiCKpV2hI62ghIFdj/yJDERTfY+lcTDsS6KRmlB+HEWSJ9z
         lqy2I3Cfb9cWHRfkU3/0dTd9wT5qUZxSEVy7ytw/1WfIs5qxJECgYmo7UonzOEBSKUFn
         CWTZjz4IRLQR5wB8tlybrJ9PydwYdclUYV0e40XIf+0hefCWzNIskvpJbBFyOsvNKX/G
         jTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OFRjnkpyqQxEyT+M/FMZi4m7BHy2XO3hgVgXrD8nnEA=;
        fh=oIWLXBHj3DR9RE0j5QDK3qDCLfAhNE4aCsfzq69eoFw=;
        b=OMsHr0bk54kwlpUHo8UAiFJpk6Op0lYdYnJn7oObRqGomt7heAmO7xt+6o8iyJ7OKC
         WCUQk3hnfhM55nDcvKaTJS6sEicIVPw0GVfsXwUlvcHM+rLE1uzorL6/RuY1TvoSRgID
         DHkdZk4HY3s5PC9+lur/jX++6BP7dDEi3XGTZ7h9xGsvfRKOYJ4FShzcOBFFqf4GA3ho
         aADp22KyJphNxTZ7BwkmTE4AX0ayDEoxmROc3nXpH5HZMO6PMTFdt4ZHmGMaPgXO5yMY
         A47In134yeKqct6BQ+c6uWnmI5Oe+q9TcuQKL9Gt3jL3BnLMLk6Sq46Qq8tL3kxQUFrN
         NFZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769748154; x=1770352954; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFRjnkpyqQxEyT+M/FMZi4m7BHy2XO3hgVgXrD8nnEA=;
        b=Xrsn8iVkRtvwrH02w0ZTh1CS0fSl9daYTZ4vAmk23V/RpEdxonADxhGxZB12j4wqO6
         XpQyGksIRg3q6D1ad+cTIS6TLqHmgF4dDxTQUiIFXrd6rhCIvcyMT1hBtO/YZdsmtG0u
         6XbiQFv7px6PjuIX0IQtIGSe47GwL6jpMkqzZ9u7hFFCQmU79UqtCA9PBOizzlwfOSM/
         0JOOmre9bGS9iCYpE0WKurlw7jgKpCZCzQ72ejKCFiogWmouO9kPUQJpUgmEzhNuiZ3s
         0aWuXyNs8NpxUaPXoVkI8jHqsDwoKmHa5D4qStvJbTXvmKjvDB85oPW8IN2WPnb0NWfI
         LrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769748154; x=1770352954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OFRjnkpyqQxEyT+M/FMZi4m7BHy2XO3hgVgXrD8nnEA=;
        b=nuhuHvmS6ffI/2wOJq3/6HUJWyB9m5Wju7AvnNpnr1uz5F6POY1Q4q8vFrSH2D2oNa
         Q2IFVmdQSjC6g+rsRlJV0uQODLdGUd6oKUusHY4JfjjVDQBhXIdQ+VWneXMRpymmyNM4
         8DKwC+0AA50vCQLHdQfI30kVJf1GgxGX/3BlfHm9aoU9KEcVWNFGmPlUaTaCDqVzZJcd
         TC4lsFYS8oSbLQSVv3FBHWWuKPWpNdzD2AU4IARAxnC/biKHip7e6htHpyn1eFtBpV23
         F5Qoq4Ijezuqz5Pchy6nHOqUBp/laS6w1pqIrd2ZxX4DlsMec2jPujr9wbQZrzLyaDNo
         kJEw==
X-Forwarded-Encrypted: i=1; AJvYcCWaCpWWw86H267yMU7VDwp3BPLEsfhDhxLneicoW9XDHWnpA3g+TRr4neTeK/kHTbn0r6f6/Rjf8H3sbkxBvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybwkcueLHh2YPfueEhlBzlTErWfGgI1YC11QcoHr4hdCLCCfI3
	ly3zQMf5ZIEYKH11CWEV4hJSjUEHurH4OFLtGAH3/txG0HCc8MnZqlTKZLGTb5SDYX1Rc0YcZkI
	rMo/795jjVSef3DkhdZMNq1S9L2ScBdw=
X-Gm-Gg: AZuq6aLUHDsmk5gLpgqytY3ImIk6R5CDKC0wn1L5ppUNM8NEMovuk/v/uxiKtDpvp0G
	tHs+ZcpJb2UIZZTGIC/kM4qoiHrQoxubKklftp/aMLMqNm8n5G6Dn0w7Oxw0Ri/NM9fmeKaKPqa
	nN73hO5h0xMB/ZMW+X/9wB4UN0acBQZn0lEKYf3XaB7vnh7yWSjuC8wObV86Nz/bF6icsJlTYme
	8Zm9DEnyvTf8rudjh1618lUxKMZ2+s9+d7J8MRlyvJpbaLQMjGlQLymddbZnVp2y2n76yS028AX
	rk+NJ2KouLI5x1+9oxf409jUqwm4y+ltdHCqNFdVRkrwgPwu6J25kCaIctT0VZr4LCeFGDOjaB9
	SaspNjAui1/KB
X-Received: by 2002:a05:7300:6d21:b0:2b7:121a:99f with SMTP id
 5a478bee46e88-2b7c8523f57mr419251eec.0.1769748153791; Thu, 29 Jan 2026
 20:42:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
In-Reply-To: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Jan 2026 05:42:21 +0100
X-Gm-Features: AZwV_QhRH6NFawvUkrRDz_yRhStDmwA2TFS4yrZjVaLS2AVjfviiDczKLJZCaOo
Message-ID: <CANiq72=z5czHz1j5+oi2zoovf4a27Pk7amikCGuchmAD+bHfjg@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 1:17=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
