Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7636C3FBEBA
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 17:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633154; cv=none; b=udM+ay7MIczccUQQLjgOFDjdtuLmNhuixdGc8BCu9Q0J5S9uK6zzjIBF75VJNQ6/S8/1cwtFbRvZJ0yyh1aoTFlrX2ti8WIIo6QhVqpWhWU/33uGhLGMPEfwsLt2vUCOebpTTLAoqqDrt4jngfCvzn4BlkY8K/Q1n8wdhVYkPtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633154; c=relaxed/simple;
	bh=bT/y4JBqDvjHUf3ohN/Qg+bpv5VC56Jq9Guzemu4yO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUCbGALyDnr5GxmhVKbCd7hEsqxKtuCZp8s++i4TOu8lAiou2O7X0LCDqfNNhDl7Qtr6d/VGn3/9u0z0y+iCsAPZjDF6OGs38d8UF4SOTyFrTPFtEvrHKLynbIbzJIKZN+pMqCHrS5W62fvNU5bsVS6+j8L5jb8xZOTJLK1Gcc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M5m0dKaH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M5m0dKaH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774633151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhPdolAuW7P0xgBhYuWJf3nGp5Pv13lQ9qoFlr8i+xY=;
	b=M5m0dKaHVxMa63WuHqRyePsc6Gfb6X2PtzU2WAC9zv1OO43H3HI9T/tPrd73nA00lDlfou
	iHP47tvXiMZ2iP8WlLUXyhgWxHV6acyKl1pcajWAyYR7+AdyUWbvw2P8b87efXV5SaI1vG
	nkEtmMK1bKZvty+K5Vq7BEyqMelJnrQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374--Jbb4agMMQ-196fJPjvRDg-1; Fri, 27 Mar 2026 13:39:08 -0400
X-MC-Unique: -Jbb4agMMQ-196fJPjvRDg-1
X-Mimecast-MFC-AGG-ID: -Jbb4agMMQ-196fJPjvRDg_1774633147
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b97f04b44b9so133822266b.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 10:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633147; x=1775237947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GhPdolAuW7P0xgBhYuWJf3nGp5Pv13lQ9qoFlr8i+xY=;
        b=WANVUUQ0f9oc2FU3gJEZnvq88dxFs/JxDpExUZsF+Vyx+1QiuYL3jltJggEO+JlxAP
         jp/D8EIEgAsInsYflpDRv0NIPiB7AakMAvAqJxBLTGmV+mf0ztG82J0BiKQS1Z3Gc/B/
         UbHnx8uRQs2QmJ5BMUqUyll1G78ajlYuc5vPQRNBrcT+BajpFzf5NVXDEu+N1Kp/tfsO
         RPig2I43iJ7SIWYUn+UFfpOWuWbUCZE+Csx97r9goOt+kyhU+c/Jlg/3rJ94rgOQAdqM
         D1jf2aQUN/+22Z6HcDcJAHlvWFAEAiftoh7DcmCuUYGA7XiSrR12qf8eJF3kKEC+WUQ3
         qHmg==
X-Forwarded-Encrypted: i=1; AJvYcCWT8OJG+Sph18aEnFzPCMH4kfOV4EddFw5QCFh3PdtAl8StKMKIft6dswaCjXgjHmLFR02ZOt68rAnPiN/8gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrHxvdQwi7YeSExehknaNy6ccc7ieP0hWicvU8Etx0qkynL36B
	7M75p8rT51wLNAblNU9mSWbShfdziDNrJLPh/6xDlZeHdpNOkUKfS11rqDZuH4j8Ljf85QF0TEC
	isla28UFG64C5MIBdeCeW8sgdRk+uIlt0x1L5bkJXR5gaSVqFMZZHJc/vs64Lk0xQCryL7GlJhQ
	X4H9VxH4EzaSQ4WO8u2xKTea5Mb4mufKoU1HI5Q/uH6j8=
X-Gm-Gg: ATEYQzyPG25umpuQIBdz/uPqyqKPuBE5aaqDJL6Aps4QZw+TGfS7OgBobv25AKFAl75
	oJo5luaf6FvsTD2UAB7hF8wwuMYERwfaAlx3Wi2EQzoOdCUZK+0CP28rYINliysZ6r5hmoMY/9z
	bFOcea8xccLzFw5Ez9E1GogTQdgBaZEbYSLKUa7TxOIt/DYEbe9aTBv2eX2FIgEI4lEewe85tGR
	U41bg==
X-Received: by 2002:a17:907:a28d:b0:b98:22e7:72b with SMTP id a640c23a62f3a-b9b507a7bf9mr218777366b.30.1774633146667;
        Fri, 27 Mar 2026 10:39:06 -0700 (PDT)
X-Received: by 2002:a17:907:a28d:b0:b98:22e7:72b with SMTP id
 a640c23a62f3a-b9b507a7bf9mr218776066b.30.1774633146199; Fri, 27 Mar 2026
 10:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
 <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
 <CABx5tqL+G9i1ZW7i5AHaTqUFTVRDmBvP=RycUdwjG-GOp4uzBA@mail.gmail.com>
 <CANiq72=M3H-06L7udG_LqTwLykZkAjfy2d5NXQZn5TYRJ+N37w@mail.gmail.com>
 <CABx5tq+TdGvL+SCUe87qWFgeAq-1Zf5w63jn2hLe9+YTyz4sNw@mail.gmail.com> <CANiq72ktmUFsdpBUKnU-OvTj7rE5iZKFucubL_1bF1Ws_KYXcg@mail.gmail.com>
In-Reply-To: <CANiq72ktmUFsdpBUKnU-OvTj7rE5iZKFucubL_1bF1Ws_KYXcg@mail.gmail.com>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 13:38:54 -0400
X-Gm-Features: AQROBzB7WfnAtTWMTsWRSmdXifxpUbNDAg86GKrLb9ikVgnMGrHcwDI5L3K7rv8
Message-ID: <CABx5tqKKHvFPYrL=gjaOn+frDXfXpxM3-6oTzSo6QVgYMaEMPg@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: 95ffVu1LbzDHZO8u7Rl-oSem6VAyah72LzsPDIZdRnw_1774633147
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 1:28=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
=3D> On Fri, Mar 27, 2026 at 4:17=E2=80=AFPM Brian Masney <bmasney@redhat.c=
om> wrote:
> >
> > I am not a clk maintainer, so I can't leave an Acked-by for you to
> > pick this up unfortunately. I've been quite active in the clk
> > subsystem though the last 6 months or so.
>
> In that case, I could take your Acked-by as an active contributor of
> clk if you are willing to provide it, i.e. with the "# Suffix"
> notation I introduced a year ago:
>
>   https://docs.kernel.org/process/submitting-patches.html#when-to-use-ack=
ed-by-cc-and-co-developed-by
>
>   cd9123eeb224 ("docs: submitting-patches: clarify Acked-by and
> introduce "# Suffix"")
>
> i.e. Acked-bys can nowadays be provided by other stakeholders apart
> from maintainers, e.g. people with domain knowledge, userspace
> reviewers of uAPI patches, key users and so on.
>
> Especially so since you offered to be a co-maintainer long term, so I
> think having your Acked-by is way better that having no tag at all :)

Sure...

Acked-by: Brian Masney <bmasney@redhat.com> # Active contributor to clk

