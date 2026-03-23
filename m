Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A4A3A8752
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 13:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272914; cv=pass; b=tfuuWhvpuuPrD49kFuxv7cNz4gl59aT45qUh0UXbBYLyMtPKPJglEWQ3TJ5PyxFPhptGSmImV8GVMVNge0hhjGUKGUTGGodp4fmfTCkq6X0JwW/AdrZvwjvI3Le4oSiC4U5Eit0uZ7ZO4bGNcKZPFnUIFxQkuMzAnX1LDvYHLdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272914; c=relaxed/simple;
	bh=BWXOeU1wWl1XEOCGumiVY0N8hZzx/EKsLDL4oWg6ZXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUOStTnDumnqwF86YB8z+1tzMrYaYFNJGsuNCN1ykRaOBGShYZ1EwAYVSPrxJdHpfQ6iiH5smpx8CUcOJlxvDRebSLtJ9BpuMzUqkm76asyVYUTMmyBNJpo5l3T4tgqj2GkvPFgLUcfSDOCbZREcBcVU2AsySBFdos/gCUW7J3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeX1P13B; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeX1P13B"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c0bf0a0236so139444eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 06:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774272911; cv=none;
        d=google.com; s=arc-20240605;
        b=RGAHcP6rGsoeGX9+GgXqeGWISnLeHYam/1Vbdbj/4YJC4+qcFWiDpQuRHPe1OIKb51
         9kgU/PZzp/ymslUswHT6LZBzAdgSVEyfzAhbGuTAPz9GM4hlEfB5rUZZ2LJ8vKOjTr4O
         Es2EBEbQr4MpEptMQZR3G2MqjP37a9kap75/Y5nSHYr2/JAZpdQXnri3MJWxsotVsWns
         VC/o7Y+07iMgKEjJ2UK4h7AwE15kgOyDj59IzyYtWMZ86uhyNzeRNKcKB/fqcNIHtPeo
         m5c7KbKZW0/ZvuHAPT9H3LqLkWiqOPhcRRBLd9MOxCHpw/k99BR++RAMnRJ8+hlwoyoh
         sLtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P5oJqHAVX7zT2HPF6s22H5/MvQLO5sXIIazXAuipXIs=;
        fh=XmbHqcT6WBTvtFp65HxmxrR0L06oGnsG+Rg7gX5TICI=;
        b=cckjdcw6muCjdZly9uHf4vkN1H1qYh6QtmsY7pg9bFWc+KW94CVeBHM6zqxcFlbQHa
         DQU6qpu2m3s4dMVRwJNzrMkClcUIYc4lr3IQ8OSRTYG2rzPza3n1RGaLXxBIvFwjo8Uc
         bl4vQGSOzRK4SrzFcVpJw7rL+8aCSBpv2fbuQIregzdrpDut8V+vo/APl1rUcz4q1kWJ
         5VDLVv7UTQcBqdPy/No5+2FnwZPUR+j2DABrD9naZoiMajkA4ngvYuCpvuHawfsU6GRA
         Tl6IT+lp4p4ZqlFM8MUA3XnVNcX+TK+PBk22j+u9FVPYJsPmUo9FOKIqIDjxFVQSJcqd
         1TXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774272911; x=1774877711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5oJqHAVX7zT2HPF6s22H5/MvQLO5sXIIazXAuipXIs=;
        b=VeX1P13BwSbJbjddWmNKWXJQlD5tsytNRzsoUJbqVt0D8mSNFc+XxeVXuiZckf5KKB
         lvQjCyj4VISIK4bLjI9jzpCqOUyy8R0rCByjapWLsyo6xPCrELNDvCfqaYsC0zsApaEk
         jdvT38WQPi9lG94ZOcp1eBhggCGg3Xg9lAhuw1G3rI3injo4thOz0plTIHFmloKsJtyV
         L745QE6T2YiPaGBZG40M1QwyE5skya2OUWpsOFh6frZeug4Wg3Z2GiZLI3F4qg2udo0O
         SRTwARfC2IyvzGXKAcBXZgqpVuD5TNFXziclJE9mlusQThv+kEb6o8JxXeVyyA9cl0wC
         bQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272911; x=1774877711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P5oJqHAVX7zT2HPF6s22H5/MvQLO5sXIIazXAuipXIs=;
        b=CtgatKhBkLBlYmYFsevhbOE6ycxaL3yVLBKvayrE+WwUkMcgOsvkhO1un36jF6/qOO
         m6r1N6ny1dkwPkFNBJnTmgQ8BB7hjVYA1JnZsDi+LSvvsIN81EvGxNC8HoyL7pHe0hkW
         uXP+GBL4bpkz3FBMujaLru6JH6stHPv16QZhlhF/I+0Hp86O4PBXKSxFYne5RSqLEkCa
         VxxJ85tuggvkBN8cOBr9FJrJqjfiaiLdyu5TP4vZc/NHi96TDQ0/vPhSCjrM7VD2uD0L
         ACWlkPYC16RAzTBJr5SEdTGa8bH54/9MZKLkBR9/l/TmmDh9OZfZFbRKUt7d2jykuLZa
         +wOg==
X-Forwarded-Encrypted: i=1; AJvYcCX4s/DNtujsK3WKhVYnbnYO0iXM9E036iBgk7eOtQXuiIynZ89pqm33cr6HSzSbOWXQ7tyL/fY86ZR0wU/+ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqjqfoEA7VhYRmJa6KUBGlWn7+Dn9eK1CzQDQQX8t+l1Yymh+E
	er5IWKNTYQf0gFBly/3dan9bWkmktQztwU1eRaQM+n6tGyBQwFcZarconSt+M6JU4avAItkbYNO
	GMauQApgerIlC+R/ktf/jijkPI/WdB7I=
X-Gm-Gg: ATEYQzyl5l4Ckfpcw9qGZLvKmYInF2XpjHcqfs4WfgrlcYzoQm1gQwcwoDyRYHXLc10
	3NulHHjO0CeXRZJCpawelROYQUcQy9F2gG2GbgKrtUFzSBraN0B+rDOkIr29ERF9KqtUxqCjSzC
	2oLrvcBsyhWueTGKoibWc3Rt34FqXBenxXFozpozF1Dv/Mpyq1UnBuIUZFUmsHWBRZDWm38p71+
	H6INmbw691Y/tBiQMF7IBTceLBaMpZsX5+L77lwnGIbcTKImtH13PW1E2H6JVZYXF/7SUaOhYQJ
	rk8jZIxXHHOxSdgoVELHQfx0OdeL7y8VJqtviduqAVVJsGWXAQKB63X+t5ySGH1F4LJQRs0cCQs
	f/hmF9lSpz4BxqP8LX/7Xml1PpH2X2sKJhw==
X-Received: by 2002:a05:7300:5711:b0:2c1:27c:75d3 with SMTP id
 5a478bee46e88-2c10956c2a3mr2435566eec.1.1774272911337; Mon, 23 Mar 2026
 06:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch> <CANiq72nwSWVDRqm0Vap5j5X5k+Q-wq8okQ9d3KUgZt6M4CpW9g@mail.gmail.com>
 <65336ad0-ac37-416f-b6ae-e691e3e375ae@lunn.ch> <DHA6SE9EMEQF.1PKVHEG18I5FS@garyguo.net>
 <b5063e7e-9245-434e-9877-5ac7b45f4bc7@lunn.ch>
In-Reply-To: <b5063e7e-9245-434e-9877-5ac7b45f4bc7@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 14:34:58 +0100
X-Gm-Features: AQROBzD7g_rNmuMWaBSXTkod6GcGExC_6-5XqRdaJnhqw3z7WBAm_JnLMPlOCtE
Message-ID: <CANiq72kD6HVrDTjQrTXDujyjA4Z5ELM6Nh8kFfVfNXrvpfU1wA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, 
	acourbot@nvidia.com, akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 2:28=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> So it sounds like my understanding is out of date. When the first
> Ethernet PHY driver was being merged, Rust could not access inline C
> functions. The binding had to replicate the functionality. But you are
> saying that Rust can now make use of inline C code, but not actually
> inline it? It results in a function call?
>
> What this feature does it actually allows inline C functions to be
> inline? So it is just an optimisation?

We have always been using the helpers to access the inline functions,
please see the top comment in `rust/helpers/helpers.c`:

   Non-trivial C macros cannot be used in Rust. Similarly, inlined C functi=
ons
   cannot be called either. This file explicitly creates functions ("helper=
s")
   that wrap those so that they can be called from Rust.

It doesn't duplicate the functionality, it simply forwards the call,
i.e. it is not as bad as a full copy-paste of the implementation.

This patch series aims to improve performance (cheaply in terms of
built time) because for Rust calling those helpers are not inline
anymore otherwise.

You may be referring, instead, to avoiding to have to write manually
the helper (the forwarder) -- for that, please see "Support static
inline functions in headers (by generating a wrapper)" at:

  https://github.com/Rust-for-Linux/linux/issues/353

(In fact, I had your previous mention of `skbuff.h` from Lore there :)

Assuming `--wrap-static-fns` works well etc., then it would be nice to
use it, yeah. But that is different from this patch series (and this
patch series would apply as well even if we use the automated wrappers
etc.).

I hope that clarifies.

Cheers,
Miguel
