Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B1F373BF6
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 06:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211499; cv=pass; b=P0T9/UkGmzFqKtJ++Ii+J63XC/RHetnmvgoW+Hdo8qOEhcwP6VAtuluaiNOjAdBQXAcYN8g99no5GfdsBFvI3Z+oqFP63MUT3FKsADSlbdtcETrKSbBTcjEHVBYSA9jxmbfgdeJmZs0ylG2FPZvW4KTUvCoPjYVCZBLgkzu8BwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211499; c=relaxed/simple;
	bh=248OoCo7+fzLyhDNVzNmZpXVzrhamhNuhmuXYL/xmzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=t1K0QUKzdeAiNDDykK5uUKoKdoEeou6VAqlF+FwyhUrGd5YEbjbckd/6jSN0rpmMu9DVL0DIiBcViyTIoA1Nxp+N0EGW87LLgNIs7u8ZwOyk/VAB6IqnJ8DltwSf+Yt7Eq5ScfmuxeNcL6Zqr/ZWnJ+s0KzBmCc0jnqvWxa2fug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7IySEjO; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7IySEjO"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b96da7b2e2eso552552166b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 23:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773211497; cv=none;
        d=google.com; s=arc-20240605;
        b=hg6TsqW+NROGL8wG0mi83BvE3Me4q9gz4aPVF1i2bs7W4kWg2Y0QFZreTr1M6jjGII
         AdzQujt+pHvk1etNN9XHztBPht98faobzsRZtBjAimOJB3d7LxTysApM4QWIk6K7AuHX
         qWVyKsmq18A3fIoyEu8vMHe++U4JLEN/5x419S2L3L6kdjuDEy4dZi5Vgk4SaoZvpxLD
         nGDMWITxjTqRbQ0VfVw3YNAJRtlsJ3YHKIGuXO8RBZyIP97818GU0PaJYobimSU4BUZV
         PziHifP1xnnJmF//AAp9IVlFyjtDq1l01DZ+d225cv5y9rzCQWkHCJsGMYK2D3IOX8ay
         77nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=248OoCo7+fzLyhDNVzNmZpXVzrhamhNuhmuXYL/xmzI=;
        fh=DIUVqo3kZkklgXTxsIc8jtVXiDuZzlCXcLE4rDKaJF0=;
        b=REJDSs0VAXh16EqquSTUWwWeXIG2u8BJayUZMojG5TxEfnOfeVcwv+dhLVrsgAY0Ez
         tkLDyeZ54lJZl8+GQbdLWNnvB3/Lrc81IFV8EnvffcujOoFKiWrySfqbc12xFAz5DU98
         L3DkQCbsbrJVrqVfP5UhppudCW8r6z+fEVs1qzirllGnBvsnqIGnlU9q97fCmsBxxLX0
         Y6SVhRzTZrHL/Fq6arc6sLZtIatlrRe66QekX9ByCx0GFpXJsx5hEJ4gPt28lzD961du
         DM+P6dKmfWOqIhzziQoZsMBxBp2JhOFv1+K5ld4NOVo/LzramEzDJRJegb16ILyKb9ip
         rpaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773211497; x=1773816297; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=248OoCo7+fzLyhDNVzNmZpXVzrhamhNuhmuXYL/xmzI=;
        b=E7IySEjOmUjWIcLpaNUpN3f0c0CRnMEwDwb8xaiFVL4lWA44zhDqVEykl1S/sRxOPZ
         5Ow4RReWjDGfOdmNwOa4QPk4jR9M7qF3CGlJTTlC2RH1xsCb/B1Wfb3yArnUaPs2qHsF
         sH5ReVGIvFr3oK/IdVFSKaI3xa9dzXuUs0iSEYePNmKuZDgicWpWdCRwcq5sakbZTHmX
         w7ZfWF9ScTnreziYiQN1VPqWPq5xkLqMHNLhwbP8T11Ib33YKUXgPbXLc/5xoJonQOXo
         CFnZfffWOtHpHkc9/hsvfMLeGeW/1TABK9GV1TxNU9SGdiJFeFRfAZFDiaLLfH57Z7+X
         ckiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773211497; x=1773816297;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=248OoCo7+fzLyhDNVzNmZpXVzrhamhNuhmuXYL/xmzI=;
        b=NQeBjG7BoP0n/EW0+9Jx+XX0U1bRvkuRqToWpH29jjrrLfR8tCSADB94yOfwb3u+q1
         Gj+eJP4XHPVhbaRrE90rqNn4UU9cRSUyEnFH+cWDRFZpXVOEzkYmzP4KMgwhVXmevusx
         qTsCD0uBYf0iM+v6XEf9i4wnmO3+ba3ekVPg3Q3pnRlSesnxoQpoLiOLTbvNuoAJ3NBc
         mMjyo5m+CNoCYfv96aDlZo9/MgceVzHp7+GOAbuoug8/BypdgG8GqS8JCvMLhHAkoqko
         kTM1hB4TfbMrFro3Md3QCrvF4awEo6kYL+xVb5L/3OD0p5ZLCDKyyZC3GCNnJ5e/1GOU
         2EiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp336Pnbne8p0KW7t55KDfuON7RIF9Awbgv4CWGSoUrNebaS5IZKTFLNtRqG00kpxgjRLB+4flQfNzWiv4YA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/MbETWnXk5guT5kZ5OEGRbdF0J9UQVGUnqdQiLQlLK3SihtIX
	/e/Q4gKbS/5fC7QjmTEC/XquoL2ildpkw96Wsuae6ZkHh/ruA0T4w7kJAIL+MyVl24mlaxHWj5J
	NqWlisuuQ7jCs3sN2AjTDdIP9RDiC2QM=
X-Gm-Gg: ATEYQzwnAVLtIzATqasMw3ZtuzVqKDBeurkruBNqtyhAXnHOT4fbEGiKB1h5DBPg/ak
	0DoqFIjK8mwe7vtjfPJxg8beHmrXuQow9/355hTGHl10W8SXv3/WmdsGpJfWzg/SIRuLC6nWmFK
	yMdM5xuHARJ35Gi2g5zlWQ0Dub22UUrOLTdNsM6kCHy6y2YWJOgNIOnBmvECAF/Xh0GnHG0skFy
	l+2B89q9OLlp2xTIUJbnh19r4zGW2rUmsmvUI6VDeS0b1yh85UdTwdwivvp3g71tBph70+tmH8y
	kE+Pld8dN7nRfYgZaYD/9QsbaXLwDW+7c74M4/rAiOz3dA==
X-Received: by 2002:a17:907:3eaa:b0:b93:6b41:e394 with SMTP id
 a640c23a62f3a-b972e1637b4mr72442266b.3.1773211496208; Tue, 10 Mar 2026
 23:44:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310095710.1166-1-albabhasan276@gmail.com>
 <CANiq72kO1jmF=4PZY=v6f=ckBOeQLBAmwBcjZcu8ht9suxQfKA@mail.gmail.com>
 <CAM9eepV-3Oh8yY4JaLtiU9bbxJfA+Kf9m-yZdOuVfp-pHQ3+=Q@mail.gmail.com> <CANiq72kqq_WKFPLkcykv8WbhVWmDt=g0dYnjZUYEehxMrmkOQw@mail.gmail.com>
In-Reply-To: <CANiq72kqq_WKFPLkcykv8WbhVWmDt=g0dYnjZUYEehxMrmkOQw@mail.gmail.com>
From: Albab Hasan <albabhasan276@gmail.com>
Date: Wed, 11 Mar 2026 12:44:45 +0600
X-Gm-Features: AaiRm534r4W6nmncDZkNJHe2AAwwVqYhxA7khg7kPi_xGzupbZRp1T_Z7LxyDvI
Message-ID: <CAM9eepVTrzVNPGC1yZn-TwuK1SHM6H=acVGtMiMmHs2epr+Q5w@mail.gmail.com>
Subject: Re: [PATCH] rust: transmute: use split_at_checked() and split_at_mut_checked()
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Mar 2026 at 01:53, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Mar 10, 2026 at 12:59=E2=80=AFPM Albab Hasan <albabhasan276@gmail=
.com> wrote:
> >
> > Thanks for the correction. I'll wait for the MSRV bump to 1.85 and reba=
se the patch on top of that.
> >
> > Also I should note that a similar patch was made by Joy G Majumdar but =
that received no replies and was not merged (possibly abandoned). I forgot =
to add this in my initial mail. I hope that wont be a problem.
> >
> > Link to the previous patch: https://lore.kernel.org/linux-kernel/CABJmq=
zutbhyc5yiE_+=3DM=3D+gPCo=3DrYWZ2Tc2FhjMvC9QzZPuEag@mail.gmail.com/
>
> You're welcome!
>
> Sounds good -- I would suggest replying with "Reply to All", since it
> seems this reply was sent in private, rather than to the mailing list,
> i.e. I don't think others can see your reply. (You should avoid HTML
> replies, since they get dropped by the mailing lists, by the way).
>
> And thanks for the pointer to the other patch -- I didn't have it in
> my spreadsheet. It seems it was sent to some mailing lists that don't
> seem to exist (except for the LKML one). It wasn't sent to the
> individual maintainers either.
>
> I would suggest mentioning the other patch in public, and taking
> perhaps the chance to Cc the maintainers (using
> `scripts/get_maintainers.pl` or e.g.
> https://rust-for-linux.com/contributing#submitting-patches), plus
> Cc'ing Joy so that he is aware of this one, and perhaps you may want
> to consider crediting him (depending on what you think is fair, there
> are several ways -- please see
> `Documentation/process/submitting-patches.rst`).
>
> I hope that helps!
>
> Cheers,
> Miguel

Thanks Miguel.

I'll wait for the MSRV bump and send the V2 then.

I would also like to note that a similar patch was submitted by Joy G
Majumdar on 2026-01-05 but received no replies and was not merged:

https://lore.kernel.org/linux-kernel/CABJmqzutbhyc5yiE_+=3DM=3D+gPCo=3DrYWZ=
2Tc2FhjMvC9QzZPuEag@mail.gmail.com/

I'll Cc Joy and all relevant maintainers on v2, and credit him.

Thanks,
Albab
