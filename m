Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139793A6F04
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 13:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320444; cv=pass; b=d3OtSSjYigkDy4zaAfcP1OGRVuTU5JAgnB4+jxUWGP/BZGG48zxMfjLOjgHBR22ykdjTNASQTYzmsgbC5eYDEDkKgf8kSnjkhFDE0dIsOvz2gEgj7kpF/dHblukLtdLC8uf4lI/aX3CunS2KwGn9UkI78JdYzK+rGeQbFRsbDFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320444; c=relaxed/simple;
	bh=0DHOe9b8avRmAIwuEFXwH9kNoZgOYx6xrIy5spz3Blk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAtnQR8Dyqr60Tp4zCYiwOgYN2MsFIuioiZ2r4obvSFbOkSkeK5cdurt8FCyoTveqQ3lz09rgD72pmQ8OaFebZ8cpb59Tmsk6FZdzGQccp57o+iUGPlAjGdpFro9eiZ1DhuldDgAV6qBhLLtLYd4kkSpb1p4n8OC0WJl05hil3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PIJVNL6Y; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PIJVNL6Y"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304e58292d3so6628289eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Jun 2026 06:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780320442; cv=none;
        d=google.com; s=arc-20240605;
        b=dC6gTF+eivTbmoT9jBTvo+A5cAZznrzyaD8mJn9zvpBX72JBlj4IEJ8YM70NcLD4Cg
         du9CMvosHnvkwT5BydHnEWhtZrhwKzgEEXVDBN18ghQTa9F/2RD501DUoORIxQC4uOlg
         PF65A3lr3ka0OVBPfnOJ/XyghSGt4R6OHCRPLueP8HxpuNwoTrFNwEJqg/2OJmyeSfSO
         6afaUlM8793inpXW9zi8ZN0jsVXzQOyZ7LB3598Dw0RSRcpTrVABJ+MHryokNa0fjLk7
         CB3oBzqW6M+ASLfIWp+aRc635SJUgvZbEcUv6WJPlH+7MV/0C1XQccwU9aNrNhY61Nwl
         eo8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ri49UqDlI7T6GkNPLNf+vktr0M6I1uPdwQQUuW9VuW4=;
        fh=3YRYuyAy3g0KLhaBndIkU13c9HzuESvesx05c6qg0Es=;
        b=Mf5Am17CzqEYqb1YsH8+oHtcz0DSXMKZDDMu8m8rXxGoRx7lhitAuKgC3MppFdcjN7
         PqkHbYFBnYE8AWRbOWhyaap8ee9c+vNvfrJrH4V2vy2Ylk84sQsc6E0JeGIJF4+rbahG
         UW4sndyW2qlWJBR5MNvhEeWjW/+uZmf3tgCm0NOPgTVAxsm6Gf7GsWzsj08x+6DaraCM
         Av3vCHZXMonodovY3Il+BbaN+QQGJs4AOFPzN6Xp4HYGSAPU6NqruXhYJ7zf6yHyms+V
         S8zWarFyocCevhPxcFx2XDfoUUo9GYI3sHo+/pjEWJjFmkFO1ILG0PKhTbuxK0q8zSo/
         vBPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780320442; x=1780925242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ri49UqDlI7T6GkNPLNf+vktr0M6I1uPdwQQUuW9VuW4=;
        b=PIJVNL6Yg1pM/611/nm5MHUW3g4YZR5NvyRGwqcBG4Rdcz6o4qO+l520CcFX6ajtDq
         f8Nl+jZAOKTn8qxhXgjdMyX0tg00GXUz7AGs0d9hDPDuMzq21czi5gwcT0k/HUXI9f5I
         uHDccF0bzD188UskmOvITNiTjOXIbB0Mhfmy313ZQSiOJJyFsfrPOmKp0cB3EtYHy2Ix
         okMPDPSrdfD/iNZx5xOjVsLKXe98wVs8HouGwP8rtvB/Tfk0d7CdzfzlaLHzCxQx275b
         B84LP/t1aru0U2rw4c3hLcmW0HcTFszNlVX5QDwhbRjYF/JtjZkCwG9sS4Gbouh5X2Nu
         r5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320442; x=1780925242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ri49UqDlI7T6GkNPLNf+vktr0M6I1uPdwQQUuW9VuW4=;
        b=X+lwXuRoB7lSdPLjXq029V5BVsc/wmVhElZVz+vbzteRQMKepAoU8xiSilLGYHItWX
         uo20U9noqbOrjLIe0g0YqLGlBCgj+29drebpAZDAtm5w+XFnKOA6FDz1QQTrnQ4tGReo
         EGagkAKvEEW9B9hlS8FOHLBlP0wOk7pDirEjLL85pbpXLnmAg4pk/1bY5Aw/EkrmVAKq
         KTt/ru1JYAgLbaUyeGm+gACGF+V+42zRKtPbNEW5omgvfNZtsAsz3KYczDf42K3qHM2g
         epm+q0DruUFbVAguEsQTZMHHvGu1COxDpvyEuKLdJi4eMB/p7/0Bo8ZN4fukeBlD97nn
         mnUA==
X-Forwarded-Encrypted: i=1; AFNElJ+qGEXWq7+VHldzVX77MrGQa3S62u8O03Ve0AWcc7MGmXu7VlRcUawTCfAWE6AtazdHH7wH/fyjOQydH8jikQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl4RScgm/QgzPI2lqdC21jRBBefwWcsvJMIJYiPskPz5qctRC8
	r0lk/8EyJa1BBqxgA6HcBsglMy2/NmlZX85WMhPeBvnew4LmaypVKKjmZZwbx4ASsPHJJs2hDes
	1YdvVRFN1G6fpqglcQXj46dV/EwYsn5PvMpOYWgsH
X-Gm-Gg: Acq92OGdazGnc3KpyOC8ETLhXI40BUWgPZK7NjrQEZVKs0WkK/hb+9jc8b50w09rkPf
	owcZADPFUtx9nW31Pzj7pBpuoiQQshlozfxwH0VG6h68xa2GKnu4jXFMDv0pSx6lBwp6OAp5gV2
	yrpWxy9tFFD9MK4d+noyUXU18PQH4TXE5Pc7r7xvgZyPbxWXvfH0p3RszfiB1rXb4w7McnFp/yG
	BsCKWraPqWulj/57rumiTSLYTCypEZ91M6/bm9dctDFaUeXKtwkm8LZa4+Fh8tTuYOZgnx1z22G
	YZV+jMDmgcG2DBR9tQSeoeEMyAwTL2zWWFDPq+KaM4rFcZrjzWg09dfMjD5BfwOPhisr+R+IP/m
	81tM=
X-Received: by 2002:a05:7300:2201:b0:304:d8cb:8424 with SMTP id
 5a478bee46e88-304fa546886mr4919952eec.9.1780320441610; Mon, 01 Jun 2026
 06:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530143541.229628-2-phasta@kernel.org> <20260530143541.229628-5-phasta@kernel.org>
 <ah1glmXDM-OAKa5h@google.com> <0ea6b6fdd1e3f1e07445f17c0bf672524938dc85.camel@mailbox.org>
 <ah19ZVkr7b3m7V_u@google.com> <3b216f24afb406b797b8bbb73b3f5c0eec2fdc6c.camel@mailbox.org>
 <CAH5fLgiZb5fqfXGQMicPp+UbBi3JMN8ZNG_Ldt5KiSk+btVCSA@mail.gmail.com> <3829028571be1886b99018040782ef94369b9523.camel@mailbox.org>
In-Reply-To: <3829028571be1886b99018040782ef94369b9523.camel@mailbox.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 1 Jun 2026 15:27:06 +0200
X-Gm-Features: AVHnY4IJXBoMvh-rw5Yz6dkN_FCzB34R7ldudBtNs3IR1XQFjKtmqNv3cEC-Bt4
Message-ID: <CAH5fLggFHp6bLZ-g8aTQKY_sHRJ0aEmB+-2XWG3RMS1yBXO+8A@mail.gmail.com>
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

On Mon, Jun 1, 2026 at 3:24=E2=80=AFPM Philipp Stanner <phasta@mailbox.org>=
 wrote:
>
> On Mon, 2026-06-01 at 15:22 +0200, Alice Ryhl wrote:
> > On Mon, Jun 1, 2026 at 2:47=E2=80=AFPM Philipp Stanner <phasta@mailbox.=
org> wrote:
> > >
> > > On Mon, 2026-06-01 at 12:39 +0000, Alice Ryhl wrote:
> > > > On Mon, Jun 01, 2026 at 02:26:17PM +0200, Philipp Stanner wrote:
> > > > > On Mon, 2026-06-01 at 10:36 +0000, Alice Ryhl wrote:
> > > > > > On Sat, May 30, 2026 at 04:35:11PM +0200, Philipp Stanner wrote=
:
> > > > > > > +/// A trait to enforce that all data in a [`DriverFence`] ei=
ther does not need
> > > > > > > +/// drop, or lives in a [`RcuBox`].
> > > > > > > +pub trait DriverFenceAllowedData: private::Sealed {}
> > > > > > > +
> > > > > > > +mod private {
> > > > > > > +    pub trait Sealed {}
> > > > > > > +}
> > > > > > > +
> > > > > > > +impl<F: Copy> DriverFenceAllowedData for F {}
> > > > > > > +impl<F: Send> DriverFenceAllowedData for RcuBox<F> {}
> > > > > > > +
> > > > > > > +impl<F: Copy> private::Sealed for F {}
> > > > > > > +impl<F: Send> private::Sealed for RcuBox<F> {}
> > > > > >
> > > > > > Why sealed? Just make the trait unsafe and require the things y=
ou
> > > > > > require from the user.
> > > > >
> > > > > This is far better. We definitely only allow the user to pass A o=
r B,
> > > > > and only then it compiles.
> > > >
> > > > What if I have another type that I want to use here? For example, m=
aybe
> > > > I have a struct containing a copy field and an RcuBox. Or maybe I h=
ave
> > > > an ARef<_> of some C type that uses rcu for cleanup. Then I must ed=
it
> > > > this file to add support for it?
> > > >
> > > > > The unsafe implementation could be messed up.
> > > > >
> > > > > I thought that's what Sealed is for. Or isn't it?
> > > >
> > > > Sealed is for making 100% sure that downstream crates/drivers canno=
t
> > > > provide their own implementations. But I don't see why you need tha=
t.
> > > > All you require is that the value remains valid for one grace perio=
d
> > > > after cleanup begins. As long as the type satisfies that, you are h=
appy.
> > > > An unsafe trait can require that sort of requirement from the user.
> > > >
> > > > I think what you want is expressed well by `RcuFreeSafe` from this
> > > > thread:
> > > > https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library=
/topic/Consolidate.20.60PollCondVarBox.60.20into.20.60Rcu.2ABox.60/near/598=
726724
> > > >
> > >
> > > I guess this is a question of design principles. If you demand an
> > > RcuBox, you have a guarantee that it's safe.
> > >
> > > If you demand an unsafe trait, you open the possibility for people
> > > messing up.
> > >
> > > Due to the unsafe-contract you'd have moved the responsibility for th=
e
> > > soundness to the driver.
> > >
> > > I would not want to block your suggestion, but I am not sure whether
> > > that's really the better design idea.
> >
> > Yes, it's a design principle. You are saying that if someone needs to
> > do X but might get it wrong, we should take away the ability to do X?
> > I fundamentally disagree with that principle. Unsafe traits is the
> > tool Rust created for the exact problem you have; marking places where
> > you should be careful is the entire point of 'unsafe'.
>
> I mean, fine by me if the others don't disagree.
>
> But when then do you ever really want a Sealed trait?

Sealed traits are a very niche feature. The main use-case is
forwards-compatibility. It's not a breaking change to add a new method
to a sealed trait because no downstream crates could implement the
trait.

Alice
