Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD1837880B
	for <rust-for-linux@vger.kernel.org>; Fri, 22 May 2026 17:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779469792; cv=pass; b=PLf2zMJ13kvaebDuf+477/dFjiM8zp8tLkYkY/j0xml4tF6hIOnoBqCSNWxsxp/UIEJZe4kwssOtkiEJ0BBWmrtavD8faFN3nD/Y09cH2+/Biiid5BiezFPL/9gML1i/VlFBnmpg9LLeSf604mAqo1TqPDlGTkRP9vqROvGpE3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779469792; c=relaxed/simple;
	bh=lUWXDKsQb3T5kk+9hAhhp+KWwVrLrbwiCOFgdtxOoAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbXrarwlWq+rbVfh8n9TKHZnfcgyEfEMA8gICXH5bx+cDT182yGXmudjAh2fG8OVhgleoHel/9u6kwgGC9ipe48LPzDKstv7ruMOD2Wtb5mWZKABW0YRKNx6Vuh9fOIX2R7/wo+045sG2IUKEMKGJPMI0aaoARhXAdYBA992qH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8uOT1RQ; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8uOT1RQ"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7bd5e373d07so82354577b3.2
        for <rust-for-linux@vger.kernel.org>; Fri, 22 May 2026 10:09:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779469791; cv=none;
        d=google.com; s=arc-20240605;
        b=UWlpZEajSC1sU5KlBLV0NpvKH63NfM0qOqmZDjlDyLWFeLsphrJeOD6pZGrQKFNL2w
         055rYnVWPnBWJVZh3jRI+F3M9B5GxTCy/L2RBxHB/ym8tFkYFLtiDKmb+CnTbDm9xmve
         Y4slzfN3rUGwxAia/GwkCrzvtv2GxNHQuJl59tTxN/22uSw60lki4QVdAEpboMFLz/2s
         ut7Lof4ZojRXk7TYS/z2YGNppsICaS8KyQnRk4XiEaFHDXDTHZ60DBEtRqDCWA0SZRkq
         aec984IRR/SVoP3KoCTRPWXfin0464o+qKfMhH6HxEf2lOZhJ6JQh4tSOrNcymAkYHQp
         pDpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rmcF+kNZ0wcHj+NCth6pFXS/0dXqGjMN+oAGXQ34wXI=;
        fh=p3vIlvwiOqIs4zKsE1VIU+F3rsfYecvyINFHbFh8oK0=;
        b=ELDUt6fJ2hxjN5GXklEErk2BFER4x6kIl1w7AHPOGrRNE/zztyLiZBVZb8PH87NAQr
         /X/vYCkIrnSlLSwec3jNWWQGlaeIv49j81NVGak3b6AiUcUsP22a0mdzQ4NfKJIFrg5i
         ADnbSzhj3cKXVJgcrEsiszdu9XZxOtIxFbeGth7WukRO4xYJgqhY2BYsmliubwGEfaR4
         yQEKMRByq+4RGMgk5l9wqOfy1UANhxbpCmMKG21nZd5zw5MxFiDUKqFgKWmkmN/Kf3DM
         8gef2DrnGWb9gnoPYBezuBB8jblbYkxTO4XqCGKH+UrYaIuFTtlhhdMCHdZmmdayzO4I
         sy5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779469791; x=1780074591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmcF+kNZ0wcHj+NCth6pFXS/0dXqGjMN+oAGXQ34wXI=;
        b=S8uOT1RQ7o+7Jk5mEyBIbU3Kt8graXkECPMZd56AVMZFgMlJB1O2WpT+ytOa5v73iq
         Tr8a4vbuReYHpunzHwKfxR7DwbdNirSs4KRD8P2y0dunZYgeMQ+GTO/0BX0t/8oJxfHj
         0B2Dg7J2ay+OH/V1dqI0fdWe0L/ZxG17S3SsIiM04D86sEEDDNIJv34RfWYcMHlYXAIz
         LqVXrgawGqyn3ybvSCmPO3CWXGREbGpOkvl0+WR5dWstN20uqPk175IhZ+9gYT89jfyh
         A2PRFPsphkqROblxI4mB4SgWcahI4tjrS1sWgKeu23bjlOrFc46br3Y8pjEjv2+HKviB
         ybJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779469791; x=1780074591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rmcF+kNZ0wcHj+NCth6pFXS/0dXqGjMN+oAGXQ34wXI=;
        b=PZgYSI8DZXgXnW8IGTf2fBjgW9DOXnAi8eEeS0U1RlOzVV5MdM+yTuhmrBiQTwLKY2
         g3iFjrtrDO0bhHWX+mf2tVt41YXZmfkb8PHtHjFfwq834i8LnR8LV71A+EoIXdSetA9P
         l6/7+XRa8/3JPdoZqSaR6UFAUeXwfEwSN47bbwiRhCNRGZv2f1QvoqvpyjJLtIyH+bPs
         0aQrz8xuGrwqi4yjMmpj9oEQkaVcp87lcd2puvNDVOanabPr1NuHF5Z/zE0fTbCoyMRS
         H33/pPj9AwQzZzEizlDzTuU3NSi/IVAiWhJmhzs+eVDkD1lCBvCfPhikTXTgNZx8r5Ax
         WLKA==
X-Forwarded-Encrypted: i=1; AFNElJ8TDHwvhl4Q/to0kDW+Vzc6KT0VTiwJXXRRy3NndU0f9O+EJubaLXTbXkLWKNND2lb84T9d5PGKhgnm2IYyHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIqYjWjdYU/yf9ByELF8tyC7CVQKDHu12ia64AJ0pzh+e32JV1
	WpD30CRgEAGlSP2F3AsNxzXPRJH2ImXwDHVrMmJxSlHTDzguyzQv3SZgD/yQPq/0+qmnXBAGUO2
	EK4lrK1Ssmyqfo0ACv4Lq8pGxqU5Ps3k=
X-Gm-Gg: Acq92OG2JdwNpHB8PyUH5lOCl/WSpWjYjnA/5coQhTKD8dMWh30XuL39Cy+z/ZPTiBu
	u54Z3CiTlZ7iGR/nqOmqZ1/353G/jvimu+xDBtLrs4PuKnoQQ17uGH8/xDGqU3wY5XzauMow9UD
	DSDEoPsLcWfvPbbkc6k3vWrGYmuaejr7pXMTDh8Ue95qyjFPKV9fX3H9A359ajuQ5YbnWDuPONT
	jwPESQjhtv6481poLX+PWlQypyFoCq0s61Jo2G4LrfyZ6qELNEeR4nePMNAc9orbZqdaoxB8pfC
	rJPgwal3HLgVoMI=
X-Received: by 2002:a05:690c:3386:b0:7d0:261a:6c0 with SMTP id
 00721157ae682-7d336cb2740mr53386527b3.26.1779469790750; Fri, 22 May 2026
 10:09:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <qBPUAToMpl5CvVd22lUrJOgsVSuqVYKsjEHpbs1UK-VTO-vN8UFOa35fFMsYOHoBuUp9HcP65ljAxmLQMcGS9w==@protonmail.internalid>
 <20260508173827.1123011-1-ekffu200098@gmail.com> <87a4u96m4c.fsf@t14s.mail-host-address-is-not-set>
 <DIE4WB0VE43Z.2ALSYOD50N5X7@garyguo.net> <87pl346466.fsf@t14s.mail-host-address-is-not-set>
 <DIE8AGXTZXBL.2RY8JCWNOD2HG@garyguo.net> <87mry85vh7.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87mry85vh7.fsf@t14s.mail-host-address-is-not-set>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Sat, 23 May 2026 02:09:39 +0900
X-Gm-Features: AVHnY4IwbcHtZWHDfeXoP1Lxh7UxydXCtZxKMJIa6zwUMSTyzzF4GOgPUfH0AhM
Message-ID: <CABFDxME98=KTERw17UYEs-5yKJvibXd-RZQ5rUOt7QgE4zk3vw@mail.gmail.com>
Subject: Re: [PATCH] rust: time: add debug assertions for out-of-range input
 in fsleep()
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, boqun@kernel.org, fujita.tomonori@gmail.com, 
	frederic@kernel.org, lyude@redhat.com, tglx@kernel.org, 
	anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2026 at 2:44=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Gary Guo" <gary@garyguo.net> writes:
>
> > On Sat May 9, 2026 at 3:36 PM BST, Andreas Hindborg wrote:
> >> "Gary Guo" <gary@garyguo.net> writes:
> >>
> >>> On Sat May 9, 2026 at 9:08 AM BST, Andreas Hindborg wrote:
> >>>> "Sang-Heon Jeon" <ekffu200098@gmail.com> writes:
> >>>>
> >>>>> fsleep() documents out-of-range input as a bug but does not check
> >>>>> it, unlike udelay(). Add `debug_assert!` calls to catch it in
> >>>>> debug builds.
> >>>>>
> >>>>> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> >>>>> ---
> >>>>> Hello,
> >>>>>
> >>>>> I found this small inconsistency while reading the code. The same
> >>>>> check was applied to udelay() [1] but does not seem to have been
> >>>>> extended to fsleep(). Please let me know if I have misunderstood
> >>>>> anything.
> >>>>>
> >>>>> [1] https://lore.kernel.org/all/20251103112958.2961517-2-fujita.tom=
onori@gmail.com
> >>>>>
> >>>>> Best Regards,
> >>>>> Sang-Heon Jeon
> >>>>
> >>>> Looks good to me. Could you add the warn_once and remove the todo as
> >>>> well? And add the warn_once to udelay as well, so both functions hav=
e
> >>>> same shape.
> >>>
> >>> If `warn_once` is added then the debug assert would be unnecessary.
> >>
> >> It is different mechanisms in different situations, right?
> >> `pr_warn_once` prints a warning once (and a stack trace depending on
> >> kernel configuration?). It would be enabled in production environments=
,
> >> and it allows the thread to continue executing after triggering.
> >
> > The existing comment and your message says `warn_once`, not `pr_warn_on=
ce`.
>
> I actually mixed these up, thanks for pointing that out. We do not have
> `warn_once!` yet.
>
> >
> >>
> >> `debug_assert` panics when debug assertions are enabled, otherwise is
> >> compiled out.
> >>
> >> I don't think one makes the other unnecessary.
> >
> > I don't think there should be two checks of the same thing. Even if we =
want
> > different behaviour depending on if debug assertions are enabled or not=
, it
> > should be a single macro that switches behaviour based on that config.
>
> Apparently this was discussed in start of April [1] (I somehow missed
> it), and as far as I can tell, consensus is that we do not use
> `WARN_ONCE`. Instead we use `debug_assert` with `pr_warn_once`. That
> sounds reasonable to me.

Above explanation is reasonable to me. So I'll add `pr_warn_once`  to
fsleep() and udelay() both.

> This can be a combined macro or open coded, either way is fine with me.

I don't have a strong preference about this either. Maybe we can
handle it in a separate patch.

> I think we should add the `debug_assert` as suggested by this patch, add
> the `pr_warn_once` in the not taken branch, and remove the TODO about
> `WARN_ONCE`. We can bike-shed a combined macro on the side.
>
> Sounds reasonable @Gary?

Any other opinions are welcome including Gary.

> Best regards,
> Andreas Hindborg
>
> [1] https://lore.kernel.org/r/20260226120848.82891-5-adarshdas950@gmail.c=
om
>
>

Best Regards,
Sang-Heon Jeon
