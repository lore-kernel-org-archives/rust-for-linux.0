Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C235D32ABCA
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624683; cv=none; b=rRhqNeIwImNGJ3uArQnN/QaLtWhtcItle6ozbMTOEvv0c3ZdqvoS0Y/JExg6ISYBs5jh5gtiwjRe2FFO2IqZ1FkYc/FSgVrE0GxGJHVTmHR3yV56qNIWGOoluAOsp4hiPXNAQwCkzFametHG2/z0Zp9cRgJJa6bZtSr5vCEP16c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624683; c=relaxed/simple;
	bh=N+FUxj1Gl+zVCUHvFBWeIGI6C2A3mF/PTd7CkfeomPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFPOkjwx5JV7E4d6CnyTEBNFLVWzU0ZjupJuP325EJ9umQBrghxBPhaPuQmmIucTXF8gfCPbwXxH6ljjo0D6kpz+BYAPUj5SMzh/VIvLxElgfb37bWQ2d91m9HNrhvowhzjufTYGvELuMI7kuWLLH0I2Y10BpZXSSIXweNmTYGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J7DZ82QZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J7DZ82QZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774624678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+FUxj1Gl+zVCUHvFBWeIGI6C2A3mF/PTd7CkfeomPo=;
	b=J7DZ82QZHXy6rPpKE7z2gacwQ9LBZbmNcXkJODpMmH/EgscFG9u58cYiOJpvpzKy/3lc1n
	KXVNKi3ktgRYlHQ+4TyPyaXBH69BWsTPv4c9qCXubjIEHP5iPkP0pPXXbMXB/GQAKcREgJ
	Fc17CCR1OBWGP5aULzRKXGHIEBGtdtI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-EtrijgyIMveWHJrlql2xpg-1; Fri, 27 Mar 2026 11:17:57 -0400
X-MC-Unique: EtrijgyIMveWHJrlql2xpg-1
X-Mimecast-MFC-AGG-ID: EtrijgyIMveWHJrlql2xpg_1774624676
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b9800aa2787so196857066b.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 08:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624676; x=1775229476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+FUxj1Gl+zVCUHvFBWeIGI6C2A3mF/PTd7CkfeomPo=;
        b=naN0Ac2BeCc+0SqbmSZ1qQ1kkJ5650Hp/+02xIZcSEgGvjG8Pt6QYNHfoqZ/ODsKgi
         euTFXA75MU3LqYbLpJUSGVoKmXXVaasB71W42ajCLdJDIm9WL2V116toyL1osnaEhtI/
         9AXNs1g2P4Gi2Tqb7nNwz1pokSMRf4AtJDEVnxzUTWY7wqK6XTBDoqvNS+8P1pjvr6A4
         Ffj71I+TVSIX3A7qsxKUYnzx41+cbFMDeChXNz2zinpB8u84IPXMPjy+NaAIwWRQmJgU
         4gpNshveCsU+A5XmHunB7xP8KhoPZ518/NYqEz4SAn/whHEsD2FnYNlWqrYzQfn1nsfs
         HO4w==
X-Forwarded-Encrypted: i=1; AJvYcCVyRptz07U5LWm74XDY7669ICxhKTVtYG6kjjXWTsp8mbuoaubl8ASCcqpVnCuKZDuNcDYBMzabdonu1BboJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn4MIOexVyOjho6EOIP8a05yqlQ6bNLM+TRjof7u8BW0TBuNAp
	JfFQHn9rs6SEDx4JFV2pb1ndck5ptelRCk9+aVSBSOoyihBSVkusJ4n4nS8GwT7DNIVgo6Uoyfl
	9wBw3ZRy/KqIWobyqZiCUcGySfzyzQUopcaX2ryJu+0EgYQXwmSo4a2iNaPma8w54MemxMj1QmD
	XoyvJn+HaOhtLxOjO5tYuSSo/OL5UPyjQJJnQQFnS+mdM=
X-Gm-Gg: ATEYQzzKrNzI+6t6Mus0daURShaTLoMgZuW8s8aWFKNU9GM6kMK4Sl/o2W1hx+AO21n
	cwQrIsopPw+U+77dN3Kqvnx1DSjTudRtrzC3wd7oVPyqhkEqABhkUrG5UpTJ5hkogtJjxhy3RxF
	eSn0IhRm1DInsD0HVeYFqkorbDq/21S+ewpZNTUev4DSWP8sup3+Bb76zn2raUdS6/SqEiniuks
	9ljWw==
X-Received: by 2002:a17:906:c112:b0:b98:36cd:7e14 with SMTP id a640c23a62f3a-b9b5095329cmr217770366b.42.1774624675976;
        Fri, 27 Mar 2026 08:17:55 -0700 (PDT)
X-Received: by 2002:a17:906:c112:b0:b98:36cd:7e14 with SMTP id
 a640c23a62f3a-b9b5095329cmr217766666b.42.1774624675436; Fri, 27 Mar 2026
 08:17:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
 <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
 <CABx5tqL+G9i1ZW7i5AHaTqUFTVRDmBvP=RycUdwjG-GOp4uzBA@mail.gmail.com> <CANiq72=M3H-06L7udG_LqTwLykZkAjfy2d5NXQZn5TYRJ+N37w@mail.gmail.com>
In-Reply-To: <CANiq72=M3H-06L7udG_LqTwLykZkAjfy2d5NXQZn5TYRJ+N37w@mail.gmail.com>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 11:17:41 -0400
X-Gm-Features: AQROBzDgpgoaKrafOSYhxekTKjnPTVIaXvtE8lmpvFqxHDMdDYL6dEArDWvsT-E
Message-ID: <CABx5tq+TdGvL+SCUe87qWFgeAq-1Zf5w63jn2hLe9+YTyz4sNw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Boqun Feng <boqun@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: obUZ8U0PMEvkoDNo2zKPLbqO5S6IhjYRz_L4jPwPYT4_1774624676
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 11:00=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Fri, Mar 27, 2026 at 2:19=E2=80=AFPM Brian Masney <bmasney@redhat.com>=
 wrote:
> >
> > Stephen came on the list and started to merge this things this week. I
> > was going to collect up more patches for him if he wasn't around, and
> > intended to include this. However, since he's starting to collect
> > things, I'm not going to send him a clk pull today.
> >
> > It's up to you if you want to send this in via drm-rust or wait for Ste=
phen.
>
> I guess it depends if he plans to pick it up this cycle or not.
>
> If he doesn't, then it may be best to just go forward with your
> Acked-bys -- Danilo can pick it up if DRM needs it in their branch,
> otherwise I can pick it up.

I am not a clk maintainer, so I can't leave an Acked-by for you to
pick this up unfortunately. I've been quite active in the clk
subsystem though the last 6 months or so.

Brian

