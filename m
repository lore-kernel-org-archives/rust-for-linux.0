Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB69D4D7D32
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772123; cv=pass; b=noMGZiGRFkxmkcWOToE/pLoLxg8HHlNxRoZyd8EEXLLaC3i+zXjzV9rd1s1BTsk59I/mMBVriYdVERrOL46A+24y/FXF48LBEA0qfZ5pLKQLDj6vLJSO4IpiTPYvz45LMkj41aunS92UiYGILXYCwx17+alRskH/Go8oVhKJoQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772123; c=relaxed/simple;
	bh=lpwNY4ItQsPakLJK9TLOtGMCwGHdO/fJFXSgDZpfELQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usoVCVM1s8S470QuFrT1kZnyTqSUuFXhK8URB8dmJrcMi9abaNSXhRxg5ZXaFYXhlK7XdZ1xrtlClpHmnRgjdcvkfwV6suS99GJXrXFxyIjf/SIA8zRZtHMv4E9UzrAEnxkriccqLH+M/J0rBBY9w6EhRbLorOljHEcUrxeV5BM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U426iPhc; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U426iPhc"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e79c06622so570145eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 05:41:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790772110; cv=none;
        d=google.com; s=arc-20260327;
        b=dfhuMsuoi0OAUdn/3qSlvjKno7cThMHwip1TGeCl318AXYpEKZYDhKtdqWXqiVnneF
         DUZwJjS+4/SoF+qTUttqR4AvD2XceC3fmkIsjClvLZpNZPom3uJzHcEkLiD6AwX1/GWs
         0X/xAQCDQMBge+ffdjO6NX5yP78oS4cAi45E7hDKyT4ZsF9CBTB1kKBcr4d9+7HsQi1z
         xkj9TmqKySGXWA5/IlDxBpWzSZ7A9tTKgS394xsBcgVIpaYaQ3w4sU6W+uSdLzkAoKWc
         x+ebB/CgTPoyvKN81OlcgfEom6tyd455QnVyTb/TVaxB5gkXIcWifamh+QOqrKy3RnQx
         3mng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4VQhR2B4f6Hpo8/6oGqxTMWg9JuHEuKmXAqVeCtqT38=;
        fh=c7VUvvihb3mlHXFcGQawWhs8dQpyyLOklEpWixpPy+I=;
        b=Alf84b/24IVR6mQgMBR+78RtuPEpkJqsHciTPNS8T7IM7WRRZNN05ILL38wdk1fpCV
         IoFyDmPN7N6Yvnlo/jI7IA3LE74KQT4XYtdbDcRX0s7NWvvyyfS0d6OoDRSyLaThcKez
         5lwRfRpLDnX4EZhyuAxpHI6FpBg/iwpW4vNN0qoUVoVuLz+BXxhHeMQzLyBxB0Iws8Vt
         +TsIGZoyxCZJcpr7TNAyx7slmhzemLlcDa262hIYNFT4uAZLz5FNRA7NavieXtSyvPy5
         pRP5xdMhsQg8mmt3lUfzoZjeZkGxUjTpFHDrWo2p6vfrrAHXIcY1KuZAL6RyjrQC+v56
         jwUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790772110; x=1791376910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4VQhR2B4f6Hpo8/6oGqxTMWg9JuHEuKmXAqVeCtqT38=;
        b=U426iPhcrN2XT1iN7BsoNyu+aGBD0sZo1H+pg8OYc+nhwGxGr7jmbqtieRrifXxNIS
         vuTGjWOI5Ixp1Hp1uGpTndWFJC/eN/NT669OTevWDi8J7JmY+8Z36FNuNdaUuuV8owC3
         pxqXbZtVADbYqiIZreosGKDQ5tUSO0LSEaQdYitiw1TOrhv8UjwRkp3S+e2Uix6dcbFm
         Sc94XC5w2Ka0SO/oeVqs/F0VAMa0cv3ZrL75c7K7fNwG4WAWZ2BQUHxpGkLaArKHXLhn
         AnMmpIcAnrEtoUqStbSoM8uev5oLpR2rzRL24WezD0pK/LIcbRPCcoJaFCg8IUrSgdPE
         PKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772110; x=1791376910;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VQhR2B4f6Hpo8/6oGqxTMWg9JuHEuKmXAqVeCtqT38=;
        b=ijRwzjuL+Zp8MTooa+pcsmhd1Gp6/9JWYcKNEqDXFxwMkCsfyYi7rWQJTUFfu55eMh
         DKHueL+NPxCM1RXX/ScQFIQ+0/DghSrblqeF48D6Amk5llhYgd2cVi7o3iGgH9ht+0AC
         QxlUqcBDWti7sDg+zkirXpSnuAZINElk9pRgZntirTyZ1JdHO6Y6oLy4AoJ6JBAfdWRs
         NgdAETivTV0Rh30TCWQNaRCcR1CsHoHx1amFVNzStx3bW8ekvIx6Ut6u4gZbSB17tyR0
         JKm9+7Ym63xYEApXmG9cCimBg9tLpMgtMUVOUwG6QgJY7vxqI3P75cYsoR5V3TnSCPnY
         dBhQ==
X-Forwarded-Encrypted: i=1; AKwUvByV//urKqU/1W+uHzIBX0/MDpPjxVUkZxLIgMMMLjvKSKvm8smsdIyt8M7Q/y7hz0b/esy2s8ZrfSreWKcq4g==@vger.kernel.org
X-Gm-Message-State: AFuF++mreCqYEc8se0b3ZlA3OH2xVbyduedRF5Yh48gh0Tge4gp3Swjx
	p35ReNtKLO7pOFilynif8I+V0atgV3LH5rRTJD38D/R6fdq+43cdSfhE0BsbIVnm++NAFivB/9K
	PSduv/mEk8tX9CFJaFgif0OZFxPIo5RE=
X-Gm-Gg: AYBFou0xt4qXKVzGvsSXcIiBvCsY180+ridhgiMz0BRmppWOJwwxoObo5Zyc0orRvM9
	/5P1kKOzsc+Fu2WtMChs88tLMvKGkR4U4uunka30rVUwLhWkcPWCaLAW7RBSFiWpkpVqSwip2Kf
	BwlkHgPXTLMLXGd2PH0vsjcrhFI/cwPzsfsvhcVLjAxL1x/Pz4sLdyjFJGtlZYaJnsw9cFpAvvI
	/Q03RtaKMLrxxfziHI+HDTH6iIT06ltPDYmosFMz6sux1bQH1H5OV6dk99g46WHx9MDz1yl2z9Z
	WjmKMCtQidRVJOic1RV30JFhmFYqlJATvHkxPFs9H17mSm9QV6U9uavLz7a4HhrfMsfqRmxBd3+
	D+KQiheYhaaqQgSWReTJDUq+pvY0SxhEu9NGbOw5pd2/gFXmFA493jEVqUGWS0Z+uwXMsuBFrqW
	rneKITjkm/CWwF1IWuo5GpfXAjRk5WAngiQLjNCuF6QojLAg7wYOo=
X-Received: by 2002:a05:7301:1503:b0:340:f698:fd56 with SMTP id
 5a478bee46e88-34cdbecb18fmr2552081eec.2.1790772109954; Wed, 30 Sep 2026
 05:41:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113192949.689834-1-lorenzo.stoakes@oracle.com> <CANiq72nHOinPTuJ7NLP=X5tLN76uxzz0k5t4tTcU+pz_JOCPHw@mail.gmail.com>
In-Reply-To: <CANiq72nHOinPTuJ7NLP=X5tLN76uxzz0k5t4tTcU+pz_JOCPHw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 14:41:36 +0200
X-Gm-Features: AclHuK_6PgeLG6BwdoZVcsa0OSKE70B150iJ6uNX8SMscLbiFAZtE32a1FCHYWM
Message-ID: <CANiq72=bTO5qsQWqfpgm29eJ8vufBrBg=uU0vV+fpunNsVk7mA@mail.gmail.com>
Subject: Re: [PATCH] rust: fix typo in bindings
To: Lorenzo Stoakes <ljs@kernel.org>, Chris Mason <mason@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:39=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jan 13, 2026 at 8:30=E2=80=AFPM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > Commit 2b6a3f061f11 ("mm: declare VMA flags by bit") added a number of
> > overrides to the rust bindings helper as the change performed in the co=
mmit
> > caused the rust binder to not be able to automatically determine values=
 of
> > VMA flags.
> >
> > However a typo was introduced leaving VM_MAYSHARE to be incorrectly
> > interpreted as VM_MAYEXEC in rust code. This patch fixes the typo.
> >
> > Fixes: 2b6a3f061f11 ("mm: declare VMA flags by bit")
> > Reported-by: Chris Mason <clm@meta.com>
> > Closes: https://lore.kernel.org/all/20260113185142.254821-1-clm@meta.co=
m/
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Applied to `rust-next` since it doesn't seem urgent, thanks.
>
>     [ Reworded to improve title and to fix typo. - Miguel ]
>
> We also have a similar typo in the `bindgen` flags -- just sent a
> patch to go on top of this one:
>
>   https://lore.kernel.org/rust-for-linux/20260930123645.302318-1-ojeda@ke=
rnel.org/

Cc'ing the new (kernel.org) addresses of Chris and Lorenzo since I got a bo=
unce.

Cheers,
Miguel
