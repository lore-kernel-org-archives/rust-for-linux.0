Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01EF38DD1
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873188; cv=none; b=WLnEavQZWF2zVqZYtiygkIGbv7V0YjkLJuzLkuC9spTSkhwsPLUsIF2b7i4wV0SUjlVCqvitjLPueMIvmtahgEP3ssxujrQXNtKKam14DjBuWhMvAeOdv96dsBV5IYO4cIw22+SsMGlb/67ANRFZ5ujhLsWNFgLJNlJhJl1+ZQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873188; c=relaxed/simple;
	bh=L3osPo90oS2YjcMtWFuj0/oOrtLAaDGO//RQeyLR3Lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o4xkBbZhzZfLXgZwuUkVFebkoFXjOXasFB1ZDBivItNUXs7/5QaUpnEYcJUbigOwdozSBKzRMAX00TQY0+koi6aw5X6wffBKG8gFjOZFwcy2L4yxJ6TncaFPGsiUuQeHrmhN2xfay62HzTIa49mEuhbDt1zw+R0HWJiINiGYS9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FSA6j/IE; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FSA6j/IE"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385dbf79881so384106f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 01:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732873185; x=1733477985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT81x1pPOl28Snzb/99o88eoaL2m9foxASU5Of2oJ18=;
        b=FSA6j/IEvwxRMhTj0gF0JqdsHenqP87bWORKyTMdCtX97/JI2TboHrYORoa/3+v4ca
         lYrx7WJqJoIkJyl7ylpethKcdCCHaSJMTivNzqP4QhHIP+whYMDDxDKkjtF4wNDCUACC
         J5N8mH6yB3f8rS2ajAV1NSkHFCJ/y53o0977JH8O1eRJWsKiKmseTfh987HoILXXFvGJ
         q4WjQ8fnZv4OznDq4/yTUaNI9dd2YRXw4NwjrpSCL97idM7rpnr4oPmp5rs51RjZ9QSp
         GAfSDY+dswjpaUAXV09YDVSAIP0A2sIuGvJYdrrd7xla2SG94q3gwkjAz/iZrZMUe1Me
         As0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732873185; x=1733477985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GT81x1pPOl28Snzb/99o88eoaL2m9foxASU5Of2oJ18=;
        b=EFlN/9clc1+8ZtknNJtQK4/Y/mqdYZ++DyY/VIJND4H6Vob29ImHkT2o91kTEWK9gr
         Sg7amCOMtW5zLWYyN4jaoOn07ju14R5N79gyBY5IDDLhZeLb49XwUJDsXaseTJQKMCMh
         t+t8RcW8gw30wUdayiS2yng5tfjj7rXDSdt5e29Rk7sxK0T0MeXbHoPykz7vpEoN10Es
         qfso6mu1kdxR+iwUHCaDHxWNy/v0JYvxyBtInL+AdtjfClfvQZv3QutmYd90ozZBt5SH
         rTepD+7AA5zVtqnAt9OiW69VvFECjhaDLleYbJY8HqrwHcfTrK+xUxVSf1D9btW9nfcW
         2tYw==
X-Gm-Message-State: AOJu0YzJ/8TgEVAYOTps99sbsJPhtEhFLpcw1gGvL4UfSR3l6jRpxzqC
	w6aPbsNNH10rX70jeMJ96cFU2MutSP437vfnW+dMSHu2Sz8XfvtpBWT4WMJzu7qsmsUIFvNLybu
	PO1Dr1OQQALbJ4hDuuH15SC7v7XgufrarxOR6
X-Gm-Gg: ASbGnctFr3yqCZD2GFPbe5CHZEpjmtTnDSymTrMRTgqVFLHd5qHi+4Zkf162N0nOSZr
	FGGpfxhHGa3P9UNz3au7lknBuxoua6Y8tH0m8bUwJSQNa6ZdCDMlWUjjQPpUOTA==
X-Google-Smtp-Source: AGHT+IHY54qZUYFh/rP95d81UhUWr1C9OkxG5bJJIM/6YiD8OXmaBDPNhQwhsb79jT1ZPBps/8tz9O4ifcPbEOACApI=
X-Received: by 2002:a05:6000:1787:b0:382:2386:ceaf with SMTP id
 ffacd0b85a97d-385cbd89c39mr5852413f8f.27.1732873185258; Fri, 29 Nov 2024
 01:39:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128141323.481033-1-pbonzini@redhat.com> <20241128141323.481033-2-pbonzini@redhat.com>
 <CAH5fLgjJbzAbf5CO3xjHxcThpqju3j0tNdo+QiGupARVmoThYw@mail.gmail.com> <d7f045c1-79df-4592-a116-01874f402de4@redhat.com>
In-Reply-To: <d7f045c1-79df-4592-a116-01874f402de4@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 29 Nov 2024 10:39:33 +0100
Message-ID: <CAH5fLggHKuYT+s=tejnF-N63QOwcsAAeWb+LDLe0uO1sT3bdsg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: Zeroable: allow struct update syntax outside
 init macros
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	boqun.feng@gmail.com, ojeda@kernel.org, benno.lossin@proton.me, 
	axboe@kernel.dk, tmgross@umich.edu, bjorn3_gh@protonmail.com, 
	gary@garyguo.net, alex.gaynor@gmail.com, a.hindborg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 5:43=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> On 11/28/24 15:40, Alice Ryhl wrote:
> >> The definition of the ZERO constant requires adding a Sized boundary, =
but
> >> this is not a problem either because neither slices nor trait objects
> >> are zeroable.
> >>
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >
> > Slices are zeroable. I know they don't implement the trait,
>
> Right, I should have used the uppercase "Zeroable" for clarity.
>
> > but they could implement it, and this could be used to implement e.g.:
> >
> > pub fn write_zero<T: Zeroed + ?Sized>(value: &mut T) {
> >      memset(0, ...);
> > }
>
> Yeah, that would be I think
>
>      pub fn write_zero<T: Zeroable + ?Sized>(value: &mut T) {
>          unsafe {
>             ptr::write_bytes((value as *mut T).cast::<u8>(), 0,
>                              std::mem::size_of_val(value))
>          }
>      }
>
> ?  And it works for both sized values and slices.  If Zeroable is
> limited to sized types, I guess you could still do:
>
>      pub fn write_zero_slice<T: Zeroable>(value: &mut [T]) {
>          ptr::write_bytes(value.as_mut_ptr(), 0, value.len())
>      }
>
> So the question is whether the ZERO constant is worthwhile enough, to
> justify the limitation of the Sized bound (e.g. having separate
> write_zero and write_zero_slice in the future).

Why not both?

If you change the constant to a const fn, then you don't have to rule
out either use-case.

Alice
