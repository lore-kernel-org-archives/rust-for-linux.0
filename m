Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE249345EC2
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 06:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787897733; cv=pass; b=qpbQCOLVpPgADK7heoWU9CA+IKrgMOKUWWfFhZ7yJ8dkB2S3TGR5cwRlBSqHhMi+zjz1jUpftFSbCMO00k6hMRBi0B2+NtzVOEsAxoKyOotiEHbtJxT3wP9L2GmY82uzF77QY/4gshysEltP56Hb9Mh33/IAhNiz1LMaCCjA2gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787897733; c=relaxed/simple;
	bh=NBZacTtQ58xQanJcHP5YImLJ1HDsw24G+l20TodKtZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2eiT4w4qCW9OQuc0CjYCV1XVQ4izUTy82KBw7tXB0wocedOMk09Q7ZxVs9xt3bUb+f6Dp0B5HPRzxUl+WrM5mmB4W/Iwytc/7wyE0QLl9+8wU2Q8/sGFcbjeO3DXMAtzjbaKQK5NLOPBZ26S3mgymg1znsbYuVG660hcWMJl+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6w6R75G; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6w6R75G"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d70066b704so612235ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 23:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787897731; cv=none;
        d=google.com; s=arc-20260327;
        b=Rm031+H+H3xL+qss0TIixzhyu2sT7wpw1Hhk4jvG1vKi2etckEcOYwzbUXkX235D9A
         +tHqjoqv1kxiU8zhjLAhbpKbEmW5S87gfmkNL2QoSQRxue48gZlHhXRBEtQVLpgoK1tF
         AL8HkwYOPUSgxC3r+64IIFXWLosJ6AWIZ72u9fWL57UGOVRUEj8ACXPBUAW4BGYRbg2w
         p/p7kJTe7bSPJ/Gp3v7sKBSnO//P2IYztYKTrXRLnNgXCEVHva9ke+I0boiB4qelXfBE
         DEFKLn6qWBEzneppvEoY0tIEkXg2iEo87G0FKAMorQ2of746sR/dIX6xXsnQDfsOCAF9
         7pmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8bSCuSKVP7ct/hSX/j5E/Yvqr5/ozCcz1SLrVvhOooI=;
        fh=kap4r/ScdoYsQ2AwMMzNws+rVts0d206zV8i7cLyTkY=;
        b=ZDAxfQINCeHh+VnO25T//qgF9XlCR4gyQ45lE9CVnBYpdi4BoJP1yEtBM+tfy1EUuO
         7+5e3PL1j57X8dFB2QDbSV0K7lvMfk5KSBcJmdB5vYKy7dlxwsCxkrS5zVAqhyGvaCgz
         t5VIDMYBfsd0SnYPEf9MVKlICWWdcbs0wYIfHqqkc0nsPq6baIS3g2Ur93bA2v61FZuB
         RVPOrZaKtvxmON/K43PvLgEf/lPwSQRWZoc5LGoTOYOqhNocP4nS40R5b+n7+Ljf1MEg
         206XJBFgL+y8ftJ2wAjeNKQt9+EyBVI1U1ZE3P/+m4zD5+AFphbCK7KE3yGZzrpWCTuW
         jCog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787897731; x=1788502531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8bSCuSKVP7ct/hSX/j5E/Yvqr5/ozCcz1SLrVvhOooI=;
        b=F6w6R75GHFcTT0O2xGWj+jHg4od4Y+q7exP7zbgi27PugNyK0eOd8RA/SuuIkqYD14
         8tzenDgzadAUyujO76iyaVubcAJOZwHYEl87r2SSpT+n0SdzcXa3vuVR1G+3yHD4hVT7
         G/We1125q9dt4AiHMM7SI5jJ2SbVwUDbMuTcdjaZq0URLRdye9ttKtAVYm3i7Igipvy+
         2njMmsbcqkLnAot4S0bXcxvfrRyIvTHGgoF+v0e/sPW6ObMkNwN1WFHJiQoshztBN45A
         6p5RTedYXL8jGruT11+9Mx4hXW8pwpDkVby9pi3hi086gO7nFxjKQiHkf7fa8ZKWO1rd
         ylVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787897731; x=1788502531;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8bSCuSKVP7ct/hSX/j5E/Yvqr5/ozCcz1SLrVvhOooI=;
        b=MC+XjUfUwjhlYdAFS9LC4rOWkHgqR+leHJaxb26EE6DlsLBj6k7Ew+AuQs/ay+4gzq
         H4iDRCV8SaaDlnki9BXmUtobddaKtlzlLRk98iCxJxMSmEkmiobpHUTd4nC3WJCSqQuO
         ffJ+XO7IirlEeN09ZkvHXsBRedTKeZqaJQ0hU2sRDM6NEFGuieE0HXFecR3a1/Vtgrr2
         6yZUk2zXQRR8cd5jGay0UO+PCyTeQ7kfMOkbwkxYahy+lokE1IqxeDNwvxdCfy4kmSKF
         lXfg2Y9V0ljCa4opJyUxwRtyNTPzeZfyPRM4ldsjeL4bM8gSF5yG7FCaX3VIvc9VLRD2
         5pkA==
X-Forwarded-Encrypted: i=1; AHgh+RofPw0J0IGYoo9geJkTiTmJ1rFWEGFS5CLXkycH3NPcEHg6c1Zwdg9EVbowktbB59kLcQXKozZS7RuLlJA6pw==@vger.kernel.org
X-Gm-Message-State: AFuF++kYlqc2UAbBoCf3OFeGpX5bo/aofkZbMAado7NW4u0E7YzkbHoa
	SYJyq1dDa0ZhY4OQCWzXcBdMJvzS65OGlCjVVqfxkzMVm7gWQMEzlMVhMB+edrRC824pH7Slpco
	4U6XSrSLYLMzdLDyv3ytIvNicmrTZG+4=
X-Gm-Gg: AR+sD12QkwO8oWdZSeBKjUZKww8+HYTNAOz76u7kxYikwjGwTsEj/F0QrGxAkk0uydr
	1fkmINoLvnmFSezwFs8fqaUgEVy/agQ+vGwfwrqgZPJ2/r+w9VJtU8BBEBpcn20SryWboExKm7p
	PHwMSHwX8Igwft615H9FlIxaAmrzTetVnLfwqyEN5Y7ZVdGBeMMmuRAvHV2gZEEP3Q+R9QmgDNH
	jUv4Awlt8zwPXYy7gVlkI9EgJLkEATHv0HcDOqUkFONJElLTuUFTOtc1zEOD+nOasFflU15uDRt
	J1vBqJeVYn7hw1I6f/zwTRWwwB0CDyjf5ZxrMg5GQZmfSBGNI+7qRPkLeTPJFLfoCofHWub/wig
	JMLEo7D/Bq2H7Spvdw9VH7SGcKbXytvj9BI35bmwPf/lYpABsLIovQAMhQWyv
X-Received: by 2002:a17:903:1106:b0:2d6:f09a:da1f with SMTP id
 d9443c01a7336-2d74e0bab6emr40520405ad.4.1787897731122; Thu, 27 Aug 2026
 23:15:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828024335.946-1-nils.lehnen@proton.me>
In-Reply-To: <20260828024335.946-1-nils.lehnen@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 08:15:16 +0200
X-Gm-Features: AcwNN1X9Qb8a-HibMc9LvFugng1gZNWxbI0emyln9fJfRyuIE5Vx-Vzi6R0arPM
Message-ID: <CANiq72mn2vvCL2VP8yJxmzXM4n+jfV4R7arUcj4UXSi04y5sfQ@mail.gmail.com>
Subject: Re: [PATCH] rust: security: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Nils Lehnen <nils.lehnen@proton.me>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur Ozkan <work@onurozkan.dev>, 
	Atharv Dubey <atharvd440@gmail.com>, Ke Sun <sunke@kylinos.cn>, 
	linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 4:44=E2=80=AFAM Nils Lehnen <nils.lehnen@proton.me>=
 wrote:
>
> Two equivalent one-off patches were posted earlier [3][4]; Miguel asked
> in [5] for a resend that keeps Benno's authorship, which this is.
> Cc'ing the LSM list per Paul's request on the original thread.

Looks good, thanks!

Nit: nowadays we typically use a:

  Link: https://patch.msgid.link/...

to refer to a patch that was picked from the mailing list (usually
written on top of your Signed-off-by) -- `b4` can do it for you
automatically.

But no need to resend just for that, of course (and Paul/I/we can/may
change it when it gets applied :)

Cheers,
Miguel
