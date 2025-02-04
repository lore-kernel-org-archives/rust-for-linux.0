Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA2921A43A
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Feb 2025 21:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738703367; cv=none; b=exUmGBxCgzmnwQSW64TO4H+Vni7mqFdea/r+wztMg1Fhhx2ktP/dPkR0WWWZykzpG4jHRL2Jt+r8euojqFNopj5WLexXu8oQ0HsorInC9rZrvzZ3XBt9QJ1VlKF3WWi/AzUYK1YKtXrDUtiR/CqLyqSh1ra4jsXpxhxxmOmfOEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738703367; c=relaxed/simple;
	bh=8JkrkZVOFCHaDqjin9PXTeQJWqvM07LcTV+TIYQ+Qi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBKj+7qCWBuzX2QWFslGJ41hC1oOycOc3IWvWV+khhyesOI9bTcMFPMF8irSY2KdVVuWKZzV+yE2K98ped9NprUrk8sXXnCTVVdXH4vXM9ICG26TzGtUcYaOBU299aAtz4dRJ6n0nvsyvBijEyKjz92A7sQvuSalia4D5ktimp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=h27OHlHW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="h27OHlHW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4368a293339so69909125e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Feb 2025 13:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1738703364; x=1739308164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hU4QrAbDQR1o2bnoBznVmRjsUjgFoPERHNCe0D3R9dg=;
        b=h27OHlHW5fNN3Od2Zrb//yjj0qxlJtqZyfW8O0wgJ949DhuNA2d72vsouaqlLTTHrS
         K1GRk2awzoYzbc18t8v6xpyGusQ8c0z9WCVMOp9kIkwPphzD0og9klmyPGe/BQWw4VoE
         KRvVGVVZj9iOSQobUwwG7yJUuIHktYQK25nxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738703364; x=1739308164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hU4QrAbDQR1o2bnoBznVmRjsUjgFoPERHNCe0D3R9dg=;
        b=mIOylbgG0mmpTLuMa71r5PrfOfHBw3iBTcpJTti+ell6XqB0SSalpaV/tJ/OabCfoa
         MEhudU22qa2b4aC2uPm+/Qh87RuA2E5YoJq6b6MBZ8PrfMj1MxZXB0g0HNTB6n3ta8o4
         whIQSBwjnNbZMv0XeDA3F3bN2fL4Oi+vZ5RDleZElxQClq5RzMvE22WQzlRG03blmtND
         VUOlel95BVMocMw3tJ55VOrx2gr+d5s5MhipO1B182nf0KXNmCHukeUkq/0xiCC0eyZi
         znMWIErTZE1C+/R7/7SL90UiXvDoBo8vhT333wKOxvsPKMgey6QD/SKOGSMpfm5MJ9w2
         LmzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9DDED7fJJED2V7G0dkuT4ZulJuto/XCeEfa0Y4qq9SZVa5K5pLiqEYchFRRjJ59iqpFM1854MEe7rws86vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG+Wq47nzDfm2/8GGnERjCfiH+ZFm6FejtU+22ufAH0vSaIrRQ
	AZbbCxAEpFhxcndhWEm/2OaPQDbPxD0m7SQ5rWpPqhkcKRYDNhMJyOjVwrkpoyBZ5kGSKvNFbHW
	iWelUhiv5hPkJnc12brNoMn66+KSp6CdlFyaRuQ==
X-Gm-Gg: ASbGncs0Ed6Ia3zDxcQ+USEC/o1WokCPKcEMU45nxS012JPJ8AG72LlA6i92s4JD9zY
	6IWHCvhsbG/fU745QqeFISaQfgwF1Aa/vvCO1Ew3P1pn9b35xyFiv8TvrbtnfhhPkRvIAJSBe
X-Google-Smtp-Source: AGHT+IG1wU/phrvdmWOZ6gg4Qkaj9tiLGHlTlII39K2KsIGA/7PJCQGdfM9Y7R/VJVyH/LBFDX1pLGfA1F+6yTJrKno=
X-Received: by 2002:a05:600c:5492:b0:434:ff25:19a0 with SMTP id
 5b1f17b1804b1-4390d5697b4mr753735e9.21.1738703363904; Tue, 04 Feb 2025
 13:09:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131220432.17717-1-dakr@kernel.org> <20250203202410.GA3936980@joelbox2>
 <Z6Jgf-cVt_AlM6Qd@cassiopeiae>
In-Reply-To: <Z6Jgf-cVt_AlM6Qd@cassiopeiae>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Tue, 4 Feb 2025 16:09:13 -0500
X-Gm-Features: AWEUYZmCOUkLm9MpjL2MDd5EZQ1gMNJEykz-KDiUu51t6tTmXr73ZDfIU09FM3Q
Message-ID: <CAEXW_YQQey_QweH+favrXPhrEkVwyqCXRG+UBn-oG6wb+n4+gA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com, 
	cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, joelagnelf@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 1:46=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Mon, Feb 03, 2025 at 03:24:10PM -0500, Joel Fernandes wrote:
> > Hi Danilo,
> >
> > On Fri, Jan 31, 2025 at 11:04:24PM +0100, Danilo Krummrich wrote:
> > > +#[pin_data]
> > > +pub(crate) struct NovaCore {
> > > +    #[pin]
> > > +    pub(crate) gpu: Gpu,
> > > +}
> >
> > I am curious what is the need for pinning here in the patch in its curr=
ent
> > form, is it for future-proofing?
>
> Yes, it is.
>
> It's not always needed, but since I know that further down the road we'll=
 need
> at least a few mutexes, it seemed reasonable to already consider it.

It seems reasonable to me as well, I would probably also add a code
comment there about what is expected to be unmovable in the future
(Just in case any code readers don't raise the same question I was
raising).

The source of the confusion for a reader could be the documentation
expecting a #[pin].

 - Joel
