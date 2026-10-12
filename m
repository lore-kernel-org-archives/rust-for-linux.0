Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BD6CA4E
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 05:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781796; cv=pass; b=Y/8PKJ7Y/l9cZXeim142Vo4KCxwGbH9nXV04638W0AkHQ2AvLHH0jEsLHaeTpFGpTbLDJVoY58fvJviuejRQeyj5+HWRGnbR4HXIYMejGQjpU41P2meJQhIXFYEBaCHvOOQZPYS5jrkVjoK4kDVkhs/2LqPaR2LoWoCxSn+7LnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781796; c=relaxed/simple;
	bh=24RLx46yVO3S/4l0j8Ax4SgaqsibYxvthhEWn7AFT7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H5YLtt83M/+kYtThqs9gekKy0ZkLxpfwzgKRH3vwqyuRgwZFgq0YlJtQN3A01yWH8qxOIlzOeP6OPRjSTfzUDDuaAw49iJDWK5rVlR4Mn59fp0Nvbuv+nCTj60Le57Cg2IlHx+ntgOxlfA6zNBZN3wvJC9jz//P/B77Mzj1gn9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnOkmWce; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnOkmWce"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33c10faf6easo139804eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 22:09:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791781794; cv=none;
        d=google.com; s=arc-20260327;
        b=pghlairy3khg2Q9SXoTt4w6leBp4UKbniVNNj1B4BeQ6LTx4E9xFD8vGqARzsCE4Rd
         HlaclCcHOo0MObhQkRNc3qKmSHK66yXnKdI5i46sh5nGADjoewUH+itGBpmH2fQru7R8
         geqzJWIveTFCmrMtMzha2ATkVXzDlHVb1ypfaD2uErFWTlCjSwChX4UJgEix1VG2rV8z
         SQ7UF5pv5J6p9jWREuSLxVz2pU7C/YFrD1vvt9vtWLwiEPmJWr00YmZ+vUTXIRWLLlBj
         uTWOwJ8jZfdaoGzVREtN95fch8VqKv+CEbqWhopP9IFomemqFEoPKiLqjJqZCmy0QoXI
         yQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w6vj7RibVOu/9479Md6g+PRIocu7vVIJF0plCFV73Es=;
        fh=2fDlyp0Y7F8sc9d/yl/3fGxRqJT7ERZKqFICF8Kyb8s=;
        b=JcWyI5PMZQHH6j/Yp1iFdUMombmuHPpjZ5jPxYAxfXSjw4EaVaHpCE8zMGnAk/IZ8R
         Cfvgcttgla5uVxldpMwDQR7Dl20gfMaclzWYwj4HnHTrMb96wCLeuVdXFBGNzzPawcS9
         E2u3nTJsNzi/KfzCHVjVhxIMNEjoTnaKYqPN5R+UTIDd9vkgSUQKHY5qetbcTjrTYtQa
         nKkyVxswKY0RlTVfD/BMd84XsjcoRDa1dHIu7GJmzaicqaEAasW6co7H6MojjK9VeSXg
         4Bww79KqiWU/4LIew7B0K/CMRqw0nrfAX3dWSep1nfcqzYSp+A68yb2X5urY/bDjDnSD
         sFDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781794; x=1792386594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w6vj7RibVOu/9479Md6g+PRIocu7vVIJF0plCFV73Es=;
        b=LnOkmWceIPPxG1vH/LZtVmc0yM3OHeXxd3kXVLE8IqwuGN5hMo7qGY6RfCfgZOIhVE
         zprOtBCa6qih0oaCBzBM2/PwJcf7UPXy9tmJJ589ItUn/nvAL6k8B72UEXUroaQKULE3
         xqp4QYWMO/fTqqZ5c9sv9aYwUqc3fPSga2GoxSjc1lIRIDzrGK6f5ynjLHKZPXhCooxS
         G/mOMLlFWTnCA4iFm5riiJF45ONGjUk84MdNlaYC4BFyCp0zv/AQ5j5EKYKzeXB9iqUG
         MP9jez+JKi66z+gFfBY392VasGH+1/ydDbgB7DUJKApx0yzJ05V6LNTOYQkq9M3T3mv7
         Z0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781794; x=1792386594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6vj7RibVOu/9479Md6g+PRIocu7vVIJF0plCFV73Es=;
        b=TFvBAmz8y8zr1osbH2/ZI0z6rbmhnn6BQtdvRRdOSKuKQ1AGKpZoa0/Ipsr9pgnwB1
         bwCbjnNx/OlbMYhqR36hU1scj9Vx1PSojeqxewaTVst4PJxEIo8Ta+uVZJm9RYNeVqqd
         xa0UXscN5XDrJ4gGOlcOPvk3NDTwi0a1lvY2inATMSUfrZzgeY3lHGUbVJ25m3GLqIlM
         sJlKnpk6RF5ZKHqJVPOFhGJZ6G9OgxGPsDU+S1W3Kf5gh28k/xDyBbylvl+PIDvRL5N3
         aoTD5mQq2jrBO5xOTdR9NiFn4n9gosSvBvf/VjtGMMXnWI0Pz7SCUPTEfnmoHi7qUBNB
         avrw==
X-Forwarded-Encrypted: i=1; AKwUvBxOkRnfsEueaBk1aw5ZnqWgzQ2x2sEnLDvBcbIsnWZ3P/tnXEey4FsT0HGtNCenNFwal3izqMkqG1HZmgbvlA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKqOdAVsKZJGn1h6RXWA8tXx9h/Buvpkfny8kfle28g3216J7w/
	VQqXZfEfYRyk/2nh5Jw4bw7oKghMaWUCm/owG8V4dZb+et6iQOqbMDZj1flC+I8KEjt1S+TqWi9
	/vblB81pVaOHw42GxNGLu+vvI/Lp2DvY=
X-Gm-Gg: AYBFou2VdvSGjYIGEC+KT8IYRiqIRx9TdlW4Enor6CefwhTOGDMNKbUndZ6rx/6JhUF
	sSrflkUtS6VYhhECigAPQKOFF/FtmIErBaHORohJDnOoQJ8pDco7CY4+MHQKqPJnLjGYls/4kz6
	kb6Z2A31aBYxm9EKGG0lcMERKInQyQAf+DhxAQcwF4wDmu9M7ES7VV/YCBQlpplHNrFreEtTFe9
	uwhc+lmwezWP0ZWsdrR9roxFQSgOqBgpF1m14DwI6QDgB5Qc98rwzbuMwldVgD1lkkIW84IpxX/
	UPNPXraPLumfq7s5jKVRrTOggNUdmT1IctMdiyuBhUkbSWEIt6V1tu+idhm0yvAyIUvt1i9HO8Q
	Imj0NsD5tNRWkiyiSMVJlCEBuv/E+dVh7515sF+tKo+J95zsZ46AJneNHHP95sX+/LYvqxLsY+W
	fGQ6TqWwdTvAv5nmPCNR5WUjTYci/ifSC+R5a9vSE8JE1aQJdmN7M=
X-Received: by 2002:a05:7301:4d0b:b0:33e:6714:3945 with SMTP id
 5a478bee46e88-3537e0129e3mr18929290eec.2.1791781793983; Sun, 11 Oct 2026
 22:09:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ece1eirv.fsf@kernel.org>
In-Reply-To: <87ece1eirv.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 07:09:40 +0200
X-Gm-Features: AclHuK8cT4LgniG0-WsBqPndn4myEbUgPnO8uTgdAvfK-IMr18xa4s_4o7atfg4
Message-ID: <CANiq72mdZ7H68ijH4SL3nzs8Ztw-+NGkVFt_b2Ab02Vu57nkVg@mail.gmail.com>
Subject: Re: [GIT PULL] Rust timekeeping for v7.4-rc1
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 3:40=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Hi Miguel,
>
> Please pull these changes for rust timekeeping for v7.4-rc1.
>
> The following changes since commit df2908090cda368b01ff43709f51890076c561=
57:
>
>   Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/rust-for-linux/linux.git tags/rust-timekeeping-for-v=
7.4-rc1
>
> for you to fetch changes up to 2ea0119f72dba597aa8a98cbdb72c564bfc5cb38:
>
>   rust: hrtimer: document handle based design rationale (2026-09-29 09:22=
:30 +0200)

Merged into `rust-next` -- thanks!

A couple notes:

  - I had to fetch your updated GPG key. In case it helps: Linus and
other maintainers may expect to be told about the change when it
happens (and, in general, rotating them too often may not be
appreciated).

  - Please try to have a main verb per bullet point in the merge
commit since that is the style that Linus prefers. Similarly, please
use ' instead of ` (only for these messages) and wrap the message like
a commit one. I tweaked the message a bit to match.

By the way, I wonder if we want to add `#` to the "Implementation
details" sections even if it is a `//` (like we do for the actual
`///` ones).

Cheers,
Miguel
