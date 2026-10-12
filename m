Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A943EDAAE
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 14:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814695; cv=pass; b=VAyu56zOEgS/FQGuk1AEfDc27lcvjTRAjBmr1d+OzcO2IYnpgGLvndfNYjmTo6Fy+Th3NgMNU/IbjsjI0ieAZBz1GgK7wh2D43W42a79qBPeLxdrF4HtFMK7aTUaSRMTrMsXfbyQ0Ur1FNL9Pn32sAWpkunZbIGZ98LG3bgKH/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814695; c=relaxed/simple;
	bh=g/BhmG4j9ffr0oFBvhz7lb5ueTvQbhXIGndnnY78eok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucnwNGjPfP7RB82j1jkKE3B7x0v0JGJWbE8srUHYtLZwL0XcbcYt2VQchFmSFqkKdrDHgnumL1ozY1eHFq8SjAjAkOH5faJKxOi2+r+Ao0+vd8Bv7Tu4xDQ7Q2DM5abG4At9A+bwAFPiz7rwF/ocK4IcqoHw2isT0rxiS4PVsek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=My1OId9A; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="My1OId9A"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bb5afa736so189726eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 07:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791814693; cv=none;
        d=google.com; s=arc-20260327;
        b=mBVicX+rTBA56wf0ZZ/ebiVV6lg60wk073Yt4C3WpT7azwD+RR+De88h2TgdOrJqUK
         IQeFnwImUXX4rN/oavK1Yti3yVbfpLgwgrey/uV85A9lbUBD9sYpZywHymYhcb3ZKYGj
         B6l/c76PwXlvfezt7iil2I2FOPxF4mq0V2FgQKOwfyE8MFNW4uHYnH6woGfAqilotElu
         UCsjM6Sgbd6eH1r9uGStr/nE5x7DoPJq2p2s7ZytNi7kwzTqHdAIGSVPmw2h8IKF7sAv
         YCUeOTltsjbFvxmw/bVSGLKGCUMjD7CWf+Mb1IdoWuF8a4dmfDWNXPhaO7YwpZlgblbA
         Hp+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        fh=ot4Gdsew3q0DDQVQtcT8Qrh1+vMV0+yzduHvh6hJa+k=;
        b=oXkS9jR/1enlQ+dlXTRXw88u82/Fv/mFpXxjSRFxUCSeBdbglfy8GlekFQyzIBfoC3
         WQScomRtoIxpxuhS82wtq+nMZP/plELRqqMGuClunYqUJpKWhhoG0y9bzAOOo5BNL/fv
         5P7do3WkY6TSY4ScZQgxwu2mIBze986OZvqie9b6QYBoYnxhub/FZ/AbDzdbdaua4J0Y
         bSmRbkMipdO9MVS18Kj2HDBIzWdUVqf9iWAuFvZauDQtiITZUcR3psquO6wWu/7/b3D7
         XIRvQulS4PB2zsNlEYbYNHMkNxVYjn74jRnJtYDenJ6eQTMaYOPC0ERTj+hPqgsrxJv7
         BBYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791814693; x=1792419493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        b=My1OId9Afu44hbY9lwaqcKNK3hVPzp8rPSGYolT6JXNPvKYoq4DQfBxJm5eeoJXLPE
         LnEVGTrZuX+RqYI1veoEBDoEaHJ0XGtbCfJOw1YNRELMGZDHnFsmI08VMwcpW8q0F+AD
         v5ZfpZVhTLtHNjxeG3QnsaMv1jj4zddz1L4yMn0P2j8BpqLraO8mASnlHu8kXrlT4G0c
         MLRzDVtTDHSq9ocOFjs9CL4dC5zfsgE9m84pKgazql+TJ1BP5kNcPCNMod6lrfmLJDoC
         aKqrtBEw69cKrJ/QfHKwQnTNVLNkRGOqTs66ioJZ3oD84yrKdYtggQ11+otgINcck2Wl
         kEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814693; x=1792419493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        b=W/T6j8xc/vTdMkMVv/a3Tg7AQj/ZOsOlBei4to6+Zj/U0mWsA2N8OIgUW1atKG421a
         mP8+b6BkZ9IkN6pGPbH1J/A6c0cOGALwRvlk+KQcL3Cc90J6yOHKPuvmIF/213hh9jiY
         nb6FxNAEhsDpdKKL3dAATitAbFuQNRAvZABv7w1La2vy+POxcp1GppgM9JykEF07Y2HY
         hAVcvjkOTpkBdlcVAeKX5jcBR456wNGK0MQ/PZDQ9XhcyMJzBbNBa4RjCbpqEunTOZ3l
         qvhJQtlzfKicWnNLtV0QQLabnVfoyv4E3RKDC+TOXW0JSk/khvI+e6g6JDGaXDoN7IBK
         luNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBq7jfQddvqBdIS41GhFBBtA69u1kQA5jMxbvPN4PCh9C3YaA0mYxQEkf7Fd4XpJjWYRCogpFBcDggoQwDrA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKiz8cVkz9XKqTD56z/WB6SmVwZhlVrpnJYcRCQFqINiQYboVFZ
	/Q1PVznw+mwAUjkzOzJVFh02jI352eN0aN5WnLj9MEUC4Y3jhQF8MrhGSuVXo/nXRA4hGqhJYHx
	xng4SbXG5bLK5x5zmCcBNcfTsb3XG0x0=
X-Gm-Gg: AYBFou3/QUO2XhDN9MgIVsrZGAv1vCMWURlaK6mZmitMLj3GvkX+keYhMHlOl57uCGg
	Gby4EzL/WLLaVR9bFerkyu+hZnNVpjthf5132rI8zV3D+F+E6L4P4+44uTkweK00seUKJ/xI6jp
	OKrsGv1jGAmS3VvFRB2pGu4NJl7BX3bjoEC+ruBBkl0DqETIAh5CGygQzAnrGmBl854uJN39sWD
	aim1jJ777DB4OllTKzwiJJ3RV2kgdy3YhFbSNZjnzHRQiOrjfUHTV/G/GFFVCUKNoE1sFd6akmX
	sKS1eQXYbX2TD8zwuUxpNkFPypM91nzPwGTNEeL13OljDQMjvLfPZJc0jqr5S1vchvg2MFuCxRa
	49c7q34w0o2Qmzx7pdUDLBHMsNTK5tLM3IK3sMSYBFZepF0t6Gy8AFPpzxrqBDCAMwoJ7CLAfbk
	5lN7sl6d9oFlPJnjitqFUApo0WM6PyE8++J6YLUy7RwS/wNscy/StXgiZFX2thrQ==
X-Received: by 2002:a05:7301:428b:b0:358:7ed4:a049 with SMTP id
 5a478bee46e88-3587ee40938mr13997955eec.0.1791814693087; Mon, 12 Oct 2026
 07:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com>
In-Reply-To: <20261012134159.912183-1-elver@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 16:17:59 +0200
X-Gm-Features: AclHuK-Ywlbcl-S8KQPaD-1cIH6SBhIHUu2wWCV_8Z4IN4dYEXXQbTyoeFpEilQ
Message-ID: <CANiq72nsJw25w6sFbLKKSaWog5_2cpmBmJMat-zQW1rcveJA_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 3:42=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> +Rust code is instrumented as well on architectures whose Rust target sup=
ports
> +it (currently only x86_64; see ``CONFIG_HAVE_KCSAN_RUSTC``).

Maybe we can omit the x86_64 bit, to avoid maintaining the list in two
places, although it is convenient to know in the docs (but risks
getting out of date, of course).

> +  Note that ``rustc`` rejects linking crates built with and without KCSA=
N
> +  instrumentation, so ``KCSAN_SANITIZE`` and ``KCSAN_SANITIZE_<target>.o=
``
> +  cannot currently be used for Rust code.

Would `-Cunsafe-allow-abi-mismatch=3Dsanitizer` work? Not a blocker for
the patch (and in fact I don't know if we would like to actually
support it even if it works), but perhaps in the future we can relax
it using that.

(If it doesn't work for some reason, and we want it, then we can ask
upstream for an "escape hatch" as we usually do, since things like
this should normally have one...)

> +# The minimum supported rustc's LLVM supports all of these options.

Just to double-check: does this refer to the LLVM version of the
upstream `rustc` binary (LLVM 19.1.7) or the actual minimum they
support in that minimum `rustc` version (LLVM 18 major)?

I think all the options exist for a long time, so it doesn't matter,
but just to confirm...

In any case, this sounds all reasonable:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
