Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9187C2F0C48
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 00:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768522799; cv=none; b=VBtKnnrZWIcUWt++kOoUPCjQOYllRRhYv/+eAMcDu0rgPmAfa9x5+Zv4FLfsXySmTsGnRN6TEY4XNRXMUot7xDX5ybzaPAsHfYRuLuxDV7Kb+V+qD7QNsfqyC8K8KkaFj1ZEH1xtff4WZXcCh7zGZQn7nAfj0HKOtWy8aq1Yy+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768522799; c=relaxed/simple;
	bh=9B+eJfw1jCNnKc8jUuD9myF3DOVCcJguAnNARQPTb4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujqwKYLZCF4CUCgzQFCVorPtbQRtck8O0EIMU7y7DJFtY0H9eVuZ2gtUQ8rMcWQ+zG/hOXVw3eBgxLXfbavZWLxXiR9ilkOo5XWAEiUSzIhy8L1IWffUROryOHQV61YWv0aHGVT4kcx2qpBbqrJ/l/fGCVPLBAHURJ3A5IfPaXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyY+Mz4B; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyY+Mz4B"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59b6f52eea8so1326293e87.3
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 16:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768522796; x=1769127596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9B+eJfw1jCNnKc8jUuD9myF3DOVCcJguAnNARQPTb4k=;
        b=RyY+Mz4BYFAxiZoiEHN5k/mgQmDNnCwiNNfr8K7ERdTvkwKTX5mO0VSxJ8ct7gLMNv
         xe/OUPZclWEL4I+B4opoV530bQveyJaZxHrzQoG0cSxLJF+yu6NvXjPsk4ld3wvjwMdg
         lX+ITQy6pMmr2sHnlUmrOtmLOmWoniHHu6sRJH790j+VAzSXUkf+HFdhd/MuBHwknKx7
         JP6T32+7WY22X/2GHZDOjUkH0TaRXAf+1/pzuOgbzDyaPouOE/bQd7b+hfcnRsCUesBY
         tGqvwdElQVPLOtS2njQfewvQ1iW7EFRvYuhY7Uqssmwu3GNA2EJaceFezvLo8Y2LM1QW
         Y69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768522796; x=1769127596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9B+eJfw1jCNnKc8jUuD9myF3DOVCcJguAnNARQPTb4k=;
        b=kRl+el/8stzxHcRNxSVUNiV34K4jBTAcjqDeCQf+a/TAKkno9wRb+C79X59nDa+uyr
         mdaxhsblhKYq9U3lbOUaCxVF6Wq37FetTekYT9gbWQC3htQeEyxVgcW+Wxc5EQsFxvdY
         OySdFkkl3wycEBDS0TT0i5uz1sH8EyGEvApHX9M5OiHDx+HdjETVQm6gIqteMgyKACQy
         I8GHcDy7MvJx7IhdUcJPXCbFHTlFyKEiuVvUpuLXJ7rXrTmRrSFB7pZ9DZbGUraTKy6f
         Qf4rkoUUAF0s0WztXr/EY74Zz3eSwhZN8KJrNsBlfXH4SCWs9S0WD9LkAxhOez5+Hs+r
         ockw==
X-Forwarded-Encrypted: i=1; AJvYcCU2mfvqXYtMHiJORMAQU0ahWsdie9IGCnzfRsXFSfT4wBbgUYbmVyPHvgo3k00AQgqDVvNS+wXrP35GtEdhHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/XWvIIMOyWSTFM6FJkEAAiwax0IbY5k/fyCnnN7R8vQ5pFn+J
	0L/wgKJWjSgT+F3RZFg/3fPD2JeC4KfcroSSKR1NCK36tPBGEEzE47PF5nIg0LiaZf2/8jjVckl
	U6S2A3k0nyQ/9xgm5u36+mWN0WC5dQwg=
X-Gm-Gg: AY/fxX5z5CNSH14Y33rbcRnHyl7y/qA2Lu8Frl3o/ZaINNEkxFidd+WY0GkidDUPlib
	IPLCpcUP7gaUR3SG0eebuPxG1cALr3ukoYUpJ4DtbFUWmzpZuKz03VRpGuxP7SMyK01h4uHJlkk
	4RO9EcCTqOwbP8y/bK7ee4b3XSA990FFPUuEbzsLd+ECDDzZ2jPAZzk6fY0TQ3zxL2PKtzr7r24
	BZAcBLL3oF69EjsJ/xXimPzM2AxTPvz5KBGsfxVAgHxBwaYyKBnZWLQecGVsklFMOcBkpoloJ9y
	nGElPs8FBOrA0ePf6QzGedkJWtwqovF+/rvtvGNSXWTtva01vhiZOCnOaqwq+mZXnf/YcQKJsw7
	JO0o57Xl0aTn99xF++yjW3UGFTVNE7aTc5xAi96bmMA==
X-Received: by 2002:a05:6512:2507:b0:59b:b0e4:7769 with SMTP id
 2adb3069b0e04-59bb0e4786amr100269e87.42.1768522795465; Thu, 15 Jan 2026
 16:19:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114181934.1782470-1-lossin@kernel.org> <20260114181934.1782470-10-lossin@kernel.org>
 <CAJ-ks9=kvTBHLzepFUqtYn_FOroP3CU0QhyNwBRyH_tHF4p50A@mail.gmail.com> <DFPIYDMDHC6V.3CT62XJBRQJOD@kernel.org>
In-Reply-To: <DFPIYDMDHC6V.3CT62XJBRQJOD@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 15 Jan 2026 19:19:19 -0500
X-Gm-Features: AZwV_QhggemXpBAZlVR7PJq04hNg99QMrze3LTGGpjHiFes6NtS5xFCK_Xg_EwQ
Message-ID: <CAJ-ks9m-nsn5KTAvSJfu=1kOiKmoadC1X0=zp0GphkX8ZCF53w@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] rust: pin-init: rewrite the initializer macros
 using `syn`
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Alban Kurti <kurti@invicto.ai>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 5:43=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Thu Jan 15, 2026 at 10:45 PM CET, Tamir Duberstein wrote:
> > On Wed, Jan 14, 2026 at 1:20=E2=80=AFPM Benno Lossin <lossin@kernel.org=
> wrote:
> >>
> >> Rewrite the initializer macros `[pin_]init!` using `syn`. No functiona=
l
> >> changes intended aside from improved error messages on syntactic and
> >> semantical errors. For example if one forgets to use `<-` with an
> >> initializer (and instead uses `:`):
> >>
> >> <snip>
> >>
> >> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> >> Signed-off-by: Benno Lossin <lossin@kernel.org>
> >> ---
> >>
> >> <snip>
> >>
> >> -#[cfg(kernel)]
> >> -pub use ::macros::paste;
> >> -#[cfg(not(kernel))]
> >> -pub use ::paste::paste;
> >
> > Now that `cfg(kernel)` is gone, can we also remove it from `rust/Makefi=
le`
> > and `scripts/generate_rust_analyzer.py`? That is already done for
> > pin-init in patch 3 of this series:
> > https://lore.kernel.org/all/20260114181934.1782470-4-lossin@kernel.org/=
.
>
> I'm still using `cfg(kernel)` in `src/lib.rs` for linking to the std
> Box and Arc types.

Are you sure? I'm not seeing it. It looks like the crate is no_std
unless the std feature is activated and no features are activated in
the kernel.

> Also I don't want to have to reintroduce all that infrastructure when I
> inevitably have to add new kernel workarounds.

Then why remove it for pin-init?
