Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7547926D4EB
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 12:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755003569; cv=none; b=Vb6TT4kXZ7g3C+ddcI4vX3L30ws1IpFWCBGrKmJPsJJ7e71pnEWD1mmPTuaL35+MkQACt38lGpFHX6YXJxIIsCkEw0taJPO1JxGHghDSU0Ec0wMnrpF121OE32NRKdAxVZv/kX6iYhOGwK3H+Gq1vPMWpfWFExbK4mRtGeQ28mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755003569; c=relaxed/simple;
	bh=GRdg2zGNl2SnGOTuMhxwN0E/0Sc0H2NpbnskXDTr+g4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9OamNZhCzQlob5IQ1eIyFcoxxi09hrJbz7ML7IS9BekvdhCL3l/NmcS3b3mddZwDL1HpvHfDmPNF0Ko4icSgqiLmyF18xeDiL2NoFr5QUrUor8134o8NoKbT+J1NHJKpfxd6EXN9XHEInguMw6k8qHncAHJFA2Rn4OCF6wORWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=trevrosa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=trevrosa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-af95d5c0736so847054166b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 05:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755003565; x=1755608365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRdg2zGNl2SnGOTuMhxwN0E/0Sc0H2NpbnskXDTr+g4=;
        b=jyqACv3EkrefvIyO/CVloMSAvf+upiuVg/SYd0T20LHQ2O4fuFwcvuf0V43IxnsfCi
         mI1eKG8JSVUad/VrqGXwLOTusT002QYJ3WbbGfxNx4UsAGWvTk9LAGTa3pi0QpVc2zSI
         HhHKVLL0P1hNG6hZotAn0V84ABRVadhWeJYe40w37T6Q99MdSGmkYjmpvUtvhqZBxnGr
         mXepu1zqtu193kmv902xZ1qhGw5Jud2h0TuJpm2kVozLcHC0owF+zoIk96ZqCJWnADIf
         zhp2x069+hSbJC8rENoRVsTEstWyVEOs6wlcXpBC9HfRtlz7faspTj+sqNCfWkFG1eSG
         KArA==
X-Forwarded-Encrypted: i=1; AJvYcCUaGn/uwB7VwXe3d4kl0Ns5i/tBix2YUS3CEJEyi8Q8pFkkVS72BLKKh/9bNzCPwn8Q5x4eH5z++zjC0gW4GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQCynP0k4Nh5CNucqLHV7TqJyjstcsnh2pJdXa69x7U9XmxekP
	IB4ue/k/WX4HGAckQN0XSHjEtNR6QHdyPLsEbkteeNuqppAXyMOgUKVutMiLN6jdFq8=
X-Gm-Gg: ASbGncuAklC8SgxjELsDRX5vd9VdQtdE4jjMiEkwrO6ju5zoM5t3MjSM5Vaf3QdbPY9
	0/7wdxhKg28z2L8Q/tcBUW4oOl4iGBQuuc0SXKzny8ghUM+qToYSNEJiYC02ZYyMHnE2+9Pqa8R
	6UASLnsmbSZQMGvPVcqt08bFxrs7kTcH+rkDe4JiMhHRPrtYlitBtZv6r8EF55IFFaoOujTaQp8
	9uePmzGhbsLZld8c9qAbkY4/Hwy90eyu9nLd9VTGaCGupptJMnPrjknDaY/uYP0KdrF6Lexzk85
	/0CHvqimSQ6M1VQc+S5QRg82DuMgW5p7DG2MCx5ni+JQ3iOsRbLbQbo/6W9uxWW62ebzjtdqhZI
	RIxui61Eu+YtaExNLSqhRumkHArBG97s/hSjFM0Xoo3BuYDnBjmiLFKbk
X-Google-Smtp-Source: AGHT+IFgwiivMZhuWF0iFWhvXsWoaP0QF9KiD333GDK83AED6o8w6wEbY0bQE7ZVZoFPyGUoG7RX9A==
X-Received: by 2002:a17:907:6eab:b0:af9:b4e9:8638 with SMTP id a640c23a62f3a-afa1dd30ff1mr273879166b.0.1755003565117;
        Tue, 12 Aug 2025 05:59:25 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a219ecfsm2193920566b.94.2025.08.12.05.59.24
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 05:59:24 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-af95d5c0736so847045666b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 05:59:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXdVaPaAXf7TY9zeoqCSdLbWSyXyme1gbyBbzl7b4JgJqPBLJAZ/OpNDw9MAwxrxuCWWv1ZMjSkHGJ4zoyoIw==@vger.kernel.org
X-Received: by 2002:a17:907:9715:b0:ae2:4630:7de4 with SMTP id
 a640c23a62f3a-afa1e102b46mr262118966b.34.1755003563816; Tue, 12 Aug 2025
 05:59:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACvsgUCBk5Dt2yBSy9_NA0z38-wP68vvBX7XDYgJGinTURT1kQ@mail.gmail.com>
 <2025081221-cloning-able-a6ed@gregkh> <CACvsgUDP8rX4evCbaNC1MTy56qWH655Cc2bOLuryUxfP-o4_4g@mail.gmail.com>
 <CANiq72nn+mPHWdt1XwQ-znL2ydMwWRN=7-9Vdq_5UkU8hFeqPA@mail.gmail.com>
In-Reply-To: <CANiq72nn+mPHWdt1XwQ-znL2ydMwWRN=7-9Vdq_5UkU8hFeqPA@mail.gmail.com>
From: Trevor Chan <trev@trevrosa.dev>
Date: Tue, 12 Aug 2025 20:58:57 +0800
X-Gmail-Original-Message-ID: <CACvsgUDAzHfOBM73YvWbodsSiNM1NPq0DRvnW6qJw7vHVLJywA@mail.gmail.com>
X-Gm-Features: Ac12FXzfFfUhdV7iHqpHO66mMwjLCX2AjiCq32MiZzRTMH3U3-cPYVL8xHCjhfI
Message-ID: <CACvsgUDAzHfOBM73YvWbodsSiNM1NPq0DRvnW6qJw7vHVLJywA@mail.gmail.com>
Subject: Re: [PATCH] rust: aref: make `AlwaysRefCounted::inc_ref` an
 associated function
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, alex.gaynor@gmail.com, ojeda@kernel.org, 
	rafael@kernel.org, dakr@kernel.org, arlied@gmail.com, 
	"simona@ffwll.ch" <simona@ffwll.ch>, "aliceryhl@google.com" <aliceryhl@google.com>, vireshk@kernel.org, nm@ti.com, 
	sboyd@kernel.org, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, brauner@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, jack@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 8:49=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Aug 12, 2025 at 2:24=E2=80=AFPM trev <trev@trevrosa.dev> wrote:
> >
> > Sorry, my bad, what should I do to fix it?
>
> It seems your patch is also word-wrapped, which suggests you perhaps
> copy-pasted it into an editor/clients like Gmail, so it cannot be
> applied.
>
> I would suggest you try `git send-email` (it comes with Git).
>
> Thanks!
>
> Cheers,
> Miguel

Will do, sorry again.
