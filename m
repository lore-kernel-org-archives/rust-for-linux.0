Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1430C3064A0
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Jan 2026 11:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767957485; cv=none; b=S3wWGlY92PgDBbyOjskvO47cKbfuAbJG+tKrzzuhXJ8TUc0QwNDOLxfdZ5kdy0rVak0zvOvCJma4oUcKGUlAAVSbQCDuSHVSpj3QUi9us1s5cXQVzBF1PViKNPQ61cjd8tbaY9mWaAKiGNKdq62KS/S9h0sMgUWDqG1qSwQEY5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767957485; c=relaxed/simple;
	bh=X8/WMKVstLlblwrlkCF982nlFs5kTORZzTZM70moIEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jdlo9F2EslGBphEObyjvNBfYAXvmTJxcFlBQh4TrTTqwgkvfvEvK5DJeMFndjlkdfotLOlDhW+daGm1HTv4v1sRER68a9OaJOZ7PUwm3/yJQaLKwWDifJEDZo8Job6LunibG7nGBvx/duQguJwLcJyz0PFtJPdhaG1sGnCUO7jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QA16CyRP; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QA16CyRP"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34c27d14559so2485868a91.2
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jan 2026 03:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767957483; x=1768562283; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SjUDjcQuilw8JIwts0suK0wZjsghxEmkzGbdS7ChzGE=;
        b=QA16CyRP7H/Wlry6MfMuzr71lxJBipC+VLGDnAFTFJDz0knTauZoKZka5CE+021wbc
         66AkzZWQNJNe+rNQgA4A64bMch85eDpdJYSyXW/Fe4dpuq2jTdNrrUI4jKFesP1Bm8Vc
         7oJaOr8WCmUGvd+oNqUaCYiIZ2PjggHuknvXUMcuZhLVi27+iWHLPdSe9a4t8NistLWP
         Ma9k+EKfiM4i7CL28nLQ6WdhOIiDq5dr4solqjUr6btS7bjZb8Pfev9A/ALhIN/HJrgp
         NcGOmDJwdjIntHQ4uZlDhL3ze6nhXAAh+/KnjkjJ+/recf2KQ/Yhd38RoQ0oVx6dQdJj
         T8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767957483; x=1768562283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjUDjcQuilw8JIwts0suK0wZjsghxEmkzGbdS7ChzGE=;
        b=ZBmZMFmkJM765nuWEfV/CXKgdOQVM5kMCApYC3I844Ma+Yr0yhzHk0z/uQBePIfO51
         IpT3QvOQa4gF5blV4pRht5xzq0vVWOLdOhgXLIfHn40/v6DISTSTMGFR6BVG2SY2IFZ7
         biGWe9eng2k/q6lLI3flM/FDlygvtLjHfbtwGAPRrce0UmL2zBgcW+De2dEvhxa/Q+DK
         0E84DpdvhhnaevkNcd2eM5dhHMA1UD0TDlmL/jI1qQaM9xQJ+cLKUxpSQzY9X4PUTHRY
         0Aouomz9++ouhtBgBrrJyyTrM9798d6jfD/5Y4j2D7QZZ13kFTO6Y7oVhEPCUXZ9/UTh
         XIMg==
X-Forwarded-Encrypted: i=1; AJvYcCVDTERbjMsiE9UAfC1+jXCHOeJfkN+KldV9TjQ4Ljv2rJ2N2eOik0VDJeTFanMCzn++oB+sx1ZcFg8eVVOpYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy94KmD03nNM/muaeJaUGxpGvoCVVsfaP1pve/TadeilVKwr5R6
	ohVRCzm8lQShymnDWWtf8B8UM1CDcctq31T8o267WUkUnWcedrZ/VK1DqrSjiMheTDla1SCil58
	9bu/alvDaukZlXRaN4c7uvjtdTt6foSs=
X-Gm-Gg: AY/fxX4mhPJLyy1nFVdvurFbrZvnHFjUkAHJibYFx+FNdEa3WIHR6mnrx7iTkiUvhgG
	u/cEgvYJ530efKrH542s9TqNYUGpHDz3lveflx0v9K9UOnA0UB2MisrKLgtPQPe/kbARkaAO7Yh
	FCwl3u4lPsmkvsteH3inYroYKr9cEfbM2cUPhAQWO7NTdEdw2KJizls2Zpl+U5qxGyRY+XX6uld
	wT2Uf6PSszNhdHM556kVzCAAJYFR7C0FRNiMN5JWqRUNa5OwH5clIrJCEtYTjZhIXCpNMW6//64
	lq19cx5zYpYX+SGK+M4kUsydVOA=
X-Google-Smtp-Source: AGHT+IHx4oPTkZGWjnk/fIhFxWXX8VfQz8sfZRQ1a4hPiuCQQJTajebNqbmfM9bRR6L7VucF04h2carmFdn7uSAQrXw=
X-Received: by 2002:a17:90b:5846:b0:32e:a8b7:e9c with SMTP id
 98e67ed59e1d1-34f68c28180mr7896138a91.29.1767957483181; Fri, 09 Jan 2026
 03:18:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767818037.git.foxido@foxido.dev> <a119094f2e248587c541daf7c5b65bf4398b281b.1767818037.git.foxido@foxido.dev>
 <CAKBF=psGUwgr7e+EM1d2OAv8H1A6zKfhQaSPS56vVcnc=Ez_KA@mail.gmail.com> <622213c0-1793-4b1f-ba9a-aa99f73047f6@foxido.dev>
In-Reply-To: <622213c0-1793-4b1f-ba9a-aa99f73047f6@foxido.dev>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Fri, 9 Jan 2026 13:17:47 +0200
X-Gm-Features: AQt7F2rayWG0pZpVs1FxNxeC6wOj6LoY8YXn2LOhC92JjlEG-eQdaJfa_fOGPrk
Message-ID: <CAC=eVgQNvsGWSbnm=V6V=S-gQ75kiw7=JPwOsaTDKQPwoXqEAw@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: add WMI abstractions
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

pe 9.1.2026 klo 13.12 Gladyshev Ilya (foxido@foxido.dev) kirjoitti:
>
> On 1/8/26 22:48, Kari Argillander wrote:
> > On Wed, 7 Jan 2026 at 22:56, Gladyshev Ilya <foxido@foxido.dev> wrote:
> [snip]
> >> +    /// WMI device notify.
> >> +    ///
> >> +    /// Called when new WMI event received from bounded device.
> >> +    fn notify(self: Pin<&Self>, _dev: &Device<device::Core>, _event: Option<&AcpiObject>) {
> >
> > This should be device::Bound
> >
> > Also probably _ marks are not needed. I think compiler does give
> > unused build warnings.
> >
> > I do not know reason but usually other drivers use this over self. And
> > device first so this
> > would be:
> >
> >      fn notify(dev: &Device<device::Bound>, this: Pin<&Self>, event:
> > Option<&AcpiObject>) {
> >
> > Same also in unbind. But like I said I'm not completely sure about this.
>
> I thought the reason for using this instead of self was because of the
> limited set of possible self types in previous versions of Rust...

Nice. Didn't know this. Thanks.

> IMO using Rust's self is more readable

Agreed.

> >> +        build_error!(VTABLE_DEFAULT_ERROR);
> >> +    }
> >> +
> >> +    /// WMI driver remove.
> >> +    fn unbind(self: Pin<&Self>, _dev: &Device<device::Core>) {
> >> +        build_error!(VTABLE_DEFAULT_ERROR);
> >> +    }
> >
> > unbind should not be mandatory so here just do
> It's not mandatory, that why there is default implementation. See
> https://rust.docs.kernel.org/macros/attr.vtable.html
>
>
> For other comments: Ack, thanks!
