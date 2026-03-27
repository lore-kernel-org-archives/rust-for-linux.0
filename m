Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559373F20F6
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 13:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617563; cv=none; b=J7hDi4jQ2n6quaF9LiYkn8rESxCNbmi7YCKsngEVapUsT4a7IRw2sFyd9FkO5XHYCpVPWvjxvpTD8O3bPuMpqiG0jiiP4EDhqUWrMS9BmW/C1puNBclYGhfhrLcXXwEjGaXQqztWzMtMwFAOEED86E4UN9iJsqQMDtflm1W5ipQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617563; c=relaxed/simple;
	bh=O7lSs+njbRqVkVDMgsOfygnKLYu8xaGMK8nVUk8tZOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/596QWHklCPlzczJjsnNLFVfbDOlmE5AArtENRa7b/LePj0TrjcUVcRWRwdHuKklkAhKHpB0d0Wo7+dQWDhWFX+mQ5Gq51fB+qJAW86qzgvPcLaN9Ryy1rMEDOt5Pp8Ju1EKTd5AG+qoSmZchmNtbMPLFRQU2rGnc9Y/9osgzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EoMTGkLr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EoMTGkLr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774617561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O7lSs+njbRqVkVDMgsOfygnKLYu8xaGMK8nVUk8tZOs=;
	b=EoMTGkLriENDY3mzlMPhoQqr+e+3dqXYZX8UuuDMI/hVdBlVBsP2SUZga+L7dp2GbV3POg
	jvA+j4iboZqFL1+NcxluH8tzuSdGKZy53nqs/5XY+XDk9qpUHGYtdcza5I+EVpIoxpfswm
	epVI51v+70fA97whUr2DKrIfyh1FZpU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-1sQG6VbGPpWI0PBMSQDenA-1; Fri, 27 Mar 2026 09:19:20 -0400
X-MC-Unique: 1sQG6VbGPpWI0PBMSQDenA-1
X-Mimecast-MFC-AGG-ID: 1sQG6VbGPpWI0PBMSQDenA_1774617559
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b97d66528c9so211419866b.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 06:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617559; x=1775222359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O7lSs+njbRqVkVDMgsOfygnKLYu8xaGMK8nVUk8tZOs=;
        b=nrbA400eHfvJgxJDiPwX/eU4p+z+wy2w4afbZhmWtPpKtb4uxgK+FvpuCDClngTA74
         BOIck/lyBsH06HCvOxWHI7kantUtpRAxg1mCxpFQsZYc2KM6JeTVBD88TnbWLxzgRvX6
         mStlbK87sLcc7WljXKKQEVpnu/74D4R6eRvjwUyndys8iWUbm85ftF4o0jkK8CmIlq6g
         dSqr26jFGI52FJsAaU21M0MlNtqeADT1LY4BfAvcFJgDefnx1UZ6b4Yc011vCJY2yZTv
         9vWWW/CnTtJP1P4SzfNPRqA+5sDv3OpJTB7HXZbRGZNfPkVJMkDoVylzRXGvUCJHoarn
         LP0w==
X-Forwarded-Encrypted: i=1; AJvYcCWHjVvco6S/G26/8pcEqYxXAGi2VhbJ/UMdp5VivP8s/r1fxT9VHVRMdPjOJgQu4XILtxJ7INDmF6XqY39SJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVcnx5Z1IF7NAaviTXNAg2mlMgjNAo8sUHgg/G2LcpbOsb6zEh
	+sAv8WsqrS5jtI5/rxfzAp4HSSXRyHcnoQ+V55aYWUUVU3VhUdRzLqZTq8FbKhMPBbP6yNlYzSn
	2aQllP0yq5kOrj0Yip613y/SUR6zSqUvrF9AvusGlKT3OShdPfp+FuIFM07/LBPJIdy2IXpPPAM
	FPv45Uw+XNnx4e6WEHJ5Aoyig6AhKQy81L+rkQiYQFh5g=
X-Gm-Gg: ATEYQzyO9Aightzc/wbhkIl8tCQLCjPutL5vdP/jOwuXubw7Gm4Snq+fKCLp85WFOdm
	ONToNYq2JsXA7JbM+umfC20W6Z1r4F5OfVTLLZhjLxcbZUs+hjpk8gN6VDKVX+8SnbKW8lxvjVR
	tVtc7ageozqjTnXeWXU3e0BLV4Sn8g8Hvr8wRWa2PAm83hQVidGTBf9BYcoJRmle3n6UF8EioMZ
	mpRgw==
X-Received: by 2002:a17:907:9808:b0:b94:82e:55e7 with SMTP id a640c23a62f3a-b9b522ae87bmr156857766b.25.1774617558602;
        Fri, 27 Mar 2026 06:19:18 -0700 (PDT)
X-Received: by 2002:a17:907:9808:b0:b94:82e:55e7 with SMTP id
 a640c23a62f3a-b9b522ae87bmr156854566b.25.1774617558068; Fri, 27 Mar 2026
 06:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
 <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
In-Reply-To: <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 09:19:06 -0400
X-Gm-Features: AQROBzBLIY29Yr2X6VCTB1TmB9iOUiQz4yOfIMWdESx0Gr_aeFF6e9jfGR2ISWk
Message-ID: <CABx5tqL+G9i1ZW7i5AHaTqUFTVRDmBvP=RycUdwjG-GOp4uzBA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Maxime Ripard <mripard@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Michael Turquette <mturquette@baylibre.com>, 
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
X-Mimecast-MFC-PROC-ID: 1f16Bhj-EgBCckzWWh40FgPIHTeRMihpmQr_jKZ5hys_1774617559
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Danilo / Alice / Miguel,

On Sun, Mar 22, 2026 at 8:15=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
> On Sat, Mar 21, 2026 at 2:17=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Fri, Mar 20, 2026 at 12:43:47PM +0100, Danilo Krummrich wrote:
> > > On Mon Feb 23, 2026 at 11:08 AM CET, Alice Ryhl wrote:
> > > > The Clk type is thread-safe, so let's mark it as thread-safe in the=
 type
> > > > system. This lets us get rid of hacks in drivers.
> > > >
> > > > For Stephen's clk tree.
> > > >
> > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > ---
> > > > Changes in v5:
> > > > - Rebase on v7.0-rc1.
> > > > - Pick up Reviewed-by tags.
> > > > - Link to v4: https://lore.kernel.org/r/20260113-clk-send-sync-v4-0=
-712bc7d94a79@google.com
> > > >
> > > > Changes in v4:
> > > > - Pick up Reviewed-by tags.
> > > > - Link to v3: https://lore.kernel.org/r/20251218-clk-send-sync-v3-0=
-e48b2e2f1eac@google.com
> > > >
> > > > Changes in v3:
> > > > - Rebase on v6.19-rc1.
> > > > - Pick up tags.
> > > > - Add fix for pwm driver as well.
> > > > - Link to v2: https://lore.kernel.org/r/20251020-clk-send-sync-v2-0=
-44ab533ae084@google.com
> > > >
> > > > Changes in v2:
> > > > - Rebase on v6.18-rc1.
> > > > - Add patch to tyr driver.
> > > > - Link to v1: https://lore.kernel.org/r/20250904-clk-send-sync-v1-1=
-48d023320eb8@google.com
> > >
> > > Alice has resent this over the past three cycles, but it hasn't been =
picked up
> > > yet. Please let me know if there are any concerns -- otherwise, I pla=
n to take
> > > it through the drm-rust tree in a few days.
> >
> > Stephen hasn't really been active lately, but Brian (in Cc) has been
> > trying to pick up the patches falling through the cracks. It looks like
> > such a candidate to me.
>
> I'm planning to send another clk pull at the end of this week and I'll
> include this series.

Stephen came on the list and started to merge this things this week. I
was going to collect up more patches for him if he wasn't around, and
intended to include this. However, since he's starting to collect
things, I'm not going to send him a clk pull today.

It's up to you if you want to send this in via drm-rust or wait for Stephen=
.

Brian

