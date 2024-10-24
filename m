Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC7016A92D
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Oct 2024 07:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729754609; cv=none; b=Ig2AJI1/BW98jwpHbuJaTsjSuIruYaMrp4ZIBmPJmVniPxbEK0ItA6Y+4QsuvDxvrGZpxxXr6Wwnbi2hfmYbHApR3qvi7qyh3ao0X94QxGAsar4rgNjyMAvX1zM/yhoSa0tm1SOMcAtffYRa/ZcElCOJQL5dfhShuly971YDkYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729754609; c=relaxed/simple;
	bh=NUf5vsCqWDPm0OIwNmgUWaqxky2gzOkGmBQ9DnUdAvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SjPKICSip46W1mHqpzf1fNb7J7VAvC+EpzCwvIMQNwvMF940pwNFeoRU3L5bypeT3QoiHT23I8pZ5Bmsjj+hgkYNGckx7PU3SuH0gMBNVRGXwh8ykrMpblY7T4ffqKmLUoHryIS9FwDfLT27O+cFQMT6/lS1PxVi1IJ1Rlzw/sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=09FsMYjg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="09FsMYjg"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d4c482844so383112f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Oct 2024 00:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729754604; x=1730359404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjQ3VSBcMbvoBOSbq+eLgFcX/NE3MbB3Xfds4RRtWEk=;
        b=09FsMYjgvgBsIEiWW/vtHBHh5TIUSbn8zPPhZyzihXqsn/ZyXzAi9PRewaF3lhjRht
         Tm/pwXi0GXND7HPnRDAI1y80IA5hke2b/8X7qhOy9SLfVDLRf6opMxKhmvNCTcPu2HE0
         TXavI+SiDIY2VomaHtzGiHcKZnmkLDmodcvmiSMe2jhL5Jci4KaKXB4Oa84BnBreLQR5
         JhlAraTeipn7YRJyqIB/8DKbDGtYeeSR478FFpdDUgP6z75D6H7rU/5+hUxLpO7yPpiN
         bkhoOfQ8psELbawczECUvPZiBQuSkvQ3ly+vkP+wWFvrhFESeiymZ6+RgwTslzitkIth
         DR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729754604; x=1730359404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjQ3VSBcMbvoBOSbq+eLgFcX/NE3MbB3Xfds4RRtWEk=;
        b=a407sSdeniBgFHX1MaHnFvVk1+q2IHGDjfeD/WDAsRTt/rZ5OAQ0yGbMCcP55JHJQQ
         QN4vXxGj1RGg7JJA5NcK4xsy92fF2g0nNj3xOnlcIujJkvRufNx9d4G0xwdph3Leiz5v
         GbeZh7BMR3qnZDQ4JolxkEAKYRYZFzEHBmS5xQPTVy8tkJM+r8PAZzAoaLmH5YS6jtvv
         oPCVTUyViCeURdRb1gS0x+UC4CuTbR0HSXvkka7dKh+Zp/EYmHnvdaBp257C39y7fl6V
         dsWfoOhLC0RFwQK7aUlvMHsozWGLbB5hW60MEG0wPYkxqpgzVArLspHixD6BlYjuNKPb
         6H3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnJPHAwdb311M6eDm1lXZeHaUdAjhSQN1tpsy7QlE6j+aQ/UjS3JONqi0ay5IrU8ESPefBgNFOSiIdrQWkLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmKHOcNjSu05pE0Ko8rfOspnO2ck/gyw7plpHu3MogJh89YQyk
	VH/up6PrvXgJ4W48s7B557iiP9dfPQiGV1nlm8JeNGv0mKgOe43yf1SREivNJlqMHLRXN9Vwovx
	JV1PcmE3aZMX5tKsQdyatZHI/Wad5DGEYzS1k
X-Google-Smtp-Source: AGHT+IFp0poCfIXUOQkUrqqum2pObWFIoUI99VN6TmYo9C67y3qDw5okBA7a2XjhtCZ3e1knqSnV+zbEnXoFxGZ2bgc=
X-Received: by 2002:a5d:69ce:0:b0:37d:51f8:46fd with SMTP id
 ffacd0b85a97d-38045868bf7mr757387f8f.22.1729754604487; Thu, 24 Oct 2024
 00:23:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022224832.1505432-1-abdiel.janulgue@gmail.com>
 <20241022224832.1505432-2-abdiel.janulgue@gmail.com> <CAH5fLgjZ91xFo4hV4dPnDXLFr9jX3na60tVt_KuNU_c6WhhzAA@mail.gmail.com>
 <b154dd13-8cd8-4066-ba3d-6597959ca5c5@gmail.com> <ZxkPC-dLRBqBKZ5J@Boquns-Mac-mini.local>
 <CAH5fLggEGMVspJoO6CE-gTa3-OHfkUnS=L1X-VNC8Cp57GYVkA@mail.gmail.com> <Zxk7Tf-jhSse51AS@Boquns-Mac-mini.local>
In-Reply-To: <Zxk7Tf-jhSse51AS@Boquns-Mac-mini.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 24 Oct 2024 09:23:11 +0200
Message-ID: <CAH5fLgh1zXRA1dHBEtiNxWW8kNMtO47bBnaFLVhpzgxsnS1ysw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] rust: types: add `Owned` type and `Ownable` trait
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, rust-for-linux@vger.kernel.org, 
	dakr@redhat.com, linux-kernel@vger.kernel.org, airlied@redhat.com, 
	miguel.ojeda.sandonis@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 8:07=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Wed, Oct 23, 2024 at 07:52:23PM +0200, Alice Ryhl wrote:
> [...]
> > > > > > +impl<T: Ownable> Owned<T> {
> > > > > > +    /// Creates a new smart pointer that owns `T`.
> > > > > > +    ///
> > > > > > +    /// # Safety
> > > > > > +    /// `ptr` needs to be a valid pointer, and it should be th=
e unique owner to the object,
> > > > > > +    /// in other words, no other entity should free the underl=
ying data.
> > > > > > +    pub unsafe fn to_owned(ptr: *mut T) -> Self {
> > > > >
> > > > > Please rename this function to from_raw to match the name used by
> > > > > other similar functions.
> > > > >
> > > > > Also, I don't love this wording. We don't really want to guarante=
e
> > > > > that it is unique. For example, pages have one primary owner, but
> > > > > there can be others who also have refcounts to the page, so it's =
not
> > > > > really unique. I think you just want to say that `ptr` must point=
 at a
> > >
> > > But then when `Owned<Page>` dropped, it will call __free_pages() whic=
h
> > > invalidate any other existing users. Do you assume that the users wil=
l
> > > use pointers anyway, so it's their unsafe responsiblity to guarantee
> > > that they don't use an invalid pointer?
> > >
> > > Also I assume you mean the others have refcounts to the page *before*=
 an
> > > `Owned<Page>` is created, right? Because if we really have a use case
> > > where we want to have multiple users of a page after `Owned<Page>`
> > > created, we should better provide a `Owned<Page>` to `ARef<Page>`
> > > function.
> >
> > The __free_pages function just decrements a refcount. If there are
> > other references to it, it's not actually freed.
> >
>
> Then why don't we use page_put() there? ;-) And instead of
> `Owned<Page>`, we can wrap the kernel::page as `ARef<Page>`, no?

I don't think there's a function called page_put?

Alice
