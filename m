Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F2C17993
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 20:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771359535; cv=pass; b=eiKw7Ld4YNE/x1Amba6lQYP5Df3sYuBZTbEYvfmi0Sxk5WH5co1u+GOhu8VJBJFYZeKYqF83okUmCtDrHc4RKOtcQa5IottGPehKJ2qujMKD5yFnsQCleSYkgMPWkt/kGh4Fy7nasJjaCoaqcO6rvu36ZqCwcGLD5mcBKrUFMNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771359535; c=relaxed/simple;
	bh=vK9s4etaIZI06AAYTaChD+/CCire3dXzgUTAeE6s7Q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFdT/QZQyAXcoUMm9PtOzghynkTcXxv0KPv6TBaWA90+S1D5gXlYWtDBhjg1jybfZuhv8RohpCJf9vZR6aeUx2wbBrkn8xy6Y0NqkSGW54GuF0KUpj8Dy1wbFm3+gV27Ew8tnB1j/PhPWoxDnzbrEaJyRRvMyBnb1y4JEpHcIiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F14gv8Pn; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F14gv8Pn"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bab709f867so210099eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 12:18:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771359533; cv=none;
        d=google.com; s=arc-20240605;
        b=a1tKy9E60jrGDRXXlxchUz0ckJFFlPIwNaxyubINAnkuCKfr6iPuKKG4Co8YiK1JaB
         09teP4lK4jonawOJ/ocNVz1MJ2lSEtmInikDO5eIyuPePx+jFKmYFwRdLOW5m9NBZ3Zy
         hfAaIkKZlQfI39YjiQRO+oGtxu4WEi/F96wV7h9UB8RR4da0ZS+guVuzNuPlh2Wqg09C
         7ccGk/g1JmGBXj9LPNupkh6Jo8U+8vB1pbN5l60KTARfxhwoDowaXqDExgz5VUhiZDib
         F7aM1ZbdINmNgo474xiPqTVXPIMugWCKM/pk0JnL/aQVhRszW4NtxPVsiLfSR/h337fE
         FpTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vK9s4etaIZI06AAYTaChD+/CCire3dXzgUTAeE6s7Q8=;
        fh=90RSxJM+4acKSzoynZsXumoq5m/5VS4FrdmqF+fItFc=;
        b=LIFoDQ5wGbcFCeQXQPSW11rK4wHMw2qxS97mHzAaTg4NGM3pgSAE1NvzHPCQ7T2gkw
         FVipLvf4s8nrlxgJZuLzysWZhPMpJ1ZSiBS4xVCiVu6eTk1+g1TlY/tqZjG8HbOY+Lil
         YGjlk/hlzl9wr5UM3KxAHs1L0Po8qY+z9QZw4ozukGGzI/+PZOILWLb2MwXU/GGU0xac
         vp+fVzZjK70IHSkc0b+5oLqlugtp9ADcZCMW3Zq82lOogk1r9qvx8BNlaO6KvQRfDWu1
         uXFUfy7vH+9cyBgOzMeBH6GA1BM2SG2ItcRSZVyv3lcVjPqCMHLZPvMJhRtqOtF7heC7
         ivqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771359533; x=1771964333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vK9s4etaIZI06AAYTaChD+/CCire3dXzgUTAeE6s7Q8=;
        b=F14gv8PnJCQL1YBm40VpsnIk1gFpRGrG7elgRZ+z0ltNw0eyNZNWGx/d0dKzUniS/f
         A4mII5rCgs0rNSPkjr4sFXZL8vQHAII9eiy7bl2oT8G6+MALQa6q6RWT54f/2t7Q/Sef
         FO60WsbPjLh4eDqHYO3b+1oK058K0mM1gvEhf6DhT18IrcocKONgjSvsWFLmDqdDsB1h
         YdT4TSneXH5G9tDN+qaqD6z/o20onxLjn0diuzaESJYnCP1Bfx21gPRkVQGpqBsRPXXF
         e0wtLx3Y7cWrcU6DR1ZMEHeNBjGxPwhdCX2pvw9NIiF0nTDQfDAHLftb/aEwAQX7b2uD
         By7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771359533; x=1771964333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vK9s4etaIZI06AAYTaChD+/CCire3dXzgUTAeE6s7Q8=;
        b=JZo/QgwpMR07r9k2ch3TN4POcPwe5WmwgH9yyi0aQNVN/5XhyaTFwlwdUDQ2sHtsDl
         ONiGnlz16EvyqudA7TqYJ1JzdRVwNizPNIOhQ1PBdn0cA/7Hz+tHpFubdnewbfGvm8I+
         h2YK5a3OL3zQemav9MO7Xoz2XtTl7286FbIRre8EjpP0kzbZeWq4IpGaOIBjf/MwPZ2V
         ij0/H1D8/JmvRNlflgq5ahpQHX4yb8UEpCc3WVSNmWXNoCM8k0dpVHP1c+Ef4iQ2Q+3W
         KsDTAVGpEdMlvKEodEUzIeNQRlFpFWrgqlZmHxeagIr26FxRNSOm5Z1zghLUVVt+rn37
         iVRw==
X-Forwarded-Encrypted: i=1; AJvYcCWIcvWP4/qENLNVVjFmv8GSvT6kfKJoBwBbDr5yl/QUUFxiP4qr3mFBXJ8X/P+1yT+lCu5e59nmmpcRpg7Yig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvAPrHjBglFRfGsr5xxKEYqQcFU9yCOHNvqIuNQoPIYITRJ6BT
	2YOxFIfmywAjUWU9rG2lRbDleLXk+H+61AQLDbVi3YJrXY5hgl5zsby+vWLPvXAee+O7Ax9J5WD
	FariBP7LXu5Z8Z6tCKWxnZRvuzCe11hI=
X-Gm-Gg: AZuq6aIOYbXpdATeN5m0r4xfi/mVJ6tqVuziS/h4byAOHTElZx+FVNKs8XK77QYq7xF
	Lfkv37b9/YyXgY233xBEpBEwXnFA9HrgBweMGM7w+utn8TDEiKI+y2X1Tw7d6AiTxbhIjUAeMwL
	W+j5pAiP53Zgr9/M86jCwg+IyEA1PC8cMqS5dE1E/hs3/StR7KgiTK3yep2dwR/V0YeGs4YIuz4
	paTCIFVOy3sJJnDRy/CBHpdOM6CVf4wr9sCu2PnUacCX3dmHQnJoQvI1tnJ9OHbXRN6jWT55dKL
	+j9Jgrfnu/UqQGJA5qv5zLTZ4pVbsRYrKixVCcOmJgchyGk11QD60EzgHekzj+fq/8C0Egi5FbE
	O8tvIhydRT4Cbhko1JSdllYdvsbvABzrdZIk=
X-Received: by 2002:a05:7300:cc10:b0:2ba:7783:d1d1 with SMTP id
 5a478bee46e88-2bab9fec7aemr3553191eec.2.1771359533224; Tue, 17 Feb 2026
 12:18:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZRncP-sKLLS2K1U@macos> <ix0mR76G9a_ieuQUUkkfHMJIviAsrFaO859172fuFx9Goj7QdIfz1jtnv3ptubGEC7uEFCvVfEoWxcisUnTi1g==@protonmail.internalid>
 <aZR-ItMBkiqyBdKd@casper.infradead.org> <87bjhncl7j.fsf@kernel.org>
In-Reply-To: <87bjhncl7j.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Feb 2026 21:18:41 +0100
X-Gm-Features: AaiRm520MoJ6hmcU5chh_nVw-0fKbng0IAp03Scu3RON2NXDzLsrCJHJ9boYNKA
Message-ID: <CANiq72naQfG=nSiPJdCXgqM1M_7ynDE5Stt-jiBGPqS9pipQtw@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Evaluating Rust for XArray
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Daniel Gomez <da.gomez@kernel.org>, linux-mm@kvack.org, 
	lsf-pc@lists.linux-foundation.org, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Daniel Gomez <da.gomez@samsung.com>, gost.dev@samsung.com, 
	Greg KH <gregkh@linuxfoundation.org>, Julia Lawall <julia.lawall@inria.fr>, 
	Kairui Song <kasong@tencent.com>, Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 6:51=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> We don't have to wait 5-10 years for gcc to fully support Rust, before
> we start playing with this.

By the way, I don't think we will need that many years to use GCC if
companies are interested on it and support projects like GCC Rust
and/or `rustc_codegen_gcc`, given their current state (for context,
the latter is able to boot a kernel with Rust enabled for x86_64, and
the former is prioritizing Rust for Linux).

Let me use this opportunity to say: if anyone wants to support that
work, e.g. hardware companies for their architecture, then please ping
me and I am happy to help getting in touch with them and figuring
funding and things like that.

Cheers,
Miguel
