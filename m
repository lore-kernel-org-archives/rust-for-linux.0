Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB54349B02
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 06:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061858; cv=none; b=fFVQiOvySVOvBhn8UVqa/szqlCHLSE2E5DgaaQ4XVrgHNJ1eLdLYM6z56WPIuE2FQxQphE8GLnPSWwpiPugQ6qJaT1q+lLK03Abz5qkeq9NUrYugeJhrhmxBrpVhpdAohSWkR09tzWobYa/o4cCXHcL4zCkwFiOdcsd2zSxHGvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061858; c=relaxed/simple;
	bh=/K8f1udQw9YJBO1Ie1ZbJE3mShr1BbOgfVubnfUn+a0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Uj1x3hBAoTQCMT9a12rcWwhYok2bu1Q8QvxAnVMVy3Yc70HSHeatl/8eVFLXOT/pAlQFbSXDPYDGgZde/lzQufo+fE+TpARkz4Y/aj23SGZO3FxhCuWYVhLkoZQBGw6j2E7vxASS1Lo4Q4Nzrlvdf4KcDF2NM5lknWihgg/mYUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fQ5ENlte; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fQ5ENlte"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-c1250de9035so21053166b.3
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 23:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783061856; x=1783666656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGF8vWJ8SJ2AhYQyBR0BCmWZSL8eN4zr4YEd9ugRFUM=;
        b=fQ5ENlteeHRojCcl7rna3uyXJOUJ+VhtayTgyJQGMkUIRgJ5DJYR4Qn/zrSobfHVWa
         hNFSBIXt+EVeOzgjilyAUixC0M1e0rT5GyW4Vb0UEGO9F7ONOHKoKRRbte7k67nZ/WPe
         +6N7uxW3J4K2rSeHu6wjOSP3qcm4ERAe7wBkuFIvIcx1i+5rGO2V5FP8/fedUu8JWYR1
         9oDya3UVpGf7zS/AQAl9fAGjUgF27rAyodAcmy8U9I4PFZxvGEAGIbCgZ6zoGOfC07tq
         VF2kA5SpssNHaM++BY1U+HH8GyQXGOnidjgktZuYWjozyRgTsa3B/rx/OL+7KhB47J/V
         LJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061856; x=1783666656;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iGF8vWJ8SJ2AhYQyBR0BCmWZSL8eN4zr4YEd9ugRFUM=;
        b=n1HDNcjC10nOe1AuLqgiYi8K8SR3p1MKJ6NDZ6Gn/K1xhxFpkPgrVPDuWeiEkU8sYR
         PHuP37KQc7ZT1+9+YnoG3uBwNKjJVjFVpuuDBl7DSCXuGAnQcjuK3nrltOiJo7/GvQH0
         UXFTVFlyBUXH+WLwdT1gSn1Ib0OXJrmEnOvsCDxLrAqt82ufYNndxX1NCfHiFwiCw0iq
         BeMElJsR37t0cHaZlyvFbiUasogIrI7MPn92cziSw7r0DW8TcJoEGzL7TcmCVNXdlI7d
         xZo9qM6N3JjXNRjVSM6QSR9j+CYBHC/oXVJHiJhqUHH4xdJ/Zzei33Nj0vNcwkkVs0GN
         LZsA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0nqZvhvKwnhX5uHVA3bgd3y5E/T8cfWrbhkFUQRAjoaUf8498wlNxmF7R1LWhdQ1wccFXCi/yjHrlF8Si+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN3LLumoFZSFIeYaP3sKDjCUDRZaFU/SimKBUAtAZ/LuIp+F0X
	rmFaE8S7ooRbawtwFIgwKRsxIWhCbvqmcE+CVST4cIH4aKjP9+UOXAKimA5T6cC8M6ZCpezPXwJ
	Mnk+6VIEXSHVsYnwP9w==
X-Received: from ejbjz10.prod.google.com ([2002:a17:906:bb0a:b0:c12:69ca:d115])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:e143:b0:c12:3590:2bcd with SMTP id a640c23a62f3a-c12a9db678cmr282670666b.29.1783061855361;
 Thu, 02 Jul 2026 23:57:35 -0700 (PDT)
Date: Fri, 3 Jul 2026 06:57:34 +0000
In-Reply-To: <CAHC9VhTfOnOgOzGk9==wJYKx5gAi3Zf3oTwbj183o0_xxrfKag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260529-remove-task-euid-v4-0-07cbdf3af980@google.com>
 <CAHC9VhR5Ca+WyP2OiNGtL1SqHn0SwLe=M9SB8D2bxtdS52quhg@mail.gmail.com>
 <ah51DY5yfaNZejBd@google.com> <CAHC9VhQyNzxJgdMkmEsOeAQ7Wt2L+eW6aNLjeoYmnCQLmcYRnw@mail.gmail.com>
 <CAH5fLghJaFXheAZqKyM9Cdo6iqTw1W=haA79POhmZWEfuKujRA@mail.gmail.com> <CAHC9VhTfOnOgOzGk9==wJYKx5gAi3Zf3oTwbj183o0_xxrfKag@mail.gmail.com>
Message-ID: <akddXpXia0GI2Xvy@google.com>
Subject: Re: [PATCH v4 0/2] Delete task_euid()
From: Alice Ryhl <aliceryhl@google.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Serge Hallyn <sergeh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2026 at 05:12:52PM -0400, Paul Moore wrote:
> On Wed, Jun 3, 2026 at 1:05=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
> > On Wed, Jun 3, 2026 at 6:05=E2=80=AFPM Paul Moore <paul@paul-moore.com>=
 wrote:
> > >
> > > On Tue, Jun 2, 2026 at 2:15=E2=80=AFAM Alice Ryhl <aliceryhl@google.c=
om> wrote:
> > > > On Mon, Jun 01, 2026 at 07:13:37PM -0400, Paul Moore wrote:
> > > > > On Fri, May 29, 2026 at 5:33=E2=80=AFAM Alice Ryhl <aliceryhl@goo=
gle.com> wrote:
> > > > > >
> > > > > > The task_euid() method is a very weird method, and Binder was t=
he only
> > > > > > user. As of commit 65b672152289 ("binder: use current_euid() fo=
r
> > > > > > transaction sender identity") Binder doesn't use task_euid() an=
ymore,
> > > > > > so we can delete this method.
> > > > >
> > > > > Given the problems from last time, it seems like it might be prud=
ent
> > > > > to let the commit have some time to "breathe" in a proper release=
, I'd
> > > > > suggest merging this not for the upcoming v7.2 merge window but
> > > > > instead waiting for v7.3.
> > > >
> > > > Sure, that makes sense. I'll resend after the merge window.
> > >
> > > No need to resend if there are no changes (see below), it's in
> > > patchwork and I'm tracking it so you're all set.  I'll send another
> > > notice when I merge it.
> > >
> > > > > > My suggestion would be to merge this through the LSM tree.
> > > > >
> > > > > That's fine with me.  I'd also suggest updating the commit descri=
ption
> > > > > in patch 1/2 to indicate that binder is no longer using task_euid=
();
> > > > > it currently reads like it is still being used.
> > > >
> > > > I guess this occurred because when patch 1 was written, it really *=
was*
> > > > still being used.
> > >
> > > Yeah, I understand the world has changed since patch 1/2 was written,
> > > which is okay, we just need to update the commit description ... whic=
h
> > > should be a trivial task.
> > >
> > > > Perhaps we could pick up only patch 1 now since even
> > > > if we run into problems and Binder has to go back to using task_eui=
d(),
> > > > clarifying the docs is still useful.
> > >
> > > I assumed that was one of the reasons for splitting the changes acros=
s
> > > two patches (reverting patch 2/2 leaves patch 1/2 intact).
> > > Regardless, we're at -rc6 and with patch 1/2 being purely a comment
> > > update I don't see an urgent rush on this, especially considering tha=
t
> > > if I did pick it up now, it would be for the v7.2 merge window and th=
e
> > > binder/current_euid() change will ship in v7.1.
> > >
> > > Let's update the commit description - you've got a couple of weeks to
> > > do that - and then we'll merge everything once the v7.2 merge window
> > > closes.
> >
> > Sounds good, thanks!
>=20
> Just wanted to check in and see if this is still on your todo list?
> No rush, we are only at -rc1, but I was reminded of this while merging
> other patches and just wanted to check ;)

Resent!

Alice
