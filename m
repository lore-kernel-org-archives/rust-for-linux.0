Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E0828C854
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956589; cv=pass; b=h2pEfl/JVNkc9KHMa1JHy2lNJI2VN3gVX3tvu1WlUnJ78CfXZosnmlu3MbOXoe3Y3cIKD/9JvgyNldJt2rM3a3+Ia6ysDpCNHwAdtYfcqHHQt+QQ9DDzY1ITnI6TMRkGIYmsWfPvX8sparOriCt7/oyK+dqeGNtjXFcGdFG/CCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956589; c=relaxed/simple;
	bh=72D2IRlRHtrVJf/yca2HN4NPq1qpvKc7aUcAN06I89U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IeculHfC/2TVQaS/wQAizr9VpldcjFcXSDpb2lU1sYBodaBk4ebBxD2jC2/LU3vOy1kiWEMrHFKnf7e61slSLTg2zdfJkyJ4Bsrj38WI6pGkLbg+CUtKMmymoppNDURsh2pcIwNssJ/phIwMFHeTd8czg/v/MnLiTEoNBqOCSRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ML0r/wnR; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ML0r/wnR"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65b9608a9adso9863611a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 10:09:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771956586; cv=none;
        d=google.com; s=arc-20240605;
        b=OJ8gLoRSFAdFCGCeUkqCrcW/4/MM6+GKJVmnHv0iXggvH/CkR1lhqbljtVGRXXvWHa
         Km0tBtsGuFv4KMcVQUnfMmU9ndwqhmNAjleSbzQJLnU3j6b7buPOZb0yOO4joTn8cQ8i
         SqleN0QKMVKfBhVEGQVoqTzd2bSmm/bsAuWV+VcIG4ch2sZ0jRzi0FM679UG3dXMDltd
         eqyojIlj9od6+XpThH6UOtSM13fhad4iWiyms1nRPBXtrOgCamAaqQFxLRwlXHu0SkDU
         oy0VqPlARjKk/oaxcGtzlPO6LKb2s97mP+tNK5FvmB6QokoEVIjbkZKjh738tRvzlyL/
         Tv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DwhhyosjVD4ndU/41J5291rb2sLwQ4pJdLpkSEJUFrk=;
        fh=SjAyWSWd3Yq+ZZxPWhiJ4sKGr2w1pwS+Q46deU3+Too=;
        b=EK1cue4V2MplCXwfTAeONu2BquvX1guhpIKp/71X0+SSK4fcDKbLbXORzu+M383zfF
         +3uzKpAzt60LGK5LclzIiVuuzTBnYRPF9GOw0bzoFMsmjsYiAC4TQ1FtMC9oZtzOrYdm
         zuulc6FOOt/St8eP9ocwI96dISOQXgiA/7J3b9Kc0eee6AjbxBsRQopGBphY0RNgGyZK
         ZMeueNpj8KkdXepT8RCGd4PYmQ+58uOLi8aAWvxvDyGNEHecvtoe0o2hXlxyn2u32hud
         FProZuZ5naEN2htg3MKK1RTqgqNBe6dukXN1zpw3jTlt2T+nPO32EeSIRDKCvq0h2RgU
         xalw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771956586; x=1772561386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwhhyosjVD4ndU/41J5291rb2sLwQ4pJdLpkSEJUFrk=;
        b=ML0r/wnRdbQ9Bf7az4Dni+fk3RMOXaxHDV0YQMFmDR3GdWDwbei/CfTWKPMR99fw+w
         HkaACGcw/mDcS+UaFb20zO0YsUHTa7+cNfKlAlijp1FI3eySoLm7YaabSOVD0b5Ldgp+
         EwdxcC9OYtAndwfAG/poxApZXZnGEMbfwB9GFVCWeF8t6KluS6VOJA19+pTEgiqjUqsG
         fHamacPbS7uEiJHHDc/83VxGxkclfjAkJZTpvOLkNgxGCPzOPYrf3DNWxZkuAGepmv+8
         Nco5sN8E6QqbsMamiMlGfwJHFmoBoStIrFjqOMMYxkoK4QUaY2+FaWEEqH4MdLgWL2i4
         Bzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771956586; x=1772561386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DwhhyosjVD4ndU/41J5291rb2sLwQ4pJdLpkSEJUFrk=;
        b=h7e7yGa/L9/GYzEk7JVR+DLmk92QHfNbTqDSGvNAg3Tqpm+ATn1PlRQX/37d2Wovm/
         BC7LVq7IaYIHy2ycLtYrt8IXakSGq0q8UVfL4MYkc6MRZNowWOD28wYUL24wJ+lWM3+y
         yqggQ7TP2VpVhSFOKheEgLbMcDCDHsgXKgc6UUe/Nf0aCQucbqea0bIHQo9UisWjzLfc
         d6LQvrHb0jk4GNHrht02FEDvxBEB/gO6vNoulelBSUnH11NagtrdNkhRBpI47n8puLxE
         8kd5tcAAU3cJlEWrSTNRm3AofmDzK0er/q5eh6cB4Qs3SH5RZAuTeyOcq15QYXfaqTHv
         b4YA==
X-Forwarded-Encrypted: i=1; AJvYcCVRkBBHQqUqjbVKvw0E6BaXN1hFrbYMPmPia01OYH98Jopg6s5Jsdj63skgvMxqplmG4E7NbMwrn8Va4VLRRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcq+KUqV3pso1OjdDhhU+X4n0f+lsFJjJ1xt+dK4TtgxRNqnkZ
	SRQMxotPLh07b5oy7V8W6qteC764n6CikmYtzZ2SIQun/Z15GNUe+hSxg9xYfrHewFksCorWjAL
	glZPAj2eRbbMF6ubDmPKvcbVSBnvvZr4=
X-Gm-Gg: ATEYQzyQifOf4GnWtmjl6ypyFbM5ine+dO7xGPthfzkeD5jEm19RtDraDXATXVZwmOZ
	1Sxfn3+N4emyBna6fWpFQ4SLivI9KHsDw7qKiBZ7wyYO/k2NVL+35UXBM7+JeaW2IQS965Pt8cA
	dOs2/sGmkB1oirA2Vaj84h4/yHFjMfg/VSXiEgIwZyh5F+xMlaHP9C7r+DcOlnQ9VnuhevOEEkU
	ymVtBDLH8lZD+Gax6pWYwjIEoPgrQKITSLkVCDIYU8sfa6dZYENVvPaxqZY8nWpmtgv8OT1drJN
	lkpXFo+XWoJMgOV5eA==
X-Received: by 2002:a17:906:ef01:b0:b83:e7e:3732 with SMTP id
 a640c23a62f3a-b9081aee0c2mr808796566b.30.1771956585864; Tue, 24 Feb 2026
 10:09:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224043211.1747-1-iprintercanon@gmail.com>
 <20260224164926.1760-1-iprintercanon@gmail.com> <20260224164926.1760-3-iprintercanon@gmail.com>
 <CAC62b0xq8vg4njbcvR9JLvW+o--UnNHEGNVz-+Uxa90d16j80A@mail.gmail.com> <CANiq72kRoHsLx7GSrRq-OP-mz6Y9nru8UMp4dcvdmNJasGZcuw@mail.gmail.com>
In-Reply-To: <CANiq72kRoHsLx7GSrRq-OP-mz6Y9nru8UMp4dcvdmNJasGZcuw@mail.gmail.com>
From: =?UTF-8?B?0J/RgNC40L3RgtC10YAg0J/RgNC40L3RgtC10YDQvtCy?= <iprintercanon@gmail.com>
Date: Tue, 24 Feb 2026 21:09:33 +0300
X-Gm-Features: AaiRm51yLIJu63S23WXp4dcFyGPrhx0kg1nd_drGzlMBBO8red5rQc3PvZCIvos
Message-ID: <CAC62b0zututE+NYNwVWqR4nXh=UoPddA1ya8TJMsT3LqQUXASQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] net: phy: add Rust reference driver for ET1011C
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Trevor Gross <tmgross@umich.edu>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Thank you, Miguel! I appreciate the encouragement and the pointers.

  I'll look into the Nova and Panfrost/Tyr task lists, and check the
  Zulip threads for open work. The suggestion about unsupported hardware
  is a good one -- I'll look for something that could use a new Rust
  driver.

  I'll also start reviewing patches in the areas I'm interested in.
  That seems like a good way to learn and contribute at the same time.

  Thanks again for taking the time to reply.

  Artem

=D0=B2=D1=82, 24 =D1=84=D0=B5=D0=B2=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 20:5=
4, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>:
>
> On Tue, Feb 24, 2026 at 6:04=E2=80=AFPM =D0=9F=D1=80=D0=B8=D0=BD=D1=82=D0=
=B5=D1=80 =D0=9F=D1=80=D0=B8=D0=BD=D1=82=D0=B5=D1=80=D0=BE=D0=B2
> <iprintercanon@gmail.com> wrote:
> >
> > Thank you for the feedback, Miguel. You raise a fair point.
> >
> >   Honestly, the new abstraction here (speed() getter) is quite minor --
> >   it just reads a struct field. The driver itself doesn't bootstrap
> >   anything significant beyond what ax88796b_rust already covers.
> >
> >   I'm looking to contribute to Rust in the kernel and started with PHY
> >   drivers because the abstraction is well established. But I understand
> >   now that duplicating C drivers isn't the goal.
> >
> >   Could you point me toward areas where Rust work would be most
> >   valuable? I'm happy to work on new abstractions or drivers that
> >   actually need bootstrapping, rather than adding another reference
> >   driver to an area that's already covered.
>
> To clarify, if the netdev maintainers want to have more reference
> drivers, it is up to them, i.e. please do not feel discouraged by what
> I said. :) I just thought I should mention it in case there was some
> confusion.
>
> Regarding new drivers, if you want to work around networking, then
> probably the maintainers can tell you what is needed. In general, I
> would suggest looking for hardware that is unsupported currently --
> that is usually way easier to justify and land, and there is no
> concern about duplication (and possibly arch support is not a worry
> too, since there is no other driver anyway).
>
> Regarding new abstractions or other kinds of work, you may want to
> look into existing driver's lists like:
>
>   - https://docs.kernel.org/next/gpu/nova/core/todo.html
>   - https://gitlab.freedesktop.org/panfrost/linux/-/issues/?label_name%5B=
%5D=3Dtyr
>
> We have also threads in Zulip about looking for things to work on --
> in case you haven't seen them, you may want to take a look at e.g.
>
>   https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/topic/=
Looking.20for.20open.20issue
>
> Finally, you probably know this, but you can always help not just by
> writing code, but by reviewing patches and testing them -- that is
> very needed, gets you credit in the Git log, and by doing so you will
> likely realize what other things you could work on around the same
> areas you start to review.
>
> I hope that helps!
>
> Cheers,
> Miguel
