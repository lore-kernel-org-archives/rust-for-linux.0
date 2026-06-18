Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A813783BB
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 10:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778981; cv=pass; b=r0azEKnI8RqiixuZU3zjYsorJbMob8+x47aLAOsoKq047PCJs0qD8jOs85Y8diZ5EtUURRUCzubZ2P+x+xRTmMsX9Cp4KcBcnBm3mpVtpMkc9aNtvgMLUY91qY2XkJz2E2yQx/9XRm9o4EAsKNkHytyCBqb1hrJ2HX5JwqoCinc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778981; c=relaxed/simple;
	bh=9tvZ/BnhGfKlwJ9/kPBomoLOpfhRoXc/6hEa47lqno0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jgpr2qnRJ+Szc1FWetdy4Ukj1p7QlcPt1ojrV59Pg5D+CS1au20B3j84pOoFpaI+ZxOGdI/j1dK7zsfnPi84lh8uJ6T6ZVn5udtkEzFqXvgpY3Gq5NJ80MjkxO2C5QJB8oxuZPUh4TWtqNQCu+AAlml3twRmDGRN5lw5nRysu1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBev9s4+; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBev9s4+"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30bca8ef052so64104eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 03:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781778979; cv=none;
        d=google.com; s=arc-20240605;
        b=JIXyqU3KdP0RFXbVhZDZ6EYc65NUd69vNmu7zx/KpYy9jkjt/jwPVN1gOpxkDzhGTt
         2PhUG3YQf9eRRUs5TZcHKnk0dJ8thLPgDqEWsrEh3d9U73TW11loFdgLgC6u2d2XuLZ6
         R89cnYvWV4B3P7GCnE97jOcRcuKoeYioWRjprxL2sOLaKzWgFz7ADixZdyEE03hb/QDM
         AYWqND1zIp76lFmud8x7uMHyfeQ8p1U3r3QlD1KmCw/MzohpFr0I4meS6Q1zXLOlzRwu
         JIW/mbJUfC8ZCPfSesw0J01mu+MhzATUNbZVDUM/mfMsNKKQPso19+fCixizxBPpy0vf
         CoDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9tvZ/BnhGfKlwJ9/kPBomoLOpfhRoXc/6hEa47lqno0=;
        fh=mGNH+V73UOPSvMxIZYcjhC8vvSSm56SYYIJVHQSm7lw=;
        b=GcQ2Bqgz8Cq8ekFVnEtUYObFtCSAkYB4RubnLTzQ9c1IivGyz5dD/5nMZGYNWAKzYV
         DPRWGrz++H8rXmmlJkwmHO2Ppc2R5vxwtggEqskEnDRb3MbPCgA0hKAIaJAKA9qkN/kC
         KgJ1WBnOYNEI7RSmUydVRnVEUol2M4jEmfUDtKkHqfWf/t8KEng+lLdLTD2Rc/TSG4y7
         iOiOvcipjqi08klIVUa/PxYkYOA631BBcgBKguSnoRExnCld9euZ243vwXR1FlYo8Ops
         r90q8Wgtx96RG9qwRMiodfC8Ck/WY65Qk31mGVHeCQ9DdcoJ248tRa/oUKJBN07L6+CZ
         kG/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781778979; x=1782383779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tvZ/BnhGfKlwJ9/kPBomoLOpfhRoXc/6hEa47lqno0=;
        b=KBev9s4+9Afw3XMcCShdY6ZF+78kKD39xUcm/WQes7caZXgEGbYZHoDiUueNdHI1FV
         Dh7iMWhngXsj8xpgB0k44FlmxskqlRhh6cglHvTqLdDGCEJ/MNa89YvXfywCpFbsiteS
         9Zpb+jDm37Pa+Lt8m/JQAbR/tosAvq/WuebVLBqhEhNcq/wr8BLI3JcO2bvFxr1m+ePD
         GXe14ypLpN1j8vFCG4oSi+7qzwu997CgZkJUzZS2LF1TIJTrSN0U2c5pgdqI4Wn7TuF0
         bpJP2xEVGfJ/4OKMC4VUVaaAEbeIuducC7iZecM+YIn3f5IXEWHyg+Edf2x/zE5Qkl73
         4Dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781778979; x=1782383779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9tvZ/BnhGfKlwJ9/kPBomoLOpfhRoXc/6hEa47lqno0=;
        b=cxspUASkGtCrs+BZs0QIybIfycVgWzik7l30RlHpIZyZpnEyMS/k5GrLMKXkizcfOk
         6C0PqXmuqdruyjSA5+7Cnm02CjZ4UrjvuvKuJHArCd6x8iTNTof6rmD+cQJJVgmwERuB
         jQdKC2kuvtHd9Gzn1ABXiupDiVRIslaL4u72UuqNiL55nXbahejUhvZ2VTBPDhai3R1v
         0Gt41R1taIGwafuAdTl+gwUFe6W1IRT6AlwEIN9ddCb2fZ7RjybuiGEq7zfqG047JDFk
         Dcun3U+X4mAFw4VLsU8SlkqvDjaPiv69C5h/smwO6oOtW6DSC4b4fKodkFeWv5sNYrMO
         KjfA==
X-Forwarded-Encrypted: i=1; AFNElJ81gHyxBg0HW6/t8bn9JRlbzPX789i2D2Qds81rW8GGJAWBXViZSBu80Gkg5/9zfVkU8fugNjZCdvXsS3j8Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyZrLzuT31kupJOZoR/FINGcoywYM1Bl14trhPAUyRtEZ80qks
	2utCzq6b0pgnumGrUH2LGKu/aF74mjdTWjg51g3qnKCl6wWHNl+XvtevFS59vb/wh+YaK0daQ9i
	qq8wN399vmbCg4KrU3HANYiSLLIsFgsQ=
X-Gm-Gg: AfdE7cliahTiOy6UX2pM3C4QAaQnD3z4R25sa8Vel9mE0Qgua/s0RZdmtJgn3rQ9qcd
	RMeIJqombhhuT8g0MJVG0cMroXH0/JG0egyIVKoR7i6/G/xIsnhwnR9uTHKZg62qCIstTu6UcDT
	/WU8UlsEGw9KJKvh6mBFc0iqgl32YqzQ0Xk6u7v6+6b1MAuzUbKRA4EinEOq4SXMLpKufOn2qF8
	dtxGP2PWmD3KpwTgq4GoUITqeURqO8FNeJ0aFLNS5029XQc6cLK5RhppQpQleLOYPwhB3MVnkJ2
	+MkLNJZp+jhwkido05XVjjWqc2ApcqoC4B1sZIyVqMZyPGuBaPoGjUhavY3IWGO3pDTrLEqzKYD
	mYj9a3+KkQDeu
X-Received: by 2002:a05:7300:bc1a:b0:30b:e4a6:1aab with SMTP id
 5a478bee46e88-30bf0998ef0mr1272608eec.8.1781778979206; Thu, 18 Jun 2026
 03:36:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <hGNrgHLZgzaLAav_TQCJaAHYX3aWSPyoHeXEf7u3ioJunfoFTIPF9Q8PnCvfRKXq2SS-fNdOn35uMiTaF90nKA==@protonmail.internalid>
 <20260303061000.73970-1-tomo@aliasing.net> <87y0gcf9xw.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87y0gcf9xw.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 18 Jun 2026 12:36:04 +0200
X-Gm-Features: AVVi8Cc9LI2dAv4UeaswFEUf226sgtoqRB7j_Njj-4EH8qRAXm-8nGCq7Sc5gk0
Message-ID: <CANiq72nLyCwq81H-iiDvmfe3SUfPcC+9TCdnnFeKGK+qgHFOnw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: hrtimer: Restrict expires() to safe contexts
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <tomo@aliasing.net>, ojeda@kernel.org, gary@garyguo.net, 
	dirk.behme@de.bosch.com, aliceryhl@google.com, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	frederic@kernel.org, jstultz@google.com, lossin@kernel.org, lyude@redhat.com, 
	sboyd@kernel.org, tglx@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 11:57=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Does this mean you will pick it up via timekeeping-next or should this
go through rust-fixes? (asking since sometimes you give a review tag
but then pick it up yourself)

Thanks!

Cheers,
Miguel
