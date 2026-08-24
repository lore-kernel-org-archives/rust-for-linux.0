Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B002472A2
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 01:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787534074; cv=pass; b=VC2npNF5FA3UKYEFyFPidqxHWGUlU9cvjB0mb9vuNw5wAr+XdFaLEPcpz8Px0obtZDDFkLvF25kcyImV98EimgowFrsGCi6qkX4qD9ASVTWbHJzl5u+b/TLyeEcD04iAuf2xEd/HskbquZ77gM1i9GAP30LHot39DBeo3lU7Wc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787534074; c=relaxed/simple;
	bh=QuRBX0eFyBGt4cQabAJz2rUNSA0fxyQ1i6M/8wXJOoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D7lL7T+TS1sPe3Ur3IP9Vh0YdKXD9/ftO08khyW+arHgGbKWFTBbU+lmTXCTHudmMMWVZopONVnNJ/lLlDuRyxWHjDOr4j4rvITLt0hoqEcEijq6edY3vunPwlYdOU7Sfc88npNcqem3kVRVnbHa6Um5QzQKuNWrjyyVOxhzM+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nehtDamk; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nehtDamk"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381f03d7be0so356728a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Aug 2026 18:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787534073; cv=none;
        d=google.com; s=arc-20260327;
        b=PJD2tcqVDK+1ptNzBDGjU2D0uv6wD0u4L4POBZDAQM7D3bvOTwB3sbLI14rn31zfj3
         3mgNxz9//8peDsvo+p6EFaDHb/tH91LVlVumjHTL4+2cfs1LmdHlwSg94FpUsgBXxrH2
         tdz1MUJgGf3FCUVyKdqadCZ3tYYs+DCgXKHga2VvwFtZpvqhL2SgMniIeb2rbEG6hxJi
         7Qs+KWT7U/JGZN+Jnt5KbO6B4r6+T2qqAeWWmWTIraFh148N1vJP6DXll513W+q7vbeO
         Vsg93D9CSX9kgIF6ZKW7Jh8/QekQtrfyZpxWpk4gUqlMSmv1Ph2xnzkFstjFfL10YQLH
         fnbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oCRc/Cq+CsgcFe7Tf+86ThZGP1IriKinmdWR+KKqTqs=;
        fh=OBwEEOQRwlQu8NvN7771UhKr3ElqPpNcDfFa/aZUkMU=;
        b=W5+hcZf695QKW0DBeE1G6QzpASye1Ho3uCAfhtS4Urf3BGB2K41+teHQi8I/Ig++7K
         SM2VvKCGR7TESOYJ1ivzT+nw7W//x0nzU52ELg0c2YszvKhhSljFbLjtOgvC+RZkdvL1
         qMeaqgoFBanIrOKkOxuQjyyuT5gGbABUIrzDdAS75IDeATeX0PRfSbvnXABlPffdWfoF
         qSmRYWV0SYEwS/1RgxaR7AEW2JQewz5INdRsSmwex/NXgIf5IQCMKBYzRI5RKbKtsVzN
         gmVMd0rL5WlEubokDGT+uxfsu5lsV5weHJioJ/NDt7kyaE/oIp0qoZDNtOkD+nbEnwnQ
         dQJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787534073; x=1788138873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oCRc/Cq+CsgcFe7Tf+86ThZGP1IriKinmdWR+KKqTqs=;
        b=nehtDamk+n5Gtj78pWgu9WygAtwWuMOtPvlc1BO+G9EUUt0p3v5VUw7FM1qTejvXNL
         jwzuuQl2E5M8IBEDvmWdnCeq8sROcPzc6MmB8DmIsCJdFVUFaGRTgJQt6MOnkYMA+3WY
         sHU84hPh4iRi9ZkNcNqk4VGg6BZnwWBg+0Zdk6pOAsZnwh8n5ZvPAYEirnUeUzQStSFm
         V7B1ciAQ1MYigRmYn4gAgKzw9x4+vejFN79+2lJFlPRsbibTBtSvjpufLu7pZ4x28ZIR
         +4GZp2MeOCQwCDTvTha7vsBZWDb2DVqGksH/LZ225v8DPNjq4rFtbUts4qbPzv6o8Kfl
         wB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787534073; x=1788138873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCRc/Cq+CsgcFe7Tf+86ThZGP1IriKinmdWR+KKqTqs=;
        b=g7ZoGN6rFkdYavJvwZcELjfe1J0/pkkyNVgWU00d5M+ff/ACnUXA3rV3ZZNDTRUHJf
         iKi5C6/NPRicCcdgKpI9oyb/EDYh7ZV4yh7GEZCX2eBpw0e0bp75OG8z/IvSWg7OWlUi
         yd5r2LDn28510q/VnqtyiusYu48O4h6AOVudte5IsBk7cnDeksZQnd1Zn57PZc5f1ACV
         tdwbsQ45bDNRDAOd3jf9VRHljGC7Mhxjvq++HVHUPTl2kArl44jXmyWNNYuPsgKI295n
         lmuMZgyBzda0xCw6duZzYr32l8yUFmXcFGmVe8fUpv3rrkMrV8a9ObToC9iYtFpqG/VG
         iR6g==
X-Forwarded-Encrypted: i=1; AHgh+Rp/rc1E4++ogfBnaSzWprZW4emY+eD9TZ/KjUKIoCfm0TgVKN9ElauZVpaCc4K7f6BtvZiI354kZ6LrfBo7Hw==@vger.kernel.org
X-Gm-Message-State: AFuF++lY2ioVIVGlUzEHLloefBYxJ+jW3MeJQQ5HNaq+PPjuaEOAiAUh
	dhzeZbWO28JmfcCSBhfAXK9K3NqfWdHlfMfzKltRa9M/sIx5yHgGdofNbHQkOzvYJjkH7L0+teU
	1TqcUYIN86/99M4Lp+Pjo32K5FIEwGbU=
X-Gm-Gg: AR+sD10wB39xj8X3HbfMo7BWAA4bkHN5nOG76vRwyJlH6oMIp52nRB73t+9oOiPJvH/
	RNyKkGuz6STVAhV+A6UPy80JHbZZsIvYD5IYKiPNlOqY1ExSblylpyZygKdyYqzUUwqDS3VyX0A
	asNXBcirXByP7c68PlH2MkKjjCITBGaY3IShkV4o5qwywMu4w+Qu6cVlwNyK0dLA40lI6SMYWvd
	DFZeiqAQeWJ7PFwopm2fEX9qR0ygeY1X49WmhHmYQxdQA9e7kryUKiq9WG5EkPZWPAYhhLk/U6Y
	qnSVgWvg+Qd6BHkpvV8VeEb3xbYKh7rM0/K54yUHH1o3yqOUARQLoq97n69ghQe20c57uM9JoaK
	o7U8tT9KFRkX2lLSMEopBq1NazCci9tpzwu8ao54ZD2Qc1DLVM03iWqQztJeL
X-Received: by 2002:a17:903:4685:b0:2cf:9e90:8be with SMTP id
 d9443c01a7336-2d64b0b66e5mr185891325ad.4.1787534072630; Sun, 23 Aug 2026
 18:14:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805144524.233362-1-ojeda@kernel.org>
In-Reply-To: <20260805144524.233362-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 03:14:19 +0200
X-Gm-Features: AcwNN1VJsAcR0VmKuQhmyek7VZ9j2tJREaQwMXG3cOc8ecN9I7kvYkm8YsTnM-Y
Message-ID: <CANiq72n-=GaJyFG3sAkqUaky_Eva-A=deB05J7OoPAZNJp7b4Q@mail.gmail.com>
Subject: Re: [PATCH] objtool/rust: add one more `noreturn` Rust function
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 4:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> When the pointer formatting series [1] is applied and KUnit tests
> are enabled, `objtool` would report an error with any of our
> supported Rust versions. For instance, with Rust 1.97.1:
>
>     rust/kernel.o: error: objtool: _R..._4core3fmt7Pointer3fmtB7_()
>     falls through to next function _R..._4core7convert5AsRefNtB5_4BStrE6a=
s_ref()
>
> Or, with Rust 1.85.0:
>
>     rust/kernel.o: error: objtool: _R..._4core3fmt7Pointer3fmtB7_()
>     falls through to next function _R..._4core3ffi5c_str4CStrENtNtBS_3fmt=
7Display3fmtB7_()
>
> This happens due to calls to the `noreturn` symbol:
>
>     core::str::slice_error_fail
>
> Thus add the mangled one to the list so that `objtool` knows it is
> actually `noreturn`.
>
> See commit 56d680dd23c3 ("objtool/rust: list `noreturn` Rust functions")
> for more details.
>
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Reported-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/rust-for-linux/anLxXvCKBcAVf91_@google.com/
> Link: https://lore.kernel.org/rust-for-linux/20260706-hashedptr-v13-0-377=
a07f2f78d@kylinos.cn/ [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks!

    [ While the series [1] mentioned above was not applied in a way
      that triggered this, Gary found another case [2]:

        I am seeing this function causing issue on my 1.85.1 -Os
build, although the
        error message is different this time:

            rust/kernel.o: warning: objtool:
_R..._5range9RangeFromjEE5indexCsldbe0TGTmNx_6kernel+0x1d:
            stack state mismatch: cfa1=3D4+8 cfa2=3D4+16

        Disassembly shows that the function call before the warning locatio=
n
        is a call to _4core3str16slice_error_fail, and objtool thought it c=
an
        return (which will end up with a unbalanced stack if it does return=
).

      Thus apply it. - Miguel ]

    Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
pinned in older LTSs).

Cheers,
Miguel
