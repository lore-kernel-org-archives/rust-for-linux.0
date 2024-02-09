Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE4625626
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Feb 2024 11:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707477362; cv=none; b=YB35V3b43GAH0OK5Mjd0XI3+oeg0enhX/pdi/lKP1Nh4givEDdjcCxEQfbkJ3JAZ1yY72S8uBJXl4z26z0t9ju56H9REPjgWIPV+tTjPnpH1k7MoJhS3rDX0A4b7Zo2FSV87rYSC+ezx01m4sAFYQ5P591ez8viSbFqVDTy0954=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707477362; c=relaxed/simple;
	bh=RgFHHs7raVYUXy7WupCB2WW9Niv6eFSl7EsJTR5+7V0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vhkb1ItYXCMUf9tqZQIuX1LadD4HTT9loqpgaJZGxd5cNX1PG9D9jV3LDPbBzRpddL41+ZnNqpnP+DCo1CVKLq2MBeRWks86CEAEvrN2/UYpBnWwdhN/0Z4CURla8cSjVP37LwkhqT41GX7OlowCqQwFwLA68x1wAchRqepkbUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2XQae5ap; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2XQae5ap"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7d130979108so357926241.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Feb 2024 03:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707477359; x=1708082159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ed++djY+4BK8SmyO+juBd+LCPHe4DjXsTTMrzEs49OU=;
        b=2XQae5aprUmX57r0mX1D61jjfJC4QRuGFBjm55EMBhOk9cpeUrBclyGRoafg0uwyLj
         XNw2YDQY/JYj7YjCvru0ucM7oV8LQeuJX8mL+AIticoaz25ELU1DUrX/2Kv1vUIdVLgm
         iNA8dXFrZZMfbwKBPXAbI0o8rHsIeu73LnHRVYTKTBV0V9uGGuxwhaLr6piVZLMSWaqR
         1wb8DgqKfXHcTQUU7dCzFk2/70lrd8MG7G3KypbC32/jn/fPZBmz9bmF4kVMV8/vxjKs
         uBJ5GdRI6ssfygG4q/qkegjOCPylKNU5eiE7Tgn+xvX59fJT8VfhNMvXlduHdQwgRPcX
         zfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707477359; x=1708082159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ed++djY+4BK8SmyO+juBd+LCPHe4DjXsTTMrzEs49OU=;
        b=F1wca57LDcE4sb8DAs9FzWns69VqZY2yx9f5cr4q61Rc0eF2BS651ThbEKkUNMHgdd
         r05SxPaPqIVEFpq704TpvPJbHCpP1S9U/3Uajg1EB7rWeA8PiXpaAkQ6OFEAs3nAofxR
         j7Wt3SxWb7b2jlwgJzE9om/DtVBosnRpELBx1OXOpa/MLN2Ik42s3aUb8PBuEW6bEyKh
         GgKdoZWEwfd/FdwSo2JI4OnrxHbFrCGJ9DeojLm2KuDrkydNG3xBTcHj3wFSDi3XVSH1
         5ZPBux5Y8AKli9WhzbbcSvKG8FAD/nI20/MYgjqhTT0pbD45bwjheH6k3rfy+OoN8g4V
         3G5g==
X-Gm-Message-State: AOJu0YxPL7zQPSrVeHiO3OMq2701RfvvwscEocPkHHn7yGecNCBxCil2
	f5uhflOAJ6FqiE2WdfKitKqFHplG/CqwDzqRuS1hBvaU23LAguDk+9gZKTM6utR0YiXnY71FBlK
	7hFvW3lefJzJq+fhmUqMpjt11KPPLIK4dwulm
X-Google-Smtp-Source: AGHT+IH0++n+IHTTWPdJfvdvuEsjvhUJCSq1bKiKaAnFQLdwkCp91mU/3dxy8RDqz88HJr1OypbDDQyyy0IfIB2ShjE=
X-Received: by 2002:a05:6102:1607:b0:46c:b7a8:4b59 with SMTP id
 cu7-20020a056102160700b0046cb7a84b59mr1154577vsb.23.1707477359448; Fri, 09
 Feb 2024 03:15:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208-alice-mm-v2-1-d821250204a6@google.com> <20240208225407.11951-1-kernel@valentinobst.de>
In-Reply-To: <20240208225407.11951-1-kernel@valentinobst.de>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 9 Feb 2024 12:15:48 +0100
Message-ID: <CAH5fLghObExCR55dEozb2MSsPZWd7432z5FyOYmNKHFKJHt8Lg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] rust: uaccess: add userspace pointers
To: Valentin Obst <kernel@valentinobst.de>
Cc: a.hindborg@samsung.com, akpm@linux-foundation.org, alex.gaynor@gmail.com, 
	arnd@arndb.de, arve@android.com, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, brauner@kernel.org, 
	cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org, 
	joel@joelfernandes.org, keescook@chromium.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, maco@android.com, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, surenb@google.com, tkjos@android.com, 
	viro@zeniv.linux.org.uk, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 11:54=E2=80=AFPM Valentin Obst <kernel@valentinobst.=
de> wrote:
>
> > +    /// Reads the entirety of the user slice, appending it to the end =
of the
> > +    /// provided buffer.
> > +    ///
> > +    /// Fails with `EFAULT` if the read encounters a page fault.
> > +    pub fn read_all(self, buf: &mut Vec<u8>) -> Result<()> {
> > +        self.reader().read_all(buf)
> > +    }
>
> I think there is also no need to give an explicit `()` for the
> generic type parameter here as it is the default (applies to some
> other methods in this patch as well).

I'll change this if I send a v3, but I don't think it's that important.

Alice
