Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14C52D7D47
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771416038; cv=pass; b=j/P/GMPw1afv5hLfiPhDpqSEjWo60rjsAaV4G6DzzTMGLlqAE44pAvbRiz0DacBb2rvUbDlGpPzXjnd/kOukgEZNa35fk4QIysSHRXCYaXLa7domCix4gm1ROGQXWRCj4+yj7gZ5k7uCNSIvjRwbvGUMn0j3Y88GlaWx9iw4ty8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771416038; c=relaxed/simple;
	bh=btslubZ/9JP6i07Mj7sjLWNQ62cOUbXfTXhiFT3JfkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OPcE1gU6AHSyePEPix+8Auf+taKZVKrio5A8+5sGw3xtO52yIH1o6dsLLE2EHcDdscMN6JnHr/OefBhWbb9cT13kXZ1gIMOZeY6HcvAYHBarMBHtjLOwipIWTV+qZcAJGvfvlQrUEmXW20FxBGEe3ot3E4MuaHuwcxPWaoYJLNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nbIRF0Bk; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nbIRF0Bk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4807068eacbso40498175e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 04:00:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771416035; cv=none;
        d=google.com; s=arc-20240605;
        b=Arp3L0J/tWIVYQ7Kya0zygIFohKNFTv5iJMKjWA5X0G6rYbnWFOa73j/r2v8QL8qBE
         Z/BsYx4dz0gJHZGIawTj5utoAwyTta9iiidbvqLJEQXnbzkcWjHGfl7bMwh6oJ9tnJ5W
         FaCJcQdl7X69lZo42DvpyAA1CfiLMb++pL7z0duo3NU5SxCWN/WOXZHRDVx6d02bTiAE
         xQJjkbn9Rql5V93PhEWfmx53EErecaUESELWcIpWpZn6R7wAo33QgeR7Bxzsaei95MQM
         /oA2Yrh20o2h+WGe9Tq9shi8ffa/QdP3Wot3Y/Xnq8TbGYXMQ750N5+Cn0rO1sYjFClv
         nS0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nIWl7aXfgGtJ3exLV9K3pfaZC32QHoeh0z91VzJokww=;
        fh=RhuOMv0xhzLy8Me1Tiu0ggJRqeTYFmDSe0GxhM649ao=;
        b=WyofW0sPYexw9q2BOQ+dBF4xK/cuJzvBhJoZMJbIIl7/I2nInD0bMmzHCOSWdCgs7N
         PQcS9hC0ZkSWOJXYbEkVKleUQuc+7XEsoPrgbftpYLltGIYAer5/lZQXuUiHJGnuveOY
         sJDJFZDmmwqOrZZORslJ3RUr8hpnMT0Q1ZvvmN65lmVHQ63NjsZ8QJvDxkH2MwpKdkhP
         Nm9i+iw+kwfKlAKSsW/ACTqbqQk5v0h2cb8lBa5obW2orgRBIBtGEvd0uU557ZrKPyml
         j3/qcQxkfPtETDFrJGoJXXNS+VrYs6qsd8UWyHTu0Gd81lI8pAFnLEtzbQS52zrk8f/Y
         fH9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771416035; x=1772020835; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIWl7aXfgGtJ3exLV9K3pfaZC32QHoeh0z91VzJokww=;
        b=nbIRF0BkcJGekEIuIDSvVN6ilzKvQA1BoDFI0jMgiZI5X/g8/gdYSYTDN1HnclsJVP
         f+RyyKJrmXKLQBZQ2Cagl1w4K5JTUzNhZeuiiIbVxH3q5jEOyNuG7qH96dSgcSmP448y
         IJ310wesUOHGdzy37wUBZJ1hp8aZL0HTX2ifpDpwAkiCtwyUbeP0JEQWDOpUfFaMWc4U
         ZAl/0eIU+7ZpHCohNwZwwGXLGElPIu74oyIzQZRWO4E4FEmNNHpUuK92yuhCr6otRuki
         hU7j5uZRmo+YIsKBgOyp6uvDb8Vl4dA/Lq4QkOrNQvGMXnPIZR2UD370eedzVUDqfHm+
         Rfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771416035; x=1772020835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nIWl7aXfgGtJ3exLV9K3pfaZC32QHoeh0z91VzJokww=;
        b=D+f+Sz2+WAqDMxfhzu95EkSVWo+fCaLi0/J+UK0fZ63ZGC78Zkm5gT9IzwQoZAKFva
         y/GGQygzpqzIAvP4TTi32yOmTEpXUkda7aosQ4fjFPM11M14btiTeHsow/j/n/IijYua
         Z5IW0rvMzG7jfOF2zmOqQKFmVXcKezQIUWzg8TuiLh0cQPzELQh3upmnmgdp5Svxa5pg
         vv76XOCw028zTZvH0ZT/p2UHg7BnQlUlUuzWXJ05EE0dEocg/n5pnlRRrhzJcJR0b/vl
         xWnk/4Wph1du14DB4RLwHmy841iODUwzaOiJv4C6Di+v5x+uaIjSMInkQ+F8kNuFGGpK
         hKHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9CH3vukZ8zaAjBUzURQH7jNttAVRYZxP4LQfe/Lxx+noBxmLRd6u7vuUHhH9blTJbUI77c7+xaGJt/fY3yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5p9TFYb5YXR9uGNd05WH5/dRbtznaah8C4VpJM4ibfCRrCpWZ
	I334E1pJopS5khZPksQ2gBHz5xmwp+9khDdEW2INEUbYEyDLNOcdvnod6WADXIAG3yEF4QHy3UJ
	bkbMgyFXw2BUlSie1ITb6v3I72x7koJuPIEORLOyv
X-Gm-Gg: AZuq6aLpbCEHPzIUCCu0pr1zQhESMNRsSoWiH2mU9om6+koni5wYJyLRm6ueGxSger/
	WEsEBGF5Wc4n6BW9tbxlxby9bdKy15j05oipYpml9JJ+ugagXxBDTLC6rffkMnYjkVsgVkI0/7A
	LJ8KflhyXECome8roDbQTCUs4NaQHdiQGwWrqBY/SC9uieIa/aCDzWNRV+3e//M1HSABNXNR1v9
	klIDzXrihZPutcn/zRiz487P8IPF/OMfgulS/wrMnHCbVawJ18CW0sqPD1F8YXP7RkfZb0o4PX0
	LKIPSkyYywn/ho3aGUBp50+Ojusyw3yLgaHb/N/mYBPhR69eXBfk8YyhtCsP4xmxSkKsTw==
X-Received: by 2002:a05:600c:3f14:b0:483:78e1:784 with SMTP id
 5b1f17b1804b1-48398a433abmr28986405e9.4.1771416034697; Wed, 18 Feb 2026
 04:00:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org> <CANiq72=5r2miRm6GWszb2gDNi4k5-RZUzvdOdFQ3yyndvmHbAA@mail.gmail.com>
In-Reply-To: <CANiq72=5r2miRm6GWszb2gDNi4k5-RZUzvdOdFQ3yyndvmHbAA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Feb 2026 13:00:23 +0100
X-Gm-Features: AaiRm522dce7ntc1e6TRegCfH-Fit-vrZloDiDJY77NewyDthLo_cZ6PwPQcfvM
Message-ID: <CAH5fLgi6NVagOPA_=r7Dmk9MFXrvZVuq85D9bsJfUqLNOZjCaA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 12:57=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Feb 13, 2026 at 7:43=E2=80=AFAM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
> >
> > @@ -282,6 +318,7 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset:=
 usize, len: usize) -> Result
> >      /// # Safety
> >      ///
> >      /// * Callers must ensure that `src` is valid for reading `len` by=
tes.
> > +    /// * Callers must ensure that there are no concurrent writes to t=
he source memory region.
> >      /// * Callers must ensure that this call does not race with a read=
 or write to the same page
> >      ///   that overlaps with this write.
> >      pub unsafe fn write_raw(&self, src: *const u8, offset: usize, len:=
 usize) -> Result {
>
> Coming from:
>
>   https://lore.kernel.org/rust-for-linux/20260215-page-additions-v1-0-482=
7790a9bc4@kernel.org/T/#md120cdea73132fc698bf69bf3d69287c2cb28449
>
> Leaving a comment here to avoid forgetting: I think the new bullet
> point here and elsewhere is not needed, i.e. the first one uses "valid
> for reads" which I think is meant to already exclude data races.

That's right, valid for reads implies that it's okay to read it.

> > +    /// - For the duration of the call, other accesses to the areas de=
scribed by `src` and `len`,
> > +    ///   must not cause data races (defined by [`LKMM`]) against atom=
ic operations executed by this
> > +    ///   function. Note that if all other accesses are atomic, then t=
his safety requirement is
> > +    ///   trivially fulfilled.
>
> And, for this one, Benno said perhaps we should introduce a shorthand.

valid for atomic reads?

Alice
