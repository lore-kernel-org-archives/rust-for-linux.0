Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F95F235044
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Jun 2025 12:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644687; cv=none; b=XaRNTxnoI6aCMGxPGvEfSF1uq9kFNJCKJMCpBdtAejrpzSX582fpKpivymTdt0BREUUV8Hikak8k32a3UXx5woBImnIb/XMeZb5Og8s8nR1DKYeyRTs11qyZmrrbP3UEjUuu6ZKgx9in1t7Rb5PI/jYbTt+AHec6Q6bqmV7gwcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644687; c=relaxed/simple;
	bh=R81Vn86n50s95m24RM0OKR5tanCo8I3XjpHOkclODVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J6991K3p1WscZ/LRx8kj1JxSCQP3FIC2m3Jkiir5yPw22402TRBb3AMHi3Ltvjycynbs1bpQqSSaImOHbT2d3z4sY2p2x5uR4hQnf7uP3hhXgdm9RI4tpxPRbUgP095Uac18S4HuArxlDKJt98HTNfcQV/Swf5qWzd8kqz3hHOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bDhvnbrL; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bDhvnbrL"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so2845834f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Jun 2025 05:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749644684; x=1750249484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pntxaWNnDpEM2Le+70ckmhHLBJI/hmInZvYIpD60p58=;
        b=bDhvnbrLizjuLIidAszNSvq6JXlta9/PC3M9ppkmwLwDOtyv7tOyj+3wTguQeCUtdz
         uNukMWzx1xh/G3BMxbIZgI5gAFzSzgfhGgrQ9wz0bVEu09OHr8v89G9tyPSf5M24k0d6
         yoYx37uXK+Bb6nYaaIfPNR7W1cYhcAQRfVWJiTZr0ZCmj9NEocIs5MvXmkPZuqEAJ+tl
         SEH2rKrhhDrnEl8atA/5zczVSCNLjuJHfUiCr3b/aO7563yCLD81OWDyuuzYvOTnvAyQ
         pRsSI6QZu5PhzkBGl6sEXYeJQt6+WcBAbgxsNkSnp1RDF8VEeP1MQbD+hCLJ1jzxT3b+
         F2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749644684; x=1750249484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pntxaWNnDpEM2Le+70ckmhHLBJI/hmInZvYIpD60p58=;
        b=dV/88qpJsOp4a7K5rSXOHz881Vfv9xObI5/D87ljgM455NbKy8Ph1hTzyfl4R7bcMx
         /T8mi0bnNLbF7bwssNTNFhuziFWzJBSoADJdlyUp/RIxRv8Z6IH9OtET/866s1Yce1qE
         +gPxd8xZtBo+duakJjJdwa5p2X4yWSnV+Pq8jIkvavASOTmfFo3OyyRMC3vl3cOmDVCp
         T6diBLFPTzKhOwsCy8y+BdZy2eBgajH7nDq7X9kVvOgAqTRgnI3jWbH31cTv+rI3ayLW
         edXPx8G0nMuK3b87Vd9RU1/sOaPkZck3ANwawvhgHxIgcGeVLSEdwJ20XQKflJP4RYJ6
         p+PA==
X-Forwarded-Encrypted: i=1; AJvYcCX5AbxJoMyrBLVwtExgL5BdcTIaURrbm5NNjJmJJG7uDZsJu5BgmPeGG2gCYch5VKK4fftuVgjZ1yFNCOSPvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkkZ7F1MWVMBbCFAyvVY3Q69n5qJ4u+YXhYh9tbs36BCGOj4/h
	Ud1eEEPaIq9cGiQ+B493uuxitK9NNVcEgbK8Z+PblN7K9tE4rNnxDB30eVA+gV9XPTpacbQQd1l
	rxAAPoqfI3XazIQdwPVw6NMlKrM53MBurVEslJ3NR
X-Gm-Gg: ASbGncsSXWePpLUbiMD9YKOFv7UZ2mbISVl8sEdv/MibI9+tl/FaFJfufdHIf4x/Qr/
	hHkb8ZN9FTNOKendpnf3ykTASHc+0z85m05HFx7UQGzq1z+2ADLz+934gaU2DJUcMGxc8PgetS0
	kos5M7I3rstPQsakht8Q28IA/S4gTt3l1v2KdE8Nm2sAA+bHfsntdD2wItPtubScqAEcyv45Mtm
	A==
X-Google-Smtp-Source: AGHT+IHqqDzqPqrx+jJdaiStqcmQC5PY9s0h0hv9Nc7By7zX4EjpLulqZbtZUXuN16xlgP3QnLCnsqEL3ZVHwdnGryk=
X-Received: by 2002:a05:6000:40ce:b0:3a4:f52d:8b05 with SMTP id
 ffacd0b85a97d-3a558af421bmr2451602f8f.35.1749644684234; Wed, 11 Jun 2025
 05:24:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-pointed-to-v2-1-fad8f92cf1e5@kernel.org>
 <HCd56HpzAlpsTZWbmM8R3IN8MCXWW-kpIjIt_K1D8ZFN6DLqIGmpNRJdle94PGpHYS86rmmhCPci9TajHZCCrw==@protonmail.internalid>
 <DAIV6MJAJ5R0.3TZ4IC2KO9MOL@kernel.org> <87v7p3znz6.fsf@kernel.org>
 <CAH5fLgi3B_Wyz2OzBLhHHgWrg7hboyFUcQe-+GUrrvXiX9di=w@mail.gmail.com>
 <GHUD6hpYDty0s_oTLGC6owDPKqrNepeGOL9F-XlvY6G50K8Zptjp4f8kVVnyoTjf-E_0QVeHfmUUvcN-p1i24Q==@protonmail.internalid>
 <DAJHVMM9DND0.2FM0FJYN0XEFV@kernel.org> <87jz5izhg3.fsf@kernel.org>
 <WXoNAlTJvpteJEAZ3TkYKk2QWHBC0oID8Dy3AHGxLEwiZwBPdSLZB4MpdbObLtFvqiN9re3q6OQpiua2uiv1Hw==@protonmail.internalid>
 <DAJOKFHW96XZ.2ANYSSFQO03ZL@kernel.org> <878qlyzd9a.fsf@kernel.org>
In-Reply-To: <878qlyzd9a.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Jun 2025 14:24:31 +0200
X-Gm-Features: AX0GCFsGrjiahNqXYN_wK3WpFvBjlZuqs41dAS1mQAczR2z1DIFyvKRDh3iJ50o
Message-ID: <CAH5fLgiNikpTfm6nvyEJaEspPkMNRQSX2XmBXvXktpXQLutDPg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: types: add FOREIGN_ALIGN to ForeignOwnable
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 2:14=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Benno Lossin" <lossin@kernel.org> writes:
>
> > On Wed Jun 11, 2025 at 12:43 PM CEST, Andreas Hindborg wrote:
> >> "Benno Lossin" <lossin@kernel.org> writes:
> >>
> >>> On Tue Jun 10, 2025 at 4:15 PM CEST, Alice Ryhl wrote:
> >>>> On Tue, Jun 10, 2025 at 4:10=E2=80=AFPM Andreas Hindborg <a.hindborg=
@kernel.org> wrote:
> >>>>>
> >>>>> "Benno Lossin" <lossin@kernel.org> writes:
> >>>>>
> >>>>> > On Tue Jun 10, 2025 at 1:30 PM CEST, Andreas Hindborg wrote:
> >>>>> >> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> >>>>> >> index 22985b6f6982..0ccef6b5a20a 100644
> >>>>> >> --- a/rust/kernel/types.rs
> >>>>> >> +++ b/rust/kernel/types.rs
> >>>>> >> @@ -21,15 +21,11 @@
> >>>>> >>  ///
> >>>>> >>  /// # Safety
> >>>>> >>  ///
> >>>>> >> -/// Implementers must ensure that [`into_foreign`] returns a po=
inter which meets the alignment
> >>>>> >> -/// requirements of [`PointedTo`].
> >>>>> >> -///
> >>>>> >> -/// [`into_foreign`]: Self::into_foreign
> >>>>> >> -/// [`PointedTo`]: Self::PointedTo
> >>>>> >> +/// Implementers must ensure that [`Self::into_foreign`] return=
s pointers aligned to
> >>>>> >> +/// [`Self::FOREIGN_ALIGN`].
> >>>>> >>  pub unsafe trait ForeignOwnable: Sized {
> >>>>> >> -    /// Type used when the value is foreign-owned. In practical=
 terms only defines the alignment of
> >>>>> >> -    /// the pointer.
> >>>>> >> -    type PointedTo;
> >>>>> >> +    /// The alignment of pointers returned by `into_foreign`.
> >>>>> >> +    const FOREIGN_ALIGN: usize;
> >>>>> >>
> >>>>> >>      /// Type used to immutably borrow a value that is currently=
 foreign-owned.
> >>>>> >>      type Borrowed<'a>;
> >>>>> >> @@ -39,18 +35,20 @@ pub unsafe trait ForeignOwnable: Sized {
> >>>>> >>
> >>>>> >>      /// Converts a Rust-owned object to a foreign-owned one.
> >>>>> >>      ///
> >>>>> >> +    /// The foreign representation is a pointer to void. Aside =
from the guarantees listed below,
> >>>>> >
> >>>>> > I feel like this reads better:
> >>>>> >
> >>>>> > s/guarantees/ones/
> >>>>> >
> >>>>> >> +    /// there are no other guarantees for this pointer. For exa=
mple, it might be invalid, dangling
> >>>>> >
> >>>>> > We should also mention that it could be null. (or is that assumpt=
ion
> >>>>> > wrong?)
> >>>>>
> >>>>> It is probably not going to be null, but it is allowed to. I can ad=
d it.
> >>>>>
> >>>>> The list does not claim to be exhaustive, and a null pointer is jus=
t a
> >>>>> special case of an invalid pointer.
> >>>>
> >>>> We probably should not allow null pointers. If we do, then
> >>>> try_from_foreign does not make sense.
> >>>
> >>> That's a good point. Then let's add that as a safety requirement for =
the
> >>> trait.
> >>
> >> I disagree. It does not matter for the safety of the trait.
> >>
> >> From the point of the user, the pointer is opaque and can be any value=
.
> >> In fact, one could do a safe implementation where the returned value i=
s
> >> a key into some mapping structure. Probably not super fast, but the us=
er
> >> should not care.
> >
> > Then we'll have to remove `try_from_foreign`.
>
> Oh, I see. OK, it is a safety requirement. Should I just add it to this p=
atch?

Sure, this patch is fine.
