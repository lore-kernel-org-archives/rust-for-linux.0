Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268812BE056
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759941695; cv=none; b=soi3K0F6/baikiRMajigoInLx8gQRYVOrlwAY9tgr3he9edQz3VShiK4oKSykn0w+nddDlNMuBDSOuFNvoGRmQpogJ1OiiN5RGyN7tKT2kzLrgDtbCzSl/C3sd5kLy0X8RMgcu2QNhB6nTEpu77nvIYmjH8u8k/s5IePpLpG9Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759941695; c=relaxed/simple;
	bh=QR6dvvk3oaD7H14sYrSs779Fo6D7QZnJQfr7drHcfcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L4dv5hPaszfwsfdv0h2qnO41MI+hCvJrmR/fRDKkhwjbWTXZidSYsbzuzZRmIfApguAIL/sOvFF8PvpZt4LdpX/ih/jl/c/5RmxTnAwfnZ/rU6MJnmaI+KQMjJIPnD9eWtpdLm7GmRGMYaQ54ZBgCftgYfJPNYrTIwsdr3F3O/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eEX/+L+X; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eEX/+L+X"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-421b93ee372so73550f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 09:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759941692; x=1760546492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkUn0bEy7UnVm486p7imiiUaSOovfIgjhU580ToC/W4=;
        b=eEX/+L+XKDHcwQIEFMbr16WxHyxkMSIYDVQGUr53xjFPmfoLwjkYTy//LpfM9LE3Ho
         1Dj/UNlo6B9T+3/0n4qhTISZ64lkznyXxRC6eOdy927iE2J/G/eU71h36URWTtRYfNdu
         h7Otc+iahbAyG/DG+mI50fHlzOPKkQ4DW4e4zlh+Rw0NLw84zlQbatAZRRIbuy1LWbFV
         OqME+dHSovSrNHJobIDSdihWQDG/U54Niedo9K2sST2AOiWFluDbXP4+AnH8l+fVwSJU
         qBXwNJayvB9Vqtp3Vw+tUGnyLB3glz4kU2OosmvlPzGRfthiyCrs1iZ/wAAxDp32C0+O
         rBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759941692; x=1760546492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkUn0bEy7UnVm486p7imiiUaSOovfIgjhU580ToC/W4=;
        b=Yelk3eZSnxbg2W8lvDKRta0zJYtRnonJaEBi2J7QD+hjIFs4t/9GMDHqju6bBpcT+W
         bngyAWjopfDj83QMgFT0HYO5IH2kIF5Wev6/j0utmg2A/WwS3nbhAcaMfF0tpvUJZoRI
         nRdfLFdnw3gtwUPu1dC7wJgE/XUy54EN0zlbb9fROpCwXz9WTVrFBaFVk+aaYmHlpTpl
         gn1J/pzTNkmsdVVlNQBsgffEqorlZ9C/4aKTGSp4+5rUokXQ3p30uFov9vUUCSwx3fB9
         5noQRgAPKB//NcrxLoYe7rCP8V50Jn+5BvlKbE+ZOW2jr1s5RDBslrbj7HRXuM6ntSD+
         bpMg==
X-Forwarded-Encrypted: i=1; AJvYcCUpsIhPQcawzXWlrhQbCqLu2kXn5OFlmIgqooEcczOkNcZCSlu1XTj8C57IgS4bduVGNIjxwAvwtDJSOyvDRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoke3Xt3jm+sbg0FOSwdEEpPcAswZcXYmTeEkczCweiiNIhY0c
	75mRLdFFGQJu7f8Ce/6mH+XB/t4gbfvB45d5x/3JY7yHeUVuBoIS6TVd+R+v64BiS4Qo04gzir9
	qwd+48v2T3Q7tMkQEfgHxK2oKTAf3bb0SOsqJbYJH
X-Gm-Gg: ASbGncsxtkaO6srhk+xcx4uQm0yOqv2vxgHmLAXZfsbJLOurcodfd78klpgdz4ERmtY
	fXQztqs4gBoyoh1LOoNKpdj+zxD3pnqcrw22EggCRi0bjd7GCNruyFgMdvHjf8YUF11QXm8hE0Y
	fwgGFWJ5X1jVjQ+9OX7c5vCWyEVsplcilHcUCAevFRj9riRONfuWcGRwbL0jjyxjcG/7hPmoGn1
	O2CtScYOhXspjLLjYngFehUDwPkmAmgMqkmXd5yavobNxn82vSOU5hd8k5K
X-Google-Smtp-Source: AGHT+IENntzdxU9hJJ0lQZCsCFGj1Ic7MQ9klALciP1L+8DYvg+bOP2NRoNHPHzJOIHdM11CqhWHIUa/Olm+nwWSBVY=
X-Received: by 2002:a05:6000:2584:b0:3ec:c50c:7164 with SMTP id
 ffacd0b85a97d-4266726c309mr3088352f8f.15.1759941692317; Wed, 08 Oct 2025
 09:41:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007-binder-freeze-v2-0-5376bd64fb59@google.com>
 <20251007-binder-freeze-v2-1-5376bd64fb59@google.com> <aOaSA0dPnY2I4a_D@google.com>
 <CAH5fLgiChj29SbwN-5vHhCNzaUa7wewOXe1D8mN3XFfyZr33gw@mail.gmail.com> <aOaTgDMY-VvM_r6m@google.com>
In-Reply-To: <aOaTgDMY-VvM_r6m@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 8 Oct 2025 18:41:20 +0200
X-Gm-Features: AS18NWBoH6tOgrYOnO5M1uMQvG_f-Fy902WmSwfhC4NmactLE-sHdwsTsy9R4Eo
Message-ID: <CAH5fLgha8DdiZ=XyyNRx8Y+GS6SCO2DHF4qMgKwMoq8tUXc3LQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust_binder: freeze_notif_done should resend if
 wrong state
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 6:38=E2=80=AFPM Carlos Llamas <cmllamas@google.com> =
wrote:
>
> On Wed, Oct 08, 2025 at 06:34:54PM +0200, Alice Ryhl wrote:
> > On Wed, Oct 8, 2025 at 6:32=E2=80=AFPM Carlos Llamas <cmllamas@google.c=
om> wrote:
> > >
> > > On Tue, Oct 07, 2025 at 09:39:51AM +0000, Alice Ryhl wrote:
> > > > Consider the following scenario:
> > > > 1. A freeze notification is delivered to thread 1.
> > > > 2. The process becomes frozen or unfrozen.
> > > > 3. The message for step 2 is delivered to thread 2 and ignored beca=
use
> > > >    there is already a pending notification from step 1.
> > > > 4. Thread 1 acknowledges the notification from step 1.
> > > > In this case, step 4 should ensure that the message ignored in step=
 3 is
> > > > resent as it can now be delivered.
> > >
> > > hmmm, I wonder what happens with 3 threads involved where the state g=
oes
> > > back to the (unconsumed) initial freeze notification. Userspace will
> > > probably see two separate notifications of the same state?
> >
> > The way I implemented it, the work items report the current state when
> > the work item is *executed*, and they do nothing if there's no change
> > since last notification.
>
> Oh I see, then that means the 2nd and 3rd notifications would do nothing
> as the state went back to the last notification, correct?

Yeah.

If the state flips quickly, userspace might not get told about that if
it's too slow to receive the update, but that's no different from C
Binder.

Alice
