Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B5C3E317D
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 08:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917794; cv=none; b=DOctW5uoOsN1V+NgFm3qs1kFP7OSeEhAuwxmjJ5x+csSySBXYi6zxRCekoLnFmIBJqW/DfkbRzLlN5IR6JbbdUxXBGNQ/J+X/ybJVh5t0Lkncxx5nThRPpzh7i7nuqRJ42o5Waks6xO0CE1BIzvEE6QdQ5UikwqptvHAHHvKI8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917794; c=relaxed/simple;
	bh=wt7S1UHXdC0IWlCwV5x371UjSQ0LibtstyLaMdRwt8I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ClwhMYL5Ox8vw3frhrwiO2sGhuW3trOV8s8XL/nRHFUvusHXI6rZjldSB4g04yrEIjIV3M+1kjQUU0sXxznD6GTzQvLa51VvQO3ozz2Hf540bLqHC0HEyE/g79rt415/YGWYfk22Owe2mTkOAJMVTfQ61xisMAV7B973Z2MzgXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u9iRoMri; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u9iRoMri"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4955e865174so3581665e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 01:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785917791; x=1786522591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DAp+qJnhP6fMtUxORncdqnNdBiZp1XLvnNJM7E3l1N8=;
        b=u9iRoMriiTIsJEzNk0LzirVEKd28IU+ryqaJSMZNHUA5HJ8zuFZenKVrEVThT2kAIE
         6KgNQvpEFqlnyMITD7E9QFknSBJIdDb9F1SiqxW7HvG89DCEqwAtvMLQ3NPZhpfPsqik
         XzCTURY6vzM45+F/CPkIJ+EyrPfzFWkDdrw/Nu4ZtV9oe43uuuEokgWve2Fd0DsiH8tV
         ESyGJpbNgqAlt8uXskh/8lUOzv/6v5mNgo9rXtY4SNqbtDE5iF1uN09PE59YxT/RTB/a
         rDQtRl+L3pJEPEfE/5+6yT77fF6qjrHUwpx/LsSdXH/LkoJA/P6jWh84OEMtoT9mSk64
         aPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785917791; x=1786522591;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAp+qJnhP6fMtUxORncdqnNdBiZp1XLvnNJM7E3l1N8=;
        b=Ss9WgA0Clsg24TC379JnaUdXS6aZcTBc9l1CdbxjkVE24e0h2NksO9WTxV+U9xRcjB
         aNMwcwE+ITcyKPLnDIH7dH8hsKHhy32vczN+L1204nIUQKaBeQ60nBI33zGPlpjBQAaP
         JIuUzGiF96opLYCOcGJ39TM/IqU3tovUhXQ9DJQ0tjGthLItDszVZ+26gzpXddYIyckX
         /gA+mGX6ayFg7TCC6HAg8l02nb/Qxye1qbPReZKkosYgpwRHwDnsKijEERhbuqFkXjKh
         L+UkjLfOEnxAFbW8nle8jMANCu+ZDCEgtVIaDcmPs9daiPWw9u6uHdMZbHcDcqiIIMn/
         IZLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpns7UXssLARHJ5KiJ6uzjVScJJjA7/AsNWuokknyncEQKzYzMmejcjkNgbrzgGR7PPje452cyh3japIz85Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr/ejR71u5blFJNmvcstIKWjd71Jo9wIPuL5lQqg5NyVJnj5Xs
	dCuQDCO26MKrVfJS7GOaIZsope4Bo+aOH2DCpZz5FYm+BOSQqMYXGbhwpg4W5gCavuuZFvavVcg
	D+BII27vK9wY4cKh+KQ==
X-Received: from wmlv12.prod.google.com ([2002:a05:600c:214c:b0:496:c5ab:c668])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3422:b0:496:c18c:f9a1 with SMTP id 5b1f17b1804b1-4994e7cb6abmr36951965e9.14.1785917790935;
 Wed, 05 Aug 2026 01:16:30 -0700 (PDT)
Date: Wed, 5 Aug 2026 08:16:30 +0000
In-Reply-To: <20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn>
Message-ID: <anLxXvCKBcAVf91_@google.com>
Subject: Re: [PATCH RESEND v13 0/2] rust: Add safe pointer formatting support
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Ke Sun <sunke@kylinos.cn>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2026 at 01:18:42PM +0800, Ke Sun wrote:
> This series fixes two issues with {:p} pointer formatting:
> - The impl_fmt_adapter_forward! macro destructures self into a local
>   variable, causing {:p} to print a stack address instead of the actual
>   pointer
> - Kernel address leak =E2=80=94 {:p} prints raw pointer values, exposing =
kernel
>   address space layout

I got:
rust/kernel.o: error: objtool: _RNvXs4_NtCskVLJmUDtH0q_6kernel3fmtINtB5_7Ad=
apterRPhENtNtCsfr3MPOfBGpN_4core3fmt7Pointer3fmtB7_() falls through to next=
 function _RNvXs4_NtCskVLJmUDtH0q_6kernel3strShINtNtCsfr3MPOfBGpN_4core7con=
vert5AsRefNtB5_4BStrE6as_ref()

when I built this on x86_64. Miguel, are we missing a function in the
list of noreturn functions?

Alice
