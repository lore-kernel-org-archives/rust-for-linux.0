Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDEE3A5989
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 13:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320140; cv=pass; b=AEVXJ83sMRORZCYdMwXgF3Tm0NA5/vibvos1mv88WGzZ2qPEnb475thwRZBvo79kvlsWF7ZUqViG1O/Sn6uWAyPRmo8ErGoL3nHEr/qTORUaLVfZ+AqEc6hpQuh2GRHA2/6mZieE295Vk7BFsI1sHvrv0ABSTddJEoBQTQh8Gy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320140; c=relaxed/simple;
	bh=hooQptWzIagr10ERwCvMM3wIaAqGBRqHrg5Oq8PcGtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nweP5ZOpElsWWmyqlLL0D++jURD2/bn/WyR2oeROYpuy+pgjHQWPb95UNSn86Jtfvyd2FtXJD871nuKT9W7fNRlyFtUm+ENjVFgV2KXUN63IWKMs8eB75XDG9NuigSb3+Xystd7znbR9FreU9eUrIN+lyr9CHsNmyEjPzsizeY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fn8WIA5Q; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fn8WIA5Q"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-137bd9ed2b1so984765c88.1
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Jun 2026 06:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780320138; cv=none;
        d=google.com; s=arc-20240605;
        b=dMVkY+roe/rM1Z+YOpiUv4GcZtSbEDeR5C5J4wgBwvlG5Nw2UEWsy1acjPMYg6VgFx
         5aQ9AL6Q7OgkW/SRAZMW4sIwuPvpcqndm6BC5t9fymIl2plNAu9AUzjcz8B5aA9bw9wC
         MGf6VMr+uNR/qQyrMjj09UVevMviSgMF2MLUfPwqzZuAVEA6xVa13yndaA8NwT7t7fuQ
         D/9IiTzARj5yfdBKQ0VxUmRC3Rcv4sx6w28rRBkEto9qGemO2R+KvU2lQDnVUJJe0YjB
         gZ64XMv/P/wW3lSv9Gm+mzXiiOdM0qRA7qZJ6IrbFzjHNUggyr5VwmaXfSc3KDv7zSTQ
         6WtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GdkOBdEWo+k8nIccYq3ePCwKTGzhNT9vQ5Dk5zhGNHg=;
        fh=+T+1Krv6WnIdr4WjabqqGWgewFbjttotJqmjOThkEDI=;
        b=bydJjmSnhREBeMsdkbXdz0RU0XZF60TezJ1lhoF2bf2j2ewW6AinOWMvO86IYLIyUv
         IRcmfvekW/hufPfg/gVhVuTUem0OnlgogPugZEhkkXtK5JCiIvt5Qsd/6adwL5tKdXHU
         8+tl7nk4ME3FMN/AiTuyKUduxERJk811frN6SJT10gf46JQoEA+mhb4bvosw3UFiZTrE
         z4o3TtyGqAI8ngiTfR1AdcekaZCWLfwYHldYJXBt7RWtZQN7RXVYKcspPnGO3odVImS/
         1dEW0ZRoyU4DBtk7kXmVgiYTm5t/BBJd5rBTLrONGSLShRTFnrqimvU/5Grx4+8Udw8s
         EcTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780320138; x=1780924938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdkOBdEWo+k8nIccYq3ePCwKTGzhNT9vQ5Dk5zhGNHg=;
        b=Fn8WIA5Q+Y2ClGXgyIdeUPVzxGWnsfQuzt3WFISNhOntumBd1Iay+qddrddPo+TxEy
         HF0YYQMv690pWfrPZ4ycnKX3Qe41U4KQMzIHMj1CElsGdeEqwlhPOzOxkh/9HeiINwiL
         W6wSfasw2EtlGOLUB9I3573yFXT0QHFja5RGLiamH03qcpglRxle+S/PhAV5tjp1XL0V
         XiODihY6jkUrVmaMvvCmoKaCVWvs+4A4HP5HYVxws9uHBKhuVNyjj8IUAWByTsN1hDPn
         3dWuxmuHQ8vE/RypioTniKLXYusHDUqs8UBdi0wUoEGotRTVb9/WcXG/PHOCedgm6YhS
         ZD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320138; x=1780924938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GdkOBdEWo+k8nIccYq3ePCwKTGzhNT9vQ5Dk5zhGNHg=;
        b=SINt1JdSyxF+6VyAJOFFnoJDj4fKEa2ywMLygHzVO82rzUJUO4Iw5LOu0k8KN9E7rm
         1cSD8qxerRpOfGLreGqh2eT11M2wlJAEJgTffC5QxjHhwfaMH3gHr36c9G/1prrQK7HD
         CDRrpy3Laf6LhCiP2oLayVhYaMYb7K7d8eJ93+L52gK247KI2qu+c3HQRZorGBRw0ZFi
         tHm4ZCLURJe/ddBRuuatXcwRHv+KwYKvPihg4+FFx+p9sF4JIrhSScWw9Vnuel5CaHxP
         Jks3cp6LwhfOmN0ukQ2pTvPTcxGNeRTctN0QDLlcHa1EIe/yV6Bprta2m2tCVGVW2r+K
         vJ/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8N2xXEdaVTuCgJz1FcCQFATxvaaX0OHq10GHAicNYLw6qkws0+PONMMmZ138in/eW8AYFJ4fgGxObGHxDibA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmCoEroymWpduEtcP+xJRruYP2ktRuljIFJtVYNd4Mtvj5xQtj
	ovI1qmJoWjcOv9OO2Ty3LQjUa2BLdiHU2sw6fYHUjrxDYUrrBAk0xHF/ynkyNzBV+0Tbd6IiUaO
	j/d9eDrYCLyJ/YsPFImTmZ2nlLuRtALysUjK2SpfI
X-Gm-Gg: Acq92OH6lSpiWo0s+U3xcCHoKcpmYmZpW2GCPA7v6xmOGzAJTWdCbiHbo1gansLTOK6
	3KG+GJRqh7qzmlSHhjtVlp0nqGBSXzHN/6Qma09U3JwjXZl1xtE7rnaWeiQV06UcSSUJWU93Hed
	rJmEPZf64XFb8cUaqrAZRxUicZ6qhh/xlzOkqlKoDs6j6BjISowrCtnJ/8s/FZwGl1dG3f0CCWa
	Pfk0Umuxrw2WdxEwixaRjOx+CpfO0QX4BZM5N0X2TaAjz55fKxPvfwIcU9fwklykP2jOPxHZJxm
	0/BZOSWuAvuTcVnRRLl47d3O6MZP5OKDZkXRkOUMe4XQkpdhQdnd/YrvoVtJTigvTRWMGcUuNx9
	j3Jo=
X-Received: by 2002:a05:693c:2c86:b0:2de:cc07:e99 with SMTP id
 5a478bee46e88-304fa49ce00mr5489017eec.7.1780320137881; Mon, 01 Jun 2026
 06:22:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530143541.229628-2-phasta@kernel.org> <20260530143541.229628-5-phasta@kernel.org>
 <ah1glmXDM-OAKa5h@google.com> <0ea6b6fdd1e3f1e07445f17c0bf672524938dc85.camel@mailbox.org>
 <ah19ZVkr7b3m7V_u@google.com> <3b216f24afb406b797b8bbb73b3f5c0eec2fdc6c.camel@mailbox.org>
In-Reply-To: <3b216f24afb406b797b8bbb73b3f5c0eec2fdc6c.camel@mailbox.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 1 Jun 2026 15:22:02 +0200
X-Gm-Features: AVHnY4LWfDXXY2MTx1DqLyh8Hxwl3ZS8C8Evk9p1Nisz1mt4W-Tdk9DBxhQXUfk
Message-ID: <CAH5fLgiZb5fqfXGQMicPp+UbBi3JMN8ZNG_Ldt5KiSk+btVCSA@mail.gmail.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
To: phasta@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Igor Korotin <igor.korotin@linux.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	Shankari Anand <shankari.ak0208@gmail.com>, manos@pitsidianak.is, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 2:47=E2=80=AFPM Philipp Stanner <phasta@mailbox.org>=
 wrote:
>
> On Mon, 2026-06-01 at 12:39 +0000, Alice Ryhl wrote:
> > On Mon, Jun 01, 2026 at 02:26:17PM +0200, Philipp Stanner wrote:
> > > On Mon, 2026-06-01 at 10:36 +0000, Alice Ryhl wrote:
> > > > On Sat, May 30, 2026 at 04:35:11PM +0200, Philipp Stanner wrote:
> > > > > +/// A trait to enforce that all data in a [`DriverFence`] either=
 does not need
> > > > > +/// drop, or lives in a [`RcuBox`].
> > > > > +pub trait DriverFenceAllowedData: private::Sealed {}
> > > > > +
> > > > > +mod private {
> > > > > +    pub trait Sealed {}
> > > > > +}
> > > > > +
> > > > > +impl<F: Copy> DriverFenceAllowedData for F {}
> > > > > +impl<F: Send> DriverFenceAllowedData for RcuBox<F> {}
> > > > > +
> > > > > +impl<F: Copy> private::Sealed for F {}
> > > > > +impl<F: Send> private::Sealed for RcuBox<F> {}
> > > >
> > > > Why sealed? Just make the trait unsafe and require the things you
> > > > require from the user.
> > >
> > > This is far better. We definitely only allow the user to pass A or B,
> > > and only then it compiles.
> >
> > What if I have another type that I want to use here? For example, maybe
> > I have a struct containing a copy field and an RcuBox. Or maybe I have
> > an ARef<_> of some C type that uses rcu for cleanup. Then I must edit
> > this file to add support for it?
> >
> > > The unsafe implementation could be messed up.
> > >
> > > I thought that's what Sealed is for. Or isn't it?
> >
> > Sealed is for making 100% sure that downstream crates/drivers cannot
> > provide their own implementations. But I don't see why you need that.
> > All you require is that the value remains valid for one grace period
> > after cleanup begins. As long as the type satisfies that, you are happy=
.
> > An unsafe trait can require that sort of requirement from the user.
> >
> > I think what you want is expressed well by `RcuFreeSafe` from this
> > thread:
> > https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library/top=
ic/Consolidate.20.60PollCondVarBox.60.20into.20.60Rcu.2ABox.60/near/5987267=
24
> >
>
> I guess this is a question of design principles. If you demand an
> RcuBox, you have a guarantee that it's safe.
>
> If you demand an unsafe trait, you open the possibility for people
> messing up.
>
> Due to the unsafe-contract you'd have moved the responsibility for the
> soundness to the driver.
>
> I would not want to block your suggestion, but I am not sure whether
> that's really the better design idea.

Yes, it's a design principle. You are saying that if someone needs to
do X but might get it wrong, we should take away the ability to do X?
I fundamentally disagree with that principle. Unsafe traits is the
tool Rust created for the exact problem you have; marking places where
you should be careful is the entire point of 'unsafe'.

Alice
