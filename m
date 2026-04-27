Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACCC3976BA
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 07:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777276439; cv=pass; b=Xam8XFgd/m0typPtRw0mM75nOkm9mcalJFBMI0LYcz944g25RPfqMmaQZgy6WA8/SL/ReHsq/eYem86Pd1c/5O6ctNlWOCLg89bCMFXgPsiVwJFjKPnPGv+GSepbGOL0mZO61oRJcvRIfuan/ZvdCnLk5e2gMuhN3T855ySrQPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777276439; c=relaxed/simple;
	bh=b35A8nNizCbhmmqhFNQ9A5y3461HTQ427R+NOjrGrZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAYwO/DMoJmUdwmL5dhXdYr+koBU7Mx4di065qf5HrnEIk4s6X6kBV4pst77+sdoaBRe0gkoOdiZWYG0HOEFme2w28eBtVQ9gnVZDfaEB1Dsb9cbkEUZraNm2C0PuAhwUhgYlJE0MeET3IsVecr/CCKHBZfSceaNia6rR3cbSKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eTVV+p6/; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eTVV+p6/"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4411e1eba51so6578378f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 00:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777276437; cv=none;
        d=google.com; s=arc-20240605;
        b=fr0kOLModoXTkasLi9HWH6Jl0txv+fPA8Ecz1UshQJlf8BpCKwLufOY1YrG0rS3vKv
         cTYu/9iN3+HaCq2tTumNdBf1L4E+B3SU5j7nK8yekjAf9ibh4o86d9PjRDTDQIClDMsB
         DgGqRXv6klTM9SMbiZFtM6t7MJOAHMFql+x++krU6VQ6hSbPVH2XDwm0ymA/g/tJi/pw
         PclG+NbqlqNfcE6kweIkdl1+bnor42SStaOC4M57cgTp526qCNH0Hne8A2fRoVjWw1e3
         iAyEPmAMyZAaAjaU9hu9QFMZUIwqBolLQr1vViMQbOnUmmKjbHC/jsotMXDNuJqwCwGw
         iJsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OcNxXuuIa/G7743UoUO33DzGwgrzsKsdOhQxGQZwPXw=;
        fh=DAK3MekPRSFr24l0pi0M0huiQVII0H/I5YZiRwGcs1w=;
        b=f35Ne3OALt7YieUsCU47RlLTaaTz+v+0/SCBzVAdE5gK/b1EigPgoy1FrIdIRFf2xF
         4cjRo7hZwfHsQ2zRRY6lSeQeXchENuo5ukPU17eE+8vBfBo07xOshPiDu7jroctxaO09
         1mMNVUZoOnAN81I7F7/652GGiu7Gg6qad+n/j42KRr5KyUB70dK3TPU1YIirpDHXeUgn
         qFAhourcmGqTLEVuZ5qrpMWQuurrcLAkTrqe2anP72wHJr+uOPGKRIQ7/2N0uWEmfuGL
         aiL3YWIven1Vw4gtCTU8TEZZGIcApFAGWsu6uDsQ1jKT7KXqsgzVU4VtuFf48qXG0CeS
         cPBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777276437; x=1777881237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcNxXuuIa/G7743UoUO33DzGwgrzsKsdOhQxGQZwPXw=;
        b=eTVV+p6/dYOnea0Iu4wGvb5aAI9hEb0RhCav9grs9RxJhrMgIY53c1h3fyctsI7YNu
         gTkH4OGxxsW83treNEck4PePXWqc6GENj/UyKQk1+H+91GVdmPr1YGNj2CQIAOw9iDoP
         SIrIb4gmHDt+r6BsjV2din/LoBkl/FNuwCMRkVAuwoOUK5efJaO0W+GRPxh9tuE0eD0A
         aiHbVN+p1dQ/EBQlIy9xA7oBW8bg07Ry3HGYWT5hFEKI9zMy3RER78wQ7H/PDDye/Aco
         DbA98u8FOQ7QqL8T19rQeWRjYrkNEg8ToJm7DLtf6T1PCSqQn8PR+yaNNeirE86Imhto
         nHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777276437; x=1777881237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OcNxXuuIa/G7743UoUO33DzGwgrzsKsdOhQxGQZwPXw=;
        b=i3+XTtfhgY6GFGUhhwXhqk7VHVacfoxrq/HhRr17ejHME3dkqgesIYxm8/xVt+DEea
         Gj7eWXiq+/QMeQx8eBi6gk/mXYl5xLEsv1P0PY6MSUv6caVClt0bLFs3SDMsHcQVVtYB
         5UQc+rmUI7v3PoKsk/bI14gIhZ5HPXjkjWJC8kmoW36ZF0/MktUwLvFbR3pXcrt4o6v4
         4A7nHb6OcRZ36zjbbD3FK6Qz5HIq6w66ISxKnq34glUMApqk+WJ8YrzF9m5yDe0LlqcZ
         70IEMA02s+gZoYguRZ0zTJ0QxdycSyTSigo+rFrNOH6C1KlfipFNAT9mxWGa1drUFHYw
         APdg==
X-Forwarded-Encrypted: i=1; AFNElJ/NKDpud3PgrlEaGfbpe+zXALbw2FW09KtD+ITxGRmKf+Dse7j3u/HWFf8Gop3A91JyCYclDyNOnA8mpChE1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJjd31wTLV8Ot3pmnl50LkFIzU9cbHoKyEXIrWl2kBQX0XmI+g
	yJyoPqnCbEmN+Zz6gXLn4rzdGlr59Jxu0F9Qh+4B5fVsHvnpAXKV06dkyHKF8LS+Bo4/6WWWjp2
	cmTGNe8KKunDeLbnvaFwL35btmZVl6JNI3oeWGpLH
X-Gm-Gg: AeBDieuHw3LMAHNUfe+/AzdUQZZAbrqdFu2JBDD4UwFBwVw6hdJCCPeoDCdaWSefRwB
	8oUkgp7Fgs3LsO6khydhwz13AzRXiHAghLmhy0D/9FxjoKE0hNu01oFpDxhoyws92hd9AIfqvcN
	0CmyB5TC5lvCe7atavj/SeKJ14xptdmcjl7zYJ2HYRBQdHQNWkGgrOdLq5vh+YXv7lylIbZXV8M
	Qy1lP96RaZMQbkTKIYHRgaJDCwT8HX6gJMEGroFaUxq+TXOE5q/b2Q5cbV+eaQlND3+PFDmITVI
	tR33TtoCsgZXHH/5LXdO4Dd6+pTe6T5dnFQZxGAS3i/DI8Rexwk9/fSGahQ=
X-Received: by 2002:a5d:64c3:0:b0:43b:5097:6f62 with SMTP id
 ffacd0b85a97d-43fe3e141bcmr61044080f8f.36.1777276436304; Mon, 27 Apr 2026
 00:53:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424-b4-fw-boot-v4-v4-0-a5d91050789d@collabora.com> <20260424-b4-fw-boot-v4-v4-19-a5d91050789d@collabora.com>
In-Reply-To: <20260424-b4-fw-boot-v4-v4-19-a5d91050789d@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 27 Apr 2026 09:53:42 +0200
X-Gm-Features: AVHnY4L5fXBRZRJQmLaD4S5rh4WMT75ujNXIGm44Nx2Pc3gQukpC6qqLTHco_DI
Message-ID: <CAH5fLgjV17zrsSQ7xD4dpeXjRJFLSR4Er-fsr3vhLg_5EF_ziQ@mail.gmail.com>
Subject: Re: [PATCH v4 19/20] rust: time: add arch_timer_get_rate wrapper
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	boris.brezillon@collabora.com, beata.michalska@arm.com, lyude@redhat.com, 
	acourbot@nvidia.com, work@onurozkan.dev, alvin.sun@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 25, 2026 at 1:39=E2=80=AFAM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> Provide a safe Rust wrapper for arch_timer_get_rate().
>
> The underlying C helper returns 0 when the ARM architectural timer
> is not available or not yet initialized. Map this to Option<u32> to
> make the absence of a valid rate explicit to Rust callers.
>
> This allows Rust drivers to query the system timer frequency and
> select appropriate time sources when programming hardware timeouts.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  rust/kernel/time.rs | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 6ea98dfcd027..03ce96450fc8 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -359,6 +359,35 @@ fn div(self, rhs: Self) -> Self::Output {
>      }
>  }
>
> +/// Returns the ARM architecture timer frequency in Hz, if available.
> +///
> +/// This function queries the system-wide ARM architecture timer frequen=
cy.
> +/// The architecture timer provides a consistent time source across all =
CPU cores.
> +///
> +/// Returns `None` if:
> +/// - The ARM architecture timer is not available (`CONFIG_ARM_ARCH_TIME=
R` not enabled)
> +/// - The timer rate is zero (not initialized)
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::time::arch_timer_get_rate;
> +///
> +/// if let Some(rate) =3D arch_timer_get_rate() {
> +///     // Use `rate`.
> +/// }
> +/// ```
> +pub fn arch_timer_get_rate() -> Option<u32> {
> +    // SAFETY: The C API is available in all configs; when CONFIG_ARM_AR=
CH_TIMER
> +    // is disabled, the header provides a stub returning 0.

The stub is inline, so to call it you must define a helper for this
function. This code will not compile if CONFIG_ARM_ARCH_TIMER is not
set.

Alice
