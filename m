Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D48E3859F7
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 17:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770657275; cv=pass; b=AjwnZyzVF0ayLo63JzvC2Y5XmbdFngmbxGTgXQufV/rDPm4Zbv5jHKVQNH108UyPXwfNNkftuf4q/e7UdwOFAtnikf3sY5D9gpr2k52VZU+jlmeMbOcTiENmLVMZAIbu8rSLVRMTO1FsR8nNGmY8xNx6BlovbO48VNvgkSHwGBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770657275; c=relaxed/simple;
	bh=uPyc1ujd1Gig9AGqCrj8DU6orTLrf/KB6d4/+GvOvvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AeqJEr9A8DfLl9ii0yanLL47earw03M51Icv1BrrQnjpqWh/+tJjHcifFmHmLEgov/4Zq/hRZ4vs8kqIbeesN9oGeI+DnOYDJjfaU3UDSnClhmTjlvP+0RsuEPiJMldG2eZGjjb+QGmrA8Aits3tclxsKwfXULVGS/5rTo+UDKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UNF2CQ61; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UNF2CQ61"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59ddb31ddcaso5287814e87.2
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 09:14:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770657274; cv=none;
        d=google.com; s=arc-20240605;
        b=Z318Q/8Q4XEtCFpYNdyDs/SPRYvbe9i+Sf/S5PSY2+veZvYHRK46JdjadqU60YdejM
         hwvEy6/trM4NjnCWOR1TlxCF6+6rIVwGH//GiLo1zWZeRu5+A2rOO1glNPZ51+pR1mx8
         yYbfau8unpaqi9ab7A0AzupNrRaLVmNOZ1APJXGF0HwjvZrONQqBhfUQQIM+i+udv6da
         oVzJqzYyQYBri5iN0GghxYU75UvfqRqyNPc3nVG5SKt7g4bxsip4yaZFCSzEdhMiKION
         gSaaSeNzmXQ3MEDmiTfNVQJ0byTz8/GHHYH8t2Hyxn04LHvBXcupCPtIfD5RAcjmk2YF
         mZ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uPyc1ujd1Gig9AGqCrj8DU6orTLrf/KB6d4/+GvOvvc=;
        fh=PxR7MnKQ7scPLyUhqsFvHeGnWqexcZEWRbElK+wm4jA=;
        b=CWXcH88Z7bP6PYHcSWubI6vWvjFRXeppH1youjINohf92LRE/O7AJ/FA8vn6o6K+lq
         bxZfCL/X/+lNYzxJseAkkbpYuT2RwvvrHvQZZHYaaGMhjoHLZDHauxTWHC0Oz0IBkTbf
         aDyQ/w2DigSYjHBdmsPvojtoJduh2FfX0nrfEXUCM+b52n1jdH54fAJOIjwkrAiLX4di
         3+Er6wOrFF2xiYFVpbT6SVEh+R1VNhdMGk30z8HEK4wSZEwzze1gVJ87SzYN499jmbJk
         lbMUEBFAkLDUD98yvfbqMHmsj3x1vlDbVajQZvbKKfcX3KyXzapqmmVHSRtPrZdlVWZN
         xgDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770657274; x=1771262074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPyc1ujd1Gig9AGqCrj8DU6orTLrf/KB6d4/+GvOvvc=;
        b=UNF2CQ61PJD3HwoGOq9TFlrtE9xtiYVCPBrDdFUD85NRAmzhJ2KL+VAhZyYRFBj0Bq
         gD4my8QcnAGqKW+dWHrOgU88XuAIF4uKsQZaM53c6sLZ3SgqHrZq0z30/7iR3imSIdlQ
         UtBiZo2yi+j7FFZylDTnKm52zeqA3Wp9WSabJ6udF2vWxox2XTy8mVotoZGiGFUYZqNp
         E9C8/Qll8gf3lXOqvEdkYgvo1qBeqnDqy+4/W7ssIIM467Qzor4lobZmktZBcqk7LZHF
         pTSUAhJVUxuJQhYUzCwT2VGLhy53O5YwvCE/GPYcCqQRdtq5D1NfMJ0ah1RrM46PERSC
         hpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770657274; x=1771262074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uPyc1ujd1Gig9AGqCrj8DU6orTLrf/KB6d4/+GvOvvc=;
        b=qYq7u3j1H5/IQBHCPx8LeLt/EeCaDOvuUHMo4/CZjxAdYa0XhCA6u+wHn/eO0MxeU2
         U4EAMRZXl5q/LQVe5Cg1ZDcKvxtfFg4ZkPksLfY0B6khC+eu2kQNoVz0nMnBMd40qAmH
         lSJN7+Mb/sAgK5y8kWA3VZk17R+pRSusk9FANIe5qfStrG2Jce/4NCLyxrtq8q+JCfky
         sgT1ZBq52yNzSNIuM/j9mUE5jRgQ1wnqjuGOkYYw81p7WYMbOebI8AkhOgv6L5NPeFcD
         M9gstR2LwWdcG/Ez+MAW4KUJx9EC0FRe5xTVOm605j1velLik0ZloWzXDxPea9kRc0W4
         I6yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGxJnWwA64L7RY1c8/g0PJAjyDlOkfoQp3VTOYDpKwuaJELWpj63k65cF/nx1Cb6uUyHaU7ZNvPPUH3v7rkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN19GHYwK2wUJyUYGuO22ac5Pjbs7XGNMUlm3IrAp1dPasZMd9
	p6S+gUF7KcwOEVGpD+BDhvhSe9voCrXd17ObAZp/5kpc6iOoun7ehdTaDbXUP+3X16PstGFR3Uw
	FPm2l4jA8cbCelcoogu5kuWGjQwfWIecWA4Dh0WXhrg==
X-Gm-Gg: AZuq6aIYI0U9GeMfx0RZYibf6Y90+aQ6xJe1YETNbXA8uHEom3HHw9EkhgSEz4rysR9
	NQ9c21tMHmOS85HDHgetPDS3D9cbP1779E0bEKAeC01m2RlW8SRh82ahceT9ikMtQhxCyt+TNbP
	tO7jtIsWz6gJCC2KUQT0eMGwjsPR8d85STZlbmnUV3XiJYio7tJAVv4Z5ZPRZy81Jo4wJKCWkMV
	vQJThWnqMAnGsGNtcNeSCJime/6kZ5QM2qsmPe66L4JUNSADedDOG0rrmqLLGusMzKXiWrabklD
	OQi3lULBmK4aMdWGo6x7GDWzFm7s
X-Received: by 2002:a05:6512:150d:10b0:59e:49ce:a685 with SMTP id
 2adb3069b0e04-59e49cea689mr1714754e87.20.1770657273540; Mon, 09 Feb 2026
 09:14:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203152818.317806-1-marco.crivellari@suse.com>
 <20260203152818.317806-2-marco.crivellari@suse.com> <DG5G52FJ0I1F.1OHNFAXKXOZ1R@garyguo.net>
 <CAAofZF5pqsGvnCS5HbmQKT8b_ydEnycv2fWF=wbFkSgu+ds2gA@mail.gmail.com> <DG6BZ4R8RY9J.3VVG4I2AN6YQJ@garyguo.net>
In-Reply-To: <DG6BZ4R8RY9J.3VVG4I2AN6YQJ@garyguo.net>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 9 Feb 2026 18:14:22 +0100
X-Gm-Features: AZwV_QgirwSoIfXRkXS8OaWor_vEQYpVhRSH7Jft1n_EsZFlr4TS5p2INDTf9lw
Message-ID: <CAAofZF6CrTkkffCZ1q_cjPZzUDBeHoJJOEwhMOd90KXu4VZSEQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: add system_dfl() around the new system_dfl_wq
To: Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 5:50=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
> [...]
> Yeah, I appreciate the system -> system_percpu renaming which does make i=
t clear
> that this is percpu. However I think `system_unbound_wq` to `system_dfl_w=
q` is
> somewhat less clear?
>
> What is a problem to leave this still being `system_unbound`? User would =
need to
> make a choice, and unless they know they want `percpu` it feels like natu=
ral
> that they're going to use the unbounded option.
>

Hi Gary,

Yes, it feels natural, as you said. But there are cases where
system_wq has been used,
maybe because the name felt like a "default system workqueue", or for
other reasons.

There are currently some places where we have already converted from
system_wq to
system_dfl_wq, because they don't need to be per-cpu. So I think that
suggesting the
use of an unbound workqueue as default it could work better. :-)
Then whoever really needs to be per-cpu, would use the system_percpu_wq.

BTW, few examples about the mentioned conversions:

"ASoC: SDCA: Replace use of system_wq with system_dfl_wq"
https://lore.kernel.org/all/20251230143429.179643-1-marco.crivellari@suse.c=
om/

"Input: gpio_keys - replace use of system_wq with system_dfl_wq"
https://lore.kernel.org/all/20251106141955.218911-2-marco.crivellari@suse.c=
om/

"regulator: irq_helper: replace use of system_wq with system_dfl_wq"
https://lore.kernel.org/all/20250929155053.400342-2-marco.crivellari@suse.c=
om/

"regulator: qcomm-labibb: replace use of system_wq with system_dfl_wq"
https://lore.kernel.org/all/20251106145003.245866-1-marco.crivellari@suse.c=
om/

We're going to have more changes like the above.

Also noticed that system_unbound_wq has been already renamed to system_dfl_=
wq
in about ~120 places in the code. :-)

Thanks!


--

Marco Crivellari

L3 Support Engineer
